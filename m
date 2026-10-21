Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536621;
	b=LnQ/FYGGW3KjiqcYb8uwyMPEID/vLjXl2fFO3Htx/DUMjULccHiuGvm0ujQRcavH6kZu
	 m2cA6PqhcFQQ/gmsgSJBEf5iMUzf2g+T1o4cFpL0JEh0u2RY6Li2jRNw2XJcc2Hm1vQdK
	 Xn80smT/+3Ug5cuxTSgVxUjx1VABZS35RGrXHUlOf0BG4el48qBedXqdkuOUV/GJXNYJs
	 Lkr9SPSy/q2u30r7PAI3eLZBS8aM5wlFPh4u2Hl5oIh/kgLANCP3OPEUuSFkVF8/0zQaD
	 mrbb3hh0BPDGDPR6J1nfzhsRMIpRqjl27B/jWjRAP8pjEbdpIbVYnPnXe1Ww0tDmx9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RGix8b+4rEGPx1vlWyRM//jxrhYNPw7VId0i+fn4vP0=;
	b=U55fKVTz7JT0JwT05qejhYC9q11+ItjG7KtxUFmN9rFgBdPkXf5sc5Noc1oMBqnIhITz
	 gdrN07F8cNE+vX1reofmlE6OjQy8SkERv/GmGnLUPcv4flchVm73uh4lb8sVwXhctd6v0
	 CXdPTPn3YPDZ1yiqFL/urpqKaZmoiqWlKVsD2gTDjB7hWgxLIqsAWo2ehvU9ohdtPKHW/
	 mzNCkrHPc5t5Gra2HfyQ50iEVLX49cDwqh5jUHvpcaaHpz1BYSR7OSEgkqRXlB6YG5a5F
	 H+33whIhCDMZxLB0UKbMCb8TBxPRC3uT++4fEwG7oFtIRkhjq4SPxKiKA6vDQcbElFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSWdVIml;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7178D60A3810
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 22:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7178D60A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSWdVIml
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so703615e9.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 15:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536620; x=1793141420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RGix8b+4rEGPx1vlWyRM//jxrhYNPw7VId0i+fn4vP0=;
        b=XSWdVImlnN+o8KKG+n8FdqZKnJyuYzxymErOsSI8I+mbWj1WKZ6nzidsmjFU9HSrR+
         vqgDumIJaVanwgvDvCQZpDc1+Q+1Yu/ZQdO1TGAiSn7zcJ/EIXO9TapoqBvCQUeYh55v
         WMTSIU2/6hQWr/tKz6eoFUaAalDBOhpk+YSsWqwpACa/+ZoegBs50VCzkKidvsFNvIFA
         8b8xC9l3L0kISRpEfSfybZGw+SDyya9x5tRhhllwkNu3mXQxPtTTTCyYvUWq8HNKxR4k
         1BIjXTFJWfVyxgol7fAchZytRgSIxAlcYIjRkPsePysYOFssUU9c1tnMeQqsBVaXZh7F
         zevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536620; x=1793141420;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGix8b+4rEGPx1vlWyRM//jxrhYNPw7VId0i+fn4vP0=;
        b=PDfr8U8LDZ9oDEbHmDgNG60dcQFbuOqocIFnk6CSaTF2hTccIDQ+ft5IT88oQbtyP/
         GrPW/PVxUbX48GteJbuSSUmzifznKX62C0SCx/3q6K+oKy+KDRn24K4KNGwxcVrxvhHB
         G080c+rnnmIJAENV1/b8KFU15tPBeu9y3SjOtBZ+5/d4sr2LJBLdQyBiPRk0ALOz9AwF
         tmdhfD51YDsF35R6oEB6Y7g30t5GDK4FRVDhDuvSXGFj+1Xq1nRVrNMrzfDoaao+3RvF
         d3cg0EGgVP5SRM224seYXwl89KyGS5EgUCT17cOH4TsVBaLwKCXp4L/kg5emyWcf6929
         TGQQ==
X-Forwarded-Encrypted: i=1; AKwUvByN+lEAs48D9fLtwgnPaaKokmoHeZfzu2pAAtmd0WFjxRygQc7ZK980PmonDwZ7Cf1Rk5ep08Ewn44=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuS3W0LTZTV7iK5UNRtNv0mIw41dCsMnvxq7SmwSYMHrk4b0+6
	k2Go5UmJh+qwreLZ2T7VNQ7Wt4Gdu1jBn0bsRf4HUicuvOsB5Nbq1bII
X-Gm-Gg: AYBFou3NmPH7wGqNp4QDblVWZhApg6qE8MpQNLiopfczVSEws56PrZA75UpYL9JzKKL
	uulENyK/4L6b0We/zBT3vJp74rJnPd7nUZp3yXEuhRkpRLA6Z7uvwPo3YzfI+yzGfQAztQtSeZz
	lkmQrg8UEhXKGUKekFVleXVv1OOOxACoqRNqYp5puNrJkjfR/u1A+fi5b2CRPA2cWKvH293i9As
	vL3GP/+4K7xRPiBNQhDZsYrTHRfFaUl6f3RaXy3dGIdQzj1m/yyqj6EKWihgf0lHPGQJpSRwS68
	11BQwqqve2GFLMg3C4IJys94UkfLmz3XbYyRLfrGkEbbUpGIZIu86btF7ytMy5Te0aSV/Z1okxH
	IXrqVgb7NXYabWoYxsoqvfDK8IhVYXRbi6u7330AOhUAwYT6I5xzW5dZjMCIhPnSOTE0x4EsuvI
	FAlZF7a1agkkJOlIOj/PuckI/cJ8FyygO9r6b5/9oSF3TYXYktVVDP8xYafaICEuKVadr8y7PDM
	E3qGPFe6TN/SEeDCGYyoUkcaA==
X-Received: by 2002:a05:600c:3b01:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4a1fdb04f88mr2783945e9.13.1792536619814;
        Tue, 20 Oct 2026 15:50:19 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:19 -0700 (PDT)
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
Subject: Re: [PATCH v5 10/13] drm/client: splash: take the background colour from the image source
Date: Wed, 21 Oct 2026 02:50:05 +0200
Message-Id: <20261021005006.2341200-6-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <ad6a04b7-cf57-4b22-9c22-85a61af29f1f@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-11-maximpedraza@gmail.com> <ad6a04b7-cf57-4b22-9c22-85a61af29f1f@suse.de>
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

Am 20.10.26 um 13:19 schrieb Thomas Zimmermann:
> Please see my earlier comment in module parameters.

I answered on patch 3: I would like to keep splash_color as an override
for one boot, for a bootloader that wants to show a boot state, with
the default from Kconfig or the device tree. If you still prefer none,
v6 takes the colour from the node or from Kconfig only.

Best regards,
Màxim
