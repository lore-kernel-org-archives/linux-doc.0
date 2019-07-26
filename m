Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8FF737D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 14:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387449AbfGZOnE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 10:43:04 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58724 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387471AbfGZOnE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 10:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Resent-To:Resent-Message-ID:Subject:
        Resent-From:Resent-Date:Sender:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Sender:Resent-Cc:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BxO7quukxTaSyuSB09D3YN9Itgl2cGbPAIbZRboBaWI=; b=Ewg5jUC4p+TyPQt7DWJ8IP/LCM
        maJatRnMiUyahaQCTRUepMS7TGO4wXlrP2J+8JNALieg+21JH3R4N54isDGJ/SVPcg4/ZCQx5pEUd
        mxdDKFyXPXtBYjaIzTuMiXtyPBqRxzWGG6+eauCTBNzVEbRpncFl5sVzyYY8il5fx+ZdYWfVCHZuN
        FwH1xSxMG520Tw0dDulA8+w97rJVH2W0pKRLV08Gye9Fvw0i6CGkdNgCUNtezt2TMjEvP+Y2JRrDk
        5oooL2AVGrCgP+znnI1F+7YYXnJVCIvrVXweNdelLnsjk/e/t2kANEjO9UnmQ80jFaoBCYOWmVI30
        sike1/kA==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hr1R1-00051s-Ba; Fri, 26 Jul 2019 14:43:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BxO7quukxTaSyuSB09D3YN9Itgl2cGbPAIbZRboBaWI=; b=FP+HeuzFSVU2Vo1APlGqYp0IBl
 2oOUmzbYEq1BM7bhqlWU2cBnucEVT39fB74PV0Zn2fFPGfl8Fr2DrBSE6bX4mkSMuADY/oq7smXiE
 QLn7hxopeiEeYsNMbFaRUQaNVpb+GEAcEzLH0xBHtsOjBAihigmbXPURnIVbUM3FlgfFF7HAVcXV1
 6G2lpRv3FMFgp7zN18OmqaZGKvG8keIfEVhSxhNCyOrfMdXbo8JUjGEN+6fXUquxOpUX4VWi+Dvp2
 JsIIbemK5Mtrj66fe2PdeIOAA/K7i+XHEaUBiPsa8Pqld+yDE5dfBmWpFu7ztKQV2uwXFnkBhqdvA
 Nl1lxUzg==;
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aJ8UqIO8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCD2022BF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=mchehab@bombadil.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BxO7quukxTaSyuSB09D3YN9Itgl2cGbPAIbZRboBaWI=; b=aJ8UqIO8cl70HcOQx+eMYhOazG
 mhK60VZDFoFyCpmD2pZzcAvP3bwd/+OZ8M/YYRMQv43JR/6TbtdL89byC25VjkG6wu+147HQiScAn
 MhVI3GgMbIHLenq3H9QKPXdytkiatPKvnAzUgYm6teiZpx2qowi5UTuEEm5Wsbt3Ug/QTWKlj6K2m
 DjFCIhQeF5eXw85bqegQoyz8rICry/nCqfEFJLZH1+EWiJZcIzU8FaxAVXPP1vlJC/9Dv7wJoJt7K
 V/z/YdzDbtAR4cejdWHDgXhPE+MG1QYOpO+pI2mx3nPTD18vQzx/34+PhlYkaSRA4bvzF64FCmVHh
 XCPpGapw==;
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org> (by way of
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>)
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date:   Fri, 26 Jul 2019 08:47:24 -0300
Message-Id: <a3ef4990a62802bd5aba327cb5ea0258a4c4a278.1564140865.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564140865.git.mchehab+samsung@kernel.org>
References: <cover.1564140865.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_124743_066140_C3647B40 
X-CRM114-Status: GOOD (  10.90  )
Subject: [PATCH 4/7] MAINTAINERS: fix a renamed DT reference
Apparently-To: <mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
To:     unlisted-recipients:; (no To-header on input)

Fix this rename:

	Documentation/devicetree/bindings/i2c/{i2c-mv64xxx.txt -> marvell,mv64xxx-i2c.yaml}

Fixes: f8bbde72ef44 ("dt-bindings: i2c: mv64xxx: Add YAML schemas")
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 17ec9abcce52..ea7ad0d08c96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7507,7 +7507,7 @@ I2C MV64XXX MARVELL AND ALLWINNER DRIVER
 M:	Gregory CLEMENT <gregory.clement@bootlin.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt
+F:	Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
 F:	drivers/i2c/busses/i2c-mv64xxx.c
 
 I2C OVER PARALLEL PORT
-- 
2.21.0

