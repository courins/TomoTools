function str = create_Avizo_scalebar

str = ['set hideNewModules 0\n'...
'create HxScale "Scalebars"\n'...
'"Scalebars" fire\n'...
'"Scalebars" frame setValue 0 1\n'...
'"Scalebars" frame setValue 1 0\n'...
'"Scalebars" frame setValue 2 0\n'...
'"Scalebars" ticks setValue 0 0\n'...
'"Scalebars" ticks setValue 1 0\n'...
'"Scalebars" ticks setValue 2 0\n'...
'"Scalebars" subTicks setValue 0 0\n'...
'"Scalebars" subTicks setValue 1 0\n'...
'"Scalebars" sizeX setValue 0.15\n'...
'"Scalebars" Color setColor 0 0 0 0\n'...
'"Scalebars" lineWidth setValue 0 2\n'...
'"Scalebars" font setState name: "Arial Unicode MS" size: 16 buttonText: Select bold: 1 italic: 0 color: 0 0 0\n'...
'"Scalebars" fire\n'];



end