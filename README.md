# ZetaHunter #

## Wiki ##

Check the [Wiki](https://github.com/mooreryan/ZetaHunter/wiki) for
more info!

## Overview ##

ZetaHunter is a command line script designed to assign user-supplied
small subunit ribosomal RNA (SSU rRNA) gene sequences to OTUs defined
by a reference sequence database.

By default, ZetaHunter uses a curated database of full-length,
non-chimeric, Zetaproteobacteria SSU rRNA gene sequences derived from
arb SILVA (release 123) and Zetaproteobacteria genomes from JGI's
Integrated Microbial Genomes (IMG). OTU definitions are the same as
those suggested by McAllister et al. (2011) at 97% identity, with
novel OTUs discovered since that publication named ZetaOTU29 and
higher (curated OTUs only). Infiles aligned by the arb SILVA SINA web
aligner are masked using the same 1282 bp mask used in McAllister et
al. (2011) to obtain reproducible OTU calls through closed reference
OTU binning. User sequences that represent novel Zetaproteobacteria
OTUs are de novo binned into NewZetaOTUs, numbered by abundance.

ZetaHunter also supports user-provided curated OTU databases for
sequence OTU binning of any SINA-aligned SSU rRNA sequences.

## Features ##

1. Stable SSU rRNA gene OTU binning to a curated database
2. Supports import of multiple files for easy comparison of NewZetaOTUs across samples
3. Database and mask management options
4. Multi-threaded processing
5. Chimera checking
6. Flags for sequences not related to the curated database (i.e. not Zetaproteobacteria)

## Running ZetaHunter with Docker ##

If you don't have Docker, follow the instructions to install it here:
[Mac](https://docs.docker.com/mac/),
[Linux](https://docs.docker.com/linux/),
[Windows](https://docs.docker.com/windows/).

*Note*: If you have Windows, running `ZetaHunter` with Docker is the
 only supported option.

### Mac ###

After installing Docker, opne the Launchpad and click the `Docker
Quickstart Terminal` icon.

In the terminal window that opens, enter the following command

    $ docker pull mooreryan/zetahunter

to download the latest `ZetaHunter` Docker image to your computer.

*Note*: If you already have the `ZetaHunter` Docker image, this is
 only necessary to ensure you have the latest version of `ZetaHunter`.

Download
[this](https://raw.githubusercontent.com/mooreryan/ZetaHunter/master/bin/run_zeta_hunter)
perl script, and change the permissions to executable.

    $ \curl "https://raw.githubusercontent.com/mooreryan/ZetaHunter/master/bin/run_zeta_hunter" > ~/Downloads/run_zeta_hunter
    $ chmod 755 ~/Downloads/run_zeta_hunter

Move `run_zeta_hunter` to somewhere on your path.

    $ sudo mv ~/Downloads/run_zeta_hunter /usr/local/bin

Try it out!

    $ which run_zeta_hunter

should spit out

    /usr/local/bin/run_zeta_hunter

    $ run_zeta_hunter -h

will display the help banner.

## Installing ##

See `INSTALL.md`.

## Zetaproteobacteria database curation ##

Please cite

    McAllister, S. M., R. E. Davis, J. M. McBeth, B. M. Tebo, D. Emerson, and C. L. Moyer. 2011. Biodiversity and emerging biogeography of the neutrophilic iron-oxidizing Zetaproteobacteria. Appl. Environ. Microbiol. 77:5445–5457. doi:10.1128/AEM.00533-11

## Dependencies ##

### External programs ###

`ZetaHunter` uses lots of other software internally. Please cite the
following.

#### Arb SILVA ####

[Arb SILVA](https://www.arb-silva.de)

Please cite

    Quast, C., E. Pruesse, P. Yilmaz, J. Gerken, T. Schweer, P. Yarza, J. Peplies, and F. O. Glöckner. 2013. The SILVA ribosomal RNA gene database project: improved data processing and web-based tools. Nucl. Acids Res. 41(D1): D590-D596.

#### SINA Web-Aligner ####

[SINA](https://www.arb-silva.de/aligner/)

Please cite

    Pruesse, E., J. Peplies, and F. O. Glöckner. 2012. SINA: accurate high-throughput multiple sequence alignment of ribosomal RNA genes. Bioinformatics 28:1823–1829.

#### Mothur ####

[Mothur](http://mothur.org/)

Please cite

    Schloss, P.D., et al., Introducing mothur: Open-source, platform-independent, community-supported software for describing and comparing microbial communities. Appl Environ Microbiol, 2009. 75(23):7537-41.

#### SortMeRNA ####

[SortMeRNA](http://bioinfo.lifl.fr/RNA/sortmerna/)

Please cite

    Kopylova E., Noé L. and Touzet H., "SortMeRNA: Fast and accurate filtering of ribosomal RNAs in metatranscriptomic data", Bioinformatics (2012), doi: 10.1093/bioinformatics/bts611.

#### UCHIME ####

[UCHIME](http://drive5.com/usearch/manual/uchime_algo.html)

Please cite

    Edgar, R. C., B. J. Haas, J. C. Clemente, C. Quince, and R. Knight. 2011. UCHIME improves sensitivity and speed of chimera detection. Bioinformatics, doi: 10.1093/bioinformatics/btr381

### Gems ###

See `Gemfile`

## Assets ##

`silva.gold.align.gz` is from
http://www.mothur.org/wiki/Silva_reference_files

**NOTE**: This file will be temporarily unzipped (requires 247mb of
  hard drive space) if chimera checking is turned on.

### OTU Metadata ###

Lines beginning with `#` are considered comments.

## Other info ##

### Gap positions ###

`base.match /[^ACTGUN]/i`

### Sequence headers ###

The headers are split on " " characters and the first part of that is
taken to be the sequence ID and must be unique.

### Entropy ###

The entropy file needs to be rebuilt each time `db_seqs.fa` is
updated.

## Versions ##

- 0.0.7: Add threading to sortmerna
- 0.0.8: Update `run_zeta_hunter` script
- 0.0.9: Add command line args to log
