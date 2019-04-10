Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EDB837D8A4
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Apr 2019 09:57:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfDJJ5O (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Apr 2019 05:57:14 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60540 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729689AbfDJJ4i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Apr 2019 05:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=T0SBZllgHqVlHqCRx9ICKVMFMCBWkpJnm5qm1nU/vMM=; b=lwJg9bv/lSDkmJxxuj2e2SONE7
        R3swTIuGN4zSdBnGJ7cPsGboKLpSqwnRAGb3PUk4PBGtGk/sYE/IJWZRn+Py6WL+k+raAtWBA2kJ7
        h6lgCQWoSlqrpqeA3KNKDkFLSgC8+GHjCemA9sEPd0mCoepPUIDr1qjis7xIu9eNoAbmdmv00Lbpl
        GZ2UAWu8asgHYl0ZeEMGiZNZKbGzYiJJi+6XooaOjToW5JoGVjZODtuU1oKechnPlREb2VigJJ7gt
        bfDHZStOw8vc++U5q5ZK1D1QxREncsyDCKqXVORlgimKh3WkdbXkA4r/QRYKmP27VEE4PLPZclTRZ
        Snbx3Row==;
Received: from 177.41.129.23.dynamic.adsl.gvt.net.br ([177.41.129.23] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hE9y9-0003Cp-7z; Wed, 10 Apr 2019 09:56:37 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hE9y3-0000o5-P1; Wed, 10 Apr 2019 06:56:31 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 3/8] docs: clearing-warn-once.txt: add a title for this document
Date:   Wed, 10 Apr 2019 06:56:22 -0300
Message-Id: <eb6ebd1482dfa60b2eeb2f90f77eab695c5e89ef.1554889999.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1554889999.git.mchehab+samsung@kernel.org>
References: <cover.1554889999.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This document misses a title. Add it, in order to follow
the documentation standard.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/clearing-warn-once.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/clearing-warn-once.txt b/Documentation/clearing-warn-once.txt
index 5b1f5d547be1..4aa938262d0e 100644
--- a/Documentation/clearing-warn-once.txt
+++ b/Documentation/clearing-warn-once.txt
@@ -1,3 +1,5 @@
+Clearing WARN_ONCE
+------------------
 
 WARN_ONCE / WARN_ON_ONCE only print a warning once.
 
-- 
2.20.1

