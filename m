Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B5F33031C
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 12:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760705335; cv=none; b=qnQ/H37PzavJvMr0GnBsejpYOvXfXeMQ+TqVNknSLkvt6aFB6TWjPvuLt3BBYAF+Hz7ilN6LPFSwqe4/d7GjvBCaWOT9roKG1qAe/edjgyUGXtb9CP8a0Ht/38/LZrXKR8gVSDWRzhmMSBs9ZNuFBnkUTBu5QZBsG/EaE99lBY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760705335; c=relaxed/simple;
	bh=lw5cb12WTQW5V8LKlGN3d+ABzL6hKt0x7IsEIl0HPdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffdSCgacTa0OiERrT6qmepXUClqElCgJhUxNXd7ql5B2O/0U9QOtMse/85tNgv+XXc/hOXkUMjnkQVAKAVchiP5v4Kxxblv5CO4xFtGNL9viyjf9vp5PXmO5xwyc9ybuGCAagTNfa/Sr7bh+ZEajCw4h8nT9cct0RDbehTq+UGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=das2UgJ/; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="das2UgJ/"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7833765433cso2589230b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760705332; x=1761310132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vm1q1yJNMMPqej5XCUEQWCVG1hgmSTxZ5v4pBOj1eAo=;
        b=das2UgJ/OdqBeODEJnZopFMVZMcNTNIGK5EzrEA0l0rCSYDsvAiPr+V5pTm12X4GzU
         Kk3cXA2toWNcsOxJvdEVZ1UslLRMSTe4yOdSlqq0KTsOQL+G+43zSNz6qqQXeX6hB9Ow
         NO+atH17rp0lZbnJzZiWpkRi0CKNRa2XCUmarZ/TIfayUzS9VQ340mrdpNYmm17RX6g5
         cPIDbR3gLcv1XprIsxlsDM/wlIUZ9/sYX5UG/xzuhZS9hm3ygjRo5Bvwc+qwGbHAlnv0
         HP3h9SKz4l0fQGovkJk06dvt7rjyDB1U76wCNBTP6LB09ve++fvJyvj42A8XsPSTb5dZ
         oieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760705332; x=1761310132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vm1q1yJNMMPqej5XCUEQWCVG1hgmSTxZ5v4pBOj1eAo=;
        b=ZMqd1pmz+dtyVuZvi/KU+pKlgxc48ri6fFNb1ph3aRg/WX3DSMZByP/GUJj9GvtfOP
         WGXMWBeRDSyLVs+SXhz8uBYIbk2i9+Yd/EirTYNvmGlXoAACkZ1LCNNpXS2Lbld4StiQ
         ZjxvpcTKUKQeXY9jKanagPTPuNn8JxnAVKxh2Zz0WbJJoYvwBGaiIM4u1zR/LeqfKL65
         PpucWPxL7VUaphPIE5h2T7uoj/mOfXc5A4mqjupM4b1QhbvMEKcYs4SY5BTCnpxRikp8
         AhDRksPmzCvkxJde5wks/+bF3QJR3VtgO2wYY6zf5OOrbyFJ0Ehhy9TGGpbW8huA1P4n
         ZFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1l9JXaU2sEVaf6UrBtrk3CCZBNS9cDXZCprsQeeCXxvzmg9ZrrcFw3EXMmI1Gw/1Q7WX3golMWm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKV1Pjv2gnlHKcm4oQs6dewrj11a2GfYmab4HKMBE2CDXp85/N
	FkA/nKU1nh5Tw+hDZFiIP+UxHjO+xptHfUG8LUn+TioNwKQgjRc/ULfe
X-Gm-Gg: ASbGncuWY5MJGkgg+9HNH24UaRJholXVKNzjB4YQOlaKdmzLSYYTpdc9HiRLPe25tnc
	ahvVfwP5aEDRTb2OPyan/YjbGJRszNPLf7c8S/r8Be6EJnfI2/QejX4Im3Wwy4TNBP1mMn0evXA
	jdVPqj59E/3zdIyyXTM+N6P9GdxGkYVqvUCaqewmoQUF+H6e8Zlk/1x4eJt9o167aiUiUnZuAaU
	cbGCmOxW19ujyIJTLR1BpdHNs8TvANMrtWRDuPb+173ZzrRq2sDNdGyQ9ygeZR1U3BLfRJGlGB0
	gdBqVdTtAYuJLhj4MI4pyDDXZ6odN/sp76bcr/gStaRAhkwrOWwMUvZEXrkqW2IOABWIubd5TmL
	he8Fo2vaS7JbgDjTQsJp2RP61opJpTxPDtnu95sUURcUzf+C6ylZ8AxWQqMhnGnid+2bntsDGLD
	9J8wk3jIK3tPYPCCECntEjLVo=
X-Google-Smtp-Source: AGHT+IFwTxIM7KbRMRI4pagPw+NiPSPIsNhdBx3JaSyasAkdLl7zRtFXNHdz/QIh6BaZIRnxB4f6nQ==
X-Received: by 2002:a05:6a21:4d17:b0:334:a9f2:558c with SMTP id adf61e73a8af0-334a9f255cemr3877419637.5.1760705332044;
        Fri, 17 Oct 2025 05:48:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b06076bsm6390184b3a.4.2025.10.17.05.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:48:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 17 Oct 2025 05:48:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, khalid@kernel.org,
	david.hunter.linux@gmail.com, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 1/3] docs/hwmon: Fix broken maxim-ic.com links to
 analog.com
Message-ID: <826742f1-d1b3-49cf-a1d2-5a64d1e58d16@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017105740.17646-2-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017105740.17646-2-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 04:27:16PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Broken redirects fixed to their proper analog.com links.
> Fixes warnings in 'make linkcheckdocs'.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
> ---
>  Documentation/hwmon/jc42.rst     |  6 +++---
>  Documentation/hwmon/max16064.rst |  2 +-
>  Documentation/hwmon/max16065.rst | 16 ++++++++--------
>  Documentation/hwmon/max1619.rst  |  4 ++--
>  Documentation/hwmon/max31790.rst |  4 +++-
>  Documentation/hwmon/max6650.rst  |  8 ++++++--
>  Documentation/hwmon/max8688.rst  |  4 +++-
>  7 files changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/hwmon/jc42.rst b/Documentation/hwmon/jc42.rst
> index 19d10512f6c0..df47a5d265cc 100644
> --- a/Documentation/hwmon/jc42.rst
> +++ b/Documentation/hwmon/jc42.rst
> @@ -5,7 +5,7 @@ Supported chips:
>  
>    * Analog Devices ADT7408
>  
> -    Datasheets:
> +    Datasheet: Publicly available at the Analog Devices website

Please refrain from making such unnecessary changes.

Guenter
