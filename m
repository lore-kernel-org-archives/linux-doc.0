Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A8135DA53
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 02:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375890; cv=none; b=M7fFEGwlfc2AONgVDHIjpJAhIL25dLgm22DKJU1Ym9DvQ5FngIKMZuZUSHVUhrXbw9qJsIMGOc5QhsHTjCYEhXUm7isCyzmYEIwxI0UF3WWZaqJ3Q7kVmQrYZOnPTsbrt8RORstywM30pCrdxA4Dy71C9x0jBEAOHfEoWvlAt10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375890; c=relaxed/simple;
	bh=rtOkMMPCIFi6fzUI2M5IaMOseZq7THOMtUSKvHJvjP8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCobF2SyfX32csNiGNxrx9L3r9jOTfubQT5PEqEQgdGz3e6ltkLVsReURViV+j5VAB1PJSWPEqx4blnRY2ODWz842B3uCNyjFySY73PHgzWLEkpL8xsHkWhpPgvgMLN47EWk9SEdVaNSEI2U8AK989etgR4mYeLmvGJJuP5J78s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=WAB2tqDV; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="WAB2tqDV"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5e9528732b4so1403866e0c.0
        for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 19:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792375887; x=1792980687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+N9EQwOcSjySxMS4O9eOeYmAxXFE2sVJ9Vy3mk5tWu4=;
        b=WAB2tqDVv7A+PBfSDIV0EnBqmTIbQdSH8XfctxV+96Hhe9px9cc5kVaxM8vdm/LcKk
         1D2PKWanxVynzIF1PgK7LxmN9pHAs7T1oNYlZwodrg4BqJiqTqaIgYifLUd/uPpOUGdD
         nszExN/cUixb/e9Xjwx08pKu5rcKaUJwZPaQ498scLf0r/VXIHZUfqGEOmaQEoq1tBLU
         iuH7HIZ3+iCp5ScOj3gGs6hk1LeyJV0VGfP5yl4brNYv8T+ShtLdRMMherIt/+zpdHaA
         +cP5RYBFryRzFEURsQuHvonyO67f5MMS3VoiJX4RilP1OZ2+IiDzfnH5L2R0Y1aVrhRi
         LQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375887; x=1792980687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+N9EQwOcSjySxMS4O9eOeYmAxXFE2sVJ9Vy3mk5tWu4=;
        b=U6aB0nsd/kdR4jgViQIVPxCXHuuWG+8z/d5AF8HdUtzmzSfxfKyGpc0xEvmByv/7Q5
         Mi8jw556QdkYahe7m+aLEsC3+f5NhAQ2HSP+xC+vj90QP8FGU/K1TGrQno/PkWQ0EzCC
         4jonxmxTcnYCkNChMm0slD/+KXrWPAbnblv0+zPrKsRksKFeJA86uHLhaFgZj7iNVGRD
         Gq57rH1qSX4msrV0gUl9WStosT5hCujGjLAxYJvFXUz7Vm/FpTbWhzX+Gb/IbM8mLxDi
         N2Cp3vMBjVV7WY1/j7vBR5xjPBPkfj8z2lH5mKfyA/WWkKIwABS2D+jzYFkJ0BG2vNNB
         gZjg==
X-Forwarded-Encrypted: i=1; AKwUvBzDhsTHUbBaj9yDlB4SFeSNpk7eHnUVm7QI46a0In4pxdUkqP+raBN3hw+MMdAkCkptupAsIGpbhfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAZDRt71mBeeHWcdYMFSM5a80lvipEHJf4TWf8bUktX5lkjVix
	HncNqy4Mny+hr8qKlAs67ue6+gLrm0xcXqBl8OLFsTLU9v6acsWjdxHgWCMqo59Z0NU=
X-Gm-Gg: AYBFou1JISRkVGqoC+KfeO/aI/T1oEXXQwUVK9C+zD/RH6aqwclC59fPfeDYixzgUGN
	gZEsSV0jednuG5noQroPVRWyxtPjautxS4O0TohKz2ryUI0215LpVzIYK49CdUyodLCBLv9298E
	7g6gwUVDwn2ZHKVPtn0AOwcoLNk/zFuOQjSgW1k5koNmibbaZOULQIGwDJCeH6kHyhvQ2vV/qGR
	pUmMPyOEUIWdh6+Sp9nvFNh5rRHW28Nc2PE9MlcZKgmWoWWNMTW4eSvI74IHigaKG7BFD86nLnh
	FP1+o19aidrr1tFYJQVfr7uFLX4qyMJ1DX013OJeaNeOF2E4QaCoUnAPrm3m+/fQZkLHc95nNck
	mWznBOPP0mQ9vVu6yFFxRUmFEhEg5xnw+PT0Ocv7u1ly9KwJVjpI8DymuZ+Zps2DKz4NS5Jn1hd
	THYNd+U4WsRo2QS8nJRiduYWTzt/mBwtfS1z3cBHHuGFdm2B61qnFjqtLkFkktGvpSdpETNoSh2
	Pv4HDi8P3alM410R6akiq8wcNfDri+kSGmwcS8efzGYyb4AjTFs6cbaeQtmGhwSPRtJKINPq4wW
	aX88M+sVafqgO3GeisI=
X-Received: by 2002:a05:6122:3115:b0:5ea:a749:d33c with SMTP id 71dfb90a1353d-5eaaa66d4eamr2218681e0c.9.1792375887405;
        Sun, 18 Oct 2026 19:11:27 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabbd9ea2bsm4271383e0c.2.2026.10.18.19.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:11:26 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v1 6/8] kho: support read-only KHO mode in kho_block
Date: Sun, 18 Oct 2026 22:11:09 -0400
Message-ID: <20261019021111.990394-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261019021111.990394-1-pasha.tatashin@soleen.com>
References: <20261019021111.990394-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In read-only KHO mode, incoming serialized kho_block chains lie outside
the kernel's direct map and must not be modified or freed back into the
page allocator.

Map incoming serialized blocks read-only via kho_ro_map_folio(...,
PAGE_KERNEL_RO) during cycle detection and restoration, and unmap them
via kho_ro_unmap() instead of calling kho_restore_free() when destroying
or shrinking a block set in read-only mode.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/Makefile    |  5 +--
 kernel/liveupdate/kho_block.c | 76 ++++++++++++++++++++++++++---------
 2 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
index f8b09e04bea2..d3587048e619 100644
--- a/kernel/liveupdate/Makefile
+++ b/kernel/liveupdate/Makefile
@@ -1,14 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 
 luo-y :=								\
-		kho_block.o						\
 		luo_core.o						\
 		luo_file.o						\
 		luo_flb.o						\
 		luo_session.o
 
-obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o
-obj-$(CONFIG_KEXEC_HANDOVER_READONLY)	+= kexec_handover_ro.o
+obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o kho_block.o
+obj-$(CONFIG_KEXEC_HANDOVER_READONLY)	+= kexec_handover_ro.o kho_block.o
 obj-$(CONFIG_KEXEC_HANDOVER_DEBUGFS)	+= kexec_handover_debugfs.o
 
 obj-$(CONFIG_LIVEUPDATE)		+= luo.o
diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
index a4e945f28fad..a3cf5b964b26 100644
--- a/kernel/liveupdate/kho_block.c
+++ b/kernel/liveupdate/kho_block.c
@@ -60,10 +60,32 @@ static void *kho_block_entry(struct kho_block_set_it *it, u64 index)
 	return kho_block_entries(it->block) + (index * it->bs->entry_size);
 }
 
+static struct kho_block_header_ser *kho_block_map_ser(phys_addr_t pa)
+{
+	if (!pa)
+		return NULL;
+
+	if (kho_is_ro())
+		return kho_ro_map_folio(pa, PAGE_KERNEL_RO);
+
+	return phys_to_virt(pa);
+}
+
+static void kho_block_unmap_ser(struct kho_block_header_ser *ser)
+{
+	if (kho_is_ro())
+		kho_ro_unmap(ser);
+}
+
 /* Free serialized data */
 static void kho_block_free_ser(struct kho_block_set *bs,
 			       struct kho_block_header_ser *ser)
 {
+	if (kho_is_ro()) {
+		kho_block_unmap_ser(ser);
+		return;
+	}
+
 	if (bs->incoming)
 		kho_restore_free(ser);
 	else
@@ -197,6 +219,20 @@ void kho_block_set_shrink(struct kho_block_set *bs, u64 count)
 		kho_block_set_shrink_one(bs);
 }
 
+static bool kho_block_step_pa(phys_addr_t pa, phys_addr_t *next_pa)
+{
+	struct kho_block_header_ser *ser;
+
+	ser = kho_block_map_ser(pa);
+	if (!ser)
+		return false;
+
+	*next_pa = ser->next;
+	kho_block_unmap_ser(ser);
+
+	return true;
+}
+
 /*
  * kho_block_set_is_cyclic - Check for cycles in a linked list of blocks.
  * Uses Floyd's cycle-finding algorithm to ensure sanity of the incoming list.
@@ -205,30 +241,26 @@ void kho_block_set_shrink(struct kho_block_set *bs, u64 count)
  */
 static bool kho_block_set_is_cyclic(struct kho_block_set *bs)
 {
-	struct kho_block_header_ser *fast;
-	struct kho_block_header_ser *slow;
+	phys_addr_t fast_pa = bs->head_pa;
+	phys_addr_t slow_pa = bs->head_pa;
 	int count = 0;
 
-	fast = phys_to_virt(bs->head_pa);
-	slow = fast;
-
-	while (fast) {
+	while (fast_pa) {
 		if (count++ >= KHO_MAX_BLOCKS) {
 			pr_err("Block set is corrupted\n");
 			return true;
 		}
 
-		if (!fast->next)
-			break;
-
-		fast = phys_to_virt(fast->next);
-		if (!fast->next)
+		if (!kho_block_step_pa(fast_pa, &fast_pa))
+			return true;
+		if (!fast_pa)
 			break;
 
-		fast = phys_to_virt(fast->next);
-		slow = phys_to_virt(slow->next);
+		if (!kho_block_step_pa(fast_pa, &fast_pa) ||
+		    !kho_block_step_pa(slow_pa, &slow_pa))
+			return true;
 
-		if (slow == fast) {
+		if (slow_pa == fast_pa) {
 			pr_err("Block set is corrupted\n");
 			return true;
 		}
@@ -266,16 +298,23 @@ int kho_block_set_restore(struct kho_block_set *bs, u64 head_pa)
 	}
 
 	while (next_pa) {
-		ser = phys_to_virt(next_pa);
+		ser = kho_block_map_ser(next_pa);
+		if (!ser) {
+			err = -ENOMEM;
+			goto err_destroy;
+		}
 		if (!ser->count || ser->count > bs->count_per_block) {
 			pr_warn("Block contains invalid entry count: %llu\n",
 				ser->count);
+			kho_block_unmap_ser(ser);
 			err = -EINVAL;
 			goto err_destroy;
 		}
 		err = kho_block_add(bs, ser);
-		if (err)
+		if (err) {
+			kho_block_unmap_ser(ser);
 			goto err_destroy;
+		}
 		next_pa = ser->next;
 	}
 
@@ -285,9 +324,10 @@ int kho_block_set_restore(struct kho_block_set *bs, u64 head_pa)
 	kho_block_set_destroy(bs);
 
 	/* Free the remaining un-restored blocks in the physical chain */
-	while (next_pa) {
-		struct kho_block_header_ser *next_ser = phys_to_virt(next_pa);
+	while (!kho_is_ro() && next_pa) {
+		struct kho_block_header_ser *next_ser;
 
+		next_ser = phys_to_virt(next_pa);
 		next_pa = next_ser->next;
 		kho_block_free_ser(bs, next_ser);
 	}
-- 
2.56.0.176.g3575e65682-goog

