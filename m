Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB55288C0D
	for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 17:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750094879; cv=none; b=Rd/tT27SlJeRLtL8pvpMh4UbQ5vysQGY/DfnvVUVklSPWlSWfo0nNwAV2dhnRXD36mP+piuTtv3Y5Penb7RtvFEjyR7MPgiLks1KoFLYwjClf411itT8J2McSKMMYz84zlH3ZnyaCvhpdgtWdrNGZtG/og8LZ1kb2ne8BccZOcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750094879; c=relaxed/simple;
	bh=LelOrep8BFhkDNPGP79ngM80BpQG1itNZ9WdpzkFM5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mi9P3duxFU9nFG98CVKqy+J/66zdnYY/zlxcAJTcXM5AWE+qCNnDQCZYv7eQ5driZ0ztAo4bJXSFPOOGk+G4+/rlZoDg6Sfnc1xlDnoxo/LnyMY8Vapx0jtEG1BmUz5X7cp6bY5BzqFkvMfJEDzhjJqr4ii6Gm4sY1q+UFX2o94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=B2dAcbLD; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="B2dAcbLD"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fabe9446a0so50032076d6.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 10:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1750094875; x=1750699675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7HCyyC5UYA2b8c4IzXsIvi20Ipr0wxqzS/03kE5MqM=;
        b=B2dAcbLDn3iVHi259XWF64J5zyF9AYhh+zQcXu0SqZHfcFo/PowCm64b1vrHPMfDNE
         KpwoV7W0PGm2hGR568bByuW+tEH2kgfy00mvGQ8xEe4z3AU+7oSpeRicazcxFyUUdaHJ
         heiSH+sVKjzZQpbUpD6ue/WnUzrtFccvoAUWq9mjiSgt+uUVcJkgiBV7qYXWpopLcJvl
         PkrjrmcCd25LHtEjT0+MMJc1MW1uUGu8lQ3HCH25PRdfiI7oXWzM95FgYsNVsCfcJKPX
         jDotIWG/Li9FV6UN0g10Pr06HKGVKUvvMRdHsPtZ0Ky9Lodoy/S7jbiP6zmyu2YaYvFc
         ey2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750094876; x=1750699676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7HCyyC5UYA2b8c4IzXsIvi20Ipr0wxqzS/03kE5MqM=;
        b=DyleoPRgkbXHs8XCOhg25Ioe/E9+4pB4/Ml4WGnFghDR2LKknq8pIzo8seoHlnVPZd
         DyZoTyT6swneQgRlhTiFPgRg9JOwR+qRC+WtQHwfPpDLiWy/CG8LfySC9uDvxke7Z7/Z
         lsOmdRZP+zLuTdOfoUcVf0ybr2LjF41PmLLMGU9/5QcPNG7geAuBs00kuOtoWJfBnmbu
         HxF+i4V+niWs/G6A2tye4wYwCsmY7foA5w8DtgtgofxNAcML9nA8Vx/fEJxl2WpvGHsJ
         uJbJMuQnp54IvBo9npbGkwMohULN2sz4+jmQ8TQuMXxufjfP7+3I9MGxmspwfg2KNmqs
         FeaQ==
X-Gm-Message-State: AOJu0Yyrddydj+oaRPGC5lG6NBM2pca09HNP2D7iE4tyG1Sd4+CLGeV1
	8d50mOE14StxyGAB4l5pv1uIdFNsRLJeCfdocNNlE7mAK1wpZ8rYjd0ByOzohArO+3A=
X-Gm-Gg: ASbGncv/cBnw7mcp0KgvTbAjO4gJJcI24qJWug24EfuefELMs4SOMyqihNaEwKXhQ/u
	b9tLQXALiXjO1PvPj8XcH1Q2sHYDmIlIW2SCmggbNXrJ06kTIAUWgpR1r/VYKhyfrZ53aS+JE/N
	lOwnN2286HHQlbW61bg0f+AcSPfexok1BovawfQiQR2VLS0PurKqss5eMTfi2f+yNCXTeWUV1tf
	FWUQY+7zXXD/Cpt3ZHQBx87hmrcsvT5Kgl1R0pSccXDurDV8fc2pR//S2vgQ8SEMxKIKyliLUna
	0S1Y4nvIwkFK/9L5WNUvqkj1w7OlxrJm90R0PnvoYGK12fUnN0+jVY3CBfN909xjTp/4
X-Google-Smtp-Source: AGHT+IFTR01Y6+W1geCwjaW5IfCrLepVJGWaVvo70DuFbzxcMRNcEzZhf9yE9pfFqi8vBf06mSlbhg==
X-Received: by 2002:a05:6214:20a2:b0:6fa:bf2f:41ad with SMTP id 6a1803df08f44-6fb47736bbfmr161414176d6.19.1750094875589;
        Mon, 16 Jun 2025 10:27:55 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:400::5:cf64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c72b17sm53505016d6.102.2025.06.16.10.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 10:27:55 -0700 (PDT)
Date: Mon, 16 Jun 2025 12:27:53 -0500
From: Gregory Price <gourry@gourry.net>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: linux-doc@vger.kernel.org, linux-cxl@vger.kernel.org, corbet@lwn.net,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com, linux-kernel@vger.kernel.org,
	darren.kenny@oracle.com
Subject: Re: [PATCH] cxl: docs/devices Fix typos and clarify wording in
 device-types.rst
Message-ID: <aFBUGTM4fpwU749k@gourry-fedora-PF4VCD3F>
References: <20250616060737.1645393-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616060737.1645393-1-alok.a.tiwari@oracle.com>

On Sun, Jun 15, 2025 at 11:07:32PM -0700, Alok Tiwari wrote:
>  Documentation/driver-api/cxl/devices/device-types.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
...
>  
>  A Multi-Logical Device (MLD) is a device which may present multiple devices
> -to one or more devices.
> +to one or more hosts.

This is subtly incorrect.

A *Multi-Headed* MLD presents one or more devices to one or more hosts.

A *Multi-logical Device* presents one or more devices to one or more
upstream devices (such as a switch).

You can have a Single-Headed Multi-Logical Device that presents 2
"Logical Devices" to a single upstream device (host or switch).

So please change "one or more hosts" to "one or more upstream devices".


With that change you may add

Reviewed-by: Gregory Price <gourry@gourry.net>

~Gregory
