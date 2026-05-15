"""
Job Search Agent - Searches for jobs on Indeed and LinkedIn
"""

import logging
import json
from typing import List
from datetime import datetime
from models.schemas import Job
from integrations.indeed_connector import IndeedConnector
from integrations.linkedin_connector import LinkedinConnector
from database.firebase_db import FirebaseDB

logger = logging.getLogger(__name__)

class JobSearchAgent:
    """Agent responsible for searching jobs on multiple portals"""
    
    def __init__(self):
        self.indeed = IndeedConnector()
        self.linkedin = LinkedinConnector()
        self.db = FirebaseDB()
        self.jobs_found: List[Job] = []
    
    def search_indeed(self, keywords: str, location: str) -> List[Job]:
        """Search jobs on Indeed"""
        logger.info(f"Searching Indeed for: {keywords} in {location}")
        try:
            jobs = self.indeed.search_jobs(keywords, location)
            logger.info(f"Found {len(jobs)} jobs on Indeed")
            return jobs
        except Exception as e:
            logger.error(f"Error searching Indeed: {e}")
            return []
    
    def search_linkedin(self, keywords: str, location: str) -> List[Job]:
        """Search jobs on LinkedIn"""
        logger.info(f"Searching LinkedIn for: {keywords} in {location}")
        try:
            jobs = self.linkedin.search_jobs(keywords, location)
            logger.info(f"Found {len(jobs)} jobs on LinkedIn")
            return jobs
        except Exception as e:
            logger.error(f"Error searching LinkedIn: {e}")
            return []
    
    def run(self, keywords: str, locations: str) -> List[Job]:
        """Run complete job search across all portals"""
        logger.info("=" * 50)
        logger.info("Starting Job Search Agent")
        logger.info("=" * 50)
        
        # Parse locations
        location_list = [loc.strip() for loc in locations.split(',')]
        keyword_list = [kw.strip() for kw in keywords.split(',')]
        
        all_jobs = []
        
        for keyword in keyword_list:
            for location in location_list:
                # Search Indeed
                indeed_jobs = self.search_indeed(keyword, location)
                all_jobs.extend(indeed_jobs)
                
                # Search LinkedIn
                linkedin_jobs = self.search_linkedin(keyword, location)
                all_jobs.extend(linkedin_jobs)
        
        # Remove duplicates based on job_id
        unique_jobs = {}
        for job in all_jobs:
            if job.job_id not in unique_jobs:
                unique_jobs[job.job_id] = job
        
        self.jobs_found = list(unique_jobs.values())
        
        logger.info(f"\nTotal unique jobs found: {len(self.jobs_found)}")
        
        # Save to database
        self.db.save_jobs(self.jobs_found)
        
        return self.jobs_found


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    
    from config.settings import settings
    
    agent = JobSearchAgent()
    jobs = agent.run(
        keywords=settings.job_search.keywords,
        locations=settings.job_search.locations
    )
    
    print(f"\n✓ Job search complete: {len(jobs)} jobs found")
