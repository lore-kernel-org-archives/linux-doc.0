Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A018C3F2DA
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 15:50:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01F1921739
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 15:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583250647;
	bh=kC1Gboqrl+A1rtsfJT2sVhWnFHp6YEmecotGbmA5UQw=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=h+2WN5HoYZ6oPZmFu/zxnV8llphrs3ftFpuzqiuAF8yCRMxBwiWPyZCTPWbY3ymCl
	 U+SAw0TjdXE+9Dj5lIaUW42Ct6xH5RNyhK/JiIfX8WSz9AAFOFYwJMVVLm9Y2gISXt
	 6+ygPHDSwLbn3w7haSWpUfvOyopd97fncb6CYaaw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729615AbgCCPuq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 10:50:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:59864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729099AbgCCPuq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 10:50:46 -0500
Received: from mail.kernel.org (x2f7fa80.dyn.telefonica.de [2.247.250.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC07E20863;
        Tue,  3 Mar 2020 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583250645;
        bh=kC1Gboqrl+A1rtsfJT2sVhWnFHp6YEmecotGbmA5UQw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GJv4N9BiJ4s7+2P5hA7G0ETsoC4uJEQCuv+rY/SRrvfN2QgGILTJBYBdn035CTGOh
         wgs965d+hyLcZ6p93SZH5aUzev/7o41deSMuRfpLPimRtl81wmtZHTZvIhYsaIet0p
         TrHEdvByfS5Urg8T5Nwh1OXel4/t2CNEyvqDeTlA=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j99og-001ZOm-E4; Tue, 03 Mar 2020 16:50:42 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 2/9] docs: watch_queue.rst: supress some Sphinx warnings
Date:   Tue,  3 Mar 2020 16:50:32 +0100
Message-Id: <637fc605eb2fe6e27d9983ee5c30d78989618313.1583250595.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx doesn't like multi-line literal blocks with ``foobar``:

    Documentation/watch_queue.rst:109: WARNING: Inline literal start-string without end-string.
    Documentation/watch_queue.rst:109: WARNING: Inline emphasis start-string without end-string.
    Documentation/watch_queue.rst:109: WARNING: Inline emphasis start-string without end-string.
    Documentation/watch_queue.rst:109: WARNING: Inline emphasis start-string without end-string.
    Documentation/watch_queue.rst:186: WARNING: Inline literal start-string without end-string.
    Documentation/watch_queue.rst:186: WARNING: Inline emphasis start-string without end-string.
    Documentation/watch_queue.rst:185: WARNING: Inline emphasis start-string without end-string.

So, let's use the "::" markup instead.

While we could do the fix only at the affected lines, let's
do the same change along the entire file, in order to preserve
the same look and feel at the entire doc.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/watch_queue.rst | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/Documentation/watch_queue.rst b/Documentation/watch_queue.rst
index d8f70282d247..f1ffe9cdf81f 100644
--- a/Documentation/watch_queue.rst
+++ b/Documentation/watch_queue.rst
@@ -105,15 +105,19 @@ watch that specific key).
 
 To manage a watch list, the following functions are provided:
 
-  * ``void init_watch_list(struct watch_list *wlist,
-			   void (*release_watch)(struct watch *wlist));``
+  * ::
+
+      void init_watch_list(struct watch_list *wlist,
+			   void (*release_watch)(struct watch *wlist));
 
     Initialise a watch list.  If ``release_watch`` is not NULL, then this
     indicates a function that should be called when the watch_list object is
     destroyed to discard any references the watch list holds on the watched
     object.
 
-  * ``void remove_watch_list(struct watch_list *wlist);``
+  * ::
+
+      void remove_watch_list(struct watch_list *wlist);
 
     This removes all of the watches subscribed to a watch_list and frees them
     and then destroys the watch_list object itself.
@@ -127,14 +131,18 @@ records will be written into.  The workings of this are hidden entirely inside
 of the watch_queue device driver, but it is necessary to gain a reference to it
 to set a watch.  These can be managed with:
 
-  * ``struct watch_queue *get_watch_queue(int fd);``
+  * ::
+
+      struct watch_queue *get_watch_queue(int fd);``
 
     Since watch queues are indicated to the kernel by the fd of the pipe that
     implements the buffer, userspace must hand that fd through a system call.
     This can be used to look up an opaque pointer to the watch queue from the
     system call.
 
-  * ``void put_watch_queue(struct watch_queue *wqueue);``
+  * ::
+
+      void put_watch_queue(struct watch_queue *wqueue);
 
     This discards the reference obtained from ``get_watch_queue()``.
 
@@ -170,18 +178,24 @@ different ID are ignored.
 
 The following functions are provided to manage watches:
 
-  * ``void init_watch(struct watch *watch, struct watch_queue *wqueue);``
+  * ::
+
+      void init_watch(struct watch *watch, struct watch_queue *wqueue);
 
     Initialise a watch object, setting its pointer to the watch queue, using
     appropriate barriering to avoid lockdep complaints.
 
-  * ``int add_watch_to_object(struct watch *watch, struct watch_list *wlist);``
+  * ::
+
+      int add_watch_to_object(struct watch *watch, struct watch_list *wlist);
 
     Subscribe a watch to a watch list (notification source).  The
     driver-settable fields in the watch struct must have been set before this
     is called.
 
-  * ``int remove_watch_from_object(struct watch_list *wlist,
+  * ::
+
+      int remove_watch_from_object(struct watch_list *wlist,
 				   struct watch_queue *wqueue,
 				   u64 id, false);``
 
@@ -190,7 +204,9 @@ The following functions are provided to manage watches:
     (``WATCH_META_REMOVAL_NOTIFICATION``) is sent to the watch queue to
     indicate that the watch got removed.
 
-  * ``int remove_watch_from_object(struct watch_list *wlist, NULL, 0, true);``
+  * ::
+
+      int remove_watch_from_object(struct watch_list *wlist, NULL, 0, true);
 
     Remove all the watches from a watch list.  It is expected that this will be
     called preparatory to destruction and that the watch list will be
-- 
2.24.1

