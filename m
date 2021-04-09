Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93202C4363E
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 12:48:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67A5961106
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 12:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbhDIMsW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 08:48:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:41872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233796AbhDIMsQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Apr 2021 08:48:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 602A66115C;
        Fri,  9 Apr 2021 12:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617972481;
        bh=cE6X+3hK7sWHr7WvxY3GzjAZGna/QnNmym0dy1u9Dbk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lEXRXLtwZxxDDNeraC7fq+W2kfph6t0x9BmWg9IyGVb2OT/Re0jr6xbeyRF6OVqvl
         ADo4oAVQJXjRgzd0YqP60N++2MGZC0ZoSQ+uUtPDuGkNHHpxweXcPlrIcMNVFI4q0s
         meHwLWAMV7rXiQOKvoaA4OZ2MQNIqhtDgWtXK8ffJ+kDYXvwI6k2zgt5S/Cr+rtj1X
         szxyZNKKRWQ10UUDszO+zHmHBNPd240Z0YAUjaBmOP8QR6zyqH+pRYCoTqRGvIwoFE
         7qBSrlmsG4MlroFisbrwraYwhNnpV3Nnm9lYf7DI3vY379H/tcCpRkspnTbnkdYPUp
         nLtj5WGzoQS9Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lUqYE-001SLk-78; Fri, 09 Apr 2021 14:47:54 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/8] dt-bindings:iio:adc: update motorola,cpcap-adc.yaml reference
Date:   Fri,  9 Apr 2021 14:47:47 +0200
Message-Id: <3e205e5fa701e4bc15d39d6ac1f57717df2bb4c6.1617972339.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617972339.git.mchehab+huawei@kernel.org>
References: <cover.1617972339.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 1ca9d1b1342d ("dt-bindings:iio:adc:motorola,cpcap-adc yaml conversion")
renamed: Documentation/devicetree/bindings/iio/adc/cpcap-adc.txt
to: Documentation/devicetree/bindings/iio/adc/motorola,cpcap-adc.yaml.

Update its cross-reference accordingly.

Fixes: 1ca9d1b1342d ("dt-bindings:iio:adc:motorola,cpcap-adc yaml conversion")
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
index ebdccfb600b9..b52e7a33f0f9 100644
--- a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
+++ b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
@@ -23,7 +23,7 @@ which are described in the following files:
 - Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 - Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
 - Documentation/devicetree/bindings/leds/leds-cpcap.txt
-- Documentation/devicetree/bindings/iio/adc/cpcap-adc.txt
+- Documentation/devicetree/bindings/iio/adc/motorola,cpcap-adc.yaml
 
 The only exception is the audio codec. Instead of a compatible value its
 node must be named "audio-codec".
-- 
2.30.2

