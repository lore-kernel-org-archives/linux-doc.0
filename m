Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9ECC48BE5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 02:33:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 570E6613E1
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 02:33:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhFQCfl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Jun 2021 22:35:41 -0400
Received: from lucky1.263xmail.com ([211.157.147.134]:43438 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbhFQCfl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jun 2021 22:35:41 -0400
Received: from localhost (unknown [192.168.167.105])
        by lucky1.263xmail.com (Postfix) with ESMTP id E8D19C87A5;
        Thu, 17 Jun 2021 10:33:22 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [113.57.152.160])
        by smtp.263.net (postfix) whith ESMTP id P9068T139827605395200S1623897196740809_;
        Thu, 17 Jun 2021 10:33:22 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <56b5f0e3be2d9e5653f0edf291cf6d93>
X-RL-SENDER: chenhaoa@uniontech.com
X-SENDER: chenhaoa@uniontech.com
X-LOGIN-NAME: chenhaoa@uniontech.com
X-FST-TO: corbet@lwn.net
X-RCPT-COUNT: 4
X-SENDER-IP: 113.57.152.160
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Hao Chen <chenhaoa@uniontech.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hao Chen <chenhaoa@uniontech.com>
Subject: [PATCH] Documentation: ACPI: fix error script name
Date:   Thu, 17 Jun 2021 10:33:00 +0800
Message-Id: <20210617023300.30114-1-chenhaoa@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The correct script name should be 'divergence.sh' instead of
'divergences.sh'.
I didn't find divergences.sh in the path of acpica/generate/linux/.

Signed-off-by: Hao Chen <chenhaoa@uniontech.com>
---
 Documentation/driver-api/acpi/linuxized-acpica.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/acpi/linuxized-acpica.rst b/Documentation/driver-api/acpi/linuxized-acpica.rst
index 6bee03383225..cc234353d2c4 100644
--- a/Documentation/driver-api/acpi/linuxized-acpica.rst
+++ b/Documentation/driver-api/acpi/linuxized-acpica.rst
@@ -276,4 +276,4 @@ before they become available from the ACPICA release process.
    # git clone https://github.com/acpica/acpica
    # git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
    # cd acpica
-   # generate/linux/divergences.sh -s ../linux
+   # generate/linux/divergence.sh -s ../linux
-- 
2.20.1



