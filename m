Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338034;
	b=D1dvDFQkuokOrvafc2bzqLJY9HRqTrtxZOrm1cnJQmzH3LSBZIQbWCjbw1OoHLbK3Wu5
	 6Bu7Wmzg37CxBH7zZHgzcqyFImdzbeRVvShhZyYgD6Vnh9qICCVkN0Iq0mWMRvecBaOw9
	 1J0S2n+r2My71x8HjABBlWEPCE2TYDGqA80yK/cP75HIK8CnFIZgMNrojlroSCamwNk9t
	 ACUP+5M0G03YupEQ6vbx5LSLmDhGE9jGzdMXhcdl/fm1iCyDmUfLeyYgJLUdGLtvpKdIs
	 lPgk7RsbR+PucDBbzyCCIl+1oKhS22hPS/zt9ooE/sIRjpUHhZs0ArRq0hDUQ1yNc9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
	b=Yn7aAAiSSEHJs7vJKsps/MomYtib1ajRSUXaoOtVdFR/5TKGg40302L9zPd/Qx6xBFJ6
	 czaVsZq3wbtHkEmu0+g1OcD7lq/Zl+bQcEKMMleGNu2A0sLQlY81UCtHekWxj5oK3SA3R
	 OetB1sTNAO8ove5xFnm9C27IHiCuvC6gz5XTkPVRj7f4oKts5xuCguHI7h9UHm1pE+Wtg
	 lxGFDi7g2bvO3zTpPhtUxXOkNkv1Kqr4bllMzOruzfkIyPu4k7UrOnrEinvqT1jVwCfJ2
	 4n2A8Y92FaagD8gQtLOLmchfqjV/9dDU4pvQ6sWjj7LOeZSmEWMCsk3mX2B0mpcT5Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZGotmsAW;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E19606A321
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 05:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1E19606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZGotmsAW
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so181035a91.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 22:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338033; x=1793942833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=ZGotmsAWKG1IRKJ7iry05CPnTDzh6s6EUXB/V9yWJESULpVmt0jHwIcAq8WV02hP0I
         Hf4WXTmx3/bs7MF/dH1KIaQVDcIE2CdZtvN+PiBhcWSTAIpCxl6RZpHQRTExoQ8qrWJC
         caIqPx8cHNZwxfjGk+XrpoNQfXEQA/wfiWhMezPcnbhsD/Lq2/s2akb88zmZKo3IywlA
         IxILp0CQY/hF6hUWFw0YlRWD+24vofJZ+wXU3FQz0wZENjrVSFt/XaWFK+CclJxR2PwA
         7D/KNMc4MzniRSzIy7SARifJGxQuSR3apsy3uAlIljZYHA5BL3UE18Xy33ppaCHAE0Zq
         gQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338033; x=1793942833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=ep65+UM5IdOEwbvuuKVKCKN/g6JlUh7lGqH+Zijxli9wLeelmGloGb+DNOB844MpmG
         zyyyd/xKlQnE9ZPcAKCVXqm0DEBTQ6yi0Ni+AakwhiJdcuej0BWSdXpF1u2IJr9T2JyJ
         UZftBx2hMbXF6drXbCNduij2rN4XJJbE0wHuEUhX8VM79EpvpHj1ZmqF/pBn4Po83gwb
         uHXHzdN3GaYYYweSoVkdbFlSKVmeP4uHhUAF0qDVeRwEz+Wf8fNDK5UHVrnxLiO3Tyyq
         23d2d99FENuWjnvzLfJO+aannDT9X+2g62XyOJOYy2tkukNiS24xrBf1U+UDyL39a9D+
         vx7A==
X-Forwarded-Encrypted: i=1; AKwUvBzoHmWDfQf8pA1Pfj3K14zNi6v5IZEBzQPkwARx4BEWxtmsWTDOsqtJOG3KB4mxocVJIFEzPBzM39s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnbSgt74Zc5n5XsP+vVQJ3a9BbJc9pYrrHwGtTvIPzCZsQqIMv
	sM0udYNaXhbF0luEMbwYyw7ebQYi79L1tlVkXT7Xs0Vg2iH7rCkPoepd
X-Gm-Gg: AYBFou1bDG8fkfGAp1urPI8LCILaxVowdTTaUppE2D1aKTNB6+tdL53MHh28uMMhVz5
	hw8CdWl+KifRJVopj/BpJNOjf7Zt+gJYfY6af9N8EfoJuhywM7I0OLLZ6yXegO5MosbASIPxvlN
	weA3BuyDP56+WlhgTQE3NgdKbgP0lmaRsSsXfxsPX5XAIVE+6X/4PO1IuRQKdfDHZNMY2IgY4Bv
	HrCNmMz2PcjktjRLZm7DzcVQ9TG55zYLMujJG8/iLXeOWxFlpJtvKCBIZztL2GVLADQ5O0+OL1u
	p9oDExKLF/y35JjNRjDMeZoP64WTVo3elGyvnSjz+GGh8mhGbOYzdPttIZ+zUJYEpp92SEFVCDB
	dlgUGpsLBUchsuVWS74g5DxhPj5pf7o/NbyOQNWwqhu/rVnfrSv00727Vm1HA0StwWAGRi5zwfA
	TlvlYXIoRMWmAnf8I6gvBanELqMCuOaKjWyvGbqmsXLrk8xil5PVKsmYCbl94OZ58mQSzjV+wTm
	6COkapoWyeHAKbLr0OiXBcBbJyKxwC+ehgu6Rz8kfqJPyRYvvxVJ2u1KiYMfgYRuApnQEnEwieR
	FkhHAT/FQiqOFtzlsziqWpOsIm+vl76/pD7JsfaQbS3ivU1kX3x/yIKjOm8yhXUMmjJfMnpyKSb
	GouTIj2ijo5sSFa5tYUywPdjOfdq3Dmt+sfJyRAgHsIL1aCQ=
X-Received: by 2002:a17:90b:3b4f:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ae8957a24dmr981624a91.6.1793338032263;
        Thu, 29 Oct 2026 22:27:12 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.27.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:27:11 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v10 11/14] docs: describe virtio-sound capture options
Date: Fri, 30 Oct 2026 14:26:26 +0900
Message-ID: <20261030052629.27742-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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

Document the five opt-in capture module parameters introduced by this
series. All default to false. Describe the startup-empty, short-payload,
packed-status and pause-restart compatibility behavior alongside staging,
and require validation with the target device.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8328,6 +8328,36 @@
 			brightness level.
 			default: 1
 
+	virtio_snd.capture_allow_empty= [HW,SOUND]
+			Retry a bounded number of empty startup capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,SOUND]
+			Accept non-empty, frame-aligned short capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,SOUND]
+			Read status immediately after the returned capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,SOUND]
+			Release and reprepare capture streams across pause.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_staging= [HW,SOUND]
+			Use request-owned buffers for capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
 	virtio_mmio.device=
 			[VMMIO] Memory mapped virtio (platform) device.
 
