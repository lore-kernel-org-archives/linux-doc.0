Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589FBC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 11:12:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiI3LMX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 07:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbiI3LL5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 07:11:57 -0400
X-Greylist: delayed 238 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 30 Sep 2022 03:48:45 PDT
Received: from 5.mo576.mail-out.ovh.net (5.mo576.mail-out.ovh.net [46.105.43.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E40C12086B
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 03:48:44 -0700 (PDT)
Received: from player157.ha.ovh.net (unknown [10.111.208.97])
        by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4AA7525A54
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 10:30:25 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player157.ha.ovh.net (Postfix) with ESMTPSA id DF3C02F3029FB;
        Fri, 30 Sep 2022 10:30:19 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R005521ff663-242f-4f98-9863-25dfeb034c48,
                    C05B2F2BD13FA39C9993548B485976379164E02D) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH v2 2/5] docs: sysctl/fs: remove references to dquot-max/-nr
Date:   Fri, 30 Sep 2022 12:29:34 +0200
Message-Id: <20220930102937.135841-3-steve@sk2.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220930102937.135841-1-steve@sk2.org>
References: <20220930102937.135841-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14213641902613759622
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehvddgvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepgefhhfeliefghfetieffleevfefhieduheektdeghfegvdelfffgjefgtdevieegnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrudehjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejie
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

dquot-max was removed in 2.4.10.5; dquot-nr was replaced with dqstats
in 2.5.18 which is now /proc/sys/fs/quota. Remove references to
dquot-max and dquot-nr in the sysctl documentation.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/admin-guide/sysctl/fs.rst | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/fs.rst b/Documentation/admin-guide/sysctl/fs.rst
index 54130ae33df8..0935acd220dc 100644
--- a/Documentation/admin-guide/sysctl/fs.rst
+++ b/Documentation/admin-guide/sysctl/fs.rst
@@ -29,8 +29,6 @@ Currently, these files are in /proc/sys/fs:
 - aio-max-nr
 - aio-nr
 - dentry-state
-- dquot-max
-- dquot-nr
 - file-max
 - file-nr
 - inode-nr
@@ -90,20 +88,6 @@ they help speeding up rejection of non-existing files provided
 by the users.
 
 
-dquot-max & dquot-nr
---------------------
-
-The file dquot-max shows the maximum number of cached disk
-quota entries.
-
-The file dquot-nr shows the number of allocated disk quota
-entries and the number of free disk quota entries.
-
-If the number of free cached disk quotas is very low and
-you have some awesome number of simultaneous system users,
-you might want to raise the limit.
-
-
 file-max & file-nr
 ------------------
 
-- 
2.31.1

