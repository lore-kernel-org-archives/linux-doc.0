Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846C0846F;
	Fri, 19 Jun 2026 06:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781850221; cv=none; b=ZmXp6XjdRiP/OJyP+R69iXa5vwZh07zl4kVzbAjyGSs3AmMqzGw/E5+ic5s61LxdGrf3SqbvOPNGR9gwJ9Urz/3bWUNn4gGpLZra4gaEwlbz3jZt+XEEVzNkC+7lp3mXwgMLVFSFpEOC1YKk9aYS/T7hr1wOIUOa/re3pmXDRec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781850221; c=relaxed/simple;
	bh=MeYguJ5bVK/QQLgaAGs1+qpDxtHkQFVOPrxrRUEyZFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z1L83XXTCsvVXL+BKkhjfBeythPJBvHBwdF9Cgs3g/8D9rT+iNBzsiC8U2eSk/+aFicJCwcHqz9k0SUP6mGlcViujrp6g+gH0qdZpNYKEzFu9pjJkLHdp48b23MgDBiIX+x38kuqPGFbzlnqxh3MGC9u0zyKztwkT4ZkdfKjIuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=i32GYOuS; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="i32GYOuS"
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [52.148.138.235])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3501C20B7168;
	Thu, 18 Jun 2026 23:23:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3501C20B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1781850218;
	bh=3DCZNlUVaLaJPu2CPNN2vPukycGXAc4wziVR3oMZX+k=;
	h=From:To:Cc:Subject:Date:From;
	b=i32GYOuSvBY9mRFjqPUH4A5fcBMRW5qrAWSA6w9D0uZDYlD92j3MzgXj8KcA+82FM
	 cWPTx2zyUOLA9ZlEHoGpj5WIU7k3GAk4J/jkcSqcm8OSdSHaZGN4cJdryBj/7jVS00
	 XDOdlLYKVqsLLk8YR0dG3LEb+7HbrxuCnOTuuJm8=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: rppt@kernel.org,
	akpm@linux-foundation.org,
	tgopinath@linux.microsoft.com,
	bboscaccy@linux.microsoft.com,
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
Subject: [RFC v2 PATCH] reserve_mem: add support for static memory
Date: Thu, 18 Jun 2026 23:23:31 -0700
Message-ID: <20260619062331.348789-1-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

reserve_mem relies on dynamic memory allocation, this limits the
usecase where memory is required to be preserved across the boots.
Eg: ramoops memory reservation on ACPI platforms

So add support to pass a pre-determined static address and reserve
memory at a specified location. This enables use case like ramoops
on ACPI platforms to reliably access ramoops region with previous
boot logs.

Also skip the parsing of <align> when static address is passed.

Example syntax for static address
 reserve_mem=4M@0x1E0000000:oops

Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
---
v1: https://lore.kernel.org/lkml/0eaf3be2-5121-48b7-aeed-196405c0a480@infradead.org/
v2: Fix code logic and incorporate Randy's suggestion
---
 .../admin-guide/kernel-parameters.txt         | 15 ++++++
 mm/memblock.c                                 | 47 +++++++++++++------
 2 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f228..7e0baca564b97 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6563,6 +6563,21 @@ Kernel parameters
 
 			reserve_mem=12M:4096:oops ramoops.mem_name=oops
 
+	reserve_mem=	[RAM]
+			Format: nn[KMG]:<@offset>:<label>
+			Reserve physical memory at predetermined location and label it with
+			a name that other subsystems can use to access it. This is typically
+			used for systems that do not wipe the RAM, and this command
+			line will try to reserve the same physical memory on
+			soft reboots. Note, it is guaranteed to be the same
+			location unless some other early allocation, e.g.: crashkernel=256M
+                        (without static address) is reserved or overlaps this region.
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
index 6349c48154f4b..c76cefa0a8a83 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2721,6 +2721,7 @@ static int __init reserve_mem(char *p)
 	char *name;
 	char *oldp;
 	int len;
+	bool addr_is_static = false;
 
 	if (!p)
 		goto err_param;
@@ -2736,19 +2737,27 @@ static int __init reserve_mem(char *p)
 	if (!size || p == oldp)
 		goto err_param;
 
-	if (*p != ':')
-		goto err_param;
+	/* parse the static memory address */
+	if (*p == '@') {
+		start = memparse(p+1, &p);
+		addr_is_static = true;
+	}
 
-	align = memparse(p+1, &p);
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
@@ -2772,14 +2781,22 @@ static int __init reserve_mem(char *p)
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
 	}
 
 	reserved_mem_add(start, size, name);
-- 
2.43.0

