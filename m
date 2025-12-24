Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57525363C57
	for <linux-doc@vger.kernel.org>; Wed, 24 Dec 2025 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766584397; cv=none; b=gbPsAPdjnX4qgEnbK23JNxWQlu2WP0pGrBdqsfsAWHvv8gYwUN/mfNIur4Vy/N7lOyGALQaggt+Ja0A5Xc7ukWM8a2AIuBuYgdP0UWAl/k5Y8CyjQXQuNvhASauyhIYlJ/M8qLjqAG6zSaB+khWXb6Vib0GK5qJ8Evi+IpiLuCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766584397; c=relaxed/simple;
	bh=W07j8o91s4nutndGUIlF2JXCtuMhXlYN9ZpD7DJsScI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uxstvZAYgwBxc04YbxjuR4msfqvpPZZKMN2nJfUnRuBOvaX9YT5CkJxb4DGKk3ALtcb9qhTco1vU5dfUcN5zTaQDQTqgg6xFK+uooE6rnJBI3whqicftaIYmYR5S6BaoL8Wh2seywNr7fK+ejSQKVzmX0xDkLHjtPb8B2KG47fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=fail smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20230601.gappssmtp.com header.i=@osyx-tech.20230601.gappssmtp.com header.b=2y/BEXEb; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20230601.gappssmtp.com header.i=@osyx-tech.20230601.gappssmtp.com header.b="2y/BEXEb"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so4396705f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Dec 2025 05:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1766584393; x=1767189193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6BJX3RO6Fa9KANLRZsl2DTswgSgqWJfE5bB/nVGOxI=;
        b=2y/BEXEbRVj+uaPxWqmgUICBOBwhF7p4SqouOFzHuDQnqkPWaHPTJTGApn73L7zqbw
         2dB9o/9UFgjMTbouvTuHPhxOwe/7ddsWC1t7BGR4HsWslhTicTMdbbi+wqTRomY1TlKH
         xTCoGcvNc8RaZ3xCunvVlKxdvLKuWwFhamA+fPfmm0zdVpEcAlxtGOFjreghQfoP30+E
         U829fDpkGcgMrnPepDBZ21vMoTXumEKieqr6J7SK9GjuRlgDqB5ADOoSNe8T085L40YT
         RYaIbvQDFFiaxj+TyulKMlPgfpi61D/qBoNg8ntvzpg8i3so06Lv/kTJ85e7YThVn3GY
         UX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766584393; x=1767189193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b6BJX3RO6Fa9KANLRZsl2DTswgSgqWJfE5bB/nVGOxI=;
        b=XEwTnQVoZyvJf8f0d+IcKyGCd62vr/0eqYqGB6BG2430SlqK0Xp+uowgxKc0YZF4AH
         p5hZhjnwD/i+Fw59HkpEQ5Y7PwPU+J8jikyQIspY++9vobvdMnJbTbjR0AG7KaikkAfD
         cSHfWLK+ltJb30huRJeGDF4CTQYpBlcUJPRZX1S9KKwqUCH2RZrj93LNDKwizQ4gUzPA
         jpFJfxDwkp3HYJnyLn6VURw0BCjuJffBSKUD6f/RKWvyVEIbn8kEpofK0r3/Y5OGUUeN
         5X2rP4ORtiZJh4sYcet4v7WJ4KZ0xVQPxWgTscjz8ifrvszvzNOGL1afqk6uXrl5MGlX
         hPBw==
X-Forwarded-Encrypted: i=1; AJvYcCXAQiIayPmdyi4Sfcq6UoR2s429GG7TH6FGrWk7iymOEB8smmYq/wMaBTE/dBNZ4v6SiFTolGtYS5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZtCe2PzYUvQtquzipTL3JCQvoJ7hJsVROOHoz2MhX6xPwLy/t
	InCFh6h8BrTFvjVQByjzx9tJof8QL/DtZbvyjA0yROEkhk9Zgo0CRONxpcwv4RT7k+JK
X-Gm-Gg: AY/fxX7FwCDziIr2jh3tN+r7p8rPlEw4weFskii9rt3iSKe75E2y8eaklM3atUnC/zp
	3b+1vmB9ob7WClUlORiGbcA6j0tmPNke5N2mHDZ8dkxWLJVBULa+o4Nx1JWtJm2rDOS9m//YQ9z
	c009PH1LOqsZuh13Hb/V2uck//dQuadx7Rpz12TzBFjUS2OhXvNJDGSNzzDVXdTI1UiGiV1uKzg
	6KjEMtkfOmueBKWZDJzZNIsloPwAAHpbNOHgKarhISAlMMlfxu8+VAneaj+F3wvS98VQlqaLJsc
	X+or98vj6JwUEtHQuIVOZHxqOudIGl8q8LPvAOwpCX2zGYrPznAVUEsFuDzW0+pJW/nX8abG8ih
	snrMiAYp3pIixspBCUHxbR1qBc3dGAEDHdhyuw8tXnenDH5guUwK4IhwzidA1PLPC69I5K54Hlb
	jXWcufu88TakAXMlgtDYDAOubELBxT
X-Google-Smtp-Source: AGHT+IGoEJirx8QYl35KZRbnOCp6E4ECh/eV01i5gqpOP16EPi53DTG8J8VmfYXqp0RVfgjQ4vBKMw==
X-Received: by 2002:a05:6000:2285:b0:431:1d4:3a82 with SMTP id ffacd0b85a97d-4324e4c6405mr20996373f8f.11.1766584392195;
        Wed, 24 Dec 2025 05:53:12 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:39e4:e84d:192a:5c5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm34494677f8f.35.2025.12.24.05.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:53:11 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 5/5] MAINTAINERS: Add entries for Bao hypervisor drivers, headers, and DT bindings
Date: Wed, 24 Dec 2025 13:52:17 +0000
Message-ID: <20251224135217.25350-6-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224135217.25350-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: João Peixoto <joaopeixoto@osyx.tech>

Add MAINTAINERS entries for the Bao hypervisor components including:
- Bao IPC shared memory driver and its device tree bindings
- Bao I/O dispatcher driver and its device tree bindings
- Kernel headers for Bao (ARM, ARM64, and RISC-V)
- UAPI header

This ensures that the kernel review and notification system correctly
identifies the maintainers for all Bao hypervisor components in the
kernel tree.

Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dc731d37c8fe..e50ad6a1bc4a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4321,6 +4321,18 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <joaopeixoto@osyx.tech>
+S:	Maintained
+F:	Documentation/devicetree/bindings/bao/
+F:	arch/arm/include/asm/bao.h
+F:	arch/arm64/include/asm/bao.h
+F:	arch/riscv/include/asm/bao.h
+F:	drivers/virt/bao
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.43.0

