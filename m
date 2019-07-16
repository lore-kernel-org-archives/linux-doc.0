Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 04C357D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Jul 2019 12:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732671AbfGPMK7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Jul 2019 08:10:59 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39042 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730754AbfGPMK6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jul 2019 08:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=M2hix2Cz4QBH1TZxLrnjUPYGcjN9vCJCLVL+tsv3AQ0=; b=iOqQTIoW/9X1GjhtPp67FiWHIT
        HOAzM5OaPQf23v/fnrGZvIRqn27/vI9EVz3qLGu3UGf63fZHQg6I+nJvtMFH6Zkj57mOz4q8T/nfk
        /87t2AQ3tcct7i/ytUm+aGJc5I8dDGK4xGtvVLztynJN7kH32jEEwr0WTOrRT05lQo/EO3OER7j1J
        UW8doj13b/yMe8jWLFeWARYONlPbeOucMfv12PaOuTO8O1HTAM7nqV6NnRP2gMdSQlylBAu7OoVpS
        MEi5fL0PW6ZgJUgzlEZYizGVwh5sqtBlE4vGSzSNVw+WLIfTC+OE+ChlSegJ8gHuVmYpJy0sf0pCG
        P7kE36PA==;
Received: from [189.27.46.152] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnMIL-0004hw-9R; Tue, 16 Jul 2019 12:10:57 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnMII-0000Qq-Or; Tue, 16 Jul 2019 09:10:54 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 05/14] docs: conf.py: add CJK package needed by translations
Date:   Tue, 16 Jul 2019 09:10:44 -0300
Message-Id: <1fdd704b783001bb4591d211c8cb09eb57c66dd0.1563277838.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563277838.git.mchehab+samsung@kernel.org>
References: <cover.1563277838.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In order to be able to output Asian symbols with XeLaTeX, we
need the xeCJK package, and a default font for CJK symbols.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/conf.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 13b5f711bddf..fa0a42b47e62 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -277,6 +277,10 @@ latex_elements = {
         \\setromanfont{DejaVu Serif}
         \\setmonofont{DejaVu Sans Mono}
 
+	% This is needed for translations
+        \\usepackage{xeCJK}
+        \\setCJKmainfont{Noto Sans CJK SC}
+
      '''
 }
 
-- 
2.21.0

