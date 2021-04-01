Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75245C433ED
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:28:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57D77601FC
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238277AbhDAS2L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:28:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:46018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236988AbhDASSo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Apr 2021 14:18:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB4F9610FA;
        Thu,  1 Apr 2021 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617279475;
        bh=Yac+gq42EgnvO+acWY11r9xJy+v6ovzObs2Bl3xQFMA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jaQ6rqAbTXVAZdbcor5siu+sYuEMKc+D1Oc6fgZZdCEH/uMe/XN3VZZbBv7SkQBlc
         C79ZK+R4kcOkPznPcnG77lGnTwDN1Wra/YrSEUVxPihxmv7p+k98f6Zmc7T+1oSv7Z
         yNKYj9H7BV7KIv3vB2qVSUUUccREsJttIxMdqW0qXE8D9M1ZrwjcW4O5iOJAJJho8H
         dLeOg0rAcqKvIGsZM8ps3IPH7/d45Mad0YEZK14W7R1Bt/1IP5ZYljP5h3rUOshP4w
         3+lyOEV5AqgqOM+0/Z04AexxaHFv7BZsCrb8puYkzNAr5B5rFr6lZia047XH+3GArP
         B4guOwN5D3F7w==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lRwGn-001c2V-Lj; Thu, 01 Apr 2021 14:17:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 05/32] MAINTAINERS: update st,hts221.yaml reference
Date:   Thu,  1 Apr 2021 14:17:25 +0200
Message-Id: <a83cf29bbd27b26eb22e0046c41efebf488e7e4d.1617279355.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617279355.git.mchehab+huawei@kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 9a6ac3138258 ("dt-bindings:iio:humidity:st,hts221 yaml conversion.")
renamed: Documentation/devicetree/bindings/iio/humidity/hts221.txt
to: Documentation/devicetree/bindings/iio/humidity/st,hts221.yaml.

Update its cross-reference accordingly.

Fixes: 9a6ac3138258 ("dt-bindings:iio:humidity:st,hts221 yaml conversion.")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index de9637196526..1985d75d59c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8287,7 +8287,7 @@ M:	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 W:	http://www.st.com/
-F:	Documentation/devicetree/bindings/iio/humidity/hts221.txt
+F:	Documentation/devicetree/bindings/iio/humidity/st,hts221.yaml
 F:	drivers/iio/humidity/hts221*
 
 HUAWEI ETHERNET DRIVER
-- 
2.30.2

