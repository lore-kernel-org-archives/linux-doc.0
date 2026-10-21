Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536615;
	b=0W/kQFgrYtAqz/pcbqJTltyYWjzlwjj/r5O11XiyhAsX9yRb+l7Nwl0DfoDNMlBcG5DJ
	 W8yRk9JMovNL9IdkF2pb4DcWv++hcV8WVEX6X0C4spbJx3pk6M1cP7Jb083AO1/6J6PCc
	 pr/pIJCc/rwNCV8qMjJJWmPLiOrwM2G0G6uFPvcjhRmFLYEinHd1GBMJRKOU1qoVqtstv
	 gQYHpsT+0KzdDLIRxZ6rD1GYfNXQHq12XBdbyoX3UUKxrrkxvk5j7xGeZaHrChVbSybdF
	 zzN5TTkUFozW7+EgHGJjYUOZDQLmLT+YLLl4V6cpjh4sXp8ZctgIu9eV/POe+W4EMcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f0vC8nTatz/VfjL47eh+tNgjT4mJh4syjFrv8ctbkr8=;
	b=QoIw0F9hgB3BoxbZqyFApZRaNkbihXve3mN6+7oSA8qvRcNHnrZuS/mf08uFs6XFGOiY
	 iendK8bEppVNa16nBqCYX1f1JVEP41rX7Qv57mheVhYNq21yEoWGfqlZn6gKfl7ieH17H
	 T5DXEgew/3Jk1lWN9qHCdprg+Iim2cJEEkqgdBYy4vWSn2k906e80IKSRGO3+QY/Nxvsb
	 9j/jw5UYNu5+xQM69ysb6KJPzySMaWRp3Qg6xD0bUJ3pj4xkyEhRDogwfYk/jHWSDL+fB
	 SPKs/oRkSU9WMS0QcMpUOKmrrHLPZp+IuTUkmxDp4Sgen3gF7xNtiJKQQDuz03hAKRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ngk54pFO;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F38760A261B
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 22:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F38760A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ngk54pFO
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so573005e9.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 15:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536614; x=1793141414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f0vC8nTatz/VfjL47eh+tNgjT4mJh4syjFrv8ctbkr8=;
        b=ngk54pFOLWmfm72DmBQbR5ZFvu/68E0HsE/I5p7qjLhDU68EtREzXUUkOe1KdJtoJF
         CO8uj2ApOXtd4ggTGsgelwDkrse81BoWG6/B8j7zHrKz29Y2YVJtiMU8XsQ1V0rAN5ED
         74xyNd7xAR5wHmIF/hEm+j2q+/US/PxSOYg26nizg/eq0n0Qf+hcc88A4bVej//jOAhU
         JIN+3z8//MTou4wGoqrqTvmO519jPRA4rOt6hJlK3RntWR9pJpMGmWggWPbEV0Prwgh9
         KdomzFgOtRvIUay295YGeWpwSdA91x8jdDi30+Wild3BZCh6AF/DiaeZ2Opb6ZO5IZd4
         mehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536614; x=1793141414;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0vC8nTatz/VfjL47eh+tNgjT4mJh4syjFrv8ctbkr8=;
        b=CCyXyKqqdn5WnPn90/gz2G2OCeeND4pdq4DezRevtK+WYOryR0016/+E4bCfr3cXEu
         24wAypZpnT8HipidXloHkrPHDKvlkcDhxHgl7Myr4MTBzV4wfLIetjDUwPJAWnim8e92
         Ik1HrJNPWqMx/TMD9nVXhQeZvDiSH5CDVY+/o5JfT5Sft4P78kBo8d2jLS/qmeJHu0L/
         nlrS5Po8H61GlO3fNGTzk2Fp+I5EsjvGG7Jgu96VEe360z8t55F2EmxNJOAkjwShLF6H
         hwA4/OrYfvE09+WPa6JXdNCYxQGM3r7BAr2ztgc6c5Vi0tkuYKsVgak03NYh7Lc2X8BF
         ZGiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQZUzWpwqDurY4BXypVOy2R4SAoWcXp1++cApVnTYuJnp1kAwQSCNHbv2rbsZuuN5rbjdBUK/FEdM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcv5stmGiNPe/etmXGVpzIj8lz50IAGZcLAXiAr/ShVFR2DCD2
	4C9CyyWMlZekRsDAIr3GHZoNwDdklc1ZPgKTaB29z3ya1LrJHCB8KLh4
X-Gm-Gg: AYBFou0LjT6tD9Ys+b1onG4KyzNDQW/L220UDxoylYf+suYZU6ehMA1Mb4oLw1nvr3F
	cYv5eK+5V9I7hpPTuvn1FX9LOco/tBXXWlQvgt1tZ9tODqNrF8b7djjLD0+tpfFYWlD++gg5lZT
	yy5Er/DdpqD7TDDWOdblL4RJCRILbyrgO0eIvvDT9+4iR9Ef6Db4OHlGOgau/1fWQop3pp4Mj0D
	XDN5RnN29mxQ4i4XIXw/sOdLxqUcFLPWEQMG70ecl7zW/V4MT+Xz3tOw//IWoqPxRcmfOZScdfJ
	N3IZ2egTNBcW+w2AfF81MVUZu+C5RE6YIa81IUI5jYYeltkPtJIFGijX4Yn4CcPrclA2Vn+F7QT
	28cQlBLKhMyTmBpfrhdsVBlu9Pk43TUOd0Uiqhc4OsXUIBbl6MEf+AohKeCKvSH1mrjugNP0BiR
	/OlNdNj5O48nSsvDDHo0EWnqoCRwdBVfCPHJ1RWyrdcP5JSg2sCUdrseL4LFD7RW/Imzq3uVQ7W
	sC17me3PkIAYnGIzujDs6F0ng==
X-Received: by 2002:a05:600c:a0b:b0:4a1:7bae:d80a with SMTP id 5b1f17b1804b1-4a1fdd245bcmr2271955e9.9.1792536613728;
        Tue, 20 Oct 2026 15:50:13 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:13 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: Re: [PATCH v5 06/13] dt-bindings: display: add a boot logo node under /chosen
Date: Wed, 21 Oct 2026 02:50:02 +0200
Message-Id: <20261021005006.2341200-3-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261020164651.GA4017884-robh@kernel.org>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-7-maximpedraza@gmail.com> <20261020164651.GA4017884-robh@kernel.org>
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

Hi Rob,

On Tue, Oct 20, 2026 at 11:46:51AM -0500, Rob Herring wrote:
>> +  image:
> A bit too generic for me. How about logo-image for consistency.

Sure, logo-image it is, in line with logo-position and logo-offset.

> This property is already defined in panel-common.yaml, so you need a ref
> to it. You probably don't want everything from there, so just 'rotation:
> true' here. Though keeping the description here is probably worthwhile.

OK, v6 will reference panel-common.yaml and list 'rotation: true',
keeping the description, as it turns the image rather than describe
how a panel is mounted.

Thanks,
Màxim
