Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038827;
	b=YIQGeF3CGXvtRJudU+q0Zp2+sqOPbWMfptdZ3qPdDt5M3aNyNATWV0JKQMmOdeT9kS+p
	 sUSrwQERH64gae6C9mKihENxWi9SoFT+iFrXmsJvXAocCzyLHFr5wMeDu546/82SpWEXy
	 Cduo5yuKcn5dYrWkDfdX3ZxYN+MnnA4rbwWqP/0HnAty6sm1vXb3zeC8/slawY2OZLwsa
	 UytfLHGHRgLQg+RyQna1BHhYiVWg1vsXGlo3WtXXdNggOErNlg9D8QOCLbfI2dkW0U/jC
	 6rfcFnKothldb542T51p4PjrzjMsjgGmu76OPhp2NtlMJH7xagvJvoho2nTG3lbIMHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=A1W69Jj0cuHW+VrCPTPexg9wdW+N2t/lSjby8/XmkVs=;
	b=VPtOTUunhS4n+anyqjsYWYUsmSxhUUDmUC6HPAUquw9Fa3L00kMmnatqLSb0fW81BK++
	 SGgMZFESkrz5F29dmx9mwvs8b0j17wJ0AWk5bIx37KoN3VYu6G4M+jsuE7jHcAZlez0kE
	 gc90cNM7locJxpy8FlifRNi+tcpCL4HdmyOqV4i8MSpPo1DZB2V6jb6dy/s1WOiwn+LVc
	 fgbOP2v2Rt2QGSiL366s50XZ0IYyfaUfG0dVJ9Pk+Pd57FBeUDLua9NJpOOG+I8dPOteF
	 eCQwZYKEjzv5AXTBl19WAi3As7rMuw4Od2luLYxdSBIFNhQt2BwlJ1ewhTPfQuzZRQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GJYkm0vh;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19BF606A326
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 08:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D19BF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GJYkm0vh
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214af2076so9506435e9.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 00:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794038825; x=1794643625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1W69Jj0cuHW+VrCPTPexg9wdW+N2t/lSjby8/XmkVs=;
        b=GJYkm0vhpmdsKFxr0ra7tom/kgIOFjaOfs+XZq0RJJwefUpq9PAcUah2uw1VjEA8Oa
         Rb3XpN4bxFrikIgmCBTJpFKLyUDR+5KvLPUPYy1QwSZ7pStZUXTgpqy0Qprmckx0qXFj
         MnXujEsFG+zTNjPdw1B7aLHfxbolGEoUngEix0D7RxlvD2YOB1ENs486OFs4dsYKHRS3
         4Ue0aL9aLHQlKLdYLdCIFQJh4QLQXGYxtAx0LhGuqZzcVBDre/CeiymzgYlOBdwll6Wj
         8AcoClMOMbzMvD5pVmCx7EZLKU/IwWoK8new3NbPgWpXqgpY6yq6i6KUdY0KsORefsG2
         r6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794038825; x=1794643625;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A1W69Jj0cuHW+VrCPTPexg9wdW+N2t/lSjby8/XmkVs=;
        b=NiMznjTj2tIBg1bOtbKWKjemfAxsQatRSS2eF0Sfh0MgwmTNtvAk13Zaw6ec9JGsw+
         g2oqJYS7iRFh5+qMPi1I9GNM9eUyMjA8XZdour6G3NtOlJ7L1PzZqeetfXkw9QVdRQT0
         QPMwH/cERNRSyNxFA4yp7+6pEUnOBtHfHgc4X0/k3kDK5ydf3HknfI3m20Toa5OGHDL0
         HSHdIVKSb48zWv85QMtkK8LAO6fcA88Mn0emoK8D9CjnqvnRYwJEljtDcmVU84CxB6i8
         wbBFtN9TUmzbXA83UtT83PHwqQQpWkRJLblj3G9CZKXElW/Zq/aD6MYV7Jni5uBK04Hx
         iMHg==
X-Forwarded-Encrypted: i=1; AKwUvByiqdcJeRONlVlSMM8DehG3GsIWHjx7j7t1UQJpJ2lPb/4VzJ0jg0FeYUoxo3xF/d5dYtYdpI9XAhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dUdNIN++DUcNh4U2g7v/E5RjK57W7uEkViPrqsbzqGA4djDZZ
	a+9MxwAchdDlKlq+IXGK21ZqfJSfNx2JSRj2XmFduhiczBZsY7DYZ/C6p2l4+6xDMxqR
X-Gm-Gg: AYBFou2hWzvWSY9f7F+DwPlAeSCT0qXXG/54Cs01SSHRBZWkuz2yBz36dGg5AzY7y7T
	97bkI5sGXU2UTiwNFBLjnuVc1OBy70VSOOdscUJhAejj8blROj/FnFs6227zE/VmHQoP6sjeA/y
	mgWG+Kiqf9tbkASS1EQac8WLcrSFu4xvDPfY7EwcOOiS4+Fs6f+jaqNUHFcKbSvsMsR/n12zue2
	Kmz/1MrkVlcRFbDzZyWf6Ba6qjh4c9E5flF93ChRboIwvfscj5D0tMAvLId4m6Dm4Yjs/y4Dq9e
	vqXSvyiarqTjV1EMRWm1rCehcLmnTLuPZiz0+aab2fDQNc0lb7RXhWGhpJHX06bIXwYPZJOYpAg
	7tb0n19VkKEjHX7eeag2wwaimCCX04yD/yvhrret8+Fd2di74RQe8wOLHvbF8kj1Gw2P2498snT
	n6gwN3lAmRWtkzIGpfBvvtccyaI/Oowbh3L2Gmu3o2dgwCizPYoAxngwAyt+Au13Z7F1OAaze9f
	vGzdSpsFwVwBDHeC6yBw/ChQ1xz1YhAwXQx7TdJDsxYdpZbcsuDu0xVHIIgcRmqLijovZdQe1zA
	KwiopcUGTDEct2SBlWdZItZ53Wv7DpQtwqPgTZm9Z1qZ791kJBM=
X-Received: by 2002:a05:600c:310e:b0:4af:9cae:df63 with SMTP id 5b1f17b1804b1-4b6dfbac4c3mr81654205e9.31.1794038825053;
        Sat, 07 Nov 2026 00:07:05 -0800 (PST)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:ea06:fa16:f0a0:9d64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e327a652sm43927455e9.7.2026.11.07.00.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:07:04 -0800 (PST)
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
Subject: [PATCH v5 0/3] virt: bao: add Bao hypervisor IPC and I/O dispatcher drivers
Date: Sat,  7 Nov 2026 08:06:49 +0000
Message-ID: <cover.1794038390.git.jpeixoto@osyx.tech>
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

Changes since v4
----------------
All findings of the Sashiko review of v4 are addressed:
- creating a device model (BAO_IOCTL_CREATE_DM) requires CAP_SYS_RAWIO,
  is refused under lockdown, rejects shared-memory regions overlapping
  System RAM and claims the region with request_mem_region(), mirroring
  /dev/mem;
- the notification line is requested exclusively and is checked against
  the sources the interrupt controller declares before it is mapped,
  since irqchip drivers trust the specifiers they are given (a PLIC
  line above riscv,ndev wrote out of bounds). Its mapping is not
  disposed when request_irq() fails, though: irq_create_of_mapping()
  returns the existing mapping of a line that is already mapped without
  counting its users, so disposing it would free the interrupt of
  whoever owns the line. A leftover mapping is reused when the line is
  mapped again;
- a request that cannot be delivered is completed and fetching goes on,
  so pending requests are no longer stranded;
- the ioeventfds and irqfds of a device model are bounded (256 each) and
  their flags validated; requests still queued when a client is
  destroyed are completed back to the hypervisor;
- the IPC driver registers its devices only once every channel has been
  parsed and mapped, and never unwinds a device it has registered.

Other changes:
- the requests handed to the VMM are tracked: a completion must name one
  of them and only provides its value, so userspace can no longer pick
  the hypercall operation (an ASK lost a request), and the requests a
  VMM leaves behind when it exits are completed on release;
- a device model id can only be bound to one file descriptor at a time;
- RISC-V: the hypercall status is taken from the SBI value (a1), where
  Bao returns it, not from the SBI error (a0), which is always 0; a
  failed hypercall was taken as a success. Both drivers depend on
  RISCV_SBI, so M-mode kernels no longer fail to build them;
- mmap goes through .mmap_prepare and only shared mappings are allowed;
  .compat_ioctl is set, the structures having the same layout for 32-bit
  userspace; DM_GET_INFO and IO_CLIENT_ATTACH are _IOR; the ioctl table
  reserves 0xA7 00-0F;
- bao_ipcshmem.channels= is documented in kernel-parameters.txt;
- rebased on v7.4-rc1.

Changes since v3
----------------
The two design comments on v3 changed the shape of the series, which
went from six patches to three.

- No device tree (Krzysztof Kozlowski): both bindings and the "bao"
  vendor prefix are dropped. The IPC channels are a software contract
  between the hypervisor and the guest and are declared on the kernel
  command line (bao_ipcshmem.channels=...). The set of device models a
  backend serves is a contract between the hypervisor and the VMM, so,
  following drivers/virt/acrn, the I/O dispatcher exposes a single
  /dev/bao control device and the VMM creates each device model with
  BAO_IOCTL_CREATE_DM (shared-memory region + notification line), which
  returns a per-DM file descriptor; the DM lives as long as the
  descriptor. The notification line is resolved against the device
  tree's root interrupt parent, like any device's interrupt.
- No architecture code (Will Deacon): the hypercall helpers live in
  drivers/virt/bao/bao_hypercall.h and use arm_smccc_hvc() for the IPC
  hypercall and, because the Remote I/O hypercall returns the request
  in x1-x6, the SMCCC v1.2 arm_smccc_1_2_hvc(). RISC-V uses sbi_ecall()
  for IPC and a local ecall for Remote I/O (see open items). 32-bit Arm
  has no SMCCC v1.2 helper, so the I/O dispatcher is limited to arm64
  and RISC-V for now; the IPC driver still supports 32-bit Arm through
  SMCCC v1.1 (HAVE_ARM_SMCCC).
- The standalone "consolidate the IPC hypercall ID" patch is folded into
  the driver patches (Andrew Jones).
- All findings of the Sashiko review of v3 are addressed. Details are in
  the per-patch changelogs.
- The ioctl type is 0xA7: 7.3-rc1 registered 0xA6 for memory allocation
  profiling.

Testing
-------
Built on v7.4-rc1 with GCC 15 (W=1) for arm64, arm and riscv, at every
commit, and with clang 21 (W=1) for arm64 and riscv. Run-time tested
under Bao v2.0.0 on QEMU aarch64 virt and QEMU riscv64 virt with the
bao-demos demos: the IPC driver exchanging messages in both directions
between a Linux guest and a FreeRTOS guest, and the I/O dispatcher with
a Linux backend serving console, network and block device models to a
FreeRTOS guest and to Linux guests, including killing and restarting
the VMMs, plus a userspace test of the /dev/bao error paths (privilege,
region and line checks, duplicate ids, limits, completions) run next to
the live VMMs. 32-bit Arm is compile-tested only.

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
 drivers/virt/bao/bao_hypercall.h              | 205 ++++++++
 drivers/virt/bao/io-dispatcher/Kconfig        |  20 +
 drivers/virt/bao/io-dispatcher/Makefile       |   4 +
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 401 ++++++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 438 ++++++++++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       |  71 +++
 drivers/virt/bao/io-dispatcher/intc.c         | 186 ++++++++
 drivers/virt/bao/io-dispatcher/io_client.c    | 430 +++++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 173 +++++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 350 ++++++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 321 +++++++++++++
 drivers/virt/bao/ipcshmem/Kconfig             |  16 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 421 +++++++++++++++++
 include/uapi/linux/bao.h                      | 126 +++++
 22 files changed, 3202 insertions(+)
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

