Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BBB330318
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760705587; cv=none; b=Ux0lT9yyzbPWzPldKhp14VbrScV9xsz/jXWsVFlyn3NCbDWdCLS+SpjPg5VUy0pgRnXtce1Zydh5Mq3/OR0Vm5gaETH25Dzfpx7P//ReNBSRXtw44Q5CEb55Wsv0U33efqB133EPNwAQ1b7eF/8Zlo4swCAGiSEumwxtaotKIfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760705587; c=relaxed/simple;
	bh=q0dKvcJXcIqsz8kbuZxRuCwTz45q3VYiBczF46lCmoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxg3k5iDkAhrDe5G2gd4b8TrWu08HB2Bl9up+v4PavUkzG3e5P8Nu0nPJ87RTBdTjbN4Ma/e+39z7/rgP5xJQVUv2K+H7fDQVxJjtAKj4GBzv/4NrrI/mOoVWOKSCmKgud2t7EyNgs532hL57iYPvxMtdRERxFYzZhtMEjKb9Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtzqUJ84; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtzqUJ84"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-292322d10feso1820045ad.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760705585; x=1761310385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KPuy8xanc30aUC0NeAjXkSoXgg+j9Yhzu5edLPhaAs=;
        b=YtzqUJ84tsEAWC7vW200fU3xiSBeMscuRWsJivrTjT1Wbdp8veOATJptoFoxMakSTe
         2CEOPdYJRN0gFJby7f+6oMQW30Mm7f+O5ZsempqwDtXMekhOF9aIAyjf9TFgff6PpFd0
         RQRN9IguYcbbfXC95Usy2J5qX9SIBhCWoEODNcO4iyLyXH0jaPI5UHDtx1x91jbgqsan
         2JsRx76q1EeRKAYpfuUggyJgx8mxan+5Gmnrn4RT5xIHimwSEOAhNyvNMsRNl0vQvFFt
         XqewDnbnEvoMHeWttQF+FhWwmbDwfqik+V5p5unEP/naY2hjqb7BL3OXbvQZ1OdsAiVg
         eQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760705585; x=1761310385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KPuy8xanc30aUC0NeAjXkSoXgg+j9Yhzu5edLPhaAs=;
        b=TuVA+/pYFOjq8HsSa/lDSHpQJyQudBiBfJtztKKlDfHhEEE2RiGOKO2HXxl0s86hj4
         CDUwvXA/Pf4zzuQgucbak55z4gOStjiz1dKsxlOLcAKdx5eGBOcY4AEhnwv2/qJFgfwh
         kEUJhtU0sOTzgxNI1B52p9Jvx+/rDgofqU1AHf5bOWFz85Kn9495b90qIvvo+yZIQVTK
         Ycqi2VFpO2x1BcsQJ6qZrxAZ/WEjddViAjGQrCeO9kPfT/almWm+Lxr12raAb3dvaHP+
         3SFIFBV++i8dOWMWjYNQhHtoutktitjOteP7CXnx9dKj6vvv65gnfm5dSvHFZSaUMqkE
         6lJA==
X-Forwarded-Encrypted: i=1; AJvYcCX1oortwKft4piPGbmhycilByR8RsLLvEynJEAxiWyeyZI8PsgSD1CC4Rmj1+1D1gnlyAhiQmkooPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcH/dPM2ojSJy+XsLCFqlrSnbgouuIt51fHvImXZlXo2uJPFqL
	TEpmWw6a28SOWRsDH/eI5dyez/RzRa9gx2+HUf/eiBgJ7e7b7WPSAlzH
X-Gm-Gg: ASbGnct7kDwL7WudAsupE6xYpXMHEwS4SD1eknUb1yGLK/RGqtcquZ/8wG1DZT4tRRI
	RcPv9YNzUf+qBX+52tbEQ/gkNmZvtRxheLnPyeRYHoXaxvyNI0hJMwb5GyXhSPsIsW6dI2BLluj
	/WxF9i8iw3Zw5eVu/idlqRj6koFOPUclLwb9xecN/zE97lkwRYy1X/LtuzosH3NnvNoX30cd21r
	GF54LI4RhYuaYm0BP9TxpKvZkFoLLLYcyysv40uINL8HPqs7XoIr/wTU5jddOlHI6RVIlwE4lUe
	Yih0qNRpMfx8reAs4971rBjkRh5xXnz+aZ+rN7y/Vkb2JFyhKCVTzKLf1HIEmjVMtJpzAgWePjR
	rlTkodDOrDv7R16YNMpDid9Y5uBvXIeQib/hZAW1eejvZtd5LpKiygUBS2DomwesyxjmkaUnVxw
	6xJfV5YuwehDPLksvIjfqePg8=
X-Google-Smtp-Source: AGHT+IG5O3uFCStwtBtYTlo/Za7+Ei3oHkieQstV+E+Ni78R3C1MS3A0qnauKtcp81RiP5MMdGWSXg==
X-Received: by 2002:a17:902:d58d:b0:265:b60f:d18 with SMTP id d9443c01a7336-290c66d9f6amr39830685ad.1.1760705585006;
        Fri, 17 Oct 2025 05:53:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a999sm63835595ad.9.2025.10.17.05.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:53:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 17 Oct 2025 05:53:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, khalid@kernel.org,
	david.hunter.linux@gmail.com, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 3/3] docs/hwmon: Update maxim-ic.com links to analog.com
Message-ID: <07862286-4e65-41ab-bcbb-ad9b8432ef71@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017105740.17646-4-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017105740.17646-4-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 04:27:18PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Update maxim-ic.com & maximintegrated.com links to analog.com links.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
> ---
>  Documentation/hwmon/max127.rst   |  4 +++-
>  Documentation/hwmon/max16601.rst |  4 +++-
>  Documentation/hwmon/max1668.rst  |  4 +++-
>  Documentation/hwmon/max197.rst   |  8 +++++--
>  Documentation/hwmon/max20730.rst | 16 +++++++++----
>  Documentation/hwmon/max31722.rst |  8 +++++--
>  Documentation/hwmon/max31730.rst |  4 +++-
>  Documentation/hwmon/max31785.rst |  4 +++-
>  Documentation/hwmon/max34440.rst | 24 ++++++++++++++-----
>  Documentation/hwmon/max6620.rst  |  4 +++-
>  Documentation/hwmon/max6639.rst  |  4 +++-
>  Documentation/hwmon/max6697.rst  | 40 ++++++++++++++++++++++++--------
>  12 files changed, 93 insertions(+), 31 deletions(-)
> 
> diff --git a/Documentation/hwmon/max127.rst b/Documentation/hwmon/max127.rst
> index dc192dd9c37c..5ff2f64f9daa 100644
> --- a/Documentation/hwmon/max127.rst
> +++ b/Documentation/hwmon/max127.rst
> @@ -13,7 +13,9 @@ Supported chips:
>  
>      Prefix: 'max127'
>  
> -    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX127-MAX128.pdf
> +    Datasheet: Publicly available at the Maxim website
> +
> +	       https://www.analog.com/media/en/technical-documentation/data-sheets/max127-max128.pdf

Text or link, but not both.

Guenter
