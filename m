Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413CE3B194
	for <linux-doc@vger.kernel.org>; Thu, 11 Jan 2024 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBjmvGeB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d4ba539f6cso48598545ad.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Jan 2024 06:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704981962; x=1705586762; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oy7bVB78yeWex5T1qmczTscLASt6G1leoZ+LMhgwla4=;
        b=YBjmvGeBdaO512yPeXYHYI8NArK4f1IC6UOJopDb+k2VQnHyR5LU895Txw+x5gJmNJ
         QfKi5NFTCS99JCTKugqnXczqmhS+GLsUNhNFJqfxtfkJyFlGRoIsZzj/8fG78t0UM8jj
         Kzgq00xp0qohbGTrvMJJFn35zp9fNyDq4kwM28qvdZHm+GxJCNv2OcLEcuSzsTeb5rLy
         Rp4+xfYJJMQF80RaRQM3uPAviuOc6EDSylHpzF9tO65xh7zMybHMIRJsuE7WpC6QcD87
         PGniThpnTGO0YOrU+Cmvzn41untU22ljrk0D8HbHHz5EN6Gn3rYIHQfLYQvioCFN6qL6
         ApGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704981962; x=1705586762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oy7bVB78yeWex5T1qmczTscLASt6G1leoZ+LMhgwla4=;
        b=ltVhfF0frP1EHqyiuJh/gHm08obPr/z+fLod9E9ZLlx9furM2c/hcDPnba9+WeJuEo
         M7vq2qVd3EFGpCENmfNra/GnizTF/ZKIWEnvio7yCfNcdZZXmgX1LbGOe0vs0NHIZvC0
         tNfk218wB7y50ciofd+WxU3/y+UywDHRDizMT9AlKlYMZSgrSNVq77f2b5ABisOR/BXs
         GS+RMUvABd7dxmw2kNdwYi1cmJC9AFUKfGgeBfDqS0gloDaGq4UTShq+knyW14Mxf0yQ
         Upx1Cn8gGOyeIw96RdFs42jUlrkIiT4CWjw86YaqTp6xaKSdsomxGDWU+ZBvYukRd5EC
         9YmA==
X-Gm-Message-State: AOJu0YyrtsHLvnU2nlaaOSNl5ONUQhEwwdZsMNIG4kjj/Fyl1ARFYNMj
	QxWhGewUIOOaLH06OV+uiko=
X-Google-Smtp-Source: AGHT+IEvLIVx4TkQRUJSCQKBlrRbtm93p2xAWnrArmNkaMIiRIPf6MsCJHQ7ukgaDNqlQxQgINBI0w==
X-Received: by 2002:a17:902:8646:b0:1d4:432c:6371 with SMTP id y6-20020a170902864600b001d4432c6371mr1352373plt.47.1704981962460;
        Thu, 11 Jan 2024 06:06:02 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902c3c500b001d5048c79a2sm1189760plj.201.2024.01.11.06.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 06:06:01 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 852C8183BE6BE; Thu, 11 Jan 2024 21:05:58 +0700 (WIB)
Date: Thu, 11 Jan 2024 21:05:58 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Vegard Nossum <vegard.nossum@oracle.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: constrain alabaster package to older
 versions
Message-ID: <ZZ_1xsiRaoIhtNsh@archie.me>
References: <20240110104646.3647600-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240110104646.3647600-1-vegard.nossum@oracle.com>

On Wed, Jan 10, 2024 at 11:46:46AM +0100, Vegard Nossum wrote:
> The 'alabaster' theme dropped support for Sphinx < v3.4:
> 
>     0.7.14 – 2024-01-08
> 
>     * Dropped support for Python 3.8 and earlier.
>     * Dropped support for Sphinx 3.3 and earlier.
>     [...]
> 
> (Source: https://alabaster.readthedocs.io/en/latest/changelog.html)
> 
> This manifests as an error when running 'make htmldocs' in a virtualenv
> constructed from Documentation/sphinx/requirements.txt:
> 
>     Sphinx version error:
>     The alabaster extension used by this project needs at least Sphinx v3.4; it therefore cannot be built with this version.
> 
> Raising the Sphinx version is not really a good option at this point,
> since 3.x through 6.x have horrible performance regressions (7.x still
> does, but not quite as bad).
> 
> Instead, constrain the 'alabaster' package to versions that still support
> Sphinx 2.4.4.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/sphinx/requirements.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sphinx/requirements.txt
> index 335b53df35e2..6b0a981dcb2c 100644
> --- a/Documentation/sphinx/requirements.txt
> +++ b/Documentation/sphinx/requirements.txt
> @@ -1,3 +1,5 @@
>  # jinja2>=3.1 is not compatible with Sphinx<4.0
>  jinja2<3.1
> +# alabaster>=0.7.14 is not compatible with Sphinx<=3.3
> +alabaster<0.7.14
>  Sphinx==2.4.4

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara
