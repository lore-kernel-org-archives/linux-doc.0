Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 70BF87D918
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Apr 2019 13:37:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbfDVNgp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Apr 2019 09:36:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:36816 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727384AbfDVN2N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Apr 2019 09:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0m721at5cwMfiWxrdIYV8i/+vD6LBjTJalnje+Q//hI=; b=VIZxgOULYxeDRamD34NPzq3NEz
        TxHycxvYu0+QiMiSF+MiZcCYeu8ffIPYnGV1FXawwVoS3YKjXMNw8UGiu92KKsVaqoMdwVja21RbO
        MxUfsxl8ceo3aPvnsuN/rMMGnpUvVrLqSfKOorH7lSiYXpy1oK0IpYvmvJzM78b55wCFJ+C1JiT2G
        1nluUrvooua5xvnusXMKp5Jn73o3pCbEiLYgMzbNONMjCdHgZ9VeaQit5sHHSMwxq+IHgh39YjJnP
        ckMQswUJxhFwKMLGpBye3aa+0Om7jF/4TOJMcAcxpjl3pBsp9Ug6s3jd7jOTi0cqLpkZeIDTfUFnd
        JAWtY5Tw==;
Received: from 179.176.125.229.dynamic.adsl.gvt.net.br ([179.176.125.229] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hIYzU-0005HS-KL; Mon, 22 Apr 2019 13:28:12 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hIYzS-0005jV-8c; Mon, 22 Apr 2019 10:28:10 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 01/79] docs: core-api: fix broken references for div64.c and gcd.c
Date:   Mon, 22 Apr 2019 10:26:50 -0300
Message-Id: <160e8af0eafa34b0f7e78b59eae41ede437d4693.1555938375.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1555938375.git.mchehab+samsung@kernel.org>
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Those files were moved to lib/math.

Fixes: 9635bad21596 ("lib: Move mathematic helpers to separate folder")
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/core-api/kernel-api.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index 71f5d2fe39b7..a29c99d13331 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -147,10 +147,10 @@ Division Functions
 .. kernel-doc:: include/linux/math64.h
    :internal:
 
-.. kernel-doc:: lib/div64.c
+.. kernel-doc:: lib/math/div64.c
    :functions: div_s64_rem div64_u64_rem div64_u64 div64_s64
 
-.. kernel-doc:: lib/gcd.c
+.. kernel-doc:: lib/math/gcd.c
    :export:
 
 UUID/GUID
-- 
2.20.1

