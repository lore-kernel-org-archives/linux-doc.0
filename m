Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A7BC43334
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jun 2022 16:58:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbiFXQ62 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Jun 2022 12:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbiFXQ6X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Jun 2022 12:58:23 -0400
X-Greylist: delayed 8397 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 24 Jun 2022 09:58:21 PDT
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net [46.105.63.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B5E311444
        for <linux-doc@vger.kernel.org>; Fri, 24 Jun 2022 09:58:20 -0700 (PDT)
Received: from player694.ha.ovh.net (unknown [10.110.103.180])
        by mo575.mail-out.ovh.net (Postfix) with ESMTP id 780A725F72
        for <linux-doc@vger.kernel.org>; Fri, 24 Jun 2022 11:03:02 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player694.ha.ovh.net (Postfix) with ESMTPSA id A079C2BDB6F28;
        Fri, 24 Jun 2022 11:02:58 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-106R0063cb03ecb-227a-4b1b-a9b4-809ab7d74b16,
                    3A36F777C3506A3F96EA03190DC1808DFCB0D32C) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     linux-kernel@vger.kernel.org
Cc:     Stephen Kitt <steve@sk2.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH] docs: admin-guide/sysctl: escape % symbols
Date:   Fri, 24 Jun 2022 13:02:30 +0200
Message-Id: <20220624110230.595740-1-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11089551134924441172
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledgfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepleegteeujeffjeefjeevhfdtudefjefgteelgedtudekleeiledvvdetudevjedtnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrieelgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhe
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

% symbols need to be escaped to render correctly here, do so.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/admin-guide/sysctl/kernel.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index ddccd1077462..079a51ed88a9 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -38,8 +38,8 @@ acct
 
 If BSD-style process accounting is enabled these values control
 its behaviour. If free space on filesystem where the log lives
-goes below ``lowwater``% accounting suspends. If free space gets
-above ``highwater``% accounting resumes. ``frequency`` determines
+goes below ``lowwater``\% accounting suspends. If free space gets
+above ``highwater``\% accounting resumes. ``frequency`` determines
 how often do we check the amount of free space (value is in
 seconds). Default:
 

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.30.2

