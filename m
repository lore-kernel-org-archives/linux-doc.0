Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 02BAF7D9ED
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Jul 2019 11:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbfGQLFi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Jul 2019 07:05:38 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47028 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbfGQLFh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Jul 2019 07:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QVmMfFbyrBUXO4UWpk3NqsWGbMgl5YlRIWt5G2YrmUU=; b=mw51ISV0b7LtbATIqycvPdZAFV
        Orp3UM24DAWZe2XsN4EWxcS1YxV5PFg9GtyT1bIuv+drx/9FXxjzqieHZGaS6DwlCSwUYifNYIdyq
        qCaOjzn7cQg9+Eew7kEsQYRilv4I+70p1vQWH/UIMr0LKDDxWnTeJQqt+smm+R5OwQmjF7YoD+siG
        Tos+MBTrDUvJPO3Z3ozKdPnDlAm79z/y9S3yr8ksj+pzoL1Mg9RCz8ru4JDtDgPYqW+qtX9H+oB4N
        khgXpse+bqbzEP4G7jsPXcihCprPM7ahoM3fDO4qKiYojhNctI+uKdBhXdwTldhamx0f1xppjq45Z
        ae8Z2ZAw==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnhke-00054F-EA; Wed, 17 Jul 2019 11:05:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnhkc-000391-Hz; Wed, 17 Jul 2019 08:05:34 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 04/20] docs: kernellog.py: add support for info()
Date:   Wed, 17 Jul 2019 08:05:17 -0300
Message-Id: <5bf4287edac8698f114cdd49e7b9602a27ecaca2.1563360659.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563360659.git.mchehab+samsung@kernel.org>
References: <cover.1563360659.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

An extension may want to just inform about something. So, add
support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/sphinx/kernellog.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/kernellog.py b/Documentation/sphinx/kernellog.py
index af924f51a7dc..8ac7d274f542 100644
--- a/Documentation/sphinx/kernellog.py
+++ b/Documentation/sphinx/kernellog.py
@@ -25,4 +25,8 @@ def verbose(app, message):
     else:
         app.verbose(message)
 
-
+def info(app, message):
+    if UseLogging:
+        logger.info(message)
+    else:
+        app.info(message)
-- 
2.21.0

