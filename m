Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604254;
	b=F3oHiOwCbkyFitYF1KKNz+7gWXGQRZsM5hvzlfnGIxdUiYdcaA8kjbOiuTnMnRKAG2/0
	 BTOzS+kK2kS10RagF73OmgnusOwXxJQohi6lNSyWMNcKDOcZS49e7wXzC5FyxkgZePYf3
	 yRz1ID9Pr61UQJ+KtGZAb6UZypXcobjH2cTrsa7cyN280G8kked1WFXRa+Dv8p8xunz8C
	 aFmizoQn6yMUvpfUaWV4YPbfBIx/jmGXjK8kuoD7eWmjQTo2LzApvE3xg/N3Olw4TtfIk
	 kiJIqNmxt/nWt6778SDEbt81lP/DOUvh07jVS1tWiGyqoofqqeB3KSr/+WRUJ3CgxoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604254;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GN0ortW4nQvstQDFiIJ5PqM8QgjEi3y1N04o3CsU+ao=;
	b=saQp26qtGGmQUpEeethCft4mKc74/3LDFwXkoOJ5ADO/VW+ZUuoXfdZmvyxnqMOSh6w2
	 F3FkJFx2ZEit9H6CIKYuKytBSaJsDM2Kj97ieAE4Mh5l/Mx7p4mIUMSO4TM3e183S4HjI
	 TeYQmmGqQSvz8s45m0VKVgx/O/hMH2j6Dzh9DAAkWa6rEnTSKbKUqR0eSIEaMZy1cBPvs
	 /bIrBJnCaHztD1MhSxmH5psIn0+aJU/mF43PrfmM9z7a9/3rqvhXK954oWxltgz4c8tQL
	 uZ/jbcOSPhY3S6tk3hFEnO8cICXxWDlT3/lwSnaTQCtkFzjYy4vPY1gQWXh0s0VbF7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D6A606A333
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 21:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D6A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67583c777abso1600398d50.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 13:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604253; x=1795209053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GN0ortW4nQvstQDFiIJ5PqM8QgjEi3y1N04o3CsU+ao=;
        b=0a4+vCdEQN+O/XhtdoeTOZ+1hUWA2LJ2SWeumxY1lcEkx23SSZqVS1cMTu8tw2h+Rb
         B8gji1rEtf4p5vjaIkV52RRjf9MLsr8tYz1vhliQL2nClvGqQuIPoLeIzkmmfHz0BlQa
         Ti06lm2OlbEAX7sP9o/rfm1SwtJTfqOXkqbB0XX52bgItgRe2IXdRMubaZ//DpFY/oOQ
         WhosniaKGn3X0ZEsuu7GyzhPRZJpTJ30rRP8YSWT7JCcFpw6HOf5iwW+voVGUV0A1YMW
         3AeOS2YiHoKdeWrpj/s/d5QkcKxqsDTPpEMMUygjiru0rzVAQqeTt2BKn6yUZQFIMdaY
         CxYg==
X-Forwarded-Encrypted: i=1; AL+hErGtmtjc9MSn22gLKePnnUaVtC0TdHE/EgJOtan94Vx4guzRV2ajTyUHe3jn/7oHuKz9vTgc+uSKu8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9njNaL4tZYjKVVwnvInFFvoZ5+Az4IxwKjZNtj4eTyGDaH+O72
	6VRaFmp3VafnPoqNfzHSDXYYuXlEqBUCxpbzmAgW5P7ReFnnu9aAcntR
X-Gm-Gg: AYBFou15fGyHifHY3lmCp5TAGg9WweGiOXGHYqQMh0jtKbln9L2t7X4SMkkBVPrOjXP
	HKAaweW2d7FL2DPhZmoCbThwH8akdR21QzYejNIcbr6P4fm75p1EVvDEqhao2X7Qtm0XJPyQrEf
	616d87p4lQPV0MI2TKb43bhITGANaxjorRDLUGagNhT9Z1fDutQWTFmfuOgI303L6oRtFL3bB/F
	usZ9oI+J8XfqGTMrpyNGzfEpASBlKDE4CRvpZFI4t2V3qECQ6yeHU8jeUoMkJR8Go0pf04F9uuK
	scsq30M5mZoh6bhsEfsdlbkcNiGZ5OfP4MQ/oGQSW5V9v2avSJ5aBGbBTscuPi+kuce8TO31sqd
	CRuS07navPRIqqNcM8318mMud7Dm5BU/L3Swk1jov63SmhtmiQ8d0uPrm4clAweyuYk+kpJc6CS
	kUh3jird+Di0YtIpslmREa/8i4a4i87ezWbqR6lZEmqIS3cXJOKI4MN2lsOhLHftZ17vZIDnyQ2
	WPiwyPZvj0SeIRn9mhbHp06h9LOPPi7Y2Uto6vDx7Gfl2B/qomWuMuwr3r5PdX8ie7vQKUQLWeI
	SlQ6t/7VwRCR/OX/QsvOwhzR5mnXkOvdR8Lr9qVHiY+X9eyWXEy6MQKcL8Dgyyj1uNWEhLUBp62
	NWGNJqUFUn/O4wzk4FOtuR8Vf1rICSPGwWSt2q9nyTFkn4zSkAZbA
X-Received: by 2002:a05:690e:190d:b0:67b:fc94:86d4 with SMTP id 956f58d0204a3-67c78c3c92emr4305281d50.8.1794604253368;
        Fri, 13 Nov 2026 13:10:53 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a64b04bsm3050965d50.23.2026.11.13.13.10.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Nov 2026 13:10:52 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: dri-devel@lists.freedesktop.org
Cc: patrik.r.jakobsson@gmail.com,
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
	operatingsystemsdepression@gmail.com,
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
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH RFC 00/13] drm/powervr_sgx: Add a DRM driver for PowerVR SGX5xx GPUs
Date: Fri, 13 Nov 2026 16:10:51 -0500
Message-ID: <20261113211051.88798-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
References: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
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

The Mesa side of this was declined, so I'm withdrawing this series.
The driver will stay out of tree. Thanks to everyone who took the time
to review it.

Joseph
