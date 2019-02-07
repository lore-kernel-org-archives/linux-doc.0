Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0C8177D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Feb 2019 21:11:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbfBGVLO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Feb 2019 16:11:14 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36921 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727547AbfBGVLO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Feb 2019 16:11:14 -0500
Received: by mail-qt1-f194.google.com with SMTP id a48so1607707qtb.4
        for <linux-doc@vger.kernel.org>; Thu, 07 Feb 2019 13:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4mIgxVnwUjCbTMBCqyTV21l4fxh2tBYvlp7a1Iq+g00=;
        b=OdOcMqR4tzei0JFGWAZNDMQQynHqoZv/RN4nsGQB+6+7W3wp5U4DBSn27L0R8n1r/p
         aXrLS5OkZdkVbXgyQRBAWRgqZd7YUJBJ5zjKwX7of+bD3/GDv3RVrrI74seyqhohpDkY
         4o47U02u6dKEU1Ek7JDx8T7XKJImYylM3pWP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4mIgxVnwUjCbTMBCqyTV21l4fxh2tBYvlp7a1Iq+g00=;
        b=APjn0Of7n0Mal7Bif9zIbXVVLjYVVVR4C18G5c+In6XQE+X9k2ndWRo4LWk+aE9y2g
         yfURVQ3ltBTSuEZgnHEby9g7/w+VDuGbCRx/+sjBJ05uPR+jtVXfa6RRAK3Uw+pwwGsH
         dPDHrhHe7gySTaAie8FZZ9mrXQeKWE3XbEWlgJS7Z1DOQisd3D+neAsJPLIdO+34nM+5
         NgVbiV0b8d8SQgJEOJ9yGX76VpB3RUZlXyo4bzJo2K4Qq9kw1riRbZQwtHDujRa4SFH2
         Do7YVzA4N6cCOd1vOcjcmFjw66Vujln4gg/4jcOzNGDDpW6ZKTRE4ju3NbDbHIsNheEF
         R9sA==
X-Gm-Message-State: AHQUAuZV/7GDSzLl83hU3YsftXKybw21Pmw1DLWqgFvd0rU+UpR+3R3x
        pRJu+V3VBV4tU1L7p68FQPENbA==
X-Google-Smtp-Source: AHgI3Ibjf1LdZSEnZsCpLIxpg6+4AlHcsgwcis8N/gcIpr3tIeNTdtrMNwcS3D3z0AQeAFyWobHwWQ==
X-Received: by 2002:ac8:26b9:: with SMTP id 54mr13660808qto.301.1549573873096;
        Thu, 07 Feb 2019 13:11:13 -0800 (PST)
Received: from joelaf.cam.corp.google.com ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id b77sm162681qka.5.2019.02.07.13.11.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Feb 2019 13:11:12 -0800 (PST)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Andrew Morton <akpm@linux-foundation.org>, ast@kernel.org,
        atishp04@gmail.com, dancol@google.com,
        Dan Williams <dan.j.williams@intel.com>,
        gregkh@linuxfoundation.org, Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, karim.yaghmour@opersys.com,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        paulmck@linux.vnet.ibm.com,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        rdunlap@infradead.org, rostedt@goodmis.org,
        Shuah Khan <shuah@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
        yhs@fb.com
Subject: [PATCH 2/2] Add selftests for module build using in-kernel headers
Date:   Thu,  7 Feb 2019 16:11:02 -0500
Message-Id: <20190207211102.154634-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.20.1.611.gfbb209baf1-goog
In-Reply-To: <20190207211102.154634-1-joel@joelfernandes.org>
References: <20190207211102.154634-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This test tries to build a module successfully using the in-kernel
headers found in /proc/kheaders.txz.

Verified pass and fail scenarios by running:
make -C tools/testing/selftests TARGETS=kheaders run_tests

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 tools/testing/selftests/kheaders/Makefile     |  5 +++++
 tools/testing/selftests/kheaders/config       |  1 +
 .../kheaders/run_kheaders_modbuild.sh         | 18 ++++++++++++++++++
 .../selftests/kheaders/testmod/Makefile       |  3 +++
 .../testing/selftests/kheaders/testmod/test.c | 19 +++++++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 tools/testing/selftests/kheaders/Makefile
 create mode 100644 tools/testing/selftests/kheaders/config
 create mode 100755 tools/testing/selftests/kheaders/run_kheaders_modbuild.sh
 create mode 100644 tools/testing/selftests/kheaders/testmod/Makefile
 create mode 100644 tools/testing/selftests/kheaders/testmod/test.c

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
index 000000000000..c5cb191da9c7
--- /dev/null
+++ b/tools/testing/selftests/kheaders/run_kheaders_modbuild.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+HEADERS_XZ=/proc/kheaders.txz
+TMP_DIR_HEADERS=$(mktemp -d)
+TMP_DIR_MODULE=$(mktemp -d)
+SPATH="$(dirname "$(readlink -f "$0")")"
+
+tar -xvf $HEADERS_XZ -C $TMP_DIR_HEADERS > /dev/null
+
+cp -r $SPATH/testmod $TMP_DIR_MODULE/
+
+pushd $TMP_DIR_MODULE/testmod
+make -C $TMP_DIR_HEADERS M=$(pwd) modules
+popd
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
index 000000000000..eae030aab5db
--- /dev/null
+++ b/tools/testing/selftests/kheaders/testmod/test.c
@@ -0,0 +1,19 @@
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
-- 
2.20.1.611.gfbb209baf1-goog

