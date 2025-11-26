Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AF833BBAB
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172832; cv=none; b=Vaiv7a7o5RcgCW1XTW6rkRkfSPZ79GoAAHoCrY7T66AE98dTS1J91DPeZMghx62XrXeKi36/eM9uejmURoag5zJHSZeurDoi+krrQ0cUB898w1xrsD2Sh6wJySqa6D5oEwbtYAlrDEGkcNY6LzOyVNUiXRjGIQaOcHt9u+a3bGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172832; c=relaxed/simple;
	bh=WBJ9UwUNrgy/X0b0BvnOXQpDRGyYIy7WU+2Gj+p774c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gaRjkeTmy7EP4OkimDvYd9Kyu0P7/mVmgepopSCOFm2K70l/BVmXSt4HL4w3ujDXDYQgrn9cGjpRgDC8l9R1kPtFoS9fATjnX/FVOipVmXhStHHScsgK9yBK0wvtdJ3Zy5Y+4kv4FqHrY29JXtfM2NkRbD/i8XOQAZroKp5SYTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GznyddyK; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GznyddyK"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297e239baecso8048405ad.1
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 08:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764172831; x=1764777631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZ9M6k/4ewqJkE2TX87HwTQsuW0EN1M63J7M16fS/j8=;
        b=GznyddyKpf8VEbt0x7coIKsZpiCgiyOza3ZG0WDpm3vX4OlWsyrTmM5SKHqAuS4UYz
         n7ypeJ0k6VsF3SxHF/VSEBykvU82dWT7h0LDSbjekroXMkqyUKeHI/hbvDpTzc5EH/x+
         5JwmQ6p/nn1JsN8tqBTx9jQFnu9RaSil8FV65Alz5KnFDxjf6h1C9Bt9B6/I6+P8zcJg
         mHq+ckc26vQki1ZAMEdh5Wg9iIHjhMPrPvbWoQwLwvKe5x0v32SUUFqQEI9TBtcLaeEk
         S+ZYHo0XPxBKP/yZ7iBmpQL/n7jq81Quoeq+xb6EB49q4GKsAg/yClET1L1bAZB14Psr
         o/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172831; x=1764777631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rZ9M6k/4ewqJkE2TX87HwTQsuW0EN1M63J7M16fS/j8=;
        b=jqe11v3vRVDtO3DEH3MRG86DYqGV1cSXLzrQWVfHeTvknE1ZFBH/9OFN25EDqiJ22o
         tQCMiDef4IL4cflz73m9O8YpnchnwiBzXdyMrtXS50+TXzGIhxEjUDjWTy8TKjhNckhD
         Pbqso7Hm+VqTnDS4vMvRxxGX59GCHunVBoefbnerO+BNUeM+5EsC05SrW9qIXZPJKChP
         8No6Sn+eXxYCMc+bgpyuWUCci+SPoU32PQkQpISqWRqdDzk3OaOqflCaEpMgRxetaWjI
         iLgr4YUzse7hqyK3859kC7nkl8QhlpxxM8hUYBnfrZo3aAC3AlRQyHX86494AlGSDCJ0
         C9jA==
X-Forwarded-Encrypted: i=1; AJvYcCW34ypWh26XUCbAxjQtQAU2n7HlCYxIGwT9D0Y5kq6URD43NHueJ8fAnu/4A57O8h5lBfYzQwyi61w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzh0KbuHdQMYCG9xRh1+YDC8IlwXD2N3uMLiqVeoSaQPVpXq5m
	KbjjXx9zFUV1lYpnJeDpMp2FouE0znpkaYPWO3UdvFMjOwLAHmjRxawi
X-Gm-Gg: ASbGncurpAa5IRxlY+0eTldSY1eLeuv10GmBr/6mdaD1Kyx9yCQkvWPmj+DpHGNsPD4
	rkG07yi+mFs1dIvi7cG5kRnub13xA0f23OQhmS85qS+8wammOmXlAHoC6X8uN4vF5cMnmRahl+0
	oqfSTxILaM9YBHfn7oJo6vuHGOv9xvaYrw1rPlgLgMcWBlperNe+SwH0KudVDf2UR412hlFRIsh
	k284WdjJCO9G5dhuckAx/Ir/tBONQhmhFGB1+I/hgkczxZM51QHZgLKrRKRbVNKgw6k1Ybuw3kq
	4DzWfbW/cbmeUVppwR1OijpOFgFts8bxwn6nTy2/UNiOZCtgUfGOjOP34p5AvRl0zqL0CaE+LQb
	ccKTC7pL93xqBOjY5CUp1uJlQovqWTiIN+kh8ehpYsKLeIEospvIKARJOgnQo4kbCKxmx9NXw9N
	OiKc5NEpZ3rzVz59WUHt9Uvg==
X-Google-Smtp-Source: AGHT+IHW4vl9EURMb8YJrD3dHKPOSvMXx6AkbqAkBsNYyyUqCnQUvs3T4dn6AYYdWnbh0jPv+aNGrQ==
X-Received: by 2002:a17:903:384f:b0:297:f527:885f with SMTP id d9443c01a7336-29b5df697dfmr276743665ad.0.1764172830405;
        Wed, 26 Nov 2025 08:00:30 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13a865sm203447045ad.33.2025.11.26.08.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:00:29 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: gregkh@linuxfoundation.org,
	pavel@kernel.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v18 2/3] leds: add basic support for TI/National Semiconductor LP5812 LED Driver
Date: Wed, 26 Nov 2025 23:00:24 +0700
Message-Id: <20251126160024.141129-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251125134836.GC1127788@google.com>
References: <20251125134836.GC1127788@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Nov 2025, Lee Jones wrote:

> > +static ssize_t parse_drive_mode(struct lp5812_chip *chip, const char *str)
> > +{
> > +	int i;
> > +
> > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = false;
> > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = false;
> > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = false;
> > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = false;
> > +
> > +	if (sysfs_streq(str, LP5812_MODE_DIRECT_NAME)) {
> > +		chip->u_drive_mode.s_drive_mode.led_mode = LP5812_MODE_DIRECT_VALUE;
> > +		return 0;
> > +	}
> > +
> > +	for (i = 0; i < ARRAY_SIZE(chip_mode_map); i++) {
> > +		if (!sysfs_streq(str, chip_mode_map[i].mode_name))
> > +			continue;
> > +
> > +		chip->u_drive_mode.s_drive_mode.led_mode = chip_mode_map[i].mode;
> > +		chip->u_scan_order.s_scan_order.scan_order_0 = chip_mode_map[i].scan_order_0;
> > +		chip->u_scan_order.s_scan_order.scan_order_1 = chip_mode_map[i].scan_order_1;
> > +		chip->u_scan_order.s_scan_order.scan_order_2 = chip_mode_map[i].scan_order_2;
> > +		chip->u_scan_order.s_scan_order.scan_order_3 = chip_mode_map[i].scan_order_3;
> 
> Where are all of these used?

These fields are part of unions (u_drive_mode and u_scan_order).
The bitfields are packed into drive_mode_val and scan_order_val, which are
written to DEV_CONFIG1 and DEV_CONFIG2 in lp5812_set_drive_mode_scan_order().

> [...]
> 
> > +union u_scan_order {
> 
> What is 'u'?

The u_* and s_* prefixes were originally meant to indicate union/struct, but they are not idiomatic.
I will rename it to
        union lp5812_scan_order {
            struct {
                u8 order0:2;
                u8 order1:2;
                u8 order2:2;
                u8 order3:2;
            } bits;
            u8 val;
        };
and do the same for u_drive_mode.

Thanks for reviewing.

Best regards,
Nam Tran
