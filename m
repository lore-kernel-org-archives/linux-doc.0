Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AABC4321E
	for <linux-doc@archiver.kernel.org>; Wed, 30 Nov 2022 20:17:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbiK3URX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Nov 2022 15:17:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbiK3UQ6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Nov 2022 15:16:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B3DFAE1
        for <linux-doc@vger.kernel.org>; Wed, 30 Nov 2022 12:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669839142;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=6bOTVpeICKuL76FpWE+vvC2K7TTxT1V/p2B5s3kX4Ck=;
        b=cfmBMrpO6DHXUI66Zxsv7i3CJzvRQz16lnxrMzoyTeGZpJBavoVJZ0LFuxZTFMmOS70mc9
        jIqNTb/wV7drCwb82qaY4+Ofhcg2TV/NMg2APUCJTBAcxlPhJPUuvvTx5/4mxSEKCxAXrp
        DU5v9MhFk2VKqsB1DolMwPJEXIfYZao=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-sFsIdYlFN7G8GOPPIh-NqA-1; Wed, 30 Nov 2022 15:12:15 -0500
X-MC-Unique: sFsIdYlFN7G8GOPPIh-NqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FD81185A792;
        Wed, 30 Nov 2022 20:12:14 +0000 (UTC)
Received: from jtoppins.rdu.csb (unknown [10.22.32.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0FB5FC15BB4;
        Wed, 30 Nov 2022 20:12:14 +0000 (UTC)
From:   Jonathan Toppins <jtoppins@redhat.com>
To:     netdev@vger.kernel.org
Cc:     Jay Vosburgh <j.vosburgh@gmail.com>,
        Veaceslav Falico <vfalico@gmail.com>,
        Andy Gospodarek <andy@greyhouse.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mahesh Bandewar <maheshb@google.com>,
        Jarod Wilson <jarod@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/2] Documentation: bonding: update miimon default to 100
Date:   Wed, 30 Nov 2022 15:12:06 -0500
Message-Id: <4c3f4f0b8f4a8cd3c104d58c106b97ce5f180bc1.1669839127.git.jtoppins@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With commit c1f897ce186a ("bonding: set default miimon value for non-arp
modes if not set") the miimon default was changed from zero to 100 if
arp_interval is also zero. Document this fact in bonding.rst.

Fixes: c1f897ce186a ("bonding: set default miimon value for non-arp modes if not set")
Signed-off-by: Jonathan Toppins <jtoppins@redhat.com>
---
 Documentation/networking/bonding.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/bonding.rst b/Documentation/networking/bonding.rst
index 96cd7a26f3d9..da57aac73ffc 100644
--- a/Documentation/networking/bonding.rst
+++ b/Documentation/networking/bonding.rst
@@ -566,7 +566,8 @@ miimon
 	link monitoring.  A value of 100 is a good starting point.
 	The use_carrier option, below, affects how the link state is
 	determined.  See the High Availability section for additional
-	information.  The default value is 0.
+	information.  The default value is 100 if arp_interval is not
+	set.
 
 min_links
 
-- 
2.31.1

