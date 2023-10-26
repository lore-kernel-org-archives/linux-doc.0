Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CA01BDC7
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 17:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="FV9B7I4Z"
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B39FC1;
	Thu, 26 Oct 2023 10:35:49 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2BD43735;
	Thu, 26 Oct 2023 17:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2BD43735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1698341749; bh=88tT+BSRKu9apz5iLOkI7cLfj6OUX7X+73QCF9M4/1g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FV9B7I4Z9w1LmrS6SpdN4Bf5vdgnYaII7isGI5tGdxoITKvTFd92durYJmC9J5Nyn
	 e5JNYjBkHOWUCoSnicccdsju0hC+Y/8hXKEoiWgj/JKCF9cwXw0PfZFtMV17n21+Vw
	 OzMd7PY05H9Ej1pHHplFQDf8ZVSQ9UTekNd7CHWsad2VdyVGlEIc//aMcF4Bc2+1IU
	 C18Waa85fBwxjm7TAyL3MZ0ahJyYxEGYBT8kkOGKOqQjivvxnd2Chd8koB485UAfZu
	 pphQy6guOeML6geJqvUo+Y4YYUzMpyUwLgxLyJ1m9ibomW5YJOOjTf0IeI2vlT2dzH
	 R7NuF5HO92YiA==
From: Jonathan Corbet <corbet@lwn.net>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] speakup: Document USB support
In-Reply-To: <20231020181059.7rtj2csi7t6vorrm@begin>
References: <20231020181059.7rtj2csi7t6vorrm@begin>
Date: Thu, 26 Oct 2023 11:35:48 -0600
Message-ID: <87fs1x70cr.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Samuel Thibault <samuel.thibault@ens-lyon.org> writes:

> Speakup has been supporting USB for a while already.
>
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
>
> diff --git a/Documentation/admin-guide/spkguide.txt b/Documentation/admin-guide/spkguide.txt
> index 74ea7f391942..0d5965138f8f 100644
> --- a/Documentation/admin-guide/spkguide.txt
> +++ b/Documentation/admin-guide/spkguide.txt
> @@ -7,7 +7,7 @@ Last modified on Mon Sep 27 14:26:31 2010
>  Document version 1.3
>  
>  Copyright (c) 2005  Gene Collins
> -Copyright (c) 2008  Samuel Thibault
> +Copyright (c) 2008, 2023  Samuel Thibault
>  Copyright (c) 2009, 2010  the Speakup Team
>  
>  Permission is granted to copy, distribute and/or modify this document
> @@ -83,8 +83,7 @@ spkout -- Speak Out
>  txprt -- Transport
>  dummy -- Plain text terminal
>  
> -Note: Speakup does * NOT * support usb connections!  Speakup also does *
> -NOT * support the internal Tripletalk!
> +Note: Speakup does * NOT * support the internal Tripletalk!
>  
>  Speakup does support two other synthesizers, but because they work in
>  conjunction with other software, they must be loaded as modules after
> @@ -94,6 +93,12 @@ These are as follows:
>  decpc -- DecTalk PC (not available at boot up)
>  soft -- One of several software synthesizers (not available at boot up)
>  
> +By default speakup looks for the synthesizer on the ttyS0 serial port. This can
> +be changed with the device parameter of the modules, for instance for
> +DoubleTalk LT:
> +
> +speakup_ltlk.dev=ttyUSB0
> +

I've applied this.

We *still* really need to fix the license for this document, though...

Thanks,

jon
