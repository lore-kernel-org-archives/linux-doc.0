Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B36537DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 01:29:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1757204AbeD0B3v (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Apr 2018 21:29:51 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34240 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756854AbeD0B3u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Apr 2018 21:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=XoFVXFuYs2HKyCyykPTPxYg9I1ujdzoDqUeD85gWxIk=; b=CUzArWpR7PHl2LVSsra/Tv/8K
        zARTa/PUbGWZxMFxDBNkDs5wX/CYgnf2R89wKWI5e55+Mk304XzEA9RJ0CWBilrnOOpL+ZnTuwS1v
        4B8otKLXtG7PXurxNNRot+33RTA+LeNTtx+seahU55U3Wb3GdkAxgFLKHYtMHSNneyBVIA92xOjoS
        6D56APgvLruMZsETXaWnV0dPyYjTq0WDV/zYAzDhzWTdM+U9pQZPS7lBYUQeZ+0grwGfBiWXedLe6
        gOymilHzShJbHBJgooJwMvI0Sy2ULi9g4dWooyMNKjkfInl0gGH1w7+GBp9fMS0mZZPwns17KR66R
        ETDs/KLFw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fBsCl-0002hS-6C; Fri, 27 Apr 2018 01:29:43 +0000
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: driver-api: fix device_connection.rst
 kernel-doc error
Message-ID: <4dcdb5c8-1365-9a0a-81be-893b0d1ea731@infradead.org>
Date:   Thu, 26 Apr 2018 18:29:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Using incorrect :functions: syntax (extra space) causes an odd kernel-doc
warning, so fix that.

Documentation/driver-api/device_connection.rst:42: ERROR: Error in "kernel-doc" directive:

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/driver-api/device_connection.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20180426.orig/Documentation/driver-api/device_connection.rst
+++ linux-next-20180426/Documentation/driver-api/device_connection.rst
@@ -40,4 +40,4 @@ API
 ---
 
 .. kernel-doc:: drivers/base/devcon.c
-   : functions: device_connection_find_match device_connection_find device_connection_add device_connection_remove
+   :functions: device_connection_find_match device_connection_find device_connection_add device_connection_remove


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
