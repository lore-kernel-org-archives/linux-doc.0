Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DED2EBB88
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567162; cv=none; b=tjp1loO7LsoHp0rdLFqPF6HE36F3jAVwrGAVtlxCe8boiwQEUetj9ppmdP9h84kSN01NUZSRMbJiODDn0VItv/njxnA1AsZCLIVQ8JjYHKlxLIQg0JWjutrIEUK/KgeRfdfUGzQsjQ8O7HEz03zNXBkFw6jSx/gfduvem+36BgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567162; c=relaxed/simple;
	bh=UTLUC0zYLNIpIU6hlTY4UtGB00tOu5axyPBTWNkQRLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=id5j/SJ0zVt/yiH9s0NjVc/RhmtW3+jucPe51kVatyeHgBI5Id//hzjOweGtynzrlW6Wt6itKcGP1AnIYxDGM5Nhkrk/avivQ5P7ja7vX8ew33Pj9Ffx3RQlXx1GPd3jFhsZAmhZVR3DtWWUPOsuEfxq4pL2wak5SoqH1uEx9Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=topb2Bvh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="topb2Bvh"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b566859ecso5397281f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567152; x=1764171952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk1lFWru0IGdhKwRKbnhtV9p6FImm0O6RRZYNI9uc9w=;
        b=topb2Bvhry0CkWkwgvz5KAsjSApRvdGEL1pk4gMYp+l4C8pvgogsHSnOylyQYtNqmK
         xj7iQtzRUmAd9OItTRZYSMc/IzfCoVaVreqgx/0YEF3wJeXogmRbE18mBN+eLD00CRbY
         iQ7DeBReF3MEWzqmOejNVnppa85e7BV6FTKJYdyxTgm96vEEgfbr1/sNC+CpwzR4u3Br
         fChbO4MWB2+bwmXjYximwr6WjjZcWE4JLslUhK2xGsDrBD7MCbXDaWd71K9ivllolQQp
         zIEgSm+Da5qdhnUixIs7MzqvUebI3nSqy6Lw2+6JzsNBgyLN8jGP+XjoNUVRUMGhXAlZ
         mtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567152; x=1764171952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uk1lFWru0IGdhKwRKbnhtV9p6FImm0O6RRZYNI9uc9w=;
        b=ChE+ncT8rZIb/0cdtkq1bPs5/ucgFJHV5cInv9E36iyQ55Q1BPKl+6GJQ7AuOva1MS
         /9yDdHS4GQ25Hq29vA3rjZC7T4gE3peKC7mlHKXQa2MLpMrxaNz8Infm4BpiJwYb799C
         GyNi3CLioQGecBBRmY6u6vN9PckZ7YCW5IBU/IAnP2R18PgGkTgSz4yanEwYmI9LtHkZ
         7keg3TTsQhRaUhfAY+Qm60NUEGRUtzubczzEUPhND0ZaibbggNY38J0DiyQboTHTY8V7
         x7VgYmJVqxWvXc+vr39cxxKsVywN2m1pCPdrFUCLSR6LXfxx2lMhz69CtYbakpbH7Krx
         cLiw==
X-Forwarded-Encrypted: i=1; AJvYcCVqbqHn33Pp0wSsyQTF9aE3yL42w/17hPw87mrychB/qszeOk02RTFmnhaqI915EunizUwxM4xcrkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDFZzbprXwd3kDb5KFiNX8ZpEsDLRhOvU0eNOeWwWm8tGOHDz0
	fBw8Pux9c036a1Gw+nTcSgeWz7Uue8gaTb9gPqAyL0MPCAWdHruP/Xgq7vxEYAYM0uo=
X-Gm-Gg: ASbGncuHlzjv3F5osHLvqDqs0vA8alOMJ+kgsJZvAOcuSGqyXYKybdBOqsjKAmRkHo4
	ZV4lBAe4pcGfuEdkAEQNJ1AYOZHaecDCYgDVMC3iVCv5DL/WaVrTPJXE8mhS33SbJmbK/cVGc36
	a3XGMW5S0zA0xLJxwzQOie5ArvYw3fGtzjpvO1+Wwrv98O+pDhKLUqp6Pk/0Wf0uu5QzknvCXwP
	v54PZZY6cdQqrjhTe3O+8UN7ORoLYZNUV+28BVV3U/uHNTt1oKFBAKZ/KSRn/Gj7y5a0ihyfTMR
	aLiYMsKQuXvRwiqnUJlJ8skRD+g+MPddMn55wRz8v/N4d1zXK6RP4qks9DI9sp/Bjiq4djavnfp
	dm0OHOlP1w8VIEW7wVYKtEg0N2FhgX6KjzhXoOfTXE/AjwFmRbu8QyS00W38JZRtcuGLhDUtZxQ
	6iMDlp/Pitf9tBvoqkhD2tqrbOdgiM3w==
X-Google-Smtp-Source: AGHT+IGiIxmeqrKKXMpyNCEgyddWcck0X4KYjA7E97PFt6A4ulW3WkSU04Vt6omGLvNuAQXzgiycDA==
X-Received: by 2002:a05:6000:2888:b0:42b:3ab7:b8b9 with SMTP id ffacd0b85a97d-42b5934db2cmr19180692f8f.20.1763567151698;
        Wed, 19 Nov 2025 07:45:51 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:51 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 20/26] mm/sparse: Register information into meminspect
Date: Wed, 19 Nov 2025 17:44:21 +0200
Message-ID: <20251119154427.1033475-21-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate vital static information into meminspect:
 - mem_section

Information on these variables is stored into inspection table.

Register dynamic information into meminspect:
 - section
 - mem_section_usage

This information is being allocated for each node, so call
memblock_mark_inspect to mark the block accordingly.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/sparse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/sparse.c b/mm/sparse.c
index 17c50a6415c2..80530e39c8b2 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -15,6 +15,7 @@
 #include <linux/swapops.h>
 #include <linux/bootmem_info.h>
 #include <linux/vmstat.h>
+#include <linux/meminspect.h>
 #include "internal.h"
 #include <asm/dma.h>
 
@@ -30,6 +31,7 @@ struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT]
 	____cacheline_internodealigned_in_smp;
 #endif
 EXPORT_SYMBOL(mem_section);
+MEMINSPECT_SIMPLE_ENTRY(mem_section);
 
 #ifdef NODE_NOT_IN_PAGE_FLAGS
 /*
@@ -253,6 +255,7 @@ static void __init memblocks_present(void)
 		size = sizeof(struct mem_section *) * NR_SECTION_ROOTS;
 		align = 1 << (INTERNODE_CACHE_SHIFT);
 		mem_section = memblock_alloc_or_panic(size, align);
+		memblock_mark_inspect(virt_to_phys(mem_section), size);
 	}
 #endif
 
@@ -343,6 +346,7 @@ sparse_early_usemaps_alloc_pgdat_section(struct pglist_data *pgdat,
 		limit = MEMBLOCK_ALLOC_ACCESSIBLE;
 		goto again;
 	}
+	memblock_mark_inspect(virt_to_phys(usage), size);
 	return usage;
 }
 
-- 
2.43.0

