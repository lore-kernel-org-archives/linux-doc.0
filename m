Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440971;
	b=1JQoyHk6r3HaLg/2kqBgGjZiy+dGZOP7wk4Z1/zyJ8SC63UEl9MhJQiihhp0fwYpY5lK
	 jGjMC3ZDZotSXQbjeDZbhHIRRyx6xSuJsok18rU+I/iolspRubN9Zo64iqfr8quONnoBu
	 C9qFkPR1LDxFBlCnNJN+JiZXj6cBGZKObGrbQeGh/ROsiJp+xjqDHLKNlF1sT8ynVJ1eH
	 bo9B1KvghpB+XghCgr+TjF3X/R/kA6xe6OHxTMGaAMoaMEH49nvrGktksn6B3Xlhza6E2
	 U5fvTDmF6YigDnHIw7L05KkVHQ6431S4aAWnsHnJMYADO2DzdtSjX3wP2T0TZwikSqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=ndp8NPT5TSJ6UFCJr6F45UdWtUB0BU/WIyewS4Od3DQ=;
	b=vrQkbWJqFJaVzLDewP/Wr2oM3ct6iw0m5OPvgxWH1JeWgzDo5S3m7b/nlvSkcetraK8I
	 BvYCseg0P7dj9P68N/kgkLUP5rgAgs3ltzNdPyzsqvBSahr22NFqTfhBNFnZJ+cuHboTe
	 HhYRlGc5i8XgUNKosJ4c6Tq2i8rAEhDF3BWmR02FcZRPsS9f/IPIM8UKlT8dQTGSE2YwW
	 qIsf2M6C//TuUOjJ2lNLb9HYME81gWzE9fIo2xE83Dp9fiSWGT75mrpT5OjvJG0nLZNXx
	 Bp+xYHPrzvZGQBT8PJtW4Db76ioHyriHntnmJ3EKbxnFXmBgnxpA8n4bzMK23+O5dPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C8NkCasO;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D3B606A321
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 13:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96D3B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C8NkCasO
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so4175388a12.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 05:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440969; x=1796045769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ndp8NPT5TSJ6UFCJr6F45UdWtUB0BU/WIyewS4Od3DQ=;
        b=C8NkCasOiTGUTMWrPsgLV37fI9kQ9YrrJZ8gfujEZtxbS7/qQxoklxszJx19UpPBr9
         cuO67x3bL5EcN2EUpGrInSAOswXt8qchrGpVw2cnQB6caJabNyP9C9jhgsATri6nJNMh
         iuua2m+gQn3QTupxA/tfVB3wbC/Vs87k07D2DuYx1AgVdV8k1x08zfLl31dWu2C5JURr
         lA/UZ8yuv/pkWkahCzRVo1BIfIuKIEh5Re9hqD3BAz2tubqV6L9Zm8uBZ1UWuy14ll92
         /cEotwE1V5A8p8s74iCkfXPBt2bajfpg0A52EuW6vitqKaO97n5BaoVhymSUgZW7Giig
         M5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440969; x=1796045769;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ndp8NPT5TSJ6UFCJr6F45UdWtUB0BU/WIyewS4Od3DQ=;
        b=nXVKj4VbhXrOYleQ2cTKTY/YnxzyWHLelEDZQ/JhPtkCKCUZOZKWdtEzFOUHDCyy0Q
         GZddJdfxyFLftVK8DidudJYYLxQsUqEv+tvFjRaqpXBG+x7ZZtj+wRsRFYxPM4c4ae8X
         S1RZaDoGRFpJwfQf2UpuXMGtUBqmMERwq68NKN5ObEBPLk6WdxupC6DsJNxOHAiWWMeZ
         O0vPo89gjJA6mO2SBNqDTYzC3six0zBloO7uFrKlYZB+U1N5UnU0b/35whZ2I3lS3Hza
         aBCmdAi/6UO7UTmXoqLVYubOGSejqiYSUf3Ron0sWWgKeFqnfGjZ3fzUdnFzZolq6M2K
         PWTA==
X-Forwarded-Encrypted: i=1; AL+hErE1pDmwgaB0Dgq39UCW6DIrFM6OHeRcNdzfuvefMzOd3b8CW26uPoFhPxCaKd2QPNrHy9x1lzP+8OU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TcISTYi9VzkH7kS+/eAqM8Uo3fNnsd7A4bNX8N66Z7o1YAA45
	MYjT4FpzM4IeCDbltTaXWXUGQFovsEgIZdu0uzIN7Kpwypiv/pNI9GYu
X-Gm-Gg: AZFdTZelUBsVwVkMw7ukitBMFAzbFgXg3Xl7qSL7NPGsqH3uzY2MmhycpLchVdIHwSz
	Tcsn659C1a2/Dz8I2D99ysffK+r8qhFjE4CKmgVC+TjVlp4ujpDLK4H0e0h0FOTNol7i85LRTBe
	PcrPGW0ejK6fuGJauZ9p7VjLEEuwxjycNALy4fqYN05iOlRgufWv8bl509Uaqci1mOg+5tYKzok
	AWPYDjXIrRpkXOwxvwkEZgoAT7RdKP3E0joSIETq0Tgbbfi4JLloQSRWDN2lVa5Xru4Ot/Dmr2e
	CbeYBFBdcGjFI+wgj2bi7aYuPZe7vzBs+RxTB15PG11dZ4q65gqn3KxErTYWRB/Suwqg19ypQaf
	vC1w4FfCnAts0W35svLrmK4gMqoBwGswt0U3weUrsx7XYMJQwwTdyuma5SR0PZPOLxZM8cr3VXS
	8Lta4uGPPUNFYlaPjs5d5+5NddBO6XR4MttG7HIaM0qdo3Swpinb4x1B1RXew0e4W34K4kqn1HO
	DV5UTcwTgJzu8rUg27XXnXbUwSnTw4tm+GL70qKti3eN4+t9pm//5ty2zAvD1y/iu7vhK/sISB4
	fWNSkoIUA0+ZjQGv4HY0C4wSzHDyQxy6hw==
X-Received: by 2002:a05:6402:210d:b0:6ac:c1fc:8a98 with SMTP id 4fb4d7f45d1cf-6ba37ec77e3mr8770739a12.42.1795440968562;
        Mon, 23 Nov 2026 05:36:08 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba854bed08sm3275302a12.30.2026.11.23.05.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:36:08 -0800 (PST)
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
	llvm@lists.linux.dev,
	=?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito@redhat.com>
Subject: Re: [PATCH v6 16/43] drm/vkms: Explicitly display plane type
Date: Mon, 23 Nov 2026 14:35:48 +0100
Message-ID: <awRA6XtJ8O13Enq_@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-16-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-16-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:58PM +0100, Louis Chauvet wrote:
> Debug information are mainly read by human, so use full name instead
> of values.
> 
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 03f2d0f0e327..44ded8a86a6e 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -391,8 +391,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  
>  	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
>  		seq_puts(m, "plane:\n");
> -		seq_printf(m, "\ttype=%d\n",
> -			   vkms_config_plane_get_type(plane_cfg));
> +		seq_printf(m, "\ttype=%s\n",
> +			   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
>  	}
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> 
> -- 
> 2.56.0
>

Reviewed-by Oarora Etimis <oaroraetimis@gmail.com>
