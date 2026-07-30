Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7749A3C1D45;
	Thu, 30 Jul 2026 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416040; cv=none; b=Sm2g7JtBSAGEX+IJOvo9vjLS0RZgnOhjh7Tq4be7AFb+k6Zq9Im7n3pURgnzZpYa3mzNCMSKf1L1hJaZtoc1YSHKPF91fIbOg1TYdKpeKYYCbweUlRV9QgxJ4EEwFYgP/95p8TUkPTSrhDpB53lRu0FXbSGTvX8F+azlEpurN5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416040; c=relaxed/simple;
	bh=e9e+tEt2OeVUEVx7SNyj7tG7NHyZ8LXwnrD+yGDJYws=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qOcodBxOCfSnn/lPnz+vxu4ns19unnIYuB6PTj+mZNVZZ3yqSb5QXxqioy5po69MN9fmHASgvBSpS1Yt6/ZX3azZVed8nDeFXdeHeskc8NSgszWV2xX1Nt20rZNSvFouWqPRktDXz4xInCT24/T8/xWeSYFN0V3I1C3vMvbknQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=i8t4Kze1; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="i8t4Kze1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785416037; x=1816952037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j5e0ik5WX/sxVo2/6p65Priamx1aUHbpF4cqPSXp6S8=;
  b=i8t4Kze1oRgj80Rmo0pE7eKMB99Is3M2mY2IJn64IekkDEVYicX6BJGm
   txinxJ5rAL8i08t7BE0raSbECg0+mi7pR76oPzLeodLe17J8Z8yoWQ4IB
   YBJg2UzFLHMnytgQyfbsnAj3hzJ5uKPjQOKIaYgNpQ4IlEs0ObZKqCfwf
   MQXpoWuzSJcwgyGZJzBqyvRMAX3pSQJMZPNzOoIbtvJCVqZzt+VtNdHKY
   DT2/oMuERx6HoY5cauGd7KPgVyn6C9Y3gW6uAqziR39XTY0G+/r+H5ett
   WDfZQGMG+uDxP+1Rv98SBmyzwOzsSyUYOuuQnd9oEVm+ri6XcrMmHuqlo
   w==;
X-CSE-ConnectionGUID: K0R9WbR0QBi7jASnVqaDxQ==
X-CSE-MsgGUID: sBE79kRtQDqIUtXH9rapQw==
X-IronPort-AV: E=Sophos;i="6.25,194,1779148800"; 
   d="scan'208";a="24653882"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 12:53:53 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:8937]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.53.230:2525] with esmtp (Farcaster)
 id 998d40d5-34a3-4178-a0c6-f377e70b7d6b; Thu, 30 Jul 2026 12:53:53 +0000 (UTC)
X-Farcaster-Flow-ID: 998d40d5-34a3-4178-a0c6-f377e70b7d6b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:53:53 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:53:51 +0000
From: Alexander Graf <graf@amazon.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
	<corbet@lwn.net>
CC: The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Shuah Khan <skhan@linuxfoundation.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mancio@amazon.com>, <diapop@amazon.com>, <mknaust@amazon.com>
Subject: [PATCH 3/8] nitro_enclaves: Slot pool cores by sibling mask
Date: Thu, 30 Jul 2026 12:53:07 +0000
Message-ID: <20260730125312.71415-4-graf@amazon.com>
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
X-ClientProxiedBy: EX19D032UWB002.ant.amazon.com (10.13.139.190) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Preparation for letting the CPU pool span NUMA nodes; no functional
change intended. The pool records the threads of each core in
avail_threads_per_core[], indexed by topology_core_id(). That id is
package-local on x86, so two cores in different packages report the same
id and share one slot: an enclave that takes the slot is handed the
threads of both as though they came from one core, and one slot in the
array stays empty.

Walk each pool CPU's sibling cpumask instead and give every core the
first slot no core has taken yet. The per-CPU sibling mask identifies a
core on both architectures this driver builds for. Inside one package
the two ways partition the pool into the same cores, so an enclave is
still handed whole cores, and no ioctl hands a slot index to user space.
The bound moves with the index: a pool whose core ids reach nr_cpu_ids /
nr_threads_per_core used to be refused with -EINVAL and is now set up,
because the bound is now a count of cores.

The topology reads move under the CPU hotplug read lock, which the base
tree takes nowhere in this driver although it already read
topology_sibling_cpumask() and cpu_to_node(), so it closes a
pre-existing gap rather than protecting the new walk. It is dropped
before the offlining loop, because remove_cpu() ends up in
cpus_write_lock() on the same percpu-rwsem and would wait for a reader
that is the same thread. That is what draws the boundary of the new
ne_build_core_slots().

Assisted-by: Kiro:claude-opus-5
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 182 ++++++++++++++--------
 drivers/virt/nitro_enclaves/ne_misc_dev.h |   8 +-
 2 files changed, 125 insertions(+), 65 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index 59e1794587e6..79cc53d8b465 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -105,11 +105,11 @@ MODULE_PARM_DESC(ne_cpus, "<cpu-list> - CPU pool used for Nitro Enclaves");
 /**
  * struct ne_cpu_pool - CPU pool used for Nitro Enclaves.
  * @avail_threads_per_core:	Available full CPU cores to be dedicated to
- *				enclave(s). The cpumasks from the array, indexed
- *				by core id, contain all the threads from the
- *				available cores, that are not set for created
- *				enclave(s). The full CPU cores are part of the
- *				NE CPU pool.
+ *				enclave(s). Each cpumask in the array holds the
+ *				threads of one core in the pool that are not set
+ *				for created enclave(s). Slots are handed out as
+ *				cores are discovered and carry no meaning
+ *				outside the driver.
  * @mutex:			Mutex for the access to the NE CPU pool.
  * @nr_parent_vm_cores :	The size of the available threads per core array.
  *				The total number of CPU cores available on the
@@ -166,6 +166,102 @@ static bool ne_check_enclaves_created(void)
 	return ret;
 }
 
+/**
+ * ne_free_core_slots() - Free the core slot arrays of the NE CPU pool.
+ * @void:	No parameters provided.
+ *
+ * Context: Process context. This function is called with the ne_cpu_pool mutex
+ *	    held.
+ */
+static void ne_free_core_slots(void)
+{
+	unsigned int i = 0;
+
+	if (!ne_cpu_pool.avail_threads_per_core)
+		return;
+
+	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
+		free_cpumask_var(ne_cpu_pool.avail_threads_per_core[i]);
+
+	kfree(ne_cpu_pool.avail_threads_per_core);
+	ne_cpu_pool.avail_threads_per_core = NULL;
+}
+
+/**
+ * ne_build_core_slots() - Group the CPU pool into full cores and give each one
+ *			   a slot of the NE CPU pool arrays.
+ * @cpu_pool:	The CPU pool as parsed out of the ne_cpus parameter.
+ *
+ * The slots preserve the CPU topology of the pool once its CPUs are offlined.
+ * topology_core_id() is package-local on x86, so two cores in different
+ * packages report the same id and would share a slot. The per-CPU sibling
+ * cpumask identifies a core on both architectures this driver builds for, so
+ * walk that and hand each core the next free slot.
+ *
+ * Context: Process context. This function is called with the ne_cpu_pool mutex
+ *	    and the CPU hotplug read lock held.
+ * Return:
+ * * 0 on success.
+ * * Negative return value on failure.
+ */
+static int ne_build_core_slots(const struct cpumask *cpu_pool)
+{
+	unsigned int cpu = 0;
+	unsigned int cpu_sibling = 0;
+	unsigned int i = 0;
+	unsigned int next_core_idx = 0;
+	cpumask_var_t processed;
+	int rc = -ENOMEM;
+
+	ne_cpu_pool.avail_threads_per_core = kzalloc_objs(*ne_cpu_pool.avail_threads_per_core,
+							  ne_cpu_pool.nr_parent_vm_cores);
+	if (!ne_cpu_pool.avail_threads_per_core)
+		return -ENOMEM;
+
+	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
+		if (!zalloc_cpumask_var(&ne_cpu_pool.avail_threads_per_core[i], GFP_KERNEL))
+			goto free_slots;
+
+	if (!zalloc_cpumask_var(&processed, GFP_KERNEL))
+		goto free_slots;
+
+	for_each_cpu(cpu, cpu_pool) {
+		if (cpumask_test_cpu(cpu, processed))
+			continue;
+
+		if (next_core_idx >= ne_cpu_pool.nr_parent_vm_cores) {
+			pr_err("%s: CPU pool has more cores than nr_parent_vm_cores=%d\n",
+			       ne_misc_dev.name, ne_cpu_pool.nr_parent_vm_cores);
+
+			rc = -EINVAL;
+
+			goto free_processed;
+		}
+
+		for_each_cpu(cpu_sibling, topology_sibling_cpumask(cpu)) {
+			if (!cpumask_test_cpu(cpu_sibling, cpu_pool))
+				continue;
+
+			cpumask_set_cpu(cpu_sibling,
+					ne_cpu_pool.avail_threads_per_core[next_core_idx]);
+			cpumask_set_cpu(cpu_sibling, processed);
+		}
+
+		next_core_idx++;
+	}
+
+	free_cpumask_var(processed);
+
+	return 0;
+
+free_processed:
+	free_cpumask_var(processed);
+free_slots:
+	ne_free_core_slots();
+
+	return rc;
+}
+
 /**
  * ne_setup_cpu_pool() - Set the NE CPU pool after handling sanity checks such
  *			 as not sharing CPU cores with the primary / parent VM
@@ -181,11 +277,9 @@ static bool ne_check_enclaves_created(void)
  */
 static int ne_setup_cpu_pool(const char *ne_cpu_list)
 {
-	int core_id = -1;
 	unsigned int cpu = 0;
 	cpumask_var_t cpu_pool;
 	unsigned int cpu_sibling = 0;
-	unsigned int i = 0;
 	int numa_node = -1;
 	int rc = -EINVAL;
 
@@ -193,12 +287,13 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 		return -ENOMEM;
 
 	mutex_lock(&ne_cpu_pool.mutex);
+	cpus_read_lock();
 
 	rc = cpulist_parse(ne_cpu_list, cpu_pool);
 	if (rc < 0) {
 		pr_err("%s: Error in cpulist parse [rc=%d]\n", ne_misc_dev.name, rc);
 
-		goto free_pool_cpumask;
+		goto unlock_hotplug;
 	}
 
 	cpu = cpumask_any(cpu_pool);
@@ -207,7 +302,7 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 
 		rc = -EINVAL;
 
-		goto free_pool_cpumask;
+		goto unlock_hotplug;
 	}
 
 	/*
@@ -221,7 +316,7 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 
 			rc = -EINVAL;
 
-			goto free_pool_cpumask;
+			goto unlock_hotplug;
 		}
 
 	/*
@@ -236,7 +331,7 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 
 				rc = -EINVAL;
 
-				goto free_pool_cpumask;
+				goto unlock_hotplug;
 			}
 		} else {
 			if (numa_node != cpu_to_node(cpu)) {
@@ -245,7 +340,7 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 
 				rc = -EINVAL;
 
-				goto free_pool_cpumask;
+				goto unlock_hotplug;
 			}
 		}
 
@@ -258,7 +353,7 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 
 		rc = -EINVAL;
 
-		goto free_pool_cpumask;
+		goto unlock_hotplug;
 	}
 
 	for_each_cpu(cpu_sibling, topology_sibling_cpumask(0)) {
@@ -268,7 +363,7 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 
 			rc = -EINVAL;
 
-			goto free_pool_cpumask;
+			goto unlock_hotplug;
 		}
 	}
 
@@ -285,7 +380,7 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 
 				rc = -EINVAL;
 
-				goto free_pool_cpumask;
+				goto unlock_hotplug;
 			}
 		}
 	}
@@ -297,38 +392,11 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 
 	ne_cpu_pool.nr_parent_vm_cores = nr_cpu_ids / ne_cpu_pool.nr_threads_per_core;
 
-	ne_cpu_pool.avail_threads_per_core = kzalloc_objs(*ne_cpu_pool.avail_threads_per_core,
-							  ne_cpu_pool.nr_parent_vm_cores);
-	if (!ne_cpu_pool.avail_threads_per_core) {
-		rc = -ENOMEM;
-
-		goto free_pool_cpumask;
-	}
-
-	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
-		if (!zalloc_cpumask_var(&ne_cpu_pool.avail_threads_per_core[i], GFP_KERNEL)) {
-			rc = -ENOMEM;
-
-			goto free_cores_cpumask;
-		}
-
-	/*
-	 * Split the NE CPU pool in threads per core to keep the CPU topology
-	 * after offlining the CPUs.
-	 */
-	for_each_cpu(cpu, cpu_pool) {
-		core_id = topology_core_id(cpu);
-		if (core_id < 0 || core_id >= ne_cpu_pool.nr_parent_vm_cores) {
-			pr_err("%s: Invalid core id  %d for CPU %d\n",
-			       ne_misc_dev.name, core_id, cpu);
-
-			rc = -EINVAL;
-
-			goto clear_cpumask;
-		}
+	rc = ne_build_core_slots(cpu_pool);
+	if (rc < 0)
+		goto unlock_hotplug;
 
-		cpumask_set_cpu(cpu, ne_cpu_pool.avail_threads_per_core[core_id]);
-	}
+	cpus_read_unlock();
 
 	/*
 	 * CPUs that are given to enclave(s) should not be considered online
@@ -361,14 +429,11 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 online_cpus:
 	for_each_cpu(cpu, cpu_pool)
 		add_cpu(cpu);
-clear_cpumask:
-	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
-		cpumask_clear(ne_cpu_pool.avail_threads_per_core[i]);
-free_cores_cpumask:
-	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
-		free_cpumask_var(ne_cpu_pool.avail_threads_per_core[i]);
-	kfree(ne_cpu_pool.avail_threads_per_core);
-free_pool_cpumask:
+	ne_free_core_slots();
+	goto reset_pool;
+unlock_hotplug:
+	cpus_read_unlock();
+reset_pool:
 	free_cpumask_var(cpu_pool);
 	ne_cpu_pool.nr_parent_vm_cores = 0;
 	ne_cpu_pool.nr_threads_per_core = 0;
@@ -399,7 +464,7 @@ static void ne_teardown_cpu_pool(void)
 		return;
 	}
 
-	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++) {
+	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
 		for_each_cpu(cpu, ne_cpu_pool.avail_threads_per_core[i]) {
 			rc = add_cpu(cpu);
 			if (rc != 0)
@@ -407,12 +472,7 @@ static void ne_teardown_cpu_pool(void)
 				       ne_misc_dev.name, cpu, rc);
 		}
 
-		cpumask_clear(ne_cpu_pool.avail_threads_per_core[i]);
-
-		free_cpumask_var(ne_cpu_pool.avail_threads_per_core[i]);
-	}
-
-	kfree(ne_cpu_pool.avail_threads_per_core);
+	ne_free_core_slots();
 	ne_cpu_pool.nr_parent_vm_cores = 0;
 	ne_cpu_pool.nr_threads_per_core = 0;
 	ne_cpu_pool.numa_node = -1;
diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.h b/drivers/virt/nitro_enclaves/ne_misc_dev.h
index 2a4d2224baba..94c6404bde22 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.h
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.h
@@ -55,10 +55,10 @@ struct ne_mem_region {
  * @numa_node:			NUMA node of the enclave memory and CPUs.
  * @slot_uid:			Slot unique id mapped to the enclave.
  * @state:			Enclave state, updated during enclave lifetime.
- * @threads_per_core:		Enclave full CPU cores array, indexed by core id,
- *				consisting of cpumasks with all their threads.
- *				Full CPU cores are taken from the NE CPU pool
- *				and are available to the enclave.
+ * @threads_per_core:		Enclave full CPU cores array. Each cpumask in the
+ *				array holds the threads of one core taken from
+ *				the NE CPU pool and available to the enclave.
+ *				The array shares the pool's slot indices.
  * @vcpu_ids:			Cpumask of the vCPUs that are set for the enclave.
  */
 struct ne_enclave {
-- 
2.47.1

