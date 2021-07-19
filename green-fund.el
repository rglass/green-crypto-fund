(defun green-crypto-fund(invest-eur)
  (let* ((get-i (lambda (amount market-cap market)
		  (* amount (/ market-cap (float market)))))
	 (market-caps '(("ada"  . 32772019312)
			("dot"  . 10451908061)
			("sol"  .  6454451999)
			("atom" . 2196516250)
			("algo" . 2113841684)
			("xtz"  . 1826768917)))
	 (market-sum (apply '+
			    (mapcar (lambda (x)
				      (cdr x))
				    market-caps)))
	 (output (mapcar (lambda (x)
			   (format "%s %0.2f\n"
				   (car x)
				   (funcall get-i
					    invest-eur
					    (cdr x)
					    market-sum)))
			 market-caps)))
    (apply 'concat output)))
    
(green-crypto-fund 6000)
