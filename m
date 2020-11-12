Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7741CC388F7
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 22:35:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 255962085B
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 22:35:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbgKLWfo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Nov 2020 17:35:44 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7225 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbgKLWfo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Nov 2020 17:35:44 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CXGdX54wKzkgtb;
        Fri, 13 Nov 2020 06:35:28 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.203.95) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Fri, 13 Nov 2020 06:35:33 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <linuxarm@huawei.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Mel Gorman" <mgorman@suse.de>, Adrian Freund <adrian@freund.io>,
        Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH v2 2/2] Documentation: scheduler: ask users to set sched_debug cmdline
Date:   Fri, 13 Nov 2020 11:31:29 +1300
Message-ID: <20201112223129.26580-2-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20201112223129.26580-1-song.bao.hua@hisilicon.com>
References: <20201112223129.26580-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.126.203.95]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Valentin Schneider <valentin.schneider@arm.com>

To print the schedule debug information, users need to set sched_debug
cmdline or enable it by sysfs entry.

Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Adrian Freund <adrian@freund.io>
Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 Documentation/scheduler/sched-domains.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/scheduler/sched-domains.rst b/Documentation/scheduler/sched-domains.rst
index 55983b7e1098..8582fa5e9170 100644
--- a/Documentation/scheduler/sched-domains.rst
+++ b/Documentation/scheduler/sched-domains.rst
@@ -74,6 +74,8 @@ for a given topology level by creating a sched_domain_topology_level array and
 calling set_sched_topology() with this array as the parameter.
 
 The sched-domains debugging infrastructure can be enabled by enabling
-CONFIG_SCHED_DEBUG. This enables an error checking parse of the sched domains
-which should catch most possible errors (described above). It also prints out
-the domain structure in a visual format.
+CONFIG_SCHED_DEBUG and adding 'sched_debug' to your cmdline. If you forgot to
+tweak your cmdline, you can also flip the /sys/kernel/debug/sched_debug
+knob. This enables an error checking parse of the sched domains which should
+catch most possible errors (described above). It also prints out the domain
+structure in a visual format.
-- 
2.25.1

