Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB4336212C
	for <linux-doc@vger.kernel.org>; Wed, 24 Dec 2025 13:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766584379; cv=none; b=OhbSloRO6cp8fGfjPeEoKJ597TmNOGFP0BzkjY1AOyds66w3GNu2ZeMt5VkvoLldEE6/OCy3hJ1CcC60AwsQyEegf7AgGxBEdhvkivnpGHDAfYzxZLX/gh/DOhMErnmW/DJCAi9LCyoHQplWiFO9gdt40SHE+ZuomlHuVvdLPLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766584379; c=relaxed/simple;
	bh=BK+eiGyjn9LH57WJfWYe7fb00iIJqC+M08226JDyDKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H8dSxzmJs1EsBz5VcR50zfyyu9UQ8nm9yqPru42/+048+hF57UsEth0jevCCrkVVQm4gpcpXKlM1ki8zsLp0LTQ8EWWPQ7niGz/5PGFpjCNZjopIRwt9DYhD30jmf4SUgl9cSd63J4epDONJfVaymspBGB1uYISdgavwCl5g5ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=fail smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20230601.gappssmtp.com header.i=@osyx-tech.20230601.gappssmtp.com header.b=mCUuMFTH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20230601.gappssmtp.com header.i=@osyx-tech.20230601.gappssmtp.com header.b="mCUuMFTH"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43277900fb4so69657f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Dec 2025 05:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1766584373; x=1767189173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DmuPTBK1+j/xQcR53nZlLGqYmcBMfxzHRcOOd3xh0JY=;
        b=mCUuMFTHHSLk2injFRCqEcMgv3kQgZJ7/CpKvaZZTWg7xO3WphqTFYq60c3xTUUSRS
         BxD751XwW7iZCtiuVfcfXLU7oOpZiiczEuiQYE0f8pDUCTysgWNyb50/2qTpVqOQAhRX
         vspfTT6kpg0Fnltg4+GH0i6C1F0l82soioJPv+fiMVHduX1FvceGJp+X9KlSqTjpbBg5
         k9OL43RFJHyT6oheSpbkT+za4QCPqM9eghlIhHE+80u7MosCAmuwf+pQJHAIAX+KG+Sv
         2xIDDPE3XeTb6XzktY1M2KWvXy4a4cX7Tyz0eHHMc4NTsc9GhrbVRvUwTb0YPlE+vkwW
         R2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766584373; x=1767189173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmuPTBK1+j/xQcR53nZlLGqYmcBMfxzHRcOOd3xh0JY=;
        b=CG0WCRvIvbPAQ02mTaVFjBCzLJqmRCSdhv7KKjeJBsVPAKoxwv7MEytQHCU2w4evKo
         euaB1Arctnqnq6g7VsQKL3ZxcodZ44lldo6EHljhen4qD3EvUVwLU/MpwNUSoYythwGX
         SyNCQ0btKqkUt15DcjVMnbxTXV+AF8HSvyqMgZB8kJ6KKBXti7sxqsEz6mumBiQLphgG
         s1ohugcYg/VfjIJTNX11jJaSQgd/P+qC7eOJbE6LfHna1iT03cE3cjDXe/pKdU71aF4t
         KDnwIG2dZCm2Z3fYsksudTd3AOtDHAZ7+JjfHbKx4AuyPy8ZyK2QcCPsYI3e90TtbP7Z
         aszg==
X-Forwarded-Encrypted: i=1; AJvYcCU3i+CSAcCDlCzcoVrqpRg387Lh7iERYFHwZHQ8hsiA6Hf3oL1NVzRFKz61yxe8M2oDUGm6fnCrY7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9HAJ8nH9ddBdhG4lOY0gLIG5P3jacDh6npF9cm+C3nmBBYdII
	n46uh/0DXh4lAn9ppSxOASvNonmT45ANnf0cysndAEAVLaXdnBvuz3enlg6KXE0rBv2X
X-Gm-Gg: AY/fxX5NvlF5BswzPB4N9hlWHseg23KIHAMfcqOJyTBXtTQni234CsGCK7Yv4MjLB+O
	YKqkh2fYx5cWPv3hu+Gt1kmAktBZMTE+DBzvx9G1RXiwPF5Fv40qNQFAgWnxLzIzCQ+3xAQN2ND
	oVrQMOjiL3pYVupTaBShkngmCu7vXwYjlUIUXJpnyzgpDDKPMyw2AAAK9JterSO9acl+Ko8qv9e
	kmlbF1ZWYOHFEB1PkGHiMcv3MrY1DyWncxmttZvSONoxeZBthZfL/8GZBxAKujc7lzXbAD+Tb9n
	z8oZxG1pz0VjLOOVh22qQ6hOjOPAEnIYNR0CDLg2Avx0HGgzho9drDwa1lZBmktjFiY44MGW2WP
	iv6bO6RtMA+4oUXSU0x5TXuIDJwtO498HBYYDIkIKAAC+l7Z+hriG0i2mwglKPI0hCKaOLKvuwb
	+BFkj4aqgUbYaFNmHi1w==
X-Google-Smtp-Source: AGHT+IHoJrb07B1cdykCE7qYkiqA5eIOoSQMy9mbNo39VeuUJ9/LLv9crUrYThO0HyLNCGIS21PtnA==
X-Received: by 2002:a5d:5d02:0:b0:431:66a:cbda with SMTP id ffacd0b85a97d-4324425829amr25725416f8f.0.1766584372997;
        Wed, 24 Dec 2025 05:52:52 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:39e4:e84d:192a:5c5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm34494677f8f.35.2025.12.24.05.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:52:52 -0800 (PST)
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
Subject: [PATCH 0/5] virt: Add Bao hypervisor IPC and I/O dispatcher drivers
Date: Wed, 24 Dec 2025 13:52:12 +0000
Message-ID: <20251224135217.25350-1-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: João Peixoto <joaopeixoto@osyx.tech>

This series introduces support for the Bao hypervisor guest-side drivers
under drivers/virt/bao and the associated Device Tree bindings, UAPI,
and MAINTAINERS entries.

Bao is a lightweight static-partitioning hypervisor for embedded and
safety-critical systems. This series adds:
- The Bao IPC shared memory driver, which enables Linux guests to
  communicate with each other through shared memory regions.
- The Bao I/O Dispatcher driver, which allows Bao's VMs to share I/O
  devices using device paravirtualization (VirtIO).

Patch overview:

1. dt-bindings: Add Bao IPC shared memory driver binding
   - Provides a standardized DT description for Bao IPC shared memory
     devices used for inter-VM communication.

2. virt: add Bao IPC shared memory driver
   - Character device driver that maps shared-memory regions and
     communicates with the hypervisor via architecture-specific hypercalls
     (SMC/HVC on ARM, SBI ecall on RISC-V).

3. dt-bindings: Add Bao I/O dispatcher driver binding
   - DT binding for the Bao I/O Dispatcher, describing memory regions,
     interrupts, and compatible strings for backend VMs.

4. virt: add Bao I/O dispatcher driver
   - Implements the I/O Dispatcher kernel module bridging Bao Remote I/O
     with VirtIO backend devices.
   - Includes architecture-specific headers for ARM, ARM64, and RISC-V,
     driver framework files, UAPI headers, Kconfig/Makefile integration,
     and ioctl documentation.

5. MAINTAINERS: Add entries for Bao hypervisor drivers
   - Registers maintainers for all Bao hypervisor components to ensure
     proper kernel review and notifications.

This series has been validated on Linux guests running under Bao hypervisor,
ensuring correct initialization, read/write operations for IPC shared
memory, and proper I/O Dispatcher functionality for backend VMs.

Feedback and review from maintainers of virtualization, architecture-specific
code (ARM, ARM64, RISC-V), Device Tree bindings, and UAPI are welcome.

João Peixoto (5):
  dt-bindings: Add Bao IPC shared memory driver binding
  virt: add Bao IPC shared memory driver
  dt-bindings: Add Bao I/O dispatcher driver binding
  virt: add Bao I/O dispatcher driver
  MAINTAINERS: Add entries for Bao hypervisor drivers, headers, and DT
    bindings

 .../bindings/bao/io-dispatcher.yaml           |  67 +++
 .../devicetree/bindings/bao/ipcshmem.yaml     |  99 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |  12 +
 arch/arm/include/asm/bao.h                    |  62 ++
 arch/arm64/include/asm/bao.h                  |  62 ++
 arch/riscv/include/asm/bao.h                  |  61 ++
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/Makefile                         |   2 +
 drivers/virt/bao/Kconfig                      |   5 +
 drivers/virt/bao/Makefile                     |   4 +
 drivers/virt/bao/io-dispatcher/Kconfig        |  16 +
 drivers/virt/bao/io-dispatcher/Makefile       |   4 +
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 386 +++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 330 +++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       | 348 +++++++++++
 drivers/virt/bao/io-dispatcher/hypercall.h    |  30 +
 drivers/virt/bao/io-dispatcher/intc.c         |  68 +++
 drivers/virt/bao/io-dispatcher/io_client.c    | 435 ++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 207 +++++++
 drivers/virt/bao/io-dispatcher/ioctls.c       | 145 +++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 336 +++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 341 +++++++++++
 drivers/virt/bao/ipcshmem/Kconfig             |   9 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 539 ++++++++++++++++++
 include/uapi/linux/bao.h                      | 124 ++++
 28 files changed, 3701 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/io-dispatcher.yaml
 create mode 100644 Documentation/devicetree/bindings/bao/ipcshmem.yaml
 create mode 100644 arch/arm/include/asm/bao.h
 create mode 100644 arch/arm64/include/asm/bao.h
 create mode 100644 arch/riscv/include/asm/bao.h
 create mode 100644 drivers/virt/bao/Kconfig
 create mode 100644 drivers/virt/bao/Makefile
 create mode 100644 drivers/virt/bao/io-dispatcher/Kconfig
 create mode 100644 drivers/virt/bao/io-dispatcher/Makefile
 create mode 100644 drivers/virt/bao/io-dispatcher/bao_drv.h
 create mode 100644 drivers/virt/bao/io-dispatcher/dm.c
 create mode 100644 drivers/virt/bao/io-dispatcher/driver.c
 create mode 100644 drivers/virt/bao/io-dispatcher/hypercall.h
 create mode 100644 drivers/virt/bao/io-dispatcher/intc.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_client.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_dispatcher.c
 create mode 100644 drivers/virt/bao/io-dispatcher/ioctls.c
 create mode 100644 drivers/virt/bao/io-dispatcher/ioeventfd.c
 create mode 100644 drivers/virt/bao/io-dispatcher/irqfd.c
 create mode 100644 drivers/virt/bao/ipcshmem/Kconfig
 create mode 100644 drivers/virt/bao/ipcshmem/Makefile
 create mode 100644 drivers/virt/bao/ipcshmem/ipcshmem.c
 create mode 100644 include/uapi/linux/bao.h

-- 
2.43.0

