Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C426339DBD1
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 06:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445946; cv=none; b=WTKr0MqjnI8P+9gCft1Fm+Tx7vq/n/Cdu7K4TOh5zTQtZQgLik4XzD636TPJybPrIgtk5B1Lfpqh1uQ10I+CPikcCTehfJLXI8zA3bM/jMzEzHfVqNKjdACA+1VKq6tYUmLPkdln1r/R/7Ln9wEuDM2VMANl1B2CKZX8b4BW+98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445946; c=relaxed/simple;
	bh=4vP7N1zetgFgj1WqIi/8IydbnE6WqBVEmWVx1kRBdBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fh/OcSEOAlakr3aTHY4vjRv5aoMiy28C+1/7nw0uRWB8ax3CuNVhuhI58/6kd5tPO6IFR1uJaZMjxQgUgmXOZhkTl3VJTaD5URXGPEX1za3YaHG1U7HrBHvFSsrSNyeSXbrOGfCZcS6DnXN4NL+ShAP2D+5crfNzhZGnRA88fM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9k3Bx5F; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9k3Bx5F"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso8232138b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 23:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445944; x=1778050744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X32YgoESRg0ywcKfjv7wOK1DWSx0V8m7oh8gezp47dw=;
        b=P9k3Bx5FnPEUJ9xsz9HaIP/KlmgWRKYrMOnNrcrwJZrPgP+1AnBkp4pMmSxdi9mbl9
         8o2+L01Enwt+y66NaSpXSALAgWNOwy2hZeF5a7PjoRiKd9HQIvl00z8C+kcr1xHENr5E
         Yq/2EG0ogRfNJEOArkrsVRd1C600CLIhEBOa7/AM0IqNsIbGncyQtcEvchyUUVwzpGfs
         3yYSnLAWbBVvWRE65jwgX0ToPPjDOx1Z/RmuFNAupcuWN347lc+tJYag6ahOwWahd0Te
         UfQZ6GWMUQuFE9vjJOPJe5hi7Nla6KLa70RHBHPof6uhkXPafnqhB8oFQli4RzdhrMRl
         AW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445944; x=1778050744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X32YgoESRg0ywcKfjv7wOK1DWSx0V8m7oh8gezp47dw=;
        b=FRovHyrpfwF81c5kWna3UyAUI4Xw1YY/1XYkb8YEGUybx7ZUYqoNfNUKclHMcACC7o
         pUP8zERX7msIWgxIBN776Asi8ImYeVduEOAo2dIa7OGoJv3XgBPYzV1iuWg2H1Ym59hJ
         hh9pp00GxSM6wZ9kWjyCTgdloXNDRjWy/p3K/6jLytHnb+NjCSxCHwAIQ32FYWkljuh5
         j8PcS7jcxB52LNyk0WhBbs1LLwWYnn+REHWP1lbGiWBIuiiyDqrI0bvzB2/cJRDwzh+N
         OPnOz5awO22ZvRyNmdCFRc8LagftVVf7lt/vEEPz84kgV9jsHdch8V8WrpFWlFRvoeUG
         m1WA==
X-Forwarded-Encrypted: i=1; AFNElJ8tZFCXTAjIHESxacugP24x3KNuVN358iuavlf6d5+TroUN6pRfOI4doUSH5C5SgnjP0hWNH9RYUOA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8OKmkO8MurDpTeIAoYWc6ZPcWwLJtM2G4GrKDeGA1TIn+w4v3
	kBKO7KdsbKRKDE7EsJXSIvxY3rkdzzHwSGVo9/r8uH8NTdYTC4Noz/ak
X-Gm-Gg: AeBDies3926ir8S0zgaQUNXusTi/7zlguEjMtaqd7YN3uTMTPDej7fRlGziS8D5Uqwj
	B5wvvyV3Hou+gOWP01JYOYTj6cbaf0Yvnnvy22GCAf8IipAyxYwsKrFEubytUtdUFqGJgLZ7Gjh
	2+1l7QO4x1BabT/7JvWPoDNwKk96lyPMiJOR3Kdz9Q+qDftWCC5fCkFvglKGdEbKikHiR36n87w
	hhxM/cFqKpN87m4xNTkxKJDm0jRhGomJdKjSAMK8SGxWo1GDwTzcem4DD/oLy9gIYvz/M75aogF
	+FHhC1n8TQfHMtaM6ZAX09UTwL5rmjt6f5ZlN/etwArD9n2lpgRM5ajnw2kij2UO0DsjBL+ic9D
	/pnMZ3KJCPprAkLyn71w4Jq/CCVOItnVjvny74F9bzhpTpnll5MFPXUbd4Id9GhOEFshYQd3xgh
	eb9++zQWx93gv40CzvOo57FFMeHd9XvIijS/aLnVzyJbQ2w2NDth5Oj0loOeY=
X-Received: by 2002:a05:6a00:17aa:b0:823:1c5f:1c43 with SMTP id d2e1a72fcca58-834ddc5725bmr6614944b3a.36.1777445944007;
        Tue, 28 Apr 2026 23:59:04 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:03 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 02/11] of: reserved_mem: reject reserved memory outside physical address range
Date: Wed, 29 Apr 2026 14:58:22 +0800
Message-ID: <20260429065831.1510858-3-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

early_init_dt_reserve_memory() does not validate whether the region
falls within physical memory. If a device tree incorrectly specifies a
reserved memory region outside the physical address range:

 - For the non-nomap path, memblock_reserve() blindly adds the region
   to memblock.reserved, creating a stale entry that refers to
   non-existent memory.

 - For the nomap path, memblock_mark_nomap() silently fails to match
   any region in memblock.memory, but still returns success.

Add a memblock_overlaps_region() check at the entry of
early_init_dt_reserve_memory() to reject such regions before any
memblock operation takes place. This also simplifies the existing nomap
guard: the original "overlaps && is_reserved" condition reduces to just
"is_reserved", since the overlap with physical memory is already
guaranteed by the new check.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 9d1b0193864c..03c676052dab 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -112,14 +112,21 @@ static int fdt_fixup_reserved_mem_node(unsigned long node,
 static int __init early_init_dt_reserve_memory(phys_addr_t base,
 					       phys_addr_t size, bool nomap)
 {
+	if (!memblock_overlaps_region(&memblock.memory, base, size)) {
+		phys_addr_t end = base + size - 1;
+
+		pr_warn("Reserved memory region %pa..%pa is outside of physical memory\n",
+			&base, &end);
+		return -EINVAL;
+	}
+
 	if (nomap) {
 		/*
 		 * If the memory is already reserved (by another region), we
-		 * should not allow it to be marked nomap, but don't worry
-		 * if the region isn't memory as it won't be mapped.
+		 * should not allow it to be marked nomap. The region being
+		 * physical memory is guaranteed by the overlap check above.
 		 */
-		if (memblock_overlaps_region(&memblock.memory, base, size) &&
-		    memblock_is_region_reserved(base, size))
+		if (memblock_is_region_reserved(base, size))
 			return -EBUSY;
 
 		return memblock_mark_nomap(base, size);
-- 
2.43.0

