Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768D9C001E8
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 08:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 559BA613B3
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 08:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347502AbhDGIV3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 04:21:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:48636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239849AbhDGIVQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 04:21:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9347F613E4;
        Wed,  7 Apr 2021 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617783662;
        bh=gL7jGtEhi96FGIQ2JRGJQ0+/8surwRHok3L6CvQcMu0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XdVfZS2bOJSnE6fVIWkM1N7d0/eVXTOPxMJGqyx46bWwMTJNs2LQMSIZjXuqpZ/bU
         aZ/sj+dL+1geKVfnliF9k96KBDKERgcfOAUH8WLS6NtP1aHVC5i389Bix2addgnMPI
         V+Ih7J7I43YYWCQcJQfItMtAZ4tmmXGaObKtQn4i4F2tsL4842HujXud9W2vr/5xBK
         9kyNjGQMY1k6ymuGe19nawnG2DoKcj24zXY/3G8BXUomATC1vJqq7gxYGCWpEXgaw8
         W3Hst38uYTYWdSAQKWy7S3fFX84roajTtEdW/zXGKVy93MOU/HxEnELbnGvIpc6idd
         scITBg0rKLnQA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lU3Qq-005i2a-Nt; Wed, 07 Apr 2021 10:21:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/19] dt-bindings: power: supply: da9150: update da9150-fg.txt reference
Date:   Wed,  7 Apr 2021 10:20:52 +0200
Message-Id: <fe15b988b762d3ec001db6fdb12643808cd3211e.1617783062.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617783062.git.mchehab+huawei@kernel.org>
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset f3332532463f ("power/supply: unify DT documentation")
renamed: Documentation/devicetree/bindings/power/da9150-fg.txt
to: Documentation/devicetree/bindings/power/supply/da9150-fg.txt.

Update its cross-reference accordingly.

Fixes: f3332532463f ("power/supply: unify DT documentation")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/devicetree/bindings/mfd/da9150.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/da9150.txt b/Documentation/devicetree/bindings/mfd/da9150.txt
index f4db2b520327..f488e23478cf 100644
--- a/Documentation/devicetree/bindings/mfd/da9150.txt
+++ b/Documentation/devicetree/bindings/mfd/da9150.txt
@@ -21,7 +21,7 @@ Required properties:
 Sub-devices:
 - da9150-gpadc: See Documentation/devicetree/bindings/iio/adc/dlg,da9150-gpadc.yaml
 - da9150-charger: See Documentation/devicetree/bindings/power/supply/da9150-charger.txt
-- da9150-fg: See Documentation/devicetree/bindings/power/da9150-fg.txt
+- da9150-fg: See Documentation/devicetree/bindings/power/supply/da9150-fg.txt
 
 Example:
 
-- 
2.30.2

