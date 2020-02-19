Return-Path: <SRS0=7zml=4H=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C53DC34056
	for <linux-doc@archiver.kernel.org>; Wed, 19 Feb 2020 19:21:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68E51208E4
	for <linux-doc@archiver.kernel.org>; Wed, 19 Feb 2020 19:21:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgBSTVq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Feb 2020 14:21:46 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:44217 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgBSTVq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Feb 2020 14:21:46 -0500
Received: from 2.general.alexhung.us.vpn ([10.172.65.255] helo=canonical.com)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <alex.hung@canonical.com>)
        id 1j4Uuf-0004eL-24; Wed, 19 Feb 2020 19:21:37 +0000
From:   Alex Hung <alex.hung@canonical.com>
To:     corbet@lwn.net, tglx@linutronix.de, mchehab+samsung@kernel.org,
        akpm@linux-foundation.org, pawan.kumar.gupta@linux.intel.com,
        jgross@suse.com, linux-doc@vger.kernel.org, alex.hung@canonical.com
Subject: [PATCH] Documentation: fix a typo for intel_iommu=nobounce
Date:   Wed, 19 Feb 2020 12:21:33 -0700
Message-Id: <20200219192133.7375-1-alex.hung@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"untrusted" was mis-spelled as "unstrusted"

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index dbc22d684627..c8b7ec949453 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1775,7 +1775,7 @@
 			provided by tboot because it makes the system
 			vulnerable to DMA attacks.
 		nobounce [Default off]
-			Disable bounce buffer for unstrusted devices such as
+			Disable bounce buffer for untrusted devices such as
 			the Thunderbolt devices. This will treat the untrusted
 			devices as the trusted ones, hence might expose security
 			risks of DMA attacks.
-- 
2.17.1

