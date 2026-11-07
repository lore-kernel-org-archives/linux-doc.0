Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038836;
	b=FiaO0ZpDbEAfCjqqlmC3tu34jshB0iBfeLJNWkUXmcLUinxVo1ZpPbpl9e3R9tPqojYx
	 5N4DpxolJ8JzRJBpNlBuyXkxR1gheohffY+yGrTfrLTAkudhfjQxUwfXN3kyQnsbfxVMZ
	 /ToEJS7uIWg5jcOZjkysaW7LGCgf1BFYWL+Rxy+ahJiIY/5bOIsK4QUAZaGGFp+ES8BNP
	 jzod3Vj8cPTVGyNa+DzcKhh91EPk0ij2XYdFNjE4sIy4pXA1QYiLrnzkWl24KaKOm2vJT
	 tEI7egUmTFwlQEIt1WWb1LajIQp7Z2QoeRfTbkaMcwYyRssEFxUzK7pDAY98Qtu1U2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=x6OX6qz/WRgS6n3RRGF+EeBHclWuHgdA/NrgibX9lXI=;
	b=eXM5dkRkDCSjPckRw8Vk+ekkTlj61TslyKuT7K0kLDH1G0zFEaqDyoT/5x2NXsKKhsQE
	 /fEFxv2B4WtZKMsdAfbhxjb3rXJj96XW2wowxjsz8Ae2yu9N0h2OpbzFzuq5l/6flZTbM
	 Oqh3tfeaRW/cMOsUriCLLwoII+4DN5Hnvb8uqcR1iqaSwNCoCNNbJxS3j++ULsO3DqdkB
	 Ao6irffoGvs2yNnhwZghjBJ2wp3zbuE80L/JaIJsBpe6bqXRNN9wKpJrv5Q5ImGvPV6xd
	 RLlyxX48QWXRbK/miSDFDh7U5q/5t/AjS1MfG7P5tcPVW1TQ4vfnRXAz7pT2zgu6PCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=b5BMzb4C;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBBD606A333
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 08:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCBBD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=b5BMzb4C
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491971ac844so1194830f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 00:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794038834; x=1794643634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6OX6qz/WRgS6n3RRGF+EeBHclWuHgdA/NrgibX9lXI=;
        b=b5BMzb4CKP+DlmGkkuc3flNcQ3ZI7xbcs3yZvaluaBeG83K9/VtBHGJzJ6ijYZmcxN
         HVCI2wvvYO1gQU21f2r8u8rTc9YEbfkufMyXByhACRgUnV60nUiPBiFtnl6laFHuJpLV
         EGpmxmksCLNhEyrvzLAwPG7X5eNrgYnBnONymlkPnn/Z5CF3cQ/WTytoBbIQBUwYXtel
         oeeMD4+/bwSJQ1SWLVwtAO1KJFnx8OzWQbEbjViTUrThGxoui7P0yZDZv9Dvq3Z9yXPu
         IQM5WRUY5V7Y0MJuVl+GrYIWO/Rc8cj2dwHZAGyS0GKOyeOnAcKYFfRVhrT6HCPasrig
         L+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794038834; x=1794643634;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6OX6qz/WRgS6n3RRGF+EeBHclWuHgdA/NrgibX9lXI=;
        b=psn2e5gzWG2G+BHVnicWWNSQEuROLvjg1t2CU5o6nNd3DxwMEwMfp8LlglkJyP1Ohx
         oKrFRnkeF1LPLH+xNuxFFGFXFnnhnmpgFyK1OHwlDbeBjHfuEPZcaxeuDg7HP2z6ZKvS
         kkaZI8Q5TSk2hKUsJD1/7OxOQdxRAdVJNhJHtT07P4ANyQQHCjCOaKy1+0699cYAjpeo
         5hV0+QloSWRYg3T0rr0L3YT9lx7TTltRBWcSXnmKkFXHErXg+R6PZBYoLLvfwdxgvaKK
         9eikaFMrZxiWOGxjvgfjJFaS6YNO2BqKlgOiTPONanaYjIXZIqvKiFXGcObW8Rc42sC/
         inMg==
X-Forwarded-Encrypted: i=1; AKwUvByEOQD5z+phJStzMksFGilwXYmARarVpCHwc/x8DqKFMC40dOeEkz3a+qx4MojgxUCIOVR1VKuUUUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D4+6+M1yOgPFe/uSDUpMj+/Hu0jS8QCDHLaeSyJzOkUqMXbQn
	mYVSo0PZJC/rO5K8/GVFjeKdLbkRBxpWtYgr6jFA5hVeGFRrcsHrkdU/fyqhHKL7v0Fb
X-Gm-Gg: AYBFou2EEHD1enIrPBGRMSTcAv1yiLkWONNV1HI+nG+zzpPbMCJxJP2KDD7rOKZQk2O
	XgiN8ggU6UP5OzWU2opQQIskjNeFg42Muf721Ch0BlpgyP7XJAg6A+9XRTnJTUq6ShhUDVopEme
	W04HfET5LA0cltVsE0a65OSdmWJa8V3yCkqFC8g6vCcm/5t5c35iF4R6ZiU2BRuK2U4+mSCG7C2
	tjZQmcE9yCWaE6hFyysJflnvRBrcHN0szE2MHPQlRsAnNUPkHqT9csGIGYC2RKzNPbzdJKWagDm
	1jgHmJusT/zo1mgZNNpyS54WBK+lu54tkYuH6pNp51tQsh4L0gVk40KUQyJCOVUjvBN+xrsmNpZ
	L9OFcCHqVzF8NjQr81gK4lRluz3msIhq7/2PJJSrqYtinwWHUYluRf/QY3WAbEPi1l89635zpRr
	JJ/itVByZigbK5NCQKLjzmkeSDxBAntW4kxjAjmVMuSS2vaikT+GPKGiOgGvA9ZDOdi2y/RVbUV
	X974uEOJLtq2SE7caorS+4kNHj2t7GwvdRYX9ehw2ztnDdlgynj88F83KudPcsxOM6Ygztei75j
	rHJ/Q7/1zWFVJbNYwYFIaTXZ7D//zQDKuqkjBtAl4Nn6iQjzFUE0
X-Received: by 2002:a05:600c:3f0e:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4b6db0d060fmr83181085e9.2.1794038834255;
        Sat, 07 Nov 2026 00:07:14 -0800 (PST)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:ea06:fa16:f0a0:9d64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e327a652sm43927455e9.7.2026.11.07.00.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:07:13 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@oss.qualcomm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Sat,  7 Nov 2026 08:06:52 +0000
Message-ID: <418eb111fc016706fb64ec91cbfb077ce31e4577.1794038390.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794038390.git.jpeixoto@osyx.tech>
References: <cover.1794038390.git.jpeixoto@osyx.tech>
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

Add a MAINTAINERS entry covering the Bao hypervisor drivers and their
UAPI header.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v5:
- No change.
v4:
- Drop the arch/*/include/asm/bao.h and include/linux/bao.h entries (the
  files are gone); use the directory form for drivers/virt/bao/.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..dbea081447e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4712,6 +4712,14 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <jpeixoto@osyx.tech>
+S:	Maintained
+F:	drivers/virt/bao/
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.53.0

