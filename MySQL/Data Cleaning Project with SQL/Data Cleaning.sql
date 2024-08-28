-- Data Cleaning
select *
from layoffs;

-- 1. Remove Duplicates

CREATE TABLE layoffs_staging		-- Creating a similar but empty table
LIKE layoffs;

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging  	-- Inserting the values from layoffs into layoffs_staging
SELECT *
FROM layoffs;


-- Checking for duplicates

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

 #creating a CTE so we can filter to check where row_num > 1
 WITH duplicate_cte AS
 (
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
 )
SELECT *
FROM duplicate_cte
where row_num > 1;

#Check to confirm the result from the CTE
SELECT *
FROM layoffs_staging
WHERE company = 'Yahoo';


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

DELETE
FROM layoffs_staging2
WHERE row_num > 1;