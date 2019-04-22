Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EC6857D099
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Apr 2019 13:33:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbfDVNdM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Apr 2019 09:33:12 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37708 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727359AbfDVN2U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Apr 2019 09:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5SPRGcFstl9ZbH1ke9MlgEPDpScelryQO42EthWbKNU=; b=ZVnpCqCn4CdhTA7WjnOQeijzf0
        90zQVfwQEF0qgSedoX9r53DJssITXe5sNs5GJcvLEKN4NZdh5o0PUE1OMcM4AJZ0Y7biinxclwr4y
        CpdrNdImuRizLeF8mHMlFd1l4MJ+wWsCWmwd8Ts0MkNWxfdwsQ35/pLsj0U8xMi4SQ27y4GxGEpih
        hH1WuKjyPRTiVsnGfRmvZO7NaTl8j07lYxe3e7mFIQTeTJ3AcYOrWNsogZB+QLZhM88hhGGIxutGt
        aeIxwPMnibYMLTarrHkMmLXH0QBModVLdIU7yFSfNFgcaLC0nhZr3qUx1PE33/73NOj1OuYkQ6aBV
        wGPEIpIQ==;
Received: from 179.176.125.229.dynamic.adsl.gvt.net.br ([179.176.125.229] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hIYzb-0005Hv-Ex; Mon, 22 Apr 2019 13:28:19 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hIYzT-0005nu-Ts; Mon, 22 Apr 2019 10:28:11 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 55/79] docs: rbtree.txt: fix Sphinx build warnings
Date:   Mon, 22 Apr 2019 10:27:44 -0300
Message-Id: <28c6092e56e70c27f0e3b79cbde4b808d9871b8f.1555938376.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1555938375.git.mchehab+samsung@kernel.org>
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ths file is already at ReST format. Yet, some recent changes
made it to produce a few warnings when building it with
Sphinx.

Those are trivially fixed by marking some literal blocks.

Fix them before adding it to the docs building system.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/rbtree.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/rbtree.txt b/Documentation/rbtree.txt
index c42a21b99046..523d54b60087 100644
--- a/Documentation/rbtree.txt
+++ b/Documentation/rbtree.txt
@@ -204,21 +204,21 @@ potentially expensive tree iterations. This is done at negligible runtime
 overhead for maintanence; albeit larger memory footprint.
 
 Similar to the rb_root structure, cached rbtrees are initialized to be
-empty via:
+empty via::
 
   struct rb_root_cached mytree = RB_ROOT_CACHED;
 
 Cached rbtree is simply a regular rb_root with an extra pointer to cache the
 leftmost node. This allows rb_root_cached to exist wherever rb_root does,
 which permits augmented trees to be supported as well as only a few extra
-interfaces:
+interfaces::
 
   struct rb_node *rb_first_cached(struct rb_root_cached *tree);
   void rb_insert_color_cached(struct rb_node *, struct rb_root_cached *, bool);
   void rb_erase_cached(struct rb_node *node, struct rb_root_cached *);
 
 Both insert and erase calls have their respective counterpart of augmented
-trees:
+trees::
 
   void rb_insert_augmented_cached(struct rb_node *node, struct rb_root_cached *,
 				  bool, struct rb_augment_callbacks *);
-- 
2.20.1

