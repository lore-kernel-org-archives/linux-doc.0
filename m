Return-Path: <SRS0=FLyy=7Q=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6244C433DF
	for <linux-doc@archiver.kernel.org>; Wed,  3 Jun 2020 22:14:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7938205CB
	for <linux-doc@archiver.kernel.org>; Wed,  3 Jun 2020 22:14:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgFCWOI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Jun 2020 18:14:08 -0400
Received: from ms.lwn.net ([45.79.88.28]:51760 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726354AbgFCWOI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 3 Jun 2020 18:14:08 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 26B0F37C;
        Wed,  3 Jun 2020 22:14:08 +0000 (UTC)
Date:   Wed, 3 Jun 2020 16:14:07 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] docs: Update the location of the LF NDA program
Message-ID: <20200603161407.0ec41084@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The link to the Linux Foundation NDA program got broken in one of their
web-site thrashups; now that the information is back online, point to its
current location.  This should last until the next thrashup...

Cc: stable@vger.kernel.org
Reported-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/process/3.Early-stage.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/3.Early-stage.rst b/Documentation/process/3.Early-stage.rst
index be00716071d4..7067abbd75bc 100644
--- a/Documentation/process/3.Early-stage.rst
+++ b/Documentation/process/3.Early-stage.rst
@@ -216,7 +216,7 @@ a non-disclosure agreement.  The Linux Foundation operates an NDA program
 designed to help with this sort of situation; more information can be found
 at:
 
-    http://www.linuxfoundation.org/en/NDA_program
+    https://www.linuxfoundation.org/nda/
 
 This kind of review is often enough to avoid serious problems later on
 without requiring public disclosure of the project.
-- 
2.26.2

