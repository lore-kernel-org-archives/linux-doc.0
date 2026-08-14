Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68A8494821
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 18:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731673; cv=none; b=gKsjcHzFMC+N+DROtzkdmP+znHDXGD+LnXhw8BJqr1eXsQZcOGPGAzYeOng+sjb3aqalBY67tFY16ORA7dKnSB/JEZ25dXmVjZpvPYSardyitQgG4QtdcNLl93+XExImccRY+3qM5xtf1MNVisN4piXh3XiYbNoEh/EHHVs2SVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731673; c=relaxed/simple;
	bh=VJq6FhwXUxrP9GDaFqhTQqwX1Ca9gKJ7Z6g3XjHxZhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ur49RK5D2QpUpW6/aEEk3IOfmVF/1c62M+qP7HtNKyvSLlw0FGTFHNU9Lb8k2oORtMvadStosew68KCUQ9ba2NJfrABNKwvtMlBngUOFBNxkIE/XoGH56OmEEnPtjYstTKNrvO7e2/7HpDcwwetroxzR89oGmf8LJp9aFU6/eVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ynx4pjME; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ynx4pjME"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceab75934dso17059815ad.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 11:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786731671; x=1787336471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5/5jt4c2UiEluioT7c/0hhn3yFPqX13xGEKuWAR4H5Y=;
        b=Ynx4pjMEhUm4Xr6y3PX6+Gjd/LhznaBu5KufMg4MoohIX1FHCRk1j0XQS2Nyph4jwX
         J+nd3LyudNuH2eOy07t3bzJNKUzWip0mBhO5HOQyHO7zzGtet3/W4M+ENuO8FRU24OBf
         5U7656G0m2zmlGHNWk8Fi6E+pUFGaQCCym792ZfpDOzT9fUliTCrsU71hTCrPz6L4fQx
         GxmMEShtjnfIy8KEcWpEkKd2Q1kAvpPGzinTtIwk/U6K/aSUiWJpEhK1WdtE0TzhUPlU
         wlex3/7URUWB4u8yzXBPZPO/uH+PSU5b7NHzBhxqXjDpUN3z4iHexwyXPQwakqO3l7lO
         gMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786731671; x=1787336471;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/5jt4c2UiEluioT7c/0hhn3yFPqX13xGEKuWAR4H5Y=;
        b=edNfVzPV/m6+x1XsI3WCOyvLFEJ+pzzFAdt5oWOLjtqACRD10rP/IkLT4lX65dkF92
         RYm8mCObmb2tVjiBppShH4XtjTr7pBZYrrIqpJjrm0grBhHsYe0/nEXgu3KVW8TXFrUu
         wvJ82lg8SjHMckcyejPxM7fxeoFGD820m8YcgGnthRKh2AUQjI30gEse/56VrD4jAVc+
         58ZZHLeK7EGFLRyooCFcOHhnmYrT4pfCXyrJIuTjx7CZ5KxUI690Y3oTs3L8w+RkU3TV
         5Mxbi77SvG7LnWP6mm4pVVKrkhVKir9AxGDBAXY9QOiVYLzxEZ2DXVpSZ0p23FGMUy4/
         8S9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrkiHRCN4wx1+Ehnjy3ILtfe/FvW2wlVRTafgT1Dw6aPlkKI6aM0N4RKPmcKzwqLC2QOiYSGWV8Vzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFHB/lBJuE745YiRU3C5FyJGzFRPqmV1/Yu9pnvBllsXyij4+2
	99U6CUv0QXAkyIfmcyiUMm3+NaxwUCfcV40iY0ggOoLPefn+cZc1f5zC
X-Gm-Gg: AR+sD10yOlbwUouqpRHHdjxSiPGwnoc5E7d7C9lI1MbjKHnJ/bCXePGIwnpwe1lBrqx
	ZB7wdGE1nDspWV85i2kZKRs3+9X/JinhYpZqwB0hsNFXv9RffoTfvFM6eRueC2+ocKlRgQ2j4SH
	FLxHmlJKUO6JR4OdU+Pdzk/st1gGEZ06knJFvCnWb0scVgIGHvz00mgZpYGU1OBNLvggjBRgokM
	OxA13eBd+Sg0WwIWqVciYnWc2mLDnfAgOCyJN37yzBr865j0lJ9Jup+eFt9cUlnGQ8J8bpr4Kea
	TiGagscqm47xwLPTgfSkm/Dn+C/t1UWTuX3SBWghSh+gboxxthteQoI6ermGC2kFRvkPQ5pHXAC
	+SKAmLJS1RoMpBokzB/pVeKkBo2R2k20mmqe8iGweKnikKh8CUPyLi/YvLvawcb97eFGgP9ZN5h
	iFerOESNGaaL00LVMBl8yVrEF+K0Ad/TIYhs52ZHWnk40yJUYGJ6okoBh9RG2kk+LZKSbhmp2ca
	A==
X-Received: by 2002:a17:903:1250:b0:2ca:62e:cc4f with SMTP id d9443c01a7336-2d3b0f6e3a0mr86513205ad.23.1786731670861;
        Fri, 14 Aug 2026 11:21:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d60eb8eesm6920348eec.10.2026.08.14.11.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 11:21:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 14 Aug 2026 11:21:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arie Miller <renari@arimil.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III
 support
Message-ID: <8b1029da-c038-479f-90bb-b560fceb42de@roeck-us.net>
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-3-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812103532.395049-3-renari@arimil.com>

On Wed, Aug 12, 2026 at 06:35:31AM -0400, Arie Miller wrote:
> The ROG Ryujin III uses different report offsets and a different
> cooler-duty channel from the Ryujin II. It also lacks the separate
> external fan controller supplied with the older model.
> 
> Add model data and USB IDs for the Extreme and EVA Edition variants.
> Skip controller commands and hide the unavailable controller hwmon
> channels for these devices. Update the driver documentation, Kconfig
> text, and module description accordingly.
> 
> Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/9
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>
> Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>

Applied.

Thanks,
Guenter
