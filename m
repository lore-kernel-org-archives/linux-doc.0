Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528613;
	b=nY1yHOORq+YfrwaCMQ6GuX4HX6YY9LZKOOtOY/1VCYFPcevg7NkH5FeoAQ90TrWT0F3X
	 0rNaO4uZUNa2tnB0hyKEFuPvsVje3ryposviuQnfgnQexMjIP5kaeMrOs78bVUFHT+AE/
	 OtzUQGLJ3lVFOg9/1jxK4wjR07zuhEACo44RI1Ct11IRU+f/57Sudyieh6eBAgXpwYFGK
	 /VHXl7pU3Na5BX+Jcb4WZznkQmI41cI8JvyOt2Ej4fm/sqhYMy+PlBNonxSFVODRN27+9
	 Ylinbo//XvdxDXrQAOWIGe0Tvss+k1lmBrUbiN46gw+MWYKro2WTsrOPvgXQfgw0jtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
	b=e5jU74XLZZXKtHPdWUwjciz2pR8lu0vVBE4z6v9qRSbeFWzaADg59TLyRf7qypYpEeoE
	 hL+ilYWWZpchU5C189rKN66NezcOBAW6TzLG8lz2q8ZLtPQkadnxbjkF95UcDhSceuRXY
	 KpowuQmCpEjVO0qej9wd021iM2WO2q/pKzpRAfLFkGTCjGugCNxpr1FtvGCo3MWysxT4P
	 K5pu5uLy0otsrdQ7xJtK2T+mh00AHiyXwPtMoWEK99MLvPqo+8HiSM+DDEchBJRsgAgnO
	 JKiMBjQ2rp9DbmYdVa2uahorJK7aAx47l0Q4yS43hCZLvzFNq/7QOxh7YqLIwECiuAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DeNL4hzN;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C6A606A326
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 13:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6C6A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DeNL4hzN
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2939254f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 05:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795528611; x=1796133411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
        b=DeNL4hzNs5OtMyzBe4ENjT0H0+3w3ba11RXLHxbD8Sz4L+qq9xcE/oYQmMaECTddYF
         Ame3yubqv4Y6QWFIgbaSsDXeGPPvjncolpWbmGysR3Tizb573kgQjBA3dZ8uMQyj5MMW
         n9G/C5zrR6QNJda4AmhznpxBj21GrByt/Elixf5FB6Tv02h0AI4oQNDw7QBsIRez3nuo
         z9Sfm2qZiaqcvyJvuz9Zs1GUlxAq1D2aNYfyOvQK/Cg7mwo620EZcyi/FFZHZavR1ckL
         60sBqYYrpNPSSyiqQmvkpf+UetkHnSaL+jD/1+S0Y04yjcFAACKudGPAMFbtHun2we30
         xNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528611; x=1796133411;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
        b=cGUJq+ke/e0uGaQXLa2Fg8YfGGuAO2d78lP4EZKIsuCCnVhzLjxcVcW/syUzkZoWko
         z7qJM668PR7j8cud+yRr4dmCaOJ0DerQX5zKsy9IoWMXFBNUWgZ/lXquwa9WBy8zUNkI
         HQsMPGQA5yPMkL+EU6PPlkM3t/vZ8iX1RA87K5dUGnNpXeMKzS03DwYgSUDfys/Mfmin
         WdN9iHiPWWZbHMivDaLcZo1iAm14e2vgESrFsCX6s21bKwbRSonOa3FKKRrRyZCef7cs
         vWXiqZXqGhzwn1d2rsj09ZqCgUJTzWwLU+eNK7BsSLPXagmDuzLBL7LfbwE3vX9AbLXG
         Xx2g==
X-Forwarded-Encrypted: i=1; AL+hErE99PWyalNpmF3RkysC+E1XpVrsEoQj37J4yzmp9Cv3QKeq0qrORIAvZlqW+kboSvTaivwrSNmDs3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+5PZRYVF2Fmh+2385DKbH/E/L8NUREPT7fStYQtN3jH2LZe8k
	eomAo/mR6mHadVYEAFVhjveY9VWGQMo+ClLLvYSj/CJuvnTbygkUlc3r
X-Gm-Gg: AZFdTZcuLg31ROOSpTp8ptBt98rQF0o3nRNV6mK6juktG2W6ol85halxsjlB3+XPVY0
	Dld3xF9uKnNlnPiG+c/2Omn9zL1UfRs1FcdrOol4TsBJxsmOAUL12YGXO0IxEAUNuip5A9eOcVi
	wiXkElcWxsUqlcLc/E3AIWV+VekqKRsbMOGv+RNvb9Dx/l8zjrpPXMIELIt3qDKyAy3I49mJGLm
	FYgaMsW+gGZXaaYc2TfnJ6NcX8Bt6TB/q7dcrVp5C92yUxWWjph4lnBbSkfo1mW11O8rOUFhRMy
	Nu2fuKK6DfGp9OnomGdvQleNvhFgto1jyyfkaTd5mQDM6BSPXD6QY0DZu2C/STFCY0CaKW7RVGL
	yhH9eA2tNdmqUJQW5A7mvo1w3TllELToAjM91iuJ+LG5RHtTUEzPb0gHLTJSUcCMDgenWFechHI
	9Ni+KYhms49XrJNNIjxOhnkQS6N1d4xofenbr7RGC5MlbMBWKl76V6IxKhCI/YOqhjP0Ck6P13c
	YCEdcjCL/frHbs5e/aTLBvdeR1kMZySxIxEQsV3Dy04d4+OeBneR4cLg7s4RRDxSFER8a6nMkFK
	al/fvRqrKSSK5wcDqf0HbEzA9SJi8BU=
X-Received: by 2002:adf:e197:0:b0:492:b5d9:feb9 with SMTP id ffacd0b85a97d-4abb3a4d8f7mr26010339f8f.30.1795528611263;
        Tue, 24 Nov 2026 05:56:51 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm28936616f8f.48.2026.11.24.05.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:56:50 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 09/43] drm/connector: Export drm_get_colorspace_name
Date: Tue, 24 Nov 2026 14:56:38 +0100
Message-ID: <awWXgzY_0Q2Wtn7n@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-9-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-9-78ace90f4fc1@bootlin.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 06:58:51PM +0100, Louis Chauvet wrote:
> Export drm_get_colorspace_name so it could be used by VKMS
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index d66188521881..fbff5871355d 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1528,6 +1528,7 @@ const char *drm_get_colorspace_name(enum drm_colorspace colorspace)
>  	else
>  		return "(null)";
>  }
> +EXPORT_SYMBOL(drm_get_colorspace_name);
>  
>  static const u32 hdmi_colorspaces =
>  	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
