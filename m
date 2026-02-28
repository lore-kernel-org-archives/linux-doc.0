Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1B81A9FB0
	for <linux-doc@vger.kernel.org>; Sat, 28 Feb 2026 01:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772243471; cv=none; b=fGrGOAgs8qAJo4+GMY+a9hc34+DOr0jOANTv0BxsVTU5Yz26TdzWgiN5VZxhAX3cWrj1AyghjwMQC6sGK0ZPbCs8pdWV9fgq8RvqTFnkKn7cxkHczYPAT5CejL4ZY9+VlIvspyvBi5Nxg5JtBtD1wFV05LWQjJX/T6aoOeZd4YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772243471; c=relaxed/simple;
	bh=gIumB9HImraDox1hWN3n9EH2/4+Lo4nMNxttwLK0DMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFpVHnFfRUGSup1luXJ6nEeCdDXiUlWDxMvSHM2Aiq8nABk7vFqAydW3BPtxz7iQd5pk85DTGpnrW7WmkFNC5aJkVTDGsp16D5BIo0hkK0dTSo3gheN5/snfG4XMqXHgW1bJUvTnmiGsFYnMbjK7JTbhEZcLbbQmIrHhafHEbHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qqz+LBc6; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qqz+LBc6"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so5277526eec.1
        for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 17:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772243468; x=1772848268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYsPGO5+402nK3xRFhcy2EAHOfgolTxteUiFETL5D3c=;
        b=Qqz+LBc6qWvy8+NQiNgB6eDEUdr+7Fom5xWgyRYLCd3RcsLX9AjWSYJ2/yFpSOKp6r
         Cg1KUvL7GCODW3z3HRd59dYgU3whRd7Ij6qhSqAFmEfR2ps6UtSrMvjiaXhHuhTJXhUb
         Kn7ZUrZODhQQCn6dia+de8CYbYbSNUVlL9bTgRugDR5ZpFg79dRhHPD0/Mr49Riz7t8O
         utqRYGMHysy98D1LCfE0znF8B4H0DpHHlAAdR5+OOVIQ6MR4oKHRJanzfEhlMySKktBv
         uUbzutb3YQMXgU/VImcNqFHQ6n+huwTtAK51yRgDpDwl1195OncQoYKV9cFov1HckJn/
         Cb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772243468; x=1772848268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xYsPGO5+402nK3xRFhcy2EAHOfgolTxteUiFETL5D3c=;
        b=d8mGTw2ZOmhzPLLYRhyoMBfQzqrwufMoHBWDZnq8oyQZnak3ykmkCfpf+LRcPAxgx/
         VFh3PPZSmYumBg3bAsnifj8q4q2Z0sUJ02viXabBWcjlraT0v6k0314CpSlclQMZQZkq
         SInqPG6xWyY3weqUP+XjpjR7oW8Zuch68phwtK7PbYRK3v+G52DOTpXvpLUnYJfRi3g1
         uvAYnId3jH8pJZ6PGQOZS5oMXaPR2Qnj8TMnV429wi1cNptxJc5N2i9ZmMpS4i/LS3M0
         d/BE1SysVHsZ53EYQqGevLUEzKFC3DDgaqY5tiSiQQouLV5I+G9KDLg6O2yc7vqt65Us
         /vAA==
X-Forwarded-Encrypted: i=1; AJvYcCUwSuSCd152B80CofKbrfs6ziTPkDTm96t1GBDyZSLwB0aY1x8V5U3id/I9tbEae+ZbwGrJrIur6a8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU2n3dqsIyb39mDUpFtqDxhyOq5VAP+SYjpptZslxogkkEaqp6
	5sKGx2lcurq9GX7+r3Bd3e4v6+2BQypFolzWM+emjeuZvyZMRv9TmVA2
X-Gm-Gg: ATEYQzxpyuMP5RgIHLJs3SuNk3JCBozJlTWU3EF7zkFvyLhQjpizq5aBf+747+wbq1l
	zG7+L8+9XepqYd3dHhKiozormGU/Q0jdGYOs6GVBr0sdXcClldtLZbMcWOIWmMH6MWzWnj0tITA
	GmGmXFIC+9z2V1xlViaY2QAE+kkyKFhaasbn+dZjZvds11jpT5nITmnMjfklJWa4yO3dt5i2d8j
	ZjzJYCSpw4HvLblq6KOqCD7F9XrmCJLrpURuB5vpB7MWdgraE2Jb+yf2RtMaOnfZ8jPqCaHfzyZ
	zwrZvoFJU4kULc3/qtVl9NW1wibDJdt77NoJT1mW+RMR0LZBcRgJO6gENIGmFNZS83TMZQYiTic
	8sI0/dZF3H8miRq3LF8GDklzTXXKHmfIkA9wGZ1pjKOyk2buJ06mnfB4SmMGpw2VhAZiO1j+9K/
	Tj/Xx/Tb4ga5aAn1n6JmBRmimGkErroataFHDZ
X-Received: by 2002:a05:7022:6898:b0:11b:9386:7ecd with SMTP id a92af1059eb24-1278fd398a2mr2443833c88.42.1772243468058;
        Fri, 27 Feb 2026 17:51:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a43c12sm6591851c88.14.2026.02.27.17.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 17:51:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 27 Feb 2026 17:51:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/5] docs: watchdog: mlx-wdt: small fixes
Message-ID: <5b334b6a-2712-490c-a88c-46d2239b45f4@roeck-us.net>
References: <20260228010402.2389343-1-rdunlap@infradead.org>
 <20260228010402.2389343-2-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228010402.2389343-2-rdunlap@infradead.org>

On Fri, Feb 27, 2026 at 05:03:58PM -0800, Randy Dunlap wrote:
> Correct some grammar and spelling mistakes in mlx-wdt.rst.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> 
>  Documentation/watchdog/mlx-wdt.rst |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-next-20260226.orig/Documentation/watchdog/mlx-wdt.rst
> +++ linux-next-20260226/Documentation/watchdog/mlx-wdt.rst
> @@ -28,7 +28,7 @@ Type 3:
>    Same as Type 2 with extended maximum timeout period.
>    Maximum timeout is 65535 sec.
>  
> -Type 1 HW watchdog implementation exist in old systems and
> +Type 1 HW watchdog implementation exists in old systems and
>  all new systems have type 2 HW watchdog.
>  Two types of HW implementation have also different register map.
>  
> @@ -48,7 +48,7 @@ which is optional.
>  Watchdog can be started during a probe, in this case it will be
>  pinged by watchdog core before watchdog device will be opened by
>  user space application.
> -Watchdog can be initialised in nowayout way, i.e. oncse started
> +Watchdog can be initialised in nowayout mode, i.e. once started
>  it can't be stopped.
>  
>  This mlx-wdt driver supports both HW watchdog implementations.
