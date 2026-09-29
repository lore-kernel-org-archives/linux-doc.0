Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCD855294B
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 19:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710920; cv=none; b=HUTOUdmXS4sTspOXd9r27zptx0EXx+FXbq+4rupkec9MWIePr18rZ7CUdKab8F6N0cuDO0dN5nT1E998Yzf84Ra5F6Q5UIWAs7Dcp7dSt9CL7q4RCYgTKqsY7TO+bOkDa2Zn7rD3ERFfk/YSXiqk3C8xR7uHko4wTr5FE0SyLfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710920; c=relaxed/simple;
	bh=+45BcQ1RgT6MLBnxjeHGPypIakJE07cZ/vx1Nx03QEc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SgSNj+bytApJqC9tuMs1h984rSDOsyasZklijp4pdTeL0ZpiT21Qh9dNUu/gUAZ9+pU21+Cbhj8M4dd0FJZTp+UY0J0WeKXZytGx1ktTc0cUfd5wOdgf2lrIQzYeHLDZ6TEKnQVFsSqLoNCexd5xA2T7at8oqRQAqBLkERqFSoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opnsrc.net; spf=pass smtp.mailfrom=opnsrc.net; dkim=pass (2048-bit key) header.d=opnsrc.net header.i=@opnsrc.net header.b=AHoiS710; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opnsrc.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opnsrc.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opnsrc.net header.i=@opnsrc.net header.b="AHoiS710"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so21808495e9.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 12:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1790710916; x=1791315716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVTdtiWy9fgGK15KimSckpDSSxGqJuOzH/U6G/oihcg=;
        b=AHoiS710qrbR7efH7DlkL03IQTyEvnCZYmgO71Ph/zoNSnAF06WbiH3eFdFex8rdC9
         8z34vHMdh1msubq9Sfz8bfGRQSt7GLheXug10UhsR8wtz2qRYNNUNcxT3lrSvzrq0x50
         n4PEPbK1+LmZRl3pnlr9TNBvHMhFpem2lkS2gYBenHsCWb1P39Tm48k17/Y6orWzro9O
         1bTh5DSl0xTB7iaMh67JccPcsS79/PiLUF8b+be/gMocF1HsNCXfNR+VdhPI/o7SoN6y
         9WS6M9A8donMcfIJ9xqkn2AyUVgGgAL55oqz3He2Tgih/5jxYWcKLbsIFJEy3e1AWcIP
         BCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710916; x=1791315716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVTdtiWy9fgGK15KimSckpDSSxGqJuOzH/U6G/oihcg=;
        b=XlR6V6zc9jYaG3bdQpzlGMlHtIOI+V6QuPcI7CzsfV8wI7vNOvIo/PhVqtgc8PYaiQ
         Tv3suklwG1FP4RxhWd914QexQod6iK9fw24NjjdRTerXDiNHL7R9osJ2h/E1Y1LwhU0x
         Wv4Fs5yLj5JS222SJHfqisvJFdm+XoS1YuFNB6RE9qZs3C/76fCKlgW6VpQniqiTHOPY
         HUINcF7iqkJdeGgJlawdJK8+HfiAr2pghkq3zGL8V/cBHYGlNTrpZWKx2zsuLhnt7SEw
         n7e9EnXtJw1rfI/3MkazqFdqNnLlxg8xUJ66EGBrb6p/fhK9Y1LaIgizPdsLWJhogYeX
         KyKA==
X-Forwarded-Encrypted: i=1; AKwUvBx/XmfFrIFrf2y+oRYx3hdQaphQUQVm03moglVClsCm4BEwPz5Z2Jo2910WIrhUH6lfjfLZR+2wbOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lj1NdJFBacGiSXWBRNMmdULVjtC370MYMApGYoJE/FdpV983S9
	IW9OhsV+TJJ0+sTgnkdTNjQ8njuPj4NNvY7cm21Rb/riB0xsTlK0r7IP86DYXZ63vHM=
X-Gm-Gg: AYBFou1Y7ySv2uI49Kj/lWOIxNlSZS5duVKvSInCMCX0k8Ub7TX1IqTWBogjDyTYPT1
	9/g/lKY7ke9fbPInB4hyWiA7ddwZr7MEJFo+VBJsrLocVvGhZGKrJRbKNTBH7jPDbYHuzVhx187
	QNHozkrpTmnJ8HSyHvs7gZ9qiIH52pQMyYEpecW6vjQAacQd5wbpPgTyuuDFEdTraUwIiMNtbZi
	us5I0E3d/oxWKFGxqzqup5o2LwVsnkLAZwZoElCXZQE57XjiJpIVi0Veg6LZAckr2iB6X5EAngJ
	S5JVEHJSqf/3boVv6SxYkihPKXppkN3gXRyUoaB+Iv3csnrKGJxNH5DMvRTmV4OLFTtEBQJEMnf
	lQLfcruf8oBj8W1ojjVuHLaFZJbbf/uMFJOQ/9TlADK/3qGI66IGRVo9cdYSPz/lxbkQ0scbV7/
	GM30SK+VoEERG/JLT7XmoYo7Co/OaTSEVgHgsmmJku8dwLDqIDp3V3XAWpZXlV4f39VnewsxPhG
	1EHeSjtl8vY7psCkBnJDura8X8CZrvyOzTDWhxARyVpuK0ZjJgUr6UMN7jpAELvx9n0VWk=
X-Received: by 2002:a05:600c:1393:b0:49f:fbf8:87e9 with SMTP id 5b1f17b1804b1-4a014febbbbmr2911245e9.3.1790710915912;
        Tue, 29 Sep 2026 12:41:55 -0700 (PDT)
Received: from localhost.localdomain ([217.146.93.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f77b62sm5238355e9.6.2026.09.29.12.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:41:54 -0700 (PDT)
From: salil.mehta@opnsrc.net
To: Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	James Morse <james.morse@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Gavin Shan <gshan@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Salil Mehta <salil.mehta@opnsrc.net>
Subject: [RFC PATCH 0/2] cpu/hotplug: use cpu_enabled_mask for SMT bringup
Date: Tue, 29 Sep 2026 19:41:28 +0000
Message-Id: <cover.1790692295.git.salil.mehta@opnsrc.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Salil Mehta <salil.mehta@opnsrc.net>

Hi,

For context, I had been away from the QEMU/kernel mailing-list work for an
extended period due to exceptional personal circumstances. I have only
recently started catching up with the Arm vCPU hotplug work and the related
changes that have landed upstream. While doing so, I came across the change
discussed below.

============
I. The Story
============

This is an RFC and, in particular, an open question about the interaction
between cpu_present_mask, cpu_enabled_mask and cpuhp_smt_enable(). I may have
missed a later constraint or discussion while catching up, so I would very
much appreciate a sanity check on the direction proposed here.

Commit f9a82544c717 ("cpu/hotplug: Fix NULL kobject warning in
cpuhp_smt_enable()") fixed a real warning on arm64 by changing the arm64
present-mask semantics: an ACPI Online-Capable CPU which is not MADT
Enabled is no longer initially marked present, and acpi_map_cpu() /
acpi_unmap_cpu() now add and remove it from cpu_present_mask.

I wondered whether the generic enabled mask gives us a narrower way to fix
the original problem.

cpu_enabled_mask was introduced by 4e1a7df45480 ("cpumask: Add enabled
cpumask for present CPUs that can be brought online") specifically for the
case where a CPU can be present but is not currently allowed to be brought
online.  cpuhp_smt_enable() is itself trying to bring offline CPUs online,
so patch 1 simply skips a CPU when !cpu_enabled(cpu).

If that is the intended meaning of cpu_enabled_mask, should
cpuhp_smt_enable() consume it rather than require arm64 to collapse the
present/not-enabled distinction?  Or is there another reason why changing
the arm64 present-mask semantics is preferred here?  I may be missing a
constraint in another architecture or in the SMT hotplug path, hence this
RFC.

Patch 2 reverts f9a82544c717 so that the question can be evaluated with the
original arm64 virtual CPU hotplug model restored.  The ordering is
intentional: the generic enabled check lands first, so reverting the arm64
present-mask change does not reintroduce the NULL-kobject warning.

===========
II. Testing
===========

The series is based on current upstream master, after Linux v7.3-rc5.

An arm64 Image build with CONFIG_ACPI=y, CONFIG_HOTPLUG_CPU=y and
CONFIG_HOTPLUG_SMT=y passes.

The runtime tests were performed on an NVIDIA Jetson Orin Nano system.
The host does not provide hardware SMT; QEMU's virtual SMT topology was
used to exercise the guest HOTPLUG_SMT paths described below.

===============
III. Reproducer
===============

The warning can be reproduced with an arm64 ACPI guest using a virtual SMT
topology, for example:

  qemu-system-aarch64 \
    -machine virt,gic-version=3,acpi=on \
    -accel tcg,thread=multi -cpu cortex-a57 \
    -smp cpus=3,maxcpus=6,sockets=1,clusters=1,cores=3,threads=2 \
    -m 1024M \
    -bios QEMU_EFI.fd \
    -kernel Image \
    -initrd rootfs.cpio.gz \
    -append "console=ttyAMA0 root=/dev/ram rdinit=/init acpi=force" \
    -nographic

After boot:

  cat /sys/devices/system/cpu/present
  cat /sys/devices/system/cpu/enabled
  cat /sys/devices/system/cpu/online

With the pre-f9a arm64 semantics these report:

  present=0-5
  enabled=0-2
  online=0-2

Then exercise SMT disable/enable:

  echo off > /sys/devices/system/cpu/smt/control
  cat /sys/devices/system/cpu/online

  echo on > /sys/devices/system/cpu/smt/control
  cat /sys/devices/system/cpu/online

With the original cpuhp_smt_enable() implementation, the second write
produces the following warning:

  WARNING: fs/sysfs/group.c:137 at internal_create_group+0x418/0x550,
  CPU#2: bash/1

with the relevant call trace:

  internal_create_group+0x418/0x550
  sysfs_create_group+0x20/0x38
  topology_add_dev+0x24/0x38
  cpuhp_invoke_callback+0x174/0x2c0
  __cpuhp_invoke_callback_range+0x98/0x128
  _cpu_up+0x150/0x280
  cpuhp_smt_enable+0xc4/0x128
  control_store+0xf8/0x1f0

With patch 1 followed by patch 2, the same sequence gives:

  SMT off: online=0,2
  SMT on:  online=0-2

and:

  dmesg | grep -E "WARNING:|internal_create_group|cpuhp_smt_enable"

produces no output.

=========================
IV. Additional Comparison
=========================

I also checked cpus=4,maxcpus=6: all four requested initial CPUs are brought
up with the restored present semantics.  By comparison, applying the
f9a82544c717 changes in isolation to the same firmware model resulted in
only the boot CPU being brought up during early SMP initialization, with
the remaining enabled CPUs appearing later through ACPI enumeration.

Both patches pass scripts/checkpatch.pl --strict with no warnings or
errors.

I also have an up-to-date QEMU branch containing the corresponding Arm vCPU
hotplug work used for the tests above. If that would be useful for reproducing
or testing this RFC, please shout and I can share the branch.

=================
V. 'The' Question
=================

The main question for review is therefore whether cpu_enabled_mask should be
the generic eligibility check in cpuhp_smt_enable(), preserving the
present/enabled distinction that motivated the mask, or whether there is a
reason that distinction should instead be removed from arm64.

Many thanks in anticipation!
Salil

Salil Mehta (2):
  cpu/hotplug: Skip disabled CPUs in cpuhp_smt_enable
  Revert "cpu/hotplug: Fix NULL kobject warning in cpuhp_smt_enable()"

 Documentation/arch/arm64/cpu-hotplug.rst | 28 ++++++++++--------------
 arch/arm64/kernel/acpi.c                 |  2 --
 arch/arm64/kernel/smp.c                  | 12 +---------
 kernel/cpu.c                             |  5 +++--
 4 files changed, 16 insertions(+), 31 deletions(-)

-- 
2.34.1
