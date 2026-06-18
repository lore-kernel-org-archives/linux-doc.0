Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229EE26B742;
	Thu, 18 Jun 2026 22:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781822434; cv=none; b=qyNEllcRHrJFYp0Co7XppmpsyFDYK7kQhjzZ00l1ajyR0ms3drkepYIaQKV+Ia6H9FZX2l2a+D5grW5Eu4UKt7pVmOR8iBlzHGLRykP7yFmx6dV2B/iAhuB4XAzVsegj5HID5SXgu1v9Ts1tU8VT8gj3GnHNBMh9X9VtxdHl9Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781822434; c=relaxed/simple;
	bh=X8rnhRHRznTP7ItjD59GKPVd+UXYRqFpFGgkCYd3XEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FM6EYTOcnzDh6U9JahRp2evnIVA/K7UU7qSHcIciUbsFzBmWKyhM6oKVPB33z3GcXbOlrdiES8ldzyCs2u36WWmhgy3nBxPmLuJNK6dWYh/lAmPtrOM6UOG74S0CyuRz+0cGVFMONg+LaLUoYOXYQa9roGkpnic/D2nmswsF70Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=WQ6+3nIT; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="WQ6+3nIT"
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [52.148.140.42])
	by linux.microsoft.com (Postfix) with ESMTPSA id B86EE20B7167;
	Thu, 18 Jun 2026 15:40:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B86EE20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1781822431;
	bh=ApwCf7gpHgvcRXw+jcerBXpdyD2CtuN4rEen5WYkVwQ=;
	h=From:To:Cc:Subject:Date:From;
	b=WQ6+3nITFaUoApJS2gd3L88W/q4Hs5kTBRI8981tg0QPi2f3sqZqOWcDkV3Jlt8QW
	 edV8ZExu6U4Ji+eDs6froMXJp26di0ia4++icpLJEqGjXeF+JqtbXbbnTnL1CP1/pO
	 S+1KPikxyu8UqUeaKKSj5xsx2izvM51q1zuqNLak=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: rppt@kernel.org,
	akpm@linux-foundation.org,
	kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	bp@alien8.de,
	rdunlap@infradead.org,
	peterz@infradead.org,
	feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com,
	elver@google.com,
	enelsonmoore@gmail.com,
	kuba@kernel.org,
	lirongqing@baidu.com,
	ebiggers@kernel.org
Subject: [RFC PATCH] reserve_mem: add support for static memory
Date: Thu, 18 Jun 2026 15:40:18 -0700
Message-ID: <20260618224018.117978-1-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

reserve_mem relies on dynamic memory allocation, this limits the
usecase where memory and its address is required to be preserved
across the boots. Eg: ramoops memory reservation on ACPI platforms

So add support to pass a pre-determined static address and reserve
memory at this specified address. This enables use case like ramoops
on ACPI platforms to reliably access ramoops region across the boots.

Also skip parsing of "align" parameter when static address is passed.

Example syntax for static address
 reserve_mem=4M@0x1E0000000:oops ramoops.mem_name=oops

Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
---
 .../admin-guide/kernel-parameters.txt         | 15 ++++++
 mm/memblock.c                                 | 48 +++++++++++++------
 2 files changed, 49 insertions(+), 14 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f228..7e0baca564b97 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6563,6 +6563,21 @@ Kernel parameters
 
 			reserve_mem=12M:4096:oops ramoops.mem_name=oops
 
+	reserve_mem=	[RAM]
+			Format: nn[KMG]:<@offset>:<label>
+			Reserve physical memory at pre-determined location and label it with
+			a name that other subsystems can use to access it. This is typically
+			used for systems that do not wipe the RAM, and this command
+			line will try to reserve the same physical memory on
+			soft reboots. Note, it is guaranteed to be the same
+			location unless some other early allocation for eg: crashkernel=256M
+                        (without static address) is reserved or overlapps this region.
+
+			The format is size:offset:label for example, to request
+			4 megabytes for ramoops at 0x1E0000000:
+
+			reserve_mem=4M@0x1E0000000:oops ramoops.mem_name=oops
+
 	reservetop=	[X86-32,EARLY]
 			Format: nn[KMG]
 			Reserves a hole at the top of the kernel virtual
diff --git a/mm/memblock.c b/mm/memblock.c
index 6349c48154f4b..79f1f806ea364 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2721,6 +2721,7 @@ static int __init reserve_mem(char *p)
 	char *name;
 	char *oldp;
 	int len;
+	bool addr_is_static = false;
 
 	if (!p)
 		goto err_param;
@@ -2739,16 +2740,27 @@ static int __init reserve_mem(char *p)
 	if (*p != ':')
 		goto err_param;
 
-	align = memparse(p+1, &p);
+	/* parse the static memory address */
+	if (*p == '@') {
+		start = memparse(p+1, &p);
+		addr_is_static = true;
+	}
+
 	if (*p != ':')
 		goto err_param;
 
-	/*
-	 * memblock_phys_alloc() doesn't like a zero size align,
-	 * but it is OK for this command to have it.
-	 */
-	if (align < SMP_CACHE_BYTES)
-		align = SMP_CACHE_BYTES;
+	if (!addr_is_static) {
+		align = memparse(p+1, &p);
+		if (*p != ':')
+			goto err_param;
+
+		/*
+		 * memblock_phys_alloc() doesn't like a zero size align,
+		 * but it is OK for this command to have it.
+		 */
+		if (align < SMP_CACHE_BYTES)
+			align = SMP_CACHE_BYTES;
+	}
 
 	name = p + 1;
 	len = strlen(name);
@@ -2772,16 +2784,24 @@ static int __init reserve_mem(char *p)
 	}
 
 	/* Pick previous allocations up from KHO if available */
-	if (reserve_mem_kho_revive(name, size, align))
+	if (!addr_is_static && reserve_mem_kho_revive(name, size, align))
 		return 1;
 
-	/* TODO: Allocation must be outside of scratch region */
-	start = memblock_phys_alloc(size, align);
-	if (!start) {
-		pr_err("reserve_mem: memblock allocation failed\n");
-		return -ENOMEM;
-	}
+	if (addr_is_static) {
+		if (memblock_reserve(start, size)) {
+			pr_err("reserve_mem: memblock reservation failed\n");
+			return -ENOMEM;
+		}
+
+	} else {
+		/* TODO: Allocation must be outside of scratch region */
+		start = memblock_phys_alloc(size, align);
+		if (!start) {
+			pr_err("reserve_mem: memblock allocation failed\n");
+			return -ENOMEM;
+		}
 
+	}
 	reserved_mem_add(start, size, name);
 
 	return 1;
-- 
2.43.0

