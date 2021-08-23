Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC58EC4338F
	for <linux-doc@archiver.kernel.org>; Mon, 23 Aug 2021 17:16:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFD7B61246
	for <linux-doc@archiver.kernel.org>; Mon, 23 Aug 2021 17:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbhHWRQm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 23 Aug 2021 13:16:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25997 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231401AbhHWRQg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Aug 2021 13:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629738952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=5C9lZu55HX8t21efwYbaIEeQ6TdnYOKZGoZnHy38OKI=;
        b=cjIBJ2qQGJSgRaQMPskf7g2tOm21NNHufqFjMoTRnzj0nqnS+7hD8dMh4GOLkcfgiNvZ0A
        sy1kKtDemf3mrMLO42LYzuZ80QgpXZlFzRmU6tgZm+8hL/r/6dwixzqSADhhZXYumfoLrj
        DTHRXPVm9176Zxs9EJ9NaTn863GS790=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-g2Tfa9C4MUupnEWiSt3poQ-1; Mon, 23 Aug 2021 13:15:50 -0400
X-MC-Unique: g2Tfa9C4MUupnEWiSt3poQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 030B5802922;
        Mon, 23 Aug 2021 17:15:50 +0000 (UTC)
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A5F7F66FFF;
        Mon, 23 Aug 2021 17:15:49 +0000 (UTC)
From:   Alexander Aring <aahringo@redhat.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, aahringo@redhat.com
Subject: [PATCH] Documentation: locking: fix references
Date:   Mon, 23 Aug 2021 13:15:46 -0400
Message-Id: <20210823171546.1686907-1-aahringo@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch fixes file references from txt to rst file ending in
ww-mutex-design.rst and futex-requeue-pi.rst.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
Maybe there are more somewhere else in Documentation? However I caught
these ones in locking.

 Documentation/locking/futex-requeue-pi.rst | 2 +-
 Documentation/locking/ww-mutex-design.rst  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/locking/futex-requeue-pi.rst b/Documentation/locking/futex-requeue-pi.rst
index 14ab5787b9a7..27c7a2b8966f 100644
--- a/Documentation/locking/futex-requeue-pi.rst
+++ b/Documentation/locking/futex-requeue-pi.rst
@@ -5,7 +5,7 @@ Futex Requeue PI
 Requeueing of tasks from a non-PI futex to a PI futex requires
 special handling in order to ensure the underlying rt_mutex is never
 left without an owner if it has waiters; doing so would break the PI
-boosting logic [see rt-mutex-desgin.txt] For the purposes of
+boosting logic [see rt-mutex-desgin.rst] For the purposes of
 brevity, this action will be referred to as "requeue_pi" throughout
 this document.  Priority inheritance is abbreviated throughout as
 "PI".
diff --git a/Documentation/locking/ww-mutex-design.rst b/Documentation/locking/ww-mutex-design.rst
index 54d9c17bb66b..6a4d7319f8f0 100644
--- a/Documentation/locking/ww-mutex-design.rst
+++ b/Documentation/locking/ww-mutex-design.rst
@@ -2,7 +2,7 @@
 Wound/Wait Deadlock-Proof Mutex Design
 ======================================
 
-Please read mutex-design.txt first, as it applies to wait/wound mutexes too.
+Please read mutex-design.rst first, as it applies to wait/wound mutexes too.
 
 Motivation for WW-Mutexes
 -------------------------
-- 
2.27.0

