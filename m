Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2466E34CFAB
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 20:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779481455; cv=none; b=iCd/j5Cn/QQkeXtekkdS/YSbWWPobG1z9O2/f0teYwK6m/5b+pVx7M+HRiMXV1V6YOQYkRw60FtlCTmCH39d81t4pPJCu8GlfZqRc1YEQNN1oEn73Pu6CsB81V5Rid4AvJInx85aFzS4mw0ufoc2Bp4bha+3KLlimSrwB7NNIb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779481455; c=relaxed/simple;
	bh=w3XpnxIujxebuyH1GexUjdTGn8LmIKkiUJvuqbgwCIc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qaKgmxMSxkdw+2bUJQMyGDaXoZS7uNghYBg8RlJpAVb8GMtCiwRznb14Lm4/n8YjFeiH8YyyJCa0PjVIJXr8Z71kwD1K1VEPbrumIdyEWSYAhNAByQuv79Tod9IU87BJD5SYnmEZs7PwlBZiRlysCd7cw03xaJHgI9nEbB7dyw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SZ8nai0e; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SZ8nai0e"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c8292a9605aso3769459a12.0
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779481452; x=1780086252; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lAtyCPo6ylTfae9lzbtctQSa6ySROp5Ur4512Ppcl24=;
        b=SZ8nai0eu2bvlRWpzAq4HV6QM1dzwGj3V7sifR6gvj/hbDxDezcIa3OH4ortMbnNob
         ymAWf8YnLCme2rea6oTKTLj5jlSj1t/4e2t16apKR3Ju25KH0r6+GWFEaJ0njpQdh9D4
         lCvixD9bpevn0lwKGdDL9b+/Y80pwA6bG/soxtZSaUauz1aTr4SlODHyw+YBxZcFfV0n
         hAyrkNBWhFsoVlvWNHECJBT6Us0wMJeucCJ7mfSFfzMR2yluM+n9qPJbnofGAcQVOG+f
         dElrAq4hXTKjy31XhAosWQVMkWcScbOHueLYR5O2ZuhiBAP3xr+rFD4d0RDFiMTXxMHx
         HC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779481452; x=1780086252;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lAtyCPo6ylTfae9lzbtctQSa6ySROp5Ur4512Ppcl24=;
        b=VtJsfBN5plJHVzbJg0rJO/if6vHMqT9a961xImcOuyJebN3CPzjIRZYch4r5vSpUZA
         NLbPBLn3XKhCVfCwvzeEDeOzaMczCZEI/gXY4Zl4A0Gn5ceLrJ9sVctS2J1t06sm2kgv
         5TYKByTiE1ra2T51Kh7cXa5t3YPqlbZG77BR6viM1/Gc8vbVvQiUQ1KTsWQZ0bgWyKUh
         YMII0kHBsLyuBRlS6XrJRYWeQJIrzXD/KFkzKOGBOatB/9JPDqUhPwJNCrT3cOJr9frI
         ISv9lSOeITboQXRNKpU38FsXuBNfHbwfgi0TLFvlFLsxFNUT9vLaoO2jwWbUXpb27yVo
         QkQg==
X-Forwarded-Encrypted: i=1; AFNElJ9o9Uds5+Qy8L8f/Cgl+9viJVAK66fZUmVDGfgvfcq3gbVvSPAAOCQxbAAlsjktBq3ijM9HmlHN21o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzobN5gUfXu+LSSiflzlemqc3i1OHbK/Jm6wYYT27lxB33+NTR+
	GowaxtpAPHy/xfZOYRlLWIl1p6TyhouV8fAp6+6NMNWWfPxF0oGnKelETGCA/vm1UEAwWKG5tH+
	zxAoMB281eKJ4Iw==
X-Received: from pggh19.prod.google.com ([2002:a63:c013:0:b0:c74:1130:c2ea])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:918a:b0:3aa:c93b:6266 with SMTP id adf61e73a8af0-3b328c98e37mr5376986637.19.1779481452060;
 Fri, 22 May 2026 13:24:12 -0700 (PDT)
Date: Fri, 22 May 2026 20:23:58 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260522202410.3104264-1-dmatlack@google.com>
Subject: [PATCH v6 00/12] PCI: liveupdate: PCI core support for Live Update
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

This series can be found on GitHub:

  https://github.com/dmatlack/linux/tree/liveupdate/pci/base/v6

This series introduces initial support in the PCI core for Live Update,
enabling drivers to preserve PCI devices across a kexec-based kernel
update without interrupting the device. This functionality is critical
for minimizing downtime in environments where PCI devices (e.g., those
assigned to VMs via VFIO) must continue operating or maintain state
across a host kernel upgrade.

Specifically, this series allows preserved PCI devices to perform
uninterrupted memory transactions (DMA) to/from system memory across a
Live Update. These devices can be behind a bridge but must not be VFs.
Support for P2P and VF preservation will be addressed in future series.

Series Overview
---------------

This series implements the following to support PCI device preservation
across Live Update:

  1. Set up a File-Lifecycle-Bound (FLB) handler to track and preserve
     PCI-specific state (struct pci_ser) across Live Update using Kexec
     Handover (KHO).

  2. Add APIs for drivers to register outgoing-preserved devices for
     preservation and for the PCI core to identify incoming-preserved
     devices during enumeration.

  3. Automatically preserve all upstream bridges for any preserved
     endpoint. Use reference counting to ensure bridges remain preserved
     as long as any downstream device is preserved.

  4. Guarantee that preserved devices retain the same RequesterID (bus,
     device, function) for the duration of their preservation by
     inheriting secondary bus numbers, subordinate bus numbers, and ARI
     Forwarding Enable on preserved bridges.

  5. Guarantee that memory transactions to/from preserved devices are
     routed consistently by inheriting Access Control Services (ACS)
     flags across a Live Update, from the endpoint up to the root port.

  6. Modify the PCI shutdown path to avoid disabling bus mastering on
     preserved devices, thereby allowing preserved devices to perform
     uninterrupted during kexec for Live Update.

  7. Provide comprehensive documentation for the FLB API, device
     tracking mechanisms, and the division of responsibilities between
     the PCI core, drivers, and userspace.

Dependencies
------------

This series is built on top of the next branch of the liveupdate.git
tree, which includes two commits to enable refcounting the incoming FLB:

  https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git/log/?h=next

Testing
-------

This series was tested in conjunction with v4 of the VFIO PCI driver
series:

  https://lore.kernel.org/kvm/20260511234802.2280368-1-vipinsh@google.com/

The full set of patches used for testing can be found on GitHub:

  https://github.com/dmatlack/linux/tree/liveupdate/pci/base/v6-with-vfio

Testing was performed using the new VFIO selftests:

  - vfio_pci_liveupdate_uapi_test
  - vfio_pci_liveupdate_kexec_test

Both tests were run in a QEMU-based VM environment (using a single
virtio-net PCIe device connected to a root port to exercise bridge
support) and on bare metal using an Intel EMR server with 8x Intel DSA
PCIe devices and 1x NVMe device.

Future Work
-----------

Following this series, we expect to make further improvements to the PCI
core support for Live Update:

  - Allow P2P across Live Update by avoiding resizing or moving
    preserved device BARs and preserving all upstream bridge windows.

  - Support preserving Virtual Functions by preserving SR-IOV
    configuration on PFs and enumerating VFs after Live Update.

Changelog
---------

v6:
 - Fix truncated domain during bit shift in pci_ser_xa_key() (Sashiko)
 - Replace complex and buggy per-device locks and outgoing mutex with a
   single rwsem (me)
 - Use a loop instead of recursion to walk upstream bridges (Sashiko)
 - Correctly account for all devices that need quirks to enable ACS
   instead of relying on PCI_DEV_FLAGS_ACS_ENABLED_QUIRK. This required
   adding a patch to refactor pci_dev_acs_ops in quirks.c (Sashiko)
 - Fix circular locking dependency between pci_rescan_remove_lock and
   pci_liveupdate_flb.private->incoming.lock (me)
 - Convert several functions to return 0/error instead of true/false.
 - Bump PCI_LUO_FLB_COMPATIBLE in the patch that changes the semantics
   of pci_dev_ser.refcount (me)
 - Convert was_prepared and frozen from bitfields to bools to avoid
   KCSAN warnings (Sashiko)
 - Drop experimental verbiage from Kconfig and Documentation (me)
 - Ensure that bridges inherit bus numbers during scanning if their
   parent bridge also inherits bus numbers. Otherwise, a race between a
   scan and pci_liveupdate_finish() could result in a bridge assigning a
   bus window larger than its parent while its parent is forced to
   inherit bus numbers (i.e., cannot expand) (me)
 - Free struct pci_ser if an error occurs during pci_flb_retrieve()
   (Sashiko)
 - Detect duplicate entries in incoming FLB when constructing xarray and
   return an error instead of silently ignoring (me)
 - Add a wrapper function for fetching from the outgoing FLB (me)
 - Grammatical and spelling fixes (Bjorn)
 - Don't bother forcing bus inheritance when only outgoing devices are
   preserved. If a scan causes a bus number conflict, that is a general
   PCI core bug; it is not specific to Live Update (me)
 - Convert bitfields in struct pci_liveupdate to bools to avoid data
   races (me)

v5: https://lore.kernel.org/linux-pci/20260512184846.119396-1-dmatlack@google.com/
v4: https://lore.kernel.org/linux-pci/20260423212316.3431746-1-dmatlack@google.com/
v3: https://lore.kernel.org/kvm/20260323235817.1960573-1-dmatlack@google.com/
v2: https://lore.kernel.org/kvm/20260129212510.967611-1-dmatlack@google.com/
v1: https://lore.kernel.org/kvm/20251126193608.2678510-1-dmatlack@google.com/
rfc: https://lore.kernel.org/kvm/20251018000713.677779-1-vipinsh@google.com/


David Matlack (12):
  PCI: liveupdate: Set up FLB handler for the PCI core
  PCI: liveupdate: Track outgoing preserved PCI devices
  PCI: liveupdate: Track incoming preserved PCI devices
  PCI: liveupdate: Document driver binding responsibilities
  PCI: liveupdate: Keep bus numbers constant during Live Update
  PCI: liveupdate: Auto-preserve upstream bridges across Live Update
  PCI: Refactor matching logic for pci_dev_acs_ops
  PCI: liveupdate: Inherit ACS flags in incoming preserved devices
  PCI: liveupdate: Inherit ARI Forwarding Enable on preserved bridges
  PCI: liveupdate: Freeze preservation status during shutdown
  PCI: liveupdate: Do not disable bus mastering on preserved devices
    during kexec
  Documentation: PCI: Add documentation for Live Update

 Documentation/PCI/index.rst                   |   1 +
 Documentation/PCI/liveupdate.rst              |  29 +
 .../admin-guide/kernel-parameters.txt         |   6 +-
 Documentation/core-api/liveupdate.rst         |   1 +
 MAINTAINERS                                   |  12 +
 drivers/pci/Kconfig                           |  15 +
 drivers/pci/Makefile                          |   1 +
 drivers/pci/liveupdate.c                      | 850 ++++++++++++++++++
 drivers/pci/liveupdate.h                      |  68 ++
 drivers/pci/pci-driver.c                      |   9 +-
 drivers/pci/pci.c                             |  13 +-
 drivers/pci/pci.h                             |   5 +
 drivers/pci/probe.c                           |  22 +-
 drivers/pci/quirks.c                          |  57 +-
 include/linux/kho/abi/pci.h                   |  65 ++
 include/linux/pci.h                           |   4 +
 include/linux/pci_liveupdate.h                |  77 ++
 17 files changed, 1197 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/PCI/liveupdate.rst
 create mode 100644 drivers/pci/liveupdate.c
 create mode 100644 drivers/pci/liveupdate.h
 create mode 100644 include/linux/kho/abi/pci.h
 create mode 100644 include/linux/pci_liveupdate.h


base-commit: 34e8f02817e31826e76bb2ded48bf28fe921f20b
-- 
2.54.0.746.g67dd491aae-goog

