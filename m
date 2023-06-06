Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D00C7EE24
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jun 2023 07:01:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235798AbjFFHBC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Jun 2023 03:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235817AbjFFHAv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jun 2023 03:00:51 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD7B510CF
        for <linux-doc@vger.kernel.org>; Tue,  6 Jun 2023 00:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686034839; x=1717570839;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9aOdZLL0INgSjDe1MDQQYSUITQ9XpofYHKDcavMUzGc=;
  b=SzJ4iBe/Sw+kP0YPKIVs4qOypAx2WRgrYndIiZh9hwC+yIpC7I9hVAML
   U1xvqdpFwf/Qynk5uNzWPkLtuWdmaGrSWnDnq+FYo5B7UNNDmZAw55Su/
   PmyxDvp12UZaQ5EzccMaTJFsw5w62E5ua2yEokxWKoSnPoj8RhTN6siz5
   BKQ5VXzcl82P+1Mc14lW4Xt2uo4V1Q/pBPflvPJplikZtdDT9pf7LrmMT
   6jqx+GadTHzlZ1vqxiHv8Xc1VKjZbmn7r9rZBFHOZpkSFA2tWgH9W+bkY
   6bo3sTXJFSzbKnZ1+6187JzMR0vuI5scYBn0DZpe8Gi7V1asonvWm8drW
   w==;
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="228592302"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2023 00:00:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 6 Jun 2023 00:00:37 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Tue, 6 Jun 2023 00:00:36 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <palmer@dabbelt.com>
CC:     <conor@kernel.org>, <conor.dooley@microchip.com>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Jonathan Corbet <corbet@lwn.net>,
        <linux-riscv@lists.infradead.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v2] Documentation: RISC-V: patch-acceptance: mention patchwork's role
Date:   Tue, 6 Jun 2023 07:59:19 +0100
Message-ID: <20230606-rehab-monsoon-12c17bbe08e3@wendy>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=2386; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=9aOdZLL0INgSjDe1MDQQYSUITQ9XpofYHKDcavMUzGc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCl1N83thU0EXL6cud/843YLj0n51n8v0vfalmyqTFy3u73s dVxoRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACaSqsrI8D6n5eQW1bqyVzevnT75Zs tZf3e/v8X3bnG3m8Zy1P3Yspvhnzln4loBr+pnM5qt1QOvLXux9lt35g7LC4Fh6lszzx7NZgcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Palmer suggested at some point, not sure if it was in one of the
weekly linux-riscv syncs, or a conversation at FOSDEM, that we
should document the role of the automation running on our patchwork
instance plays in patch acceptance.

Add a short note to the patch-acceptance document to that end.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I was also not sure if this was the correct doc for this, or whether a
process/maintainer-riscv.rst file was better suited. There's clearly no
rush on this though so ¯\_(ツ)_/¯

Changes in v2:
- mention that riscv/master is now also a possible application target.

CC: Björn Töpel <bjorn@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-riscv@lists.infradead.org
CC: linux-doc@vger.kernel.org
---
 Documentation/riscv/patch-acceptance.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
index 07d5a5623e2a..634aa222b410 100644
--- a/Documentation/riscv/patch-acceptance.rst
+++ b/Documentation/riscv/patch-acceptance.rst
@@ -16,6 +16,24 @@ tested code over experimental code.  We wish to extend these same
 principles to the RISC-V-related code that will be accepted for
 inclusion in the kernel.
 
+Patchwork
+---------
+
+RISC-V has a patchwork instance, where the status of patches can be checked:
+
+  https://patchwork.kernel.org/project/linux-riscv/list/
+
+If your patch does not appear in the default view, the RISC-V maintainers have
+likely either requested changes, or expect it to be applied to another tree.
+
+Automation runs against this patchwork instance, building/testing patches as
+they arrive. The automation applies patches against the current HEAD of the
+RISC-V `for-next` and `fixes` branches, depending on whether the patch has been
+detected as a fix. Failing those, it will use the RISC-V `master` branch.
+The exact commit to which a series has been applied will be noted on patchwork.
+Patches for which any of the checks fail are unlikely to be applied and in most
+cases will need to be resubmitted.
+
 Submit Checklist Addendum
 -------------------------
 We'll only accept patches for new modules or extensions if the
-- 
2.39.2

