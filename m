Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 393BC7D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 11:31:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbfGZLba (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 07:31:30 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39244 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbfGZLb3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 07:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=M2hix2Cz4QBH1TZxLrnjUPYGcjN9vCJCLVL+tsv3AQ0=; b=m+xBSOKe3JIRv4dGsVag10+DGt
        ALzyb/lSA9T+50tb+k0xafAJu91Uzj4TCmbynxdYtKXsVHBGvD+W/MRoHXPKiggsP9AeZXUjRbUso
        rhnejv9ioErvFplMfB07gEvShLMdfN4hfFv1NFsjxr7lYuaZnl+D9M9HFED6T/ZFTpj6mFJgIUYiv
        bP0AVUYhr8BESF5C1ZZ6PS/+45nveBi0/DpFqPn/WlgSvekfmV6ujjZ7MSFra4vONgRusmQJgZULq
        WVZUu7VHw+xN39kmT4RaQEqats1J3yplZqYdCihMDUMaCD/Dkz+T5rJzRdynxtTg723RMf/JlVYlS
        zrRGYB8g==;
Received: from [179.95.31.157] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqyRb-0005vE-Nv; Fri, 26 Jul 2019 11:31:27 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hqyRZ-0008E8-Dk; Fri, 26 Jul 2019 08:31:25 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v2 02/10] docs: conf.py: add CJK package needed by translations
Date:   Fri, 26 Jul 2019 08:31:16 -0300
Message-Id: <56508d88b3b142b95dea6a815fbe21b08d784524.1564139914.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564139914.git.mchehab+samsung@kernel.org>
References: <cover.1564139914.git.mchehab+samsung@kernel.org>
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

