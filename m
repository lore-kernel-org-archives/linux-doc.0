Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16431BC33
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481730; cv=none; b=A/DL+WGi0zcVizDbdWK8+rrXVjCE/srV4MYBAA9wef2WLrSVrgzBdbMquTnZT1kuGO9IFOFxcb4ZkrOFrkFV6gp27lvHgsQBxVGPu49MGPLZyNg9R6ZBc2J/GhhE2FVtc39qjuu/T4xVj33PYeqyrAUQhbrXG1jMtoMlr4Fwdzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481730; c=relaxed/simple;
	bh=+uOsVj3TNxMwX81Sd+6TcY6N+89aOTHxqdhes36x8gg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=eUIPKWEEDoQF1MwHCdKAkSbrJRFPsRWlsq/jYMdZWPVpNvWitJoug5qutyRnvMvVI3lWyEclPgV21/Zz4jeuXCDPXtiPIhUk6OkYeke91xLONH0gzdYM+6PoxhxdG6FoI7tT9OkXt78C4M2tY9gqIdoYE/+JMUAvinOittc/oME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HDRhJdZ5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HDRhJdZ5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d50d0c98c3so78635555ad.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481728; x=1706086528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+O1V0nkehlyRrcmqMiq9mbDUfDrJ7APqhT05uzoFec=;
        b=HDRhJdZ5eTf6hrZDO7vBMUFFDeUgWAhK9Qx/3XUR0wOYNxsBydmong5dQMta9TNI8C
         A0IMd2a988ZdWxi1gGdj6L1im0MuT9RahZ7gREsWtLu13Szo6eq/E4+pEcNacK1OEqX/
         PZwIzOOX0wrdnaBCAUXlN/yTWmmzdv+y3q/nfcfXXuL2DLYSH6agmAfE3ECHnS1FIE8v
         GdBBJmLeWe5vAkCQlcrYvBN0IMZyYp9YquNVvNDZO1ANiliHgisk7jVoTZ7TBUwdBNZp
         VW+IWDVmzXhPF+/Obn0RUJdY6bz19UDvFMQptiXCe310Sv2vAviqQIoXpm9sl30pdcvj
         5QRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481728; x=1706086528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+O1V0nkehlyRrcmqMiq9mbDUfDrJ7APqhT05uzoFec=;
        b=cwRQXO4nSApnK+6qsvxTu7/M/27bVAptZ6UEr/uWjzkcZBGRQuBNF6ka+ZfxIHzs3e
         o1K37lK/bPZX32EtXxYuUDx4RdbvLva/0OUyAEJMbs68T1mEs4rBz9NwNlbeXISx4ZJq
         V4eU5ryf2vJVRqU7fJNx7ctH3bccgIO0EewsJXhyiNUeH7WQa8+HnUAvaEdaZmwg051v
         vndb3GOJ924sbOgI2J8QjZ77hx1vUIdURhljcPNqstwCSKPoexkth9+0RLigeRSV5dq9
         EcqL9ed3x0j3Q5RdTo/SkqbOfytpDDDe9ovjS3v8saG08zM3zH8U+iZjBXRYqaaUJ7zd
         NF7Q==
X-Gm-Message-State: AOJu0YwawMvw0IHUBa+u33klYi3YdLgFtv44KvwFIjSJWKz0uEdTobxb
	vWOwMJYB15A+YK+LzkX9/qzoVVtftcH+J0W5ILex1Uiv8Fe/svEPA8vFJHwaYp6fcPnROjJu05h
	/
X-Google-Smtp-Source: AGHT+IGj3L+NWWGMaUDKw1azN9h6wfZgIN8cUeMIZaFVzM+Ftcp7mLFnnyHE1jZmsP25F36mnrWBfA==
X-Received: by 2002:a17:902:da8f:b0:1d3:8bf1:9add with SMTP id j15-20020a170902da8f00b001d38bf19addmr926810plx.36.1705481728024;
        Wed, 17 Jan 2024 00:55:28 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:55:27 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 04/19] arm64: text replication: add init function
Date: Wed, 17 Jan 2024 16:53:42 +0800
Message-Id: <20240117085357.31693-5-jiahao.os@bytedance.com>
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

A simple patch that adds an empty function for kernel text replication
initialisation and hooks it into the initialisation path.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/ktext.h | 20 ++++++++++++++++++++
 arch/arm64/mm/Makefile         |  2 ++
 arch/arm64/mm/init.c           |  3 +++
 arch/arm64/mm/ktext.c          |  8 ++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 arch/arm64/include/asm/ktext.h
 create mode 100644 arch/arm64/mm/ktext.c

diff --git a/arch/arm64/include/asm/ktext.h b/arch/arm64/include/asm/ktext.h
new file mode 100644
index 000000000000..1a5f7452a3bf
--- /dev/null
+++ b/arch/arm64/include/asm/ktext.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2022, Oracle and/or its affiliates.
+ */
+#ifndef ASM_KTEXT_H
+#define ASM_KTEXT_H
+
+#ifdef CONFIG_REPLICATE_KTEXT
+
+void ktext_replication_init(void);
+
+#else
+
+static inline void ktext_replication_init(void)
+{
+}
+
+#endif
+
+#endif
diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index dbd1bc95967d..41e705027c57 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -14,3 +14,5 @@ KASAN_SANITIZE_physaddr.o	+= n
 
 obj-$(CONFIG_KASAN)		+= kasan_init.o
 KASAN_SANITIZE_kasan_init.o	:= n
+
+obj-$(CONFIG_REPLICATE_KTEXT)	+= ktext.o
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 74c1db8ce271..e336a26e1072 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -37,6 +37,7 @@
 #include <asm/fixmap.h>
 #include <asm/kasan.h>
 #include <asm/kernel-pgtable.h>
+#include <asm/ktext.h>
 #include <asm/kvm_host.h>
 #include <asm/memory.h>
 #include <asm/numa.h>
@@ -329,6 +330,8 @@ void __init bootmem_init(void)
 
 	arch_numa_init();
 
+	ktext_replication_init();
+
 	/*
 	 * must be done after arch_numa_init() which calls numa_init() to
 	 * initialize node_online_map that gets used in hugetlb_cma_reserve()
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
new file mode 100644
index 000000000000..3a8d37c9abc4
--- /dev/null
+++ b/arch/arm64/mm/ktext.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022, Oracle and/or its affiliates.
+ */
+
+void __init ktext_replication_init(void)
+{
+}
-- 
2.20.1

