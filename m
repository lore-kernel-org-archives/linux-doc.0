Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6440C77B75
	for <linux-doc@archiver.kernel.org>; Wed, 10 May 2023 02:29:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjEJC3V (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 May 2023 22:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjEJC3V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 May 2023 22:29:21 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 783CCE72;
        Tue,  9 May 2023 19:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=T8FKbCPqrrTsC9F/hyGOUQ1c7+51ALcmnXApedywojQ=; b=2PjAr0P87iCl1VEqIl1RGRON2B
        3msuumEG2YiMub93rkzKVrCqsTxIUJhg/DUuvxNYvaqsdY7x/Uah9uT8OecfDHeQ8Wd9swcIg4JqW
        tWrMpG3QS1PwSw+Cqc05rUpwxdXYMeUCRvTHLH5FwQ65nh56HKsutbJBq7F3ISIpSMj80FZN7xNC5
        M1PlyPACWkJb8iKP3+R4IxqNXojJ1/I1vy2umF8mAu8h3uBRp7Yl2lUlUp+0j/HNOeNouIcI1B+G6
        hx7MLdPKWYUPzS955mxzlFfcfAGtc/V/OPZeLZ0p7pFdr/Z82nf3+5a6+bz5etxsrUhV6m5CeAiqb
        Yibqc0LQ==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1pwZZr-004m54-2Y;
        Wed, 10 May 2023 02:29:15 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     netdev@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Martin Schiller <ms@dev.tdt.de>, linux-x25@vger.kernel.org
Subject: [PATCH] docs: networking: fix x25-iface.rst heading & index order
Date:   Tue,  9 May 2023 19:29:14 -0700
Message-Id: <20230510022914.2230-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix the chapter heading for "X.25 Device Driver Interface" so that it
does not contain a trailing '-' character, which makes Sphinx
omit this heading from the contents.

Reverse the order of the x25.rst and x25-iface.rst files in the index
so that the project introduction (x25.rst) comes first.

Fixes: 883780af7209 ("docs: networking: convert x25-iface.txt to ReST")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Martin Schiller <ms@dev.tdt.de>
Cc: linux-x25@vger.kernel.org
---
 Documentation/networking/index.rst     |    2 +-
 Documentation/networking/x25-iface.rst |    3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff -- a/Documentation/networking/index.rst b/Documentation/networking/index.rst
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -116,8 +116,8 @@ Contents:
    udplite
    vrf
    vxlan
-   x25-iface
    x25
+   x25-iface
    xfrm_device
    xfrm_proc
    xfrm_sync
diff -- a/Documentation/networking/x25-iface.rst b/Documentation/networking/x25-iface.rst
--- a/Documentation/networking/x25-iface.rst
+++ b/Documentation/networking/x25-iface.rst
@@ -1,8 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-============================-
 X.25 Device Driver Interface
-============================-
+============================
 
 Version 1.1
 
