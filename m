Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC675C433E0
	for <linux-doc@archiver.kernel.org>; Sun, 17 Jan 2021 21:34:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B75F1224B8
	for <linux-doc@archiver.kernel.org>; Sun, 17 Jan 2021 21:34:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729202AbhAQVeq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 17 Jan 2021 16:34:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728669AbhAQVel (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 17 Jan 2021 16:34:41 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C62C061573;
        Sun, 17 Jan 2021 13:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=IWcSJcsATMH6IfB5svVqIvQaMM31cBeYIhlmGrcgqx8=; b=3Tue7wScgM3LJ7rLwbCB8ipFpH
        bVTrLgGz9SqRUHcqo9ZhjxEO1OUt7R8CR5S54lux+nsRnMqAgciKF34FIXNLgSrWsUVhcRR1fQf5F
        poTHDe5f2er4TjxisbdTJL3Yn0z9JvPDzuu/DsmsO+GzFSpBkFkXDdDRVt5lCjbNFmiMPZifBln76
        TqQ5YHFb5jWYgAtpejBQfFSRxfmDrmc2PAPHRoQt3ZQlXsBCpXG87r4rN8iVLT/KYitHh/ozUQu0r
        sl0tfST10sjnK1VKYDRD+aPi1m0urSklIRF2tj2BZ3TxYJgp74czV4h8UbR0L9WwV0D0CM475IJO/
        u3cbPr6Q==;
Received: from [2601:1c0:6280:3f0::9abc] (helo=merlin.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l1FgL-000688-IP; Sun, 17 Jan 2021 21:33:58 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        David Howells <dhowells@redhat.com>,
        linux-afs@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH] AFS: Documentation: fix a few typos in afs.rst
Date:   Sun, 17 Jan 2021 13:33:51 -0800
Message-Id: <20210117213351.1075-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix typos (punctuation, grammar, spelling) in afs.rst.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Howells <dhowells@redhat.com>
Cc: linux-afs@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/filesystems/afs.rst |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20210115.orig/Documentation/filesystems/afs.rst
+++ linux-next-20210115/Documentation/filesystems/afs.rst
@@ -109,7 +109,7 @@ Mountpoints
 AFS has a concept of mountpoints. In AFS terms, these are specially formatted
 symbolic links (of the same form as the "device name" passed to mount).  kAFS
 presents these to the user as directories that have a follow-link capability
-(ie: symbolic link semantics).  If anyone attempts to access them, they will
+(i.e.: symbolic link semantics).  If anyone attempts to access them, they will
 automatically cause the target volume to be mounted (if possible) on that site.
 
 Automatically mounted filesystems will be automatically unmounted approximately
@@ -144,7 +144,7 @@ looks up a cell of the same name, for ex
 Proc Filesystem
 ===============
 
-The AFS modules creates a "/proc/fs/afs/" directory and populates it:
+The AFS module creates a "/proc/fs/afs/" directory and populates it:
 
   (*) A "cells" file that lists cells currently known to the afs module and
       their usage counts::
@@ -201,7 +201,7 @@ And then run as::
 	./klog
 
 Assuming it's successful, this adds a key of type RxRPC, named for the service
-and cell, eg: "afs@<cellname>".  This can be viewed with the keyctl program or
+and cell, e.g.: "afs@<cellname>".  This can be viewed with the keyctl program or
 by cat'ing /proc/keys::
 
 	[root@andromeda ~]# keyctl show
@@ -211,7 +211,7 @@ by cat'ing /proc/keys::
 	111416553 --als--v      0     0   \_ rxrpc: afs@CAMBRIDGE.REDHAT.COM
 
 Currently the username, realm, password and proposed ticket lifetime are
-compiled in to the program.
+compiled into the program.
 
 It is not required to acquire a key before using AFS facilities, but if one is
 not acquired then all operations will be governed by the anonymous user parts
