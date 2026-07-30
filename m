Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2B5367B7A;
	Thu, 30 Jul 2026 12:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416000; cv=none; b=eTuDgzZ/D9XPp0jrrVn/XxCI9D8HxQslRYmW0gLdEaDVuXk4zvFhX3UJ8H/qc9hLb33X35cg7sa1cP6mPKCIib+urkqwjd5plP9SdVTfpW39p+P80+5VAWL2W6TgaHaKez72jEVIIWZIM4CBvlSjPWYtABKbqUecq1dww/mZ2GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416000; c=relaxed/simple;
	bh=WTJrfy5lhlVzIr0+GK02wFkrzMRDCZiXN1/5McmZzi0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kRVBXfYsF5909liuvl91cpFQ0l2xAluJtEHGoMjgP4xv0cnhzGSBVALGA7L8zCaWjq6Wdo2XmdGbyX2/MKouzoxGN5ESLZNhlaXKkYa4lGa4iSJ/Nb1bubCXWV+Ljll+3j0c/dKQC4qSvLVzw0tucA7enls721GjfSdkFs3sBog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=EVQLVyWl; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="EVQLVyWl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785415999; x=1816951999;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=peRh4OvjcpEHxxqnkJeRQerUf/HNw8qZYDsDK+Mu1Gg=;
  b=EVQLVyWlwk3wBgFr0R4BTXpKSQz/lE1qr0+YuCgtB+AwJjk6h+k5Gg8U
   y8kbsRdCJ1lhVwgArLgl/TkB1s62KVlRyePI7p2LRWjcG0MRRZv/3Zx90
   2nn9KEvitdIDiIX7Wcs1LZrLHqkKrdQMAuggqSYhMSzvNdGwh9bP+hIHt
   RTtyMPSxsx77i5nvlSFbTLFecYlEr6Yekcop9hpG5JTgvLPrl0Jsr6bVJ
   spign5p50VmTE6gOa0/r1k6/kNuMU2xXx1mCZcDAr3gFigQY6kdJm6idu
   WIZYX5ALG3yTlROzpGjRqXDKPAk0Z7+ydiaiuA9vyADjUghYUXzXNC2uW
   Q==;
X-CSE-ConnectionGUID: zN1WTFMBR+WgdjaiepI09A==
X-CSE-MsgGUID: UFz1WFkZRKOPTZ+i3IkxJw==
X-IronPort-AV: E=Sophos;i="6.25,194,1779148800"; 
   d="scan'208";a="24457229"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 12:53:16 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:1840]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.68:2525] with esmtp (Farcaster)
 id 6555cc61-39ff-4a67-906e-8ae841522c74; Thu, 30 Jul 2026 12:53:16 +0000 (UTC)
X-Farcaster-Flow-ID: 6555cc61-39ff-4a67-906e-8ae841522c74
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:53:16 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:53:14 +0000
From: Alexander Graf <graf@amazon.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
	<corbet@lwn.net>
CC: The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Shuah Khan <skhan@linuxfoundation.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mancio@amazon.com>, <diapop@amazon.com>, <mknaust@amazon.com>
Subject: [PATCH 0/8] nitro_enclaves: Support multi-NUMA CPU pools and per-node allocation
Date: Thu, 30 Jul 2026 12:53:04 +0000
Message-ID: <20260730125312.71415-1-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D043UWA001.ant.amazon.com (10.13.139.45) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

An enclave draws its vCPU cores from the driver's single CPU pool, and
by design every CPU in that pool sits on one NUMA node: ne_cpus=
refuses a wider CPU list with -EINVAL and "CPUs with different NUMA
nodes" in dmesg. An operator who wants two enclaves on two nodes has
nowhere to put the second one's cores, and an enclave wider than one
node has to spare cannot be built at all.

Lift it, and let a caller name the node. A pool spanning nodes records
itself as node-agnostic. NE_SET_ALLOC_NUMA_NODE sets a sticky
allocation target on the enclave fd and NE_ALLOC_NUMA_NODE_ANY drops
it; NE_ADD_VCPU with vcpu_id 0 draws from the target and returns the id
it picked, so placing an enclave across two nodes is setting the target
once per node and draining the count. A named node does not spill,
yielding a core on that node or NE_ERR_NO_CPUS_AVAIL_IN_POOL. A
cpu_pool attribute group on the misc device reports mode, total, used
and avail as CPU-list strings; pool threads are offline, so the
per-node view comes from intersecting avail with the node<N>/cpu<M>
symlinks under /sys/devices/system/node.

I picked a per-fd target over a second NE_ADD_VCPU carrying the node on
every call. NE_ADD_VCPU already reports the id it chose, so a VMM
spreading an enclave over several nodes needs no new call, only the
target and the count it already drains; the variant would make that
same VMM learn a new ioctl for behaviour it already has.

Patches 1 to 3 are not the feature: a missing .compat_ioctl, a pool
mutex taken before mutex_init(), and a thread-mask index that collides
cores from different packages, the last preparation with no functional
change. Both fixes carry Fixes: and neither Cc: stable, the mutex splat
needing CONFIG_DEBUG_MUTEXES to appear.

Nothing consumes this yet; the kernel API goes first, and its shape is
what nitro-cli, or a VMM like QEMU, gets built against. A dynamic pool
mode and CMA-sourced enclave memory, both reusing this target, follow
in separate series.

I wrote this series with an AI coding assistant, which drafted the code
and the changelogs, this cover letter included; I reviewed and reworked
all of it before sending, and each commit carries an Assisted-by:
trailer. All eight commits were built detached in three configurations
(x86_64 defconfig with CONFIG_NITRO_ENCLAVES=m, the same with
CONFIG_NUMA=n, and allmodconfig) for 24 warning-free driver builds, and
scripts/checkpatch.pl --strict is clean on all eight.

Alexander Graf (8):
  nitro_enclaves: Let 32-bit processes use the ioctl interface
  nitro_enclaves: Initialise the CPU pool mutex statically
  nitro_enclaves: Slot pool cores by sibling mask
  nitro_enclaves: Allow the CPU pool to span NUMA nodes
  nitro_enclaves: Add NE_SET_ALLOC_NUMA_NODE
  nitro_enclaves: Expose CPU pool state under sysfs
  Documentation: ABI: Describe nitro_enclaves cpu_pool sysfs
  Documentation: virt: Describe multi-NUMA Nitro Enclaves CPU pools

 .../sysfs-devices-virtual-misc-nitro_enclaves |  44 ++
 Documentation/virt/ne_overview.rst            |  25 +-
 MAINTAINERS                                   |   1 +
 drivers/virt/nitro_enclaves/ne_misc_dev.c     | 489 +++++++++++++-----
 drivers/virt/nitro_enclaves/ne_misc_dev.h     |  16 +-
 include/uapi/linux/nitro_enclaves.h           |  62 ++-
 6 files changed, 508 insertions(+), 129 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-virtual-misc-nitro_enclaves


base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
-- 
2.47.1

