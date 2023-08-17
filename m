Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DFEC5479A
	for <linux-doc@archiver.kernel.org>; Thu, 17 Aug 2023 21:09:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355124AbjHQVJO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Aug 2023 17:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355178AbjHQVI6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Aug 2023 17:08:58 -0400
X-Greylist: delayed 544 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 17 Aug 2023 14:08:52 PDT
Received: from belinda3.kreativmedia.ch (belinda3.kreativmedia.ch [80.74.158.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB3A358C
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 14:08:52 -0700 (PDT)
Received: from localhost.localdomain (localhost [127.0.0.1]) by belinda3.kreativmedia.ch (Postfix) with ESMTPSA id B9D5752C042B;
        Thu, 17 Aug 2023 22:59:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renenyffenegger.ch;
        s=default; t=1692305985;
        bh=b3zE/KVHbek6PmBD8A2+9ZDrL5tzVoHOWPEtxkkEAMw=; h=From:To:Subject;
        b=Brvi2ivEa27vIzRx/uoMYaVzDzffFX7mxQZK1f23YdwBwzu9cvZSzbwDF6nh3KqaI
         28ERxH3DdbuBaK+DUaN2inwGeif9MemqWYFWyWxaklcDheB1Fh+iBIpSxEQmdwHaG8
         eIcXWjyAhvAWTg+ZLCrP+Uu9w3gVhR1hc9wtb5cI=
Authentication-Results: belinda.kreativmedia.ch;
        spf=pass (sender IP is 31.10.137.7) smtp.mailfrom=mail@renenyffenegger.ch smtp.helo=localhost.localdomain
Received-SPF: pass (belinda.kreativmedia.ch: connection is authenticated)
From:   mail@renenyffenegger.ch
To:     linux-doc@vger.kernel.org
Cc:     =?UTF-8?q?Ren=C3=A9=20Nyffenegger?= <mail@renenyffenegger.ch>
Subject: [PATCH] DOCUMENTATION: Correct filename in Documentation
Date:   Thu, 17 Aug 2023 22:59:40 +0200
Message-Id: <20230817205940.7477-1-mail@renenyffenegger.ch>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Correct filename of renamed file in Documentation

The current documentation in Documentation/core-api/kobject.rst refers to a
macro named `container_of`, supposedly defined in linux/kernel.h while in
reality it is defined in linux/container_of.h

Signed-off-by: René Nyffenegger <mail@renenyffenegger.ch>
--
diff --git a/Documentation/core-api/kobject.rst b/Documentation/core-api/kobject.rst
index 7310247310a0..5f6c61bc03bf 100644
--- a/Documentation/core-api/kobject.rst
+++ b/Documentation/core-api/kobject.rst
@@ -78,7 +78,7 @@ just a matter of using the kobj member.  Code that works with kobjects will
 often have the opposite problem, however: given a struct kobject pointer,
 what is the pointer to the containing structure?  You must avoid tricks
 (such as assuming that the kobject is at the beginning of the structure)
-and, instead, use the container_of() macro, found in ``<linux/kernel.h>``::
+and, instead, use the container_of() macro, found in ``<linux/container_of.h>``::
 
     container_of(ptr, type, member)

