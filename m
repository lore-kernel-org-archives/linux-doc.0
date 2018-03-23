Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EE9F67D0DA
	for <lwn-linux-doc@archive.lwn.net>; Fri, 23 Mar 2018 07:33:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751388AbeCWHdA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Mar 2018 03:33:00 -0400
Received: from mout01.posteo.de ([185.67.36.65]:53992 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751294AbeCWHc7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Mar 2018 03:32:59 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id D7C9421138
        for <linux-doc@vger.kernel.org>; Fri, 23 Mar 2018 08:32:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1521790377; bh=pq77RawC2ELg11FMgTTZJ7nU++VxGLEc/gsCcp73CfY=;
        h=From:To:Cc:Subject:Date:From;
        b=Yb18XmX7JbGEzX1LEqpsfAhKikTqQMsC6rzLNST7loSIMJaDY2W2zfVWe3q5ojosY
         92ti6/8A4NbUALwoSnGnxSsK7jBrR6SnZzYyl4QE7kVr+3FVK0xdPKN5jjm/uYBFo1
         v/aMG8GpGEKoFb3STGRzjsoHz2QUaEUZU38sWjZ8uxeh1cNms7KDFaOG96tem5S7jy
         Kqxrs/aPtkwZyN5hJOhV9Cbfa5mAmGI3MpjI231S+/p+4uFsQiuLKi1jCwxKqJeVzn
         xUPB6x3LlAQPyHBerhd2iVEq72cYejj/ZG0koW+lOFbeOkUuyDFV7iCmslv9GN0Rb2
         1/dyeWHAM95vA==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 406wHY1dV2z9rxK;
        Fri, 23 Mar 2018 08:32:56 +0100 (CET)
From:   Martin Kepplinger <martink@posteo.de>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH] Documentation: magic-numbers: Fix typo
Date:   Fri, 23 Mar 2018 08:32:31 +0100
Message-Id: <20180323073231.5826-1-martink@posteo.de>
X-Mailer: git-send-email 2.14.2
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This fixes a little then / them confusion.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 Documentation/process/magic-number.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/magic-number.rst b/Documentation/process/magic-number.rst
index c74199f60c6c..00cecf1fcba9 100644
--- a/Documentation/process/magic-number.rst
+++ b/Documentation/process/magic-number.rst
@@ -14,7 +14,7 @@ passing pointers to structures via a void * pointer.  The tty code,
 for example, does this frequently to pass driver-specific and line
 discipline-specific structures back and forth.
 
-The way to use magic numbers is to declare then at the beginning of
+The way to use magic numbers is to declare them at the beginning of
 the structure, like so::
 
 	struct tty_ldisc {
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
