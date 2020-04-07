Return-Path: <SRS0=OmAX=5X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C561C2BB54
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 13:14:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0CB9420719
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 13:14:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728866AbgDGNOF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Apr 2020 09:14:05 -0400
Received: from freundtech.com ([78.47.86.165]:48150 "EHLO freundtech.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728152AbgDGNOE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 7 Apr 2020 09:14:04 -0400
X-Greylist: delayed 514 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Apr 2020 09:14:03 EDT
Received: from arch-desktop.local (unknown [IPv6:2a02:8071:2bb9:5f00::120])
        by freundtech.com (Postfix) with ESMTPSA id 7D0621E0347;
        Tue,  7 Apr 2020 15:05:27 +0200 (CEST)
From:   Adrian Freund <adrian@freund.io>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, peterz@infradead.org,
        Adrian Freund <adrian@freund.io>
Subject: [PATCH] Documentation: scheduler: fix outdated information on sched groups
Date:   Tue,  7 Apr 2020 15:05:25 +0200
Message-Id: <20200407130525.76663-1-adrian@freund.io>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The documentation claims that two sched groups must not overlap. This is
no longer true, as overlapping sched groups are used on NUMA systems.
This change has been introduced by commit e3589f6c81e47 and was
documented by an in-code comment in commit 35a566e6e8a18.

Signed-off-by: Adrian Freund <adrian@freund.io>
---
 Documentation/scheduler/sched-domains.rst | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/scheduler/sched-domains.rst b/Documentation/scheduler/sched-domains.rst
index f7504226f445..5c4b7f4f0062 100644
--- a/Documentation/scheduler/sched-domains.rst
+++ b/Documentation/scheduler/sched-domains.rst
@@ -19,10 +19,12 @@ CPUs".
 Each scheduling domain must have one or more CPU groups (struct sched_group)
 which are organised as a circular one way linked list from the ->groups
 pointer. The union of cpumasks of these groups MUST be the same as the
-domain's span. The intersection of cpumasks from any two of these groups
-MUST be the empty set. The group pointed to by the ->groups pointer MUST
-contain the CPU to which the domain belongs. Groups may be shared among
-CPUs as they contain read only data after they have been set up.
+domain's span. The group pointed to by the ->groups pointer MUST contain the CPU
+to which the domain belongs. Groups may be shared among CPUs as they contain
+read only data after they have been set up. The intersection of cpumasks from
+any two of these groups may be non empty. If this is the case the SD_OVERLAP
+flag is set on the corresponding scheduling domain and its groups may not be
+shared between CPUs.
 
 Balancing within a sched domain occurs between groups. That is, each group
 is treated as one entity. The load of a group is defined as the sum of the
-- 
2.26.0

