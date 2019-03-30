Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2A08F7D04D
	for <lwn-linux-doc@archive.lwn.net>; Sat, 30 Mar 2019 13:46:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730857AbfC3NqE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 30 Mar 2019 09:46:04 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58786 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730832AbfC3NqE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 30 Mar 2019 09:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WhTYYcLYB0qKAESlP/uiHPBljgf2X5519zWL0dGBM+k=; b=UxFCxcwaUC3N8dqcdz7b/RzRN1
        pywQ4Td53QQTVlNrzkGpDx1tASqDReJzphm/DtXX2XCu9X1yEUMiJH8rpNwC5sexmfwxgsjjyRoi2
        84vJVSPoErLyR5Ptq6Zq1rXrfAstFF9DD6miQXn5JcAQ+LATcBqYSSjpWzQwAzgWia4u1XTXcOx/k
        5eMtYOTHdyW9NzjtXgwf4b9M0l4JGFFt0cGMEijrw0oGpEp6SNgOeT7KEVd9ZShUVgOZjHp7na6Vo
        Vk0Tx90KzBqrT7nqJ3IAtmxDimmE7iRd0F8Yhe0Hcf1l7DNZ+VU/mS9jPWlSMh4L5smqBLucQPhGb
        FW67yxhA==;
Received: from [179.95.36.211] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hAEJ9-0003vT-Ny; Sat, 30 Mar 2019 13:46:03 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hAEJ6-0007P9-RR; Sat, 30 Mar 2019 10:46:00 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/2] docs: scripts/sphinx-pre-install: suggest latexmk for building pdf
Date:   Sat, 30 Mar 2019 10:45:59 -0300
Message-Id: <71c5daeccf3f874f766c2c0995bcae3991f86eb1.1553953553.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <bfcc25db0c687797697d4ad71703ff8449072fad.1553953553.git.mchehab+samsung@kernel.org>
References: <bfcc25db0c687797697d4ad71703ff8449072fad.1553953553.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The usage of latexmk improves the PDF output, as it re-run
xelatex when it detects the need, in order to properly generate
indexes and cross-references.

As this is not a mandatory requirement, only suggest its
addition.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 scripts/sphinx-pre-install | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 067459760a7b..f6a5c0bae31e 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -532,6 +532,7 @@ sub check_needs()
 	check_program("dot", 1);
 	check_program("convert", 1);
 	check_program("rsvg-convert", 1) if ($pdf);
+	check_program("latexmk", 1) if ($pdf);
 
 	check_distros();
 
-- 
2.20.1

