Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73353191CC
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 18:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758564828; cv=none; b=anI8zFb1Pu2HvjApJqNH68GLkHkImUH/vkv6jF0rx/bQd/w78zs4OaCO1XRcSYR/K3RMYlXynyrq2yPygbbXBs2OEC9jF42lpxxcKTLskwz2Dr92Plo47J/qlpkGJyvdKCZ9RXjzBZsUbBsdRw2ploNO4TLOl0tvQwxDqEOojcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758564828; c=relaxed/simple;
	bh=MUr2xBlFaMHPYimzwjsX+HB1YVfDMLkYxct4Q1cAHTk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=row8dcKjOgoF/J67lhVaumYTw+828/fjSSvKhhAENIVld6d+w/nt0F8fgBMzNSUJoZ+FgRRxqVk3Rb0fagQAhzp+2TI19SEnYGMM7uon9EGd6I0Fzm2VgJF4FzCk9TXa1nwUpuizAK0n9Hc3nEovI9AevTgXPhmaGk4kzJ+BfN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JiDKUjPk; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JiDKUjPk"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b551350adfaso3643887a12.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 11:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758564825; x=1759169625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JS3gwnWxYRXNP0WueyxHPt/KOeWuxiqPFIg5DnQSPG4=;
        b=JiDKUjPkVvjxeVHS8s0C0Ts5pxmKI9oF/eG50sPwr/9kCUo1PhMktQ4Opk9LoxsDFE
         CwaDl9fy94yWNYYJhiPXyqu4umUdtcn1P3Qs3T+XmqA7s2hkmy8CmjdaIa9Wj7jtXkAc
         sPKvTSucj57Vm2uAvoy/UfXUoYP0smfwWwCystLDDUJZg5IFBr69znBlsW8gd759S14s
         Ppo99nkcMwDq2fYbC+P6du9ZUW8mO84aZtjiEi4w/BW9p4MuhaUZF6jh5rkd+72Zv+aD
         Y57CXTc4z8WyQ/NX6mA5JDnHpN4rbHpd94Nah6JdEmzZSFvLp3zc50+ct3zwe1DYXbxf
         3T+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758564825; x=1759169625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JS3gwnWxYRXNP0WueyxHPt/KOeWuxiqPFIg5DnQSPG4=;
        b=dce0jBQl9XvyeVqzRWSEaAlM6B7mwIjJwmkyBtrHPbakfEiVf/s111//gNg038JR2S
         FCTxtPTpARCvEecb4f4xHzPKD3j1qsHdPK/dW5nQtpsp+gZFkAMVq0WYZ6Th4kyQFx5T
         +PUGLa/NVh6VZlmoSkrcvIM8GDxD+Jkn3RtKD0n8S+kGKmgLPYbasichwg6BOc0jqVN0
         TS/3Wtm7CPHDEC5AlQUadnQgeGrf1Wvk8pDQq1E2jUfGbPhGvZwB3J7hqkNZmVBmGeuM
         ERSF+ejaiHpmcta9qFAVs14Bxst0qsh7IOxgZcqCuhhLb+gM03trkJMneAqPC6sFXg8U
         BSfw==
X-Forwarded-Encrypted: i=1; AJvYcCUZIAHHy1LwFOGUqXLJzbyi/gI/AN/bQ2OZXG9JpYC24mlPj0HuPvDElHspXBH3Q3m7Ak44YaP5gog=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE1Y+byNlGmAN3lOsydtDOA+htmcxujFprnkdr135+DqlVMqMX
	OTM07DJl8CJDjGh4XFZlvyPLT0OUm0e8ETfMZAFYVKd/+9fNUDSN+ewQ
X-Gm-Gg: ASbGnctgqxhCTrkR0ENYTqhfT+yUiKqjf9CaaMJHd/9ZqrI89ZRbEsPH5+fz68sEOQ8
	QeGclEjrmZiKiR5xuc1nA68n5hrLNXZ9nWz+5WTVM96BrON8JgJPrn6ihAIVDzTajn8SEIdM4/x
	ydAaosdxjIjM55Zp+XjCU7MEVFstexEoLv8xwQxh3PVp9AYQJDkMgk/WN+NlclBU4qtrQJcI2zr
	ImLDQ3D8V4UMaitgRrNAkoIMVZauHRRYAXNdIFdRouyBCVirAHgYTSt2H4i7Lgljv18knBsERoS
	L5+SAs2Jv4cUbGnXIBaJM1laEiQLVRy9WcX4CWCmrGOMesHP92Z9LOtM0RTcQHnZCQQpT7KbBP0
	g+698gEQ/+tsiqGZ7iU9CZpgC1omXcFz4
X-Google-Smtp-Source: AGHT+IGeNEigtJ3sWUCGc2Q8fUfKmvK70W4opDCk6DT+2YmvQ55xAMWPms12V8aYXXk3JCi8mg/0Ow==
X-Received: by 2002:a17:90b:2d85:b0:329:ca48:7090 with SMTP id 98e67ed59e1d1-3309838e108mr17580167a91.37.1758564825015;
        Mon, 22 Sep 2025 11:13:45 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.118.25.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33060828031sm13917767a91.26.2025.09.22.11.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 11:13:44 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: gregkh@linuxfoundation.org
Cc: lee@kernel.org,
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
Subject: Re: [PATCH v14 0/4] leds: add new LED driver for TI LP5812
Date: Tue, 23 Sep 2025 01:13:41 +0700
Message-Id: <20250922181341.10761-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2025091113-mournful-smirk-8e03@gregkh>
References: <2025091113-mournful-smirk-8e03@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 11 Sep 2025, Greg KH wrote:

> On Sun, Sep 07, 2025 at 11:09:40PM +0700, Nam Tran wrote:
> > This patch series adds initial support for the TI LP5812,
> > a 4x3 matrix RGB LED driver with autonomous engine control.
> > This version provides a minimal, clean implementation focused
> > on core functionality only. The goal is to upstream a solid
> > foundation, with the expectation that additional features can
> > be added incrementally in future patches.
> > 
> > The driver integrates with the LED multicolor framework and
> > supports a set of basic sysfs interfaces for LED control and
> > chip management.
> > 
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> 
> The sysfs api is really odd here.  WHy not do the same thing as this
> other controller recently submitted does:
> 	https://lore.kernel.org/r/20250911-v6-14-topic-ti-lp5860-v3-0-390738ef9d71@pengutronix.de

Thank you for the feedback!
I agree that consistency is important, and I've reviewed the patch you referenced.

I also checked the LP5860 datasheet and noticed that its driver exposes sysfs entries
for configuring registers like `R_current_set`, `G_current_set`, and `B_current_set`.
Similarly, the LP5812 requires register-level configuration for operation.

In my driver, I've implemented the following sysfs attributes:
- '/sys/bus/i2c/devices/.../lp5812_chip_setup/dev_config' - Configures drive mode and
scan order (Dev_Config_1 and Dev_Config_2 registers).
- '/sys/bus/i2c/devices/.../lp5812_chip_setup/sw_reset' - Triggers a software reset of
the device (Reset register).
- '/sys/bus/i2c/devices/.../lp5812_chip_setup/fault_clear' - Clears fault status
(Fault_Clear register).
- '/sys/class/leds/led_<id>/activate' - Activate or deactivate the specified LED channel
in runtime (led_en_1, led_en_2 registers).
- '/sys/class/leds/led_<id>/led_current' - To change DC/PWM current level of each led
(Manual_DC_xx and Manual_PWM_xx registers).
- '/sys/class/leds/led_<id>/max_current' - To show max current setting (Dev_Config_0 register).
- '/sys/class/leds/led_<id>/lod_lsd' - To read lod, lsd status of each LED
(LOD_Status_0, LOD_Status_1, LSD_Status_0, LSD_Status_1 registers).

These attributes map directly to LP5812 registers. I’ve kept the interface minimal and
focused only on essential functionality needed to operate the device.

If any of these attributes seem unconventional or redundant, I’d appreciate clarification
so I can revise accordingly.

> but better yet, why does this need to be a kernel driver at all?  Why
> can't you just control this directly from userspace with a program
> there?

LP5812 is controlled via I2C, and its register map is non-trivial. Moving control to userspace
would require users to manually handle I2C transactions and understand the register layout,
which is error-prone and not user-friendly.

Moreover, the driver integrates with the LED multicolor framework, allowing standardized control
via existing userspace tools. This abstraction is difficult to achieve reliably from userspace alone.

> For USB, we generally do not allow these types of crazy apis to be added
> to the kernel when controlling the device can be done from userspace.  I
> think the same thing can happen here too, right?

USB devices benefit from standardized descriptors and interfaces, which reduce the need for custom
sysfs APIs. In contrast, LP5812 has no such standard interface, and some customization is necessary.

I’m open to improving the sysfs interface or moving parts to another method if that’s more appropriate.
Please let me know which specific changes you’d recommend.

For completeness, I considered these methods:
- sysfs: Recommended and standard for LED drivers.
- i2c-tools: Not recommended, intended for development/debug only.
- ioctl: Not recommended for new LED drivers.
- debugfs: For debugging only.
- Direct I2C register access: Requires users to know the register map and protocol.

Thanks again for the review!

Best regards,
Nam Tran
