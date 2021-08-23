Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AADC4338F
	for <linux-doc@archiver.kernel.org>; Mon, 23 Aug 2021 18:31:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 384D061183
	for <linux-doc@archiver.kernel.org>; Mon, 23 Aug 2021 18:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhHWScf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 23 Aug 2021 14:32:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52111 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230083AbhHWScf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Aug 2021 14:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629743511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=FKW3xybwKqXGjcBzHWfWyFwagi7aN2VDjzQcKOHiF2o=;
        b=ZJoUUV2HgBeEqtHR9fnLC2vEDstMHYNsVAPO4rHPyz1dJQsLnj+Z/MeKMcEM27+Ldh095U
        FMl9T2y18dYYhaRtMzJafiRtHfVBNvdnau3DUp4ECkp0ifvye43fGJiq44DFgPyaXv6GeJ
        P8rcRdFSvW7JXv4rwCdP6al892UgYMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-TRiAOzb9NweJkeFbQpIWWQ-1; Mon, 23 Aug 2021 14:31:50 -0400
X-MC-Unique: TRiAOzb9NweJkeFbQpIWWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 747E88042EF;
        Mon, 23 Aug 2021 18:31:49 +0000 (UTC)
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F33DF19C59;
        Mon, 23 Aug 2021 18:31:48 +0000 (UTC)
From:   Alexander Aring <aahringo@redhat.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, willy@infradead.org, aahringo@redhat.com
Subject: [PATCHv2] Documentation: locking: fix references
Date:   Mon, 23 Aug 2021 14:31:43 -0400
Message-Id: <20210823183143.1691344-1-aahringo@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch fixes file references from txt to rst file ending in
ww-mutex-design.rst and futex-requeue-pi.rst. While on it fix a spelling
issue "desgin" to "design" reported by Matthew Wilcox.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
Maybe there are more somewhere else in Documentation? However I caught
these ones in locking.

changes since v2:
 - spell fix from "desgin" to "design".

 Documentation/locking/futex-requeue-pi.rst | 2 +-
 Documentation/locking/ww-mutex-design.rst  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/locking/futex-requeue-pi.rst b/Documentation/locking/futex-requeue-pi.rst
index 14ab5787b9a7..dd4ecf4528a4 100644
--- a/Documentation/locking/futex-requeue-pi.rst
+++ b/Documentation/locking/futex-requeue-pi.rst
@@ -5,7 +5,7 @@ Futex Requeue PI
 Requeueing of tasks from a non-PI futex to a PI futex requires
 special handling in order to ensure the underlying rt_mutex is never
 left without an owner if it has waiters; doing so would break the PI
-boosting logic [see rt-mutex-desgin.txt] For the purposes of
+boosting logic [see rt-mutex-design.rst] For the purposes of
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

