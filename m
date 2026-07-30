Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1B83F0749;
	Thu, 30 Jul 2026 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416073; cv=none; b=H8aYTrjN6xhh/dRy+BuQ4ysK1RrbcBpFsfiKaed9patcXlT31ADrJ4wqz7UQS7ONGi8QuOT3hNo+FJpvcexD3a5jceblD83mqH3jPhMQjoNio99cQ/c36ZWCX1k8uxsZ5yr8CplfK4K+D9TpaZmhmLS55yvJjO1hBPS3VYC/5EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416073; c=relaxed/simple;
	bh=aZqguEn9nlO7dwStqAZNbwy/o6BAf+PO6Nc+Z99cZp0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CBbSjIuAc23PpS7LuAg8sXyGMw+lcmwsdHy9U3L/sNxWoI+0lJw5T0ubBNOn8Syn8KROgw7VXQQfxkWsqV4Zjvla5c88iDXN16lzm2gVWA6p4pHJvKameTPbf4meGGDsEWnBCRKPaZGdjZ8ZEQvQownABgB7iaOKZbpJFZENb0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=LS1faX4o; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="LS1faX4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785416070; x=1816952070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4+E+bLpNUdb4WbXuhc9Cgdr/D6Za93q4GljugOwb4LM=;
  b=LS1faX4oX3sMULpvsy2SNmrjmbPDtQ6VQazClZ5nvd3YKWct3PtlsQuQ
   MoOozALkUzyO5QDe38UhvPecM+aplzBUPEhEt8MJCefstTWHVyask5itD
   wSCuouBp0HwHyI8y5FhOcqAw4rge7xEC/Em2jB9G8HHJhNh+xFhTDg4h4
   mlvOtyIMsDMIiYxcnEefBhfIyAhpOBcZZeO+Cr9GyVUFEOS6fqvMsOng1
   cDq1Eyxpy/ODG5NjTBZWYdvs4EYblK0MgdnowLUvjsayuVqI9Ok5FrO4u
   Jw5qy5WUyWWp/4JUMCeJe1RfpyPy2L1VUPDbAScvXkG79KxoM9EBtcc52
   Q==;
X-CSE-ConnectionGUID: joG9yH5eQFalV1PTEIvWxQ==
X-CSE-MsgGUID: stQskBGrQJyRhzYJZ6FHmw==
X-IronPort-AV: E=Sophos;i="6.25,194,1779148800"; 
   d="scan'208";a="24664966"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 12:54:27 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:14704]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.23:2525] with esmtp (Farcaster)
 id 5d7ba890-b73b-4998-a976-96e07dba95fe; Thu, 30 Jul 2026 12:54:27 +0000 (UTC)
X-Farcaster-Flow-ID: 5d7ba890-b73b-4998-a976-96e07dba95fe
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:54:26 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:54:24 +0000
From: Alexander Graf <graf@amazon.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
	<corbet@lwn.net>
CC: The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Shuah Khan <skhan@linuxfoundation.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mancio@amazon.com>, <diapop@amazon.com>, <mknaust@amazon.com>
Subject: [PATCH 4/8] nitro_enclaves: Allow the CPU pool to span NUMA nodes
Date: Thu, 30 Jul 2026 12:53:08 +0000
Message-ID: <20260730125312.71415-5-graf@amazon.com>
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
X-ClientProxiedBy: EX19D037UWC004.ant.amazon.com (10.13.139.254) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

There is one CPU pool, and every CPU in it has to sit on the same NUMA
node, so every enclave on the machine draws its cores from it. An
operator who wants enclaves on two nodes, or one enclave wider than a
node has to spare, has nothing to write into ne_cpus=: such a CPU list
is refused with -EINVAL and "CPUs with different NUMA nodes" in dmesg.
The restriction is deliberate and as old as the pool; it was the right
rule while an enclave sat on node 0 and stayed there.

Lift it. A pool whose CPUs report more than one node records its node as
NUMA_NO_NODE and counts as node-agnostic, and every enclave created from
it inherits that. That narrows the ABI: such an enclave skips the
memory-locality check, so NE_ERR_MEM_DIFFERENT_NUMA_NODE is not a
failure NE_SET_USER_MEMORY_REGION can return for it. Once an enclave's
cores come from more than one node there is no single node to hold its
memory to, and a caller that wants the check keeps its pool on one node.

The node then has to be part of picking a core.
ne_get_unused_core_from_cpu_pool() returns a free core from the target
node or nothing at all, and the target lives in ne_enclave->alloc_nid,
which NE_CREATE_VM sets to the node owning the pool's first core. The
picker does not spill onto another node when the target has no core
left: a wrong-node core would be stranded, because the sibling walk
honours the target too, and the mismatch would surface only at
NE_START_ENCLAVE, as NE_ERR_FULL_CORES_NOT_USED, which says nothing
about nodes.

Assisted-by: Kiro:claude-opus-5
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 133 +++++++++++++++-------
 drivers/virt/nitro_enclaves/ne_misc_dev.h |   8 ++
 include/uapi/linux/nitro_enclaves.h       |  20 ++--
 3 files changed, 110 insertions(+), 51 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index 79cc53d8b465..e019bb1f6594 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/nitro_enclaves.h>
+#include <linux/numa.h>
 #include <linux/pci.h>
 #include <linux/poll.h>
 #include <linux/range.h>
@@ -34,8 +35,8 @@
 
 /**
  * NE_CPUS_SIZE - Size for max 128 CPUs, for now, in a cpu-list string, comma
- *		  separated. The NE CPU pool includes CPUs from a single NUMA
- *		  node.
+ *		  separated. The NE CPU pool may include CPUs from more than
+ *		  one NUMA node.
  */
 #define NE_CPUS_SIZE		(512)
 
@@ -115,7 +116,20 @@ MODULE_PARM_DESC(ne_cpus, "<cpu-list> - CPU pool used for Nitro Enclaves");
  *				The total number of CPU cores available on the
  *				primary / parent VM.
  * @nr_threads_per_core:	The number of threads that a full CPU core has.
- * @numa_node:			NUMA node of the CPUs in the pool.
+ * @numa_node:			NUMA node of the CPUs in the pool, or
+ *				NUMA_NO_NODE if the pool spans multiple nodes.
+ * @first_nid:			The NUMA node that owns the first core in the
+ *				pool, or NUMA_NO_NODE if the pool is empty.
+ *				This is the node a new enclave targets until
+ *				user space says otherwise.
+ * @core_nid:			The NUMA node of each core slot, indexed the
+ *				same way as @avail_threads_per_core, or
+ *				NUMA_NO_NODE both for a slot that holds no
+ *				core and for a core whose CPUs report no node.
+ *				Taken while the pool CPUs are still online,
+ *				because from then on they are offline and
+ *				cpu_to_node() is not documented to keep
+ *				answering for them.
  */
 struct ne_cpu_pool {
 	cpumask_var_t	*avail_threads_per_core;
@@ -123,10 +137,13 @@ struct ne_cpu_pool {
 	unsigned int	nr_parent_vm_cores;
 	unsigned int	nr_threads_per_core;
 	int		numa_node;
+	int		first_nid;
+	int		*core_nid;
 };
 
 static struct ne_cpu_pool ne_cpu_pool = {
 	.mutex = __MUTEX_INITIALIZER(ne_cpu_pool.mutex),
+	.first_nid = NUMA_NO_NODE,
 };
 
 /**
@@ -185,6 +202,9 @@ static void ne_free_core_slots(void)
 
 	kfree(ne_cpu_pool.avail_threads_per_core);
 	ne_cpu_pool.avail_threads_per_core = NULL;
+
+	kfree(ne_cpu_pool.core_nid);
+	ne_cpu_pool.core_nid = NULL;
 }
 
 /**
@@ -218,10 +238,18 @@ static int ne_build_core_slots(const struct cpumask *cpu_pool)
 	if (!ne_cpu_pool.avail_threads_per_core)
 		return -ENOMEM;
 
-	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
+	ne_cpu_pool.core_nid = kmalloc_objs(*ne_cpu_pool.core_nid,
+					    ne_cpu_pool.nr_parent_vm_cores);
+	if (!ne_cpu_pool.core_nid)
+		goto free_slots;
+
+	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++) {
 		if (!zalloc_cpumask_var(&ne_cpu_pool.avail_threads_per_core[i], GFP_KERNEL))
 			goto free_slots;
 
+		ne_cpu_pool.core_nid[i] = NUMA_NO_NODE;
+	}
+
 	if (!zalloc_cpumask_var(&processed, GFP_KERNEL))
 		goto free_slots;
 
@@ -247,11 +275,15 @@ static int ne_build_core_slots(const struct cpumask *cpu_pool)
 			cpumask_set_cpu(cpu_sibling, processed);
 		}
 
+		ne_cpu_pool.core_nid[next_core_idx] = cpu_to_node(cpu);
+
 		next_core_idx++;
 	}
 
 	free_cpumask_var(processed);
 
+	ne_cpu_pool.first_nid = ne_cpu_pool.core_nid[0];
+
 	return 0;
 
 free_processed:
@@ -280,7 +312,9 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 	unsigned int cpu = 0;
 	cpumask_var_t cpu_pool;
 	unsigned int cpu_sibling = 0;
-	int numa_node = -1;
+	bool have_node = false;
+	bool multi_node = false;
+	int numa_node = NUMA_NO_NODE;
 	int rc = -EINVAL;
 
 	if (!zalloc_cpumask_var(&cpu_pool, GFP_KERNEL))
@@ -320,29 +354,21 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 		}
 
 	/*
-	 * Check if the CPUs from the NE CPU pool are from the same NUMA node.
+	 * Determine the NUMA node of the CPUs in the pool. If the pool spans
+	 * multiple NUMA nodes, set numa_node to NUMA_NO_NODE; the pool is then
+	 * treated as node-agnostic for placement and memory-locality checks.
 	 */
-	for_each_cpu(cpu, cpu_pool)
-		if (numa_node < 0) {
+	for_each_cpu(cpu, cpu_pool) {
+		if (!have_node) {
 			numa_node = cpu_to_node(cpu);
-			if (numa_node < 0) {
-				pr_err("%s: Invalid NUMA node %d\n",
-				       ne_misc_dev.name, numa_node);
-
-				rc = -EINVAL;
-
-				goto unlock_hotplug;
-			}
-		} else {
-			if (numa_node != cpu_to_node(cpu)) {
-				pr_err("%s: CPUs with different NUMA nodes\n",
-				       ne_misc_dev.name);
-
-				rc = -EINVAL;
-
-				goto unlock_hotplug;
-			}
+			have_node = true;
+		} else if (numa_node != cpu_to_node(cpu)) {
+			multi_node = true;
 		}
+	}
+
+	if (multi_node)
+		numa_node = NUMA_NO_NODE;
 
 	/*
 	 * Check if CPU 0 and its siblings are included in the provided CPU pool
@@ -437,7 +463,8 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 	free_cpumask_var(cpu_pool);
 	ne_cpu_pool.nr_parent_vm_cores = 0;
 	ne_cpu_pool.nr_threads_per_core = 0;
-	ne_cpu_pool.numa_node = -1;
+	ne_cpu_pool.numa_node = NUMA_NO_NODE;
+	ne_cpu_pool.first_nid = NUMA_NO_NODE;
 	mutex_unlock(&ne_cpu_pool.mutex);
 
 	return rc;
@@ -475,7 +502,8 @@ static void ne_teardown_cpu_pool(void)
 	ne_free_core_slots();
 	ne_cpu_pool.nr_parent_vm_cores = 0;
 	ne_cpu_pool.nr_threads_per_core = 0;
-	ne_cpu_pool.numa_node = -1;
+	ne_cpu_pool.numa_node = NUMA_NO_NODE;
+	ne_cpu_pool.first_nid = NUMA_NO_NODE;
 
 	mutex_unlock(&ne_cpu_pool.mutex);
 }
@@ -550,7 +578,13 @@ static bool ne_donated_cpu(struct ne_enclave *ne_enclave, unsigned int cpu)
 /**
  * ne_get_unused_core_from_cpu_pool() - Get the id of a full core from the
  *					NE CPU pool.
- * @void:	No parameters provided.
+ * @nid:	Required NUMA node for the core, or NUMA_NO_NODE for no
+ *		node constraint.
+ *
+ * When @nid names a specific node, only a free core whose CPUs are
+ * on that node is returned; if none is available the function returns -1
+ * rather than spilling onto another node. When @nid is NUMA_NO_NODE, any
+ * free core is returned.
  *
  * Context: Process context. This function is called with the ne_enclave and
  *	    ne_cpu_pool mutexes held.
@@ -558,19 +592,19 @@ static bool ne_donated_cpu(struct ne_enclave *ne_enclave, unsigned int cpu)
  * * Core id.
  * * -1 if no CPU core available in the pool.
  */
-static int ne_get_unused_core_from_cpu_pool(void)
+static int ne_get_unused_core_from_cpu_pool(int nid)
 {
-	int core_id = -1;
 	unsigned int i = 0;
 
-	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
-		if (!cpumask_empty(ne_cpu_pool.avail_threads_per_core[i])) {
-			core_id = i;
-
-			break;
-		}
+	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++) {
+		if (cpumask_empty(ne_cpu_pool.avail_threads_per_core[i]))
+			continue;
+		if (nid != NUMA_NO_NODE && ne_cpu_pool.core_nid[i] != nid)
+			continue;
+		return i;
+	}
 
-	return core_id;
+	return -1;
 }
 
 /**
@@ -637,28 +671,37 @@ static int ne_get_cpu_from_cpu_pool(struct ne_enclave *ne_enclave, u32 *vcpu_id)
 	int core_id = -1;
 	unsigned int cpu = 0;
 	unsigned int i = 0;
+	int nid = ne_enclave->alloc_nid;
 	int rc = -EINVAL;
 
+	mutex_lock(&ne_cpu_pool.mutex);
+
 	/*
 	 * If previously allocated a thread of a core to this enclave, first
 	 * check remaining sibling(s) for new CPU allocations, so that full
-	 * CPU cores are used for the enclave.
+	 * CPU cores are used for the enclave. Cores on a node other than the
+	 * allocation target are skipped: the target is a hard constraint, and
+	 * honouring it here is what keeps a sequence of targeted allocations
+	 * from handing back a core on the wrong node.
 	 */
-	for (i = 0; i < ne_enclave->nr_parent_vm_cores; i++)
+	for (i = 0; i < ne_enclave->nr_parent_vm_cores; i++) {
+		if (nid != NUMA_NO_NODE && ne_cpu_pool.core_nid[i] != nid)
+			continue;
+
 		for_each_cpu(cpu, ne_enclave->threads_per_core[i])
 			if (!ne_donated_cpu(ne_enclave, cpu)) {
 				*vcpu_id = cpu;
+				rc = 0;
 
-				return 0;
+				goto unlock_mutex;
 			}
-
-	mutex_lock(&ne_cpu_pool.mutex);
+	}
 
 	/*
 	 * If no remaining siblings, get a core from the NE CPU pool and keep
 	 * track of all the threads in the enclave threads per core data structure.
 	 */
-	core_id = ne_get_unused_core_from_cpu_pool();
+	core_id = ne_get_unused_core_from_cpu_pool(nid);
 
 	rc = ne_set_enclave_threads_per_core(ne_enclave, core_id, *vcpu_id);
 	if (rc < 0)
@@ -886,7 +929,8 @@ static int ne_sanity_check_user_mem_region_page(struct ne_enclave *ne_enclave,
 		return -NE_ERR_INVALID_PAGE_SIZE;
 	}
 
-	if (ne_enclave->numa_node != page_to_nid(mem_region_page)) {
+	if (ne_enclave->numa_node != NUMA_NO_NODE &&
+	    ne_enclave->numa_node != page_to_nid(mem_region_page)) {
 		dev_err_ratelimited(ne_misc_dev.this_device,
 				    "Page is not from NUMA node %d\n",
 				    ne_enclave->numa_node);
@@ -1687,6 +1731,7 @@ static int ne_create_vm_ioctl(struct ne_pci_dev *ne_pci_dev, u64 __user *slot_ui
 	ne_enclave->nr_parent_vm_cores = ne_cpu_pool.nr_parent_vm_cores;
 	ne_enclave->nr_threads_per_core = ne_cpu_pool.nr_threads_per_core;
 	ne_enclave->numa_node = ne_cpu_pool.numa_node;
+	ne_enclave->alloc_nid = ne_cpu_pool.first_nid;
 
 	mutex_unlock(&ne_cpu_pool.mutex);
 
diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.h b/drivers/virt/nitro_enclaves/ne_misc_dev.h
index 94c6404bde22..aed02183f0b9 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.h
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.h
@@ -53,6 +53,13 @@ struct ne_mem_region {
  * @nr_threads_per_core:	The number of threads that a full CPU core has.
  * @nr_vcpus:			Number of vcpus associated with the enclave.
  * @numa_node:			NUMA node of the enclave memory and CPUs.
+ * @alloc_nid:			NUMA node of the primary VM used for
+ *				kernel-side allocations on behalf of this
+ *				enclave (NE_ADD_VCPU auto-pick).
+ *				Set at NE_CREATE_VM to the first node that
+ *				owns a core in the CPU pool. User space
+ *				overrides it via NE_SET_ALLOC_NUMA_NODE.
+ *				NUMA_NO_NODE means "any node".
  * @slot_uid:			Slot unique id mapped to the enclave.
  * @state:			Enclave state, updated during enclave lifetime.
  * @threads_per_core:		Enclave full CPU cores array. Each cpumask in the
@@ -75,6 +82,7 @@ struct ne_enclave {
 	unsigned int		nr_threads_per_core;
 	unsigned int		nr_vcpus;
 	int			numa_node;
+	int			alloc_nid;
 	u64			slot_uid;
 	u16			state;
 	cpumask_var_t		*threads_per_core;
diff --git a/include/uapi/linux/nitro_enclaves.h b/include/uapi/linux/nitro_enclaves.h
index e808f5ba124d..7c6ec8dfe451 100644
--- a/include/uapi/linux/nitro_enclaves.h
+++ b/include/uapi/linux/nitro_enclaves.h
@@ -26,8 +26,8 @@
  *		  https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html
  *		  CPU 0 and its siblings have to remain available for the
  *		  primary / parent VM, so they cannot be set for enclaves. Full
- *		  CPU core(s), from the same NUMA node, need(s) to be included
- *		  in the CPU pool.
+ *		  CPU core(s) need(s) to be included in the CPU pool. The
+ *		  pool may span NUMA nodes.
  *
  * Context: Process context.
  * Return:
@@ -50,8 +50,9 @@
  * NE_ADD_VCPU - The command is used to set a vCPU for an enclave. The vCPU can
  *		 be auto-chosen from the NE CPU pool or it can be set by the
  *		 caller, with the note that it needs to be available in the NE
- *		 CPU pool. Full CPU core(s), from the same NUMA node, need(s) to
- *		 be associated with an enclave.
+ *		 CPU pool. Full CPU core(s) need(s) to be associated with an
+ *		 enclave. When the CPU pool spans NUMA nodes, the cores of
+ *		 one enclave can be from different nodes.
  *		 The vCPU id is an input / output parameter. If its value is 0,
  *		 then a CPU is chosen from the enclave CPU pool and returned via
  *		 this parameter.
@@ -108,8 +109,11 @@
 /**
  * NE_SET_USER_MEMORY_REGION - The command is used to set a memory region for an
  *			       enclave, given the allocated memory from the
- *			       userspace. Enclave memory needs to be from the
- *			       same NUMA node as the enclave CPUs.
+ *			       userspace. When the CPU pool sits on one
+ *			       NUMA node, enclave memory needs to be from
+ *			       that node. An enclave built out of a pool
+ *			       that spans nodes has no node of its own, and
+ *			       its memory can come from anywhere.
  *			       The user memory region is an input parameter. It
  *			       includes info provided by the caller - flags,
  *			       memory size and userspace address.
@@ -138,7 +142,9 @@
  * * NE_ERR_MEM_NOT_HUGE_PAGE		- The memory region is not backed by
  *					  huge pages.
  * * NE_ERR_MEM_DIFFERENT_NUMA_NODE	- The memory region is not from the same
- *					  NUMA node as the CPUs.
+ *					  NUMA node as the CPUs. Not returned
+ *					  for an enclave whose CPU pool spans
+ *					  nodes.
  * * NE_ERR_MEM_MAX_REGIONS		- The number of memory regions set for
  *					  the enclave reached maximum.
  * * NE_ERR_INVALID_PAGE_SIZE		- The memory region is not backed by
-- 
2.47.1

