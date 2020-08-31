
## Running the InVEST Nutrient Delivery Ratio (NDR) model 

### Presetup

 * git pull main invest repo to parent folder
 * create `invest` virtual environment (`make env`)
 * activate env (`source activate env`)
 * verify that the correct environment is loaded (`conda env list`)
 * Install package (or upgrade) from local source (`make install`)

### Setup 

 * pull sample data (`cd ../invest && make sampledata`)
 * move folder from base to `data` folder in local workspace/folder

### Usage

`Rscript scripts/02_model.R`

### Debugging

Insert `breakpoint()` lines

### Links

http://releases.naturalcapitalproject.org/invest-userguide/latest/ndr.html
