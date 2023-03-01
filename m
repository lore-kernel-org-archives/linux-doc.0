Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C1CC7EE32
	for <linux-doc@archiver.kernel.org>; Wed,  1 Mar 2023 01:22:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjCABWk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Feb 2023 20:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjCABWi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Feb 2023 20:22:38 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB23534015;
        Tue, 28 Feb 2023 17:22:08 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id h6-20020a9d7986000000b0068bd8c1e836so6719531otm.3;
        Tue, 28 Feb 2023 17:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677633728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ut1wOGTxZO1SVGZaQtP1Hekk5rmZBOrU7xQMiC2fKDs=;
        b=W4wRXOLhsnVooDYCrmojCs6Pe5EL4K+vZIYoy/HLdfU/5GEcS/f3t+FnLUSz5CUZbd
         WMVzgpgWwIalHDEHbIixOUUiPEzwkOAcvR7DzsoXP+yivjHIK80NSNu38us66AtKAjqZ
         +58JcS/A4uezef9N3GemiNSFu48/IAnye8LNQd8+O3GeW9QIb6Mq7XWiRE3Mh5oNVgJF
         9DYd74QIBmDFsa9dGm3Q273vcj+ZriuUIS5YwRiyGP5nzUx8aEoPFacEPbjBgxlmgz7r
         OY97ZLQAGwH8u42SjktGKmlUfAhXX53mZFtsh//SkEKBENPaRa1QjyuOKUBl555vLkDQ
         XOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677633728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ut1wOGTxZO1SVGZaQtP1Hekk5rmZBOrU7xQMiC2fKDs=;
        b=VUFHSpjdDufK9CbsBPdhRWDGE5nVIjAB/QUSA7Teh/JI2GBM3sougzbEz1Cz9UtIHM
         yiNIdmGZvrWSsHO2M1UBa1/24QnWueBzPAnv24Ca9KU/HNASFFgBxI/ckUbaJSJIjJYG
         1fd8t7GRATKrCDsNboFJKEHuNlOiBLPWcN4PLSapR82w+F7KlQNMthuXO3oj9U3/vq5C
         yanMvrGrjZBwMlN8ArWlvxkxX1npHRqrYm7BARYAE8xhp6ocxB3vAoDG6Ji63LDBCM+s
         9X81sR6qEBMeP6fhmvVCljsnZWqzMBOanDGmoxk824+T+o8Xd0777I50qesm2iyhXsGV
         f/+w==
X-Gm-Message-State: AO0yUKU+TVIuQKv5cAN/Dk/A009IVS+CTTz5GGzumvAInDoiEzv9aDGS
        igXJX9cb/VUymsnLcGOBQCM=
X-Google-Smtp-Source: AK7set9l7pqGid3dlHIOJ92ewrX2ZoDZzzoy37WHpw1fTL9zt4ey8pg9dXGE0TW61TC8ao4Okx+RSA==
X-Received: by 2002:a9d:729c:0:b0:693:cf97:c103 with SMTP id t28-20020a9d729c000000b00693cf97c103mr2244762otj.37.1677633727863;
        Tue, 28 Feb 2023 17:22:07 -0800 (PST)
Received: from xps8900.attlocal.net ([2600:1700:2442:6db0:20c1:2bed:d8f3:84d8])
        by smtp.gmail.com with ESMTPSA id v2-20020a056830140200b006864b5f4650sm4436362otp.46.2023.02.28.17.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 17:22:07 -0800 (PST)
From:   Frank Rowand <frowand.list@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 2/2] of: unittest: add of_unittest_stackdump to kernel documentation
Date:   Tue, 28 Feb 2023 19:21:16 -0600
Message-Id: <20230301012116.1488132-3-frowand.list@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230301012116.1488132-1-frowand.list@gmail.com>
References: <20230301012116.1488132-1-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add new option of_unittest_stackdump to the documentation admin guide.

Signed-off-by: Frank Rowand <frowand.list@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6221a1d057dd..98c3fc7f4f72 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3911,6 +3911,10 @@
 			This can be set from sysctl after boot.
 			See Documentation/admin-guide/sysctl/vm.rst for details.
 
+	of_unittest_stackdump	[OF]
+			Do not skip OF unittests that trigger a kernel stack dump.
+			Default: skip the tests that trigger a kernel stack dump
+
 	ohci1394_dma=early	[HW] enable debugging via the ohci1394 driver.
 			See Documentation/core-api/debugging-via-ohci1394.rst for more
 			info.
-- 
Frank Rowand <frowand.list@gmail.com>

