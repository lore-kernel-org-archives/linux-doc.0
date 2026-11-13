Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589991;
	b=s362ifIOp+sPu437G8euQsQpjNQbJbgRTVvMrHA+VZb3H9olRpckraCDv6yP5KdMgs9u
	 Ys8qX+vxYlVnRHnjH5dPCdrtBCUVdl/NUtH3Oidv31/Xe8ozVglk5OOHb2zNOrNDdwiEP
	 CxpA2pjfeDKqq7psPveRoANnzVs/d/0jFBZGohvEYem5HNJZiXcfxrfw/fUQV5VfHrG/m
	 Xlp/ItijNJN2HyUH2CMr8Q7bBbUvdWy4k+3e5MelQOwxJWy1KfupGNRnvFua1nepIPJQ+
	 x6XoPK5q+IrnRUV4t+VULjFcfvKh7SLlX1fo4ekuCzQKzcG5bAvIR13hj+sd20fb2Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ifsfeTgNrl5URRYKRdF9Ak2jWUcinyCSFoIExBuQmMQ=;
	b=SNhw73nkNqGjw6AAPHUox2WwM7+TnW9WPbukGTRWixDlml4Eg9ZxqZbjI8SYr7QVpWvr
	 3LIUWwo3phFJ4jyJp+L2pbTUai/WP5gIDs+nfYDY/yZ6ENG6YS6ef9phKaMXXr4/OE4PX
	 IKszi241LjSjK/JYZOQnT/ruKC6IQM9VcMLaqT/ZnxAYWuALB756yzxNA45X/dtukM5up
	 Okd4bHEI3lEQMGyNdjyQ7evgkfLWcwTK1y9llkvhie1w8wkJM24xcNolXXpX96PRnsCyk
	 spiuNeTIDu+W+eT37L957gtZ2ywSgE81Z7q7lMXvzgHQUFsisUvsFOuFlfpkWsqlt1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C9Ott7as;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5E6606A327
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 17:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C5E6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C9Ott7as
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso479909f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 09:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794589989; x=1795194789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifsfeTgNrl5URRYKRdF9Ak2jWUcinyCSFoIExBuQmMQ=;
        b=C9Ott7astulg5pcDRttTVqwKCCSW8gYhYkZ47KxsUqYuT6tK6SDyAhFKsa+pFqAm6J
         gDv9o5mwcjFUCVImS7uyYyhIPYEryfhKty4hDp9qofWHVoKOPloB077+MZclv0cCq/aa
         5/TCld+qr5EfAsy5GaPQbDNt+HjRiWyIV1rvMsOKS3CV8hEPSv6XP/49nsV/cALFKThg
         7oipOaS16QaJmQzUKpAl7TRjY5YD4yR7MjLZznJ1TLWLUlyTrve3dIOtD9v+Tv3GUOr1
         L1ouxwEkGliw1/dFLxN256PesKEckWyfKN88fZjmi2j9OXnfd29nQkwr2UL6RCeob+0R
         UYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589989; x=1795194789;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifsfeTgNrl5URRYKRdF9Ak2jWUcinyCSFoIExBuQmMQ=;
        b=kSO3/6V6GlpziySSg1X4l3tFaHBxfARY0Q5QD2O+rzoOmVte1HU6QVxpYHIJ0j7oSJ
         R7CiAqUUC7X0WZ/9K/heYKeBNvhnfTo6kkIULAa80b5hpPxG3P5F9UUAPWFdpOq5Z29d
         AkR4QVZ/MIIXoEWN6RbaeMrXGzZebKyOcTtmh7Gb4q5XF8iiB+TI/PAzZoyAdgpO+Afd
         dcf2zrGhlOHPY3V6og1ycrhFj9ILGvMgeBmSmoLE5icZCMftOPaYhfXN2kBRhvTBG9yU
         G5JhQHXpu2onQZt46a1RYThOWey0NqoBAkCJME5TzJUQfEecsMKsw0bV5fPLHfjoFOm7
         68SQ==
X-Forwarded-Encrypted: i=1; AL+hErGlaxQnQ9k/vGOhgK1FJ23lD24T4QR3MZeCswVWItZoCLdss8C9taPfhHmXO/UHCjMuYmYHn9jepjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ws5GD2lM7x2TPmtASbq6mcHl+Xm0Fv+aove4E8jZsEgFN+6NO
	DZI/LTNCaH5VAvfLuU9Qm/KgVnrlQ5QczheMCOnJN/FM5IIJ1iOtM/CDLtKYutjfYZiS
X-Gm-Gg: AYBFou1/Kb1kBp+YsXogb+RoqutaooxkYPQGTqr2diiBvadRe6eXoIx53QQkG3Eoc0H
	ytxwPGn9YsMo1UNL8QebV/3eMzIBRukt2rIxjauYFhl08jE7d5TiAEWi1sQvL0NISEqyn8kcVJd
	x5J2kgNB3j4iqFXnrXhHz1ACQ87Wcd7SwgK1QSKeGWOLrhrIUPesL0NYs8vpEnrGhMnlXAETuUv
	r4kgYSrV7aT5tOYA4Cv9fqIMvBKk+9VRjOajm6V6Ug5baAbKfd7tnKw/FPNhpvN/vmlVjlMEhVJ
	+ycERDISSIKYRTtGDTSobyUkyi5HXCM7KVjdFZdJoK3DQ4A/dW6m8VdkU0RTjIYlz/mmZ5qrTN8
	ONLnTlZzJOBJPq9YUH3XdstmHDA0T88UpIciDKhCOqVMrKyRF50DfBGFWaELziNrG54u+83iQXl
	6clNorWXrbUIiCttAVe2baq+weoB0xqHsrE5QusCgbibKV/wWfZm5BkMMvLMOALwW5ouf++GgtE
	dPYl2f7llUSq8iCIaUYl77YzoSgNjWQXDRdYzSA5NY0FtnAhZ7MMOcXBNkCmBhs2+tKxncx2kx8
	S8W19aFo+nwPniLrNJdB4WY1g4ybTfVb7A==
X-Received: by 2002:a05:6000:2f82:b0:48e:4e3e:45fb with SMTP id ffacd0b85a97d-49c73631148mr6928682f8f.22.1794589988794;
        Fri, 13 Nov 2026 09:13:08 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:b5a2:ed52:66a7:3ac7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm6001643f8f.12.2026.11.13.09.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:13:08 -0800 (PST)
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
Subject: [PATCH v6 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Fri, 13 Nov 2026 17:12:55 +0000
Message-ID: <b50bad38d3e5c045c1c671be4c520c13760c5e38.1794589639.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794589639.git.jpeixoto@osyx.tech>
References: <cover.1794589639.git.jpeixoto@osyx.tech>
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
v6:
- No change.
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

