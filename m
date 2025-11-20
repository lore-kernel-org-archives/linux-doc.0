Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0F233A008
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 14:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763650521; cv=none; b=RPgguom1zUeW/mpG6ihyEp65L5i3L4VTF0WglXVh5NXk+g5E/2te3JIrm+dqHdFhDWeRA3UH9rTTCzwOxEDWPrrJs+AMZ74w5IFc1fL2SwBQGRkiXR1I4VH3sSxvJiNh6M9dpxBogo7Hhn0s2PzENxiMLO5QbVBBqljOHSkGJxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763650521; c=relaxed/simple;
	bh=IYKfCs3i0v02S1nziPd8Oz7+F3sngphV+VccYH5t6I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVRZ8yg9iTP5rqi2Y8d4ZixfaGc8Xzg1ZZgpBeIqu8m6TpMCH5vLAB58l3kd3PyVagzh3bAQbrK3jKA0SaKvEOeRG5Mg8Ex/rIhEY0xC4zksSlN5G5UlVDz41IHeccWTT7IPfwo/mrwPzw1xTEienetMCgeix5mSlvfZ+/+MRm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=Wv0H1UzQ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="Wv0H1UzQ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b739b3fc2a0so147039466b.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 06:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1763650518; x=1764255318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IYKfCs3i0v02S1nziPd8Oz7+F3sngphV+VccYH5t6I0=;
        b=Wv0H1UzQWEoKiXKbq6WEYoPYNnT3wIK0V/RgJjk7Jb7/YDPKZ02ZItAUh9ek682lkF
         J5zYk2oOz1JthW0BaAsKd/5awaatlRy4qKk08lWbHKzH+AkwNj9cCWCzcWUuFnX8uZJg
         wqJFMDc1He9WfqW0+oq644ini3fMEHCgi7xtauUYbqVcluvPVwi61GlrRc720TvGuoMF
         1FefV2wJLVmSml06m0OMBuEYeUytqJfZmIydHw3wOhIprcBXwgVYlqIS0zLrFs7DDiZC
         i0MU88S7CTxi72tpgAtTuOFNaAwMuOSG1EAxF/ko1RNuQY4hyLfHjzMo0GyXh4Ptity/
         wfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763650518; x=1764255318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYKfCs3i0v02S1nziPd8Oz7+F3sngphV+VccYH5t6I0=;
        b=mWb6gQPIFRKM8eTsYHS4MeEWOU/vCANVukXJ8bB+JIvuSVLfzo693GJxJt2T/O+PXA
         11MW83VJ/+s1BcCTlcNCwMyXrTcZ5TmTEYtoZ4CU40ilrq6eSdTMV+gOvp9aAsANTYXW
         1c/umDQV4smpe2GZ23XdHWWyUq2DL2hdaClT9Q9OAV/WafWCB4h4RK+FGT/E8ng6tVEY
         dgx5vxq5kidKyRKzSnCNvBZGFK3Hh1fQMW1c0M9PQ4qA0ZeeSpEm2b12zhwiLsqdKIxc
         DgiOte7G4hTdh9U3/2a6W0Bs7tWo7YPXSvkhoKEEQCSFU8h7CSbtI8F3DIuWyulouo0X
         8Pww==
X-Forwarded-Encrypted: i=1; AJvYcCWzXeRrhkOAZKkEtPmKN7vRcP9WT2xlZuRQmAg4oKJ3WDTzM2GkUujpIQ1XrH6XC9/6wZYQ5J6sUnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOnP7F7fsnYiX8ASg2bEzwU83yO4hkRuKy5zj9JQCTZWL6DGSK
	tMcYf5yjQh0hBjD/ug+wT89RqLSB5o5IvX8RA8TyRNfW3sVbPf2oEpF6z19lw99Rf+M=
X-Gm-Gg: ASbGncsWr7hqhw1KMvPqh5brannaWsDWQqIIt+T9+LmwJquT8cO1L25Ucquo7n2Ss32
	za2wlR9ckt1pfi2eBJsr1s1yfVFqdc8UqCAEc+L61nXd1VEQb1Tlq1rQy/A01LIC/zmUt9aMaLF
	P1O2kZtLp9MWqtAFW77G1tQSdOw9qr8GyPQzv1Y/ZHlbOEryuAO3Ab0wxFqHG1MezTlMBhseb5S
	cfkqvcOr0jBwRZIPTvr6o+HuPrdfCjidagnnJfZehNFpYEsz/SltsTKJhBMBvzP4ikSlGHJNglK
	b8rBJNxI82AUb41aOE0ap8eh8ycJmESeunTRITZKKwal/UFQlKFqPauZCQfJxCy9M+rvJgjtzYE
	X4Ae1aoKRYCGEkFtsd/Ck9vGF0W4h76nvi9KvcdcFABWo73ldz70Jlgv+trVet+7Kku2iTZPBfp
	gluE5d+vdlLBAQBeorbB8=
X-Google-Smtp-Source: AGHT+IEPtM6EIIGo4193tVNdZEj2yltOmNHgf2oexFbhFB6uocPPBppvPF2J67DDaWgxEDBcuxOxZw==
X-Received: by 2002:a17:907:3f1f:b0:b73:6534:5984 with SMTP id a640c23a62f3a-b7654dd66d1mr355087566b.16.1763650518326;
        Thu, 20 Nov 2025 06:55:18 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4f59sm217338366b.36.2025.11.20.06.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 06:55:17 -0800 (PST)
Date: Thu, 20 Nov 2025 15:55:16 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, 
	Gal Pressman <gal@nvidia.com>, Moshe Shemesh <moshe@nvidia.com>, 
	Carolina Jubran <cjubran@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next 05/14] devlink: Decouple rate storage from
 associated devlink object
Message-ID: <3yvpa2ni6sq5wymlvesp3xdoigc4dlvhbtrixz465mr3k6y7hw@buvno7yetqma>
References: <1763644166-1250608-1-git-send-email-tariqt@nvidia.com>
 <1763644166-1250608-6-git-send-email-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1763644166-1250608-6-git-send-email-tariqt@nvidia.com>

Thu, Nov 20, 2025 at 02:09:17PM +0100, tariqt@nvidia.com wrote:
>From: Cosmin Ratiu <cratiu@nvidia.com>
>
>Devlink rate leafs and nodes were stored in their respective devlink
>objects pointed to by devlink_rate->devlink.
>
>This patch removes that association by introducing the concept of
>'rate node devlink', which is where all rates that could link to each
>other are stored. For now this is the same as devlink_rate->devlink.
>
>After this patch, the devlink rates stored in this devlink instance
>could potentially be from multiple other devlink instances. So all rate
>node manipulation code was updated to:
>- correctly compare the actual devlink object during iteration.
>- maybe acquire additional locks (noop for now).
>
>Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
>Reviewed-by: Carolina Jubran <cjubran@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
