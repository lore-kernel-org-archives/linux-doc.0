Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466403E0081
	for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 11:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790509793; cv=none; b=ZZZbtBzQ0ueyj/fSM0dFtRRD68Sk8dDcS28pIZhxnSe6sDvF94j02/q2nNiKzh1emMkGYRV7k5s6ZJuYsAGxHf1fsxGfork+xkjqC6wyyKDl5sdBxdpm5uNBnLFmms2d4voK7MJvdPXOgcXjPfg2GrwP3/9ioPsrc2TgYppwsQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790509793; c=relaxed/simple;
	bh=qZkCiL861lt8lwd3IuO5tuuGDOozM3gVvT2PHwQzA8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YZhzNGTqt8jdpsxwI8aDNyP0OpPg+qqBt1a4hrGZk4MniquBDpkzZxKixOt9CyGZFcShlKfA7QaXss3yl/3URIhyNY5O8HGC6dpw8WBt90hWMsMWXLVxQZK219DW0KDGice1t27RFWyDST0w+n918n63KA/iGEG4aoBP+pLOQjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=P5ZnlvtN; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="P5ZnlvtN"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d8239so17435415e9.0
        for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 04:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1790509788; x=1791114588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71g56uPtScUsuXicGPFTJJ9Hw3/l51368qJ69c37ce0=;
        b=P5ZnlvtN2b/PG2dqaWEce9K/WKmyet+f45TcfC/OQsfwJaUQpXiph8Ervtn0xY0y5u
         c19X4ITyoxi+02i3RYpT9v4kbKGuIx600pCCLo7WeeIltvbb+ktL64t852icMtrt5W+K
         /CDeUXPq8X1xkEpu0so6BJIw/WN8Las4vknnPdtO0hyJNsdvq2WuqKHK2mUrmInugPjW
         8GlK53TjIdyRinV53TqGsh72FVaS2o77sEa2k/mdf6caB81xTD3V4qAJ6yTfsXxIuCcO
         klUtZK11f5QMaf7WC5n27cvBrOSHJQSkCGXnO/7I8765LRpnZ99X3guFSEOGBixLHMxj
         psrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790509788; x=1791114588;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=71g56uPtScUsuXicGPFTJJ9Hw3/l51368qJ69c37ce0=;
        b=q8m70qa0BzM08AC88cxAcXU80SkN+X69560cFx631LbexsKsgf7U7mJUZUioc/JYjb
         oPMhp7Cq+L8ZY+n4fthd+NnoXjKlJwMAFtyLz2VH5aw8TuWy+df200blcRFF4jssbNpM
         OWDJO43uy2ORc3JxKr8ztxnosU1yZcttXLTIwVhcE46TAWcRMb6+ZQpld7vrFpAni757
         uTCH/xucSR0etIKY9RqzyqVPQYlmqwSShVmpu9wJk/umPq2cSOsGPimKSY/RAQR3xHg2
         85pgrNG8WEIXfCweSE7JKhWR7MRSW4ZCSKjgll812i/ExUMixVMiAqpKD4lxR/JPApXA
         sr0g==
X-Forwarded-Encrypted: i=1; AKwUvBx0K7Axbp8fSXMFi+jNg3RZnXTAdg8Q26JmTXS7u1+oMFuiw7EA7vpw18TsZycz0VEixrfqLs1xLd4=@vger.kernel.org
X-Gm-Message-State: AFuF++nfC6gwMYlcB//GZi1k/ZlmqwCJEOMbNSk44fUiLy39XjSMoVBx
	rAXlPn4uVvEkCweL3CgGDv553Lk7olioZW3pyRq71GWK+gsbeNN9txIs91NB6nrCdvkN
X-Gm-Gg: AYBFou0q8uYC28AedKUW/SmkRKb701q2uauLDupbcnKaGxAOPxvok4c6mpCSSiB3OJz
	dWQ/Zw22aWWTG1Xd3dmHVIujo0nvrkVe05OwcK9S9B6UC9vQQ8N7XCBwCfsHkWK0MhL/UKKQgRx
	98jRJ/8hNeWcRaHZB+OnXkVh6i21n3V0NWax4utlGeGr6lHQ5JmLH9zZSkchvQK2z0j0TnpfhYD
	NmonHOFMQiygOQUrEwGzzNWFgPmWO/IzbKoonLd2NJg1X9FuPQL+iIckt/4aBC1yyw1ojNX8hbF
	MoTzec33dPAGZA8Eannis+g1kXBxz4o6igi/i5muUq8UX43quMOSlpj/kfg1QhI9GxEkco1G+iN
	mYBA5TZcP5ozjsMfzylzJKSOL4Cr384ufbR3Il9UsxPN4FZ/dyHVdkO59f8zhHPR+x+CiDhnXLn
	u+4dwZ8AKLhn7VRYSCyFxm1st2s4C516mGnUpV6pHmm3Mtk7tA3i7CPY3IjvmEVVbH4kbhpYjcG
	IAW/jMz00tyYIKznm2QH04G1G+paQ==
X-Received: by 2002:a05:600c:4744:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49fe7b6371bmr185299995e9.12.1790509788255;
        Sun, 27 Sep 2026 04:49:48 -0700 (PDT)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:6d6e:8514:ff1c:6c57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178bebasm57095935e9.11.2026.09.27.04.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:49:47 -0700 (PDT)
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
Subject: [PATCH v4 0/3] virt: bao: add Bao hypervisor IPC and I/O dispatcher drivers
Date: Sun, 27 Sep 2026 12:49:21 +0100
Message-ID: <cover.1790357735.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds guest-side drivers for the Bao static-partitioning
hypervisor: an IPC shared-memory driver, an I/O dispatcher that lets a
backend guest service VirtIO I/O for frontend guests, their UAPI and a
MAINTAINERS entry.

Bao is a lightweight static-partitioning hypervisor for embedded and
safety-critical systems (https://github.com/bao-project).

- The IPC shared-memory driver lets Bao guests exchange data through a
  shared-memory region split into a read and a write channel, exposed
  as a misc character device (read(), write(), mmap()).
- The I/O dispatcher bridges Bao's Remote I/O mechanism to a userspace
  VMM: the VMM creates each device model from /dev/bao, receives the
  frontend's MMIO accesses and completes them, with ioeventfd/irqfd
  support for the fast paths.

Changes since v3
----------------
The two design comments on v3 changed the shape of the series, which
went from six patches to three.

- No device tree (Krzysztof Kozlowski): both bindings and the "bao"
  vendor prefix are dropped. The IPC channels are a software contract
  between the hypervisor and the guest and are now declared on the
  kernel command line (bao_ipcshmem.channels=...). The set of device
  models a backend serves is a contract between the hypervisor and the
  VMM, so, following drivers/virt/acrn, the I/O dispatcher exposes a
  single /dev/bao control device and the VMM creates each device model
  with BAO_IOCTL_CREATE_DM (shared-memory region + notification line),
  which returns a per-DM file descriptor; the DM lives as long as the
  descriptor. The notification line is resolved against the device
  tree's root interrupt parent, like any device's interrupt.
- No architecture code (Will Deacon): the hypercall helpers moved to
  drivers/virt/bao/bao_hypercall.h and use arm_smccc_hvc() for the IPC
  hypercall and, because the Remote I/O hypercall returns the request
  in x1-x6, the SMCCC v1.2 arm_smccc_1_2_hvc(). RISC-V uses sbi_ecall()
  for IPC and a local ecall for Remote I/O (see open items). 32-bit Arm
  has no SMCCC v1.2 helper, so the I/O dispatcher is limited to arm64
  and RISC-V for now; the IPC driver still supports 32-bit Arm through
  SMCCC v1.1 (HAVE_ARM_SMCCC).
- The standalone "consolidate the IPC hypercall ID" patch is folded into
  the driver patches (Andrew Jones).
- All findings of the Sashiko review of v3 are addressed, among them:
  the DM id is taken from the file descriptor instead of userspace; the
  irqfd/ioeventfd teardown races and the ioeventfd deassign fall-through
  are fixed; the interrupt handler is per DM and the request_irq() name
  is persistent; queued requests are capped and requests that cannot be
  delivered are completed back to the hypervisor; the UAPI structures
  have no implicit padding; signals return -ERESTARTSYS; the IPC driver
  orders the shared-memory writes before the notify hypercall, refuses
  writable mappings of the read region, validates page-aligned regions
  and has an llseek. Details are in the per-patch changelogs.
- The ioctl type is now 0xA7: 7.3-rc1 registered 0xA6 for memory
  allocation profiling.
- Found while testing: the two modules were both named bao.ko (now
  bao_ipcshmem and bao_io_dispatcher), the ioeventfd kernel thread could
  exit before kthread_stop(), per-DM dispatcher state was kept in static
  arrays, a list walk used the wrong structure type, the UAPI header did
  not include linux/ioctl.h, and the dispatcher workqueue now passes
  WQ_PERCPU as required since 7.x.

Testing
-------
Built on v7.3-rc1 with GCC (W=1, sparse) for arm64, arm and riscv, as
modules and built-in, and with clang for arm64 and riscv. Run-time tested
under Bao v2.0.0 on QEMU aarch64 virt and QEMU riscv64 virt with the
bao-demos demos: the IPC driver exchanging messages in both directions
between a Linux 7.3-rc1 guest and a FreeRTOS guest (linux+freertos demo),
and the I/O dispatcher with a Linux backend serving console, network and
block device models to a FreeRTOS guest and two Linux guests (virtio
demo). 32-bit Arm is compile-tested only.

Open items
----------
- RISC-V: the Bao SBI extension still uses the experimental extension
  space (0x08000ba0), and the Remote I/O hypercall returns the request
  in a2-a7, which does not follow the SBI calling convention (Andrew
  Jones, v2). Changing that means a hypervisor ABI change (status in
  a0/a1, request through shared memory); the RISC-V support is marked
  experimental until then, or it can be split out of this series if
  preferred.
- Bao does not implement the SMCCC vendor-hypervisor UID call, so the
  drivers cannot detect the hypervisor yet; adding it is planned on the
  hypervisor side.

v3: https://lore.kernel.org/all/cover.1786010512.git.jpeixoto@osyx.tech/

João Peixoto (3):
  virt: bao: add IPC shared-memory driver
  virt: bao: add I/O dispatcher driver
  MAINTAINERS: add Bao hypervisor entry

 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |   8 +
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/Makefile                         |   1 +
 drivers/virt/bao/Kconfig                      |   5 +
 drivers/virt/bao/Makefile                     |   4 +
 drivers/virt/bao/bao_hypercall.h              | 190 ++++++++
 drivers/virt/bao/io-dispatcher/Kconfig        |  20 +
 drivers/virt/bao/io-dispatcher/Makefile       |   4 +
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 389 ++++++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 334 ++++++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       |  70 +++
 drivers/virt/bao/io-dispatcher/intc.c         | 150 +++++++
 drivers/virt/bao/io-dispatcher/io_client.c    | 423 ++++++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 159 +++++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 326 ++++++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 315 +++++++++++++
 drivers/virt/bao/ipcshmem/Kconfig             |  16 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 358 +++++++++++++++
 include/uapi/linux/bao.h                      | 116 +++++
 21 files changed, 2895 insertions(+)
 create mode 100644 drivers/virt/bao/Kconfig
 create mode 100644 drivers/virt/bao/Makefile
 create mode 100644 drivers/virt/bao/bao_hypercall.h
 create mode 100644 drivers/virt/bao/io-dispatcher/Kconfig
 create mode 100644 drivers/virt/bao/io-dispatcher/Makefile
 create mode 100644 drivers/virt/bao/io-dispatcher/bao_drv.h
 create mode 100644 drivers/virt/bao/io-dispatcher/dm.c
 create mode 100644 drivers/virt/bao/io-dispatcher/driver.c
 create mode 100644 drivers/virt/bao/io-dispatcher/intc.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_client.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_dispatcher.c
 create mode 100644 drivers/virt/bao/io-dispatcher/ioeventfd.c
 create mode 100644 drivers/virt/bao/io-dispatcher/irqfd.c
 create mode 100644 drivers/virt/bao/ipcshmem/Kconfig
 create mode 100644 drivers/virt/bao/ipcshmem/Makefile
 create mode 100644 drivers/virt/bao/ipcshmem/ipcshmem.c
 create mode 100644 include/uapi/linux/bao.h


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

