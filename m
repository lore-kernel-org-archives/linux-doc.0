Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B7039732C
	for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 15:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781969031; cv=none; b=DJvUnbxpg7Y/kQb1pVWks3pcVbthgQTxH06NPkC2Rcda6jQLZhc6enX1z38eHmHvoQC/J0QiNdr5AMrBxNzeYCvIrsdhPnbAR3/vTP9phQ8e6zQdhYOCocn7QfwnF73Gacxlev8dnSnEzDoY8RZJUPBV7T3W9xe39VtpQAkYVt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781969031; c=relaxed/simple;
	bh=eQk7gPWtR24Z1gEmkeibv0S6+uzoMHk8/kA5ItWCvyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0j35vjHHHBsf7uk23/kd5mg3twj1SOIOxn0fnPfyAnKsWcqlQDNe6/u/7VlYqtEoWvuF6nlsGUw2aS3qR6qU8sdElYBdkE9zUP10HPxvJZz0t0wnoHPqbbgadSqiXxt7wXq6IZUK5Nxz5NSnPJYRknZP3vNdhOt+yX9b1QPb0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=cmkHbV6p; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="cmkHbV6p"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-48611addcfbso1069160b6e.1
        for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1781969029; x=1782573829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfozMZ4MckZ6z82xnad27KmIs/kPPZXqPb4RdkxOOME=;
        b=cmkHbV6pXklz+mZbZQj60Srvb0WQyHL+aAMo2PhK6jz4teesuH34xEFTOGKLLZHxZF
         2X4fly8hkR2GLqx823oDjR8DvlO1p+OIEb0U9539yWjjxqOhz80PuCLy77CWrUbRO/lF
         hTqXJaIham7ZxQLy6NK51Wggksq3kR0rCGzNPPvztUTcU0M8DSiNyiAQrUBd+YuGdwH/
         5BM+TwtaFK8XE77vug1n4NC4Xj2gYMsi5jLhRiM6RpFkKdoslujZ/ebs/jUzVaQRbVml
         tV2TXSyzFrLnSA5/g1WKB5/Y52WuVzqFMMvN+I+zW9KzOsUaVe4jswcAwetVAVKrWNFg
         0lVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781969029; x=1782573829;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QfozMZ4MckZ6z82xnad27KmIs/kPPZXqPb4RdkxOOME=;
        b=dJF4hWX03va5z62Q45pwDfDSQ3fGWA++jad0AppR9Y5ThMsTi5IjT5/oyhHeNrRjdz
         MhG/UEIWyBCtEptfvZbe1e5lh8GCcgjHzZ1nx/l7I6Cw7J/xZTMzd2Oe2FA9FuIlKyHs
         oGhIdM/xE6uVMp8isqM3sFjmsOM6yG6fHH1kNsE/pKtSHYAEFzbEFqkVWxjDFcP09y8D
         LWsN+/4d2Pwcs66d3t/Qsjr1aXx0d22XRb3fMt2cOxCbWVYuh6nBNBF19akJhEQpDfv7
         ZWgNfsdAQ5fd1liH8Vso7IyFiD6Up9Y8L9wKX0Vwde4MdNizDfydzOQ5kuyzxeDO5Rcj
         Evgw==
X-Forwarded-Encrypted: i=1; AFNElJ8qrMa5FOD0lHYD8AwTR5Ts8jzZ74BnDWzp1HnYk4Gq7dfmSI1s/ZxMdhOJtIpeS1QtOEo1dngEkM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM1beuBcDgEarQkz6MiWbfN71iCfhWExS11hPVrg1k7BE0g1fv
	m+0iDNmCEvQDUg/1CZQ4U9CT4Q+DNZ7iZOFsOJZnaCWIg/YDTfm7N+FzbM7XXE7EzquNyykhKNJ
	2uMTQ
X-Gm-Gg: AfdE7clmVJ3IvFln8LR9cXhNFg6eNmagEKYp0rbRq+xzTELZrZ/1XTjJbufMLNufQzY
	uJLYMcHnXWThMkTS32uDQKjNU4hO7H0iULW+UYLyG9b+C33McpBgAS0+e1KUSegt+dDO8Do8mmh
	ZPmEOMMTSaeO7Lh2cnbHI29J58v9HklOKSDD4BDAmFVJ8Yz2629dGxvUvvc6py07NRi6H9RDb6/
	OfrNdQrvkCpXrfazrKbxyRwodgPdnb9zm9berJwMehLG0TWpdVhKAZIuK2WXiT9wRJeUu6Jdqtf
	d1jjISS6TX9CHXXS2bg+nL24sRCZIExlP5yaBECgkgoUvbkBp0sTW5qe74eOuJNDtiXifkkGIyV
	4zTf7qsuq6INP3sSNg9VO95G5ghpOq1A+Vl1exaxmtgM09MntVPWbGcw0T6JyniHXfFYF1Oe8Yj
	kekYwgJi6sujLfTYyfq3NXWl2EDgIp/m19kc7cAjxoYthcZsfwVTdFnPMCsWczlcgMnxz+EOv+O
	7TXJw==
X-Received: by 2002:a05:6808:3508:b0:48a:b4ad:9dc4 with SMTP id 5614622812f47-48ab4adb250mr3459662b6e.10.1781969028772;
        Sat, 20 Jun 2026 08:23:48 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:c99d:af19:3e7e:706c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48ae8b3b1efsm1392657b6e.0.2026.06.20.08.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 08:23:46 -0700 (PDT)
Date: Sat, 20 Jun 2026 10:23:42 -0500
From: Corey Minyard <corey@minyard.net>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: openipmi-developer@lists.sourceforge.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] docs: ipmi: Fix path of the "hotmod" module parameter
Message-ID: <ajawfhU5nCR93DL_@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20260620122747.7902-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260620122747.7902-1-zenghui.yu@linux.dev>

On Sat, Jun 20, 2026 at 08:27:47PM +0800, Zenghui Yu wrote:
> The correct path of the "hotmod" module parameter should be
> /sys/module/ipmi_si/parameters/hotmod. Fix it.

Thanks, it's in my queue.

-corey

> 
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---
>  Documentation/driver-api/ipmi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/ipmi.rst b/Documentation/driver-api/ipmi.rst
> index f52ab2df2569..d08cee98e34a 100644
> --- a/Documentation/driver-api/ipmi.rst
> +++ b/Documentation/driver-api/ipmi.rst
> @@ -495,7 +495,7 @@ tuned to the user's desired performance.
>  
>  The driver supports a hot add and remove of interfaces.  This way,
>  interfaces can be added or removed after the kernel is up and running.
> -This is done using /sys/modules/ipmi_si/parameters/hotmod, which is a
> +This is done using /sys/module/ipmi_si/parameters/hotmod, which is a
>  write-only parameter.  You write a string to this interface.  The string
>  has the format::
>  
> -- 
> 2.53.0
> 
