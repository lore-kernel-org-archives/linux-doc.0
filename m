Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B496C43470
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:27:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18D1960C3E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237313AbhDAS1q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:27:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:45708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238924AbhDASPC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Apr 2021 14:15:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCA4961106;
        Thu,  1 Apr 2021 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617279475;
        bh=Ngc69+i6EZ/PhoxqdWipSdrLWrh9Kv/+uf8/4y+gq80=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qn1ox2hA58uzL1YGv6ptaK8q6DBeyzaihUb/HeGoSfURpSDoPVNp4I1snJ3cvKpmB
         1SnZYoMXxwQgtlSJ+WvfXm0E35KDqpWjYxdP9DmGV3fgICRTw8oUeTtxSchdtdMorp
         B6F9U/n+qhbnpsO1DJHTGVXm4I9mfna7gVBAabrmYcsEjAEr6mn+psdyiNAH/dPqwy
         m0Lnd93O1/7xY0aQntrBoeICEYxWaG3mkLcXlms7cHHD8A3GZzAj9xrIoVrvJzlR3H
         Z5a3hHdCnjAuUvuSUBpq6MSt3DISdHHc0oBb78NB+sjsMhvUA7/nugAm9WWhwimwRj
         tpDQ3ARP/NbDQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lRwGn-001c2k-SU; Thu, 01 Apr 2021 14:17:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 10/32] MAINTAINERS: update voltage-divider.yaml reference
Date:   Thu,  1 Apr 2021 14:17:30 +0200
Message-Id: <5006767228ea6392a33e280612599ab5749db021.1617279355.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617279355.git.mchehab+huawei@kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 6f633bc91ac1 ("dt-bindings:iio:afe:voltage-divider: txt to yaml conversion")
renamed: Documentation/devicetree/bindings/iio/afe/voltage-divider.txt
to: Documentation/devicetree/bindings/iio/afe/voltage-divider.yaml.

Update its cross-reference accordingly.

Fixes: 6f633bc91ac1 ("dt-bindings:iio:afe:voltage-divider: txt to yaml conversion")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 71950316c736..5110f47ebf85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8797,7 +8797,7 @@ L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/afe/current-sense-amplifier.yaml
 F:	Documentation/devicetree/bindings/iio/afe/current-sense-shunt.yaml
-F:	Documentation/devicetree/bindings/iio/afe/voltage-divider.txt
+F:	Documentation/devicetree/bindings/iio/afe/voltage-divider.yaml
 F:	drivers/iio/afe/iio-rescale.c
 
 IKANOS/ADI EAGLE ADSL USB DRIVER
-- 
2.30.2

