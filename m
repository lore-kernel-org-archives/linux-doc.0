Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3805C7EE31
	for <linux-doc@archiver.kernel.org>; Tue, 28 Feb 2023 13:47:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjB1Nr3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Feb 2023 08:47:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjB1Nr1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Feb 2023 08:47:27 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F82303F8
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 05:47:06 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pX0Js-00078D-1g; Tue, 28 Feb 2023 14:47:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pX0Jq-000sbi-9k; Tue, 28 Feb 2023 14:47:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pX0Jp-0011YR-Ol; Tue, 28 Feb 2023 14:47:01 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     David Rientjes <rientjes@google.com>, linux-doc@vger.kernel.org,
        kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: [PATCH] docs: rebasing-and-merging: Drop wrong statement about git
Date:   Tue, 28 Feb 2023 14:46:57 +0100
Message-Id: <20230228134657.1797871-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=W+LzTZqD9krsBHs0O9kqMZGsJXeqil7l+zq6IhqpL50=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj/gXObxEa3BXYuKgd+EaD/nFoZP0YE3NGk+5UC QPqqoMUItCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/4FzgAKCRDB/BR4rcrs CX5eCACPj98s54mer6YkzbydTLGj0LBoremKZFgCoSwWmRc0xicCaezqcgIgIPYktNqwUbdJYdD 4R1cdZ96vHeZHmN/Plz80ry4XJi33pJBs6RpGfN3g6sQLOBV+I4ciuHwxUW6DfhTTAhT/fGY5nx xlKSKxLM2JvOo3cA77S7aRska4Lk2ClXFpjcf37VTa+XtlNZM0eYsMWEeEjon9Nk5PGoK8wkaRB dEl6MeJQA+sSbsTV/QPcXmQ7XcTc1FyAzRlrWngR5yoBqEvxwqEswDTdeNbE5a13EISQNBER9YA pUq+f6x/nEiLBPf5xs3BU6vOCbCbRX22Vp8Zbs5w0vNR4Nic
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Uwe Kleine-König <uwe@kleine-koenig.org>

The "^0" doesn't have the described effect to only do fast-forward merges.
For example

	git checkout 055efab3120b
	git merge v5.2-rc1^0

creates a normal merge commit. In fact "v5.2-rc1^0" only refers to the
commit the tag v5.2-rc1 points to.

Fixes: d95ea1a4e1fb ("docs: Add a document on repository management")
Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 Documentation/maintainer/rebasing-and-merging.rst | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/maintainer/rebasing-and-merging.rst b/Documentation/maintainer/rebasing-and-merging.rst
index 09f988e7fa71..85800ce95ae5 100644
--- a/Documentation/maintainer/rebasing-and-merging.rst
+++ b/Documentation/maintainer/rebasing-and-merging.rst
@@ -213,11 +213,7 @@ point rather than some random spot.  If your upstream-bound branch has
 emptied entirely into the mainline during the merge window, you can pull it
 forward with a command like::
 
-  git merge v5.2-rc1^0
-
-The "^0" will cause Git to do a fast-forward merge (which should be
-possible in this situation), thus avoiding the addition of a spurious merge
-commit.
+  git merge --ff-only v5.2-rc1
 
 The guidelines laid out above are just that: guidelines.  There will always
 be situations that call out for a different solution, and these guidelines
-- 
2.39.1

