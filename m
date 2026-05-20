Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7341A1A316E;
	Wed, 20 May 2026 02:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779243669; cv=none; b=RuwhBDpGO3MQH2wyb2nQko5bWPnNzsOFfPwBzTSpP4IKk9qUvDnMDRoGR4t3TshCv2V/BMwcmOqSqGSzQTaJfzpP9VvJ2eKMGoGKxDHwYKNpQP2A1vObBaBQdtJSyihvTFd9tmThjAeCRxxN500IhXCSZjlO2jn9bv9EGM0zkM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779243669; c=relaxed/simple;
	bh=bIiAeNc0kLVkgd2sIX5UveMV06ZOweT+UMo4nbdCSFM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CBZChsAMyFEe9XtKSxhlPs4zZO6/BozigWac4kB3P5XeareeJCxuWYWRdRZgJl4s4Ubv47oKYF+nMQiHeJIgWSO/7ZH+xzDqL8pU+yM7XFuwtFKh76be6MbiQuKQ6D9q6jFv6TU4OSMKs+6Xa3oKfDyenLQlHAA9I/4F9zrWTwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=flpDURmk; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="flpDURmk"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PevU0F4jjnAvB4UOXaVhivaHCS4EgFrG2FIPKpLHig4=;
	b=flpDURmkkSiE4eh0L3avYFvpkgh1mVtXfvsyipIUPfwmQXsCdaMUKT9eeh5b+2/gfXOGN4v3c
	a5XRrafLzolSL8grN+yowUweQaNGL5nQCva8Ax9sS2PLc6s2/sRHGH/ufdHiapTSVUJeMYH30ou
	5kYQuMae+60uxr6Ieuek5mI=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gKw7G6T8dzLlTC;
	Wed, 20 May 2026 10:13:14 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id AD994402AB;
	Wed, 20 May 2026 10:20:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 20 May
 2026 10:20:54 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <punit.agrawal@oss.qualcomm.com>,
	<jic23@kernel.org>, <osama.abdelkader@gmail.com>, <chenl311@chinatelecom.cn>,
	<fengchengwen@huawei.com>, <suzuki.poulose@arm.com>, <maz@kernel.org>,
	<lpieralisi@kernel.org>, <timothy.hayes@arm.com>, <sascha.bischoff@arm.com>,
	<arnd@arndb.de>, <mrigendra.chaubey@gmail.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>, <yangyicong@hisilicon.com>,
	<sudeep.holla@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3] cpu/hotplug: Fix NULL kobject warning in cpuhp_smt_enable()
Date: Wed, 20 May 2026 10:20:23 +0800
Message-ID: <20260520022023.126670-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)

On arm64, when booting with `maxcpus` greater than the number of present
CPUs (e.g., QEMU -smp cpus=4,maxcpus=8), some CPUs are marked as 'present'
but have not yet been registered via register_cpu(). Consequently,
the per-cpu device objects for these CPUs are not yet initialized.

In cpuhp_smt_enable(), the code iterates over all present CPUs. Calling
_cpu_up() for these unregistered CPUs eventually leads to
sysfs_create_group() being called with a NULL kobject (or a kobject
without a directory), triggering the following warning in
fs/sysfs/group.c:

	if (WARN_ON(!kobj || (!update && !kobj->sd)))
		return -EINVAL;

When booting with ACPI, arm64 smp_prepare_cpus() currently sets all
enumerated CPUs as "present" regardless of their status in the MADT. This
causes issues with SMT hotplug control. For instance, with QEMU's
"-smp 4,maxcpus=8" configuration, the MADT GICC entries are populated as
follows: the first four CPUs are marked Enabled while the remaining four
are marked Online Capable to support potential hot-plugging.

Fix this by:

1. When booting with ACPI, checking the ACPI_MADT_ENABLED flag in the GICC
   entry before calling set_cpu_present() during SMP initialization.

2. Properly managing the present mask in acpi_map_cpu() and
   acpi_unmap_cpu() to support actual CPU hotplug events, This aligns with
   other architectures like x86 and LoongArch.

3. Update the arm64 CPU hotplug documentation to no longer state that all
   online-capable vCPUs are marked as present by the kernel at boot time.

This ensures that only physically available or explicitly enabled CPUs
are in the present mask, keeping the SMT control logic consistent with
the actual hardware state.

How to reproduce:

	1. echo off > /sys/devices/system/cpu/smt/control
		psci: CPU1 killed (polled 0 ms)
		psci: CPU3 killed (polled 0 ms)

	2. echo 2 > /sys/devices/system/cpu/smt/control

	Detected PIPT I-cache on CPU1
	GICv3: CPU1: found redistributor 1 region 0:0x00000000080c0000
	CPU1: Booted secondary processor 0x0000000001 [0x410fd082]
	Detected PIPT I-cache on CPU3
	GICv3: CPU3: found redistributor 3 region 0:0x0000000008100000
	CPU3: Booted secondary processor 0x0000000003 [0x410fd082]
	------------[ cut here ]------------
	WARNING: fs/sysfs/group.c:137 at internal_create_group+0x41c/0x4bc, CPU#2: sh/181
	Modules linked in:
	CPU: 2 UID: 0 PID: 181 Comm: sh Not tainted 7.0.0-rc1-00010-g8d13386c7624 #142 PREEMPT
	Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
	pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	pc : internal_create_group+0x41c/0x4bc
	lr : sysfs_create_group+0x18/0x24
	sp : ffff80008078ba40
	x29: ffff80008078ba40 x28: ffff296c980ad000 x27: ffff00007fb94128
	x26: 0000000000000054 x25: ffffd693e845f3f0 x24: 0000000000000001
	x23: 0000000000000001 x22: 0000000000000004 x21: 0000000000000000
	x20: ffffd693e845fc10 x19: 0000000000000004 x18: 00000000ffffffff
	x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
	x14: 0000000000000358 x13: 0000000000000007 x12: 0000000000000350
	x11: 0000000000000008 x10: 0000000000000407 x9 : 0000000000000400
	x8 : ffff00007fbf3b60 x7 : 0000000000000000 x6 : ffffd693e845f3f0
	x5 : ffff00007fb94128 x4 : 0000000000000000 x3 : ffff000000f4eac0
	x2 : ffffd693e7095a08 x1 : 0000000000000000 x0 : 0000000000000000
	Call trace:
	 internal_create_group+0x41c/0x4bc (P)
	 sysfs_create_group+0x18/0x24
	 topology_add_dev+0x1c/0x28
	 cpuhp_invoke_callback+0x104/0x20c
	 __cpuhp_invoke_callback_range+0x94/0x11c
	 _cpu_up+0x200/0x37c
	 cpuhp_smt_enable+0xbc/0x114
	 control_store+0xe8/0x1d4
	 dev_attr_store+0x18/0x2c
	 sysfs_kf_write+0x7c/0x94
	 kernfs_fop_write_iter+0x128/0x1b8
	 vfs_write+0x2b0/0x354
	 ksys_write+0x68/0xfc
	 __arm64_sys_write+0x1c/0x28
	 invoke_syscall+0x48/0x10c
	 el0_svc_common.constprop.0+0x40/0xe8
	 do_el0_svc+0x20/0x2c
	 el0_svc+0x34/0x124
	 el0t_64_sync_handler+0xa0/0xe4
	 el0t_64_sync+0x198/0x19c
	---[ end trace 0000000000000000 ]---

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: James Morse <james.morse@arm.com>
Cc: Yicong Yang <yangyicong@hisilicon.com>
Cc: stable@vger.kernel.org
Link: https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure
Fixes: eed4583bcf9a6 ("arm64: Kconfig: Enable HOTPLUG_SMT")
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v3:
- Update the arm64 cpu-hotplug documentation as Catalin suggested.
- Update the commit message.
v2:
- Update the fix way.
---
 Documentation/arch/arm64/cpu-hotplug.rst | 11 +++++++----
 arch/arm64/kernel/acpi.c                 |  2 ++
 arch/arm64/kernel/smp.c                  | 12 +++++++++++-
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/arm64/cpu-hotplug.rst b/Documentation/arch/arm64/cpu-hotplug.rst
index 8fb438bf7781..60f7f51d7b96 100644
--- a/Documentation/arch/arm64/cpu-hotplug.rst
+++ b/Documentation/arch/arm64/cpu-hotplug.rst
@@ -47,8 +47,9 @@ ever have can be described at boot. There are no power-domain considerations
 as such devices are emulated.
 
 CPU Hotplug on virtual systems is supported. It is distinct from physical
-CPU Hotplug as all resources are described as ``present``, but CPUs may be
-marked as disabled by firmware. Only the CPU's online/offline behaviour is
+CPU Hotplug as all resources are described in the static configuration tables,
+but vCPUs that are not enabled at boot are not marked as ``present`` by the
+kernel until they are hotplugged. Only the CPU's online/offline behaviour is
 influenced by firmware. An example is where a virtual machine boots with a
 single CPU, and additional CPUs are added once a cloud orchestrator deploys
 the workload.
@@ -68,8 +69,10 @@ redistributors.
 
 CPUs described as ``online capable`` but not ``enabled`` can be set to enabled
 by the DSDT's Processor object's _STA method. On virtual systems the _STA method
-must always report the CPU as ``present``. Changes to the firmware policy can
-be notified to the OS via device-check or eject-request.
+must report the CPU as ``present`` when it is activated by the firmware.
+The kernel will then set the vCPU as ``present`` dynamically during the hotplug
+configuration process. Changes can be notified to the OS via device-check or
+eject-request.
 
 CPUs described as ``enabled`` in the static table, should not have their _STA
 modified dynamically by firmware. Soft-restart features such as kexec will
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 5891f92c2035..681aa2bbc399 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -448,12 +448,14 @@ int acpi_map_cpu(acpi_handle handle, phys_cpuid_t physid, u32 apci_id,
 		return *pcpu;
 	}
 
+	set_cpu_present(*pcpu, true);
 	return 0;
 }
 EXPORT_SYMBOL(acpi_map_cpu);
 
 int acpi_unmap_cpu(int cpu)
 {
+	set_cpu_present(cpu, false);
 	return 0;
 }
 EXPORT_SYMBOL(acpi_unmap_cpu);
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..5932e5b30b71 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -566,6 +566,11 @@ struct acpi_madt_generic_interrupt *acpi_cpu_get_madt_gicc(int cpu)
 }
 EXPORT_SYMBOL_GPL(acpi_cpu_get_madt_gicc);
 
+static bool acpi_cpu_is_present(int cpu)
+{
+	return acpi_cpu_get_madt_gicc(cpu)->flags & ACPI_MADT_ENABLED;
+}
+
 /*
  * acpi_map_gic_cpu_interface - parse processor MADT entry
  *
@@ -670,6 +675,10 @@ static void __init acpi_parse_and_init_cpus(void)
 		early_map_cpu_to_node(i, acpi_numa_get_nid(i));
 }
 #else
+static bool acpi_cpu_is_present(int cpu)
+{
+	return false;
+}
 #define acpi_parse_and_init_cpus(...)	do { } while (0)
 #endif
 
@@ -808,7 +817,8 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 		if (err)
 			continue;
 
-		set_cpu_present(cpu, true);
+		if (acpi_disabled || acpi_cpu_is_present(cpu))
+			set_cpu_present(cpu, true);
 		numa_store_cpu_info(cpu);
 	}
 }
-- 
2.34.1

