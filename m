Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C67C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 11:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbiI3LP6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 07:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbiI3LPf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 07:15:35 -0400
X-Greylist: delayed 855 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 30 Sep 2022 03:57:06 PDT
Received: from 3.mo582.mail-out.ovh.net (3.mo582.mail-out.ovh.net [178.33.253.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A741E43E4F
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 03:57:06 -0700 (PDT)
Received: from player157.ha.ovh.net (unknown [10.111.208.192])
        by mo582.mail-out.ovh.net (Postfix) with ESMTP id 511FD260EA
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 10:30:36 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player157.ha.ovh.net (Postfix) with ESMTPSA id B1D552F302B0F;
        Fri, 30 Sep 2022 10:30:30 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R00594ba2c5b-ef7f-4e63-baff-7f9c4463ac6a,
                    C05B2F2BD13FA39C9993548B485976379164E02D) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH v2 4/5] docs: sysctl/fs: remove references to super-max/-nr
Date:   Fri, 30 Sep 2022 12:29:36 +0200
Message-Id: <20220930102937.135841-5-steve@sk2.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220930102937.135841-1-steve@sk2.org>
References: <20220930102937.135841-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14216738124900632198
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehvddgvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepgefhhfeliefghfetieffleevfefhieduheektdeghfegvdelfffgjefgtdevieegnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrudehjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekvd
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

These were removed in 2.4.7.8. Remove references to super-max and
super-nr in the sysctl documentation.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/admin-guide/sysctl/fs.rst | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/fs.rst b/Documentation/admin-guide/sysctl/fs.rst
index a61c6aec5e5e..df683c15b098 100644
--- a/Documentation/admin-guide/sysctl/fs.rst
+++ b/Documentation/admin-guide/sysctl/fs.rst
@@ -277,16 +277,6 @@ or otherwise protected/tainted binaries. The modes are
 =   ==========  ===============================================================
 
 
-super-max & super-nr
---------------------
-
-These numbers control the maximum number of superblocks, and
-thus the maximum number of mounted filesystems the kernel
-can have. You only need to increase super-max if you need to
-mount more filesystems than the current value in super-max
-allows you to.
-
-
 mount-max
 ---------
 
-- 
2.31.1

