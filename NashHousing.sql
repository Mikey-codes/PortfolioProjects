--Import Data

CREATE TABLE NashvilleHousing (
    ID NUMERIC,
    ParcelID VARCHAR,
    LandUse VARCHAR,
    PropertyAddress VARCHAR,	
    SaleDate DATE,	
    SalePrice VARCHAR,
    LegalReference VARCHAR,	
    SoldAsVacant VARCHAR,	
    OwnerName VARCHAR,	
    OwnerAddress VARCHAR,	
    Acreage	NUMERIC,
    TaxDistrict VARCHAR,	
    LandValue NUMERIC,
    BuildingValue NUMERIC,
    TotalValue NUMERIC,
    YearBuilt NUMERIC,
    Bedrooms NUMERIC,
    FullBath NUMERIC,
    HalfBath NUMERIC
)

SELECT * FROM NashvilleHousing
--Standardize Sale Date Format
--Already Standardized
--SELECT saledate FROM Housing

--Populate Property Address data

SELECT * 
FROM NashvilleHousing
WHERE propertyaddress is NULL
ORDER BY parcelid

SELECT a.parcelid, a.propertyaddress, b.parcelid, b.propertyaddress, 
    COALESCE(a.propertyaddress,b.propertyaddress)
FROM NashvilleHousing a
JOIN NashvilleHousing b
    ON a.parcelid = b.parcelid
    AND a.id <> b.id
WHERE a.propertyaddress is NULL

--Removing nulls 
UPDATE NashvilleHousing AS a
SET propertyaddress = COALESCE(b.propertyaddress, a.propertyaddress)
FROM NashvilleHousing b 
WHERE a.parcelid = b.parcelid AND a.id <> b.id AND a.propertyaddress IS NULL;

-- Breaking Out Address into Individual Columns (Address, City, State)
SELECT propertyaddress
FROM NashvilleHousing

SELECT 
split_part(propertyaddress, ',', 1) AS Address,
split_part(propertyaddress, ',', 2) AS Address
FROM NashvilleHousing
 
ALTER TABLE NashvilleHousing
ADD PropertySplitAddress VARCHAR

UPDATE NashvilleHousing
SET PropertySplitAddress = split_part(propertyaddress, ',', 1)

ALTER TABLE NashvilleHousing
ADD PropertySplitCity VARCHAR

UPDATE NashvilleHousing
SET PropertySplitCity = split_part(propertyaddress, ',', 2)

SELECT 
    split_part(owneraddress, ',', 1) AS Address,
    split_part(owneraddress, ',', 2) AS Address,
    split_part(owneraddress, ',', 3) AS Address
FROM NashvilleHousing

ALTER TABLE NashvilleHousing
ADD OwnerSplitAddress VARCHAR

UPDATE NashvilleHousing
SET OwnerSplitAddress = split_part(owneraddress, ',', 1)

ALTER TABLE NashvilleHousing
ADD OwnerSplitCity VARCHAR

UPDATE NashvilleHousing
SET OwnerSplitCity = split_part(owneraddress, ',', 2)

ALTER TABLE NashvilleHousing
ADD OwnerSplitState VARCHAR

UPDATE NashvilleHousing
SET OwnerSplitState = split_part(owneraddress, ',', 3)

SELECT * FROM NashvilleHousing

Change Y and N to Yes and No in "Sold as Vacant" field

SELECT DISTINCT(soldasvacant), COUNT(soldasvacant)
FROM NashvilleHousing
GROUP BY soldasvacant
ORDER BY 2

SELECT soldasvacant,
CASE WHEN soldasvacant = 'Y' THEN 'Yes'
     WHEN soldasvacant = 'N' THEN 'No'
     ELSE soldasvacant
     END
FROM NashvilleHousing

UPDATE NashvilleHousing
SET soldasvacant = CASE WHEN soldasvacant = 'Y' THEN 'Yes'
     WHEN soldasvacant = 'N' THEN 'No'
     ELSE soldasvacant
     END

SELECT DISTINCT(soldasvacant), COUNT(soldasvacant)
FROM NashvilleHousing
GROUP BY soldasvacant
ORDER BY 2

--Remove Duplicates

WITH RowNumCTE AS (
SELECT *,
    ROW_NUMBER() OVER (
    PARTITION BY parcelid,
                 propertyaddress,
                 saleprice,
                 saledate,
                 legalreference
                 ORDER BY id
                ) AS row_num
FROM NashvilleHousing
)
SELECT * --DELETE
FROM RowNumCTE
WHERE Row_num > 1


--DELETE Unused Columns
SELECT * FROM NashvilleHousing

ALTER TABLE NashvilleHousing
DROP COLUMN propertyAddress, taxDistrict, ownerAddress

