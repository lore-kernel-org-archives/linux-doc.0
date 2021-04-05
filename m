Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4023FC433ED
	for <linux-doc@archiver.kernel.org>; Mon,  5 Apr 2021 16:44:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C89F613B5
	for <linux-doc@archiver.kernel.org>; Mon,  5 Apr 2021 16:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242605AbhDEQoO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Apr 2021 12:44:14 -0400
Received: from foss.arm.com ([217.140.110.172]:56134 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242683AbhDEQoJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 5 Apr 2021 12:44:09 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BA401424;
        Mon,  5 Apr 2021 09:44:03 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3994D3F694;
        Mon,  5 Apr 2021 09:44:01 -0700 (PDT)
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
To:     maz@kernel.org, mathieu.poirier@linaro.org
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, anshuman.khandual@arm.com,
        mike.leach@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        peterz@infradead.org, leo.yan@linaro.org, robh@kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v6 19/20] Documentation: trace: Add documentation for TRBE
Date:   Mon,  5 Apr 2021 17:43:06 +0100
Message-Id: <20210405164307.1720226-20-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20210405164307.1720226-1-suzuki.poulose@arm.com>
References: <20210405164307.1720226-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Anshuman Khandual <anshuman.khandual@arm.com>

Add documentation for the  TRBE under trace/coresight.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
[ Split from the TRBE driver patch ]
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 .../trace/coresight/coresight-trbe.rst        | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/trace/coresight/coresight-trbe.rst

diff --git a/Documentation/trace/coresight/coresight-trbe.rst b/Documentation/trace/coresight/coresight-trbe.rst
new file mode 100644
index 000000000000..b9928ef148da
--- /dev/null
+++ b/Documentation/trace/coresight/coresight-trbe.rst
@@ -0,0 +1,38 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================
+Trace Buffer Extension (TRBE).
+==============================
+
+    :Author:   Anshuman Khandual <anshuman.khandual@arm.com>
+    :Date:     November 2020
+
+Hardware Description
+--------------------
+
+Trace Buffer Extension (TRBE) is a percpu hardware which captures in system
+memory, CPU traces generated from a corresponding percpu tracing unit. This
+gets plugged in as a coresight sink device because the corresponding trace
+generators (ETE), are plugged in as source device.
+
+The TRBE is not compliant to CoreSight architecture specifications, but is
+driven via the CoreSight driver framework to support the ETE (which is
+CoreSight compliant) integration.
+
+Sysfs files and directories
+---------------------------
+
+The TRBE devices appear on the existing coresight bus alongside the other
+coresight devices::
+
+	>$ ls /sys/bus/coresight/devices
+	trbe0  trbe1  trbe2 trbe3
+
+The ``trbe<N>`` named TRBEs are associated with a CPU.::
+
+	>$ ls /sys/bus/coresight/devices/trbe0/
+        align flag
+
+*Key file items are:-*
+   * ``align``: TRBE write pointer alignment
+   * ``flag``: TRBE updates memory with access and dirty flags
-- 
2.24.1

