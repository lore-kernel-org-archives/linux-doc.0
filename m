Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC963CB575;
	Thu, 30 Jul 2026 12:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416073; cv=none; b=YrUsr3zGJCnCqpy+MDiYM7vo4XFHGPyv6zCGwavxpyeFeZfAYOpzewNpcJnRSnpUr1hK3f0otkEN+/fTYzFWp/yQdPAt0BY6dtX/sZp9l4O8B8Klr2fJvBP3RXI3GwGyExSm7kdy2VTgv6SE2z1aJh50vU4Mx38/nheVKOt5uEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416073; c=relaxed/simple;
	bh=rau9GJDapPw5Nw0zgJRINoAt4LS5UYuhaTZ3v/tpIuM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n/nMRzBoiuU4lX/IHVr0FYBqmSuYtfDL97O70zpiaGsHsZY0OYovvVwfeKF8Swg7Cde8YZPxVkdScLFYRYdMT05yCLrMsHaMhbT5cbu9My2DdP0aX0pMC2PSpNxRHP2L71+STUgSwhUQfv3CRZnRPJ6TNM9Lc07MDZkinJ4W/OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=rCNIu8oB; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="rCNIu8oB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785416072; x=1816952072;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4DVdli/2theN5IRxA/3ZJYPCOmDSE79CuKAXt9PGCp0=;
  b=rCNIu8oBZ1vhDo99Ztn0DRLFZbPRsRpW4TA1tyL5YQBko7C1kVSuZG4P
   IjVA/W60vFi+rR0LYgkiAZyqChI6H4555EZLmw0oe22Zxtl4YbA1brhUj
   aTEmFer/vO2L/VT/Mrm8wosFKQPdAqOhg89MowD83q7Nxy9V+gntdrr9V
   54/qVHirr2XCYfZKhEuRcvnD7xtonuETKpWlQVRm2LvXp8cZd4T4BVZOO
   /eN3AprNjyWUOMMj7BR3AvW6K1ISl+fXaaeIn9rsNVVO94OnxFZmE22lz
   ROcjSe1pv0ihJzxfvW6reHtJe9fEIklVde21Je0teXYDqp7HPUjrymLBw
   Q==;
X-CSE-ConnectionGUID: 2ObXcQdkR9ODTBinQim4VQ==
X-CSE-MsgGUID: F/nQz8c4TcKnjyhyVlmupA==
X-IronPort-AV: E=Sophos;i="6.25,194,1779148800"; 
   d="scan'208";a="24461875"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 12:54:29 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:5439]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.41.185:2525] with esmtp (Farcaster)
 id aa42c079-2f9b-4200-b39b-5e19a6b526ec; Thu, 30 Jul 2026 12:54:28 +0000 (UTC)
X-Farcaster-Flow-ID: aa42c079-2f9b-4200-b39b-5e19a6b526ec
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:54:28 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:54:26 +0000
From: Alexander Graf <graf@amazon.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
	<corbet@lwn.net>
CC: The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Shuah Khan <skhan@linuxfoundation.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mancio@amazon.com>, <diapop@amazon.com>, <mknaust@amazon.com>
Subject: [PATCH 5/8] nitro_enclaves: Add NE_SET_ALLOC_NUMA_NODE
Date: Thu, 30 Jul 2026 12:53:09 +0000
Message-ID: <20260730125312.71415-6-graf@amazon.com>
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

A CPU pool that spans NUMA nodes, which pool setup now permits, still
hands every enclave the same allocation target: the node that owns the
pool's first core. Allocation from that target does not spill to another
node, so once that node's contribution is exhausted NE_ADD_VCPU fails
with NE_ERR_NO_CPUS_AVAIL_IN_POOL (272) while cores on the pool's other
nodes sit unused. An enclave wider than one node's share of the pool
cannot be built, and nothing a caller passes to NE_ADD_VCPU changes
which node it draws from.

Give the enclave fd a sticky allocation target instead. NE_ADD_VCPU with
vcpu_id 0 draws its core from that node and returns the id it picked, so
a caller placing an enclave across two nodes sets the target once per
node and drains the count. NE_ALLOC_NUMA_NODE_ANY drops the constraint
and takes any free pool core. That constant is spelled (-1) in the uapi
header rather than reusing NUMA_NO_NODE, which is defined in
linux/nodemask_types.h and reachable from no uapi header at all.

I can think of two ways to let a caller name a node: a target that lives
on the fd, or a second NE_ADD_VCPU carrying the node on every call. I
picked the target. NE_ADD_VCPU already reports the id it chose, so a
caller spreading an enclave over several nodes needs no new call at all,
only the target and the existing count. The variant would make that same
caller learn a new ioctl to get behaviour it already has, and would
price every future input to a placement decision the same way: one more
ioctl number each.

Assisted-by: Kiro:claude-opus-5
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 38 ++++++++++++++++++++
 include/uapi/linux/nitro_enclaves.h       | 42 +++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index e019bb1f6594..eb0091de1182 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/nitro_enclaves.h>
+#include <linux/nodemask.h>
 #include <linux/numa.h>
 #include <linux/pci.h>
 #include <linux/poll.h>
@@ -1477,6 +1478,43 @@ static long ne_enclave_ioctl(struct file *file, unsigned int cmd, unsigned long
 		return 0;
 	}
 
+	case NE_SET_ALLOC_NUMA_NODE: {
+		struct ne_alloc_numa_node n;
+		int nid;
+
+		if (copy_from_user(&n, (void __user *)arg, sizeof(n)))
+			return -EFAULT;
+
+		if (n.flags)
+			return -EINVAL;
+
+		nid = n.numa_node;
+		if (nid != NUMA_NO_NODE &&
+		    (nid < 0 || nid >= nr_node_ids || !node_state(nid, N_POSSIBLE))) {
+			dev_err_ratelimited(ne_misc_dev.this_device,
+					    "Invalid NUMA node %d\n", nid);
+
+			return -EINVAL;
+		}
+
+		mutex_lock(&ne_enclave->enclave_info_mutex);
+
+		if (ne_enclave->state != NE_STATE_INIT) {
+			dev_err_ratelimited(ne_misc_dev.this_device,
+					    "Enclave is not in init state\n");
+
+			mutex_unlock(&ne_enclave->enclave_info_mutex);
+
+			return -NE_ERR_NOT_IN_INIT_STATE;
+		}
+
+		ne_enclave->alloc_nid = nid;
+
+		mutex_unlock(&ne_enclave->enclave_info_mutex);
+
+		return 0;
+	}
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/uapi/linux/nitro_enclaves.h b/include/uapi/linux/nitro_enclaves.h
index 7c6ec8dfe451..8ddc4b150b7e 100644
--- a/include/uapi/linux/nitro_enclaves.h
+++ b/include/uapi/linux/nitro_enclaves.h
@@ -184,6 +184,31 @@
  */
 #define NE_START_ENCLAVE		_IOWR(0xAE, 0x24, struct ne_enclave_start_info)
 
+/**
+ * NE_SET_ALLOC_NUMA_NODE - Set the NUMA node of the primary VM used for
+ *			    subsequent kernel-side allocations on this enclave
+ *			    fd: NE_ADD_VCPU auto-pick (vcpu_id == 0) draws a
+ *			    core from this node. The setting is sticky
+ *			    until changed or the fd is closed. Pass
+ *			    %NE_ALLOC_NUMA_NODE_ANY for node-agnostic
+ *			    allocation (any pool core).
+ *
+ *			    Without this ioctl the target is the first node
+ *			    that owns a core in the CPU pool, and allocation
+ *			    never spills to another node, so a caller that
+ *			    cares which node it lands on names it here.
+ *
+ * Context: Process context.
+ * Return:
+ * * 0				- On success.
+ * * -1				- On failure, errno is set to:
+ * *   EFAULT			- copy_from_user() failed.
+ * *   EINVAL			- flags is non-zero, or node id is not a
+ *				  possible node.
+ * *   NE_ERR_NOT_IN_INIT_STATE	- Enclave is not in init state.
+ */
+#define NE_SET_ALLOC_NUMA_NODE		_IOW(0xAE, 0x25, struct ne_alloc_numa_node)
+
 /**
  * DOC: NE specific error codes
  */
@@ -297,6 +322,23 @@
 
 #define NE_IMAGE_LOAD_MAX_FLAG_VAL	(0x02)
 
+/**
+ * NE_ALLOC_NUMA_NODE_ANY - Node id for a node-agnostic allocation target.
+ */
+#define NE_ALLOC_NUMA_NODE_ANY		(-1)
+
+/**
+ * struct ne_alloc_numa_node - Argument for %NE_SET_ALLOC_NUMA_NODE.
+ * @numa_node:	NUMA node of the primary VM for subsequent kernel-side
+ *		allocations (NE_ADD_VCPU auto-pick), or
+ *		%NE_ALLOC_NUMA_NODE_ANY for node-agnostic allocation.
+ * @flags:	Must be 0.
+ */
+struct ne_alloc_numa_node {
+	__s32	numa_node;
+	__u32	flags;
+};
+
 /**
  * struct ne_image_load_info - Info necessary for in-memory enclave image
  *			       loading (in / out).
-- 
2.47.1

