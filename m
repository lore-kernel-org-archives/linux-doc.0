Return-Path: <SRS0=i7Ry=4J=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159BEC11D00
	for <linux-doc@archiver.kernel.org>; Fri, 21 Feb 2020 00:48:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D20AA208CD
	for <linux-doc@archiver.kernel.org>; Fri, 21 Feb 2020 00:48:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="QJihoD3r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729419AbgBUAsz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Feb 2020 19:48:55 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:46453 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729365AbgBUAsz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 Feb 2020 19:48:55 -0500
Received: by ozlabs.org (Postfix, from userid 1034)
        id 48NtBF05Wbz9sRl; Fri, 21 Feb 2020 11:48:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1582246133;
        bh=qnBDIU3ClKj8LI+H5LWYwrMiiSASHJw9umw0hGd2zjY=;
        h=From:To:Cc:Subject:Date:From;
        b=QJihoD3rosrgvwZ17Qb9f+INJumUUNZlehOwdLKk1Ri8WSSQhM5ENnFvDFUV5K/un
         zYmFq5JluyNw2rae+U9ecAKRfy7e8fC8DFY5KsMoO/R2BNAEolMQeysbvIhkTEaS4q
         a0IZjQn5q3OjCPDyPZ0M4np2CxtrUWIHRqE3Fxg1SGVHzfXQuL6nxibkyF4vr5zUHD
         8CqkBoZ+dbjzk2Z0hcBHh3gyKHnfIvcGPqEAMarRvI4Vzm0nNsMrZE8v+2o6kcjR1E
         PauAbml+tDQzZdqD6tG7Aqt2TZWNdB+iBUoF6c8KpHiDPI37nvEvGJZ2o8yfSMYcBX
         1aNWJRqf2stTg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, keescook@chromium.org
Subject: [PATCH] docs/core-api: Add Fedora instructions for GCC plugins
Date:   Fri, 21 Feb 2020 11:48:43 +1100
Message-Id: <20200221004843.1709-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add an example of how to install the necessary packages for GCC
plugins on Fedora.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 Documentation/core-api/gcc-plugins.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/core-api/gcc-plugins.rst b/Documentation/core-api/gcc-plugins.rst
index 8502f24396fb..4b1c10f88e30 100644
--- a/Documentation/core-api/gcc-plugins.rst
+++ b/Documentation/core-api/gcc-plugins.rst
@@ -72,6 +72,10 @@ You must install the gcc plugin headers for your gcc version,
 
 	apt-get install gcc-4.9-plugin-dev
 
+Or on Fedora::
+
+	dnf install gcc-plugin-devel
+
 Enable a GCC plugin based feature in the kernel config::
 
 	CONFIG_GCC_PLUGIN_CYC_COMPLEXITY = y
-- 
2.21.1

