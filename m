Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B16ED7DBEB
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Jun 2019 17:25:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732017AbfFTRZc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Jun 2019 13:25:32 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52558 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732136AbfFTRXT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jun 2019 13:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=on49LFR2Mxa07GhXxgZ7Axcy6mlw0U0fiTcIyAPkMAk=; b=YPkpJAIpGQMQfc5faRF5FHf8IZ
        8XeC2gTc+FRWyfhRprr/mUK+llm6SKupMaDRo5sAowYzGp8BoLVVqOUy6qJzblhnmuFcKsn1/ca3q
        8l1uI4zihdrTsrLhrCnI4yQJUbMvge2atsNbcSvYeceA+mEY6TDPKJOp43PKHSTgDEdsfZP+FUe25
        guAD/lMXNdYwOzIXtSECWKoeC3NlWob2yYvuXL2LCAGEkLO88AChfTiBwD8tgwSHrCLl7f56DtFH3
        qBXJvN9O7yeTaHhxNWJ0nT7kwRlR/CO1lbqTpHVNRiPB8J3K7oZqK+7zmmQx8Fvi0JwFD0j85Cpvd
        u2foQehg==;
Received: from [177.97.20.138] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1he0mM-0008S3-Fj; Thu, 20 Jun 2019 17:23:18 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1he0mJ-0000DK-QJ; Thu, 20 Jun 2019 14:23:15 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 11/22] scripts/get_abi.pl: add a handler for invalid "where" tag
Date:   Thu, 20 Jun 2019 14:23:03 -0300
Message-Id: <1b6ffc81e3c02368eb3e363cdd64acb1d1b87d32.1561050806.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561050806.git.mchehab+samsung@kernel.org>
References: <cover.1561050806.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The ABI README file doesn't provide any meaning for a Where:
tag. Yet, a few ABI symbols use it. So, make the parser
handle it, emitting a warning.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 scripts/get_abi.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index 329ace635ac2..c5038a0a7313 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -92,6 +92,12 @@ sub parse_abi {
 				}
 			}
 
+			# Invalid, but it is a common mistake
+			if ($new_tag eq "where") {
+				parse_error($file, $ln, "tag 'Where' is invalid. Should be 'What:' instead", $_);
+				$new_tag = "what";
+			}
+
 			if ($new_tag =~ m/what/) {
 				$space = "";
 				if ($tag =~ m/what/) {
-- 
2.21.0

