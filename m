Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3A1C37D923
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Mar 2019 05:21:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732440AbfC0FSh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Mar 2019 01:18:37 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:33101 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725805AbfC0FSh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Mar 2019 01:18:37 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 13BBA2214E;
        Wed, 27 Mar 2019 01:18:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 27 Mar 2019 01:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=Gi/oZKDoLMBdJHiaZfzQGRUahj2/6JIrGqILLjPpIYU=; b=fxYDu3N6
        /MV59jmVeBdRqaH/NZihQPuR/8UVCD0YlUX2UK9jDji/UF+RoZi9pYyP8OLPZKr8
        aMxk1CWuf/lq48LSfYeDQY0qkOc0TnfnQkThjz1KtI8kFBLbWMQDHg4/W7JRUSyg
        tvzOpKFq4fKL3467YG3zCSNzYw2YetGv+ayO21VYYXhQG3kCRujCB2YE/adfRLi4
        jTIOhRFCNHMNvH8AN1rB/FXaYOYbYBTRPmIbsBJHfwKaSRh6L8sac9A1Gp65I4Ty
        DK1a0LLILUPJq7YVu8uUovji/7ah7x+KMYgnnbUVjyosmIoF7a2qJkjhIfDUCkrP
        yeMEveLzlnzjpg==
X-ME-Sender: <xms:qwebXD8hVFZtG7oBJqtM6X4G_as5bFYZkPTL-zk2v2cfMnmf-Qj7JQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrkedugdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfvohgsihhn
    ucevrdcujfgrrhguihhnghdfuceothhosghinheskhgvrhhnvghlrdhorhhgqeenucfkph
    epuddvgedrudeiledrudefledrudelvdenucfrrghrrghmpehmrghilhhfrhhomhepthho
    sghinheskhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:qwebXKbHcX55d2TGmSnFOlxdHr9lcewUQGmd84VpRvWq-2H4qL2ulA>
    <xmx:qwebXJvvWr51EJCervXbhn-tgNRfuJ7-KrmdQ-D4fB8dySoW8sUH-g>
    <xmx:qwebXGnp1sZYjZwwvyl4lF8U9b-S8xHGSxgUA_OiLMErNNChyFrICg>
    <xmx:rAebXOJA6tCXFV3aT4oSx1GNwNRpKYF-b8CTSWc7XIBbNJNwfkwp_g>
Received: from eros.localdomain (124-169-139-192.dyn.iinet.net.au [124.169.139.192])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8AADEE415C;
        Wed, 27 Mar 2019 01:18:32 -0400 (EDT)
From:   "Tobin C. Harding" <tobin@kernel.org>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     "Tobin C. Harding" <tobin@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@s-opensource.com>,
        Neil Brown <neilb@suse.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/24] fs: Update function docstring for dio_complete()
Date:   Wed, 27 Mar 2019 16:16:56 +1100
Message-Id: <20190327051717.23225-4-tobin@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190327051717.23225-1-tobin@kernel.org>
References: <20190327051717.23225-1-tobin@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx throws a warning when parsing fs/direct_io.c, the warning
illuminates the fact that the docstring for function dio_complete() has
become stale.

Update the function docstring for dio_complete() documenting all current
function parameters.

Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---
 fs/direct-io.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/direct-io.c b/fs/direct-io.c
index dbc1a1f080ce..ce5fd5f8603c 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -242,7 +242,9 @@ void dio_warn_stale_pagecache(struct file *filp)
 
 /**
  * dio_complete() - called when all DIO BIO I/O has been completed
- * @offset: the byte offset in the file of the completed operation
+ * @dio: The dio we are working on.
+ * @ret: Error code passed through from do_blockdev_direct_IO().
+ * @flags: DIO complete flags.
  *
  * This drops i_dio_count, lets interested parties know that a DIO operation
  * has completed, and calculates the resulting return code for the operation.
-- 
2.21.0

