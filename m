Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F61B23E325
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 20:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776370804; cv=none; b=Dz9d+2ts7aDuI3vaMUrDKlgr1z+d0PV0ttgxKCZ1QVghUtJ3vDEj2aLOM3RWr00BD27A2dubN1uZYY5ulfLpdP9eMAgw633vFOUYuLZSZxKWFOKGQQ7murgsimNlGuD5p5TDY6ehijqL3rmRbh1EiVuP6MLuFhnAJ00ep8hITYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776370804; c=relaxed/simple;
	bh=qznDUZF4ymL51U10pRa61DaVkLGHZutq7Ba8beA/2rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CRLfRDnDpjtKMdkqOWVrbTc/ZA+zVpcQSWG4uTMZVReaAy6lljZJOxQ3I7Nw78oMQxljq2+qjdmgaaHMcUkczaVaadcyvzB26D9pRkkBZg9gGyF3QWutpMG3iRBxVNmkGIlGnTwXMz6fql0mF82WZPfkkmQU9nG+iK77jPez7nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty+F0I2T; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty+F0I2T"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfd832155so5834335f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 13:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370792; x=1776975592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8h2Y0LqQPmXTQq5JIHTyL05LcABjHyNOjfeQXRiytA=;
        b=Ty+F0I2THuBt28kwuJO87ifq4wXoGmjYySh9vCsAjRVL19/LGjGZsmVBhYTjwzdyvD
         ziguHjLM+m9qA0qsdgSIp90oSsmRJQ0cMhD3qixS8VO/0gkqJlxnlcfMiwW1sf8BUCmc
         dR2vnkXbPFf0pufUtNxLIzjUHxXDT8dM5Rq0SxLMv2kb/SE3l72b2UDF2irtLS/0QZty
         qYaMo7YCFNeWkS/dghYNx9qulbQYdaU2b2Z8fwK7lv8u3HT/GkZZ5sQT3sAeqW/YIruo
         98CNTMLPi8wQF+YHlCB7T/IyeLUAxgysh1xa/ukZnrKZnmUSfiMRHgV1dHK4XMJBb74V
         ZW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370792; x=1776975592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v8h2Y0LqQPmXTQq5JIHTyL05LcABjHyNOjfeQXRiytA=;
        b=QBiScEyYzAM+bMbc9nmMXJuEp6wqd9T3di1xeXtrSGq+lQ1pY7T+2fvQKj3rVSLxLZ
         HiG+6DXvSofUlOdLBd2tvMo4ED6cCPDlcTGgqqK30xUUxhhzF7Qwg0En/78IB03lnP7t
         IzaxuwP6/uizPvsvoeRsIqWQFDlUANZYY1h2X2kQGhGjR8T2+/L1ZEFR8/1fBT8Zd+XD
         FvlxphFO4DXlsbnizflD0ZEDVvZ0ize9XCNIwt0kUQBwrRVzJimYHBlNWxqCWISAOV0u
         vjxl879j+4phlMhXM+lyTOxDbC1xdsvQAFa2pReF6YMMpHTyZ2Qz+OLJ6wKvwNLU2uWh
         FHkA==
X-Gm-Message-State: AOJu0Yyo/uRjbBQuXgqorn6QyIAK2Ie1UOBYYAVdLrwFgP6t8gLKYve/
	VcFy2BzQk8Vt6NBtKoff0g6mFUFRzwjd4gRoQug2zofs1Cgfw2UBGrpv
X-Gm-Gg: AeBDieszUDEJCI/KG0f0QbKqzhr1OaM8W5NYTTfpUTbkBMQtwiuwXjS26DIFmqVetWp
	CKeJM+PHovYIFZFpDh8CysqygmS9HJtrRmGGiNIOhOblTiiDTZoi0VUj9R9K/t4OrUf453l9Pne
	NpmX3DlpYoazCb6dD89xUzp8bRi/1sF9e1DizEu1FM4SGdqfka/JdHKNhf/zXG/JGG13bFTqn0T
	jVe64auOC0E32WhFZ3ACCG//m4lP5o3imEZg97OVgRzkRfgwTByzaOqsNv3AJsNBab/Lu/pZMA1
	kjqXOAgYxRqS82TLd9eWY0DKDOa+xeWucy8vm5WshwSHQ/FUCTBJrjiDRk/fChl2LpGDuIPak4a
	ptS/1rOjCI6rQQxCP+YFeIjSfGjQTF/jKpoqMvGDk2FkiF+Rgz5YmfabJUzlv1XnknXnQweqPpp
	s9cJqSilD166jC8UhC/DVqircLnI6afNA3AQXjlyte14UGfA==
X-Received: by 2002:a05:6000:2507:b0:43f:dd91:b022 with SMTP id ffacd0b85a97d-43fe15921d9mr1107123f8f.35.1776370792338;
        Thu, 16 Apr 2026 13:19:52 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:19:51 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 16 Apr 2026 23:19:13 +0300
Subject: [PATCH v4 5/8] ARM: dts: Add an armv7 timer for zx297520v3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-send-v4-5-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
In-Reply-To: <20260416-send-v4-0-e19d02b944ec@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=qznDUZF4ymL51U10pRa61DaVkLGHZutq7Ba8beA/2rQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URLmC/Ml0WI6oXBseumjwXn28obZZCF4EpdN
 YrIUFZfFdCJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFESxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLhmQ//UVrPeabRAXHovU4jP/ngUiwqsT0Mhf0
 iBG/XcA4xed8cfu1/ySQqe+/PWLyX6Cipm7fzVo64+FethSj9Izuj6UJLgcMhiWGudtOt48RqtR
 1uwTO9iw20JHJaoZ8+bfhpYXVIEP+5DwPvZgVnHvhyv48I9tcDq0n+cZ1/QQFEKmMB2r+T+ti0j
 I/Cum4GyJNkgVjB+s9uyDPjDLxhprXBiNyTPuRjjgr/go24CU9z6KbDtIRcF+Jk2DI+s85qiV+8
 pg/t6wnkPSH1Bun+K0gdz/hG+lqZxBlxLXYSGCpE9sTQe6ANvEk8zblgqtyfOwobHn66F6r6Oj4
 XHoxuxicDDhRxV+G9QFRZ2PSfISr+F8kzXxFnsLYmWs46rtdLzgekmb+lGlAwaDpv7E7O5RaRcN
 fF8d4Zd8Ozn3Q6d5cGmdV9Y1WU80kl6PdQ455AxH6Oyh3Pz24bHiTAxi1L3qXGK68r/4LTgWYj3
 LItQiRqLd8M5sl4c6OqTE9gI1g7XqCUPyco3cNHGZS1f4bLcSHklxj0fSMpEh7XEaqD6OqU/g3C
 YhP8RQzokDwE0Nsao1Gx5X+38CZptNXSg8bOSsCM8erfIRLS6Bk5BuLXadRJ8fxES01bOkh6Jh4
 6XVyBsq25YqVCPC3g8LoSU3YWxL9XL5e7EtrA7cR1uWEtgbBAagk=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The stock kernel does not use this timer, but it seems to work fine. The
board has other board-specific timers that would need a driver and I see
no reason to bother with them since the arm standard timer works.

The caveat is the non-standard GIC setup needed to handle the timer's
level-low PPI. This is the responsibility of the boot loader and
documented in Documentation/arch/arm/zte/zx297520v3.rst.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index d6c71d52b26c..ecd07f3fb8b3 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -24,6 +24,15 @@ soc {
 		interrupt-parent = <&gic>;
 		ranges;
 
+		/* The GIC has a non-standard way of configuring ints between level-low/level
+		 * high or rising edge/falling edge at 0xf2202070 and onwards. See AP_INT_MODE_BASE
+		 * and AP_PPI_MODE_REG in the ZTE kernel, although the offsets in the kernel source
+		 * seem wrong.
+		 *
+		 * Everything defaults to active-high/rising edge, but the timer is active-low. We
+		 * currently rely on the boot loader to change timer IRQs to active-low for us for
+		 * now.
+		 */
 		gic: interrupt-controller@f2000000 {
 			compatible = "arm,gic-v3";
 			interrupt-controller;
@@ -33,5 +42,20 @@ gic: interrupt-controller@f2000000 {
 			reg = <0xf2000000 0x10000>,
 			      <0xf2040000 0x20000>;
 		};
+
+		timer {
+			compatible = "arm,armv7-timer";
+			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			clock-frequency = <26000000>;
+			interrupt-parent = <&gic>;
+			/* I don't think uboot sets CNTVOFF and the stock kernel doesn't use the
+			 * arm timer at all. Since this is a single CPU system I don't think it
+			 * really matters that the offset is random though.
+			 */
+			arm,cpu-registers-not-fw-configured;
+		};
 	};
 };

-- 
2.52.0

