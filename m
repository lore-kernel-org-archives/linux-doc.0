Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C26ECAAD2
	for <linux-doc@archiver.kernel.org>; Mon, 29 Aug 2022 23:29:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiH2X30 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Aug 2022 19:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiH2X3P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Aug 2022 19:29:15 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103CB8B2E9
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 16:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=OaZc2la47vx8E0FS0qsEMIEXDCE3CBk13gYUqXeqdYY=; b=ut5VdAQSCW20WwiX52cz5GLV5l
        SagE5RRhTnCV0D/O5DxwlcDcnxMWTZv3uZMH0/mnlOHfc+mj1eLiIbpuspuL9w953JqEpGUudalQ0
        MA8YHCzoydg94IFvq4Y2bDheKbZhQYlNzpfbgtSslHmINXVPXyhjGuZYJuETFyUksDQ9zGC28wsue
        u7BSHeWYz1lhb9VK58gU9ZPyAj7faA1w/bhfb5IcR+vhlQHsJ9qtwn3/duz//nWLvTW/iT/XlhDqk
        iz+/buwKg2+DCnEF7onNWO71fH+GKTevKBv13ya83gqS2cbLFq0RR2uTJlTELIgdqcu0w7y8vFwV+
        0BNqBKvQ==;
Received: from [2601:1c0:6280:3f0::a6b3] (helo=casper.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oSoBt-003V9R-LQ; Mon, 29 Aug 2022 23:29:14 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, Jeremy Kerr <jk@ozlabs.org>,
        Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] Documentation: spufs: correct a duplicate word typo
Date:   Mon, 29 Aug 2022 16:29:08 -0700
Message-Id: <20220829232908.32437-1-rdunlap@infradead.org>
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
 
