Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72676C7EE22
	for <linux-doc@archiver.kernel.org>; Thu, 11 May 2023 13:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238110AbjEKNvB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 May 2023 09:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238135AbjEKNu4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 May 2023 09:50:56 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D6719AE
        for <linux-doc@vger.kernel.org>; Thu, 11 May 2023 06:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683813054; x=1715349054;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=goBFUJ7UZs0dYyuEV5My6BVRqae6i6p1vfypGMQ2jEg=;
  b=qMVEs8GI1lPbMXv0U1Cy/tqk1FvFExU8gS+wRyuuS+elQ1+P77zQh+lS
   nsn/8EXRxrTotMTPOEU2zFuVfzc/Wp1Wr5H2AZ+JQHUMiMHikMa/X2jAH
   UaOIJfBewIX8jTHqEJgEzkLmmoWIf0UKt5CUDoP0demdPtkHXi/MU43mB
   306dHIeva+LB7Vs3ia+0yFn5ZdCOaWLmgqrudrvAw2iVzYj8v/solEdT1
   5YbhzxD532QHhjfYuWulmXIRL3JIGPrym8UG+BLWU3s/kx8LeoC5hVdh/
   QO7j9m/uVQ0ni/5kmny9QIqY7aUDLB5V2DVrC62oZuTZbUK6Q+JgYiemx
   w==;
X-IronPort-AV: E=Sophos;i="5.99,266,1677567600"; 
   d="scan'208";a="151547033"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 May 2023 06:50:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 11 May 2023 06:50:52 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 11 May 2023 06:50:51 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <palmer@dabbelt.com>
CC:     <conor@kernel.org>, <conor.dooley@microchip.com>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Jonathan Corbet <corbet@lwn.net>,
        <linux-riscv@lists.infradead.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v1] Documentation: RISC-V: patch-acceptance: mention patchwork's role
Date:   Thu, 11 May 2023 14:50:21 +0100
Message-ID: <20230511-equation-decline-56b638ff9440@wendy>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=goBFUJ7UZs0dYyuEV5My6BVRqae6i6p1vfypGMQ2jEg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkxn2ZL294VUZ839dbabiem9S92znz4odok1f3B9rgJ0Sp+ m6486ShlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEjpcx/OHP3WfpIuaastb38V+77Q 3dvBseZSupJUmvEJl18++imnxGhgtv4zYVl7t08M+9u+dPUveCSQsPJHDErKhwes+0zmbdBGYA
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
The bit about fixes being applied to riscv/fixes is not actually
correct, it's actually linux-next/pending-fixes. We've not had issues
with the fixes branch being broken in a while, but I switched it over
to pending-fixes due to the KVM breakage. I'll swap back to match the
documentation I'm adding.

I was also not sure if this was the correct doc for this, or whether a
process/maintainer-riscv.rst file was better suited. There's clearly no
rush on this though so ¯\_(ツ)_/¯

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
index 1d1fb885326b..76ec57626043 100644
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
+detected as a fix. The exact commit to which a series has been applied will be
+noted on patchwork.
+Patches for which any of the checks fail are unlikely to be applied and in most
+cases will need to be resubmitted.
+
 Submit Checklist Addendum
 -------------------------
 We'll only accept patches for new modules or extensions if the
-- 
2.39.2

