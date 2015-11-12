! qinit routine for parabolic bowl problem, only single layer
subroutine qinit(meqn,mbc,mx,my,xlower,ylower,dx,dy,q,maux,aux)

    use geoclaw_module, only: grav

    implicit none

    ! Subroutine arguments
    integer, intent(in) :: meqn,mbc,mx,my,maux
    real(kind=8), intent(in) :: xlower,ylower,dx,dy
    real(kind=8), intent(inout) :: q(meqn,1-mbc:mx+mbc,1-mbc:my+mbc)
    real(kind=8), intent(inout) :: aux(maux,1-mbc:mx+mbc,1-mbc:my+mbc)

    ! Parameters for problem
    real(kind=8), parameter :: a = 1.d0
    real(kind=8), parameter :: sigma = 0.5d0
    real(kind=8), parameter :: h0 = 120.d0

    ! Other storage
    integer :: i,j
    real(kind=8) :: omega,x,y,eta

    eta = h0
    do i=1-mbc,mx+mbc
        x = xlower + (i - 0.5d0)*dx
        do j=1-mbc,my+mbc
           y = ylower + (j - 0.5d0) * dx
           IF (x .GT. 11689) THEN
              q(1,i,j) =  MAX(0.d0,eta - aux(1,i,j))
           ELSE
              q(1,i,j) = 0
           ENDIF
           q(2,i,j) = 0.d0
           q(3,i,j) = 0.d0
        enddo
    enddo

end subroutine qinit