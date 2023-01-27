Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E092C636D4
	for <linux-doc@archiver.kernel.org>; Fri, 27 Jan 2023 06:40:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbjA0Gkf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Jan 2023 01:40:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbjA0GkV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Jan 2023 01:40:21 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64ED469533;
        Thu, 26 Jan 2023 22:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=6J6Vi0RCPyxDfoC5MKQ9vw5ZM3fRcONntqTYKAAIxtY=; b=lpKOPLkD7r+0WJeIfwAu6uYgaf
        glKSGhhtDkjjDnoz8W1d8hpTwG6ul+6ExLxYfPP4dBciTCgAFsK4GHjo+HEeCf0w5Afw6HEKu0aMS
        6pTubItwg7yslvYxQErJqnWr0Eau7TBYZKtkOktkh2HkUEl40tuP2EJEw3YMPZ1fI5V1Ok2NjKXth
        i/BMADkxf/DpFt/Yn1OdZFQslssDMx708qn+pQeJoYrgadFENLqQiZWTGT8SBnb/2NBJ1un4MPaMq
        vI14843/aGp4g6vXFqXf7EN5KjdmOsE9OmTHun134uz+Rs9vj+o++j4B7Jj/gFBGg4L5PpslvRLeH
        Vf8KYwQQ==;
Received: from [2601:1c2:d80:3110::9307] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pLIPL-00DM0u-2s; Fri, 27 Jan 2023 06:40:19 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        openrisc@lists.librecores.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH 19/35] Documentation: openrisc: correct spelling
Date:   Thu, 26 Jan 2023 22:39:49 -0800
Message-Id: <20230127064005.1558-20-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127064005.1558-1-rdunlap@infradead.org>
References: <20230127064005.1558-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Correct spelling problems for Documentation/openrisc/ as reported
by codespell.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: openrisc@lists.librecores.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/openrisc/openrisc_port.rst |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/Documentation/openrisc/openrisc_port.rst b/Documentation/openrisc/openrisc_port.rst
--- a/Documentation/openrisc/openrisc_port.rst
+++ b/Documentation/openrisc/openrisc_port.rst
@@ -106,7 +106,7 @@ History
 	a much improved version with changes all around.
 
 10-04-2004	Matjaz Breskvar (phoenix@bsemi.com)
-	alot of bugfixes all over.
+	a lot of bugfixes all over.
 	ethernet support, functional http and telnet servers.
 	running many standard linux apps.
 
@@ -114,7 +114,7 @@ History
 	port to 2.6.x
 
 30-11-2004	Matjaz Breskvar (phoenix@bsemi.com)
-	lots of bugfixes and enhancments.
+	lots of bugfixes and enhancements.
 	added opencores framebuffer driver.
 
 09-10-2010    Jonas Bonn (jonas@southpole.se)
