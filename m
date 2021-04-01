Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F44C43470
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:27:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7179260201
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236870AbhDAS1v (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:27:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:46018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239630AbhDASQn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Apr 2021 14:16:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25D5E6115B;
        Thu,  1 Apr 2021 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617279476;
        bh=384WOEjvOQ1UwovuPrd2XzsN4Te8urLiAUjxdmxdtJE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y2VDXWclBml3XvKo0e7zy2kxZXF+yTXm/FxG8rncHt3o8d7hJukt/OjyNe07si0M1
         H2q0mLJTUuB8Tb0/FAl7vh8xkiah9XK8Dta+EK8pu1rjEp/oDIEYrEkahcrDAvwcE/
         RYfnOicA/19grt0MEEomihH/bG5CjSYv0gVrXVM6YHq8lZFM+jgF6iV3vlhfa1FF/P
         X9SehPFs3xyrcH/akowGq/cdpW0AqfE2XeGD4F1Upp+ymT+KijBJWyNqXfB3hh9TBv
         5GcXtDlD+11RnDNSuB07bh8/dbqRC8LEXWFWTKx/z7A/lvbzEEWdFTXF7nPVk+PIwD
         OHhcmjvSVynMw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lRwGo-001c36-5I; Thu, 01 Apr 2021 14:17:54 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 18/32] MAINTAINERS: update st,lsm6dsx.yaml reference
Date:   Thu,  1 Apr 2021 14:17:38 +0200
Message-Id: <e058dc096c39933eb7647a86c57b3489906c89c3.1617279355.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617279355.git.mchehab+huawei@kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
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

Fixes: 7a2cf8e91390 ("dt-bindings:iio:imu:st,lsm6dsx: txt to yaml conversion")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 97763e68b8e3..54c469933f66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17142,7 +17142,7 @@ M:	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 W:	http://www.st.com/
-F:	Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
+F:	Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml
 F:	drivers/iio/imu/st_lsm6dsx/
 
 ST MIPID02 CSI-2 TO PARALLEL BRIDGE DRIVER
-- 
2.30.2

