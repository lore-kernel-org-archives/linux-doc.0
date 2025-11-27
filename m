Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D590334C08
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764255506; cv=none; b=ma2c0m2M3txTH0pcb8uAYSN+T1LmaRP7HKA6ViSsgNBdtwL7vwF2Bkx/PdF+K0HpMh0LYJIB9E/Nu+JTS99hq5du88Wp+H41KAFUdl6PIXQHo5EoDJACFeM4znQB4hMWKqvBk5oB1cQyOnhUWyBgk9LCty2Y4bXDU5eemu0PQZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764255506; c=relaxed/simple;
	bh=EdT5rHOj/uOOThgmjWa/IHFKAYOs+mZlMeM3C+jyHaM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=txHW86loboJHhNICjliV16uC281vtEuSy2lB/xdO+GlPRjYen+I9v6xSqQo8+eLP6XBHWfu1FVr8zAQMY4Tb8EoneMs0Jor9nBZYM0k/Q56BJbUIcWVaZ9yT00ARYl9eOZtvP3UEtKmIOuUAHIt/Shc2L/HeUvAVspBUUHnTK/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHTwg0Xa; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHTwg0Xa"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so166635b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 06:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764255504; x=1764860304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bshIT03RXVpYAx2QOnAzStF6XTavPN9dCPyAspH0y8k=;
        b=cHTwg0XayGXP/cX+b7Z52pU9UljV4vwuNWArQ2Sbpx4IOEk1sszczy5msjCcnRhHNi
         04xvHkKnkAslslaao7duIis25Ia+CL8L6eXhCo3Wuif1cAjDkReDokBXk+/BIgAot/LY
         HVM0i6k6iWzp88Ap9rZy/yzworZQoZBHSjYYF0HR9sYcUcbSkRwejbiqaeNuRfgFQtyA
         KBH6eGbdcXj67T0WFq74qQAL8xCN7YGfpfJEw2u7CE+h/44BfslCyjoU248NzmOoWfPi
         CId19FpK888wwtxzs+fIDieVWDAxSKQLEcEiR/8wQWKrQJWc5Ow6IAtA/6egL2KQ8ITI
         BWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764255504; x=1764860304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bshIT03RXVpYAx2QOnAzStF6XTavPN9dCPyAspH0y8k=;
        b=wOnwhjP9rPlcGi79Y1vb8JGx3QbBlC9KY58STZG7ZNaLq633cc+QnhlPuT2UtVW9wa
         yxKKaG6x+yrkxIEsF5JYyPuLK7Hrvtb+jD2h0kEjfbRHyNHJ8+CU+wDlq/IQFLTgpioN
         OGVXgYdOqvRP2botrYpzmMpNxfd6ztipf/Xk087Dk6Ci2UW3l9In6hZGoQe6ztWmu2+N
         s7qQcEt/KU46YDQ2041pRKPT6zbe5XZQmGIu84JWHBD1Nli2yftkhJ87NkXso0E9s4RV
         xmQXvpDFWRC6By6W7Z9cpwVlokWcY5nqgfpMn9PD4PxMex92wNcDgchyxmUyUagnwURc
         JIbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfu4GokKUkNWd2Gg2vXtPA0w7FoviNwGmTV7M0DIrbfBnjCsj27L7NpX1o2YsZOoDog4NXNb7TPmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsPV+lYOyyFMIYXCsdXNJ6/k2aueIIsdptJIYmaXRx9d/hsyEQ
	x8gtL5G+dRqVnBDrVb4F2SELFWl8ocUhzR4UDdu7+ygxMA+ep9uZhpLm
X-Gm-Gg: ASbGncv85xPRKJcWKfRHNK0p4vDgG/88LPBvDIoFP89zIOjFd8iXwpfCkV80ZK2cUOR
	HiyL+acdmgF6VPPlABJ/++pOUnOnfpvj9rMLi+p7Sx/LCADMvPRubl0WrRtBnxxAzXZlEF7H2hN
	SzvB7oz+n9HqGKckKaX+VLd/0V9+MabbfysgSavOS45mL1frhRW8AosTIUoTaJeUlzHVAK0t9tU
	GcDh7N/uFZzl+L23w+JvdQcA0iYG5j99ZXYxsyY8NBME+hsbiz5mTWd3w8RIryvzF20buSNKpXO
	MMYqH6dH54y4L953DG5olECWt0/FPRatcKHUC+NtqyRIDHf/03iUmwZSaZQXfkKlsFhXJHuBvK1
	Dixt86LuSUf40hBPnTKKlUgAF9hlDpKe//K2Z4n4tp9PYyJ2UAAg9eLSDC8zQmygLBgIkX1wmKG
	62wdq6AFcsq/i8TMc3uPWq5g==
X-Google-Smtp-Source: AGHT+IEKx5CCbH38MnNhrI6IDEmd+w6puHRkJx1sqX503mnKJpgOPtQnM7atYk4oRY+4tTRV0hoQpA==
X-Received: by 2002:a05:6a00:2e0f:b0:7ab:3454:6f2b with SMTP id d2e1a72fcca58-7c58e113fc4mr24347692b3a.19.1764255503666;
        Thu, 27 Nov 2025 06:58:23 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f177566sm2205249b3a.51.2025.11.27.06.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 06:58:22 -0800 (PST)
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
Date: Thu, 27 Nov 2025 21:58:17 +0700
Message-Id: <20251127145817.172871-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251127113213.GI3070764@google.com>
References: <20251127113213.GI3070764@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Nov 2025, Lee Jones wrote:

> On Wed, 26 Nov 2025, Nam Tran wrote:
> 
> > On Tue, 25 Nov 2025, Lee Jones wrote:
> > 
> > > > +static ssize_t parse_drive_mode(struct lp5812_chip *chip, const char *str)
> > > > +{
> > > > +	int i;
> > > > +
> > > > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = false;
> > > > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = false;
> > > > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = false;
> > > > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = false;
> > > > +
> > > > +	if (sysfs_streq(str, LP5812_MODE_DIRECT_NAME)) {
> > > > +		chip->u_drive_mode.s_drive_mode.led_mode = LP5812_MODE_DIRECT_VALUE;
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	for (i = 0; i < ARRAY_SIZE(chip_mode_map); i++) {
> > > > +		if (!sysfs_streq(str, chip_mode_map[i].mode_name))
> > > > +			continue;
> > > > +
> > > > +		chip->u_drive_mode.s_drive_mode.led_mode = chip_mode_map[i].mode;
> > > > +		chip->u_scan_order.s_scan_order.scan_order_0 = chip_mode_map[i].scan_order_0;
> > > > +		chip->u_scan_order.s_scan_order.scan_order_1 = chip_mode_map[i].scan_order_1;
> > > > +		chip->u_scan_order.s_scan_order.scan_order_2 = chip_mode_map[i].scan_order_2;
> > > > +		chip->u_scan_order.s_scan_order.scan_order_3 = chip_mode_map[i].scan_order_3;
> > > 
> > > Where are all of these used?
> > 
> > These fields are part of unions (u_drive_mode and u_scan_order).
> > The bitfields are packed into drive_mode_val and scan_order_val, which are
> > written to DEV_CONFIG1 and DEV_CONFIG2 in lp5812_set_drive_mode_scan_order().
> 
> Sure, but where.  What line of code?

These fields are used in lp5812_set_drive_mode_scan_order() when writing the
packed register values

	val = chip->u_drive_mode.drive_mode_val;
	ret = lp5812_write(chip, LP5812_DEV_CONFIG1, val);
	if (ret)
		return ret;

	val = chip->u_scan_order.scan_order_val;
	ret = lp5812_write(chip, LP5812_DEV_CONFIG2, val);

This is where the bitfields set in parse_drive_mode() are used.

Best regards,
Nam Tran
