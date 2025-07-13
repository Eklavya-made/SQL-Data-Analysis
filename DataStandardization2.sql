SELECT DISTINCT industry
FROM world_layoffs.layoffs_staging2
ORDER BY industry;

-- crypto has multiple variats to it lets see into it

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry IN ('Crypto Currency', 'CryptoCurrency');

SELECT DISTINCT industry
FROM world_layoffs.layoffs_staging2
ORDER BY industry;

SELECT *
FROM world_layoffs.layoffs_staging2;

-- everything looks good except apparently we have some "United States" and some "United States." Let's standardize this.
SELECT DISTINCT country
FROM world_layoffs.layoffs_staging2
ORDER BY country;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country);

SELECT DISTINCT country
FROM world_layoffs.layoffs_staging2
ORDER BY country;

SELECT *
FROM world_layoffs.layoffs_staging2;

-- fixing the date column
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- changes its datatype
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;


SELECT *
FROM world_layoffs.layoffs_staging2;



