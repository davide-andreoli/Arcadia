# Arcadia

Arcadia is a frontend to the Libretro API, compatible with iOS and macOS.
The aim for this project is to make retro gaming available to everyone, so it is designed to be simple and accessible.
This means that, while I chose to implement the Libretro API, it will probably never support all Libretro Cores, or all Libretro functions.
It is an ongoing project.

## Architecture

The main pillar of Arcadia is the ArcadiaCoreProtocol, which is where I implemented all the Libretro API code, with a default implementation.
Each core then simply has to adopt the ArcadiaCoreProtocol and provide an implementation for the interface functions (such as retro_run, etc); all the other methods will be executed using the default implementation in ArcadiaCoreProtocol, which will call the core implementation of the interface functions.
This is a complicated way to say that adopting a new core is very simple, just get it to compile as a framework, adopt the ArcadiaCoreProtocol and you're good to go.

Inside ArcadiaCore module, you'll also find three other important components:

- ArcadiaCoreEmulationState: it is the class responsible of keeping track of the current emulation state, the current frame, coordinate the loading of save files, etc
- ArcadiaCoreAudioPlayer: it is the class responsible of playing audio
- ArcadiaCoreMetalRenderer: it is the class responsible of rendering the frames through a Metal pipeline

For more detailed information about how they work, refer to the ArcadiaCore repository.

## App

For specifics about the app, please refer to the ArcadiaApp repository.

## Building

Building the project is rather straightforward, just clone the repository and all its submodules, open Arcadia.xcworkspace and build.
To reproduce the build correctly, there are some small modifications that should be done to the files:

- Cores/ArcadiaAtari2600Core/ArcadiaAtari2600Core/stella2014-libretro/stella/src/emucore/Console.hxx: line 261 should be modified to be `float getFramerate() const { return 59.92; }`
- Cores/ArcadiaNeoGeoPocketCore/ArcadiaNeoGeoPocketCore/RACE/tlcs900h.c: all occurencies of the function `normal` should be modified to something else, like `normalRace`
- Cores/ArcadiaNeoGeoPocketCore/ArcadiaNeoGeoPocketCore/RACE/tlcs900h.c: all occurencies of the function `link` should be modified to something else, like `linkRace`

This changes are local and not reported in the repository, it is not an ideal situation I know, but I couldn't find a way to solve the compilation issues.

## Roadmap

### Planned cores

- [ ] Sega Dreamcast 
- [ ] Ardens
- [ ] Wonderswan
- [ ] Vectrex 
- [ ] Virtual boy
- [ ] N64
- [ ] Nintendo DS

### Planned features

- [ ] Handle cores with required files (BIOS) in a graceful way, to allow more advanced players to use them if the want (maybe an option, with check for required files MD5 hash)