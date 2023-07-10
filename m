Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324A6EB64DA
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jul 2023 09:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232851AbjGJJjy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jul 2023 05:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbjGJJjL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jul 2023 05:39:11 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC299183;
        Mon, 10 Jul 2023 02:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688981815; x=1720517815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1i34KSawlUL8WNjNkmTiVglWiYjIqUpNKEWr7RWMan4=;
  b=dkU568SU+UcSyHrU6giMnLlJ1v4LoewMAX6SrSQOP45Z3WqxQP/tHPZs
   v9W6ZuI6dkVpeP9T/2osLaawFKsVqAdlv6hG2Hsqa8DSt62A+5UB6L5Ee
   sUZjNOvp2DS2wh4tGl8HZdQdiz7Rc2D4UIaQyV7Mfd2TcN9ZXZX3xAHt3
   26IaZbkz3v9Hb/JaFFtChMyDTf/GLG8Gk4taMsi0Ll5BuY2WxKgQ/qjFm
   KA7MZxIOoJx+k9Hsp/rmlFBP8h7VIYleoO63BPYUtQisjzwuQlaN1ayRG
   i/hI0Tu9OHijMj3AGEoGqNLi4s4go//SUH10a0G2XdRer8ZKKVVefOBxX
   w==;
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="234573296"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jul 2023 02:36:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 10 Jul 2023 02:36:36 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 10 Jul 2023 02:36:34 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <palmer@dabbelt.com>
CC:     <conor@kernel.org>, <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Andrew Jones <ajones@ventanamicro.com>,
        "Heiko Stuebner" <heiko.stuebner@vrull.eu>,
        Evan Green <evan@rivosinc.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        <linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 03/11] RISC-V: drop a needless check in print_isa_ext()
Date:   Mon, 10 Jul 2023 10:35:38 +0100
Message-ID: <20230710-map-unlocking-9f674ee171bb@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230710-equipment-stained-dd042d66ba5d@wendy>
References: <20230710-equipment-stained-dd042d66ba5d@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=1i34KSawlUL8WNjNkmTiVglWiYjIqUpNKEWr7RWMan4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmrL1xTEVf/3XjKu/FK/trOlIJHnLEzzrSGtosIRW32sVOo THPpKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwEQKHBj++wUedIrm8Vv68c578dmTuH bbNJuHllrJPva9c+2/8f2HyxgZzp2WkLmxOl33VdKJsomyh4p4C2M/Lreb6H7JbJfBO6WTnAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

isa_ext_arr cannot be empty, as some of the extensions within it are
always built into the kernel. When this code was first added, back in
commit a9b202606c69 ("RISC-V: Improve /proc/cpuinfo output for ISA
extensions"), the array was empty and needed a dummy item & thus there
could be no extensions present. When the first multi-letter ones did
get added, it was Sscofpmf - which didn't have a Kconfig symbol to
disable it.

Remove this check, as it has been redundant since Sscofpmf was added.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Reword commit message to explain why this can be dropped
---
 arch/riscv/kernel/cpu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index f808b67f5a27..e721f15fdf17 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -237,10 +237,6 @@ static void print_isa_ext(struct seq_file *f)
 
 	arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
 
-	/* No extension support available */
-	if (arr_sz <= 0)
-		return;
-
 	for (i = 0; i <= arr_sz; i++) {
 		edata = &isa_ext_arr[i];
 		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
-- 
2.40.1

