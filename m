Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750342;
	b=WzzPYQbXEaPtZ/uxG0W1EdjbcPnLhG/ze/OYIpXLAprXGz8CNXLYRo+7UIM+fDI6IGzV
	 CH7EQYOLWiw8fmpUF7lJwHqKMeAw4cwHBK73JwAGY9UFP/Fot4ME9Oh/LubI6wlM2KJXT
	 EjeCVkVqJxBhxpiEiGRgoUHqd1skk2itAEk0FHKzNKkaQMv+3Pujx/d3DjKaXW7ck4Pa8
	 yt+7AgspPU2Ivtf4KG7rR/FpLIWDgga5mEstFVzzE9IjCAwXy5uIkFe/koJJumzeAUTDX
	 CEgflLniJwAR0j2Q+g2zHVKx+h6zvZIfSiwLCDjQS9OqvaNF3NnwBlXKJ8lCfUdye2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=is7L+B2RN443PYwwoWeq+UVhGmTjVPpzuTGcDZVXmgU=;
	b=UFdqfMZhmRUQOu4VbK+eIiRgwxydwAIym7axuTGw2fIW2IMcnEEx31bQxGl6IDkE2kRm
	 yO1SumAzmnqaoDM/vaD6Bb4BehQnmFC98G/us0mZeaQYaxN1wDOTkdUGaYttSZUIsN5Ig
	 O45l+b2KcPWviotIkVrmtjTa+083NC22bj6fNbGHG6fHViNkCTNJ2ll5iwiv4k2gGQ18c
	 PRNI99Gv3hQEUui+uB/JNPBOssg/Pue4TXSgZUqjJwqa3h7FVP4v1Zvi2J9J37jOyO1R1
	 HYjwB8iSs6TK/2X1LMLfd68CjuuYfdWjN0EvMnaFAX//Mlx8iJTvSYHxoWsxbjKYX8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TXZQvtD7;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F58F606A327
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F58F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TXZQvtD7
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso7721695e9.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792750336; x=1793355136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=is7L+B2RN443PYwwoWeq+UVhGmTjVPpzuTGcDZVXmgU=;
        b=TXZQvtD7jcqOHabVOR/WQ+U/XG+v8vjWM/Qmsl/q6MzNZD7uqig8eGptjZOesICJ+P
         ScR9lJVpLDAQrN6bNGDoIzP2zfnTu0iNIW4E5ihRHRNcomwDgzhBfltCJErnLQgizFnP
         S00llh1bjJPqLGcEzS6ZFocGV5WDpL85Le2xfNFTfrCNSstwYtpe0mbeJ7qhc2DHuvOL
         Bcjx2MtcWUMSzpiVgxQRtlhn14/FrOMDJtRIiMOO9EZURIdpIZTJR+t7d2Y9KJAc7J6f
         3cj1tMnVc+viMiKK80xqhvsvmQcodKjtbWVwwE2w7iHG+6KbtBrtw84P6UpgGVAD0/Er
         MGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750336; x=1793355136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=is7L+B2RN443PYwwoWeq+UVhGmTjVPpzuTGcDZVXmgU=;
        b=c+DKy5v9MiUSzbGHxbhdkML6W7YvYTFqd+rip4iZFjF8hxKUBKo2jUQmptQHGOgbgM
         6SpmB1LZrUnLx6gkTPg+AU9AfGubhtt161m2V1glAGk4fSWC5FWQlfaIMWoV807Lt/0b
         mgrehY2DpAp0zjwSwbn6KXzDFyTpn8Qul+CWVGXLvwh4xvnZdhzA4eJvW732fWevH3YC
         t+hem44Ikp982DeWjLb1QDczaewBLNbgx+q78MJwcY5OfU3G6Ciz+GyD6baGlVQIW5A5
         CvMYEQwNkQQBOII4t0CKf8EbgqesdfE6OiGki9xiHkAujqEzwD50sv/RGGpf9dCZINvR
         vUaA==
X-Forwarded-Encrypted: i=1; AKwUvBxoHeOo6ng+q2/V0XClHsyHcUJC5ISyLf1HKFRjOPahywKMqHu/eknVPbj68hLYNxKXHqUK02R15x0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKvYk+6upYVv2VhNozNkmzHsFGjLjWNi8Xyo4PFkBo7QoTcFhk
	x0jAWpZkFAHD7C/WySJZTzwlSRpaTOqXL/v8blH9/q5jPRmG9AlHd++MFCRWx/vG7cY=
X-Gm-Gg: AYBFou2nMc2INg24PAQ+0XhHnWWqRAeN066i/8l0EyFRyZWkyjgiEAELfNUEgf2Iu1/
	kDk+9zsN/pLFCLqrS6AaPxZW6iAzaucVTXPRb21mE3hsthRLP1XplpMqVixwSH9Dl5U5kvC3zFB
	qZcxvyDeOXwyvJ2jWaScmZoY0evYzy4r8gN+hDfrKmNf4fFon4qq6OP35lAX1+8dHob6ftYKRz5
	YhZ+gFfHrWdP+zhONxngtxulyz7u6319cONCPY57tFmJx4msKFGjGPK2TFjnoXoVJMYIXmol84v
	LKQDtV7HWyuAqiNxbn86SEmUkGuUsYOl85L90nLsjwBPdlLpiGFD5uxkelMYcCyjHtGvRye3FBf
	NoG0mrqc8EJAbRAalBLKw2bBRF8s9k5zr3CL49SG0ZHRSy797NbNUg5ljiKygqdNQuFoi4zYLLw
	jBBqC2yOhgSP8h1eID5Eov/xjXMx4bBla2K8twwipvhSrH4jtugMkXX1EyzD1DHc2HQvff+0D3o
	ByIHehHpHrSqZEqzGgvm9HqeBb5bW5nhr9I2t1qDQmyHSxJHPCcpuT0OXz/qxvtpyR6R2Aax2w/
X-Received: by 2002:a05:600c:3514:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a211ed7602mr26707515e9.26.1792750335754;
        Fri, 23 Oct 2026 03:12:15 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211b89beasm57982975e9.5.2026.10.23.03.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:12:15 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH RFC 4/4] arm64: dts: broadcom: bcm2712-rpi-5-b: Add RP1 fan tachometer node
Date: Fri, 23 Oct 2026 12:15:57 +0200
Message-ID: <f00b7ccef721c7120ac10a9507ab211773787aeb.1792748691.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1792748690.git.andrea.porta@suse.com>
References: <cover.1792748690.git.andrea.porta@suse.com>
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

Add the hwmon fan node for the Raspberry Pi 5 to expose the cooling fan
speed (RPM) to userspace.

The fan tachometer is managed internally by the RP1 PWM controller.
This node uses the 'raspberrypi,pwm-tachometer' property to link the
rp1-fan hwmon driver to the existing RP1 PWM controller, enabling
RPM reporting via sysfs.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 748be8f1ee9e2..9bc6d0e9da1b5 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -16,6 +16,11 @@ / {
 	aliases {
 		ethernet0 = &rp1_eth;
 	};
+
+	fan-tach {
+		compatible = "raspberrypi,rp1-fan";
+		raspberrypi,pwm-tachometer = <&rp1_pwm1>;
+	};
 };
 
 &pcie2 {
-- 
2.35.3

