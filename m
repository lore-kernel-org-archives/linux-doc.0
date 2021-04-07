Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E1AC433B4
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 08:21:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 894FB61363
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 08:21:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346944AbhDGIVS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 04:21:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:48216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237439AbhDGIVL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 04:21:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 453C9613A0;
        Wed,  7 Apr 2021 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617783662;
        bh=Bfh0vLlmRAVdyPU4dpneOmQxWEVy3QVZB51kIaWuNIk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j/dpKWaHSM0jWi9xx/2/i1dDTXIeNXl5gCznn3gIZztwZL7re1vAHcin29JYD8WxH
         NJinLfn+RjA/xMkELZHP/B3ozHWSCgtca3u72aL+WqIRTAo+nukFg7qnj4TmSsdzL4
         NYEOXg2+qqgSoESNW/P4d28sMAumUbEdNNnls0qrF2sDcXl+QV3dsxyYoJ1Mhxwqsa
         FZFvKkxH4GLAnzaeZJwtMfey2nN90BezUB0Ja81kYbWPnlwvaLI2WN3fs21XDHQVk8
         hmqILmRyNMTEvyDA6XcCdGpzjvCBBKBb6D+lLYtF3EAk+aLuSrmeRMnjTAD+QxuNek
         R8b5y8BDm7jUw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lU3Qq-005i28-8B; Wed, 07 Apr 2021 10:21:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Maxime Ripard <mripard@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Rob Herring <robh@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/19] MAINTAINERS: update brcm,bcm-v3d.yaml reference
Date:   Wed,  7 Apr 2021 10:20:41 +0200
Message-Id: <df6af25cdf42e7aaa497edb234d72721ed8a0773.1617783062.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617783062.git.mchehab+huawei@kernel.org>
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset cb18a7979a35 ("dt-bindings: gpu: Convert v3d to json-schema")
renamed: Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
to: Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml.

Update its cross-reference accordingly.

Fixes: cb18a7979a35 ("dt-bindings: gpu: Convert v3d to json-schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 92e5039b90ba..16a9c89755f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6069,7 +6069,7 @@ DRM DRIVERS FOR V3D
 M:	Eric Anholt <eric@anholt.net>
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-F:	Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
+F:	Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
 F:	drivers/gpu/drm/v3d/
 F:	include/uapi/drm/v3d_drm.h
 
-- 
2.30.2

