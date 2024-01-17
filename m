Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E601C1401D
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481735; cv=none; b=lwVMug6NqVuIL+85daAXMYmeag8Hc08kixWShq6oesoCo/YbsBwgyd6f9SJqBAaqV9QysP1TrTYJEHHF8M0EPr95UZWR1Srns+7SuxlDB2bHcTebChX72hdGi86QzMst1x6oKb3+kvoh2YfptAPphEdcG3DvPyCGhIeG/Alymds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481735; c=relaxed/simple;
	bh=r0GkatFnQtqQ2CLsqVGoh7rUojE1M922+i3h0ofwdeo=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=FUVOnKXTlS5l++EsY063WgGFIC5IfEbAsEpweEzJxTkjkn1qTaPnOawiMC3GS92axJ8a7/k6evqyP9qHnbkVmTnG2vZDIbTVpGq96TJLj+FItr1RnuOY67CPC3fTwv3vw+Q1nhq3ySowApHZw25eDv1t5WpnD+FHtvVWD4KAb2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=PnGNzhLm; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="PnGNzhLm"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5990de0ea91so1133161eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481733; x=1706086533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpLzHU/FPMwc2coNCQArs4Vt7Z1xdwNe6GEamHPph2Q=;
        b=PnGNzhLml9UBG1m22U6Ocnxk0Bb1qWLIEmby+SFa4eQtgSX/aD7EzvthG6CIuWOyLB
         29WHn9BbdgWIhl1bh9dhDKOh1YPAsbKwywJN1kYQgnnzKE5qAPXq5+OS6hvV9pWwxn2u
         hjyjncgmA1ivx3DI+46ACqityUPSDDtYM+RpJNTQIOZDnZltk3dOTm4aGzwYfdCrMK1S
         rVxtWW07QILGC/jtZNRTvwUPN19d1Tsf7C+onjNc7tqFE+X0IY8e+COP9AoVTaphJzBy
         XfX7mHRaySEgLhLilbCTkgRLf/cxr7ATyHPUlMBc+nb0/UH1NHA9IGSlEggdbU7z62Vk
         NkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481733; x=1706086533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QpLzHU/FPMwc2coNCQArs4Vt7Z1xdwNe6GEamHPph2Q=;
        b=BLrrWF8mzW3AHvATQ1wUmKEZB8BdUba1mjKKDg7eDDLMNo0XhNguJqcXe1Mia66Vdh
         A+3F32WjcJnmuECWT3z3UOXbEFYBK5+jdu6MKLnylXMF7l7VWcdsFUU/iKoXPPaU/tMv
         NbKfIi8vcX+waAlhIjN1Hvpvjp7IKXTYbNqldW1tKKjZ5fR9IrVZXn0jJvHJHF8INjlW
         z7Fy/1HfSLAg3oO4iI88SfQ08X5ZIpJtObO9uReJLouWFrZxnJKAn5w6vrp5EnRapiif
         B0WbV5KASSJizb6xerWeT+C/W5WpwTyHA2h8pu132fqFqMKWWPF24oczT/CgMB83trhS
         D3NQ==
X-Gm-Message-State: AOJu0YzPCdGcoc97vPHtXhzimmv3tbwkZf4Th/HIQH+BJ6MoEGtaj6hS
	RjcS2G2HyzD4w/PMziHHxw6zKWvPzK61gA==
X-Google-Smtp-Source: AGHT+IHZlogy0omHCU/ZV5pUspGhVjNOY2z5ki0mnRp15ChHjoBBCt4C3boVzTVUdfU4Bzwz/37+Jg==
X-Received: by 2002:a05:6358:89f:b0:176:29b:280e with SMTP id m31-20020a056358089f00b00176029b280emr1920911rwj.20.1705481732959;
        Wed, 17 Jan 2024 00:55:32 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:55:32 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 05/19] arm64: text replication: add sanity checks
Date: Wed, 17 Jan 2024 16:53:43 +0800
Message-Id: <20240117085357.31693-6-jiahao.os@bytedance.com>
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

The kernel text and modules must be in separate L0 page table entries.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/mm/ktext.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 3a8d37c9abc4..901f159c65e6 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -3,6 +3,27 @@
  * Copyright (C) 2022, Oracle and/or its affiliates.
  */
 
+#include <linux/kernel.h>
+#include <linux/pgtable.h>
+
+#include <asm/ktext.h>
+#include <asm/memory.h>
+
 void __init ktext_replication_init(void)
 {
+	int kidx = pgd_index((phys_addr_t)KERNEL_START);
+
+	/*
+	 * If we've messed up and the kernel shares a L0 entry with the
+	 * module or vmalloc area, then don't even attempt to use text
+	 * replication.
+	 */
+	if (pgd_index(MODULES_VADDR) == kidx) {
+		pr_warn("Kernel is located in the same L0 index as modules - text replication disabled\n");
+		return;
+	}
+	if (pgd_index(VMALLOC_START) == kidx) {
+		pr_warn("Kernel is located in the same L0 index as vmalloc - text replication disabled\n");
+		return;
+	}
 }
-- 
2.20.1

