import macros_cg;

real 

unitX=1, 	// unité en X
minX=-1,
maxX=5,

cmX=1.5,		// nombre de cm d'une unité en X
origX=0, 	// origine des graduations en X

unitY=1,	 // unité en Y
minY=-2,
maxY=4,

cmY=1.5,	// nombre de cm d'une unité en Y
origY=0; 	// origine des graduations en Y

bool grillePrincipale=true;
		pen penGrillePrincipale=black+0.4bp;

bool grilleSecondaire=true;
		int nbDivisionsGrilleSecondaireX=10;
		int nbDivisionsGrilleSecondaireY=10;
		pen penGrilleSecondaire=gray+0.2bp;

bool ticks=true;
		real tailleTicks=1/15;
		pen penTicks=black+0.7bp;

bool graduationOrigine=true;
bool graduationTotale=true;
bool graduationPartielle=false;
		real taillePolice=8;


pen penAxes=black+1bp;

bool encadrementFinal=true;
		pen penEncadrementFinal=black+1bp;


// DÉBUT DU TRACÉ *************************************
unitsize(cmX*cm/unitX,cmY*cm/unitY);

// GRILLE SECONDAIRE -----------------------------
if (grilleSecondaire) {
for(real k=origX;k<maxX;k+=unitX/nbDivisionsGrilleSecondaireX){
if (k!=origX) {//
draw((k,minY)--(k,maxY),penGrilleSecondaire);
}
}
for(real k=origX;k>minX;k-=unitX/nbDivisionsGrilleSecondaireX){
if (k!=origX) {//
draw((k,minY)--(k,maxY),penGrilleSecondaire);
}
}

for(real k=origY;k<maxY;k+=unitY/nbDivisionsGrilleSecondaireY){
if (k!=origY) {//
draw((minX,k)--(maxX,k),penGrilleSecondaire);
}
}
for(real k=origY;k>minY;k-=unitY/nbDivisionsGrilleSecondaireY){
if (k!=origY) {//
draw((minX,k)--(maxX,k),penGrilleSecondaire);
}
}
}


// GRILLE PRINCIPALE -----------------------------
if (grillePrincipale) {
for(real k=origX;k<maxX;k+=unitX){
if (k!=origX) {//
draw((k,minY)--(k,maxY),penGrillePrincipale);
}
}
for(real k=origX;k>minX;k-=unitX){
if (k!=origX) {//
draw((k,minY)--(k,maxY),penGrillePrincipale);
}
}

for(real k=origY;k<maxY;k+=unitY){
if (k!=origY) {//
draw((minX,k)--(maxX,k),penGrillePrincipale);
}
}
for(real k=origY;k>minY;k-=unitY){
if (k!=origY) {//
draw((minX,k)--(maxX,k),penGrillePrincipale);
}
}
}

// AXES --------------------------------
draw((origX,minY)--(origX,maxY),penAxes,Arrow(HookHead,2.5bp));
draw((minX,origY)--(maxX,origY),penAxes,Arrow(HookHead,2.5bp));

// TICKS (traits de graduation)--------------
if (ticks){
for(real k=origX;k<maxX;k+=unitX){
if (k!=origX) {//
draw((k,origY-tailleTicks*unitY)--(k,origY+tailleTicks*unitY),penTicks);
}
}
for(real k=origX;k>minX;k-=unitX){
if (k!=origX){//
draw((k,origY-tailleTicks*unitY)--(k,origY+tailleTicks*unitY),penTicks);
}
}
for(real k=origY;k<maxY;k+=unitY){
if (k!=origY) {//
draw((origX-tailleTicks*unitX,k)--(origX+tailleTicks*unitX,k),penTicks);
}
}
for(real k=origY;k>minY;k-=unitY){
if (k!=origY){//
draw((origX-tailleTicks*unitX,k)--(origX+tailleTicks*unitX,k),penTicks);
}
}
}


// GRADUATION DE L'ORIGINE --------------------------------
if (graduationOrigine){
// label origine
if ((origX!=0)||(origY!=0)) {
// label origineX
label(format("$%f$",origX),(origX,origY),SE,fontsize(taillePolice*1pt),Fill(white));

// label origineY
label(format("$%f$",origY),(origX,origY),NW,fontsize(taillePolice*1pt),Fill(white));
}
else
{
label("0",(0,0),2.5SW,fontsize(taillePolice*1pt),Fill(white));
}
}

// GRADUATIONS TOTALES -------------------------------
if (graduationTotale) {
for(real k=origX;k<maxX;k+=unitX){
if (k!=origX) {//
label(format("$%f$",k),(k,origY),2S,fontsize(taillePolice*1pt),Fill(white));
}
}
for(real k=origX;k>minX;k-=unitX){
if (k!=origX) {//
label(format("$%f$",k),(k,origY),2S,fontsize(taillePolice*1pt),Fill(white));
}
}

for(real k=origY;k<maxY;k+=unitY){
if (k!=origY) {//
label(format("$%f$",k),(origX,k),2W,fontsize(taillePolice*1pt),Fill(white));
}
}
for(real k=origY;k>minY;k-=unitY){
if (k!=origY) {//
label(format("$%f$",k),(origX,k),2W,fontsize(taillePolice*1pt),Fill(white));
}
}
}

// GRADUATIONS PARTIELLES -----------------------------
if (graduationPartielle) {
label(format("$%f$",origX+unitX),(origX+unitX,origY),2S,fontsize(taillePolice*1pt),Fill(white));
label(format("$%f$",origY+unitY),(origX,origY+unitY),2W,fontsize(taillePolice*1pt),Fill(white));
}


// TRACÉS DE FONCTIONS ***********************************



real f(real x) {return x*log(x)-x+1;}
path Cf=graph(f,0.01,maxX,n=100);
draw(Cf,linewidth(1bp)+blue);


real g(real x) {return x-exp(1)+1;}
path Cg=graph(g,minX,maxX,n=100);
draw(Cg,linewidth(1bp)+red);
////label("$\mathcal{C}_f$",(40,2200),fontsize(8pt)+blue);
////label("$f(x)=30x+1200$",(30,2800),fontsize(8pt)+blue);








// EMPAQUETAGE FINAL --------------------------------------
if (encadrementFinal){
draw((minX,minY)--(minX,maxY)--(maxX,maxY)--(maxX,minY)--cycle,penEncadrementFinal);
}
ylimits(minY,maxY,Crop);
xlimits(minX,maxX,Crop);
shipout(bbox(1mm,white));
