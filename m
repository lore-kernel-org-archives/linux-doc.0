Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A94A1DA39
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481740; cv=none; b=WpEccWTD+ItPLeRXah9lxeQXNAmmb7pRU+hsIXZ16EB3a6JtYzq92Jek+ZiHu5+6IOVqOLOc6qN17OUu3Vw4zHO8UPpDFiG/0e/BPeroU0JTGD9nzq3J7y5foWLUOBgYLDV5P5LBqmKn8w9KT6c9eZKryzIAEFthQNYizrGxWKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481740; c=relaxed/simple;
	bh=MX/Cax97B3CWeCZEhvJh5spMIZZJUCFEiRHSqWR/dGc=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=H9u3NVOjQxjiC+wKwnJfl9/r+rHQFOhnhA400QzBUOm3K4k4gI8KVfBkU9+fy8yhpol16PxVaRjHBuLpG0H9HucAWzBkX4UK78F+wchIFGTEH4JRAadzD04kvqcVZ1huKUiR4rIASEuZGC46w4DsmXL/5I1sBqkq3Qpe6PtRSh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Vblq6693; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Vblq6693"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6dddfdc3244so5813171a34.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481738; x=1706086538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlS/ErW64O8rlfcikPIcEnfz+fQIBdeJzDvD+fksMoc=;
        b=Vblq6693CdUXk/nLsu3HpzHvgCehPFnEMpe45M4lihmUqz8M09rj9MmhrF/6H6FVET
         /8lUgA7HNP7qB6K2Aw9au95R/bgd3ijALgrQSjHvjNrB3kgdg6xRv7u9bgEoUKr+fASu
         6uKwm5TuIUAcm7EDzdOdQ7Ykzg2EI1+8Bir2SKEn9NZ5VCqdVuCN3q/DTSBBgHiLORcr
         ZeBVdAFUJfX6fIdMRMmaHjuPCGtZ+r0MQasy/bEuJa0W68Tu8CwTQMzTV7xLGxoVAEAo
         rTnKxYKv1LrrOX6jhn4bgLKOMolznZcZUsS/72zdLvXhjT/PCT/cJgMjIa3v0VrVAeD3
         pw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481738; x=1706086538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlS/ErW64O8rlfcikPIcEnfz+fQIBdeJzDvD+fksMoc=;
        b=TZ3S8K2gFub6D03nyqdRyhuWpV9yTmKO+SBVZEroG+5kP94zHlnL5rt3tv4UVW+mhe
         bZej2fBwOI+8N3NEcthMPk1waei1osE+T1HyQ5M/WWikGjmCBi8rjtQU3M/VffkXSJuG
         F3jm+CsK+PCiKbRsBTOYpH9I4EfXEkT93oBjGhkgJpWTLbJq7tgCi4eNqkqTCPo9ydFT
         Q2bdUtXwK152UVUW/ip2/Lh9JrAxcN32Ilu8qZ/PpkI6n49mR5mJ24hvtatmOAWFfzlx
         sm4p08EBvfkhs+pbZq3nSsxHW29UuRPYlgJ85gjkcSkvOeznRCVk/BzrpxI/Fwr2n5fl
         9IOg==
X-Gm-Message-State: AOJu0Yyjz+RU2HzkI3zZskO8qOqh1XQsxIQz+IhcQiszX9rVib+Uc9Py
	GWp06hx2jO5kdNlcnZMDbWM57B4Qs15fHg==
X-Google-Smtp-Source: AGHT+IFyzsKaNa91NeSWFBPh64v7gPI1Wj4zagxqyfcn0vRpProv5P4v2NVNP7QMvE4Il64OYRqD8g==
X-Received: by 2002:a05:6870:2e04:b0:206:75b4:f60a with SMTP id oi4-20020a0568702e0400b0020675b4f60amr11990182oab.94.1705481737992;
        Wed, 17 Jan 2024 00:55:37 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:55:37 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 06/19] arm64: text replication: copy initial kernel text
Date: Wed, 17 Jan 2024 16:53:44 +0800
Message-Id: <20240117085357.31693-7-jiahao.os@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240117085357.31693-1-jiahao.os@bytedance.com>
References: <20240117085357.31693-1-jiahao.os@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Allocate memory on the appropriate node for the per-node copies of the
kernel text, and copy the kernel text to that memory. Clean and
invalidate the caches to the point of unification so that the copied
text is correctly visible to the target node.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/mm/ktext.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 901f159c65e6..4c803b89fcfe 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -4,14 +4,23 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/memblock.h>
+#include <linux/numa.h>
 #include <linux/pgtable.h>
+#include <linux/string.h>
 
+#include <asm/cacheflush.h>
 #include <asm/ktext.h>
 #include <asm/memory.h>
 
+static void *kernel_texts[MAX_NUMNODES];
+
+/* Allocate memory for the replicated kernel texts. */
 void __init ktext_replication_init(void)
 {
+	size_t size = _etext - _stext;
 	int kidx = pgd_index((phys_addr_t)KERNEL_START);
+	int nid;
 
 	/*
 	 * If we've messed up and the kernel shares a L0 entry with the
@@ -26,4 +35,16 @@ void __init ktext_replication_init(void)
 		pr_warn("Kernel is located in the same L0 index as vmalloc - text replication disabled\n");
 		return;
 	}
+
+	for_each_node(nid) {
+		/* Nothing to do for node 0 */
+		if (!nid)
+			continue;
+
+		/* Allocate and copy initial kernel text for this node */
+		kernel_texts[nid] = memblock_alloc_node(size, PAGE_SIZE, nid);
+		memcpy(kernel_texts[nid], _stext, size);
+		caches_clean_inval_pou((u64)kernel_texts[nid],
+				       (u64)kernel_texts[nid] + size);
+	}
 }
-- 
2.20.1

