Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EF1037D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 Oct 2019 10:46:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfJ3Kq4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Oct 2019 06:46:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:55208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726069AbfJ3Kq4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Oct 2019 06:46:56 -0400
Received: from tleilax.poochiereds.net (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7077320663;
        Wed, 30 Oct 2019 10:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572432415;
        bh=1TUJ5swacoPhXkZb42byzrHJ9dCrxC9BbhBrk1BKv58=;
        h=From:To:Cc:Subject:Date:From;
        b=XQWbNxzlqm+4h1ohD2dkSy50lKXa7OFS/W8S2i3CHmjwotKjk2OiY0t50o7Ad/BTc
         cMmGKOWPXHYdmsn1GhvKnXUVTtQB6b7p6k0i4eqgL/uWjkBfspNdaOfdm+gDr7Hij1
         m9Opw4EVfsGfQN5b3GAgemFvy5egrxDP3r0E7Clo=
From:   Jeff Layton <jlayton@kernel.org>
To:     corbet@lwn.net
Cc:     viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: atomic_open called with shared lock on non-O_CREAT open
Date:   Wed, 30 Oct 2019 06:46:54 -0400
Message-Id: <20191030104654.6315-1-jlayton@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The exclusive lock is only held when O_CREAT is set.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 Documentation/filesystems/locking.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
index fc3a0704553c..5057e4d9dcd1 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -105,7 +105,7 @@ getattr:	no
 listxattr:	no
 fiemap:		no
 update_time:	no
-atomic_open:	exclusive
+atomic_open:	shared (exclusive if O_CREAT is set in open flags)
 tmpfile:	no
 ============	=============================================
 
-- 
2.21.0

