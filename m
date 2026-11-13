Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536466;
	b=IU3mGViJb/8aPfHWQ+LpY8s51ON/nTFbwq9AKJmTUXv3PabCHaVY33aDPY0rz7NbqSjm
	 jqdYJwu0mvj1XRwxeaitwTm/xUt8GkC1WjaPjcGCUkHlUYUifCT6D/ZUotwK+lrXWki3p
	 146eGIG+i5OTMBxHZNrEloO6FqN28UTRv8chxdTpj6CKlVXWsr6YSMpDoUqoA7Spdbudx
	 Cvtqxy6k7tGtBVmfxvJdiuNTIh2/1LK3Y8XzrviTt4oC+7IP1IskJnion1DzY0EI/4m1b
	 /pe0luuryZU6e8mk5beNGJTZyB/4t1X6iyp40uigekFg17vSFHCy2o+fG2OZ08b9ksg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536466;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Uei3X7eaYXoUGpiETn67YwHGgpXCnW4kjNL27gbEkSI=;
	b=sojSIV1JsCJ9ZLYbf71uSJEPNuBeGotlM2Ilb078egbwy9wrDKWORmi+TpqIRgwlG0IJ
	 h0hz8iXX9tvccbvzUJpBp3bH3DiXU0o38aXsnN+TCZ5FfyYjAKDUNdLzaIvXoHfYWFi0a
	 J5Q4ZfIYA0fQaR3TnPJBxch1Sq5gKSrV/1tdvxjvq2/2+ne8XSGJFcvaV9oglFaEQSum5
	 pyTTXJ5jtn04UUgIDTSJpjjeYjEp7i3IzPSxuk9f6nfJYgkYJK6tUkE0XWDc7Q6ubB/gB
	 vLOmbd8uyFmRNcNWgpEB2KGGO8MDAozNnjKYaj7LOcWNcfy29qUJNn2GgaqrxrZhVfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B83606A327
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 02:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B83606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67990a45e02so449022d50.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 18:21:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536464; x=1795141264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uei3X7eaYXoUGpiETn67YwHGgpXCnW4kjNL27gbEkSI=;
        b=JEc/Q2jedKeY5ZlgKTYvM2/EBYSYOklATiTgnDLQP+f6RH/HLu8r0gOoJhbkejGJr3
         XLmlTz8HdvrDCWIaPRE1Vx1yJGLXtMsTpJQe7w1A3BPAdiImMC43VZ/q6oxjHYooniMS
         fE/zOYWTYxqpklXP7Mdqpjd2FtnxLSh2UqtU3FMRS3uaoQfG+OExusYcXygCuYWmnuMr
         wLp1jOD0qaXuvq4hUqjnF5BWOIVCSoDoMnaoOgo/H9emIBjkTz8X/M1INqa6uHw29ZFf
         f5kVkDyoRywaSzn2+CvwfQonhieK0WLGLu0KLnLW6QCMsqSBorOHfZ7BZndMDzBzduV2
         TUCQ==
X-Forwarded-Encrypted: i=1; AL+hErE41FwrCyDoQUaX9l31ZwuaxC0V9UqRslYe08//h5HLR745JehyYsNd/rdbi3vcCks4NqDCUIz7iWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B030MymSeSt+7NNtpG1Adtd6UhZopZMO7ncXwYo1JjuQybJjV
	bIg/01TT8I5GSBwJcZQJ29gIu6kfaH6NTj/zVIC1nmVlclJa0OeGExyc
X-Gm-Gg: AYBFou0bVNXl7gkkM10wiV2ONJ/Qyx/1iKmRw5nLduTfgIStuZVmXE56mzYV2jL6OsY
	MPSuhSOo6UL2Uvps1ayaVjGIPLPX/ZLgT0SEfWA0r5qR6cuaOzVntaWbAndW+SIRijbgRG1pVBP
	HQ7Jovbt3zXQoWBJX2HmglyRr+JsY90+DstY767TvTNy33QSc/uc5D3PeXmSjTWitucTcxdI1ru
	40GE0KaXBIlAMT2ZVulWHGRqyJ5hzyvllEu8ESx80v0P4UbvncZAlMgRCdCC7+8zztWhVJ0yfEm
	SSI7iGgxpenZlzlvy7YF+i3s837l5I8Zn1BFU3OkWIM0c3v+8H9XuSFCnIk2Y14T2IpzfOePdqD
	9E3HD9UGk5T4Wle4W3mWa5kFoANZJ6agwAeU0W3G+K72ROGndq3hsaLoIQTuB77R6UiLsCGZyPM
	m9KxgosmnjpGYmoTBGMntD/fLrOY7CPVSLxZvyg2HBlmNVrXAyzCKCMn+x4jomlwIerGx1ZNooE
	adclFKJIPPefdmqyn/XRBnS4cJR3nPDUF1mfJioLNmUlO2dF0LPBp1IIqQnFGtOJdXRVgpyQ0Ij
	xdSTnD8GyJ0ahnTINEYV4YSdqbbFip3JmSpfr5c+UYTHHK0zL7YkVMYqryIkLDpMnbkmfbK+9Jx
	8JWt0h2nwz0X+DYkei8yuB6ubqU63PS5g
X-Received: by 2002:a05:690e:168d:b0:67b:ffed:e1c9 with SMTP id 956f58d0204a3-67d896a37b2mr912238d50.37.1794536464486;
        Thu, 12 Nov 2026 18:21:04 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a4339c3sm890660d50.3.2026.11.12.18.21.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 18:21:04 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: operatingsystemsdepression@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com,
	christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com,
	imagination@lists.freedesktop.org,
	frank.binns@imgtec.com,
	matthew.brost@intel.com,
	dakr@kernel.org,
	phasta@kernel.org,
	sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joseph Telaak <joseph@telaak.dev>
Subject: Re: [PATCH RFC 02/13] drm/gma500: Publish the Cedarview SGX as an auxiliary device
Date: Thu, 12 Nov 2026 21:20:41 -0500
Message-ID: <20261113022041.74295-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CAFGNeagBWpdG7a9A-c6WRiPsd4oPXcWai9o=xnkZDyY+axcniw@mail.gmail.com>
References: <CAFGNeagBWpdG7a9A-c6WRiPsd4oPXcWai9o=xnkZDyY+axcniw@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 12, 2026 at 11:08 PM Gabriel Gama wrote:
> Hi Joseph, I noticed that gma_sgx_set_irq_handler() updates sgx_data
> before publishing the new handler pointer.
> During unregister, could an in-flight IRQ still be using the previous
> handler while sgx_data is being changed?
> Would it make sense to clear the handler first, call
> synchronize_irq(), and only then clear sgx_data?

Yes, good catch. On unregister the data was cleared before the handler,
so a handler already running on another CPU could see NULL. For v2 it
does what you describe: the handler is cleared first, then
synchronize_irq(), and only then sgx_data. On register, sgx_data is set
before the handler is published, with a release/acquire pair against
the IRQ handler.

> Otherwise, the auxiliary-device approach looks interesting, especially
> for keeping the display and render responsibilities separate

Thanks, that was the main reason for it: gma500 keeps the display, and
the GPU driver doesn't need to know anything about it. The same SGX
cores sit next to quite different display hardware (gma500 on
Cedarview, simpledrm on the CE5300, omapdrm on OMAP3), so keeping the
render driver independent of the display side lets one driver cover
all of them.

Joseph
