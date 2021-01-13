Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C5DC43381
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 11:02:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2700322210
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 11:02:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbhAMLCK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 06:02:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:38852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727480AbhAMLAv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 13 Jan 2021 06:00:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC5F1233F7;
        Wed, 13 Jan 2021 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610535570;
        bh=a+dkjYxr1JQcyA3F/5+J8go+yX3JsyBH4EIlx2hcACo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fj42FGSOoNm/vx1BoyMwr0HbtVrkNXX4g+/0Kn5WrFhqsx/uueN0rR7dV8BNVPlgN
         1/tuJQgvWGXPDtis3yygXGtPHY7ubK69F7/59fFSMiv/vGuOkYMp0PE6RSeV69N62I
         99BIYjhn4g2YfqGjZYbv2niAIL7N3tkptbaPnTGP9x+TtIZ0hE0SoXb8HiXuwN0gOQ
         vWqFIwR9PZPQ4dY6b5Z7ydBYqFMuRY3nTW412dK2QPwF+mdPBZ7dVKwdhbKrTR8QUA
         hcWyEiuWVsGEHOBFy/LcsAhaiLGw95TLOfOxTxV3ynFMUhffS4tTzBdhneiq9eQURv
         WQoukiHRoTy5A==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kzds7-00DpFw-6a; Wed, 13 Jan 2021 11:59:27 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH 04/24] MAINTAINERS: update dpot-dac.yaml reference
Date:   Wed, 13 Jan 2021 11:59:05 +0100
Message-Id: <15b0ff7bfe9ba7ca6d438e1ca7880061cfce05b3.1610535349.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610535349.git.mchehab+huawei@kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 06d2ff6fe11e ("dt-bindings:iio:dac:dpot-dac: yaml conversion.")
renamed: Documentation/devicetree/bindings/iio/dac/dpot-dac.txt
to: Documentation/devicetree/bindings/iio/dac/dpot-dac.yaml.

Update its cross-reference accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b3fe85038eb8..0ff692445967 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8683,7 +8683,7 @@ M:	Peter Rosin <peda@axentia.se>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-iio-dac-dpot-dac
-F:	Documentation/devicetree/bindings/iio/dac/dpot-dac.txt
+F:	Documentation/devicetree/bindings/iio/dac/dpot-dac.yaml
 F:	drivers/iio/dac/dpot-dac.c
 
 IIO ENVELOPE DETECTOR
-- 
2.29.2

