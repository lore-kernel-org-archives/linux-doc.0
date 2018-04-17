Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 716B67DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Apr 2018 08:46:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751147AbeDQIqh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Apr 2018 04:46:37 -0400
Received: from mail-lf0-f67.google.com ([209.85.215.67]:39101 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751200AbeDQIqg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Apr 2018 04:46:36 -0400
Received: by mail-lf0-f67.google.com with SMTP id p142-v6so26107949lfd.6
        for <linux-doc@vger.kernel.org>; Tue, 17 Apr 2018 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=7QlVE/s672ZCt8UJQeo4tSlJRX61dgdTz8elUaRSHl8=;
        b=jv9+NAN8pnECZ9E04CUT1qx0hv2+BairioL8oQ1VEQqFu7H23y2CcXKwLLkLlWsPIu
         vwgSejkIs3hs0HP/NjPqsqGT2Ves3W0LvAK0QlZauKoUIg88NV/5a5ykQy5YexLVRK9y
         UjUyLdrAmp712cg8LNU2FdxY+pnAiDT2sxl9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7QlVE/s672ZCt8UJQeo4tSlJRX61dgdTz8elUaRSHl8=;
        b=bftoSbgZ9BEa0a+e8+xlmEuMNbLibbQwLKMEyJHrbgalTGizTQZBjDFwKzzMVjvudB
         XrucSYdp2DF8+yLWJ/D2AH6TpNlt19+Si+v/6bzcp7bjmjeBNTbGLUHgjIHVszyJl6hm
         Vh+gRUoFkPl9By6mKfS806nso75QJ8TcJcejEtZEwAtnKKd7t21fo4eUj2LZHUCm6tPJ
         G/bw3WQdodF9R9+G79xq7DoEFqBh+ajLIYyYDw6NxkTPL1x/q0OHqAS7wd+WE48nNfxw
         +V3cOJ3s4HLBEVh3l4SFBrqZwNLW83o5lqia4evb3/tK032/g34N8w7NlRKBBt+lB0Cp
         A6IQ==
X-Gm-Message-State: ALQs6tBzQ1I2bfCqp/h4wcoClWeWSP2alJeTmzKs5MyOu/HeV4LRXQVb
        wP2MQItXLtJx+OLgSMB6fH6ZJg==
X-Google-Smtp-Source: AIpwx4/M/6GIx15no2mpv6rysu9mc8huYyP2J9DcfdCU3H5tGRUTAAeCDRv2oq81mhEVRWEO1xYG6w==
X-Received: by 2002:a19:974e:: with SMTP id z75-v6mr956739lfd.41.1523954795370;
        Tue, 17 Apr 2018 01:46:35 -0700 (PDT)
Received: from localhost (c-4c3770d5.07-21-73746f28.cust.bredbandsbolaget.se. [213.112.55.76])
        by smtp.gmail.com with ESMTPSA id y1-v6sm74768lfg.88.2018.04.17.01.46.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Apr 2018 01:46:34 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     shuah@kernel.org, corbet@lwn.net
Cc:     linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] doc: dev-tools: kselftest.rst: update contributing new tests
Date:   Tue, 17 Apr 2018 10:46:31 +0200
Message-Id: <20180417084631.11242-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a description that the kernel headers should be used as far as it is
possible and then the system headers.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 Documentation/dev-tools/kselftest.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index e80850eefe13..27f08d6ba91c 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -151,6 +151,9 @@ Contributing new tests (details)
    TEST_FILES, TEST_GEN_FILES mean it is the file which is used by
    test.
 
+ * First use the headers inside the kernel, and then the system headers. The
+   internal headers should be the primary focus to be able to find regressions.
+
 Test Harness
 ============
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
