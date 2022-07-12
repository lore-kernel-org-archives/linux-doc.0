Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F10C43334
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jul 2022 18:05:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbiGLSFB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Jul 2022 14:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiGLSFA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Jul 2022 14:05:00 -0400
X-Greylist: delayed 2261 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 12 Jul 2022 11:04:59 PDT
Received: from 2.mo560.mail-out.ovh.net (2.mo560.mail-out.ovh.net [188.165.53.149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F858A9E7B
        for <linux-doc@vger.kernel.org>; Tue, 12 Jul 2022 11:04:59 -0700 (PDT)
Received: from player770.ha.ovh.net (unknown [10.109.138.54])
        by mo560.mail-out.ovh.net (Postfix) with ESMTP id 17ED6238E2
        for <linux-doc@vger.kernel.org>; Tue, 12 Jul 2022 17:27:16 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player770.ha.ovh.net (Postfix) with ESMTPSA id 8CCDA2C9AB1D9;
        Tue, 12 Jul 2022 17:27:11 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-110S0044d4bc56b-d2ff-4311-87c4-7cb1bb377c48,
                    95116E16C79F3EB4FFDADE9184C2BF5B79F623F3) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Kitt <steve@sk2.org>
Subject: [PATCH 2/5] docs: sysctl: remove references to dquot-max/-nr
Date:   Tue, 12 Jul 2022 19:26:16 +0200
Message-Id: <20220712172619.359052-2-steve@sk2.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220712172619.359052-1-steve@sk2.org>
References: <20220712172619.359052-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12606419786049422982
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeeghffhleeigffhteeiffelveefhfeiudehkedtgefhgedvleffgfejgfdtveeigeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejjedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedt
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

