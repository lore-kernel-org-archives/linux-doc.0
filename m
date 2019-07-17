Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 56B057D90F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Jul 2019 11:05:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbfGQLFi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Jul 2019 07:05:38 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47042 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbfGQLFh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Jul 2019 07:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ra0xbYPSU+4H3pFb2eOnhM3NB1hvssFTkUjTKCV0aRM=; b=hxXHWaQwBHdzR+WT6Jzaeq2c1L
        CCVLEevN87ljhlBPSSCTH6tVr/eeYk0TIhfdXXIA/Yjdl17Wi0jUoEAkVhBjMX2olq+DgHn+HkH9J
        GgucNMzEoFGJGW0lfFqeygXhmbCqPavcZM0S7+k/ETxwgfvQ4W1oCW68KQonUNPvTFregSzCG/HRN
        LGR7yvnQhOsS7LyR2KpvKqDoriLEH3cTI57raPSnaWjHWgOF2xaf7zM9bFFGCDBsFL1ZYNMuyRy5G
        JL2CBfAn3xvftqqXmLdbFUSDWcBN2tUmnaUte6bZzrCaLgrMgXsZfaHYOml/uA6VH5RpMh71WnjfB
        3Up7BQQQ==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnhke-00054S-RX; Wed, 17 Jul 2019 11:05:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnhkc-0003A4-U1; Wed, 17 Jul 2019 08:05:34 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 17/20] docs: ABI: create a 2-depth index for ABI
Date:   Wed, 17 Jul 2019 08:05:30 -0300
Message-Id: <162d163bbf8bd15f589ffc7167d1ad1490218b40.1563360659.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563360659.git.mchehab+samsung@kernel.org>
References: <cover.1563360659.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

That helps to identify what ABI files are adding titles.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/admin-guide/abi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/abi.rst b/Documentation/admin-guide/abi.rst
index 3b9645c77469..bcab3ef2597c 100644
--- a/Documentation/admin-guide/abi.rst
+++ b/Documentation/admin-guide/abi.rst
@@ -3,7 +3,7 @@ Linux ABI description
 =====================
 
 .. toctree::
-   :maxdepth: 1
+   :maxdepth: 2
 
    abi-stable
    abi-testing
-- 
2.21.0

