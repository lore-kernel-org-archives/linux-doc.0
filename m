Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIM_INVALID,DKIM_SIGNED,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 32B0A7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 14:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbfGZOn4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 10:43:56 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58802 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfGZOn4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 10:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Resent-To:Resent-Message-ID:Subject:
        Resent-From:Resent-Date:Sender:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Sender:Resent-Cc:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BHbEVXmpRXCdh5Jrvlt6ed3il/gE3QsZ5hyzVd7gNN0=; b=Jvcg7aIAyUnNxGRVjLagCFhKVj
        lPwd/rVq7zqtZ87u2irtds/j893QBEAUMQj4EZKSAw/BWP7qXwYEAS/DCklpYWxinwQ4MV11yWpzK
        WHDzwqojYJxFAMHXhmDL+CgrwdMI8KRgXc6yYNe0rCiQKtPhlo3XKpCVWsI6jeir/eqfhtUJ2rTK4
        ul0BpB10fjGWQYNAumKIPoFOy99GsMteH/IpP3KDPuBgp3D6G+Z0HXcfPPWcMatfybpjvzbgm0ee4
        XsvoA8l3n1zXKGBRB+yEF9xW9FrKplIJQqvTsAczGZYsI/yWgEaR2deMcjh5VnyCReRDzvi0+c1eO
        a5ZkrLOg==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hr1Rs-000556-1o; Fri, 26 Jul 2019 14:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BHbEVXmpRXCdh5Jrvlt6ed3il/gE3QsZ5hyzVd7gNN0=; b=bMvgzuQCiAbHtzM7bvL8aWj1vT
 keI3Oppm1KpzKDZeQ7dGI8bMTpYb3wjJLiBlUj0eyY33tvlRvUnLGOGZ1oRii9fjN3ht43VHU/wW9
 Ww7Tv6DIobtE17QAKNCc+FH08p0y1gzVKwHEq9gK9eJYxB8O2y5R9LqqTtXcco/qEGmBx2FE8zcdN
 WyDyXdPBq/evxHIIiLZjSZhiWuBmOMEY/DPbQrvIa3jYmvmvPD/ZpyurRGZEhxHi/LbRhPk857AJ1
 OUhAWz1EpqPLRTBjpKb/KwHnd04y/4wqfDRF49bIWhjmzmjlrroKC3SYx3CRSIpQxs153JASujqTQ
 xODEQqfw==;
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YrgblcWE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CD5C22CBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=mchehab@bombadil.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BHbEVXmpRXCdh5Jrvlt6ed3il/gE3QsZ5hyzVd7gNN0=; b=YrgblcWE+kyoTOgZZvvh5zofhB
 uZbqRqJbem8lv7YXyCnH2vK/3lDTKwX6azTsKnFf1V3mqYDpYiJ3ULMem2qFzFX+uucfqmVvzG7EJ
 e5pnu0uIA42xKh7FKvjBqqjP+Givbbvz8LLfxYhqBeCGoKk2M45j47lBYiWITu3hzu5NeMW28i1+2
 bgumi5U+tFD/ErtMEdhWZyFIYSyIdxdyAeAxhN4LUmGDmST1SSJESSQBLTNA2CdXPLbe2g/sOGq1G
 ws52VM1i6csFzQMeOiA/7t5v71cQwhAG2PIJAk1Zr9wDGZjaBuR+Qyfy6M45rY0mmcNGcqx7Acerd
 PCjIMHKQ==;
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org> (by way of
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>)
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date:   Fri, 26 Jul 2019 08:31:18 -0300
Message-Id: <bb9f486cd7bce8d82cb0a1a7210b9ac1a6571112.1564139914.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564139914.git.mchehab+samsung@kernel.org>
References: <cover.1564139914.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_123146_661343_C1E0AEE9 
X-CRM114-Status: GOOD (  12.13  )
Subject: [PATCH v2 04/10] scripts/sphinx-pre-install: fix script for
 RHEL/CentOS
Apparently-To: <mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
To:     unlisted-recipients:; (no To-header on input)

There's a missing parenthesis at the script, with causes it to
fail to detect non-Fedora releases (e. g. RHEL/CentOS).

Tested with Centos 7.6.1810.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 scripts/sphinx-pre-install | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index f230e65329a2..101ddd00bf02 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -371,7 +371,7 @@ sub give_redhat_hints()
 	#
 	# Checks valid for RHEL/CentOS version 7.x.
 	#
-	if (! $system_release =~ /Fedora/) {
+	if (!($system_release =~ /Fedora/)) {
 		$map{"virtualenv"} = "python-virtualenv";
 	}
 
-- 
2.21.0

