Return-Path: <SRS0=/07d=4B=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C219C2BA83
	for <linux-doc@archiver.kernel.org>; Thu, 13 Feb 2020 18:24:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36F9E21734
	for <linux-doc@archiver.kernel.org>; Thu, 13 Feb 2020 18:24:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgBMSYa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Feb 2020 13:24:30 -0500
Received: from 4.mo2.mail-out.ovh.net ([87.98.172.75]:60010 "EHLO
        4.mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727433AbgBMSYa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Feb 2020 13:24:30 -0500
X-Greylist: delayed 1199 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Feb 2020 13:24:29 EST
Received: from player715.ha.ovh.net (unknown [10.108.42.145])
        by mo2.mail-out.ovh.net (Postfix) with ESMTP id 701A31C98CC
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2020 18:49:02 +0100 (CET)
Received: from sk2.org (cre33-1_migr-88-122-126-116.fbx.proxad.net [88.122.126.116])
        (Authenticated sender: steve@sk2.org)
        by player715.ha.ovh.net (Postfix) with ESMTPSA id C2AC5F2A6755;
        Thu, 13 Feb 2020 17:48:56 +0000 (UTC)
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH 5/6] docs: document stop-a in sysctl/kernel.rst
Date:   Thu, 13 Feb 2020 18:47:00 +0100
Message-Id: <20200213174701.3200366-6-steve@sk2.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213174701.3200366-1-steve@sk2.org>
References: <20200213174701.3200366-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10092003815294455173
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrieekgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucfkpheptddrtddrtddrtddpkeekrdduvddvrdduvdeirdduudeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This describes the SPARC-specific stop-a sysctl entry, which was
previously listed in kernel.rst but not documented.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/admin-guide/sysctl/kernel.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 29a712e24610..a792345ac6db 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1072,6 +1072,16 @@ compilation sees a 1% slowdown, other systems and workloads may vary.
 stop-a (SPARC only)
 ===================
 
+Controls Stop-A:
+
+= ====================================
+0 Stop-A has no effect.
+1 Stop-A breaks to the PROM (default).
+= ====================================
+
+Stop-A is always enabled on a panic, so that the user can return to
+the boot PROM.
+
 
 sysrq
 =====
-- 
2.24.1

