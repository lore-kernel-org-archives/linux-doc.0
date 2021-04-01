Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4BCC433B4
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:27:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA94060BBB
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:27:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236600AbhDAS1i (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:27:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:45702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238881AbhDASPC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Apr 2021 14:15:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB70F6120B;
        Thu,  1 Apr 2021 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617279476;
        bh=aIaHOdFey7Z7GKG0WRgu6xNsU+0S+q6J6KdRUfFekW4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ohuR04tBW6By1uQ9X4BJ/dxUkto+wUBuccw31LCX8m2nQDXv32ZKMHTyw02lBrGAr
         7fFO61qnp6Lo6c6HKDiDYw7B/8KgCtoTitRYvcS5nGg7PMI3JfFwe8t2X9h0JYpjfg
         aSAXbHDCXko1nXIkoDc+DI7QpLqp5ng1Hl81ATruiB2ioL0VVljGlI7XGq/7+k54+7
         uyAAyxb4UUxjMBX0AjG+ihWGehw1/3cps3a776aTLPun8f2Oj8DqX90Sz8fcMVLQMA
         c1lObDl8pHcoyReRD/IcpF2KiHDoxoV408yHKMhDmA7cM1zSdrPyEcUokievyzHwe0
         VRMafKYPf9ohw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lRwGo-001c3h-L3; Thu, 01 Apr 2021 14:17:54 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "Jonathan Corbet" <corbet@lwn.net>, Andrew Lunn <andrew@lunn.ch>,
        Benedikt Spranger <b.spranger@linutronix.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Hyunchul Lee <hyc.lee@gmail.com>,
        Namjae Jeon <namjae.jeon@samsung.com>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steve French <stfrench@microsoft.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 30/32] Documentation: net: dsa: update configuration.rst reference
Date:   Thu,  1 Apr 2021 14:17:50 +0200
Message-Id: <a3d52c1380624f34b4a04e9698f67e1e6d8d23f8.1617279356.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617279355.git.mchehab+huawei@kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The file name: Documentation/configuration.txt
should be, instead: Documentation/networking/dsa/configuration.rst.

Update its cross-reference accordingly.

Fixes: 75b8988dfe83 ("cifsd: add server handler for central processing and tranport layers")
Fixes: 58dd7a8d9d02 ("Documentation: net: dsa: Describe DSA switch configuration")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/filesystems/cifs/cifsd.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/cifs/cifsd.rst b/Documentation/filesystems/cifs/cifsd.rst
index 48ae58f2a53c..082a839535e7 100644
--- a/Documentation/filesystems/cifs/cifsd.rst
+++ b/Documentation/filesystems/cifs/cifsd.rst
@@ -114,7 +114,7 @@ How to run
 	# ksmbd.adduser -a <Enter USERNAME for SMB share access>
 
 3. Create /etc/ksmbd/smb.conf file, add SMB share in smb.conf file
-	- Refer smb.conf.example and Documentation/configuration.txt
+	- Refer smb.conf.example and Documentation/networking/dsa/configuration.rst
 	  in ksmbd-tools
 
 4. Insert ksmbd.ko module
-- 
2.30.2

