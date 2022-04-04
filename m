Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAE9C4167B
	for <linux-doc@archiver.kernel.org>; Mon,  4 Apr 2022 21:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379702AbiDDV2k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381018AbiDDVWU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Apr 2022 17:22:20 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C981D30D
        for <linux-doc@vger.kernel.org>; Mon,  4 Apr 2022 14:20:10 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id h16-20020a056902009000b00628a70584b2so8763399ybs.6
        for <linux-doc@vger.kernel.org>; Mon, 04 Apr 2022 14:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=DBbP7cPmiHpe5TN1/LJtSaqk7J0plWu8gjlZ5CS5rhk=;
        b=TZ0NkmLInAy4kYp/+n01zKn7zzlAQwYbOYU6jY1KwnR3G5n4mVA4WMp89xHymMNtfP
         0tsioSzKKpVGh67W/c1oyCZw3dCUqaR2fQfw96LIJgjhSjM95BmdvEizNAM9WtPEkVRr
         DtPgeu6pBu0zAl/vnsNkAlAedpxW1AbHCIIlZNKZ5PhYuY4Jiq195R0OGaA2XuKtrUMO
         qnziyHF0S9GwK33CJbi7GF24qNjf1bt3oMgloRa3IvwBBBe70DLX2iqKTlCePVN/MzQT
         72VosHjFPeonT+rgF2nwR4hz9j+vV4BAGXKPlqp54r6c2l1MfTmTcFNXu2qmhZxWkFUO
         UFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=DBbP7cPmiHpe5TN1/LJtSaqk7J0plWu8gjlZ5CS5rhk=;
        b=BdttMWXHLaarvGPWsQ3Vz+RwIWqWmAU46u440OLFtGih/sOteAQjldi2RfEdB3n654
         yxiujr1GAy5elXnPvif/vhHt7ha51D4y+vidRy1wcCWOtI+f93cHbuNlPJsftwAOnVz1
         RtY7WuRU9Bva9q3t0WObKCOXLbeqC7MCVOaecVFETbQYjvk/Ie+qdeWk/3aQ6JL2JmJk
         ROkHkF4YDYIC+mD8hC5huw7pN9IjeJLOmiwcTvbrKbenPClKoLgwO6y80N87jQwBpegj
         1qX+KSlxE0qY98Z2o1DA1G/I4dfcZZix98fCF6yprgD2LSeOheTlwKd/phzE1Flq0i48
         Uj1g==
X-Gm-Message-State: AOAM530F9NC0zW0cyAeA47F1wFIyNTjIlNfUsm53fcVHGLdzZzTcmP/j
        122R0DD0WSuU1Ig5Hk0Ddx9iYaY=
X-Google-Smtp-Source: ABdhPJwynxzOo1uDL3PwMweufxLtr415yHT/T9PLgILZC1tllY8xKXYrs4PdKMB9UD3Be3KOTlIn+Bs=
X-Received: from pcc-desktop.svl.corp.google.com ([2620:15c:2ce:200:e34c:522f:9edd:2978])
 (user=pcc job=sendgmr) by 2002:a05:690c:13:b0:2dc:50bc:c975 with SMTP id
 bc19-20020a05690c001300b002dc50bcc975mr17931ywb.173.1649107144995; Mon, 04
 Apr 2022 14:19:04 -0700 (PDT)
Date:   Mon,  4 Apr 2022 14:18:58 -0700
Message-Id: <20220404211858.968452-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH] arm64: document the boot requirements for MTE
From:   Peter Collingbourne <pcc@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Brown <broonie@kernel.org>
Cc:     Peter Collingbourne <pcc@google.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When booting the kernel we access system registers such as GCR_EL1
if MTE is supported. These accesses are defined to trap to EL3 if
SCR_EL3.ATA is disabled. Furthermore, tag accesses will not behave
as expected if SCR_EL3.ATA is not set, or if HCR_EL2.ATA is not set
and we were booted at EL1. Therefore, require that these bits are
enabled when appropriate.

Signed-off-by: Peter Collingbourne <pcc@google.com>
Link: https://linux-review.googlesource.com/id/Iadcfd4dcd9ba3279b2813970b44d7485b0116709
---
 Documentation/arm64/booting.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arm64/booting.rst b/Documentation/arm64/booting.rst
index 29884b261aa9..833af981b667 100644
--- a/Documentation/arm64/booting.rst
+++ b/Documentation/arm64/booting.rst
@@ -350,6 +350,16 @@ Before jumping into the kernel, the following conditions must be met:
 
     - SMCR_EL2.FA64 (bit 31) must be initialised to 0b1.
 
+  For CPUs with the Memory Tagging Extension feature:
+
+  - If EL3 is present:
+
+    - SCR_EL3.ATA (bit 26) must be initialised to 0b1.
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HCR_EL2.ATA (bit 56) must be initialised to 0b1.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented
-- 
2.35.1.1094.g7c7d902a7c-goog

