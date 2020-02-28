Return-Path: <SRS0=2giX=4Q=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D543CC3F2CE
	for <linux-doc@archiver.kernel.org>; Fri, 28 Feb 2020 00:07:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A15C0246B5
	for <linux-doc@archiver.kernel.org>; Fri, 28 Feb 2020 00:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582848433;
	bh=xqLN7Cu1O7rDNY1EvZk34UdPPiSjm4e5lvNjyJ1idrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=OxPPgKGZoFYFcbkeMF7bRXvHY5J5qmplin8hfJpB5K9ovNVNE0qStPCSVSeOCZx6N
	 DFnbZbTkjYZKoSE448MRLZ8vvluJB6raz4g8RNWu0fo7ijUgwszIsg/3E5VoimRp4o
	 Fcibq+oKD1vc5UmNy97YrKJqOmPzqzojIffk7v1g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729987AbgB1AHN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Feb 2020 19:07:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:60288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729953AbgB1AHN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 Feb 2020 19:07:13 -0500
Received: from kicinski-fedora-PC1C0HJN.thefacebook.com (unknown [163.114.132.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5DAC7246B2;
        Fri, 28 Feb 2020 00:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582848432;
        bh=xqLN7Cu1O7rDNY1EvZk34UdPPiSjm4e5lvNjyJ1idrA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uY0kQp4pamF2e9whtPed8iI9rJnm8pynxTOZ5hURh6VdDKVmS3cPEWm5s0rfIFjx4
         +p1vEyw4rjUNVhHkur+EksXvvo8/l8GXFJnpTWK9O/AwxcjVpYrth2NhysjEoIdqWu
         tUVzHrjTC+N2zojaaiiTM+t90Rw0f6z4jMWhqQq8=
From:   Jakub Kicinski <kuba@kernel.org>
To:     corbet@lwn.net
Cc:     clm@fb.com, hannes@cmpxchg.org, tj@kernel.org, lizefan@huawei.com,
        linux-doc@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH doc 3/5] doc: cgroup: improve formatting of io example
Date:   Thu, 27 Feb 2020 16:06:51 -0800
Message-Id: <20200228000653.1572553-4-kuba@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200228000653.1572553-1-kuba@kernel.org>
References: <20200228000653.1572553-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We need a literal section, like few paragraphs below.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
---
 Documentation/admin-guide/cgroup-v2.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index ab8b91014afb..9d16fbc5df63 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1466,7 +1466,7 @@ IO Interface Files
 	  dios		Number of discard IOs
 	  ======	=====================
 
-	An example read output follows:
+	An example read output follows::
 
 	  8:16 rbytes=1459200 wbytes=314773504 rios=192 wios=353 dbytes=0 dios=0
 	  8:0 rbytes=90430464 wbytes=299008000 rios=8950 wios=1252 dbytes=50331648 dios=3021
-- 
2.24.1

