Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EA52E7DBEB
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Jul 2019 18:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbfGISdb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Jul 2019 14:33:31 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56706 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbfGISd3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jul 2019 14:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=lzQ/Qjq/0woNC8ClcMRNgoEEfKANaxJmJlDwa4T4CLc=; b=NNZ9GSnw0hdHQEGJT9P/SwJAgp
        u98wRrDmFVTSn1yrcdIUphxXQFKE9oxw3BhKyeSEjnVAq+dmMfvxpDaRO2XG8y/1KIy+WJGRxDlLs
        PknPGci3TcEIt5QLTDIl7WqrGyd6sdo+XfbXyIaaKqP2WPXpD7DOd1MXd1onXvh6QFEwgtYdtNpx+
        DiqQa01J2K0J0lc6yn/hojGkMfypjlGPBe15ppXWwQoQT320trXN8SC9yJv9zFB7A4eJ5DnB0q92s
        TFFxaASZWMGIOWZgHPYd6GdqGnDFU6GlmvOpKa8QIm/5EZYqZ41PSX8tr7xqOTdwGR2McsizzgTl3
        gZcxOZtg==;
Received: from 177.43.30.58.dynamic.adsl.gvt.net.br ([177.43.30.58] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hkuvf-0007At-Bj; Tue, 09 Jul 2019 18:33:27 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hkuvd-0005Q1-7i; Tue, 09 Jul 2019 15:33:25 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 5/5] docs: conf.py: add CJK package needed by translations
Date:   Tue,  9 Jul 2019 15:33:23 -0300
Message-Id: <545902a588b76f18cba035700fc0835067e9a1f8.1562696797.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1562696797.git.mchehab+samsung@kernel.org>
References: <cover.1562696797.git.mchehab+samsung@kernel.org>
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
index 191bd380c523..e0e1f087d351 100644
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

