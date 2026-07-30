Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4851733F583;
	Thu, 30 Jul 2026 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416107; cv=none; b=TWtIJHIvJHtVH5tKNCNTo1005mJsrNceD/GfwC7+YrrZ+t2YCFJzHCuPqKqXBYd5YtkpXNcOHjyM4LoFVF7nWf6ZALIbyM424jNmWYpaAMkxiwdLJMmA1gMtrSp4M0a4Z+nnMJ2g+PAOQKmrLJxqkS7XU1zXxmhpWy4G3JfNRmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416107; c=relaxed/simple;
	bh=HofaUkqDt9T0Te/NoeS97Or1wzewoKSelGv874WZInc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=abu4nJe2t/Nv0JYUElVo6SkmpuYauFQx9q1OqRujBPRzZOS74Cc6ycApqCZIXPEkqhkR7lb7S/W7K/io5J7O5mTh3pki7VG4nddWv9Egbjazj9x3VPUlx2yu7U70hkjIJptDBvc0Bjrujr4op2fWyn04NAKMUBihuQaM+xlbXys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=dEzGHi7J; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="dEzGHi7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785416106; x=1816952106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fbyoXVRY1cthYTE1q4uLgZT9F32LTfKhxyhD++OKKBU=;
  b=dEzGHi7JeGFQE2eyzzRDp3qIGR0YCNBOuZY0biXZYHew2i7TJqjek9Js
   i2/UC5VBLKqHxU0BJhKflICWG4FjDgTo+z3Ps4QXvkyZVGu2/auRUYPmC
   MlG70jjoZ9XmahJUlvpgYk/kbqi5KeNwf+Hv1xKBe7b3IBkiANWQeq5iv
   HzPe/9s2hgU7ufJOeTSXYQqeYSUdNzmbmOFag+vWwQJ1T2cNnhNafcTbo
   B9YIjW3plGYkajIahXhnQcxbh4KNPX/s7pQ0cyrdWCXCR8VOGY9jAp22b
   drf7FRhwdZlBPjFnmtUIKyPj8d3PmdFSCKDn1YV0yfEiEmEhwOQW1vxw/
   w==;
X-CSE-ConnectionGUID: WMI+Qz9ZReC83DqUvvPjvg==
X-CSE-MsgGUID: /TWuDDBFTGe8lP3CklHbnA==
X-IronPort-AV: E=Sophos;i="6.25,194,1779148800"; 
   d="scan'208";a="24437667"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 12:55:02 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:29876]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.11:2525] with esmtp (Farcaster)
 id a2489e14-30b4-4ab9-99bf-fdda46f06e19; Thu, 30 Jul 2026 12:55:02 +0000 (UTC)
X-Farcaster-Flow-ID: a2489e14-30b4-4ab9-99bf-fdda46f06e19
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:55:01 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:55:00 +0000
From: Alexander Graf <graf@amazon.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
	<corbet@lwn.net>
CC: The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Shuah Khan <skhan@linuxfoundation.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mancio@amazon.com>, <diapop@amazon.com>, <mknaust@amazon.com>
Subject: [PATCH 6/8] nitro_enclaves: Expose CPU pool state under sysfs
Date: Thu, 30 Jul 2026 12:53:10 +0000
Message-ID: <20260730125312.71415-7-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260730125312.71415-1-graf@amazon.com>
References: <20260730125312.71415-1-graf@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D042UWB002.ant.amazon.com (10.13.139.175) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

An orchestrator deciding where to place an enclave needs to know how
many cores of the pool are still free, and on which NUMA node. The total
is not the missing piece: /sys/module/nitro_enclaves/parameters/ne_cpus
is mode 0644 and reads back the CPU list that was accepted. Occupancy
is. NE_CREATE_VM returns NE_ERR_NO_CPUS_AVAIL_IN_POOL (272) before it
allocates a slot when no core anywhere in the pool is free, but that
check does not look at nodes, so the only per-node answer the kernel
offers arrives from NE_ADD_VCPU, as errno 272, once the slot exists and
has to be freed again.

So report the pool on the misc device, as a cpu_pool attribute group
under /sys/devices/virtual/misc/nitro_enclaves/: mode is none or static,
total is the pool as parsed from ne_cpus, used is what enclaves hold,
and avail is the rest. The group hangs off miscdevice.groups, so the
subtree comes and goes with the device and there is no kobject to manage
by hand.

The threads enclaves hold get a mask of their own in the pool rather
than being added up from the enclave list on every read. Walking that
list needs the enclave list mutex and each enclave's mutex, and
NE_ADD_VCPU, release and the event work handler each hold one of those
across a request to the device, so a read of used would sit behind an
enclave that is failing to stop. The four files take the pool mutex and
nothing else, and that mutex is not held across any of this driver's
seven calls into the device.

Assisted-by: Kiro:claude-opus-5
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 134 ++++++++++++++++++++--
 1 file changed, 122 insertions(+), 12 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index eb0091de1182..9b28d1f828b6 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -28,6 +28,7 @@
 #include <linux/poll.h>
 #include <linux/range.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
 #include <uapi/linux/vm_sockets.h>
 
@@ -72,17 +73,6 @@ static const struct file_operations ne_fops = {
 	.compat_ioctl	= compat_ptr_ioctl,
 };
 
-static struct miscdevice ne_misc_dev = {
-	.minor	= MISC_DYNAMIC_MINOR,
-	.name	= "nitro_enclaves",
-	.fops	= &ne_fops,
-	.mode	= 0660,
-};
-
-struct ne_devs ne_devs = {
-	.ne_misc_dev	= &ne_misc_dev,
-};
-
 /*
  * TODO: Update logic to create new sysfs entries instead of using
  * a kernel parameter e.g. if multiple sysfs files needed.
@@ -131,6 +121,17 @@ MODULE_PARM_DESC(ne_cpus, "<cpu-list> - CPU pool used for Nitro Enclaves");
  *				because from then on they are offline and
  *				cpu_to_node() is not documented to keep
  *				answering for them.
+ * @pool_cpus:			Every CPU thread in the pool, as parsed from
+ *				ne_cpus. Empty if no pool is set up.
+ * @claimed_cpus:		The subset of @pool_cpus that enclaves hold.
+ *				A whole core enters when an enclave takes it
+ *				and leaves when the enclave is released, in
+ *				the same two places that move the core out of
+ *				and back into @avail_threads_per_core.
+ * @avail_cpus:			Scratch mask for the avail sysfs file:
+ *				@pool_cpus without @claimed_cpus, computed
+ *				and emitted under @mutex. It lives here so
+ *				that the read has nothing to allocate.
  */
 struct ne_cpu_pool {
 	cpumask_var_t	*avail_threads_per_core;
@@ -140,6 +141,9 @@ struct ne_cpu_pool {
 	int		numa_node;
 	int		first_nid;
 	int		*core_nid;
+	struct cpumask	pool_cpus;
+	struct cpumask	claimed_cpus;
+	struct cpumask	avail_cpus;
 };
 
 static struct ne_cpu_pool ne_cpu_pool = {
@@ -147,6 +151,101 @@ static struct ne_cpu_pool ne_cpu_pool = {
 	.first_nid = NUMA_NO_NODE,
 };
 
+/*
+ * cpu_pool/ sysfs group on the Nitro Enclaves misc device: report the CPU
+ * pool mode and occupancy.
+ *
+ *   /sys/devices/virtual/misc/nitro_enclaves/cpu_pool/mode
+ *   /sys/devices/virtual/misc/nitro_enclaves/cpu_pool/{total,used,avail}
+ *
+ * total, used and avail are CPU-list strings taken from the pool masks under
+ * the pool mutex. used is claimed_cpus and avail is what is left of the pool
+ * once claimed_cpus is taken out of it, so the two partition total whichever
+ * order they are read in. The three CPU-list files emit from a mask the pool
+ * already owns and mode emits a string constant, so none of the four show
+ * handlers can fail.
+ */
+
+static ssize_t mode_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	const char *mode;
+
+	mutex_lock(&ne_cpu_pool.mutex);
+	mode = cpumask_empty(&ne_cpu_pool.pool_cpus) ? "none" : "static";
+	mutex_unlock(&ne_cpu_pool.mutex);
+
+	return sysfs_emit(buf, "%s\n", mode);
+}
+static DEVICE_ATTR_RO(mode);
+
+static ssize_t total_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	ssize_t ret;
+
+	mutex_lock(&ne_cpu_pool.mutex);
+	ret = sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(&ne_cpu_pool.pool_cpus));
+	mutex_unlock(&ne_cpu_pool.mutex);
+
+	return ret;
+}
+static DEVICE_ATTR_RO(total);
+
+static ssize_t used_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	ssize_t ret;
+
+	mutex_lock(&ne_cpu_pool.mutex);
+	ret = sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(&ne_cpu_pool.claimed_cpus));
+	mutex_unlock(&ne_cpu_pool.mutex);
+
+	return ret;
+}
+static DEVICE_ATTR_RO(used);
+
+static ssize_t avail_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	ssize_t ret;
+
+	mutex_lock(&ne_cpu_pool.mutex);
+	cpumask_andnot(&ne_cpu_pool.avail_cpus, &ne_cpu_pool.pool_cpus,
+		       &ne_cpu_pool.claimed_cpus);
+	ret = sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(&ne_cpu_pool.avail_cpus));
+	mutex_unlock(&ne_cpu_pool.mutex);
+
+	return ret;
+}
+static DEVICE_ATTR_RO(avail);
+
+static struct attribute *ne_cpu_pool_attrs[] = {
+	&dev_attr_mode.attr,
+	&dev_attr_total.attr,
+	&dev_attr_used.attr,
+	&dev_attr_avail.attr,
+	NULL,
+};
+
+static const struct attribute_group ne_cpu_pool_group = {
+	.name	= "cpu_pool",
+	.attrs	= ne_cpu_pool_attrs,
+};
+__ATTRIBUTE_GROUPS(ne_cpu_pool);
+
+static struct miscdevice ne_misc_dev = {
+	.minor	= MISC_DYNAMIC_MINOR,
+	.name	= "nitro_enclaves",
+	.fops	= &ne_fops,
+	.mode	= 0660,
+	.groups	= ne_cpu_pool_groups,
+};
+
+struct ne_devs ne_devs = {
+	.ne_misc_dev	= &ne_misc_dev,
+};
+
 /**
  * struct ne_phys_contig_mem_regions - Contiguous physical memory regions.
  * @num:	The number of regions that currently has.
@@ -445,6 +544,8 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 		}
 	}
 
+	cpumask_copy(&ne_cpu_pool.pool_cpus, cpu_pool);
+	cpumask_clear(&ne_cpu_pool.claimed_cpus);
 	free_cpumask_var(cpu_pool);
 
 	ne_cpu_pool.numa_node = numa_node;
@@ -462,6 +563,8 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 	cpus_read_unlock();
 reset_pool:
 	free_cpumask_var(cpu_pool);
+	cpumask_clear(&ne_cpu_pool.pool_cpus);
+	cpumask_clear(&ne_cpu_pool.claimed_cpus);
 	ne_cpu_pool.nr_parent_vm_cores = 0;
 	ne_cpu_pool.nr_threads_per_core = 0;
 	ne_cpu_pool.numa_node = NUMA_NO_NODE;
@@ -501,6 +604,8 @@ static void ne_teardown_cpu_pool(void)
 		}
 
 	ne_free_core_slots();
+	cpumask_clear(&ne_cpu_pool.pool_cpus);
+	cpumask_clear(&ne_cpu_pool.claimed_cpus);
 	ne_cpu_pool.nr_parent_vm_cores = 0;
 	ne_cpu_pool.nr_threads_per_core = 0;
 	ne_cpu_pool.numa_node = NUMA_NO_NODE;
@@ -650,6 +755,9 @@ static int ne_set_enclave_threads_per_core(struct ne_enclave *ne_enclave,
 	for_each_cpu(cpu, ne_cpu_pool.avail_threads_per_core[core_id])
 		cpumask_set_cpu(cpu, ne_enclave->threads_per_core[core_id]);
 
+	cpumask_or(&ne_cpu_pool.claimed_cpus, &ne_cpu_pool.claimed_cpus,
+		   ne_cpu_pool.avail_threads_per_core[core_id]);
+
 	cpumask_clear(ne_cpu_pool.avail_threads_per_core[core_id]);
 
 	return 0;
@@ -1564,9 +1672,11 @@ static void ne_enclave_remove_all_vcpu_id_entries(struct ne_enclave *ne_enclave)
 	mutex_lock(&ne_cpu_pool.mutex);
 
 	for (i = 0; i < ne_enclave->nr_parent_vm_cores; i++) {
-		for_each_cpu(cpu, ne_enclave->threads_per_core[i])
+		for_each_cpu(cpu, ne_enclave->threads_per_core[i]) {
 			/* Update the available NE CPU pool. */
 			cpumask_set_cpu(cpu, ne_cpu_pool.avail_threads_per_core[i]);
+			cpumask_clear_cpu(cpu, &ne_cpu_pool.claimed_cpus);
+		}
 
 		free_cpumask_var(ne_enclave->threads_per_core[i]);
 	}
-- 
2.47.1

