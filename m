Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AE5CCA47F
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jul 2022 19:55:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbiGLTzF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Jul 2022 15:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235485AbiGLTyu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Jul 2022 15:54:50 -0400
X-Greylist: delayed 8811 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 12 Jul 2022 12:54:13 PDT
Received: from 19.mo550.mail-out.ovh.net (19.mo550.mail-out.ovh.net [178.32.97.206])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0071157
        for <linux-doc@vger.kernel.org>; Tue, 12 Jul 2022 12:54:13 -0700 (PDT)
Received: from player770.ha.ovh.net (unknown [10.110.171.238])
        by mo550.mail-out.ovh.net (Postfix) with ESMTP id ED05C23ACD
        for <linux-doc@vger.kernel.org>; Tue, 12 Jul 2022 17:27:20 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player770.ha.ovh.net (Postfix) with ESMTPSA id 218C52C9AB208;
        Tue, 12 Jul 2022 17:27:16 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-110S004f2f464b7-596f-4274-afa8-c24faf8a9d25,
                    95116E16C79F3EB4FFDADE9184C2BF5B79F623F3) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Kitt <steve@sk2.org>
Subject: [PATCH 3/5] docs: sysctl/fs: merge the aio sections
Date:   Tue, 12 Jul 2022 19:26:17 +0200
Message-Id: <20220712172619.359052-3-steve@sk2.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220712172619.359052-1-steve@sk2.org>
References: <20220712172619.359052-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12607827160521213574
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeeghffhleeigffhteeiffelveefhfeiudehkedtgefhgedvleffgfejgfdtveeigeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejjedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehhedt
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

