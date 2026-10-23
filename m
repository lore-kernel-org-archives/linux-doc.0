Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737628;
	b=GorY7YizMoUQZVhQguHkSw40SIvDaXpj1J1hAHTv2jh+g6EqnX5wZE6UobANSby4Y4Bg
	 UiWMuDVtZ8PfMQnuLX7sSKIr6RgiN1OUIi7Wg0tdLnEFbOoyBJ9EwyQ6Js6dSpfZR6Xn+
	 RCX9c87cLSDIZULN+kUsRvfgU6VRuWU9oW3aDlYOpjGTXmkbb/2VSY0y1mCGJp/Fje9k8
	 /yJ0WZLKisoU9Gnl3PkekD3YT31zs+of9SoMWaTrrGB2iKZnyQLSdRfBNT5Hnntu1iM5V
	 JyDwW+oGftai6S0mAfCU8Y4sHiiTMCQQWv6XBYN/bIy0qA09GrReu1Yqpgih0pjX/Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
	b=2frEG8TFRLlvD3m3wPiUIdnTdR9sP790yzHyqHpEAEq/m/98n6iTMYLySaOshwH3eJ5f
	 1EuRc6NN8ZlgtYTGEU/iRGUABhqELEF0OR6J21/IFdh3QA6aoTHKxB+lvzZW8InSJVX1F
	 XmK5VvOW0SinAIfiKqU9xohkmKCoiRMK1hRoR9er9/jaxOwDs3367kJWYaB5yrIDtrCzk
	 1zzNL+ovC7+JoNoTKk5eCdjadEN9wZEXvSaKFbcK2KHcSHn29lgkPUYaQPiI06wTntLJT
	 yr6j1AgGcgaYO6vmuQQKGLlQjZDU3iA/IKCBEtOwbBu8AEf3B5WNTd1ua/2SNschYzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D8JttAdU;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BB560A3835
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 06:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21BB560A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D8JttAdU
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso335959f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 23:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737626; x=1793342426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
        b=D8JttAdUXWMA+C1tKErktnwsZZCy3HIUbjnaGh5X7r4L44Zk6RhL8BtNIhqkRk/36D
         IhFbmfHjF5EfcEOihgCUgXSY2+8D8PaXFo+uQ02UUPUUAw2gwAFF19tS0ABrtWDgGPoI
         HeV1vZ9M/nK1FKD6a9Az0iXO04LSuORvWofVstmgcVohmcwvPiihakPXSW2lCaaAmIrM
         44okde0ifL/bu5PZilTkScI6CcMm/uxQrgXHl4ejdowMVXSXesaaRI4KV1JkxQwpFHSe
         lbUVCuoQoCWi6cHLQQoVeoYI7ZAz+2azP2ToWhFHPNSGGzAZ6OxQW0g+zx6nEOJIwLvb
         eWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737626; x=1793342426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
        b=wxhGZMhKcQ0sl67YsfO3o24tjsuOh/hZx6yht03lF1whaYs4kpaiIg2TrzuGwmIp7w
         u7HutQlTlaGJ4TYCeamsokcxA+ULkx7cAXOu4mA/wH3tqpminLSMP7MtYYLR/kmSx2Jh
         EYNDYtRcY7njRZ1ZWlaA+6lL1siJKDkoLozvM4zUU6OFywJHiSZ0QCfhzHSC4Ci0LCZu
         p1M8WC+y4K+n7S7Yfa831DvFXcPceHdt6O9jEvihB4seDZSrTT77LT8hs3QXT9YJDUDp
         GqO5QL3jluNtyjV0EbcFaRCri24EqJQ7wwAEwdmANJoppogLWFqiW0uxfw3VM+1Z8n4o
         woBA==
X-Forwarded-Encrypted: i=1; AKwUvBzpyxbwIYinl1/PDSmygVL+6EQrMZr7A3T+7sYPGVHfPHG/fEA8i2PrUlOeWDFy5/vzNMGbaay6aFY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfez/YaPGPfi91etMq9Hhav4W6k66z/hbt2CQE+FYzh9WkYtom
	uFHQvIP83KGjJrRiin76YvYwZRMwKbGzem0hSsxp5Yw/fohriENBP+tg
X-Gm-Gg: AYBFou2rZiCdu0utI34mzhsrgy3K0LFbdKyyMusqLebrsg2s8UVRGO3ODKK5Z2ASr2n
	rWip+fu0uEjp8j2cI0IOFWAkLuC6tAU8ZPXAPW6bfPTdsL0vNsUONNk/dU8jEy4P6mW6QQs2kqv
	FNliZ/8LM90NOQKs4+8BDm7B0ZEZMtxgLeYQg6FxdNwRsbc3F2+IimBWYDaafNlvBWVboV2bVa+
	PwdqW+ei25qpb8ILckTN63YoyTL6NpHKanUTyJtCi7PycEAJjnrMsxUoR5kpSe99m2tUFN2bRB/
	P+v4a4taXCpv3yRWy0D75ZD0x8WjE46kqpI5w5q5A9fQ/W651L8clG3rkK3sWktH7X2+EBDGHSu
	LA0Ltp+Xf93Lz0FUlpo/epES2WxHvYq2wE1V0qpbTp8eK8QZEo9vq+4zyKMpfMBH5pQpHgPSADa
	pWBFIiwEPrJgonr3GABHxzQWWc1C2A18xsy+ncVxBbF/pLSN6VZL/CrZz/+0xJebE9g3n98s0NW
	Si1Q4P4XJS7UGdrJ6+cXvt+6MMMjh1pvdRJtTCgymkc4rPfW0NRoHJ1JjHvd5JM7TXkgqOKajLF
	awdXiFCiq6MYxnKck9Ht0EpJPcwP/b2yTgFIbhcPSCEs9utf+SSxrEJyvhkbWoJnUYE5AAMiun/
	IdqI=
X-Received: by 2002:a05:600c:3486:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a211eec13amr18677595e9.23.1792737626234;
        Thu, 22 Oct 2026 23:40:26 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:25 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:41 +0200
Subject: [PATCH v3 16/16] arm64: dts: ti: k3-j722s: Reference the power
 domains of the C7x timers
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-16-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

Make sure that the timers are powered up so the firmware can use them.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index 611220ff2655..7639081dc913 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -166,6 +166,14 @@ &c7x_0 {
 		 <&mailbox0_cluster2 &mbox_c7x_0_client>;
 	memory-region = <&c7x_0_dma_memory_region>,
 			<&c7x_0_memory_region>;
+	/*
+	 * Both timers on each core: core 0's firmware drives TIMER1 and core
+	 * 1's TIMER2; two entries also keep the platform bus from attaching the
+	 * domain to the K3 driver's device.
+	 */
+	power-domains = <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>,
+			<&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
+	power-domain-names = "timer1", "timer2";
 	status = "okay";
 };
 
@@ -174,5 +182,8 @@ &c7x_1 {
 		 <&mailbox0_cluster3 &mbox_c7x_1_client>;
 	memory-region = <&c7x_1_dma_memory_region>,
 			<&c7x_1_memory_region>;
+	power-domains = <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>,
+			<&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
+	power-domain-names = "timer1", "timer2";
 	status = "okay";
 };

-- 
2.54.0

