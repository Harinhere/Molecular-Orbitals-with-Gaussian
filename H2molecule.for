c read cube file for H2 molecular orbital 1-SGG
      implicit double precision(a-h,o-z)
      parameter(nxmax=50,nymax=50,nzmax=50)
      dimension orbital(nxmax,nymax,nzmax)
      open(unit=11,file='hydrogen1sgg.out')
      open(unit=14,file='h2.out')
c read the initial point:x0,y0,z0 of the grid
c iflag is the "fine" parameter of the grid
      read(11,*)iflag,x0,y0,z0
c read the number of points,incrmenets in each direction
c axes may or may not be orthogonal
      read(11,*)n1pts,x1step,y1step,z1step
      read(11,*)n2pts,x2step,y2step,z2step
      read(11,*)n3pts,x3step,y3step,z3step
c read the atomic number,charge and coordinates 
      read(11,*)natom1,a1charge,a1x,a1y,a1z
	  read(11,*)natom2,a2charge,a2x,a2y,a2z
c read two parameters,ip2=number of orbitals
      read(11,*)ip1,ip2
	  print*,n1pts,n2pts,n3pts,x0,y0,z0
c store the orbital in 3d array
      do 1 n1=1,n1pts
      do 1 n2=1,n2pts
      read(11,'(6e13.5)')(orbital(n1,n2,n3),n3=1,n3pts)
 1    continue
c plot the orbital value along z axis (x~0,y~0)
     
      do 4 n3=1,n3pts
	  z=z0+(n3-1)*z3step
	  write(14,120)z,orbital(n1pts/2,n2pts/2,n3)
 4    continue
 
 120  format(2e13.5)
      stop
      end