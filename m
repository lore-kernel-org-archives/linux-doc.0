Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5EE057D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Mar 2019 16:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728172AbfCAQJ2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Mar 2019 11:09:28 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:44669 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388808AbfCAQJS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Mar 2019 11:09:18 -0500
Received: by mail-qt1-f193.google.com with SMTP id d2so28266244qti.11
        for <linux-doc@vger.kernel.org>; Fri, 01 Mar 2019 08:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3tUTcdFJpn3In6T+iaMar4GvTuGhsqDUqTo6MJRj8sI=;
        b=sUw9QIFnN2LrpfvVfFpST4G5uVljpmzsdyXRNB2d6DMD8mR5pytmy504BkpbtFIuTd
         g7CR8mD0edAKCM7GHP/+t8WHKqNXuWWLlFg7QhjKJqbf4GLGFBSzr+HXzB9GCJOnDo53
         MZQtEAUY6jNt6BO44pXLLmgqwsOH8CbZQGnr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3tUTcdFJpn3In6T+iaMar4GvTuGhsqDUqTo6MJRj8sI=;
        b=VJq/H6todmrnQgnPzLwexVz7AmxFMEawIdVjunMAUROl8R1yfMFTi1JlWpZMir1Dnh
         6X8acBv6pHombuJwxlKYq102nUTB6Rv9yVrxLeKNtN03f8q9aBhio+tga9GA2eOj9+PD
         uSMtK51csoVghAWG8jeUPh+14NFomGSWjOpEX3nBMGfnEjjJkGxdlBfpgpjENP2/8ojr
         6qvdxzdpXl9vVWlMY+20P8M93C8TU+hOKg7IWlCOOO2cWwE8dhkVXFudFPlJoDRRPMi5
         2Q1vWot2dzvNCR7+3255AgKZwTfwTBvTenIX/VEM7Clz2i6LJmTCZYi5Jq6O1sfF5urb
         DByw==
X-Gm-Message-State: APjAAAUP2sdKwcEFbje3q5rCJicUQpLe6Og5l28aAmEV8embNt11qd37
        mXMMEgb8Mrf7LPCJGEZUimCTXQ==
X-Google-Smtp-Source: APXvYqwrpF3GxKEve06ijUFVBlAuHPWKJADUWB3w6qkI2dQQS4NtvvEPoO771XOvovLszirLk2DoLw==
X-Received: by 2002:ac8:fbb:: with SMTP id b56mr4684257qtk.41.1551456557165;
        Fri, 01 Mar 2019 08:09:17 -0800 (PST)
Received: from joelaf.cam.corp.google.com ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id h58sm15090062qtb.89.2019.03.01.08.09.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Mar 2019 08:09:16 -0800 (PST)
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
Subject: [PATCH v4 2/2] Add selftests for module build using in-kernel headers
Date:   Fri,  1 Mar 2019 11:08:56 -0500
Message-Id: <20190301160856.129678-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.21.0.352.gf09ad66450-goog
In-Reply-To: <20190301160856.129678-1-joel@joelfernandes.org>
References: <20190301160856.129678-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This test tries to build a module successfully using the in-kernel
headers found in /proc/kheaders.tar.xz.

Verified pass and fail scenarios by running:
make -C tools/testing/selftests TARGETS=kheaders run_tests

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 tools/testing/selftests/Makefile              |  1 +
 tools/testing/selftests/kheaders/Makefile     |  5 +++++
 tools/testing/selftests/kheaders/config       |  1 +
 .../kheaders/run_kheaders_modbuild.sh         | 18 +++++++++++++++++
 .../selftests/kheaders/testmod/Makefile       |  3 +++
 .../testing/selftests/kheaders/testmod/test.c | 20 +++++++++++++++++++
 6 files changed, 48 insertions(+)
 create mode 100644 tools/testing/selftests/kheaders/Makefile
 create mode 100644 tools/testing/selftests/kheaders/config
 create mode 100755 tools/testing/selftests/kheaders/run_kheaders_modbuild.sh
 create mode 100644 tools/testing/selftests/kheaders/testmod/Makefile
 create mode 100644 tools/testing/selftests/kheaders/testmod/test.c

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 400ee81a3043..5a9287fddd0d 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -20,6 +20,7 @@ TARGETS += intel_pstate
 TARGETS += ipc
 TARGETS += ir
 TARGETS += kcmp
+TARGETS += kheaders
 TARGETS += kvm
 TARGETS += lib
 TARGETS += membarrier
diff --git a/tools/testing/selftests/kheaders/Makefile b/tools/testing/selftests/kheaders/Makefile
new file mode 100644
index 000000000000..51035ab0732b
--- /dev/null
+++ b/tools/testing/selftests/kheaders/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+TEST_PROGS := run_kheaders_modbuild.sh
+
+include ../lib.mk
diff --git a/tools/testing/selftests/kheaders/config b/tools/testing/selftests/kheaders/config
new file mode 100644
index 000000000000..5221f9fb5e79
--- /dev/null
+++ b/tools/testing/selftests/kheaders/config
@@ -0,0 +1 @@
+CONFIG_IKHEADERS_PROC=y
diff --git a/tools/testing/selftests/kheaders/run_kheaders_modbuild.sh b/tools/testing/selftests/kheaders/run_kheaders_modbuild.sh
new file mode 100755
index 000000000000..f001568e08b0
--- /dev/null
+++ b/tools/testing/selftests/kheaders/run_kheaders_modbuild.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+HEADERS_XZ=/proc/kheaders.tar.xz
+TMP_DIR_HEADERS=$(mktemp -d)
+TMP_DIR_MODULE=$(mktemp -d)
+SPATH="$(dirname "$(readlink -f "$0")")"
+
+tar -xvf $HEADERS_XZ -C $TMP_DIR_HEADERS > /dev/null
+
+cp -r $SPATH/testmod $TMP_DIR_MODULE/
+
+pushd $TMP_DIR_MODULE/testmod > /dev/null
+make -C $TMP_DIR_HEADERS M=$(pwd) modules
+popd > /dev/null
+
+rm -rf $TMP_DIR_HEADERS
+rm -rf $TMP_DIR_MODULE
diff --git a/tools/testing/selftests/kheaders/testmod/Makefile b/tools/testing/selftests/kheaders/testmod/Makefile
new file mode 100644
index 000000000000..7083e28706e8
--- /dev/null
+++ b/tools/testing/selftests/kheaders/testmod/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-m += test.o
diff --git a/tools/testing/selftests/kheaders/testmod/test.c b/tools/testing/selftests/kheaders/testmod/test.c
new file mode 100644
index 000000000000..6eb0b8492ffa
--- /dev/null
+++ b/tools/testing/selftests/kheaders/testmod/test.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+
+static int __init hello_init(void)
+{
+	printk(KERN_INFO "Hello, world\n");
+	return 0;
+}
+
+static void __exit hello_exit(void)
+{
+	printk(KERN_INFO "Goodbye, world\n");
+}
+
+module_init(hello_init);
+module_exit(hello_exit);
+MODULE_LICENSE("GPL v2");
-- 
2.21.0.352.gf09ad66450-goog

