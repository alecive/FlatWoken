FlatWoken
=========

Official *FlatWoken* icon theme source repository (alpha/beta/testing) releases.

The *FlatWoken* project is developed by **Alessandro Roncone** (aka *alecive*), and it is released under the CC BY-SA 4.0 License. It is is meant to be a complete set of icon themes for Linux **AND** Android. If you'd like to use and/or modify these icons for your own purposes, please consider the fact that the iconset is free to use *as long as* its use is **not** conveying any monetary income. If it does, we can arrange easily for a fair compensation. Regardless of the use, I'd like to know if and how my icons are used, and I'd like to receive some sort of credit for it! Nothing crazy, though: just a quick note on the bottom or your website with my email/website is sufficient :)

Contact informations:

- Google+    https://plus.google.com/+AlessandroRoncone
- e-mail     alecive87@gmail.com
- deviantART http://alecive.deviantart.com/
- AwOken/FlatWoken Google+ page https://plus.google.com/u/0/b/116957764483417291271/116957764483417291271/

For any icon request and/or bug, please use github.

Design Guidelines
----------

*FlatWoken* project is derived from the popular *AwOken* icon theme. It's freely inspired by its minimalist approach, even though it is basically a revision with an eye toward flat design. 

*FlatWoken* icons are currently divided in two different icon sets:

- *FlatWoken* is the main branch. It's supposed to enclose all the design ideas behind the project: flat, long-shadow icons enclosed in squared frames with rounded corners. The only choice diverging from the flat design guidelines is the shadow given to the squared frame: it is meant to make the icon stand out from any background in which it can be placed in.
- *FlatWokenMin* is a more minimal reinterpretation of its bigger brother. Basically, it follows a different approach for making the icons stand out from the background (no more shadows but a 3d-ish flat effect on the bottom and the right size) *plus* it reinterprets some icons in order to push on the minimalistic approach. Furthermore, the icon in itself is completely white, whereas the squared frame is supposed to enclose the main color(s) of the original icon. Currently I'm mainly focusing on the design of *FlatWoken* icon theme, but I update also once in a while.

#### Icon Guidelines - FlatWoken



Installation
----------

Firstly, a git installation should be up and running on your machine (and you should have at least some basic knowledge related to git). Secondly, remember that this method doesn't work for KDE (but it works for any GNOME/XFCE/LXDE installation) Then, follow these simple steps:

- Open a terminal window
- `cd` in your Download/Programming/Git folder
- type `git clone https://github.com/alecive/FlatWoken.git`
- `cd` into the `FlatWoken` folder just appeared
- `mv` the folders called `FlatWoken` and `FlatWokenMin` into your `~/.icons` directory (if this directory doesn't exist, simply create it).
- choose the iconset (either `FlatWoken` or `FlatWokenMin`) with your favourite theme-tweaker of choice (`gnome-tweak-tool`,`ubuntu-tweak`,`unity-tweak-tool` or even `dconf` or the `terminal` for the most nerdish out there)


Contribution
----------

*FlatWoken* project is at its early stages. A lot of icons are yet to be designed, and the project is open to external contributors as well as independent single submissions! I'm also open to icon requests.

*Github* is a great platform for collaboration. Therefore, the best way for me to handle external submissions (as well as for you :P ) is to use github's tools! So please remember to use them as much as you can. In the following: three typical ways to contribute to the project are highlighted.

#### Ask for an icon
If you think that a very important icon is missing, simply open an issue with the icon name and the request will be managed as soon as possible. An `.svg` file with the original icon would be of great help (and it would definitely speed up the process of designing the icon requested).

#### Submit an icon / a bunch of icons
If you're a designer on your own you can directly create your own icon, and ask for a submission on the official repo. The best way to do that is to fork the project, do your own icons and once you finish one or a bunch of them, ask for a pull request. I will review them and if everything is ok I'll add them to the main repo. Remember that I am a pixel-perfect maniac, so please carefully follow the *Icon Guidelines* chapter before asking for a pull request. You will save both mine and your time :)

#### Become a contributor
If you're skilled enough and you're into the project so much that I don't even need to validate your icons before submitting them, I will be pleased to directly add you as a contributor of the main project!
