Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0291738F22E
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326291; cv=none; b=do2b2PU4TiiX09wwq6h5SD3AMP/wBp3jkbMPT9IKOU679x52iXgSfkjC7zL8HUw79D0GAfaa8gaNFhQjjKmnpFkwISeKc3H5Vid/27HBGuAoXalEaG49FGxEluX3nTMp9Y8gGvC0Yb8qOyM1rKRRNrmN8FKbWJo4TTGcLmuo5dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326291; c=relaxed/simple;
	bh=724MKfbyRVpOlMBiWmZ+VnfVEBQCW/q6CKIp1BMjM/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p7cfTifub2AIcdwNWBxNxVN7YSQ5+F9JCJj/RIANhvpLZ8sIreEBikXfSGi3vX/8NXtis4ftfJBsUG1GqpCQJ6MCph9lNPfjUBpinx/B3KuRJF2rpXQ7z/JuyLSKNfkJaeVL7YFHWSqCh6+xBkiToVECeH+bjDiXIMo5mYkPk/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65089cebdb4so10730879a12.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 09:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768326288; x=1768931088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s8k0pXMV1y8Iq4ImwhXf2ahDkvy9IQZJDHOXmgWjWKM=;
        b=K6BhopK3LBZsk2w4Mplt4l0o1wQ0GKn25ZHxkup7T1fL+6YGZTVgEAtxYI7b1bRJLf
         eI3W1C45kL89xCvdyHcUKBLG8KOwMOF9VRyRr+iWWFtyH8a67HcY6qWM8hHP6SjV4BRY
         BCIFfoyEjqVsJUNl4oLiyXV25KXRbz6Qjo7K2KJOmGgACP1YVivt3a7Zj9EFUsp8AOVT
         xFDOZE7OuTxXVQfTxbyl2a2qJCwtCHbTEUEj24MJ0r5miY1gF8wFlp1h1sVzKt6yadZH
         oj0WWyAJQfiOz6UdZU4An36le8qet+XZwB9DBOGSZng3Hk90dX/j0NNEuh/J4QHFmKIG
         wfqw==
X-Forwarded-Encrypted: i=1; AJvYcCVeHiC1PMR7s1Ou095+Li0k/EWwYrBcHYzYOabF7TB3aiZ2Qi5RYgDmBv5dqNlASkQtFLcdmM73kYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5AzD9NC4zCDvsEsGDNVx5VFm9OhaXrlCbW20gjjiJJkFMrOcu
	iL3qt3tMDCUydVAO+N5VGo3g3oouDUXcFarUeuzFLlYFNluqFnIq2KSF
X-Gm-Gg: AY/fxX4kWly5U+0PG9jvaSLaXe/9RbHFcQUnSgAuhiCXLP9Pzz0R7jGnUd+EcyAZ7xp
	HE8SZJCTmLICQg4T6n3vyAE0+w91MBhWhowzEDWIhkgwtIIEXv3dPVTXBLmzGcuSAKBiFqFPn4n
	t9d6Zj9bIQFV0bi6ShL0ORY6xnxkaqSnsl+l/tTN8LTXxjGfKrLAQ8SD8IDPF4CYe2j5gWbX5hk
	nzP4TjqalUSHv7qEVylVwo0rNYtLcKoqJ92m50DRN6wRJv5iel1n97lfu8RMET0yCr3VSZflzPR
	DpQLRwNqeh5NAAYm3uW82VftwPjxU6QHyJMY8/dz7r39Q8xDmCQAsLz5aZeGKM/sB0wbkwrxZEI
	2KUer5rCNztKM3Ud1bvrlduww2q3vYr6cv5/sJJiab9CcG5TQnnKJoWCYoYcDbiPB3Mc5z/nYEa
	pZc+M7j3Vm+l/NkfAnHGBF4hJOQQjDKwMaviV/lPxDZDjRsA==
X-Google-Smtp-Source: AGHT+IE2YWlpMgqpFTSUm4yiwlEdYSG2L29zcJaQPD88F1bJ4MCCWbGfpor4ndxKjRsmJ+9m366jmQ==
X-Received: by 2002:a17:907:7282:b0:b87:892:f440 with SMTP id a640c23a62f3a-b8708930758mr832434466b.38.1768326288113;
        Tue, 13 Jan 2026 09:44:48 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm20873259a12.17.2026.01.13.09.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:44:47 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 13 Jan 2026 18:44:35 +0100
Subject: [PATCH 1/5] arm64: dts: ti: k3-j722s-ti-ipc-firmware: Add memory
 pool for DSP i/o buffers
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-thames-v1-1-99390026937c@tomeuvizoso.net>
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
In-Reply-To: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

This memory region is used by the DRM/accel driver to allocate addresses
for buffers that are used for communication with the DSP cores and for
their intermediate results.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index 3fbff927c4c08bce741555aa2753a394b751144f..b80d2a5a157ad59eaed8e57b22f1f4bce4765a85 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -42,6 +42,11 @@ c7x_0_memory_region: memory@a3100000 {
 		no-map;
 	};
 
+	c7x_iova_pool: iommu-pool@a7000000 {
+		reg = <0x00 0xa7000000 0x00 0x18200000>;
+		no-map;
+	};
+
 	c7x_1_dma_memory_region: memory@a4000000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0xa4000000 0x00 0x100000>;
@@ -151,13 +156,15 @@ &main_r5fss0_core0 {
 &c7x_0 {
 	mboxes = <&mailbox0_cluster2 &mbox_c7x_0>;
 	memory-region = <&c7x_0_dma_memory_region>,
-			<&c7x_0_memory_region>;
+			<&c7x_0_memory_region>,
+			<&c7x_iova_pool>;
 	status = "okay";
 };
 
 &c7x_1 {
 	mboxes = <&mailbox0_cluster3 &mbox_c7x_1>;
 	memory-region = <&c7x_1_dma_memory_region>,
-			<&c7x_1_memory_region>;
+			<&c7x_1_memory_region>,
+			<&c7x_iova_pool>;
 	status = "okay";
 };

-- 
2.52.0

