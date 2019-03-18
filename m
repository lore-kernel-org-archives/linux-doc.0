Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 50DD77D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 18:10:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfCRSKe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 14:10:34 -0400
Received: from 15.mo6.mail-out.ovh.net ([188.165.39.161]:51425 "EHLO
        15.mo6.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbfCRSKe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 14:10:34 -0400
X-Greylist: delayed 1801 seconds by postgrey-1.27 at vger.kernel.org; Mon, 18 Mar 2019 14:10:33 EDT
Received: from player718.ha.ovh.net (unknown [10.109.159.222])
        by mo6.mail-out.ovh.net (Postfix) with ESMTP id E4C8F1B7DB8
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2019 18:34:29 +0100 (CET)
Received: from jwilk.net (ip-5-172-255-60.free.aero2.net.pl [5.172.255.60])
        (Authenticated sender: jwilk@jwilk.net)
        by player718.ha.ovh.net (Postfix) with ESMTPSA id 7921D3B97E77;
        Mon, 18 Mar 2019 17:34:25 +0000 (UTC)
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH] Documentation: fix core_pattern max length
Date:   Mon, 18 Mar 2019 18:34:21 +0100
Message-Id: <20190318173421.502-1-jwilk@jwilk.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15466768496930248581
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedutddriedugddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The buffer size for core_pattern is 128, but one character is used for
terminating null byte, so the actual limit is 127:

    # printf '%0999d' > /proc/sys/kernel/core_pattern
    # tr -d '\n' < /proc/sys/kernel/core_pattern | wc -c
    127

Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
---
 Documentation/sysctl/kernel.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sysctl/kernel.txt b/Documentation/sysctl/kernel.txt
index aa058aa7bf28..f0c86fbb3b48 100644
--- a/Documentation/sysctl/kernel.txt
+++ b/Documentation/sysctl/kernel.txt
@@ -196,7 +196,7 @@ CAP_LAST_CAP from the kernel.
 core_pattern:
 
 core_pattern is used to specify a core dumpfile pattern name.
-. max length 128 characters; default value is "core"
+. max length 127 characters; default value is "core"
 . core_pattern is used as a pattern template for the output filename;
   certain string patterns (beginning with '%') are substituted with
   their actual values.
-- 
2.20.1

