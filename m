Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2428C6FD1C
	for <linux-doc@archiver.kernel.org>; Wed, 22 Mar 2023 23:12:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjCVXMU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Mar 2023 19:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjCVXMT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Mar 2023 19:12:19 -0400
X-Greylist: delayed 3601 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 22 Mar 2023 16:12:17 PDT
Received: from 8.mo548.mail-out.ovh.net (8.mo548.mail-out.ovh.net [46.105.45.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1784C10247
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 16:12:16 -0700 (PDT)
Received: from mxplan6.mail.ovh.net (unknown [10.108.20.7])
        by mo548.mail-out.ovh.net (Postfix) with ESMTPS id EE9A8202C3;
        Wed, 22 Mar 2023 21:53:13 +0000 (UTC)
Received: from jwilk.net (37.59.142.106) by DAG4EX1.mxp6.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 22 Mar
 2023 22:53:12 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-106R006f6024961-d43b-433f-ac60-913a5e3d2475,
                    65661AC9A5D673C6099EB45C0BA3B174173FF86C) smtp.auth=jwilk@jwilk.net
X-OVh-ClientIp: 5.172.255.55
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Jonathan Corbet <corbet@lwn.net>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-doc@vger.kernel.org>
Subject: [PATCH] coding-style: fix title of Greg K-H's talk
Date:   Wed, 22 Mar 2023 22:53:11 +0100
Message-ID: <20230322215311.6579-1-jwilk@jwilk.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX1.mxp6.local (172.16.2.51) To DAG4EX1.mxp6.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9df3da02-f192-4f6f-8361-a235e6131127
X-Ovh-Tracer-Id: 8703487756989487072
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegvddgudehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgtghisehtkeertdertddtnecuhfhrohhmpeflrghkuhgsucghihhlkhcuoehjfihilhhksehjfihilhhkrdhnvghtqeenucggtffrrghtthgvrhhnpeelveeludehleefudetgeehkeelheekudeifeethfelveevgefgleeludduieetheenucffohhmrghinhepghhnuhdrohhrghdpohhpvghnqdhsthgurdhorhhgpdhkrhhorghhrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhifihhlkhesjhifihhlkhdrnhgvtheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhmtghhvghhrggssehkvghrnhgvlhdrohhrghdplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The talk title was inadvertently mangled in 8c27ceff3604 ("docs: fix
locations of several documents that got moved").

Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
---
 Documentation/process/coding-style.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 007e49ef6cec..6db37a46d305 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -1267,5 +1267,5 @@ gcc internals and indent, all available from https://www.gnu.org/manual/
 WG14 is the international standardization working group for the programming
 language C, URL: http://www.open-std.org/JTC1/SC22/WG14/
 
-Kernel :ref:`process/coding-style.rst <codingstyle>`, by greg@kroah.com at OLS 2002:
+Kernel CodingStyle, by greg@kroah.com at OLS 2002:
 http://www.kroah.com/linux/talks/ols_2002_kernel_codingstyle_talk/html/
-- 
2.40.0

