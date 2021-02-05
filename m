Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40EEC433E9
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 00:47:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95F9564F46
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 00:47:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbhBEAra (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 19:47:30 -0500
Received: from mx2.suse.de ([195.135.220.15]:38022 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232132AbhBEAr3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 4 Feb 2021 19:47:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 17C23B039;
        Fri,  5 Feb 2021 00:46:48 +0000 (UTC)
From:   NeilBrown <neilb@suse.de>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>
Date:   Fri, 05 Feb 2021 11:36:30 +1100
Subject: [PATCH 1/3] seq_file: document how per-entry resources are managed.
Cc:     Xin Long <lucien.xin@gmail.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Message-ID: <161248539020.21478.3147971477400875336.stgit@noble1>
In-Reply-To: <161248518659.21478.2484341937387294998.stgit@noble1>
References: <161248518659.21478.2484341937387294998.stgit@noble1>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Users of seq_file will sometimes find it convenient to take a resource,
such as a lock or memory allocation, in the ->start or ->next
operations.
These are per-entry resources, distinct from per-session resources which
are taken in ->start and released in ->stop.

The preferred management of these is release the resource on the
subsequent call to ->next or ->stop.

However prior to Commit 1f4aace60b0e ("fs/seq_file.c: simplify seq_file
iteration code and interface") it happened that ->show would always be
called after ->start or ->next, and a few users chose to release the
resource in ->show.

This is no longer reliable.  Since the mentioned commit, ->next will
always come after a successful ->show (to ensure m->index is updated
correctly), so the original ordering cannot be maintained.

This patch updates the documentation to clearly state the required
behaviour.  Other patches will fix the few problematic users.

Fixes: 1f4aace60b0e ("fs/seq_file.c: simplify seq_file iteration code and interface")
Cc: Xin Long <lucien.xin@gmail.com>
Signed-off-by: NeilBrown <neilb@suse.de>
---
 Documentation/filesystems/seq_file.rst |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/filesystems/seq_file.rst b/Documentation/filesystems/seq_file.rst
index 56856481dc8d..0e40e1532e7f 100644
--- a/Documentation/filesystems/seq_file.rst
+++ b/Documentation/filesystems/seq_file.rst
@@ -217,6 +217,12 @@ between the calls to start() and stop(), so holding a lock during that time
 is a reasonable thing to do. The seq_file code will also avoid taking any
 other locks while the iterator is active.
 
+The iterater value returned by start() or next() is guaranteed to be
+passed to a subsequenct next() or stop() call.  This allows resources
+such as locks that were taken to be reliably released.  There is *no*
+guarantee that the iterator will be passed to show(), though in practice
+it often will be.
+
 
 Formatted output
 ================


