Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5F4C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 19 Oct 2021 08:04:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7DD86112D
	for <linux-doc@archiver.kernel.org>; Tue, 19 Oct 2021 08:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234847AbhJSIGw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Oct 2021 04:06:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:36524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234765AbhJSIGo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 19 Oct 2021 04:06:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0666561374;
        Tue, 19 Oct 2021 08:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634630672;
        bh=1UFOQgOaULkfVbtjf3Q9bNP0kiveXI1568CgRDJ3hLA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DfIqpmyd5Yd/NkVjQMqs+oKbO9CbCRsBzWGXUKNNqkJJoPHQzDbey2ysAeMc0FuPc
         CqnDmBrCTuGLHP4UxK1KjalkW3T+Qy/Yd60Al11jy1eTrq5XuoDW8y1yKC7mfPzUmL
         Aihd7hAztMrdUlQCbWzB9b6pPnazgAfaTVR96babWfpSwKKGeEPZLm7OUWO257FR9Y
         i+MKHTy5MfPeBV6bSH//TIg7KJQE4kG9yEeLIwIT9T5NwLRFCLHEsgOClj/nIGDsbJ
         +yzhK2dR1tzunmjsDSq/Mu5WWonCBgqBBPwjsR1avatzN3g8gwc3jM1ORJBCM/HKgC
         y0rzLt51mCW8g==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mck6j-001oIr-0Y; Tue, 19 Oct 2021 09:04:25 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        David Kershner <david.kershner@unisys.com>,
        linux-kernel@vger.kernel.org, sparmaintainer@unisys.com
Subject: [PATCH v3 01/23] visorbus: fix a copyright symbol that was bad encoded
Date:   Tue, 19 Oct 2021 09:04:00 +0100
Message-Id: <d6ff7f895ce9fc4284becfed16dddb3563e4d715.1634630485.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634630485.git.mchehab+huawei@kernel.org>
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The copyright symbol was badly encoded using the
REPLACEMENT CHARACTER U+fffd ('�'), probably due to some
bad charset conversion.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/23] at: https://lore.kernel.org/all/cover.1634630485.git.mchehab+huawei@kernel.org/

 drivers/visorbus/visorbus_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/visorbus/visorbus_main.c b/drivers/visorbus/visorbus_main.c
index 152fd29f04f2..0aa4cff670dc 100644
--- a/drivers/visorbus/visorbus_main.c
+++ b/drivers/visorbus/visorbus_main.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright � 2010 - 2015 UNISYS CORPORATION
+ * Copyright © 2010 - 2015 UNISYS CORPORATION
  * All rights reserved.
  */
 
-- 
2.31.1

