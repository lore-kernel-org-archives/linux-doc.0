Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7537A7D099
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Feb 2019 19:38:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729782AbfB0TiO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Feb 2019 14:38:14 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:40458 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727240AbfB0TiO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Feb 2019 14:38:14 -0500
Received: by mail-qt1-f196.google.com with SMTP id j36so20653476qta.7
        for <linux-doc@vger.kernel.org>; Wed, 27 Feb 2019 11:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eqlz7ksxRs119NvZnBQ8tRqtfq4aD0fzoJTM2ghOri4=;
        b=J3aAENHEyTEBO7MFKGXM21cPk6pEJe2iHhFc4Tn1VDAX5IgQAex+3Sapnc+Ze1AKD5
         Ct1EVxu0YDXZNsD/GgXz8dyeL+EjQTTeak75Ul3uXUS0eeoJxyspVKYl65ZkUTCVaCI4
         WLzd27hS7Nw1sE0qX/gNoFNHiu9j5daqrnApQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eqlz7ksxRs119NvZnBQ8tRqtfq4aD0fzoJTM2ghOri4=;
        b=LOnMdi+aA2NYcAR3x4UlQ8IGxVoD448HdaMeWfpVn0EbalIG+JzUQVmu7QrUMrHOZp
         mizDP/t/4WdsVOj3Hrj8dLvLxfNlW6KBSWCh7i4YCxOZjM1GmXLJtlww0Ra8YOens9Q8
         R8M5D3ECdJmxuVPrPxhT5iZmO/snJFya6bi9DW1kx0QOzCnB7XvP8dV6z/xDK+Z2aB40
         A5xnLunXcaCWr4FmNEB53x8jyngD1kc9b9RiJiXzFdRn0mUmC4Q3D0zhqcQll33n0qyb
         XjVpdAVg42araq1hTXg5PCSzaV8Ga8ecg2l3+ZW6zbsK41uwmOmhx8rOc6CnQbn43Y2A
         2POw==
X-Gm-Message-State: AHQUAuaymkazXdGRZit/t7aaa/0kFK3C3EiTKSvVrBA+XQv5X5SNEF7f
        1Q9vegkDL1aaQHvgc1XheBzHUA==
X-Google-Smtp-Source: AHgI3IbljVTc+4hfmQZHlE5yxCZi95njItqSx40sCZnHzwDeSeopIUZDv054QSa/k4j/ZdxChX/D7Q==
X-Received: by 2002:ac8:2b4b:: with SMTP id 11mr3029444qtv.252.1551296292713;
        Wed, 27 Feb 2019 11:38:12 -0800 (PST)
Received: from joelaf.cam.corp.google.com ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id w8sm16087141qkw.80.2019.02.27.11.38.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Feb 2019 11:38:11 -0800 (PST)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Andrew Morton <akpm@linux-foundation.org>, ast@kernel.org,
        atishp04@gmail.com, dancol@google.com,
        Dan Williams <dan.j.williams@intel.com>,
        gregkh@linuxfoundation.org, Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, karim.yaghmour@opersys.com,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-trace-devel@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        mhiramat@kernel.org, paulmck@linux.vnet.ibm.com,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        qais.yousef@arm.com, rdunlap@infradead.org, rostedt@goodmis.org,
        Shuah Khan <shuah@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, yhs@fb.com
Subject: [PATCH v3 2/2] Add selftests for module build using in-kernel headers
Date:   Wed, 27 Feb 2019 14:37:48 -0500
Message-Id: <20190227193748.132301-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.21.0.rc2.261.ga7da99ff1b-goog
In-Reply-To: <20190227193748.132301-1-joel@joelfernandes.org>
References: <20190227193748.132301-1-joel@joelfernandes.org>
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
2.21.0.rc2.261.ga7da99ff1b-goog

