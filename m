Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70BF4C9018
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 14:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001604; cv=none; b=Cvt7D3BDuP2GcpLtrh6mS9+lD0xIf+3Y2c8kiaurVKGPZ8SS7BCOoris7kucKETxtDRR3HhhUzO9MUNMg0sTy9yHWrM/akOPa+sWfJ8WeNCcMCPDDWp7JJoBl7ubAdhHhvNFRaxhzF6gyNuzGM6TzeTEcn72158bsWN23K6ul5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001604; c=relaxed/simple;
	bh=Pg2lqWXp76Badtsi2DF7GRbFExK4NjUhM71ibyIo/70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFzM+6n1NmQUB8NgnxsaVAmBBwf3oGZgTc/lKbzuYkEVgEQAe2eUWCV0XBIU/WfosDCvhxN+0yxbiJfLpuY1ep7yqlFN1tHz8E9RY2cw7jRal1m4UDrLf9lNg9FCH/havGG5gYGCuSW+pPCjVmLBQV4BuSD7JRhUfpwsRL2780o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ee+PH7u/; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ee+PH7u/"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cac59f8b64so1837205ad.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 07:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783001597; x=1783606397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wz4agU0yn9wkoZiN7DYnByNy4LBmnpfOWuBui52/YVg=;
        b=ee+PH7u/RbYlwtKfM7WOe/SEq7tQKbgqxqPpWgTIeXnAIBaP5zY46EPrSmHJASgX38
         uv5Bk7RsZ3EjTrb63Chj0rrKgKQQIi8YRgbSE7flI3Ydl/gA1oXykpmJ52tnj22JYzKU
         XRSic0QVVZBTlXUoHhPReV1tYPzh9BzDgmjA7pKoCssyCoBnzyl1qOxy5Zma0XwNRL+a
         CKeYutDjAuZAP0fYUUda8CEgy1nBim00n9Dg8xx59HJ9phGWO20A348/9aDFTc1JGRwK
         +KmJOzvjGTg/oz2QEjxaw0lG4N4iYHwJ1iNi7/Fdyer8tptKB3vSWyBVzOGNftiJm1ay
         iA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783001597; x=1783606397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wz4agU0yn9wkoZiN7DYnByNy4LBmnpfOWuBui52/YVg=;
        b=EIz1Y/NBJQmepphG46CrSK8FhiXPjpse9td+jaIck1G6TvsZyWa4ASTJBj/v1/b3vL
         mu987s9IRh2QqOR9k5R/cysVJ4ti3/K8o+mWAW0stp8fYIwNgyxOK1Ygdvs2hC19pc4p
         L0mx/LQ8PXyY2+g2LxbOijMlP7C9oSEJoOeSzcBYQaMjO9kCJ/xuHH+B+6OE09ucsHKm
         TMVi83bjmd697jnqry4AROZzj30FowZeIn+bLFQQL5XamOGdn9U8fu5TlW8W2L5oJPpY
         1WtzDktiJuF5B2HdGCmBTaBsY/wslGtCnCnORRE4EkSV5CtXasFJnZfTIsIzvIwdzhaO
         KjMg==
X-Forwarded-Encrypted: i=1; AHgh+RoMTzgcT9X1/0J5a3pIoRTRVbloDGyTuvNqHxahnaIMI6YIE5JZbNX322vbkEsI7AtrhB2dC2Lqu20=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2DY/t256vRsyDcDOM5xqopmiAmZucjAYrUlgBnIsolnQivJC3
	Wb19kU2rRSpkYfzdMSGb+7PvNtG9/6I3plO3O3m3x1FMMnUArpKOPOjY
X-Gm-Gg: AfdE7clvpfCQ95B0/iRdklFA5Ne6oghc1YCTahHxoZZWE7DapMM292umFsNKiSNsZrF
	ZBt3vod7y3wYyOjzU3Q6w6+QC2tmwgr3SPDHpnKmYai5wNR4ChsNhnz2aKizY8LIa1YrY2pc0fU
	I5tBtrP9ba1CsDfOVRbd+DhhWupRTHLcAkpFD//cawbyg0Sn/dQAEa6sGrur3EMSU2aBihWtdBO
	m2xthqLxayJraDZQ+MD7d9LtRfbjUjst/uaPUJzYAi2FEqNKKcETLXBbwmFxvbmYByHUlmJKlaU
	aMe1jMlmjEwAnJsCWHEnMqoDJILU+QlfYJE8rYoAYzhv5USmYyaSz/gNiMUJqLzVf+9byX8OBD1
	5iwztiIwDyhl4tua9JUyJGMe4lzxXDdznanP0M3W2v7gYu1JH83lL5aYeYE40dIjxWMu/ycEaga
	TyKJEIXC2fCZ2Ur8pElOzZ0v3dAg==
X-Received: by 2002:a17:902:fc44:b0:2c9:dbb5:c1ec with SMTP id d9443c01a7336-2ca7e8b5334mr69557085ad.47.1783001597445;
        Thu, 02 Jul 2026 07:13:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a90ca0esm14205725ad.27.2026.07.02.07.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:13:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Jul 2026 07:13:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] docs: watchdog: Fix brackets
Message-ID: <645105c6-0302-4ab9-a249-09a4036d6409@roeck-us.net>
References: <20260627091707.29688-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627091707.29688-2-manuelebner@mailbox.org>

On Sat, Jun 27, 2026 at 11:17:08AM +0200, Manuel Ebner wrote:
> Add missing brackets ')'.
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

Guenter

> ---
>  Documentation/watchdog/watchdog-parameters.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
> index 2359aa32e25d..8e2df5b7d241 100644
> --- a/Documentation/watchdog/watchdog-parameters.rst
> +++ b/Documentation/watchdog/watchdog-parameters.rst
> @@ -59,7 +59,7 @@ advantechwdt:
>  
>  alim1535_wdt:
>      timeout:
> -	Watchdog timeout in seconds. (0 < timeout < 18000, default=60
> +	Watchdog timeout in seconds. (0 < timeout < 18000, default=60)
>      nowayout:
>  	Watchdog cannot be stopped once started
>  	(default=kernel config parameter)
> @@ -68,7 +68,7 @@ alim1535_wdt:
>  
>  alim7101_wdt:
>      timeout:
> -	Watchdog timeout in seconds. (1<=timeout<=3600, default=30
> +	Watchdog timeout in seconds. (1<=timeout<=3600, default=30)
>      use_gpio:
>  	Use the gpio watchdog (required by old cobalt boards).
>  	default=0/off/no
