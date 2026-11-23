Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448202;
	b=X05JsH1x3kMLgZ1M7xdFzlFJPRE9agY4AqvEBKQ1LJwYvHfIUALH0MngHFjrQtF6NBtQ
	 ZhwFZ5K85rCOj3v8OzpyqInxEHmFDfnRNwbaMtXAvwEeWKr2sPojLNVIbmbf+shso4p0q
	 gQspsaftznu/W0hD3b6Dbd9QIW0ADeZRvCQ6UoRVezyPV0s7BJublD8K0WTTYWMx/m2z8
	 o+XllfNy5RV2kc8P/MotJGD1+kK9PYO+XwHYnqOQEQB8eS+0R6joUigA5FVlqdNTuUolM
	 vJupoWUOpmjIDngAd1DJ2tcZaAr6xB1FEbhLdMHQew/ODaHTJDOsLrC/LqeDjzP361w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=iMj2t4hUan0LrC5voc+bXHqikDQMoVSMga8MiF5GiH8=;
	b=AENXsNMK1waXo+Xj0K9+LuvnjH+zVP9RmX3fLh092I+hvT05jz7Afvrz7Hxh7pTwCs/r
	 XQUqtjxYPkFWYumbGwemjXqDf8H0Sm1BfGJO+SJf6oPy35tLFB4UKOMsmHID/D3uJucel
	 Op1r5etQ7Swy6b+2vZnqOeOaZkcwyB7fHIxk5atfbRKB4kqxttQA/ZytTSDAuMnDYunM5
	 o3Ff2FBt/bVTobUEDN2k5ReUHVxOXbN/04zUJkkY218rvaJ8MXqTvnp5LCR+vOwu8P2XW
	 dyaiWbQtxAg/ZRBrBke5bpPDgiNzTBk5F+8OUsu72S+fCgzvDGeiQ1ak8tM8GVkr7bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nWFZkm4v;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0229D606A32D
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 15:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0229D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nWFZkm4v
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so30257425e9.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448200; x=1796053000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMj2t4hUan0LrC5voc+bXHqikDQMoVSMga8MiF5GiH8=;
        b=nWFZkm4vqoVPoLJ5bAeqhCFLP/tMnyvJhuj/5vvKe4j5l0OYyDIp3QnpbxR774+uUA
         cMSqdoyHbh2ISX5DOL1Q7rK0RsOYS1sPmQZgfclXSYAK5DTgR1SVx0nBiqzi+vVkudgg
         HrOFDUz3zsFRUvr7YppSpn5CpWrQKEuaz2LxjZ4PFQbiU+AZxKKWS1bEUMDPHcYGqv8Q
         VUR3dfV/wtMpc7EJ6MZU4Z4UKukOcZnbgYij9jFOg7IDeGqq6V3WC830bPd6xQ8YYVOZ
         U5gbJ6bznHFjK6Ss1AjwX/krdJ/TBP1dINwPVOO/PHu5YVWD5kJresWc9JzDbcGp/jOq
         bJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448200; x=1796053000;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iMj2t4hUan0LrC5voc+bXHqikDQMoVSMga8MiF5GiH8=;
        b=Lzz2NTYirZU03w5eUKz/ou5m0xzBD4bODh3TelNeFfU64mrPDvYiG/oonji/ZzowmQ
         Fug/FNKXVCIk/MmFBWo8eP9GCys2zxFuPUmoMi3899hVsX19UvYOHyqqBVIi5UF+m7mo
         9MpsQeynH8J8sdDMsodH28Ae4by86toxZm6edVQC0OmebX4njLZvwt6xOHiCe8QBI6kH
         8pMJsoSPmXFeVsWbETk/z2P/tBvyEtUigKlufLyW4jKRu9kOywPW2MqgFDP8h1sfUrcE
         4vGhBwX8orH0cI5bkf+yrqHqn8Xw/tfT7ro8/LzHHU+sxhEEElplYst2+04KPIoJyr3V
         1AMw==
X-Forwarded-Encrypted: i=1; AL+hErHDZIvoG3UE4OQixpXECsJyd3vh5o9yAlBR0gIF/Sn27yf3ljJvAvbSjvxz4uq6VE8nXLO+lOWOfi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sNOd5vW2KrrMwPUC9o/NSmHzouN+cAWMvGQ9iweycF9Ro0WNM
	4CoQsIMbIYDsporv1yeFjInwjDF4iAcUIOhxDy9dqAbUNSVV/dVyCn0H
X-Gm-Gg: AZFdTZfovA1Py5wsI7YN2lRjT7oehfDiPIcHYcVh1e2pnvZsef2lmRn3Q/95waP1CZG
	S8Tb03pEnIliSTTWu0A1ycAAYTXWHhAD+MugNjjl6RVHGWhEjFWfVMpZlLcTPTq6a2Z+wWlX6JY
	u7jKTElDlQJHIkQvJ+ezIhsrtQJB7wFn302L0PTB7Fatzse+TRqMtB1Bk4+g28Lmvc+c1p0k0Dl
	MY2wJtwWW264Q1V1VwAbkWghx8RFZZiCKBejlLJyiTTNg6g7sA+XERNzRso7bXyY5z9Erg65mcg
	Wa3jep7v/FpnrJk8mY5XdrIaLobGoqjgkGPXYLGYdq2kB/idxSakWLBOjFfUH+2YBTW1/lWm7xG
	/e0v75s2opv/0LSI8UkpiGe2u/xc04s6U/6GoQSPvyuUNpBxCbey5NKy1nY02EdTK7KKSfm2pkJ
	J0//Lq/qIn+gBj7OObdKMMl2Qcye+eD9L2bUuPQeV+lGgbGxGABx/kpzQj8wyVF66AQwCVIbBnF
	0mooh24iOFWr1m/x53awHOIje+iMeoKxcVKYv+QdkbG2x/ETLgFomnJGR4NKspUxgmEJmagZ3NN
	GRa8BGFnyVDLIFGNXCla5rzhRI4Zh80KDQ==
X-Received: by 2002:a05:600c:3b88:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4bb888078a8mr280286605e9.11.1795448200216;
        Mon, 23 Nov 2026 07:36:40 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm193318255e9.1.2026.11.23.07.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:36:39 -0800 (PST)
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
Subject: Re: [PATCH v6 19/43] drm/vkms: Use plane folder name as plane name
Date: Mon, 23 Nov 2026 16:36:17 +0100
Message-ID: <awRbCaRRole752Pk@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-19-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-19-78ace90f4fc1@bootlin.com>
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

 
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index a7ddcfd4e86e..3a1a34643cce 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -375,6 +375,12 @@ static struct config_group *make_plane_group(struct config_group *group,
>  			return ERR_PTR(ret);
>  		}
>  
> +		ret = vkms_config_plane_set_name(plane->config, name, strlen(name));
> +		if (ret) {
> +			vkms_config_destroy_plane(plane->config);
> +			return ERR_PTR(ret);
> +		}
> +
>  		config_group_init_type_name(&plane->group, name, &plane_item_type);
>  
>  		config_group_init_type_name(&plane->possible_crtcs_group,
>

Oops, looks like this leaks the plane allocated by kzalloc_obj() above :)
