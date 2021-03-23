Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216B9C433DB
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 12:08:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C421D619B1
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 12:08:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbhCWMIB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Mar 2021 08:08:01 -0400
Received: from foss.arm.com ([217.140.110.172]:45220 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230340AbhCWMHi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 23 Mar 2021 08:07:38 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83AF811B3;
        Tue, 23 Mar 2021 05:07:38 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F13493F719;
        Tue, 23 Mar 2021 05:07:36 -0700 (PDT)
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        mathieu.poirier@linaro.org, mike.leach@linaro.org,
        leo.yan@linaro.org, anshuman.khandual@arm.com, maz@kernel.org,
        catalin.marinas@arm.com, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v5 17/19] Documentation: coresight: trbe: Sysfs ABI description
Date:   Tue, 23 Mar 2021 12:06:45 +0000
Message-Id: <20210323120647.454211-18-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20210323120647.454211-1-suzuki.poulose@arm.com>
References: <20210323120647.454211-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Anshuman Khandual <anshuman.khandual@arm.com>

Add sysfs ABI documentation for the TRBE devices.

Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
[ Split from the TRBE driver patch ]
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-trbe   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe b/Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe
new file mode 100644
index 000000000000..ad3bbc6fa751
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe
@@ -0,0 +1,14 @@
+What:		/sys/bus/coresight/devices/trbe<cpu>/align
+Date:		March 2021
+KernelVersion:	5.13
+Contact:	Anshuman Khandual <anshuman.khandual@arm.com>
+Description:	(Read) Shows the TRBE write pointer alignment. This value
+		is fetched from the TRBIDR register.
+
+What:		/sys/bus/coresight/devices/trbe<cpu>/flag
+Date:		March 2021
+KernelVersion:	5.13
+Contact:	Anshuman Khandual <anshuman.khandual@arm.com>
+Description:	(Read) Shows if TRBE updates in the memory are with access
+		and dirty flag updates as well. This value is fetched from
+		the TRBIDR register.
-- 
2.24.1

