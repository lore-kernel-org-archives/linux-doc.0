Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C1A3AD52F
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 20:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417456; cv=none; b=F8oH479QQfgvbyPu4l25ya0wshmhmevCJlKeLyAiS0q4ZoWv+Uk5CZYqivbV616r8HIzgo0T6FIAFepciHylng1xQOk0Kuu9hXloHEfHyui3/MXdlBUv9LvQWrydrpB7hLjzyeTeAQYgtVqDUfREr3RdnWq0hmem4G48PfM/j98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417456; c=relaxed/simple;
	bh=V6WNtKQ4jADi8tTtCkgNPx6V5ss41Ldy2khPHqgLAco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uivj22CKDUE/dfhN7BjEJE8N0aylisgmaqik+7f9oYLvvls8bOm2+gI/+yczz76NilXW0n8oqMNHsOXbPnpa3MDZAyPUfJjjsISshgsOz7HyUGXtCcvfJRTOk6rbWS9hXCJ5EDTPoDsUQsdxulQ1/xoA6/D/7k0h9TXVyfsVRrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LXXWgAtR; arc=none smtp.client-ip=209.85.210.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LXXWgAtR"
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-8701fcf40d4so765014b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 13:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417455; x=1790022255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zKVHktddFg18lNwT1KKe1iRzZT/GYvNrBGD0jhLiuz0=;
        b=kdqhmI6VNZvkNuQ4H7BjVYjUxg6u/6UNzM4JtbfPYV9r0PQOlXL7Osp9iVhE1npSt9
         TQHhFMQ4Wbe6F9YL1CtdaC8EMQtw9XM6jDsTAvxC3Pw3vm4MW9RYdXv+gmvL7fInHDdP
         2XCE9/N0+SABCJMx354+BeWf5daaw5iUKtkfp3oAjdRFQPiGjWWbNvfs6y/foSLp0/Tz
         ePWcQrV1hTjrM6Kux52pIDZ4ByEE4OOCfSuETnLIYafB6w/tWuBESenWRTjNwNjYcIKA
         t6GODeRE/RCShHbcT2LSIzZPDnrlS+HdhViCpnkPWZwajOI++m8D28I87kbPRquD0Muk
         UeaA==
X-Forwarded-Encrypted: i=1; AKwUvBy7m9h4D56XD9/f2VZlwS8PfpowuWfqII4Q1a3+OWtDzH/Ip5b9wRieaKcvdZG9vIdgvIvZhjvoHag=@vger.kernel.org
X-Gm-Message-State: AFuF++l0ELTcCOXjAhr9vX65h555xns89GQS7rONPIZ/lqBhGdiI8aL/
	OsJbI1oYPPxo4JfLtIeDrAhzUe5XS1cfe26axCify1GgXUGCoNSt4JT72vu6eyYXSy1+4Zaa/IB
	iX0iee0BODx2PCqhib8XUOYmvYgtdfEsl92m7ute1b/kPqQYzv1rYpbo3owuRHHUtrsB/jGIfsU
	RyVjDSQByV2x37zNtUusu+FCTURSXLYtv7wW9+heOKR6XMFgF/hVLQLGQlRxujp17w/juzgbdlF
	JS89t9kbAy9F0+QYA==
X-Gm-Gg: AYBFou2RshVeY+o3p9vJnLtHebVRRlkgx3HL4rTx+/l7Gzbls1947PbVKqxLHv7LiLb
	Gr1rvVXvhNtIEtuCktnEQMHcQH2TQUNE4jxrIzm/yLTbNeX8UqAWPXFQQmxu7SepGKWPDRLlQ2P
	4sefBi0+j4NykXY3lQNMSGhRNbzP0Hzds4CZ8y0z34FZ2HAzTjoRg73GtzV4WVQneATEgN8v1wO
	zNX3nI77KvouAyVKgFFxTplILBo0hytNhF55n8IMbepzqglWppxeudNex0dhfTKr/VOGBwq5fNc
	0Bb6Vf2pjRG8m3vEx74XjBcu+CF3Nb9lH4m6gKMmNXPkqlhlG0i/i5OuBNg+V5Badsa8sqIwKb1
	dEkWbF7OGuBONInSUSEWpIftlntLj5UCP8BZWC5RP1eVGaJajJTYi+2e9gErzk5vADUAGsmCraU
	UqAX56zi+6JingZRyxphtfvG0wZCiS7IoYRg/yrQ==
X-Received: by 2002:a05:6a00:3494:b0:847:9aa8:d3ce with SMTP id d2e1a72fcca58-86f82f51c3fmr8767454b3a.2.1789417454511;
        Mon, 14 Sep 2026 13:24:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-86b284c6490sm3127254b3a.8.2026.09.14.13.24.14
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:24:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-458326d2d9aso5319811fac.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 13:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789417453; x=1790022253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zKVHktddFg18lNwT1KKe1iRzZT/GYvNrBGD0jhLiuz0=;
        b=LXXWgAtRdDLCS8M+l7EHZkrjJ0md5DM6P12pvUYV/yqlSiJZzKI9jQtiW8121zi/3a
         ISyjZv7RmlC2me1nHS6+/nGoB71K7mGcF0sEM/y2jgr5cO1nymFI39XwoAuPK6LySWiy
         mXfRbz4KrbuufZcFhrGGWjHrTaM0Gy72TYkE8=
X-Forwarded-Encrypted: i=1; AKwUvBwAwrJWju7SPk4AgLr6y8hHBFUu7zBcWa7NUDWjhfgjHG0pkS+uccClNyo6XJTUsyVk3/+14+VDkRo=@vger.kernel.org
X-Received: by 2002:a05:6871:580e:b0:481:1dfe:89f5 with SMTP id 586e51a60fabf-481f990179fmr2535699fac.20.1789417452831;
        Mon, 14 Sep 2026 13:24:12 -0700 (PDT)
X-Received: by 2002:a05:6871:580e:b0:481:1dfe:89f5 with SMTP id 586e51a60fabf-481f990179fmr2535682fac.20.1789417452313;
        Mon, 14 Sep 2026 13:24:12 -0700 (PDT)
Received: from lvn-dbc2489.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699bc6sm11623741fac.3.2026.09.14.13.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:11 -0700 (PDT)
From: Rishi Chhibber <rishi.chhibber@broadcom.com>
To: gregkh@linuxfoundation.org,
	arnd@arndb.de
Cc: bryan-bt.tan@broadcom.com,
	vishnu.dasa@broadcom.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	rdunlap@infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Rishi Chhibber <rishi.chhibber@broadcom.com>
Subject: [PATCH v3 0/4] misc: vmw_zerocopy: VMware zero-copy buffer sharing driver
Date: Mon, 14 Sep 2026 13:22:05 -0700
Message-ID: <cover.1789413109.git.rishi.chhibber@broadcom.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Summary of changes:
- 1/4 reserves a VMCI datagram resource id for the hypervisor-side
  zero-copy service
- 2/4 adds the vmw_zerocopy driver: /dev/vmw_zc, a single ioctl, page
  pinning and the VMCI datagram transport
- 3/4 documents the userspace interface
- 4/4 adds a kselftest covering the ioctl input-validation paths

This series adds a misc character device, /dev/vmw_zc, that lets guest
userspace hand a buffer to a VMware hypervisor-side peer without copying
it. The driver pins the user pages, collects their guest physical frame
numbers and sends that list over a VMCI datagram; the hypervisor then
reads the buffer directly out of guest memory. An optional metadata
buffer is pinned writable so the peer can return a result through the
same mechanism.

Why not vsock or virtio: this is not paravirtual I/O. The guest is not
sending data to a virtual device; it hands page frame numbers to the
hypervisor and reads the results back inline in those same pages, with
no copy and no ring buffer. Two properties have no mapping onto an
existing virtio device type:

- PFN-level zero copy without ownership transfer. virtio-vsock copies
  through the virtqueue ring. virtio-mem and virtio-balloon transfer
  page ownership to the host; here the guest keeps its pages and unpins
  them when the ioctl returns.
- Per-ioctl synchronous feedback. The metadata pages are pinned
  writable and the peer stores status directly into them, so userspace
  reads the result on ioctl return. storvsc and hv_balloon return
  status in a separate ring packet instead; Xen gntdev's writable
  grants and UNMAP_NOTIFY_CLEAR_BYTE serve persistent ring lifecycles,
  not per-call results.

The established upstream shape for this is a thin guest driver over the
vendor's native transport: Hyper-V builds a PFN list for the host with
vmbus_establish_gpadl(), Xen shares frames through the grant table and
exposes that to userspace in gntdev, and VMware already has vmxnet3,
vmw_pvscsi and vmw_balloon on its own protocols. This driver is the
VMCI equivalent. Discussed in full in the v2 thread (linked below);
2/4 carries the short form.

v2 was posted as a single patch and is split here into a reviewable
series along file boundaries: every file belongs entirely to one patch,
so each commit builds on its own. 1/4 comes first because 2/4 sends to
the resource id it reserves, and because it has a different maintainer
set. vmw_zerocopy_core.c and vmw_zerocopy_vmci.c stay in one patch as
they form a single module and reference each other.

Changes since v2:
- Split the single patch into this four-patch series
- The destination is now owned by the kernel: the userspace-supplied
  peer_id is gone, and that word is a reserved field that must be zero
- Dropped VMW_ZC_MSG_INIT and struct vmw_zc_ioctl_config; the device
  needs no configuration step
- Release metadata pages with unpin_user_pages_dirty_lock(..., true);
  the peer stores through the physical frame, so nothing else marks
  those pages dirty
- Split the VMCI transport out behind a small transport ops struct
- Dropped the out-of-tree KBUILD_EXTMOD build logic from
  drivers/misc/Makefile (Greg Kroah-Hartman)
- Removed __user from struct vmw_zc_guest_raw_buffer; it has no place
  in an ioctl structure (Greg Kroah-Hartman)
- Registered ioctl magic 0xDC in ioctl-number.rst
- Added driver documentation (3/4) and a selftest (4/4)
- Rebased onto v7.3-rc3

Userspace built against the v2 header must be rebuilt: the peer_id field
and the configuration ioctl it used no longer exist. Nothing is merged
upstream, so no stable ABI is affected.

Testing:
- Every commit builds on x86_64 with CONFIG_VMW_ZC=m, and
  make headers_install succeeds at each one
- checkpatch.pl --strict reports nothing on 1/4 and 2/4; on 3/4 and 4/4
  only the MAINTAINERS advisory for newly added files
- The selftest builds, and skips cleanly when /dev/vmw_zc is absent

Link to v2:
https://lore.kernel.org/lkml/20260619182710.2498154-1-rishi.chhibber@broadcom.com/

Transport choice, discussed in the v2 thread:
https://lore.kernel.org/lkml/CABJwUKKCwGxYB0is-U84EgAm6Co9_bfxbkZi56jZNLkzihDRyw@mail.gmail.com/

Rishi Chhibber (4):
  misc: vmw_vmci: Reserve a datagram resource id for zero-copy buffer
    sharing
  misc: vmw_zerocopy: Add VMware zero-copy buffer sharing driver
  Documentation: misc: Add vmw_zerocopy driver documentation
  selftests: misc: Add vmw_zerocopy selftest

 Documentation/misc-devices/index.rst          |   1 +
 Documentation/misc-devices/vmw_zerocopy.rst   | 278 ++++++++++++++++++
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |  10 +
 drivers/misc/Kconfig                          |  23 ++
 drivers/misc/Makefile                         |   2 +
 drivers/misc/vmw_zerocopy_core.c              | 267 +++++++++++++++++
 drivers/misc/vmw_zerocopy_priv.h              |  66 +++++
 drivers/misc/vmw_zerocopy_vmci.c              | 132 +++++++++
 include/linux/vmw_vmci_defs.h                 |   3 +-
 include/uapi/linux/vmw_zerocopy.h             |  67 +++++
 tools/testing/selftests/Makefile              |   1 +
 .../drivers/misc/vmw_zerocopy/.gitignore      |   1 +
 .../drivers/misc/vmw_zerocopy/Makefile        |  20 ++
 .../drivers/misc/vmw_zerocopy/config          |   2 +
 .../misc/vmw_zerocopy/test_vmw_zerocopy.c     | 276 +++++++++++++++++
 16 files changed, 1149 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/misc-devices/vmw_zerocopy.rst
 create mode 100644 drivers/misc/vmw_zerocopy_core.c
 create mode 100644 drivers/misc/vmw_zerocopy_priv.h
 create mode 100644 drivers/misc/vmw_zerocopy_vmci.c
 create mode 100644 include/uapi/linux/vmw_zerocopy.h
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/.gitignore
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/Makefile
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/config
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/test_vmw_zerocopy.c


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.52.0

