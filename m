Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 960F87D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 29 Jun 2018 12:52:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S936356AbeF2MwJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 29 Jun 2018 08:52:09 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44341 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936351AbeF2MwI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jun 2018 08:52:08 -0400
Received: by mail-lj1-f193.google.com with SMTP id t22-v6so7211362ljc.11
        for <linux-doc@vger.kernel.org>; Fri, 29 Jun 2018 05:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/KbNEDlhggOCmZJcGGsux/1SDbrIGgH3sx7KEuPsNXE=;
        b=dmYNWNA4C7Bh+hTGNYRc5e4OVT+8hNXSR3bavV0CQ2BcUAg1cKklPoNLZqyyCDhFCe
         euq/XjypqpRQF2Mz3cPXGAOzmh7NFFf+oXWFIggXAJ/yVA+qg/ObXZ2C4Bm0c7RFHQ2x
         1qPue8VTZ5BFk1HDZOHAya0EoLtScOulDExus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/KbNEDlhggOCmZJcGGsux/1SDbrIGgH3sx7KEuPsNXE=;
        b=I1ln36dDX3SsBIxyO5TBDpb8SnctXd4dNlHDQ0TPjuoArHa5yez11bA/kSfrnFML4T
         De5gR2KLvESmIPrO9JDXBqlst6GvqAVgJm15FV9WiyYhittym9J50p1UCdVdh9GAVXeT
         x87salRNkA5vbWhgZ37HoeeepIz7R2yYEJSwjxQg4nR9deowyb8rVqug/l9xyKRc9FLA
         SE7nuf413qzZNRI198+b2DLWAFv77WHbvPsAC5qwyuAz9tNBLqwc9mqEYkS9EHwQG72m
         4cL94XtEx76NvOS8e/KPrjLXN5G1vcBsb3Hn0JcPx0iMeFSTFq3VpOZhyxySTrI69Q7j
         kj+w==
X-Gm-Message-State: APt69E0gB4pjXySgfBlCqtHxnITgUEN2RkPFJNnD1nzUziDLM34JNvE/
        wqcLhN3f751pPkSW7dQWpgj9CGaq1LA=
X-Google-Smtp-Source: AAOMgpfP/8Os7RtswYECEDD1Ss1su0g4M/LTv6BeNduRCitRgabPXGNbunR4+6qaSi5RLQEgwUaYiA==
X-Received: by 2002:a2e:1503:: with SMTP id s3-v6mr10420486ljd.65.1530276726782;
        Fri, 29 Jun 2018 05:52:06 -0700 (PDT)
Received: from localhost (c-2c3d70d5.07-21-73746f28.bbcust.telenor.se. [213.112.61.44])
        by smtp.gmail.com with ESMTPSA id x8-v6sm1532529ljj.54.2018.06.29.05.52.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jun 2018 05:52:06 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     shuah@kernel.org, corbet@lwn.net
Cc:     linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v2] doc: dev-tools: kselftest.rst: update contributing new tests
Date:   Fri, 29 Jun 2018 14:52:01 +0200
Message-Id: <20180629125201.24025-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180629100248.11560-1-anders.roxell@linaro.org>
References: <20180629100248.11560-1-anders.roxell@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a description that kernel config options should be added into a
config file that is placed next to the newly added test.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 Documentation/dev-tools/kselftest.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 3bf371a938d0..6f653acea248 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -156,6 +156,11 @@ Contributing new tests (details)
    installed by the distro on the system should be the primary focus to be able
    to find regressions.
 
+ * If a test needs specific kernel config options enabled, add a config file in
+   the test directory to enable them.
+
+   e.g: tools/testing/selftests/android/ion/config
+
 Test Harness
 ============
 
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
