Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288BB1B0412;
	Tue, 31 Dec 2024 19:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735673513; cv=none; b=n5jtkt+0R7HlCdWysm3KZWaEVGBFe46SQ26gdsHHFZQeHkOg2lwrDcsCS2wsdt5Zw+kBHOY/JCkl092ThILSbFIX43iNo5PHHJImHGnWUMiCdnn8eebMPKO/+xpNBgA0uHwYrHMCZDyImLO5dAljYRsfPz16KRq5JLF7iPC3bPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735673513; c=relaxed/simple;
	bh=VIKNTuqrgQsLsiWY8+NvawidKQZ0Xzl66VgrpllIYXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lf2rOpJWeMhMZfz7Cm73Qz5JpMYRcHayBZkRHqykatGv2q/w76DDeVxaw8l097S4QHCod3QqPZeMPmlai/aqZk2hNANeimOZmVoZUbisTMEz1N2KN27jnSP5El5fs6YIk6tZfq0TuCb+SRsL4M0p102GBzXyic0U5fiZJKLpTrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=go9lYWDp; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="go9lYWDp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=3VY9/viYh//FltF6v35MgaYGMiuns5YCJUxUuSFE4sk=; b=go9lYWDpKHMMptYUyKMaC++7p8
	43rDtu6YvBuxsfGmkqhTIn3TUowS/wFkGKxDaIEHXcqI4VbomqAQ+fOagY5J2pZwAkHa2eYEwabZH
	ArHBcWGOclWh1unVN+pCEmLgJ2wE40EE2jtmqbyvuZbljpB93iMmLtfe9KT+PdA1RpK/qL/mQAAfK
	WbV1IpbwZGjEK0LhaXVaIzgPwJ0e3TCXiJfOP24sGi0yrxg5/iskdGX8OzBCEi0YG33iL/CvhtZgJ
	kfA0EKAsz3/GlqPM8SlRvZIXLeWP7NWwzd/vOiAZRhiuZWVKUQEJf9V3i4IS2mDscv5ygdzLr6V4l
	iju1IQNw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tShxs-00000008uVj-35J3;
	Tue, 31 Dec 2024 19:31:46 +0000
Message-ID: <9b125b71-ac8b-4a10-8073-318f9a8f24e4@infradead.org>
Date: Tue, 31 Dec 2024 11:31:36 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/kernel-parameters: Fix a reference to
 vga-softcursor.rst
To: Lubomir Rintel <lrintel@redhat.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>
References: <20241231190240.417446-1-lkundrak@v3.sk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241231190240.417446-1-lkundrak@v3.sk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/31/24 11:02 AM, Lubomir Rintel wrote:
> A very minor oversight that dates all the way back to rst migration in
> commit 9d85025b0418 ("docs-rst: create an user's manual book").
> 
> Fixes: 9d85025b0418 ("docs-rst: create an user's manual book")
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 3872bc6ec49d..da19728b5bee 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7474,7 +7474,7 @@
>  	vt.cur_default=	[VT] Default cursor shape.
>  			Format: 0xCCBBAA, where AA, BB, and CC are the same as
>  			the parameters of the <Esc>[?A;B;Cc escape sequence;
> -			see VGA-softcursor.txt. Default: 2 = underline.
> +			see vga-softcursor.rst. Default: 2 = underline.
>  
>  	vt.default_blu=	[VT]
>  			Format: <blue0>,<blue1>,<blue2>,...,<blue15>

-- 
~Randy
