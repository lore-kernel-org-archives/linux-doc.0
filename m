Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7AA1E7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Apr 2019 13:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfDVN2O (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Apr 2019 09:28:14 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:36808 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbfDVN2N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Apr 2019 09:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4jPg5SBmwMZUCmAGir71RBysjFB9d//84iaAGU/28zM=; b=s/3Kk5jqzM9zkN+D3VPfwTJRnF
        StaInjD5ZoZaj4mifr/i87pvBdRHdN3GnQw9N+y5NvqtXmn9Nx169AvJJSDBkejYspZLvrBzCULa9
        fK/LY07mnjgJoj7bXCzXMyycvsJ+9ksygmJW0t/i8THfpoopmbflUJV31rXh/I3uDhn+/X1wMPq+3
        +SeR/qbsPIeVp1M8c4s6Xau1nWiWmYARnxDFCS/Bz0XasSEx5xG5mmZPYaoIU++Hlr1tqbfN/XBnH
        WmC4B5SFAz2RXpTAjg5tS5h0kLYRz6ogEcnXOtw3vYCv0kJSbx/ebrvy6aO7TpWxFGxkG7ptZ4lBo
        boVqzH7w==;
Received: from 179.176.125.229.dynamic.adsl.gvt.net.br ([179.176.125.229] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hIYzU-0005HX-KS; Mon, 22 Apr 2019 13:28:12 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hIYzS-0005k1-G2; Mon, 22 Apr 2019 10:28:10 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 09/79] docs: cgroup-v1/blkio-controller.rst: add a note about CFQ scheduler
Date:   Mon, 22 Apr 2019 10:26:58 -0300
Message-Id: <9ab0a2c2c084dce030fe8944e2441df14cab3a6a.1555938375.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1555938375.git.mchehab+samsung@kernel.org>
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The CFQ scheduler was removed on this changeset:

  commit f382fb0bcef4c37dc049e9f6963e3baf204d815c
  Author: Jens Axboe <axboe@kernel.dk>
  Date:   Fri Oct 12 10:14:46 2018 -0600

    block: remove legacy IO schedulers

    Retain the deadline documentation, as that carries over to mq-deadline
    as well.

    Tested-by: Ming Lei <ming.lei@redhat.com>
    Reviewed-by: Omar Sandoval <osandov@fb.com>
    Signed-off-by: Jens Axboe <axboe@kernel.dk>

However, the cgroups-v1 documentation still mentions it and points
to a removed file that used to belong to such scheduler.

Add a note about that, as someone needs to fix the document pointing
to another scheduler, if cgroups-v1 blockio is not dependent of
CFQ scheduler.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/cgroup-v1/blkio-controller.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/cgroup-v1/blkio-controller.rst b/Documentation/cgroup-v1/blkio-controller.rst
index 2c1b907afc14..2836c2c31e63 100644
--- a/Documentation/cgroup-v1/blkio-controller.rst
+++ b/Documentation/cgroup-v1/blkio-controller.rst
@@ -17,6 +17,13 @@ one is throttling policy which can be used to specify upper IO rate limits
 on devices. This policy is implemented in generic block layer and can be
 used on leaf nodes as well as higher level logical devices like device mapper.
 
+.. note::
+
+   While this document mentions the CFQ scheduler, it got removed at
+   Kernel 4.20, as there are other schedulers that are more efficient.
+
+   Someone needs to update this file in order to reflect such change.
+
 HOWTO
 =====
 Proportional Weight division of bandwidth
-- 
2.20.1

