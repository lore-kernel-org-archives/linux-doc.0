Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EA423E358
	for <linux-doc@vger.kernel.org>; Sun, 17 Aug 2025 17:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755453337; cv=none; b=QSEVW4AP3aoK9St8EcTRvlz8BYgOZ+IAUl9lkEVInw4YlEXYXgLMcOZcwsujAq0LOjexJFA5uqiclif9nb7HfmF3du80BTUgVePnKj7P6tX3wMnMA4Fahr8lL+eoOsJyzj6qzAlhnTTiTW2VtLK6FgWtth9rVqrgRWCin4hQ22E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755453337; c=relaxed/simple;
	bh=ZX65Osj3KZd+3VMcWnHgTciqbWcOdnJj8eq+6yip750=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcLqHRwHMKU2D6H0D6Gfb+cLaOpDlWVbEY0O0QTREPsI7fjqK3omFpuhQkk+Pw3wBNL0yuumP8qggU5rVvwT4R+uM/7Imcznvm2r6lG32nFXgLT7YhHyKjMH4d5oWBVWFyQ4rfAtXGn7KCn4wFElv507DDjBE87kB4uRmeBcyzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=o1LThcsY; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="o1LThcsY"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b109c59dc9so46454761cf.3
        for <linux-doc@vger.kernel.org>; Sun, 17 Aug 2025 10:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1755453334; x=1756058134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ef15y+hBWoFQAF/OeWDYMRMusZ2qkkd9+CBv2gOjP8=;
        b=o1LThcsYcTqdLu7JXhyJ0Wj95rKJBG2xc5LaXMBkhScqIVGPGztqh561yyVz015fBm
         F+BToe2KaXtglUms/VEsiRXp6jyeXWzWrN42+NKWFHO80Mevgb4zu5SYWkJGyFsewI+K
         Fg71ITR2PGREaP+apBlPz1Bco1dfK5SZeb7a1GLlQYaXfoME5cXfBVOqRKRXRk+sfWdE
         k7x/qG77acYCCjTF4oYPiA8pQOXiUqSG9hn6lXdRwAemMVSma86TqhXcT/JOVZM3xY8G
         HhmS/jEF5W8Thr9m/ka4miTp7iWBO5YatYgCLyKvOLDWxDi0JEUTNe6dsLz9IqxtYty8
         JJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755453334; x=1756058134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ef15y+hBWoFQAF/OeWDYMRMusZ2qkkd9+CBv2gOjP8=;
        b=EUFfnZmTfIAMZ4zYJPwyxjeiKZQZbU9NyZUTRYEIDSKjOjXmsnNX8ZOW+wvzhHGRuC
         5yQVa4jRjLbjSewIte+jp0xZntz4lJa5exDLOOios7LSOVRwd2v9CZwcjCGfP/UooGVB
         E2c4FfELssZ+Vi1PLGGq3QVpfuBO5KZuVs+WzyKISOYYtu6H9h8OUF5X9Nl1+k3FLLL1
         0h6fgvgkyJznVoMClPBHXBLRI7mryb3+XZ2a1sBST1KxNE99pyZeejBcCl6jqDq5c1Dx
         U3oJr/5CEGFtj50dJtghI0bvuCyPXksGLIVsRTHWs1TSE1eIqR4nHVu80T95XEyVNAsM
         gDsw==
X-Gm-Message-State: AOJu0YxoUyzBLM3m1yK1qCNvSwaplJP94f4GDrBTT5fH/4kGQH7x9qeL
	iB+goqtzUANlOiMz90LzMRdk5SuDose75AdKnOCwvVwphPt9Mt4zOhnF+5WA7/M019o=
X-Gm-Gg: ASbGncuiZnhuZcu51nTw+RM6x1jNgUsbh2BVWzkbB3mpIzNPBAUY3t0uoujKEF0I5PA
	E+tzD0UJeuGbaUi9Us+WzeWi66IEc5fAY3YsbO7drxo9ky36kdI3Oh2b4Ctwi3AAYSJo5HGN9Ci
	a/h3B8HdfOhN0o5UHdc8mS6svJX9+T/Ufx71llghLLed48iw9Z+g8AyMQEWe1PmJmjbOxGtZBxW
	4FakppfaeN4RyzA/zPMFcyU1KxbyjCmklG6RKDaCHq+FkIrShxWYHILNwpyFTvxbbvh0g+frYuv
	+k+f0N2bxYxZxG66hy1CDzAJfm1LxDvP7RBnuADz5aynMxYzNAHZfxB9rK91vicCx39I2Mn8/6d
	J501o03n6gR2TgWSrw+v0cJC+/Si9zYb3p4cMeaQ9yqqML92hkTciYdWO
X-Google-Smtp-Source: AGHT+IGGPniltbwWGADuC89Da2QodO4Z1fNUe08TbR56jJKviW2gzde0TZQ0UAs5hoxjQJhD9PIKdw==
X-Received: by 2002:a05:622a:1f0b:b0:4b0:b36e:b151 with SMTP id d75a77b69052e-4b11e0bb988mr130888341cf.16.1755453333798;
        Sun, 17 Aug 2025 10:55:33 -0700 (PDT)
Received: from fedora (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11dc1aa56sm39748811cf.7.2025.08.17.10.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 10:55:33 -0700 (PDT)
Date: Sun, 17 Aug 2025 13:55:31 -0400
From: Gregory Price <gourry@gourry.net>
To: rakuram <rakuram.e96@gmail.com>
Cc: linux-doc@vger.kernel.org, dan.j.williams@intel.com, dave@stgolabs.net,
	dave.jiang@intel.com, jonathan.cameron@huawei.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	linux-cxl@vger.kernel.org, alison.schofield@intel.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org, corbet@lwn.net
Subject: Re: [PATCH v2] Documentation/driver-api: Fix typo error in cxl
Message-ID: <aKIXk8SKIMKSuGDv@fedora>
References: <20250817173355.6615-2-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817173355.6615-2-rakuram.e96@gmail.com>

On Sun, Aug 17, 2025 at 11:03:56PM +0530, rakuram wrote:
> Fixed the following typo errors
> 
> intersparsed ==> interspersed
> in Documentation/driver-api/cxl/platform/bios-and-efi.rst
> 
> ---
> Changelog:
> 
> Changes since v1:
> Dropped fix for page-allocator.rst as requested by Gregory
> 
> Suggested-by: Gregory Price <gourry@gourry.net> 
> Signed-off-by: rakuram <rakuram.e96@gmail.com>

Reviewed-by: Gregory Price <gourry@gourry.net>

> ---
>  Documentation/driver-api/cxl/platform/bios-and-efi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/cxl/platform/bios-and-efi.rst b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
> index 645322632cc9..a9aa0ccd92af 100644
> --- a/Documentation/driver-api/cxl/platform/bios-and-efi.rst
> +++ b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
> @@ -202,7 +202,7 @@ future and such a configuration should be avoided.
>  
>  Memory Holes
>  ------------
> -If your platform includes memory holes intersparsed between your CXL memory, it
> +If your platform includes memory holes interspersed between your CXL memory, it
>  is recommended to utilize multiple decoders to cover these regions of memory,
>  rather than try to program the decoders to accept the entire range and expect
>  Linux to manage the overlap.
> -- 
> 2.43.0
> 
