Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294EB1624C3
	for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 13:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739712045; cv=none; b=mPl3w6GnaKjViW3q43qJag/PFSFGIsW73eeSwgRQRdKKg7ZgIV3mTtfGkkFBqbx019ehVZNa55nHlsPJgDc4FAKq+bubsQZrx8TVSQ3N0l6XnNEEjVTgIMV7N0HOtlUE1wYhDILrQC06+3mDUqEd7qsA4Gp9ZrsamIMCagjk9U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739712045; c=relaxed/simple;
	bh=iXwgVAgXUjmIexsZrYTUQP7iA+K07RnDw45EbcGRkDA=;
	h=From:Date:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRFCNmY3VLBOASghRdZFBGTd3S+jLj0BhSTj/HZFS2F8qIDMBLVJMudAebH6EaE+1BqKGajhvsGNhjYV9ouvWXfGXX8HAiatRUR3QFHqq7LtjjjcbFERy+i0w0jIO3Gzjr2wPtc7R9xuyoehhUiFw/t00U+U8gH4XWbEX1y7k1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr5+Y9Ge; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr5+Y9Ge"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-471d1af90a0so20333071cf.0
        for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 05:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739712043; x=1740316843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oERNSG/4qHZX7ECOwWnJwdxVKYDuKenYPMHh89HSPhI=;
        b=Pr5+Y9GepVY/dCCqeGknk23JlF2+wrVL1fD29SzXUEzAIeEdprTzIc+k0qRYpVtCoU
         v1ZfBuPAKhBY9uZI2jTiYmA2wpCjtBPTxOj3bnmlzG8YpDNEZ3vYr3tmhE0qnfW3BKHl
         FjMBFvHrp3OEUrO3teA+haVfjhRrDV+eh9mlcz4NR5XtGIavGyKy/GWGV+07ZNX57SGO
         jvmCaTtotVI/gpMJixsw1387a4aFn9I8OpSFfAHT70HTUGyltd8e1yt9aDxVJ34zmJb2
         WAUgln1gdMcHCtsrYdxAIO5Ie1/YcJ+q3bLxX7sMjKrdzYKjGVOYgf0TCWvNjMyTqKlU
         rrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739712043; x=1740316843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oERNSG/4qHZX7ECOwWnJwdxVKYDuKenYPMHh89HSPhI=;
        b=sdp7ui9k/VTMFZlyU3vu6YdTTVqBzfi2B0RZ6sFXiAJ1J0DL+4TEooqRYZFe9D2Ba7
         Aa725TKDRq2pWFjCM9KLeiWGS9dqy5IYJOsKkRe6nZNitz1UNinMlrQNnEc+gtxqiUOs
         lupcNQre5KwEWMa80O6RT9aM2nYg2+feim9mzdXij5yv2ySJ3/dbOz2lkYSvER+8fL0X
         iQevvFeLZwTHtFewy7raYV1mEBpZRNQL5B7K5MU8vAULl9sYXNBjLgUl/bg+BsGO7p4m
         8v27YeAS9PN6yXTWzLsyU+6buBYHljODx6Fx6s2+crG616n2rgtR0Nxv3wWbNWsMyfWO
         2G8Q==
X-Gm-Message-State: AOJu0Yy1rZmP+NZfPm6YuITxELu2SI/el3XVMef7cGTSMaYLvrF/kCXM
	WXlBs70hft184n4FFYQycL7XwieOiM7O9agDh0+u076G2wDV1K1zSAnyeg==
X-Gm-Gg: ASbGncsdpGPX1+xQyQbAn9TjZogO/BZQ4gtt2iUq6eaheJqWSaJ7hKTPoD4HxI4OKak
	SOlDu+tEwFsewbf3dsckyg21qRaPH8bJjU5yr4uywtR8Gdsy30KfijggqLu5VPWTRc3WPA4D54U
	ayXfADadv4OZdYvwbo8nYXfjkrRlZH4UAML7vEg/N++Ti8QfuvDkNU9+GtE6JwdWBB7iHKZBzZB
	EkZOQC1pizWvPowLk4f5IUfXP1+V/6irgTkulDgmGRByqBDdXtquMUPdpp5RY7UTr0AIBIgxVN9
	KfDG3qmskDaN
X-Google-Smtp-Source: AGHT+IGKyt6sUGhp88VAJvRiKaBk03yYZGX4jbdyn1Cu4TmEaHjhOsDiIzdLyTzOmO+VNznPPKT4GA==
X-Received: by 2002:a05:622a:28a:b0:471:ba31:ce89 with SMTP id d75a77b69052e-471dbcc5091mr64393061cf.9.1739712042749;
        Sun, 16 Feb 2025 05:20:42 -0800 (PST)
Received: from localhost ([184.148.73.125])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471f194f857sm86661cf.5.2025.02.16.05.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 05:20:42 -0800 (PST)
From: Seyediman Seyedarab <imandevel@gmail.com>
X-Google-Original-From: Seyediman Seyedarab <ImanDevel@gmail.com>
Date: Sun, 16 Feb 2025 08:21:18 -0500
To: linux-doc@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH] drm/doc: fix minor grammatical issues
Message-ID: <435n35tqqhg63u362uyttit2kqx6qfr6cny6ap5rxigyvg7sx4@ewumuzncwczq>
References: <20250203234046.5114-1-ImanDevel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203234046.5114-1-ImanDevel@gmail.com>

On 25/02/03 06:40PM, Seyediman Seyedarab wrote:
> The following grammatical issues have been fixed:
> - Corrected subject-verb agreement
> - Replaced incorrect noun "setup" with the correct verb form "set up."
> 
> Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
> ---
>  Documentation/gpu/drm-kms.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index abfe220764e1..6a3ae069c829 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -6,7 +6,7 @@ Drivers must initialize the mode setting core by calling
>  drmm_mode_config_init() on the DRM device. The function
>  initializes the :c:type:`struct drm_device <drm_device>`
>  mode_config field and never fails. Once done, mode configuration must
> -be setup by initializing the following fields.
> +be set up by initializing the following fields.
>  
>  -  int min_width, min_height; int max_width, max_height;
>     Minimum and maximum width and height of the frame buffers in pixel
> @@ -253,7 +253,7 @@ rollback:
>    should not interfere, and not get stalled due to output routing changing on
>    different CRTCs.
>  
> -Taken all together there's two consequences for the atomic design:
> +Taken all together there are two consequences for the atomic design:
>  
>  - The overall state is split up into per-object state structures:
>    :c:type:`struct drm_plane_state <drm_plane_state>` for planes, :c:type:`struct
> -- 
> 2.48.1
> 

Just following up on this patch I sent on 25/02/03. It's a small
typo fix in the drm-kms documentation, nothing major, but I just
wanted to make sure it hasn't slipped through the cracks.
Appreciate any feedback when you get a chance. Thanks!

Seyediman
