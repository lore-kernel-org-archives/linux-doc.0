Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E542D466B69
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 13:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034436; cv=none; b=QI+i8gZv4CnoG3HcRU4wWAfLoOGlAzlaV4XP6P/Bb5MKqUuzD3Vk6aTdxRE9C0v4GQROL/3xB9XeOUBNzCJ/gGEZW+dpGbwGIfXBWeBcZ58w/1n4AaBl6botwhDZlBJRsSryQka05KBUeqQj8SRaOkZBrFjup+T/Dkgpki0MFMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034436; c=relaxed/simple;
	bh=aWDiGhV/lDLqtQxlDd4E/xz/jeCA3Oakf6qbhhaXsOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E96eDq8DB6C18bW2iKo17iWvvLjz8b3vY78IUK3bYwIVL3lLQhdM3bKRt3ix4KxXGZiMm0Ech/06Qpr6pGuprcUpSzY/lNav0tzkFwwYCb07qQBm6SUI3Xhg5AcG7BQdE1xHUH37x4vg7baGbqiyxJTWtPO8c+fWtNF4eXr41j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ga44ZEdv; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ga44ZEdv"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e9ecb1e13bso1675163a34.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 06:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784034433; x=1784639233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zu2x7nRWgqnkpJB6Jzio2t+71M646t61MeaMLyeHe/o=;
        b=ga44ZEdv2hBcSKs8eePpyVl7ELdR5AqElHamCr5n8Vns9vyc5oUt/WHFhy3vKgddwe
         On0sozs3BgdjFUfBcLByNwK0Y2164MCU9eliyYbNYBZo322PmFpF0Gbb/N21iv8m0o6R
         0ooQHhf5h4glazwG5CtdUP8hDxXhb7MB2h1d7hLkMRXdwBcBYuOWWSzq1vVLQBT8pIjm
         cuB8PGP5C4J6XLVt+6OXe/QN2lsyLWEARyENQA1BE0re3WPm04sbGeY4dCLolXU4S7DL
         sNDsbkWRYA3+7KaKTX5ez7JCRurWG6TLzm1JapTIFgD0hEQrJmKsn/L84yYUSqXHWaoB
         qdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034433; x=1784639233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zu2x7nRWgqnkpJB6Jzio2t+71M646t61MeaMLyeHe/o=;
        b=CdsNn7cNM6GQSxG9qalItKuJFyY2WkDvJVAcOtuhWvRYICXLaSxUbi8XccC/T7tf2X
         YDTGQ+kQZE/W2qXmu1P3vk2ZzqmQaz18YDHfnE1t42jZk9MtnppwcgwLq95fwWZ7lSGH
         zGnsOhdupcnm1buAuD06zUb6RwEoUeidT2GCj9cZMZf9sa2yRGbjsV93QRjJv5McB6jm
         0DfiV0roji5Pen8jaxr7XJEr03+GEN8wA6/j8++r11PYMRF6Notz165N2wnXLMuvxku5
         YjZkqo/ScYLPIvhQWd6LtLwgXIQ6/SVj3lkaAXxfiVG1qUFmHhoWhRJiCRbgeKnvbCDE
         U8AA==
X-Forwarded-Encrypted: i=1; AFNElJ9R1+/dLZCw5WKMXf62xDx7wlUeG0czlr64TANkE1ykCE+XsUrnta/Ij/DrvbaoZ5apysretMTyaeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzxY6h/4n7EuHZ7Dn2CI19XSPUfv5I8woRhq6gbPpLLbXbfYp1
	nS2Sp/G4Puwwu6/q4lqnyU0OTIPBIgH51UDop15wLq9iDToAJL3/KpcLhFYQHIAHNWI=
X-Gm-Gg: AfdE7cn0NB0sXnDmwSyf+7WopkfWUgb7LQyKGn5KFMt2WfcHjQ3dZa17XH9pFKVwcZ6
	hIqBXHGcDS5ovws1DpzFG4QGIL6u3uky5Ar6dntHaD6lpnTA5gVfAOnCFa+PMMaY8YQSIhnvsui
	590t7R3tcFeQ1qQFY4FAPpY5LlRMjmeZ0uM/KSwTncnqnS6XX5K2s3meeX0Kgs1iAN9Pg3bBESD
	po6W7Po2ZYHHOVr4mb+jYlhBIsBqINUCkKAEpn373qKOPVfWGKRliHQSDp4XTFG7noGKq7iWUE1
	pWfQ3rcXO6U9nwl0FI5RLj9ZIOLXPntFq7FKQUhU4DtMWwuKwoJ4sanLaBfrns3uJ1gHKWu4jJ/
	Wh5I59cAK/yRHkSRiJaYpyg/Q2kGliP18Fqm7S40NiURRarDas6kCVHpqkixkDgGbC5bC0otlf+
	Ivp0MCF9f9zmy+pDZzG151ek3gVxcGdNL/rYxRZPfzyyqQaZuacbx7DJBMuJepFg==
X-Received: by 2002:a05:6830:4412:b0:7e7:45f:ce3c with SMTP id 46e09a7af769-7ec096ac473mr7449408a34.14.1784034432564;
        Tue, 14 Jul 2026 06:07:12 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([178.93.176.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcab8efc3sm14657738a34.0.2026.07.14.06.07.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 06:07:12 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: joro@8bytes.org,
	palmer@dabbelt.com,
	tony.luck@intel.com,
	reinette.chatre@intel.com,
	tomasz.jeznach@linux.dev
Cc: will@kernel.org,
	robin.murphy@arm.com,
	fustini@kernel.org,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	corbet@lwn.net,
	shuah@kernel.org,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [RFC PATCH 0/7] riscv: iommu: Add QoS ID support for resctrl device assignment
Date: Tue, 14 Jul 2026 21:06:50 +0800
Message-ID: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC extends RISC-V CBQRI/resctrl support to external requesters
behind a RISC-V IOMMU.

The RISC-V IOMMU QoS ID extension associates a resource-control ID
(RCID) and monitoring ID (MCID) with IOMMU-related memory requests [2].
For a translated device request, the IOMMU obtains the IDs from the
device context translation attributes (DC.ta) and supplies them to the
I/O bridge after a successful translation. The bridge and downstream
CBQRI-controlled resources can then apply their existing allocation and
monitoring policy to the request.

The series is based directly on Drew Fustini's v4 RISC-V Ssqosid and
CBQRI resctrl series [1]. That dependency provides CPU-side QoS ID
plumbing and CBQRI-backed resctrl support. This series extends the same
resctrl identity to device requests translated by a RISC-V IOMMU.

The RISC-V names map to the existing resctrl identifiers as follows:

    resctrl CLOSID  ->  RISC-V RCID
    resctrl RMID    ->  RISC-V MCID

Userspace first creates a resctrl resource group. The new "devices"
file then assigns an external requester to that group:

    userspace
       |
       | mkdir /sys/fs/resctrl/<group>
       |
       | echo "iommu_group:<id>" > /sys/fs/resctrl/<group>/devices
       v
    generic resctrl devices file
       |
       | (closid, rmid)
       v
    RISC-V CBQRI IOMMU binding backend
       |
       | (rcid, mcid)
       v
    RISC-V IOMMU DC.ta.{RCID,MCID}

The "devices" file is an assignment and membership interface only. It
does not describe a new resctrl resource, schema, or monitoring domain;
resource policy remains in the existing schemata and info files.

Common IOMMU helpers:

The userspace ABI names an IOMMU group by the numeric ID already used by
/sys/kernel/iommu_groups. Patch 1 adds iommu_group_get_by_id() as a
narrow, reference-counted lookup for that existing identifier.

Updating a group also needs stronger iteration semantics than separate
iommu_group_for_each_dev() calls can provide. All devices must be
validated before any device context is changed, and group membership
must not change between validation and update. Patch 2 therefore adds
iommu_group_update_devices():

    lock group->mutex
      for each device: check()          /* may fail, no state changed */
      for each device: update()         /* non-failing callback */
    unlock group->mutex

The helper contains no resctrl or QoS policy. It only provides an
all-or-none validation boundary for a group-wide update while keeping
IOMMU group internals private. The RISC-V IOMMU QoS code is its first
caller.

RISC-V IOMMU programming:

For translated device requests, the per-device-context QoS IDs are
programmed in DC.ta. Active contexts are invalidated after an update so
cached translations do not retain stale IDs. BARE mode cannot safely
represent per-IOMMU-group assignment because only the per-IOMMU
iommu_qosid global default is available, so group assignment rejects
BARE mode.

The RISC-V IOMMU also has a per-IOMMU iommu_qosid register. The series
exposes it as:

    /sys/class/iommu/<iommu>/qosid

This sysfs attribute programs the global RCID and MCID used for
IOMMU-originated DDT, CQ, FQ, PQ, and MSI accesses. In BARE mode,
device-originated requests also use these IDs. It is not a resctrl group
assignment interface.

Open questions for this RFC:

  * whether a common resctrl "devices" file is the right ABI for
    associating external requesters with a resource group;
  * whether iommu_group_get_by_id() is an acceptable narrow common
    helper for resolving the numeric IOMMU group ID passed through that
    ABI; and
  * whether iommu_group_update_devices() provides the right common
    contract for checked group-wide updates.

[1] Drew Fustini's CBQRI v4 series:
https://lore.kernel.org/linux-riscv/20260706-dfustini-atl-sc-cbqri-dt-v4-0-e75c20201d64@kernel.org/
[2] RISC-V IOMMU QoS ID extension:
https://docs.riscv.org/reference/cbqri/qos_iommu.html

Zhanpeng Zhang (7):
  iommu: Add group lookup by ID
  iommu: Add checked group device update helper
  resctrl: Add a devices file for external requester assignment
  iommu/riscv: Program QoS IDs for assigned groups
  iommu/riscv: Expose global QoS IDs in sysfs
  riscv_cbqri: Assign IOMMU groups to resource groups
  selftests/iommu: Add RISC-V IOMMU QoS smoke test

 .../ABI/testing/sysfs-class-iommu-riscv-iommu |  27 +
 Documentation/filesystems/resctrl.rst         |  26 +
 MAINTAINERS                                   |  12 +
 arch/Kconfig                                  |   6 +
 arch/riscv/include/asm/qos.h                  |  28 +
 drivers/iommu/iommu.c                         | 140 +++-
 drivers/iommu/riscv/iommu-bits.h              |  15 +
 drivers/iommu/riscv/iommu.c                   | 419 ++++++++++-
 drivers/iommu/riscv/iommu.h                   |  22 +-
 drivers/resctrl/Kconfig                       |   6 +
 drivers/resctrl/Makefile                      |   1 +
 drivers/resctrl/cbqri_iommu.c                 | 276 ++++++++
 fs/resctrl/rdtgroup.c                         | 206 +++++-
 include/linux/iommu.h                         |  30 +
 include/linux/resctrl.h                       |  45 ++
 tools/testing/selftests/iommu/Makefile        |   2 +
 .../selftests/iommu/iommu_qos_smoke.sh        | 649 ++++++++++++++++++
 17 files changed, 1886 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
 create mode 100644 drivers/resctrl/cbqri_iommu.c
 create mode 100755 tools/testing/selftests/iommu/iommu_qos_smoke.sh


base-commit: ab754eba620f5a66e7277b7b2d0e706aa7743e8a
-- 
2.50.1 (Apple Git-155)
