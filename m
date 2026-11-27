Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764108;
	b=xgYuSWQ9ua3DZsjBpDPh1NEBX2Zci/v7uyLBom145G1CcAlg+QOA+phnLUE1tsQM9RGP
	 hV1aD3BagGGYqBTfvWQvAu4JIiSsKDi36kGwoFFo+ZYcQQlXICYAjmH6SmfQeFqAtMQ/o
	 3RWRRbCvo/ZYqyoP9QZL74cFfPl5h+lY+vZhPk/mNpulfHQcD3iSkDhtKKYK2KhjSMnFb
	 obBAYNke6v7i8yEet0eTMwVijDCFzKkaHZcdmcWH6Ozf1j+7HQp9VLIuxvoty/E+W6RwU
	 74x6+H94K4e+DZOPnN11OT13Lw0ayieykadEDGPkfOzLt/y0zQzvsJqIspc1d501vmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=RFWIIK5B2bXDOJcKTvFKiX1dOLs0oT0s7HmTLBjeOw8=;
	b=uHCi2UL7uivLEQA+0hcgXw0AyS1YbCpYuEBWtmPP4IzguRgDtAl3VP8DFQDQXphHNRFh
	 fxSmcJv1y6ubagaxT1ToMqINn/aLYS/jCG2nOZ3AgMZ+u9BsrSRC/eKzIRtRjGQR8fuag
	 fezmhaz0WiHtYSC3Q195unx2tMlpDrutimKluiQ51gr5XwKGYc8jovojMRNx4JQVLNyUW
	 zKWEDTfsSyFNemklp7rf3mNb4zKnzva1qErHFhkwR0qKDs1kNE4ruaqZj4+ND2euE5zkL
	 T4/t1C6kartn7bL9FlNFLAfihYI2PfW3vr2a3LKC1LOJcBrwTy9xlSgCdpbHVwrFb7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HcztGOmd;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65BB606A321
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 07:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C65BB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HcztGOmd
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso55438675e9.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 23:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795764106; x=1796368906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFWIIK5B2bXDOJcKTvFKiX1dOLs0oT0s7HmTLBjeOw8=;
        b=HcztGOmdc5oyCKWNkB+7dO5kui2rNOSDFOUQ4TRMlAu1wzaYlaWENRe89k2hQleqas
         MD2bZSscuRXfFlRzXY77y6rcq2MUGZ0lG2vR+tWFEiVhbud9/JVzpMcVY/OUqCdQvbVk
         Ox4SdSw6aixLDn+axItLaAZzR0VN1Qd1slhDa1eIhBSgRGhItUhj2B0XFiB0iNE4W0r4
         oeR7h9Q+FLXLShDVveMqI8nxy1TrJk3B5AqySG3MxM9Y627DpzPQ0ycT/MSZ14U1UlNe
         kYfUn9PqEPGeMtzPZaBxa8b1hnJrXI6C7Odlv/3cAlghDtat+cxTi2aP2CJkLnGUPfcR
         a3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795764106; x=1796368906;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RFWIIK5B2bXDOJcKTvFKiX1dOLs0oT0s7HmTLBjeOw8=;
        b=FjSmUSjncdZ7ecf5XZyVfi5Sw4oSMKLHiT5d48gYTXT7E/jn6uPqeoMe0kV6MpvNT6
         mxt+CZrD7pNb13ALGfpMBrDrPmfQWwQItFGr4HycstU4LETE6yrL/lz6OObPaf0yW2iP
         hbOiFIXRGY7nS6GalcqY2aNrCUfaLXVqy5Qn4B1AbJZ5jSBN6FdbPzzsj5WaBgVSmTWU
         YYljY3I3RoRhV8FCCu1aN8gCZRYjXaIFtVgoiB0J9qFZD3P3f+FrQqfRArVgwVoPEhFM
         lNvIxHeF0qBCvRyDoZ5ykAS00AI/ieP6SaHKhVDLXVOWr82GYgduMN1nONiBkMBMiPVf
         cdEg==
X-Forwarded-Encrypted: i=1; AL+hErFesm/xeFyQ/ffzH1VC5awwgY7X+6IyKHBFo1llV28XaV6BbJNdtwGxMkt7z5wxSBaQ6kMU18axATk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IL15+Hxy5rq6nCj74iHq0myFpjOdOPpneo2CvMuVZE83Fhd0w
	0zbIgPONLOxSSx4rluR9rrkaxvFG3AnJ/sWAirnrzX/tDrAeFDSdL6rk
X-Gm-Gg: AZFdTZcCByqRQzizmnCLbiz/reC/0LX6WGTgSSRdmnLgngrbEgvJMOnX3b6OwNU35te
	TJTWMlteIfy1blrehJ4YdUFdHe6hiT8MYVFPvZ9nsm+cOmWqu7pgZfblVFMaGKJST6Whkmfxdls
	T3ulT4UXPJWQl9GvJF3WvlZpXgZT2bTRLquGZGjAzpzk39EPfVwUJqBiNdmVPesyLfmJEPPNydj
	F5PRqqRzparjlR3sBy0HzqGDH0s/tucA0ZAhnKAM7Qm5TWmjWuNyzFQB00eWGNH8bSR/l8TsF6Z
	SrutwA74szGavpRhaDqXQGIkn2RMk4NCAZGsmnUbt9ELnUBm1eKkWPjuNx2sJGXVccdchwcadKk
	hovxbhe/puGCbjYg52MEUx1Az56eB6NN3T1FPUywoCaUmrOh6XGiMIsA9GDILEKiMqsviuDZz7u
	OH5cmQWtgHHT1Bscsb8b5R/LsEgfApN1Bn5ZZFGzq7y/tp7Zzwmeydqids4j+XYgH5aRywWN3ZC
	rciucxr4rBnYLVZdhuF8VC2HfiPLTrPm2WPOHv203u8TeU2kQfeHy8slUxzT31GYJ83qjsKDPzK
	VTGt8tKSEccK+R3qfGnzVe/8/FlK4CE=
X-Received: by 2002:a05:600c:1d09:b0:4bb:73d5:ab33 with SMTP id 5b1f17b1804b1-4bb88816acemr509462955e9.22.1795764106011;
        Thu, 26 Nov 2026 23:21:46 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm885577375e9.0.2026.11.26.23.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:21:45 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: 
Cc: Oarora Etimis <oaroraetimis@gmail.com>,
	"To : Louis Chauvet" <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
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
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 10/43] drm/vkms: Reset config->dev when the device creation fails
Date: Fri, 27 Nov 2026 08:21:30 +0100
Message-ID: <awkvQvRhbFLBKy8q@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-10-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-10-21194cda2468@bootlin.com>
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

From: Oarora Etimis <oaroraetimis@gmail.com>, To:  Louis Chauvet <louis.chauvet@bootlin.com>

On Thu, Nov 26, 2026 at 12:28:53PM +0100, Louis Chauvet wrote:
> vkms_create() stores the vkms_device in config->dev, but the error paths
> after that point free the device (through devres_release_group()) without
> clearing the pointer. The configuration then keeps a dangling pointer,
> which can be dereferenced later (for example by vkms_destroy() or by the
> configfs disable path) once the device is already gone.
> 
> Clear config->dev in the out_devres error path so the configuration stays
> consistent when the device creation fails.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 28b99511f186..4cbb1173fcc6 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -215,6 +215,7 @@ int vkms_create(struct vkms_config *config)
>  
>  out_devres:
>  	devres_release_group(&fdev->dev, NULL);
> +	config->dev = NULL;
>  out_unregister:
>  	faux_device_destroy(fdev);
>  	return ret;
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
