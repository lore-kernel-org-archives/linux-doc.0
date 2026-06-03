Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE1D274FE3;
	Wed,  3 Jun 2026 06:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780468709; cv=none; b=e/embBba4m5kXJV6mdz2/r0gSoK16i/XaF6czzdA3yxgq3jBQkfWp7sXTxp1cjQNY91dR2KyqnX7j1OVY/YXD0smmjaYAWp2owmOchae0aXsKQ+w//cDJzA9q/dLcH3fdzVxCFyYKoNM8KvFWqH+Nh0alDCtVM0s1ofSJsPbAe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780468709; c=relaxed/simple;
	bh=bE6e4zLj6En9U1nVGkta/mZjie6/AJ8NUVhopFMoT9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cYL7X+d/5vbav210+bgfhgiUjohGkcNiP9zQxInS6ZG6DJdZFdsmZ3/mP7C+RLEJPS3Leqj1+43NfE4DKI+wF2ppHtW4sKCpNwRFvFEqg/xqIdr3Onv/iNUQEGN4EiOEVNaCU552UiHRoU445qL+8XtovTFoMRC2VvnRI+/9TWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=yJOcOWb8; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="yJOcOWb8"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4Oj3xlhd91tMPareGsz8kkrFDyhyuA01Er8yZMiuEgw=;
	b=yJOcOWb8eN8UcDUd6xEp3vNqiX3pvYpSyHflhdOMNAKQL8p4DCMYkGHqQ00BAfGjqAJXn8Mes
	rCu8DPQip9P9c0d9mNgq9Ongzlzo+3PfRrR8DMpRaMU3NRH5qZputFwvO9lXTis5BSS5PQOPeks
	M4C5wzulmhXepHgvJYcZbrw=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gVd9g1hJPzLlYQ;
	Wed,  3 Jun 2026 14:30:31 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B30FF40570;
	Wed,  3 Jun 2026 14:38:20 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 3 Jun 2026 14:38:11 +0800
Message-ID: <02932ef7-5819-4cf5-8e78-8fd3fd40274f@huawei.com>
Date: Wed, 3 Jun 2026 14:38:11 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
To: Will Deacon <will@kernel.org>
CC: <catalin.marinas@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<punit.agrawal@oss.qualcomm.com>, <jic23@kernel.org>,
	<osama.abdelkader@gmail.com>, <chenl311@chinatelecom.cn>,
	<fengchengwen@huawei.com>, <suzuki.poulose@arm.com>, <maz@kernel.org>,
	<lpieralisi@kernel.org>, <timothy.hayes@arm.com>, <sascha.bischoff@arm.com>,
	<arnd@arndb.de>, <mrigendra.chaubey@gmail.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>, <yangyicong@hisilicon.com>,
	<sudeep.holla@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260520022023.126670-1-ruanjinjie@huawei.com>
 <ah65zXlOH6a9geD9@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ah65zXlOH6a9geD9@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 6/2/2026 7:09 PM, Will Deacon wrote:
> On Wed, May 20, 2026 at 10:20:23AM +0800, Jinjie Ruan wrote:
>> On arm64, when booting with `maxcpus` greater than the number of present
>> CPUs (e.g., QEMU -smp cpus=4,maxcpus=8), some CPUs are marked as 'present'
>> but have not yet been registered via register_cpu(). Consequently,
>> the per-cpu device objects for these CPUs are not yet initialized.
>>
>> In cpuhp_smt_enable(), the code iterates over all present CPUs. Calling
>> _cpu_up() for these unregistered CPUs eventually leads to
>> sysfs_create_group() being called with a NULL kobject (or a kobject
>> without a directory), triggering the following warning in
>> fs/sysfs/group.c:
>>
>> 	if (WARN_ON(!kobj || (!update && !kobj->sd)))
>> 		return -EINVAL;
>>
>> When booting with ACPI, arm64 smp_prepare_cpus() currently sets all
>> enumerated CPUs as "present" regardless of their status in the MADT. This
>> causes issues with SMT hotplug control. For instance, with QEMU's
>> "-smp 4,maxcpus=8" configuration, the MADT GICC entries are populated as
>> follows: the first four CPUs are marked Enabled while the remaining four
>> are marked Online Capable to support potential hot-plugging.
>>
>> Fix this by:
>>
>> 1. When booting with ACPI, checking the ACPI_MADT_ENABLED flag in the GICC
>>    entry before calling set_cpu_present() during SMP initialization.
>>
>> 2. Properly managing the present mask in acpi_map_cpu() and
>>    acpi_unmap_cpu() to support actual CPU hotplug events, This aligns with
>>    other architectures like x86 and LoongArch.
>>
>> 3. Update the arm64 CPU hotplug documentation to no longer state that all
>>    online-capable vCPUs are marked as present by the kernel at boot time.
>>
>> This ensures that only physically available or explicitly enabled CPUs
>> are in the present mask, keeping the SMT control logic consistent with
>> the actual hardware state.
> 
> Please can you check the Sashiko review comment?
> 
> https://sashiko.dev/#/patchset/20260520022023.126670-1-ruanjinjie@huawei.com

Hi, all,

I think commit eba4675008a6 ("arm64: arch_register_cpu() variant to
check if an ACPI handle is now available.") introduced this bug.

It introduced an architectural safety block inside
arch_unregister_cpu(). If a hot-unplug operation is determined to be a
physical hardware removal (where _STA evaluates to
!ACPI_STA_DEVICE_PRESENT), it aborts the unregistration transaction
early to protect unreadied arm64 infrastructure, thereby skipping
unregister_cpu().

However, the generic ACPI processor driver path in
acpi_processor_post_eject() currently treats arch_unregister_cpu() as
an unconditional void operation. When arch_unregister_cpu() bails out
early, the subsequent cleanup flow blindly proceeds to call
acpi_unmap_cpu(), clears global per-cpu processor arrays, and
unconditionally free the 'struct acpi_processor' object.

I think we can fix this by:

    1. Refactoring arch_unregister_cpu() to return an integer
transaction status. It returns -EOPNOTSUPP when aborting due to physical
hot-remove blocking, -EINVAL/-EIO on firmware failures, and 0 only upon
successful unregistration.

    2. Guarding the downstream execution flow in
acpi_processor_post_eject(). If arch_unregister_cpu() returns a error
code, the hot-unplug transaction is considered aborted.

What do you think about this fix?

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..f451c9c82212 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -531,29 +531,30 @@ int arch_register_cpu(int cpu)
 }

 #ifdef CONFIG_ACPI_HOTPLUG_CPU
-void arch_unregister_cpu(int cpu)
+int arch_unregister_cpu(int cpu)
 {
        acpi_handle acpi_handle = acpi_get_processor_handle(cpu);
        struct cpu *c = &per_cpu(cpu_devices, cpu);
-       acpi_status status;
        unsigned long long sta;
+       acpi_status status;

        if (!acpi_handle) {
                pr_err_once("Removing a CPU without associated ACPI
handle\n");
-               return;
+               return -EINVAL;
        }

        status = acpi_evaluate_integer(acpi_handle, "_STA", NULL, &sta);
        if (ACPI_FAILURE(status))
-               return;
+               return -EIO;

        /* For now do not allow anything that looks like physical CPU HP */
        if (cpu_present(cpu) && !(sta & ACPI_STA_DEVICE_PRESENT)) {
                pr_err_once("Changing CPU present bit is not supported\n");
-               return;
+               return -EOPNOTSUPP;
        }

        unregister_cpu(c);
+       return 0;
 }
 #endif /* CONFIG_ACPI_HOTPLUG_CPU */

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 00775b91bd41..4361eed26d83 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -499,7 +499,15 @@ static void acpi_processor_post_eject(struct
acpi_device *device)
        cpus_write_lock();

        /* Remove the CPU. */
-       arch_unregister_cpu(pr->id);
+       if (arch_unregister_cpu(pr->id)) {
+               cpus_write_unlock();
+               cpu_maps_update_done();
+               acpi_bind_one(pr->dev, device);
+               if (device_attach(pr->dev) < 0)
+                       dev_err(pr->dev, "Processor driver could not be
attached\n");
+               return;
+       }
+
        acpi_unmap_cpu(pr->id);

        /* Clean up. */
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 875abdc9942e..57980d1c2931 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -570,9 +570,10 @@ int __weak arch_register_cpu(int cpu)
 }

 #ifdef CONFIG_HOTPLUG_CPU
-void __weak arch_unregister_cpu(int num)
+int __weak arch_unregister_cpu(int num)
 {
        unregister_cpu(&per_cpu(cpu_devices, num));
+       return 0;
 }
 #endif /* CONFIG_HOTPLUG_CPU */
 #endif /* CONFIG_GENERIC_CPU_DEVICES */
diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 9b6b0d87fdb0..a7c191dea1fc 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -91,7 +91,7 @@ struct device *cpu_device_create(struct device
*parent, void *drvdata,
                                 const char *fmt, ...);
 extern bool arch_cpu_is_hotpluggable(int cpu);
 extern int arch_register_cpu(int cpu);
-extern void arch_unregister_cpu(int cpu);
+extern int arch_unregister_cpu(int cpu);
 #ifdef CONFIG_HOTPLUG_CPU
 extern void unregister_cpu(struct cpu *cpu);
 extern ssize_t arch_cpu_probe(const char *, size_t);


> 
> Cheers,
> 
> Will
> 

