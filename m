Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386CCC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 29 Sep 2021 14:56:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 201AC613D3
	for <linux-doc@archiver.kernel.org>; Wed, 29 Sep 2021 14:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344836AbhI2O61 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Sep 2021 10:58:27 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:60316
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344866AbhI2O6Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Sep 2021 10:58:24 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 60D3C402D9
        for <linux-doc@vger.kernel.org>; Wed, 29 Sep 2021 14:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632927401;
        bh=K1pTcCDambmk2cm1n6ZjEjTKGt45ssHjrCIqDxdL+pk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=qj44ss7Cf/OrqFvCB65EZw5OH+EYmKD+aJMAJloZjFUdroIcya8cybPvqlNHHnX1N
         J4sKqvkBBTIWfssh2Clxn1YHlvZG8HeEeo3ySiBIocGSxGmcGeVDQgF/JPp/qsUBVa
         mS2UgdhqEjc4Notcf1fOal1hjiJrLhBS0tlelGyo2KT4R6w5uyvUxtq8DzDtTUhDhQ
         7WxIFaL7pdS8w9Fq5XNUXxCLR6paCKxBO9qecL74sc9TuO2QWfOitzX6M0MxvIBs32
         bf1JJLBJ18rh9JlwAO7K/XZUGSgoFON79jLvF6HUx5htiMiCxCKfyUk5Hy76zUGZeO
         4APY8szfQR+Nw==
Received: by mail-wr1-f71.google.com with SMTP id f7-20020a5d50c7000000b0015e288741a4so700339wrt.9
        for <linux-doc@vger.kernel.org>; Wed, 29 Sep 2021 07:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K1pTcCDambmk2cm1n6ZjEjTKGt45ssHjrCIqDxdL+pk=;
        b=w6LrhetNTmsO+v2nlIL1mJYeD4YRP7W6dKdDaWwQReYZOZawTW9FLY93GeSKTPmq2G
         vSjIZR+LkQDhzl+Dc+Hm6V2hFpatbLRJp3l8IttLynZ9wQgj9YYmUkU8GSPZRhd7HRUW
         92aa3vt4cNUQeJFEY1P2nW4dcJt7JwFMhDq8hhdFU6aGw+6qa+1H/lnq0O9H730dqgR/
         l7jEaA/Btos8YLirVHRcunx4n2gWLgLL1bVOe/7ai3fWYWiwooVIEF9QuKvKi1yCoW1X
         HBCyW630H2fD5cA6vFygO94RYzvEUEh+HHeOK1ZwLUV9Strr6A2riTKXwgSAOmWdmb0C
         AsKw==
X-Gm-Message-State: AOAM532IvCTMBRu1unzNOjJf0A/pASeu1S5sXutlMnDsetoM2HW4gso9
        lktSJW6mIPVWnwxSlow2iEypN7IymBLJ429tP/HUjeSVR8DJ21r/qfQh8Yko8UxntY5Yun7tpRB
        B9soM6jmcWxV17cANxyhkRbP6bC+F+3PUf+/Rmw==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr306759wri.75.1632927400963;
        Wed, 29 Sep 2021 07:56:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyP/LmgIdcviRO3JwhxsGcRDtygVIO5lq23IuSLwVVC0VraVWuciMD1ucN9OSE7Hh6VQ+KEYw==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr306729wri.75.1632927400839;
        Wed, 29 Sep 2021 07:56:40 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
        by smtp.gmail.com with ESMTPSA id 25sm2117713wmo.9.2021.09.29.07.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 07:56:40 -0700 (PDT)
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
        Atish Patra <Atish.Patra@wdc.com>,
        Christoph Hellwig <hch@lst.de>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
        Mayuresh Chitale <mchitale@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
Cc:     Alexandre Ghiti <alexandre.ghiti@canonical.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH v2 05/10] riscv: Use pgtable_l4_enabled to output mmu_type in cpuinfo
Date:   Wed, 29 Sep 2021 16:51:08 +0200
Message-Id: <20210929145113.1935778-6-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Now that the mmu type is determined at runtime using SATP
characteristic, use the global variable pgtable_l4_enabled to output
mmu type of the processor through /proc/cpuinfo instead of relying on
device tree infos.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/kernel/cpu.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 6d59e6906fdd..dea9b1c31889 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -7,6 +7,7 @@
 #include <linux/seq_file.h>
 #include <linux/of.h>
 #include <asm/smp.h>
+#include <asm/pgtable.h>
 
 /*
  * Returns the hart ID of the given device tree node, or -ENODEV if the node
@@ -70,18 +71,19 @@ static void print_isa(struct seq_file *f, const char *isa)
 	seq_puts(f, "\n");
 }
 
-static void print_mmu(struct seq_file *f, const char *mmu_type)
+static void print_mmu(struct seq_file *f)
 {
+	char sv_type[16];
+
 #if defined(CONFIG_32BIT)
-	if (strcmp(mmu_type, "riscv,sv32") != 0)
-		return;
+	strncpy(sv_type, "sv32", 5);
 #elif defined(CONFIG_64BIT)
-	if (strcmp(mmu_type, "riscv,sv39") != 0 &&
-	    strcmp(mmu_type, "riscv,sv48") != 0)
-		return;
+	if (pgtable_l4_enabled)
+		strncpy(sv_type, "sv48", 5);
+	else
+		strncpy(sv_type, "sv39", 5);
 #endif
-
-	seq_printf(f, "mmu\t\t: %s\n", mmu_type+6);
+	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
 static void *c_start(struct seq_file *m, loff_t *pos)
@@ -106,14 +108,13 @@ static int c_show(struct seq_file *m, void *v)
 {
 	unsigned long cpu_id = (unsigned long)v - 1;
 	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
-	const char *compat, *isa, *mmu;
+	const char *compat, *isa;
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 	if (!of_property_read_string(node, "riscv,isa", &isa))
 		print_isa(m, isa);
-	if (!of_property_read_string(node, "mmu-type", &mmu))
-		print_mmu(m, mmu);
+	print_mmu(m);
 	if (!of_property_read_string(node, "compatible", &compat)
 	    && strcmp(compat, "riscv"))
 		seq_printf(m, "uarch\t\t: %s\n", compat);
-- 
2.30.2

