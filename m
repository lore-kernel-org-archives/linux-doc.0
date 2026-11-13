Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589981;
	b=CaEi/yjACo0mV8ZiK6/pWVy3jW+0h6agkIi5eoGQZ+3lWMGRgWILU9MRl7ZNFRfaBF68
	 OPCzf+vIhVUVANLGEAbxo9I2ExmLmhMmq3tW2B11dCwTT3h/GOpA5gwbG26VTUJdGLVwB
	 Lx7VFtQfIoJCJ8SF9q5+rhuYgXH9VJP3zv3RSZpcBQwWQdnCTNQGltJogFT7Lp+6BSA6C
	 3RmQc2rh/iQ9G6Pk6V4iO4JBqtmuZyCQUABVIZuYuwmJ0eWgp8YeaA6r5E6BAZpp4Tb4I
	 +yziu/8WKRTMMg0YXF7g1pH3GWD/twLbw2cDz/EbNgQ+drtXcEQNT//PbqcAN8cP3yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=K4XNZiwrr0RJRpeWG5dfP2Kz0D1CmXeE6JJQJUjjjck=;
	b=mZXm1O316oCJBMMWTyzkf3fHisO7zwdhbUHD3/sRyBDaDgxdzOI4AzqN3XSoet+xlcHH
	 1LxJWnnv70K3ij1c/0O+0iLqLnDzHHR0REbHt7D28OrHgMsczBGHt6NDOtSJgt2Qu7ats
	 Z+MQtrTSeV8Q6A2FA0eYFDAAZojhAhMaeNaNTJaraZhUKTZPQ9s7sweKbX/8t8z76B9+1
	 KtO6IaNekIvPIXjyGBkXXOh1ojzLPriaR3VSqCDfe90+enhMDcMwyyba5zW+XSNIAOg8x
	 5olaQVOMLTs+v8mZJk/My1Pi+yONTZRf7LQV0R5RZ7YxIKpEx7ccDrxyVwIb/a4JRpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=beWSRsR+;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E66606A330
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 17:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82E66606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=beWSRsR+
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso9617515e9.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 09:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794589980; x=1795194780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4XNZiwrr0RJRpeWG5dfP2Kz0D1CmXeE6JJQJUjjjck=;
        b=beWSRsR+VqdJyTYPWdf5XEDSKemjUDvnM8GyfLz2AjmY4trkDUwgg+AY4TcuaB7mOd
         7MUGZxFIns2zJr2PcbWwBH2JoPTPEuzVDGt7+3cNWGw6GhsTp0Z8ORCFT5JwwLebr27m
         Yy0QtYSfOZ1yEMvFUmzeIBHp5Y7DWTmeBB4G/EG07JqvtUr63VJ3Y/FonZbQyT3YxLsO
         of+uJP26OyltPErALHRfC+Dp+Oln95SEFT+eM+c7GLhnPUK2/4xQsVKFrO8kMPP0mQiy
         7Kq33vmXQOHIljyRTa226LliXXqqwRQx3DnT4YGfUT5f563q9Xjeh94pt5zBH6+c5nlQ
         jLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589980; x=1795194780;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K4XNZiwrr0RJRpeWG5dfP2Kz0D1CmXeE6JJQJUjjjck=;
        b=AGoU9MirOtR+79slIQOWUJzavH7R6vig+U/1lccZ69rPDNftlqwlILSOwbmuzY/nT1
         SoM0skDEYbJgvAkVt8c1veXzzYZcdeeFhNTO8pT45C1kLV4ElSuVt94nrrRyO5nPcAEz
         uKbELgPfTc3lmOegNFpSUxfaT7GdB+uKSrFjfKqAM20s8g94uUn4sUMTRE4sg5R814Le
         UizsqgE2T0StJ9lPtvDHBC0F4Taj4D4RO3B+/7/ey/AUYatSiTm6YW3Qq6jMSvc6b8yH
         HBx1WCZ8TNnaWa2kzZciqqx+qmAIw6hGr4vA/SzCOOxJ8Qw/Q3RcKOkjTqFBKmleX5vF
         GHzg==
X-Forwarded-Encrypted: i=1; AL+hErEOn2VlqSXdvo97X2buVWQ2wMHgfKhKdzUAWkmn0xd+tEdY/XD4fNG+VTUklMcK2D78qHMLrrJU62Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z86XIzYiYqsfWN9fJy/7/7N6HauTI0NW7fl1y8m0E8TrTP0q++n
	3QKxX35FtPO4qqLSn+0FlwKGclKfRQWgnF+uSwVX1/qJ6Fs4Q+YDY3i4de+AjIm8XREV
X-Gm-Gg: AYBFou3JzMMZFdgIZk3s2kYa9pDqmoSh2+H1qzqdjc981DZcoGUQliUNHTyRdayXiZR
	4udTN0jylH3/veeGSMDEKJmiIXaKiEBJQL6UwZ10SSAlUzENY7SdRBGK2fv2wXr0IX+AmzvrxT4
	cx/zzqD0YfFz1uEFe0dNP9TRiDa4b4kbu1s41WxDbapnbSpK8/CERwSZPggymxpqJ4X1HAFcwsB
	8AOQPXpRZjlKDVkIC38Kr5v7o/oP/RBzcogezgFngfHJNU7+vx3Uu9UeQMayP1qDostq0KT1umI
	sQPWuQUnRBCjpkd1Y+17M3E8idSt6Ksa4DdDj4OGkAzBIKiplcVBIw+CD6tLNRy897ThhvD7qfy
	18aiSeKOjIVg9igayNR+sxID2ysDUu4j/zHXUZxohxQVF4LO0rpB4t4hzVrOK4j6cJ7KCDBuWVr
	l0Yngi8rnVsTa9LS8fJvXt48C6BOQko8SbRmruO1M31AmexGNKZAz75pgpykQGY1JlOzKR3vyo+
	V0Mqkq+LnBg/ixIeYjWA0BLBazPDR7Lma+9GrTyd9AOkMDfjDSKtWOUodd39XWa4mIUl1IcwhgG
	eCesowljlqzXUeEmxxdZ5z2oYX1MxJi+sg==
X-Received: by 2002:a05:600c:4ecd:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb5599a73fmr77020185e9.0.1794589979643;
        Fri, 13 Nov 2026 09:12:59 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:b5a2:ed52:66a7:3ac7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm6001643f8f.12.2026.11.13.09.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:12:58 -0800 (PST)
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
Subject: [PATCH v6 0/3] virt: bao: add Bao hypervisor IPC and I/O dispatcher drivers
Date: Fri, 13 Nov 2026 17:12:52 +0000
Message-ID: <cover.1794589639.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
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

This series adds guest-side drivers for the Bao static-partitioning
hypervisor: an IPC shared-memory driver, an I/O dispatcher that lets a
backend guest service VirtIO I/O for frontend guests, their UAPI and a
MAINTAINERS entry.

Bao is a lightweight static-partitioning hypervisor for embedded and
safety-critical systems (https://github.com/bao-project).

- The IPC shared-memory driver lets Bao guests exchange data through a
  shared-memory region split into a read and a write channel, exposed
  as a misc character device (read(), write(), mmap()). The channels
  are declared on the kernel command line.
- The I/O dispatcher bridges Bao's Remote I/O mechanism to a userspace
  VMM: the VMM creates each device model from /dev/bao, receives the
  frontend's MMIO accesses and completes them, with ioeventfd/irqfd
  support for the fast paths.

Changes since v5
----------------
All findings of the Sashiko review of v5 are addressed. They are all in
the I/O dispatcher; patches 1 and 3 are unchanged.
- A device model is torn down in order: dispatching stops first, every
  I/O client is stopped before any is destroyed (the ioeventfds are
  released only once their thread is gone), then the queued, in-flight
  and still pending requests are completed. The dispatcher is no longer
  paused and resumed per client, which re-queued dispatch work during
  teardown and issued hypercalls when BAO_IOCTL_CREATE_DM failed.
- IO_CLIENT_ATTACH publishes a request only once it has been copied to
  userspace, so a concurrent IO_REQUEST_COMPLETE cannot complete it
  twice.
- ioeventfds follow KVM: two of them conflict when a write could match
  both, whatever eventfd they use; a request matches only the exact
  length; reads, and writes that no ioeventfd matches, are handed to
  the VMM instead of being answered or dropped by the kernel.
- Matching a request against an I/O range rejects zero or oversized
  access widths and wrap-around.
- An irqfd consumes the eventfd counter when signaled, and deassigning
  an unknown irqfd fails with -ENOENT.
- The I/O dispatcher is 64-bit only: the Remote I/O fields did not fit
  the RV32 hypercall registers.
Also, requests already pending when a device model is created (a
frontend that started first, a VMM that restarted) are picked up at
creation instead of waiting for a notification that does not come
again.

Changes since v4
----------------
- BAO_IOCTL_CREATE_DM requires CAP_SYS_RAWIO, is refused under lockdown
  and claims a non-RAM region with request_mem_region(), mirroring
  /dev/mem. The notification line is checked against the interrupt
  controller and requested exclusively, and its mapping is never
  disposed, since it may be shared with whoever owns the line.
- Requests that cannot be delivered are completed instead of stranded.
  The requests handed to the VMM are tracked: a completion only
  provides the value, and a VMM that exits leaves nothing behind.
- ioeventfds and irqfds are bounded per device model, and a device
  model id is bound to one file descriptor at a time.
- RISC-V: the hypercall status is the SBI value (a1), and both drivers
  depend on RISCV_SBI.
- mmap goes through .mmap_prepare and only allows shared mappings;
  .compat_ioctl is set; the IPC driver never unwinds a registered
  device; bao_ipcshmem.channels= is documented in kernel-parameters.txt;
  rebased on v7.4-rc1.

Changes since v3
----------------
- No device tree (Krzysztof Kozlowski): the IPC channels are declared
  on the kernel command line and, following drivers/virt/acrn, the VMM
  creates each device model through /dev/bao (BAO_IOCTL_CREATE_DM),
  which returns a per-device-model file descriptor.
- No architecture code (Will Deacon): the hypercalls use
  arm_smccc_hvc()/arm_smccc_1_2_hvc() and sbi_ecall() from a
  driver-private header.
- The "consolidate the IPC hypercall ID" patch is folded in (Andrew
  Jones), and the ioctl type is 0xA7.

Testing
-------
Built on v7.4-rc1 with GCC 15 (W=1) for arm64, arm and riscv (RV64 and
RV32), at every commit, and with clang 21 (W=1) for arm64 and riscv.
Run-time tested under Bao v2.0.0 on QEMU aarch64 virt and QEMU riscv64
virt with the bao-demos demos: the IPC driver exchanging messages in
both directions between a Linux guest and a FreeRTOS guest, and the I/O
dispatcher with a Linux backend serving console, network and block
device models to a FreeRTOS guest and to Linux guests, including
killing and restarting the VMMs, plus a userspace test of the /dev/bao
error paths (privilege, region and line checks, duplicate ids, limits,
completions, ioeventfd and irqfd rules) run next to the live VMMs.
32-bit Arm is compile-tested only.

Open items
----------
- RISC-V: the Bao SBI extension still uses the experimental extension
  space (0x08000ba0), and the Remote I/O hypercall returns the request
  in a2-a7, which does not follow the SBI calling convention (Andrew
  Jones, v2). Changing that means a hypervisor ABI change (status in
  a0/a1, request through shared memory); the RISC-V support is
  experimental until then, or it can be split out of this series if
  preferred.
- Bao does not implement the SMCCC vendor-hypervisor UID call, so the
  drivers cannot detect the hypervisor yet; adding it is planned on the
  hypervisor side.
- The notification line is a line of the interrupt controller the device
  tree's root node points at through interrupt-parent; a guest whose
  root node has none cannot use the I/O dispatcher yet.

v5: https://lore.kernel.org/all/cover.1794038390.git.jpeixoto@osyx.tech/
v4: https://lore.kernel.org/all/cover.1790357735.git.jpeixoto@osyx.tech/
v3: https://lore.kernel.org/all/cover.1786010512.git.jpeixoto@osyx.tech/

João Peixoto (3):
  virt: bao: add IPC shared-memory driver
  virt: bao: add I/O dispatcher driver
  MAINTAINERS: add Bao hypervisor entry

 .../admin-guide/kernel-parameters.txt         |  15 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |   8 +
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/Makefile                         |   1 +
 drivers/virt/bao/Kconfig                      |   5 +
 drivers/virt/bao/Makefile                     |   4 +
 drivers/virt/bao/bao_hypercall.h              | 210 ++++++++
 drivers/virt/bao/io-dispatcher/Kconfig        |  20 +
 drivers/virt/bao/io-dispatcher/Makefile       |   4 +
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 421 ++++++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 460 +++++++++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       |  71 +++
 drivers/virt/bao/io-dispatcher/intc.c         | 186 +++++++
 drivers/virt/bao/io-dispatcher/io_client.c    | 475 ++++++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 184 +++++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 359 +++++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 330 ++++++++++++
 drivers/virt/bao/ipcshmem/Kconfig             |  16 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 421 ++++++++++++++++
 include/uapi/linux/bao.h                      | 126 +++++
 22 files changed, 3323 insertions(+)
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


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

