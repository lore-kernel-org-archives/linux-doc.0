Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D55ECAAD2
	for <linux-doc@archiver.kernel.org>; Mon, 29 Aug 2022 23:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiH2X1F (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Aug 2022 19:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiH2X1F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Aug 2022 19:27:05 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8173380B43
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 16:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=OaZc2la47vx8E0FS0qsEMIEXDCE3CBk13gYUqXeqdYY=; b=if6CKD+ID5vTHVmoiYHIbPUiGg
        Td2xXvwC5YNfttncSiVjnnYaQAvfwBXztLGZX7QvpskhGZ0PsBfRO35ie2hvIxUwYam39S6g5u9oJ
        DPMkqESJuYiNp1moMwijgpVnZlOt0banl9dj73WeBlObr7i1GdWuxFSMTQmuJIIHOZ8+5WPllnqkp
        Ws7LbkJ9wHHfxpduFcO1cOP2I3etr/TY3BMNJrJkAQpPOYItf3eVTY6DI/c4nGKgitUd9IUgN5+DU
        2NZy4OhSZn9ldpceT61U5Z5670BHkLLPd12f34yLNgiXSTA1+IEtjFMLFLVWB8SNrUgLuJ036r4aD
        0cD/LARA==;
Received: from [2601:1c0:6280:3f0::a6b3] (helo=casper.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oSo9j-003V3k-DM; Mon, 29 Aug 2022 23:26:59 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, Jeremy Kerr <jk@ozlabs.org>,
        Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] >>>>>>>>>>>>>>>>>>>>>>>>> BLURB <<<<<<<<<<<<<<<<<<<
Date:   Mon, 29 Aug 2022 16:26:53 -0700
Message-Id: <20220829232653.25060-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix a typo of "or" which should be "of".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jeremy Kerr <jk@ozlabs.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/filesystems/spufs/spufs.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/Documentation/filesystems/spufs/spufs.rst
+++ b/Documentation/filesystems/spufs/spufs.rst
@@ -227,7 +227,7 @@ Files
               from the data buffer, updating the value of the specified signal
               notification register.  The signal  notification  register  will
               either be replaced with the input data or will be updated to the
-              bitwise OR or the old value and the input data, depending on the
+              bitwise OR of the old value and the input data, depending on the
               contents  of  the  signal1_type,  or  signal2_type respectively,
               file.
 
