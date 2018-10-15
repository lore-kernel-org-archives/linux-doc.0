Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C997C7D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Oct 2018 08:10:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbeJOPyW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Oct 2018 11:54:22 -0400
Received: from o3.31pqt.s2shared.sendgrid.net ([167.89.55.59]:5932 "EHLO
        o3.31pqt.s2shared.sendgrid.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726583AbeJOPyW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Oct 2018 11:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.net;
        h=mime-version:content-type:content-transfer-encoding:from:to:cc:
        subject;
        s=smtpapi; bh=eQZWbOh8GjQh4bMQVjuRDaS9Cc2VSGl4JDV/ayYO8/c=;
        b=k074nSHoUD8AH34BwvzFimNpjI46Nc7oNbqjnpXbvpu33nKiMINfzgVcHiD6dQXaw4zV
        8WXFpVh8OZcJBBAQK5irpsoV2ahkylEkqvQqCwn9zJ4JVSD3qwot9YL+4Hkq0TaOhbt3ip
        ynXMH70LbY/pZVHz1J25Zgv41SSfZUg4k=
Received: by filter0008p2mdw1.sendgrid.net with SMTP id filter0008p2mdw1-16878-5BC44B63-6
        2018-10-15 08:10:11.233043945 +0000 UTC m=+219838.982025439
Received: from korte.land (unknown [146.185.150.169])
        by ismtpd0005p1lon1.sendgrid.net (SG) with ESMTP id YRV2371FSWKZqSfINFPi3A
        Mon, 15 Oct 2018 08:10:10.908 +0000 (UTC)
Received: from mail.korte.land (localhost [127.0.0.1])
        by korte.land (Postfix) with ESMTP id 5FB3C6026E;
        Mon, 15 Oct 2018 08:10:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 15 Oct 2018 08:10:11 +0000 (UTC)
From:   Will Korteland <will@korte.land>
To:     corbet@lwn.net, linux-doc@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs/uio: fix a grammar nitpick
Message-ID: <f4edbcfab23ae1a53499dcdc1db32f1b@korte.land>
X-Sender: will@korte.land
User-Agent: Roundcube Webmail/1.3.6
X-SG-EID: =?us-ascii?Q?cUnx5NqAuhUbAHG4iZ9Vx1BO6oMeAW3Kqk+xSEzhkR48c1futjyLp2=2Fwp8OUBt?=
 =?us-ascii?Q?=2F5X+h1tdyY33lVKbOQVGXUFVojZs8F0c+m=2FUDu6?=
 =?us-ascii?Q?NYw+qodTJDKr4h330FTpaIyvyA30x99D6+4cvZm?=
 =?us-ascii?Q?ksw83VrIuOHeOpnB5R0PLeunZj06m+u=2Fyh12fXO?=
 =?us-ascii?Q?kFzX5dscnqntE9rRkz4IV9PBMvxWbuU6FTwclHY?=
 =?us-ascii?Q?CG6fZESVzSVa+z7wllkmGdOSTmpB2sifrptZ4i?=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch fixes a minor, incorrect piece of grammar in the UIO howto.

Signed-off-by: Will Korteland <will@korte.land>
---
This is my first attempt at a kernel patch, so please let me know if
I've done something silly.  I sent a copy of this a few days ago, but
I can't find it on the public archives - apologies if I've now posted
this twice.

  Documentation/driver-api/uio-howto.rst | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/uio-howto.rst 
b/Documentation/driver-api/uio-howto.rst
index fb2eb73be4a3..25f50eace28b 100644
--- a/Documentation/driver-api/uio-howto.rst
+++ b/Documentation/driver-api/uio-howto.rst
@@ -463,8 +463,8 @@ Getting information about your UIO device

  Information about all UIO devices is available in sysfs. The first 
thing
  you should do in your driver is check ``name`` and ``version`` to make
-sure your talking to the right device and that its kernel driver has 
the
-version you expect.
+sure you're talking to the right device and that its kernel driver has
+the version you expect.

  You should also make sure that the memory mapping you need exists and
  has the size you expect.
-- 
2.19.1

