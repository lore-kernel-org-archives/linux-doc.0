Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37138262811
	for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739893200; cv=none; b=KctnjZvpDgXflMolT/v1P+Xhz+r/5eqmrb/OwubWVkrMJGZ4CnSGAV0xDtkB/8Ok1w0fTOwv94yUj+bc09lqfcdLKwFK3qdjyh0VJHOI05mJINunbxlIst7PatbCupmnZJyjzr0BNiLNJiQypw59GPcWVd9rNGoq55MBV8gMTi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739893200; c=relaxed/simple;
	bh=lAxTRNetQLzqmYxMz17HeFSoRAP9iQc3reaXePWjpro=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fc+xIPcLlUfIXZLaDUo+ym6h9QpHKoR7OU+EXJEEATQwmY3oCRupD9MEdu3IerLzre7jfukRbQpNs7+em1wm5H30lpH0RBb1cSQHGDkrfQ3mNk912cvVIGwTt4dklgiBLmrvqnjoGTIGe4Ua9odvCDHahv7GApXwPZWrSh1qJjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=U8SdoOZk; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="U8SdoOZk"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 38D5648EB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739893198; bh=uT0m66D3YRgH72G4LuMXmkItG3ZmunqWDViuqUjB+fA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U8SdoOZkHneWXW5HYKL5GYLQWwgcCgNhmR/G0aR+IGAMoUjLKqQpD8Nv4+gHHv0UH
	 NLxuKsxHRj04nhZVNeeXl+j+LL9S87yW7c5wCC/LDI2oFhtIxgfwIrD7OhSM4hozp+
	 F75+mSS91ZLG11qLJSciCCGS2Z91SynUeIxj64njGaiw2u7EUBWlnYINxwdFNB1Kn2
	 9NbvuNbUQ3Z9SW5etrDDJVBMqAdZ/j7vxIQ6PYefCiQzOpgWl8aKOYPsoJZNc5Lwl4
	 +qfOc/9oGfGAg3VEDxrqkVRroXGc4vZ24Py6h8NE4M093EuTr+Kxm0+F9NUkaKUNMN
	 ncY0YylTMmB0A==
Received: from localhost (unknown [IPv6:2601:280:4600:2d7f::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 38D5648EB5;
	Tue, 18 Feb 2025 15:39:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shankari02 <shankari.ak0208@gmail.com>, linux-doc@vger.kernel.org
Cc: Shankari02 <shankari.ak0208@gmail.com>
Subject: Re: [PATCH] doc: Fix grammatical errors and highlight code funcs
In-Reply-To: <20250218063929.5110-1-shankari.ak0208@gmail.com>
References: <20250218063929.5110-1-shankari.ak0208@gmail.com>
Date: Tue, 18 Feb 2025 08:39:57 -0700
Message-ID: <87pljfqn1u.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Shankari02 <shankari.ak0208@gmail.com> writes:

> This patch improves few sentences by correcting their grammatical formation. Some code functions have been highlighted for better readability.

Please wrap your text to less than 80 columns

Some maintainers react strongly to the "this patch" phrasing; better to
use the imperative tense as described in
Documentation/process/submitting-patches.rst. 

> Signed-off-by: Shankari <shankari.ak0208@gmail.com>

Please include your full name in the signoff

> ---
>  Documentation/driver-api/fpga/fpga-mgr.rst | 26 +++++++++++-----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/driver-api/fpga/fpga-mgr.rst b/Documentation/driver-api/fpga/fpga-mgr.rst
> index 8d2b79f696c1..a53775399bbd 100644
> --- a/Documentation/driver-api/fpga/fpga-mgr.rst
> +++ b/Documentation/driver-api/fpga/fpga-mgr.rst
> @@ -76,7 +76,7 @@ parameter syntax is the same, but the call to ``fpga_mgr_unregister()`` should b
>  removed. In the above example, the ``socfpga_fpga_remove()`` function would not be
>  required.
>  
> -The ops will implement whatever device specific register writes are needed to
> +The ops will implement whatever device-specific register writes are needed to
>  do the programming sequence for this particular FPGA.  These ops return 0 for
>  success or negative error codes otherwise.
>  
> @@ -86,34 +86,34 @@ The programming sequence is::
>   3. .write or .write_sg (may be called once or multiple times)
>   4. .write_complete
>  
> -The .parse_header function will set header_size and data_size to
> +The **.parse_header** function will set header_size and data_size to

All of this extra markup does not help, I would not do that.  Functions
are generally marked using the function() convention instead.

>  struct fpga_image_info. Before parse_header call, header_size is initialized
>  with initial_header_size. If flag skip_header of fpga_manager_ops is true,
>  .write function will get image buffer starting at header_size offset from the
>  beginning. If data_size is set, .write function will get data_size bytes of
> -the image buffer, otherwise .write will get data up to the end of image buffer.
> -This will not affect .write_sg, .write_sg will still get whole image in
> -sg_table form. If FPGA image is already mapped as a single contiguous buffer,
> +the image buffer; otherwise .write will get data up to the end of image buffer.
> +This will not affect .write_sg, .write_sg will still get the whole image in
> +sg_table form. If FPGA image is already mapped as a single contiguous buffer, the
>  whole buffer will be passed into .parse_header. If image is in scatter-gather
>  form, core code will buffer up at least .initial_header_size before the first
> -call of .parse_header, if it is not enough, .parse_header should set desired
> -size into info->header_size and return -EAGAIN, then it will be called again
> +call of .parse_header, if it is not enough, .parse_header should set the desired
> +size into info->header_size and return ``-EAGAIN``, then it will be called again
>  with greater part of image buffer on the input.
>  
> -The .write_init function will prepare the FPGA to receive the image data. The
> +The **.write_init** function will prepare the FPGA to receive the image data. The
>  buffer passed into .write_init will be at least info->header_size bytes long;
>  if the whole bitstream is not immediately available then the core code will
>  buffer up at least this much before starting.
>  
> -The .write function writes a buffer to the FPGA. The buffer may be contain the
> +The **.write** function writes a buffer to the FPGA. The buffer may contain the
>  whole FPGA image or may be a smaller chunk of an FPGA image.  In the latter
>  case, this function is called multiple times for successive chunks. This interface
>  is suitable for drivers which use PIO.
>  
> -The .write_sg version behaves the same as .write except the input is a sg_table
> -scatter list. This interface is suitable for drivers which use DMA.
> +The **.write_sg** version behaves the same as .write except the input is a sg_table
> +scatter list. This interface is suitable for drivers that use DMA.
>  
> -The .write_complete function is called after all the image has been written
> +The **.write_complete** function is called after all the image has been written
>  to put the FPGA into operating mode.
>  
>  The ops include a .state function which will determine the state the FPGA is in
> @@ -126,7 +126,7 @@ API for implementing a new FPGA Manager driver
>  * ``fpga_mgr_states`` -  Values for :c:expr:`fpga_manager->state`.
>  * struct fpga_manager -  the FPGA manager struct
>  * struct fpga_manager_ops -  Low level FPGA manager driver ops
> -* struct fpga_manager_info -  Parameter structure for fpga_mgr_register_full()
> +* struct fpga_manager_info -  Parameter structure for ``fpga_mgr_register_full()``

This extra markup will actively defeat the automatic markup we already have.

>  * __fpga_mgr_register_full() -  Create and register an FPGA manager using the
>    fpga_mgr_info structure to provide the full flexibility of options
>  * __fpga_mgr_register() -  Create and register an FPGA manager using standard
> -- 
> 2.34.1

Thanks,

jon
