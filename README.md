
## Running the InVEST Nutrient Delivery Ratio (NDR) model 

### Presetup

 * create `invest` virtual environment (`make ENV=invest env`)
 * clone the env from the local directory to the default location (`conda create --clone invest/bin -n invest`)
 * activate env (`source activate invest`)
 * verify that the correct environment is loaded (`conda env list`)

### Setup 

 * install natcap.invest (`make install`)
 * pull sample data (`make sampledata`)
 * move folder from base to `data` folder in local workspace/folder

### Usage

See `scripts/02_model.R`

### Links

http://releases.naturalcapitalproject.org/invest-userguide/latest/ndr.html
