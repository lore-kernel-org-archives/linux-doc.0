Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E921C433E6
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 11:02:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5778C2333F
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 11:02:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbhAMLCL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 06:02:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:38848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727460AbhAMLAv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 13 Jan 2021 06:00:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9DB8233EF;
        Wed, 13 Jan 2021 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610535570;
        bh=cP2PAjL0wXmVMbF1/NvxliecGhMDO/7PBXxWnPX/VSc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rBBLXRqimkazNuX73miRF5uLgGq1ISNSJ5bt/cfVoLVTt4NqVta2D6p2mZ0glM3Ka
         wGSNcEET26q6HY71anlmDLrANt0Ur692bYVyqpVyrmqySMngxlmQpK7B9HsEqd5GJU
         45wbm1DH4/fLq9XbmE3vw2pcBNs8+cbvVh8PO8O8R6RI7vRlysxCskfiuqJ/Yoa7aU
         HjQ208auZh1AnogHBQxPPAL50xkc4+MmHMYG5szSgFMZ8+7AWOauCcNb9/V5YjYXwy
         5SA5O3UIVfHIg+u47QOrtvgBeYGS+f3Y4M6TJhK0SV5QJhx74/SG3q+r6QlAGb+1si
         OnLHA003/BX5w==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kzds7-00DpGM-G3; Wed, 13 Jan 2021 11:59:27 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH 13/24] MAINTAINERS: update st,lsm6dsx.yaml reference
Date:   Wed, 13 Jan 2021 11:59:14 +0100
Message-Id: <a11cd7f95f0cd2890bde4c7747b4e0481eb7b506.1610535350.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610535349.git.mchehab+huawei@kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 7a2cf8e91390 ("dt-bindings:iio:imu:st,lsm6dsx: txt to yaml conversion")
renamed: Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
to: Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml.

Update its cross-reference accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e5d2f3ef659c..bba2d2d8576a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16877,7 +16877,7 @@ M:	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 W:	http://www.st.com/
-F:	Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
+F:	Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml
 F:	drivers/iio/imu/st_lsm6dsx/
 
 ST MIPID02 CSI-2 TO PARALLEL BRIDGE DRIVER
-- 
2.29.2

