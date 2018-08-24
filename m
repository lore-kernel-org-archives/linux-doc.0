Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 27A6E7D584
	for <lwn-linux-doc@archive.lwn.net>; Fri, 24 Aug 2018 12:48:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726848AbeHXQWz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 24 Aug 2018 12:22:55 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33187 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbeHXQWy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Aug 2018 12:22:54 -0400
Received: by mail-lf1-f68.google.com with SMTP id c7-v6so6621010lfe.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Aug 2018 05:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=2FHUghnZPnzW+Olj0z+RL1R23rMcP/IaxBNeVxcPJeo=;
        b=an/dob+c5UePlzOnJ3RH1TjdMkTjpEP1xtFfO4nhLCQIxIExqyZeU3M6XIrl4hQouQ
         BESzwmlxZ8bytCUxocpoMvBQULtnLGo2AXmkQy5cdR5CkQlBF8ykmZEzhKMg2Fi3MJEv
         tgzM0h8wfwtujccfTz4C/svQYUwRqoa6cZuS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2FHUghnZPnzW+Olj0z+RL1R23rMcP/IaxBNeVxcPJeo=;
        b=k9G4vQhb0NvRpAYLId7dOWMJ/i5ofNfXTb2+xpVIiU4RxllbjqDxjiWkqY4K9DwyJc
         78vOcXh4UaAHAD6KgdMIe7yiRAUXs2jvz78vqHgc6kSpKzjQR+i/j9u7uinelriOBD8u
         pMH2C7IvoNHAYljRsrJEcVWY+vXGq3EbmQuCtoTfu+HOKIjhPK/is822NOT7QC6Xb/6S
         ZDkDO4ye+qCEHnnFDwt/WheXUusKAjcTISwESHz+OeIMJQO33lXzL8SWxDDE6CBgueIY
         ZB/q/RKLlq8Y0A+IeY8ucx0uXwLMHcYHYFSHy7V3dNCV4kymOkJJN0ONs9lOHm+qqi18
         et5Q==
X-Gm-Message-State: APzg51Dr53rhJFtNt40JnZAIW1WPBFlHXzt6b+Wdn4aCr4Xe53ukGH9V
        vzHUrZjRL9bxsOwnmrLYUAA59g==
X-Google-Smtp-Source: ANB0Vdan0hg2dSNyOIng4AGXxUtWS8u+vA2eYGMxHWfejlKLKjYhcB48cu8Bsz/1mYakbAcOrxx+9g==
X-Received: by 2002:a19:a685:: with SMTP id p127-v6mr1254558lfe.143.1535114901827;
        Fri, 24 Aug 2018 05:48:21 -0700 (PDT)
Received: from localhost (c-4c3770d5.07-21-73746f28.bbcust.telenor.se. [213.112.55.76])
        by smtp.gmail.com with ESMTPSA id y85-v6sm1324298lfi.46.2018.08.24.05.48.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Aug 2018 05:48:21 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     shuah@kernel.org, corbet@lwn.net
Cc:     linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] doc: dev-tools: kselftest.rst: update config file location
Date:   Fri, 24 Aug 2018 14:47:44 +0200
Message-Id: <20180824124744.9842-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Config fragment files should be placed in
tools/testing/selftests/<testdir>/config

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 Documentation/dev-tools/kselftest.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 6f653acea248..dad1bb8711e2 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -159,7 +159,7 @@ Contributing new tests (details)
  * If a test needs specific kernel config options enabled, add a config file in
    the test directory to enable them.
 
-   e.g: tools/testing/selftests/android/ion/config
+   e.g: tools/testing/selftests/android/config
 
 Test Harness
 ============
-- 
2.11.0

