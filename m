Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CDEC433B4
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 06:41:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D14C1611AB
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 06:41:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbhEUGmy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 May 2021 02:42:54 -0400
Received: from pv50p00im-zteg10021301.me.com ([17.58.6.46]:47989 "EHLO
        pv50p00im-zteg10021301.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233803AbhEUGlG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 May 2021 02:41:06 -0400
X-Greylist: delayed 567 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 May 2021 02:41:05 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
        t=1621578612; bh=ijrrd1iygdnMU8418bjwvXBWmuo7RcD5tMemLIdYEik=;
        h=From:To:Subject:Date:Message-Id;
        b=pYxUo2oSXRdKdagbUlZARfSrHJhgCdua6Yl22BxBFhHoOvB5aGkfC+mksOhRORVvf
         gATpiTo3qjinncCBdGQv/IMDRczaBRzKRaAtUBpLQT7vig++s4Dnn2cLwqp1+6M7PT
         7MQc8haoBAdINzoj5krvvZJAGaXDq2Pvf4194BLg1PlP1RBg2NjlNX7k1CergFAPbc
         CmsAZ3fp8w4GKDbaBaCSU1nMcwWD/ataOG+vDGoLqGpDpz5KFYD0z8r8j/UQ71B9lq
         /utZlTwhsW08yOBZfGNK4ILZ6gd80OOyZuRR4hw+NEovOJt7YBpTEqDLbMkYJ7VmTS
         DCwsKLbfak1UA==
Received: from pek-xsong2-d1.wrs.com (unknown [60.247.85.82])
        by pv50p00im-zteg10021301.me.com (Postfix) with ESMTPSA id A27B5CC01BC;
        Fri, 21 May 2021 06:30:09 +0000 (UTC)
From:   Xiongwei Song <sxwjean@me.com>
To:     peterz@infradead.org, mingo@redhat.com, will@kernel.org,
        longman@redhat.com, boqun.feng@gmail.com, corbet@lwn.net
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Xiongwei Song <sxwjean@gmail.com>
Subject: [PATCH] docs: lockdep-design: correct the notation for writer
Date:   Fri, 21 May 2021 14:29:54 +0800
Message-Id: <1621578594-13237-1-git-send-email-sxwjean@me.com>
X-Mailer: git-send-email 2.7.4
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-21_03:2021-05-20,2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=903 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2105210043
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Xiongwei Song <sxwjean@gmail.com>

The block condition matrix is using 'E' as the writer noation here, so it
would be better to use 'E' as the reminder rather than 'W'.

Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
---
 Documentation/locking/lockdep-design.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/locking/lockdep-design.rst b/Documentation/locking/lockdep-design.rst
index 9f3cfca..c3b923a 100644
--- a/Documentation/locking/lockdep-design.rst
+++ b/Documentation/locking/lockdep-design.rst
@@ -462,7 +462,7 @@ Block condition matrix, Y means the row blocks the column, and N means otherwise
 	| R | Y | Y | N |
 	+---+---+---+---+
 
-	(W: writers, r: non-recursive readers, R: recursive readers)
+	(E: writers, r: non-recursive readers, R: recursive readers)
 
 
 acquired recursively. Unlike non-recursive read locks, recursive read locks
-- 
2.7.4

