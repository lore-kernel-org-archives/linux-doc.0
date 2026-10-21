Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536612;
	b=o47f/8zdVUnfsiHZScBseMFxpK1cgBIfnVVB0wFa9kN6g4a+biTq6kifl+V+jF7vlY7k
	 NMe0KomhbJe0oyrDuU2hEuMjvk8XGgHru+eLFrrSTibplON5blqfmsRiwalx6cTcwAqop
	 6pgXBGPVkbTxffEkBeXqxYz18zmTqnb3P7ldF3Fvztm9BJJeR0rfKXRdtXzLVzvv1HrS4
	 G3T6JzY82H7z3mF6M9tcHvRZ/yopoLewMoiOe+cJ+5GjZr3l98bpZgAT2g8DoH/W8xDkO
	 LIz2TGp+jy9YRAU0Z+MNB2Ie8W2H24KYrnKlO6AWLaD2CJ1mDwenBtsJ2R/d0bsjm1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fTuhXEhm4uQNNaPcVdFpwpAupMps3PVyoq78rLHpKEo=;
	b=PJz6H+auYS2HDRZSRVuyVHaxrUlT6c3/25HmFEC6+6BFaB1CET4sXH7/ycbHMJ59xmZA
	 h385/vFimkvxBMjD+gfF7/kA41tFkxZQ/gqcUnoTssm0jQQrzDyjSiJz4p3vcu5MJIeJM
	 SlXvA46vDo7YrcAy8JT7Bg4rj5f27SU+813NHGzYONQ4kxRmMp41ktNpZ6ZETyqzKB19v
	 o4nc5tcA7LmRJZqKZU0o0JeyxQQ/hm0161ONVHzKdwQNKw11NV8AwMFytYZ0GGSV84uQz
	 nJ0z8bX220koNVX8gu9ozfbz5viky04gR3HDE4BFE5/jS2wC4isjT3uhwCULb/uL/BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oMGtStFf;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CDB606A31E
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 22:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4CDB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oMGtStFf
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956869750eso568985e9.2
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 15:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536610; x=1793141410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fTuhXEhm4uQNNaPcVdFpwpAupMps3PVyoq78rLHpKEo=;
        b=oMGtStFfhGsL+mBjIIOXSVYiVGOUixhfa02bRsi991TkgCyk0GIcCTt75OwAWONrt3
         XyxUVpHQ6hS5K1bIte6yGRRfPJrwKq/BdNHY4/MKwW98pomtO8eR32TcUmg5eRs3vT0j
         4vfj4Qati0/E+qbSKz2TDX3+AUdBzroKUb9HFKxqMw8GIyTxIZfMV18nnUmzSg5hXoWw
         By4JWTOxBRV/qp54N78Use+YIBtMTyBYI2FcGlVPxD5AjWw10AE1hZ7OeZPBF9JSBynK
         LIMboApvT8TOGuMsl/r9aUKdQNAAF7XKW/RY7q74qIswfthHsRlqDyb2ZzjsqPp/ZYRr
         s8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536610; x=1793141410;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTuhXEhm4uQNNaPcVdFpwpAupMps3PVyoq78rLHpKEo=;
        b=MSTQ3GeXBzkDagAEisw/7wnor3Taw6Z19CYnehGWF8iHCD3klTmfTBYyTgqsksXu+L
         SFy6hQx0EbXIEJd8OOkofsF3wSRTGRlflYs2q+1OxhRXMtH8JV98jtdHwV5UHzXi2S0e
         Hsk5pL5f8sPsIEBeSpswJo4meXr27U9XAn2qQNmnjkxlvMqmCsJ20QNnlWjOWW3q6PfX
         IIES6xlXEKaUtPuk9T5UMXSZMamGOWgDWQ2TtZNKqoNKhmay2E3y7Tx4kL1+UthsZ1UG
         bvN0uPHrKnkjKV+CqEFPZT5T4f1ImvN3SqBatcnDKiRmrKF+H9bLNFNslys2yWAN52XT
         fTqA==
X-Forwarded-Encrypted: i=1; AKwUvBwMea1IqLZxXQOQeNlS5DiB6ZtbafGk4pp8w6Uji6uFK5RTT/q/cD0sjS/3ISjNKXJ1QZOuHtY6Etw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvXvG3SJPSQdKCxdNqeXrj6/t3QipL9zlc3oQHRdIPRdGzRUFI
	v4wcnHD7JOIVM4Hmb5O+fqJqiVdDsySTV7YVG/zdciOOA4mJ32qstt6Z
X-Gm-Gg: AYBFou2fbWnQarbR3fDuCfE8iiG7A1m0fDavaPXlT+qMHPTQgX7doP25yTqKnoy1TjI
	kYbxLlt8pwkNeyIpyvdZlElS/cX2wNVwvcMTnTcQ6Iso+/KPCyzGpez0e8RRUk7c6DqNhHWXV5P
	3Q6hNH+mgra3FfceYgaFE7x4u21AdpIc5orwt0VKL+KIJt2Y/dIhKAmAEGbWpn7qbLw3C4FAWkQ
	XWJEeSyS61S01rYICNNgmPm+IEaNml3s7nVwcqJ02u/YbB5NLzZmBnPyvGbjHcHmXQZWFBsUdUG
	Km/Jx8L3qSu3Xp3+IP66p6CE6kFV1M1QDY3ySPb93M8gBkX55OgdpMxRmc0zEkRlZxaRlo/Q8SK
	DBM3mJKgs/GzC0JQgXkiscxxG+OobHd5lGBtzOfttmrmWw91ucPIw/UV+u5dY2tTzC63ZkBa7Ff
	yrrHzsNNs5PVREF/kNNLocyaHjh2MloAPnbW20LmqVwGr78l0TD3iIYiB9Buda6uepVAGvax9PH
	+E8/hkl+laPPryVSc2Ho5h+
X-Received: by 2002:a05:600d:82c1:b0:4a1:811c:8069 with SMTP id 5b1f17b1804b1-4a1fdd20c2amr2908965e9.8.1792536609700;
        Tue, 20 Oct 2026 15:50:09 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:09 -0700 (PDT)
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
Subject: Re: [PATCH v5 02/13] efi: bgrt: add accessors for the boot graphics
Date: Wed, 21 Oct 2026 02:50:00 +0200
Message-Id: <20261021005006.2341200-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <1d3aecdb-2537-4f08-a4d2-22c81ebaca03@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-3-maximpedraza@gmail.com> <1d3aecdb-2537-4f08-a4d2-22c81ebaca03@suse.de>
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

Am 20.10.26 um 11:13 schrieb Thomas Zimmermann:
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks! One change since v5, so you know before I carry the tag:
efi_bgrt_has_image() now also checks that the image address, a u64 in
the table, fits in phys_addr_t. On 32-bit kernels without PAE an image
above 4 GiB would otherwise be reported as there, and
efi_bgrt_image_address() would return the truncated address. I'll keep
your Reviewed-by unless you object.

Best regards,
Màxim
