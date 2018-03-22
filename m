Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9C9A47E686
	for <lwn-linux-doc@archive.lwn.net>; Thu, 22 Mar 2018 12:08:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754424AbeCVMHJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 22 Mar 2018 08:07:09 -0400
Received: from mout01.posteo.de ([185.67.36.65]:56824 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752266AbeCVMHI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Mar 2018 08:07:08 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 6B13621067
        for <linux-doc@vger.kernel.org>; Thu, 22 Mar 2018 13:07:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1521720426; bh=kTcrWEsDaNkYMAfNMtBUtGOPvZ//XyFP119uG9nMzhI=;
        h=From:To:Cc:Subject:Date:From;
        b=XdQwjwAKlDkxjCBFhvaXOyE/rgYtK5yB/qaBZECa06FZ8rWZwfIRKuNoHH+5q65W4
         uAc13dtjgKCLUGIy5snAaB4Jk8bdGs1fV5+Ah4j6n+KQPCO2A8D0GCnRAA4uKe1BsP
         dr2O0kiW/+9HQEoTCg7jw8VVYQ3SbZXvp6iTfhp115yxWLt3fPwVaHiaM29nVDTyFN
         210N6FheC3S+Dm5LkEKg3ef1+GL7GIUEiAIM7ljKn5mODj4QsHhDb6N2euKuZnk1xB
         HjdqXLAooCe7k4RlskDPPOLHiAObSabQ5WbpsRxzxAEyPQKIeOehOtKtBGi4ge4QXu
         pG6Aq3lTjhhCA==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 406QQF2nnQz9ry7;
        Thu, 22 Mar 2018 13:07:01 +0100 (CET)
From:   Martin Kepplinger <martink@posteo.de>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH] Documentation: admin-guide: add kvmconfig, xenconfig and tinyconfig commands
Date:   Thu, 22 Mar 2018 13:06:56 +0100
Message-Id: <20180322120656.13644-1-martink@posteo.de>
X-Mailer: git-send-email 2.14.2
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add kvmconfig, xenconfig and tinyconfig to the list of alternative
configuration commands. Descriptions are directly taken from the Makefile.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 Documentation/admin-guide/README.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index 155372b3b57f..02caa7efd5ef 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -218,6 +218,13 @@ Configuring the kernel
      "make localyesconfig" Similar to localmodconfig, except it will convert
                            all module options to built in (=y) options.
 
+     "make kvmconfig"   Enable additional options for kvm guest kernel support.
+
+     "make xenconfig"   Enable additional options for xen dom0 guest kernel
+                        support.
+
+     "make tinyconfig"  Configure the tiniest possible kernel.
+
    You can find more information on using the Linux kernel config tools
    in Documentation/kbuild/kconfig.txt.
 
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
