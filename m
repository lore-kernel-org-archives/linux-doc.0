Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11832C05027
	for <linux-doc@archiver.kernel.org>; Mon, 20 Feb 2023 03:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbjBTDuC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 19 Feb 2023 22:50:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbjBTDuB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 19 Feb 2023 22:50:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65BCC154
        for <linux-doc@vger.kernel.org>; Sun, 19 Feb 2023 19:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676864960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=DUmaeReyO7jKqvOOHeWjaTBfop5kJ/bfthnLreqoWH4=;
        b=N/UZ8LkN9VjScrTAohaBG2dH7D+85DfQxzMV6aa/XL6q34WxV4C8oqA+5vk4C8HVAF00Vo
        6Utue9ix+i9vPhtX6GFFxBsaN4F55qZgwStLdHrTDF4LfzaGOKjrv+noHAZABuTHJ3GHUg
        +1gBhVs5ddN7oAWN1JXT0diCmyooysw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-jYqQTnOoNriXX0gbdSTNCQ-1; Sun, 19 Feb 2023 22:49:16 -0500
X-MC-Unique: jYqQTnOoNriXX0gbdSTNCQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D985858F09;
        Mon, 20 Feb 2023 03:49:16 +0000 (UTC)
Received: from q.nay.redhat.com (unknown [10.66.61.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C02D3C15BA0;
        Mon, 20 Feb 2023 03:49:13 +0000 (UTC)
From:   Shaoqin Huang <shahuang@redhat.com>
To:     kvm@vger.kernel.org
Cc:     Shaoqin Huang <shahuang@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] KVM: Add the missed title format
Date:   Mon, 20 Feb 2023 11:49:09 +0800
Message-Id: <20230220034910.11024-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The 7.18 KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 now is not a title, make it
as a title to keep the format consistent.

Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
---
 Documentation/virt/kvm/api.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 0a67cb738013..15209dfd8392 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -7174,6 +7174,7 @@ and injected exceptions.
        will clear DR6.RTM.
 
 7.18 KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2
+--------------------------------------
 
 :Architectures: x86, arm64, mips
 :Parameters: args[0] whether feature should be enabled or not
-- 
2.39.1

