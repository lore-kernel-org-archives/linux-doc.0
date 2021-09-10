Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEAFC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 10 Sep 2021 16:51:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 203556103D
	for <linux-doc@archiver.kernel.org>; Fri, 10 Sep 2021 16:51:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbhIJQwV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Sep 2021 12:52:21 -0400
Received: from 3.mo179.mail-out.ovh.net ([178.33.251.175]:41576 "EHLO
        3.mo179.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229466AbhIJQwU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Sep 2021 12:52:20 -0400
X-Greylist: delayed 4200 seconds by postgrey-1.27 at vger.kernel.org; Fri, 10 Sep 2021 12:52:19 EDT
Received: from player758.ha.ovh.net (unknown [10.109.146.132])
        by mo179.mail-out.ovh.net (Postfix) with ESMTP id 7C2321AB87D
        for <linux-doc@vger.kernel.org>; Fri, 10 Sep 2021 12:51:54 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player758.ha.ovh.net (Postfix) with ESMTPSA id BA65621F68EE9;
        Fri, 10 Sep 2021 10:51:49 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-97G0024541a0f2-7580-44e4-9d72-f6fc93e3f470,
                    C73725976D6A61EA55E4E62C2A2E1C1EB10F42AA) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH] docs: block: fix discard_max_bytes references
Date:   Fri, 10 Sep 2021 12:51:42 +0200
Message-Id: <20210910105142.2116749-1-steve@sk2.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4092083213097797254
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeetgedugfelkeeikeetgeegteevfeeufeetuefgudeiiedthfehtdeffeekvdeffeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When discard_max_hw_bytes was introduced, in commit 0034af036554
("block: make /sys/block/<dev>/queue/discard_max_bytes writeable"),
the discard_max_bytes documentation section was renamed to
discard_max_hw_bytes, but the references it contains to
discard_max_bytes weren't updated.

This patch refers to discard_max_hw_bytes instead. It also reflows the
paragraph so that sentences end lines.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/block/queue-sysfs.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/block/queue-sysfs.rst b/Documentation/block/queue-sysfs.rst
index 4dc7f0d499a8..5fb4299cdb23 100644
--- a/Documentation/block/queue-sysfs.rst
+++ b/Documentation/block/queue-sysfs.rst
@@ -40,10 +40,11 @@ discard_max_hw_bytes (RO)
 -------------------------
 Devices that support discard functionality may have internal limits on
 the number of bytes that can be trimmed or unmapped in a single operation.
-The discard_max_bytes parameter is set by the device driver to the maximum
-number of bytes that can be discarded in a single operation. Discard
-requests issued to the device must not exceed this limit. A discard_max_bytes
-value of 0 means that the device does not support discard functionality.
+The `discard_max_hw_bytes` parameter is set by the device driver to the
+maximum number of bytes that can be discarded in a single operation.
+Discard requests issued to the device must not exceed this limit.
+A `discard_max_hw_bytes` value of 0 means that the device does not support
+discard functionality.
 
 discard_max_bytes (RW)
 ----------------------

base-commit: 7c60610d476766e128cc4284bb6349732cbd6606
-- 
2.27.0

