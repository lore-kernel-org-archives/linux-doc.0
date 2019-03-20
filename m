Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 704BF7D099
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Mar 2019 16:32:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbfCTQbz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Mar 2019 12:31:55 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:40833 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbfCTQbw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Mar 2019 12:31:52 -0400
Received: by mail-qt1-f193.google.com with SMTP id x12so3238919qts.7
        for <linux-doc@vger.kernel.org>; Wed, 20 Mar 2019 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wbEx3hMagtlG7gtXzbw55L8OpDPeq7CK2cOpXhk6DvE=;
        b=YWEQk0i3DNve9X7odkA0YaqSFB+S7FYiv8C2wDlK/DFq6VaqBKPXsMVfzU++p0s+TD
         2QipDN2VY1q2PndUDXCpYdcP39GOrAaX5JTzhOnZAGh1GL7HPSv19zZjt0i3ePp92tE5
         KFJNorfx2+MYSutVG731h2Zw6MKmQKtmum02Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wbEx3hMagtlG7gtXzbw55L8OpDPeq7CK2cOpXhk6DvE=;
        b=PgeRzDUXR3Fk7Tt6yuMQWZ22cj5H7GH3B+abC8zdqvtux6X5LAgm9MJ6m9eMDmvZiL
         lJAWDrgeRUW9WnZQ3QpZLQRdmd3g3KhfkgZqtDlWbkxamZ7t5jj3io89QAUNEKP2Dkcp
         58GiPvxtypEs3RlIw1z8WDHhuRvs42a7Q7vDd3yrtBPxJ85gtrgZdAOk6LHKftv9kmc4
         UULA11966m1IlmjXVqBxkJPkiXQDngBUM278FDQMcpIEBeRbAzawB2Zji8149YPSDSEb
         AWuimE/Us1GIedW4aq68Z9BNUPzRusR7i8yXcybdTIk2s7Dbo7XMm3qMRd09/0OzcWtN
         38gg==
X-Gm-Message-State: APjAAAVm9eyxWzRbnuXTSh7rdfG2UEmlyOZIg8Uyrgz5socJfSlSbZGC
        oNgUylHGGHtYw6rROp6JDUMKyA==
X-Google-Smtp-Source: APXvYqwUF3xe/DWcZKtonrv9q/U0k5qLbP3U0nAhFQKHu/SfL9W8qYNP1+vPEf/zpj0obFGYk+wJ4g==
X-Received: by 2002:a0c:8b63:: with SMTP id d35mr7274369qvc.148.1553099510901;
        Wed, 20 Mar 2019 09:31:50 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id h10sm2289721qta.3.2019.03.20.09.31.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Mar 2019 09:31:50 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Andrew Morton <akpm@linux-foundation.org>, ast@kernel.org,
        atishp04@gmail.com, dancol@google.com,
        Dan Williams <dan.j.williams@intel.com>,
        dietmar.eggemann@arm.com, gregkh@linuxfoundation.org,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, karim.yaghmour@opersys.com,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-trace-devel@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        mhiramat@kernel.org, qais.yousef@arm.com, rdunlap@infradead.org,
        rostedt@goodmis.org, Shuah Khan <shuah@kernel.org>, yhs@fb.com
Subject: [PATCH v5 3/3] init/config: Do not select BUILD_BIN2C for IKCONFIG
Date:   Wed, 20 Mar 2019 12:31:16 -0400
Message-Id: <20190320163116.39275-3-joel@joelfernandes.org>
X-Mailer: git-send-email 2.21.0.225.g810b269d1ac-goog
In-Reply-To: <20190320163116.39275-1-joel@joelfernandes.org>
References: <20190320163116.39275-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since commit 13610aa908dc ("kernel/configs: use .incbin directive to
embed config_data.gz"), IKCONFIG no longer uses BUILD_BIN2C so prevent
it from being selected in Kconfig.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 init/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index ea75bfbf7dfa..ffcb2f90543f 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -562,7 +562,6 @@ config BUILD_BIN2C
 
 config IKCONFIG
 	tristate "Kernel .config support"
-	select BUILD_BIN2C
 	---help---
 	  This option enables the complete Linux kernel ".config" file
 	  contents to be saved in the kernel. It provides documentation
-- 
2.21.0.225.g810b269d1ac-goog

