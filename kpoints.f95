program test
    implicit none

    real , dimension(10000) :: kx , ky , kz , a ! dimension(N) N = Numbers of k-points
    integer :: i
    print*,"Programmed by   : M. J. Prakoso"
    print*,"Institution     : Universitas Indonesia"
    print*,"                  Department of Physics - Faculty of Mathematics and Natural Sciences"
    print*,"Research Group  : Theoretical & Computational Condensed Matter Physics"
    print*,"Copyright 2020 all rights reserved"
    print*,""

    open(1, file='kmesh.dat', action='read') ! Make sure to erase 'K_POINTS crystal' or anything of the sort from the first line AND Numbers of k-points from the second line
    open(2, file='kpoints(kx,ky).dat', action='write')
    open(3, file='kpoints(-kx,ky).dat', action='write')
    open(4, file='kpoints(kx,-ky).dat', action='write')
    open(5, file='kpoints(-kx,-ky).dat', action='write')


    do i = 1,10000 ! i = 1, N (Numbers of k-points)
        read(1,*) kx(i) , ky(i) , kz(i) , a(i)
        write(2,*) kx(i)*1 , ky(i)*1 , kz(i), a(i) ! kx, ky (No Translation)
        write(3,*) kx(i)*(-1) , ky(i)*(1) , kz(i), a(i) ! -kx, ky (Translation from kx to -kx)
        write(4,*) kx(i)*(1) , ky(i)*(-1) , kz(i), a(i) ! kx, -ky (Translation from ky to -ky)
        write(5,*) kx(i)*(-1) , ky(i)*(-1) , kz(i), a(i) ! -kx, ky (Translation to all k-points in the reduced Brilloun Zone)
    end do

end program
