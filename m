Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E336DC433DB
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 10:48:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A494964EBD
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 10:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbhBSKsf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Feb 2021 05:48:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20632 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229535AbhBSKsd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Feb 2021 05:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613731624;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=B/+AiInwMmJVizsS16te2eSr4y8I9kEMenZeJ0/mh6o=;
        b=E3wP6CnG0l521NmyaaXnwvPc/x4fS17wqEyAzvaOw9oQOEKen3VfpMwwkasSRMxdf8HHYg
        6ciyvEJBxF9wxf1b1UW4N2G2aaOqItmNvNlSwIDNM1Ro1q49Fmud22NiALHSbFOKmWNRHE
        Dzmjxk0siR5whcR/p+q3Q6DOki3GYno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-GzT0t4zPMGm7QLnhRZPU6A-1; Fri, 19 Feb 2021 05:46:57 -0500
X-MC-Unique: GzT0t4zPMGm7QLnhRZPU6A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A83A874980;
        Fri, 19 Feb 2021 10:46:55 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E29DB19D9D;
        Fri, 19 Feb 2021 10:46:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] watch_queue: rectify kernel-doc for init_watch()
From:   David Howells <dhowells@redhat.com>
To:     jarkko@kernel.org
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        mchehab+huawei@kernel.org, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Fri, 19 Feb 2021 10:46:53 +0000
Message-ID: <161373161298.2157082.10755433120775444271.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Lukas Bulwahn <lukas.bulwahn@gmail.com>

The command './scripts/kernel-doc -none kernel/watch_queue.c'
reported a mismatch in the kernel-doc of init_watch().

Rectify the kernel-doc, such that no issues remain for watch_queue.c.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Link: https://lore.kernel.org/lkml/20210125161409.8478-1-lukas.bulwahn@gmail.com
---

 kernel/watch_queue.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index 0ef8f65bd2d7..9c9eb20dd2c5 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -413,7 +413,7 @@ static void put_watch(struct watch *watch)
 }
 
 /**
- * init_watch_queue - Initialise a watch
+ * init_watch - Initialise a watch
  * @watch: The watch to initialise.
  * @wqueue: The queue to assign.
  *


