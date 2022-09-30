Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97809C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 11:14:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbiI3LOj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 07:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiI3LOW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 07:14:22 -0400
X-Greylist: delayed 849 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 30 Sep 2022 03:53:37 PDT
Received: from 10.mo576.mail-out.ovh.net (10.mo576.mail-out.ovh.net [46.105.73.241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A010BF1CD
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 03:53:37 -0700 (PDT)
Received: from player157.ha.ovh.net (unknown [10.109.156.194])
        by mo576.mail-out.ovh.net (Postfix) with ESMTP id B38712599E
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 10:30:30 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player157.ha.ovh.net (Postfix) with ESMTPSA id 369B12F302A5B;
        Fri, 30 Sep 2022 10:30:25 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R0059c517d12-c4be-4b6b-be74-f1dd7bd7a4d1,
                    C05B2F2BD13FA39C9993548B485976379164E02D) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH v2 3/5] docs: sysctl/fs: merge the aio sections
Date:   Fri, 30 Sep 2022 12:29:35 +0200
Message-Id: <20220930102937.135841-4-steve@sk2.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220930102937.135841-1-steve@sk2.org>
References: <20220930102937.135841-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14215049276007745158
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehvddgvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepgefhhfeliefghfetieffleevfefhieduheektdeghfegvdelfffgjefgtdevieegnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrudehjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejie
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are two sections documenting aio-nr and aio-max-nr, merge them.
I kept the second explanation of aio-nr, which seems clearer to me,
along with the effects of the values from the first section.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/admin-guide/sysctl/fs.rst | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/fs.rst b/Documentation/admin-guide/sysctl/fs.rst
index 0935acd220dc..a61c6aec5e5e 100644
--- a/Documentation/admin-guide/sysctl/fs.rst
+++ b/Documentation/admin-guide/sysctl/fs.rst
@@ -50,11 +50,11 @@ Currently, these files are in /proc/sys/fs:
 aio-nr & aio-max-nr
 -------------------
 
-aio-nr is the running total of the number of events specified on the
-io_setup system call for all currently active aio contexts.  If aio-nr
-reaches aio-max-nr then io_setup will fail with EAGAIN.  Note that
-raising aio-max-nr does not result in the pre-allocation or re-sizing
-of any kernel data structures.
+aio-nr shows the current system-wide number of asynchronous io
+requests.  aio-max-nr allows you to change the maximum value
+aio-nr can grow to.  If aio-nr reaches aio-nr-max then io_setup will
+fail with EAGAIN.  Note that raising aio-max-nr does not result in the
+pre-allocation or re-sizing of any kernel data structures.
 
 
 dentry-state
@@ -287,14 +287,6 @@ mount more filesystems than the current value in super-max
 allows you to.
 
 
-aio-nr & aio-max-nr
--------------------
-
-aio-nr shows the current system-wide number of asynchronous io
-requests.  aio-max-nr allows you to change the maximum value
-aio-nr can grow to.
-
-
 mount-max
 ---------
 
-- 
2.31.1

