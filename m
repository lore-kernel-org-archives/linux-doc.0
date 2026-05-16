Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B857D3E3C40
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 17:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778953435; cv=none; b=GSY/W9xZJIX88Q7JCeGhytCOUkCteq0cMtumXc0RURd2xsI2QX/Jsa4ybDGUzcVZ3g7FJ/RJ/JkjNIAPottll+o8E6gGw9Zq4hhGaQoAPhG9c09AW0XJVT0Xpw+/FtcWISa0jLf3xLsktH9mpkSj6VuCbbW/zgniYuBbzM2BkSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778953435; c=relaxed/simple;
	bh=csTK/HbKKC6v2Ikk6PQp3X4XP1MiazJHTn4tijrsTPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLMYcn3hvEFFX1dZ0hTJYAzL5awZi3o6RnJXWEPTpRsZn900y7GEsz1j2IrP6YmoeKE3TGV2DnMAn7gbtjCEvweGNEAIMirKyKdNnv8D4OpQvIHDqI9QktXqsSnOuOGjmHSnV0b4MS8EVTXXP7A5NH97hium5r8kipeSodFDZfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNmU0SOd; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNmU0SOd"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-134fe980658so997632c88.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 10:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778953433; x=1779558233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bT/ht7TDh8ru/ZEga5H1yY/vbnW0GAOum+ohG5JvRE=;
        b=RNmU0SOdWPxyof+7z+kaI70mFusT5cVhRHh3tQlcZiySf7HjdkVeF0wyRiTWkpsihE
         BLfC6l8hpgvetgSQaWN3b/yL0YqTSz1JKGcWOqL79cuvEkNGk6Hj68aD66BxAG43qhJF
         9Cu+tw1F4bqKA5s+SgWE3lTnTXp+s1Crv+ncUUxhCXx7BdkLTSfatS/WpzeK0e5WVYzG
         k+WSIG518cojlBTDEYWQDwqrIFGRAQENB9grQ02E3CzmiR4bFGBgRQ+ZQFcyptM/Ra4U
         N1GI0dIVlO3WFE8fba4Tu7zZzrM5bicp9lCdqfuD/mxAGHkT8d50Ki9dsXDLqIdZgqbC
         KPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778953433; x=1779558233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bT/ht7TDh8ru/ZEga5H1yY/vbnW0GAOum+ohG5JvRE=;
        b=gU3/Pr8XpybtUvluG/6PMbAEMingM+hPHT/g76wNw8LDv6lMcNa1+hwao4uxSZDZtu
         IpNJ04JAHd2fH4+ytf8e1/EpFo+fgWSmLVuxp4HoUTGlR5OwDVarU7PiqIV7e1i9oqqF
         7Af3DJxABGea2JpPoQkSrkUL57wWB9KLTqORGTEwtVwzUJiIa1yptQyo1J9G64oMUsz6
         Lr7oj5iDOoBaDKb9GnXV0825T0EKUvIOpS/zfL27ytbcfpYBo57YTgensWbyAYP+CORD
         LPV5wzLi198XkmkrYijJbT/+w5/rBmJ6CfS5Mtw6Vj2LUEoEfpAQoRP6Mrv7WR7QDQRl
         cTVA==
X-Forwarded-Encrypted: i=1; AFNElJ/EonSPANrg48XxFjQEsuPUyOFlWC+Br+xWCYk6IqMHvjIAHW+2zJxtHkeETqmxOhdp0YG++xPT2T0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5E0sgngphnlHdDVPe9q+BinZw7MyPWq7z7nOnTsxK9zb1HVG9
	pDrnCkfrpvMgBAPLPlKTe2oNI5wmXLPi+3F3b5AeZqPKwu1BBoH1fvKu
X-Gm-Gg: Acq92OFtXirJUl8rV/I/G1WquSB22rD4ypeBxV+KsggVALgwhuvcqCUKSszWR/E6xSM
	7PajpTB3Vn5lkk2sdt7U7n7KuR7JxhgPy5WIXY3qgig3oOJyk7fChmSIcwCmHrRLcOBgT4Nz6nt
	CNr3tP72+VlWscx0AjhpnojH9Cm3llPovPJ20mLmplqSPL15XK2Hk1nazbJeJIOzFwJTvCLZvZD
	ah0HuSkGl0XtKanD4mZFVOJhvMz4edNayzfLSEKfbUBUcNi4+8qs6K2ToaUGa3sHvxf4JAczWpe
	lhwr0kKdrFLb1TuBnBOVIsZQFrrK6EiL6J5uzkpEqOssPy79T1d8XkoydO0HKrh9gzLDi/IfaZe
	CndeNbjbDtb0+FxlyQ6ZOySVqzIRmeePIv6PqFGjPlROU3QsKSN4PoO+KfA1ry3vcqHvEx/ThKd
	hEv7sBjfWNX/oH0TS5UEsM5ThzeG3/5V09R5KzS5/TLQR4wR8=
X-Received: by 2002:a05:7300:b209:b0:2d0:239a:23cb with SMTP id 5a478bee46e88-30398655ecemr3889054eec.16.1778953432798;
        Sat, 16 May 2026 10:43:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcd0csm10467417eec.24.2026.05.16.10.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 10:43:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 16 May 2026 10:43:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chen-Shi-Hong <eric039eric@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Documentation: hwmon: lm75: document sysfs interface
Message-ID: <9882b9cf-7b10-411d-be41-2da298500db2@roeck-us.net>
References: <20260516160823.1461-1-eric039eric@gmail.com>
 <20260516170728.2066-1-eric039eric@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516170728.2066-1-eric039eric@gmail.com>

On Sun, May 17, 2026 at 01:07:27AM +0800, Chen-Shi-Hong wrote:
> Document the sysfs attributes supported by the lm75 driver.
> 
> The driver exposes temp1_input, temp1_max, temp1_max_hyst, and the
> standard update_interval attribute. Some chips also expose temp1_alarm,
> and temp1_label is available if a label is provided for the device.
> 
> Add a sysfs-Interface section to Documentation/hwmon/lm75.rst to
> describe the supported attributes and clarify that temp1_alarm,
> temp1_label, and the write permissions of update_interval depend on the
> chip.
> 
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>

When I tried to apply this patch, I noticed that a similar patch is
already queued in hwmon-next. Sorry that I didn't realize this earlier.

Guenter

> ---
> Changes in v2:
> - Document temp1_label as conditionally available when a device label is
>   provided.
> 
> Changes in v3:
> - Add changelog requested during review.
> 
>  Documentation/hwmon/lm75.rst | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
> index 4269da04508e..fa8ddcaa0c2b 100644
> --- a/Documentation/hwmon/lm75.rst
> +++ b/Documentation/hwmon/lm75.rst
> @@ -181,3 +181,28 @@ is supported by this driver, other specific enhancements are not.
>  
>  The LM77 is not supported, contrary to what we pretended for a long time.
>  Both chips are simply not compatible, value encoding differs.
> +
> +sysfs-Interface
> +---------------
> +
> +================ ============================================
> +temp1_input      temperature input
> +temp1_max        maximum temperature
> +temp1_max_hyst   maximum temperature hysteresis
> +================ ============================================
> +
> +If a label is provided for the device, the following attribute is also
> +available:
> +
> +================ ============================================
> +temp1_label      temperature channel label
> +================ ============================================
> +
> +If supported by the chip, the following attribute is also available:
> +
> +================ ============================================
> +temp1_alarm      temperature alarm
> +================ ============================================
> +
> +The standard update_interval attribute is also supported. Its write
> +permissions depend on the chip.
