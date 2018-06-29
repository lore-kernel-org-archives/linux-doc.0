Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D45BA7D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 29 Jun 2018 10:03:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754838AbeF2KDB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 29 Jun 2018 06:03:01 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37778 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752883AbeF2KDA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jun 2018 06:03:00 -0400
Received: by mail-lj1-f196.google.com with SMTP id c11-v6so6849078lja.4
        for <linux-doc@vger.kernel.org>; Fri, 29 Jun 2018 03:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=wgVrrkJBad/iLo8AmZQyV2DAb2LeoFfhBrqh9sChX3c=;
        b=BdkV+KnLaIHKZoXRMluaxw0L1sbB1xztVw+QDrv3bjV8oJHbTepE+WZPJgCAKVljIg
         Dzp9cfcrrDViE/Nn36WaXJIT14swOmk4VQLvxFMZKRv+3i9x7IPQiBjWMfXeWDbrDU3a
         hMaCuys6oon8epHjSqhHQUBBVPJ/t4M41Jo90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wgVrrkJBad/iLo8AmZQyV2DAb2LeoFfhBrqh9sChX3c=;
        b=G5EzqWqVSHkDXUXWSrIWaD5cGeEVhB1VEwVWtgTLFB3oij6hd3NsaczQbVZHZnVJ2u
         B5C3DC/DHYC+IjW4bDMWnWmQ3xh18Zn8qppe02IFrJbjGXLSUeBC9MI10hZ++iybJgDG
         kqvDqllJsVVFVf+qSORTwovDlnlYqzS33e5u8yVcxuNyqxktJs8mKqetSEgiDf++95vE
         q/EJzPAG0W0L3AJO77YOp80RdmW09x9TMEdVDjKahipSHJS1LET3Lya5iM9fQng6uvzt
         ldUXgj3o4fmDdp0WP3cI3x2AFhuCbSrFkeuN1ZtrXHECsTssxYWkbX9S7mc1swJoTiQG
         RThA==
X-Gm-Message-State: APt69E261DKaiZysOmyTjVJpJncIn5K2y9yCIah0VG2QSJBPngynNhRt
        lf5ZQDbTXzdUdpFu+dhhcfzIyA==
X-Google-Smtp-Source: ADUXVKLvSVazqGZxZNmEHvFse5jMC+VxZmuWxBZzAUeRV4XG3bTVIlocgXna4vIFqlfp867LhfNKqw==
X-Received: by 2002:a2e:6d11:: with SMTP id i17-v6mr10148179ljc.116.1530266578594;
        Fri, 29 Jun 2018 03:02:58 -0700 (PDT)
Received: from localhost (c-2c3d70d5.07-21-73746f28.bbcust.telenor.se. [213.112.61.44])
        by smtp.gmail.com with ESMTPSA id s5-v6sm1487387lji.46.2018.06.29.03.02.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jun 2018 03:02:57 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     shuah@kernel.org, corbet@lwn.net
Cc:     linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] doc: dev-tools: kselftest.rst: update contributing new tests
Date:   Fri, 29 Jun 2018 12:02:48 +0200
Message-Id: <20180629100248.11560-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a description that kernel config options should be added into a
config file that is placed next to the newly added test.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 Documentation/dev-tools/kselftest.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 3bf371a938d0..4c546a35bd58 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -156,6 +156,9 @@ Contributing new tests (details)
    installed by the distro on the system should be the primary focus to be able
    to find regressions.
 
+ * If a new test needs specific kernel options, they should be enabled in
+   then config file in the same directory where the test is added.
+
 Test Harness
 ============
 
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
