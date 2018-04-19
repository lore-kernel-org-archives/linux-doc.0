Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 052527E279
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 10:28:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750989AbeDSK2e (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 06:28:34 -0400
Received: from mail-lf0-f66.google.com ([209.85.215.66]:33885 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751047AbeDSK2c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Apr 2018 06:28:32 -0400
Received: by mail-lf0-f66.google.com with SMTP id r7-v6so64882lfr.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Apr 2018 03:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v2T6CpwMD42S9sSc5hWCEQ+Uw39dHb9dupgHBJIvaZ0=;
        b=HJE+WVgKT32XRLvN6/FZ48lVdCWTaUWpU9pFQx1Xkzw5KjdPaqaB5+LrE5/R/PZK0z
         GZRg2TxdTntGoBON/P7YvF21Et2vKpihjC+hLqB7c05x3QQ16U0dE+uUf07dd/RMQARM
         yiS44RMuZel2/NMOrxpFO9IsjUdtKidCiD30E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=v2T6CpwMD42S9sSc5hWCEQ+Uw39dHb9dupgHBJIvaZ0=;
        b=k07kLT7OT18J8LwuYiTKEBCW+n2KvX1TfRKudaH+6e/m+PKDr/glpZzSpp6K9jgXWj
         3wUNxCwiwhxj1KlGDxWPuLPSZFFHrKC7OnHqKkYR1ZXQMeZxtt0TRfFaRWP3IQsr+98b
         ApY28RKztLdJsT8UetDg5EozbjlskWRc6bHLqkzDPkD1pPsXGZzb3DYZecpALj6Td1rQ
         c7mePZbDYlAn3NAr2/fCNdU1xjqm+97CCYZJtMsX0e28WC+hXor2jRRHHWn8QxaX9zCN
         NTQAdrgr0C4g5rHf6pa6yOqRBiXxcrbWAfQs3g9nDzbh7u17aG7nVTg/ef9LBmpDBYd2
         rZig==
X-Gm-Message-State: ALQs6tCu8vn/QacuiEqIpgra5BcxXO/40Rc/e3RhFewzcQ0hA3cCko0e
        5xdIwooVcmwTKpD88XMWJXg39g==
X-Google-Smtp-Source: AIpwx4/mA89FsibO7xfzZv9xc1W98FSzxdTKxlI3nbDT8ZRH9HjphFMcyWeh25oJN6ss5ijPFqMDJA==
X-Received: by 10.46.73.73 with SMTP id b9mr1628807ljd.118.1524133710837;
        Thu, 19 Apr 2018 03:28:30 -0700 (PDT)
Received: from localhost (c-4c3770d5.07-21-73746f28.cust.bredbandsbolaget.se. [213.112.55.76])
        by smtp.gmail.com with ESMTPSA id s9-v6sm681661lfe.20.2018.04.19.03.28.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Apr 2018 03:28:29 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     shuah@kernel.org, corbet@lwn.net
Cc:     linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v2] doc: dev-tools: kselftest.rst: update contributing new tests
Date:   Thu, 19 Apr 2018 12:28:25 +0200
Message-Id: <20180419102825.2990-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180417084631.11242-1-anders.roxell@linaro.org>
References: <20180417084631.11242-1-anders.roxell@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a description that the kernel headers should be used as far as it is
possible and then the system headers.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 Documentation/dev-tools/kselftest.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index e80850eefe13..3bf371a938d0 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -151,6 +151,11 @@ Contributing new tests (details)
    TEST_FILES, TEST_GEN_FILES mean it is the file which is used by
    test.
 
+ * First use the headers inside the kernel source and/or git repo, and then the
+   system headers.  Headers for the kernel release as opposed to headers
+   installed by the distro on the system should be the primary focus to be able
+   to find regressions.
+
 Test Harness
 ============
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
