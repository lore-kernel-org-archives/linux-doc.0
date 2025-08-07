Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2845944F
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 01:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754531090; cv=none; b=EQDgcOHcfTFeeawkyCFxIMfliVNI+ES5rH6lSgQBPF4ll20J2raKIzNGo8oeF9mSi1+t1SGgWx0C2nrehphpd4AjrYOUmocNs7B9pkQ+YQ4NZYJJ59/Vjt/9lliaw1GOHC0PTsHmKsx2Vkah3oLHc7snzhxmB2F9+wTWFst+kfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754531090; c=relaxed/simple;
	bh=bs1oq2s6w7ZsmL0ymLneQHXjHaSJ27ylm6+tM2L3oi8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=W+IHxj0+YzSIlCx8yJ0wViT9Zj9TlDUv7tMRkC9kWM9q/dK6s3fzLGFwImFGZXUJ8UTMeW3F4YyGDzcowWtRtGFCvRE5RBqCvibMQZ0XwV00S1jo1fOXLPswO8uIAgVjr4iXRhkYkC3DCIFfbgke0MoZ6mCq+Jnjqm5HSKXkH2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=UGkbtAx5; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="UGkbtAx5"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-7074bad053bso7674116d6.0
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 18:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754531087; x=1755135887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5t5WgdCKzZLs/8XYDHF2Wi+CjvSv2e7yJlvUgWs9NXE=;
        b=UGkbtAx5B4owcthqjXm4Mt6f/lHE63zndiC3s6weB5JJMO08epTOmHO8SZqYEAM8S1
         gbQ4ELjv4TiMFc53pqtVvLO2a4CRbwXQ9a5/9jQ/FiaVNaUl3cH6wovSf99RBa+NCcdF
         /eiz8B1AjIkhH9Dqslp/01MU3GfYZq0bvlQMcmdchkSC5wwNdtRPELsHJkT/+DbEjKkZ
         SXa/xXNHnyBT3ScFOqcrYwcItJEiZkpTsdSU9i7R0o+rIHlWPup8QjYDceIcieLMHT1q
         TRNYOFuTtPLAq9OnCmLBGGYLWzZH2GTBJwliC0NEaBJz1M0qeY7NA/O3cCwvQU3GO1Sj
         d/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754531087; x=1755135887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5t5WgdCKzZLs/8XYDHF2Wi+CjvSv2e7yJlvUgWs9NXE=;
        b=EhXgYL4T6IydPQogNQRvvKVO+RhWnfVREHGf+i2PgYufeKQbbox2WffYrxFhe70O96
         JJ/JihVGD20VP9kOvAdGfQSWA0nYkf0Pb2usqZcUdZNdvEoKNm6DCudW0vjBXopLfipi
         qwKB6FBMNvLm8w4ECW1yrJkmIPvBgyLlrXLywleLJshy85wETKGEHwnQ6nendHCa3jPU
         RcO8QHESXAluOtv1TtAd7SxgPWrwVV+2095I16xHxm1BSmQWa2p2P5uCyTGRkARLgtF/
         s52lsEB9Je6OYfdccPMvfh4A6Fd2TGqqhd8Hg/TVM/BqJ/Pa25TJoFy5kothDnPDBz1s
         sH+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUs1KeBHJ8KHulPuWYn7cxI/d5UMWO2Qv8BpZAJAYV4Do96dU6IhWsXe3aYwjNqpHy/cLp8G2+7pYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa7y8Zne6LbowtG+MPlETkN2jyPZ2b3KcChFbY5mi//8CMGv+P
	S4rGZufyXWEdXPTnAq8l5cxS/6XdkLdR1DdeDZBpWTz/9qOAOcDq+WKntTKwtV0c7Wk=
X-Gm-Gg: ASbGncshSFm8MeFB3OeLEW++Iu4CJpcwK0OJNTfihyzNkxxZsOO6L386yjUXVWhsZqj
	aTDLK77YzKXQUpP1S2AJ+nAgOW1N1MkXcYmem1v6VdSCod2JpJcpz4HlMTXn3alOZt+yUi9/KLX
	uT5u3wOMSed5Wt3SNEeClpPrXi0/fmu/HWT2fy2YaYkQSpx4wV/3vOubyFLRcYOP5YeM6O/QYx7
	0gPem4IwUmjQl02yLa4/u6ZVEioPJOTnijoxFFUgbIrzZ09QVTbBciBOIPmAxkNrKVqqb2Dyp6z
	uSsIQJQR6CkJtbhC8rRWZYkedOpurjGRlMwzmlhXw1R/e7fCZYMVYzvxumSrZeHczVSzAjO7QhJ
	CZLf7bxAbx00YNUVl2UCuh2AW8DFIOqFN+9HanMOcJd4YcWCsFsi4/io8KD+l41bckXWmOfzrk1
	Ruk47kFVF+RCWb
X-Google-Smtp-Source: AGHT+IGPO+4xl7nmrZIZyIJy0fZvzD2A/U8JcZ0l0oDJH7U01tS0yC0z69NB5gtl+sosZxuKwCrmqw==
X-Received: by 2002:a05:6214:4015:b0:707:6323:24f3 with SMTP id 6a1803df08f44-709794fdd52mr69986346d6.11.1754531086578;
        Wed, 06 Aug 2025 18:44:46 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5a01sm92969046d6.70.2025.08.06.18.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 18:44:46 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com
Subject: [PATCH v3 00/30] Live Update Orchestrator
Date: Thu,  7 Aug 2025 01:44:06 +0000
Message-ID: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces the LUO, a kernel subsystem designed to
facilitate live kernel updates with minimal downtime,
particularly in cloud delplyoments aiming to update without fully
disrupting running virtual machines.

This series builds upon KHO framework by adding programmatic
control over KHO's lifecycle and leveraging KHO for persisting LUO's
own metadata across the kexec boundary. The git branch for this series
can be found at:

https://github.com/googleprodkernel/linux-liveupdate/tree/luo/v3

Changelog from v2:
- Addressed comments from Mike Rapoport and Jason Gunthorpe
- Only one user agent (LiveupdateD) can open /dev/liveupdate
- Release all preserved resources if /dev/liveupdate closes
  before reboot.
- With the above changes, sessions are not needed, and should be
  maintained by the user-agent itself, so removed support for
  sessions.
- Added support for changing per-FD state (i.e. some FDs can be
  prepared or finished before the global transition.
- All IOCTLs now follow iommufd/fwctl extendable design.
- Replaced locks with guards
- Added a callback for registered subsystems to be notified
  during boot: ops->boot().
- Removed args from callbacks, instead use container_of() to
  carry context specific data (see luo_selftests.c for example).
- removed patches for luolib, they are going to be introduced in
  a separate repository.

What is Live Update?
Live Update is a kexec based reboot process where selected kernel
resources (memory, file descriptors, and eventually devices) are kept
operational or their state preserved across a kernel transition. For
certain resources, DMA and interrupt activity might continue with
minimal interruption during the kernel reboot.

LUO provides a framework for coordinating live updates. It features:
State Machine: Manages the live update process through states:
NORMAL, PREPARED, FROZEN, UPDATED.

KHO Integration:

LUO programmatically drives KHO's finalization and abort sequences.
KHO's debugfs interface is now optional configured via
CONFIG_KEXEC_HANDOVER_DEBUG.

LUO preserves its own metadata via KHO's kho_add_subtree and
kho_preserve_phys() mechanisms.

Subsystem Participation: A callback API liveupdate_register_subsystem()
allows kernel subsystems (e.g., KVM, IOMMU, VFIO, PCI) to register
handlers for LUO events (PREPARE, FREEZE, FINISH, CANCEL) and persist a
u64 payload via the LUO FDT.

File Descriptor Preservation: Infrastructure
liveupdate_register_filesystem, luo_register_file, luo_retrieve_file to
allow specific types of file descriptors (e.g., memfd, vfio) to be
preserved and restored.

Handlers for specific file types can be registered to manage their
preservation and restoration, storing a u64 payload in the LUO FDT.

User-space Interface:

ioctl (/dev/liveupdate): The primary control interface for
triggering LUO state transitions (prepare, freeze, finish, cancel)
and managing the preservation/restoration of file descriptors.
Access requires CAP_SYS_ADMIN.

sysfs (/sys/kernel/liveupdate/state): A read-only interface for
monitoring the current LUO state. This allows userspace services to
track progress and coordinate actions.

Selftests: Includes kernel-side hooks and userspace selftests to
verify core LUO functionality, particularly subsystem registration and
basic state transitions.

LUO State Machine and Events:

NORMAL:   Default operational state.
PREPARED: Initial preparation complete after LIVEUPDATE_PREPARE
          event. Subsystems have saved initial state.
FROZEN:   Final "blackout window" state after LIVEUPDATE_FREEZE
          event, just before kexec. Workloads must be suspended.
UPDATED:  Next kernel has booted via live update. Awaiting restoration
          and LIVEUPDATE_FINISH.

Events:
LIVEUPDATE_PREPARE: Prepare for reboot, serialize state.
LIVEUPDATE_FREEZE:  Final opportunity to save state before kexec.
LIVEUPDATE_FINISH:  Post-reboot cleanup in the next kernel.
LIVEUPDATE_CANCEL:  Abort prepare or freeze, revert changes.

v2: https://lore.kernel.org/all/20250723144649.1696299-1-pasha.tatashin@soleen.com
v1: https://lore.kernel.org/all/20250625231838.1897085-1-pasha.tatashin@soleen.com
RFC v2: https://lore.kernel.org/all/20250515182322.117840-1-pasha.tatashin@soleen.com
RFC v1: https://lore.kernel.org/all/20250320024011.2995837-1-pasha.tatashin@soleen.com

Changyuan Lyu (1):
  kho: add interfaces to unpreserve folios and physical memory ranges

Mike Rapoport (Microsoft) (1):
  kho: drop notifiers

Pasha Tatashin (23):
  kho: init new_physxa->phys_bits to fix lockdep
  kho: mm: Don't allow deferred struct page with KHO
  kho: warn if KHO is disabled due to an error
  kho: allow to drive kho from within kernel
  kho: make debugfs interface optional
  kho: don't unpreserve memory during abort
  liveupdate: kho: move to kernel/liveupdate
  liveupdate: luo_core: luo_ioctl: Live Update Orchestrator
  liveupdate: luo_core: integrate with KHO
  liveupdate: luo_subsystems: add subsystem registration
  liveupdate: luo_subsystems: implement subsystem callbacks
  liveupdate: luo_files: add infrastructure for FDs
  liveupdate: luo_files: implement file systems callbacks
  liveupdate: luo_ioctl: add userpsace interface
  liveupdate: luo_files: luo_ioctl: Unregister all FDs on device close
  liveupdate: luo_files: luo_ioctl: Add ioctls for per-file state
    management
  liveupdate: luo_sysfs: add sysfs state monitoring
  reboot: call liveupdate_reboot() before kexec
  kho: move kho debugfs directory to liveupdate
  liveupdate: add selftests for subsystems un/registration
  selftests/liveupdate: add subsystem/state tests
  docs: add luo documentation
  MAINTAINERS: add liveupdate entry

Pratyush Yadav (5):
  mm: shmem: use SHMEM_F_* flags instead of VM_* flags
  mm: shmem: allow freezing inode mapping
  mm: shmem: export some functions to internal.h
  luo: allow preserving memfd
  docs: add documentation for memfd preservation via LUO

 .../ABI/testing/sysfs-kernel-liveupdate       |   51 +
 Documentation/admin-guide/index.rst           |    1 +
 Documentation/admin-guide/liveupdate.rst      |   16 +
 Documentation/core-api/index.rst              |    1 +
 Documentation/core-api/kho/concepts.rst       |    2 +-
 Documentation/core-api/liveupdate.rst         |   57 +
 Documentation/mm/index.rst                    |    1 +
 Documentation/mm/memfd_preservation.rst       |  138 +++
 Documentation/userspace-api/index.rst         |    1 +
 .../userspace-api/ioctl/ioctl-number.rst      |    2 +
 Documentation/userspace-api/liveupdate.rst    |   25 +
 MAINTAINERS                                   |   19 +-
 include/linux/kexec_handover.h                |   53 +-
 include/linux/liveupdate.h                    |  203 ++++
 include/linux/shmem_fs.h                      |   23 +
 include/uapi/linux/liveupdate.h               |  399 +++++++
 init/Kconfig                                  |    2 +
 kernel/Kconfig.kexec                          |   14 -
 kernel/Makefile                               |    2 +-
 kernel/liveupdate/Kconfig                     |   90 ++
 kernel/liveupdate/Makefile                    |   17 +
 kernel/{ => liveupdate}/kexec_handover.c      |  554 ++++-----
 kernel/liveupdate/kexec_handover_debug.c      |  222 ++++
 kernel/liveupdate/kexec_handover_internal.h   |   45 +
 kernel/liveupdate/luo_core.c                  |  517 +++++++++
 kernel/liveupdate/luo_files.c                 | 1033 +++++++++++++++++
 kernel/liveupdate/luo_internal.h              |   60 +
 kernel/liveupdate/luo_ioctl.c                 |  297 +++++
 kernel/liveupdate/luo_selftests.c             |  345 ++++++
 kernel/liveupdate/luo_selftests.h             |   84 ++
 kernel/liveupdate/luo_subsystems.c            |  452 ++++++++
 kernel/liveupdate/luo_sysfs.c                 |   92 ++
 kernel/reboot.c                               |    4 +
 mm/Makefile                                   |    1 +
 mm/internal.h                                 |    6 +
 mm/memblock.c                                 |   56 +-
 mm/memfd_luo.c                                |  507 ++++++++
 mm/shmem.c                                    |   52 +-
 tools/testing/selftests/Makefile              |    1 +
 tools/testing/selftests/liveupdate/.gitignore |    1 +
 tools/testing/selftests/liveupdate/Makefile   |    7 +
 tools/testing/selftests/liveupdate/config     |    6 +
 .../testing/selftests/liveupdate/liveupdate.c |  406 +++++++
 43 files changed, 5448 insertions(+), 417 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-liveupdate
 create mode 100644 Documentation/admin-guide/liveupdate.rst
 create mode 100644 Documentation/core-api/liveupdate.rst
 create mode 100644 Documentation/mm/memfd_preservation.rst
 create mode 100644 Documentation/userspace-api/liveupdate.rst
 create mode 100644 include/linux/liveupdate.h
 create mode 100644 include/uapi/linux/liveupdate.h
 create mode 100644 kernel/liveupdate/Kconfig
 create mode 100644 kernel/liveupdate/Makefile
 rename kernel/{ => liveupdate}/kexec_handover.c (74%)
 create mode 100644 kernel/liveupdate/kexec_handover_debug.c
 create mode 100644 kernel/liveupdate/kexec_handover_internal.h
 create mode 100644 kernel/liveupdate/luo_core.c
 create mode 100644 kernel/liveupdate/luo_files.c
 create mode 100644 kernel/liveupdate/luo_internal.h
 create mode 100644 kernel/liveupdate/luo_ioctl.c
 create mode 100644 kernel/liveupdate/luo_selftests.c
 create mode 100644 kernel/liveupdate/luo_selftests.h
 create mode 100644 kernel/liveupdate/luo_subsystems.c
 create mode 100644 kernel/liveupdate/luo_sysfs.c
 create mode 100644 mm/memfd_luo.c
 create mode 100644 tools/testing/selftests/liveupdate/.gitignore
 create mode 100644 tools/testing/selftests/liveupdate/Makefile
 create mode 100644 tools/testing/selftests/liveupdate/config
 create mode 100644 tools/testing/selftests/liveupdate/liveupdate.c

-- 
2.50.1.565.gc32cd1483b-goog

