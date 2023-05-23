Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03648C7EE26
	for <linux-doc@archiver.kernel.org>; Tue, 23 May 2023 13:20:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236765AbjEWNUY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 May 2023 09:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236478AbjEWNUW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 May 2023 09:20:22 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB67109;
        Tue, 23 May 2023 06:20:19 -0700 (PDT)
Received: from dggpeml500002.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QQZc02Ss1zLq2M;
        Tue, 23 May 2023 21:17:20 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500002.china.huawei.com (7.185.36.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 21:20:16 +0800
From:   Junhao He <hejunhao3@huawei.com>
To:     <will@kernel.org>, <jonathan.cameron@huawei.com>,
        <linux-kernel@vger.kernel.org>, <mark.rutland@arm.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
        <yangyicong@huawei.com>, <shenyang39@huawei.com>,
        <prime.zeng@hisilicon.com>, <hejunhao3@huawei.com>
Subject: [PATCH 3/3] docs: perf: Add new description for HiSilicon UC PMU
Date:   Tue, 23 May 2023 21:18:25 +0800
Message-ID: <20230523131825.6102-4-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230523131825.6102-1-hejunhao3@huawei.com>
References: <20230523131825.6102-1-hejunhao3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500002.china.huawei.com (7.185.36.158)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A new function is added on HiSilicon uncore UC PMU.

The UC PMU support to filter statistical information based on
the specified tx request uring channel. Make user configuration
through "uring_channel" parameter.
Document them to provide guidance on how to use them.

Signed-off-by: Junhao He <hejunhao3@huawei.com>
---
 Documentation/admin-guide/perf/hisi-pmu.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
index 546979360513..939a524fa1d6 100644
--- a/Documentation/admin-guide/perf/hisi-pmu.rst
+++ b/Documentation/admin-guide/perf/hisi-pmu.rst
@@ -98,6 +98,14 @@ CCL/ICL-ID. For I/O die, the ICL-ID is followed by:
 5'b00011: HAC_ICL;
 5'b10000: PCIe_ICL;
 
+(e) uring_channel: UC PMU events 0x47~0x59 supports filtering by tx request
+uring channel. It is 2 bits. Some important codes are as follows:
+2'b11: count the events which sent to the uring_ext (MATA) channel;
+2'b01: is the same as 2'b11;
+2'b10: count the events which sent to the uring (non-MATA) channel;
+2'b00: default value, count the events which sent to the both uring and
+       uring_ext channel;
+
 Users could configure IDs to count data come from specific CCL/ICL, by setting
 srcid_cmd & srcid_msk, and data desitined for specific CCL/ICL by setting
 tgtid_cmd & tgtid_msk. A set bit in srcid_msk/tgtid_msk means the PMU will not
-- 
2.33.0

