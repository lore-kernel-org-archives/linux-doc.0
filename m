Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C578C433ED
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 16:40:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6080A60FDC
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 16:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233704AbhCaQkX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 Mar 2021 12:40:23 -0400
Received: from iodev.co.uk ([46.30.189.100]:49624 "EHLO iodev.co.uk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233831AbhCaQkE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 31 Mar 2021 12:40:04 -0400
X-Greylist: delayed 369 seconds by postgrey-1.27 at vger.kernel.org; Wed, 31 Mar 2021 12:40:04 EDT
Received: from localhost (121.130.77.188.dynamic.jazztel.es [188.77.130.121])
        by iodev.co.uk (Postfix) with ESMTPSA id E7A65286FD;
        Wed, 31 Mar 2021 18:33:53 +0200 (CEST)
From:   Ismael Luceno <ismael@iodev.co.uk>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ismael Luceno <ismael@iodev.co.uk>
Subject: [PATCH] docs: reporting-issues: Remove reference to oldnoconfig
Date:   Wed, 31 Mar 2021 18:35:41 +0200
Message-Id: <20210331163541.28356-1-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Replace it with olddefconfig. oldnoconfig didn't do what the document
suggests (it aliased to olddefconfig), and isn't available since 4.19.

Ref: 04c459d20448 ("kconfig: remove oldnoconfig target")
Ref: 312ee68752fa ("kconfig: announce removal of oldnoconfig if used")
Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 Documentation/admin-guide/reporting-issues.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
index 07879d01fe68..ffa0d4c6e450 100644
--- a/Documentation/admin-guide/reporting-issues.rst
+++ b/Documentation/admin-guide/reporting-issues.rst
@@ -1000,8 +1000,7 @@ In the whole process keep in mind: an issue only qualifies as regression if the
 older and the newer kernel got built with a similar configuration. The best way
 to archive this: copy the configuration file (``.config``) from the old working
 kernel freshly to each newer kernel version you try. Afterwards run ``make
-oldnoconfig`` to adjust it for the needs of the new version without enabling
-any new feature, as those are allowed to cause regressions.
+olddefconfig`` to adjust it for the needs of the new version.
 
 
 Write and send the report
-- 
2.31.1

