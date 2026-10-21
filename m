Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536617;
	b=jnyL/v0DyUXS3X81NgHIHgaBQNdAYVxv940kYLu1LnT30b+FaAclQICjopMx0vxbt9+y
	 B2GoPv41GukRPK+cRkKuV48Tw2vjqVDRt5q0ZklInb0eYT3icUTExTFEZJTBD2ULPlSH1
	 hMd6lxX+wvW87X2kV+DEwTREcFaa4TKJuWJFlKoY3vtquCxFMi8nrOsMhzAzH6cz2/sFf
	 g/3PbKxehmvXpsOZRrOpIXGvpcAYpEH8+MiHBE+ZloVs9IZSbjI8aDsrinJXgCE5O2mrm
	 dDwBOaAVzV1Mf1Gdz9R2wia3L79lp4i0wdOXk5qc8h54D0f6mtkVvLbGzj82DQr6OdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ux8U6EoVJ4/TwWYPZhWrag3dDFgz75/l4fo+qRdZwqQ=;
	b=hDUvCHbzVisKH4zravudHg8+UiRnNHZH7F7VEknvz6Ia3gLZ0EABr0iot00PDhvpCNCi
	 P6+oUX0mKvnlfsdkuioBz8h8FkmkJDpwwcLmP9ggxAhLdghiHm76TxTMzhEfB+PGeJn75
	 B+oAwgAka82IS8PeMFncmZ9n/n5lC6RvQDyDjwabgRslwul9UtfLB8Q416u59cUQhZoI2
	 JqOMN2kQ+Kd236bcqWQ7iqv4hvU5J0Pf6wbzgzzz67+zqt329SquFa3AWDIYrSqhoXCZO
	 W3S7UTrIM7WmInNIkMSXJLxIFgRDes/JDghMzUMOYvh4qSXTVKcMVvDXQqT6goAa+Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xgg4e8g9;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437F4606A331
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 22:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 437F4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xgg4e8g9
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df4f540ebso39041f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 15:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536616; x=1793141416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ux8U6EoVJ4/TwWYPZhWrag3dDFgz75/l4fo+qRdZwqQ=;
        b=Xgg4e8g9l9wuL+uMK94dlj39wYD58bkokWU6IXHDrEqFjEn1wX0v4SrdzIFkhDzWZS
         8ouLkCKjKUZhm8g3VXnnGB3Etyxv8xCqkfAeJDb0dGKAZP9yAXPMjkQx3/FaJgfIyIOL
         qd5cIi57sU8hx5/MQRqevp6bGulBcsGqthmrkWG2GnRAec+eZ8oaYylyX89FagTpVYMf
         i5XxQ886ba8N3uWHz2nMLm7yRybHqEdszfjY7kRWiInnMb5VAUR3sg/ovWvtn/Ke37lG
         xdVqDCJkXAiksSuvlFGP4vkc3RX2FntaW9vBtB9eEDJQGH/8iYUwbx74DfSSLvJ4SD99
         MFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536616; x=1793141416;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux8U6EoVJ4/TwWYPZhWrag3dDFgz75/l4fo+qRdZwqQ=;
        b=ztoRJS8sVNDLrZQunN8Z/K+mCMsJnYQ1BuH7sFhB2x5Iv7YNPlLBT9GPmML20KLeiO
         ABYoJpEdCJ4d5XLtS75FA4q1R0N4bSLxKQgEiF699jntSDn/5junFQJrg3NUyiGCcntx
         kGHF2XMBMuZRZDCJd4vvKsBPQST34fpAshlyHCqEflRqxcoBTVJub7i04zdvn71ij+gU
         o9T6R5kHcGuNLWg0zigVeUy66kF62wXYC/9+YTU7dqZtJ2wELmo38KydV+iNzIpUUZ5B
         GOm1RpCIhWNpwuK/RKZdh3a8OHmhsiiKOcPcpHOzb5tTfwlCre7Kju1P8fhuv5W/JGqz
         jWhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxyExX9vLsb46lbPCX9dwMK94Qd7FHcsT/IDAOe1kJeeAmkcg6Qen2V3z8KdZYj1eJbCLpFMCPMTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpf9opJo5qkF5W9PNcPJbh1WTY0lDCMoq2nbWtyz6WngON2CBA
	zVqNoQBLj83LKiAS7nOj4HtImHYS9HdWGNjVKPWSTNPaY3uW3fJZWwfv
X-Gm-Gg: AYBFou28GwYdm6HXqzI+/7nNx/sJxUIY4C4RqGu52DAVvjvSGbCwE6iD5NPDaW0Lj6i
	Q18806it+Qn6NHWMs/ubRjWbtFZhfaPSpSvsgK1RZaJmbUP87/Lpc0+NlS4haeNGcmyKHmnO5Tq
	mLI9OeEbnaYfBw0e6SlxOOmDUWRgpB2ad7Nr8qXjdYd5N+cwhGHwSanwJuwrA9MwQE0eQQeRPP+
	OGG0e1wW+rEwrsxE3oZf2oM2oRllFGT4dEsF52M+OgwjrPtQ6EPN6dRlMj3f+Nhg7t3wVy00Sxy
	nKuaW++LxpLyoJ0/nbbHwYMKzwJWFx3G8JuawYYqInhrS5oecuUgdHyPuV00KlwV5F/eag3y1lA
	X//+0U94LNV6oYb/SxgTPgMJ1gvWwEose4x/k8+TUkEbf2h/ihqt3CMQ9H/FTGIkv9SCO4nC7BX
	wj+1Zejx3WmBKeiQ+Nj4I95eHNVxLyCxurwuLUvwfJSd0rUVHPfm/gvbRHzUb/UE7R+txlhUVHE
	mKhUT/jNt3hYc8UPIkqScLf
X-Received: by 2002:a05:600c:3d92:b0:4a1:c646:3edc with SMTP id 5b1f17b1804b1-4a1fdd0b082mr2686075e9.11.1792536615591;
        Tue, 20 Oct 2026 15:50:15 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:15 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/13] drm/client: splash: add a device tree image source
Date: Wed, 21 Oct 2026 02:50:03 +0200
Message-Id: <20261021005006.2341200-4-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <9834b569-935c-484b-befb-b913acead9c1@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-8-maximpedraza@gmail.com> <9834b569-935c-484b-befb-b913acead9c1@suse.de>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas,

Am 20.10.26 um 13:04 schrieb Thomas Zimmermann:
>> +/* Where the image comes from, in order of preference */
>> +enum drm_splash_source {
> The logic behind this enum deserves a separate patch, I think.

Agreed. In v6 a patch of its own will bring in the enum and the choice
of source for the two the client already has, the BGRT and the BMP
loaded as firmware, and the device tree patch will then only add its
entry.

Best regards,
Màxim
