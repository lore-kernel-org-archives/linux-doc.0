Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091339;
	b=DQxnvPfGmSMifQQByeRsDli5rqj9Iq60I3h4D+RpzWEwUD0G1nYupA7BODf16EYHEMs8
	 1AORFPio5v4WmWxWmoGtI2BHjH8hq5XKMSGsd5QF6JHLxA2hcJBGMkL1aXQBkd8l2cYyO
	 60R+07/bEOFshAZkytMcZ1PCt1nDYrA4gYTzuxAMFRNPiSvfNfjG63SodwLMEy3xray7l
	 KlfiAna6zRxDwm3kKSdJ6+X3DqOOVX4vX/fBdkSYrDweYJxHF+TS7R8iKBypjvzkvs/Ah
	 od7YTQanUOtpCqN6t4PCoH1Z+YEu7asorUB+96gvU1H8674L4kDuDa8ZvrJUBqxZg6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ho9s6p1VYtelviR5lwhrV0eO33rHviRLYIfI2vUHdcc=;
	b=C3D8bfbypv4EfsdDR23/6JwcfPvvHj7V80agUos9teZ4Ho7F9JYsE2DdCCAxk6JJOFXa
	 vAZHt9E3n4KJAdK8yE/1zmjh2N2B8oRt3+kCFt0TqAhBQ1K3ctaNT4sHrYCXEik8wYN4K
	 NcfIYLx8qeNsh7UqjkRtdcC0ybKIwxoc8FOmK5aT2xAEEHZ4e9mpS4SnT0UqjdbGqOVgE
	 7ehOF8pPW/hXS2jyZ6Fg+SXuKGQ+41IB9g+voRIEcKTo5rHU4Tl2PkwtKD5ItZMCmPhBk
	 0iFJmTjk1YiFm4Mck/98RdGq7EV1dbEFysgLlATxH7TrOv/KXYnLGTGzn2Hcepw2fGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="b/So7K6S";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18F4606A31B
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 08:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C18F4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b/So7K6S
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so26231205e9.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091337; x=1793696137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ho9s6p1VYtelviR5lwhrV0eO33rHviRLYIfI2vUHdcc=;
        b=b/So7K6SlEFKsKvpppdb0hN7X3ShpUHrDkEGpm+hdOpeXxye9etaE6J4sCSorRx3kM
         czfbxf05jtinPI2aiL8CJUaJjly9emI8ccsoyRnDlB0y/utbspCSYppB1MNcHPV9jGyh
         FUJyQwkeHy7tPIlYCOPYwSwuqAcKiYnb9p8e4vO6DoqVrdAoCSc8LHdqe5Fz5/Ajdid0
         HHXRDz1KMi6u1gdWUd1XyLiRq7erydGtwKm5Bus73oAdaLIEOf6z0IMjI+GLbqBKLZzv
         /pT74T2RTSe8g24UmLOQvAI9UqpdneqrpOjG/H42u4dI8pkQIqf3tFf6jrRXs9jtgNpq
         /q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091337; x=1793696137;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ho9s6p1VYtelviR5lwhrV0eO33rHviRLYIfI2vUHdcc=;
        b=wq9dL0diiJmLoOl782Dd7wibNj0X5tah43HDr3xa3PFBOIjUcPShG/DdpftfJ9hgu3
         Ho6XfAURGGIMEUY0ubFmZyVlxEc6xsp1R0oW0dR0FD1ZUO7AKyYFmhV7t4/xOLvwZRvW
         A6nANCg+Y6ajckBwdJf7xMBFDE316CXddIg/FLDdqpB1qppK/HIVMMRlvukOcsJMk979
         pkbhV7kpSlf4sHIUY9pbhXHdZkvtYPUd0tMEqNydYTm9QkNuuatwKFGm8s1rDFCkF2Xd
         SHAOQh5IFzjI1PFT+2lDT4i0ZgiNJPYibIh41mhniMLZpjQCNboZg1+SXsDxQL7aBObM
         uVDw==
X-Forwarded-Encrypted: i=1; AKwUvBxCY5LaXZyLIGgaNRHfTc2zDksvkMempxBEq01xJjgw2zuGackKrSQi9BV3sb/E5l6mPCy52Ourpeg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCuglsMG+my7i7Q802OAupRctaYEwri/3rv5nelrFvdJQ2oLl/
	qm+ByVr39Yiv2PUbjTiSAc5cAjfrfqP6xpzMfiY+re+u+b8lRfzzqnwh
X-Gm-Gg: AYBFou2yBzIYZ8ZWQzaCp3aEvjbHsC7tvQYVfHB0ed29UfTDm1DKcKxcZ3cuUknfI6O
	oy9gHt71Bw3+AwYSqhGJ4xUL0HxeuOqjSm8ALSbxTSSwK7dVr1R1bVxB9tlKojlwtTgOJLKKHz5
	qgA7xnqlRv0XbD9QJ5VbOB32WQp/4a6G2uBEzZJ/KcCRz+v+djaFHHDGyB+S8zG3keQ59aVUSIO
	ZZD+JbyBHdWTbxKlmqzP+1c7H+SgR1GdhOvEGkJ+DcF0bbUIuZEA3yASAhWUdOE7ct1hAyepPz1
	tR3kdMxKCnlEWdwmbi6WoHFF3eOIOy2uvNex+LxR8pLyKKmmOV/kBd3gNwrCNKdqBP3j7BY5aLl
	gUnMh0kHTvMENbrklgSlWaW7d1LHJ47qP08FR11KHWWtdHW5b5U0jvd1icx8pT/pLBpCwy2M1XC
	7fPo5Q0IpR0My4d6b1WQNnMwziUVP3ZNWr2zKFSRXL6m/ShDnbxDJMkpgyyYq1sjODST2CgAMya
	2SLKYHIGpsAyZ27qJobfPCCuNTF/V7njnTlQC5QRnYG4LqK0UZABdDV7Rke4Laa9PG10APU6m80
	Bq9urDQp
X-Received: by 2002:a05:600c:3544:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4a35acc6b74mr187900455e9.34.1793091336983;
        Tue, 27 Oct 2026 01:55:36 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a09434esm249835425e9.0.2026.10.27.01.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:55:36 -0700 (PDT)
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
Subject: Re: [PATCH v5 03/13] drm: client: add splash client
Date: Tue, 27 Oct 2026 09:55:34 +0100
Message-Id: <20261027085534.1746021-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <645c1c2b-9aa8-44b4-8a67-dcd7bfbe8fbd@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-4-maximpedraza@gmail.com> <fafa7327-e624-49f2-98b2-83fd602a0ad7@suse.de> <20261021005006.2341200-2-maximpedraza@gmail.com> <645c1c2b-9aa8-44b4-8a67-dcd7bfbe8fbd@suse.de>
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

Am 23.10.26 um 13:26 schrieb Thomas Zimmermann:
> Please drop the parameters for now. If we want to give status messages
> from boot loader to kernel, we should first evaluate how to do that
> correctly.

Fair enough. They are all gone in v6: the colour and the BMP's name
are set in Kconfig only, and the patch that let the command line win
over the device tree is dropped.

> Oh, I just noticed that my comment got truncated. I meant to that "i
> should likely by unsigned int as well".

It is in v6.

> At some point I'd like to have a nice, shared drawing interface that all
> the clients can use easily.

The image is drawn in two steps in v6, as you suggested on patch 9:
the BMP into an XRGB8888 buffer, then that into the framebuffer's
format. The second step should move onto such an interface without
much change once there is one.

> It's probably ok to address things in small steps.

Thanks. v6 rebuilds the scanouts on every hotplug and keeps the old
ones on screen until the new ones are committed. I will send it
shortly.

Best regards,
Màxim
