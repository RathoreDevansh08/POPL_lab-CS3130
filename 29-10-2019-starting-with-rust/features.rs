fn main()
{

    /* This is a short program demonstrating some of the features of
     ** rust type system. There are some commented, syntactically valid
     ** lines that you can uncomment. These will lead to errors but those
     ** errors illustrate what has gone wrong.
     **
     **/


    /************** Mutability  ****************************************/

    let x = 10;       /* x is not mutable and hence you cannot change
                         its value.
                       */
    let mut y  = 100;  /* y is mutable can hence can change its value */
    println!("x = {0} and y = {1}",x,y);
    y = 42;

    // x = 42; // Uncomment and get an error

    println!("x = {0} and y = {1}",x,y);

    /************** End demo on Mutability ******************************/

    /*************** Ownership ******************************************/

    let xbox  = Box::new(10);
    println!("xbox = {0}", xbox);

    let ybox  = xbox; /* Ownership has transfered from xbox to ybox */

    // println!("xbox = {0}", xbox); // Uncomment and get an error

    println!("ybox = {0}", ybox);

    let zbox = &ybox; /* zbox borrows the resource form y */

    println!("ybox = {0} and zbox = {1}", ybox, zbox);
    
    /****************** practice ***************************************/
    // Commented part of below code throws errors.
    
    let x1 = 10 ;
    let y1 = x1 ;
    let z1 = x1 ;
    println!("y1 = {0}", y1);    
    println!("z1 = {0}", z1);


    let x2 = 10 ;
    let y2 = & x2 ;
    let z2 = & x2 ;
    println!("y2 = {0}", y2);    
    println!("z2 = {0}", z2);    


    let mut x3 = 10 ;
    let y3 = & x3 ;
    let z3 = &mut x3 ;
    //println!("y3 = {0}", y3);    
    println!("z3 = {0}", z3);

    
    let mut x4 = 10 ;
    let y4 = &mut x4 ;
    let z4 = & x4 ;
    //println!("y4 = {0}", y4);    
    println!("z4 = {0}", z4);


    let mut x5 = 10 ;
    let y5 = &mut x5 ;
    let z5 = &mut x5 ;
    //println!("y5 = {0}", y5);    
    println!("z5 = {0}", z5);


	/*********** changing variable without exactly changing it **********/
	
	let mut x6 = 50 ;               //won't work
	{
		let mut y6 = x6;
		y6 = 100;
	}
	println!("x6 = {0}", x6);  
	
	let mut x7 = 50 ;               //works & changes x7
	{
		let mut y7 = &mut x7;
		*y7 = 100;
	}
	println!("x7 = {0}", x7);  
}





