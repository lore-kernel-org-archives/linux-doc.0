Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BB8ECAAD3
	for <linux-doc@archiver.kernel.org>; Thu,  1 Sep 2022 11:06:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233114AbiIALGO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Sep 2022 07:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233658AbiIALGN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Sep 2022 07:06:13 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95031118A7B
        for <linux-doc@vger.kernel.org>; Thu,  1 Sep 2022 04:06:11 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MJJ8P2TlCzHnWY;
        Thu,  1 Sep 2022 19:04:21 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 1 Sep 2022 19:06:09 +0800
From:   Yicong Yang <yangyicong@huawei.com>
To:     <corbet@lwn.net>, <linux-doc@vger.kernel.org>
CC:     Keith Busch <keith.busch@intel.com>
Subject: [PATCH] docs: mm: numaperf: Fix wrong unit for bandwidth
Date:   Thu, 1 Sep 2022 19:04:00 +0800
Message-ID: <20220901110400.12841-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yicong Yang <yangyicong@hisilicon.com>

Per ACPI Spec 6.4 Table 5.129 for System Locality Latency and Bandwidth
Information Structure, "Base unit for bandwidth in megabytes per second
(MB/s)" rather than MiB/s. Since MiB and MB are different units[1], fix
this in the document.

[1] https://en.wikipedia.org/wiki/Byte#Multiple-byte_units
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 Documentation/admin-guide/mm/numaperf.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/numaperf.rst b/Documentation/admin-guide/mm/numaperf.rst
index 166697325947..37fd88dcbc0e 100644
--- a/Documentation/admin-guide/mm/numaperf.rst
+++ b/Documentation/admin-guide/mm/numaperf.rst
@@ -86,7 +86,7 @@ are exported are as follows::
 	|-- write_bandwidth
 	`-- write_latency
 
-The bandwidth attributes are provided in MiB/second.
+The bandwidth attributes are provided in MB/second.
 
 The latency attributes are provided in nanoseconds.
 
-- 
2.24.0

