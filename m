Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C986A7DD2A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Dec 2018 12:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727588AbeLJMvX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Dec 2018 07:51:23 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36365 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727850AbeLJMvX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Dec 2018 07:51:23 -0500
Received: by mail-wm1-f66.google.com with SMTP id a18so11160194wmj.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Dec 2018 04:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=htNgLuq9Zq22KIFtx4RRYdIKYt1PSRPcUvgmlifjwvU=;
        b=IPY0J0E2deGNCT3dMOHF3Bmylp3aWY/zWUIg1jI0VvEQ2WNai/QLbBSKwAlBlxyEsB
         +x7Icd34IAQh1eF1POy95Vl5O6jDMzTp1nprbJN/LwulyKw9RmKKZUd6mVT/EGhyqmHa
         1tqsX3hNorl6Tem5io1S6kqEJWfpPsISCeDrIXsyYkRRxsiPCNzyartzWj8dTdelCgJD
         fkYjz2H7kaii4gNRKpGJEs53NjdE6xRgRvcqDrxjXexI2aLvcXhZlFL+oZSfMiIVZd6K
         QapQS8fhNfIYapc7kpsxaiLrqB/DRPgKAVgCG7yBsEJmJrBewQ3SV+sI+HCdlSJlv52G
         zPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=htNgLuq9Zq22KIFtx4RRYdIKYt1PSRPcUvgmlifjwvU=;
        b=Ae8tYUNXRkRIVuAGk9K770srx2SlNdgTC3W0LB+YGvNhhihYfO+KkHeFaChAVYvSti
         dPs5Z4u3hw9nVWVXuS8/BOWZcJ+Zw1zUxnbFnwuYS+BF8UhiUylxpHiUvCRFl7BBbGsk
         +WML9V3I3gJWdckHWDiIu0UUK8MvT1y28JwHKPReWM4oEtkXxxm1LxeT6axnvZXn8g1b
         QpfXxLVw+qar7hRrnNExOXNUIH20Wzd1r6++EhiQ9/YNyfYQkXVkVuYngIpQ2jfx0w98
         8+5K7ulI/pdzt98zeKPZCUuegbVvkDSm9N64hDP3bvtL+E2ctbh9QCM8RE7446ZCdeTb
         qLIA==
X-Gm-Message-State: AA+aEWbbSrz12sgLblgmsk6W52qpi6ydI7F5LzVGggsBZ8sj5suxxWCg
        0Bf7vfddQoMWj+IffOjULAUdGA==
X-Google-Smtp-Source: AFSGD/Wvuhf6G6eOpW5vjcIUpM8htygFR/RVEC5RbfnAeJGyaCuDNPuFXX3LyyAqxNCgS6H6SuCQtA==
X-Received: by 2002:a1c:d08b:: with SMTP id h133mr10494550wmg.8.1544446281211;
        Mon, 10 Dec 2018 04:51:21 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id l197sm36893363wma.44.2018.12.10.04.51.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Dec 2018 04:51:20 -0800 (PST)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v9 8/8] selftests, arm64: add a selftest for passing tagged pointers to kernel
Date:   Mon, 10 Dec 2018 13:51:05 +0100
Message-Id: <502466b9652c57a23af3bd72124144319212f30b.1544445454.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.20.0.rc2.403.gdbc3b29805-goog
In-Reply-To: <cover.1544445454.git.andreyknvl@google.com>
References: <cover.1544445454.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds a simple test, that calls the uname syscall with a
tagged user pointer as an argument. Without the kernel accepting tagged
user pointers the test fails with EFAULT.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 tools/testing/selftests/arm64/.gitignore      |  1 +
 tools/testing/selftests/arm64/Makefile        | 11 +++++++++++
 .../testing/selftests/arm64/run_tags_test.sh  | 12 ++++++++++++
 tools/testing/selftests/arm64/tags_test.c     | 19 +++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 tools/testing/selftests/arm64/.gitignore
 create mode 100644 tools/testing/selftests/arm64/Makefile
 create mode 100755 tools/testing/selftests/arm64/run_tags_test.sh
 create mode 100644 tools/testing/selftests/arm64/tags_test.c

diff --git a/tools/testing/selftests/arm64/.gitignore b/tools/testing/selftests/arm64/.gitignore
new file mode 100644
index 000000000000..e8fae8d61ed6
--- /dev/null
+++ b/tools/testing/selftests/arm64/.gitignore
@@ -0,0 +1 @@
+tags_test
diff --git a/tools/testing/selftests/arm64/Makefile b/tools/testing/selftests/arm64/Makefile
new file mode 100644
index 000000000000..a61b2e743e99
--- /dev/null
+++ b/tools/testing/selftests/arm64/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# ARCH can be overridden by the user for cross compiling
+ARCH ?= $(shell uname -m 2>/dev/null || echo not)
+
+ifneq (,$(filter $(ARCH),aarch64 arm64))
+TEST_GEN_PROGS := tags_test
+TEST_PROGS := run_tags_test.sh
+endif
+
+include ../lib.mk
diff --git a/tools/testing/selftests/arm64/run_tags_test.sh b/tools/testing/selftests/arm64/run_tags_test.sh
new file mode 100755
index 000000000000..745f11379930
--- /dev/null
+++ b/tools/testing/selftests/arm64/run_tags_test.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+echo "--------------------"
+echo "running tags test"
+echo "--------------------"
+./tags_test
+if [ $? -ne 0 ]; then
+	echo "[FAIL]"
+else
+	echo "[PASS]"
+fi
diff --git a/tools/testing/selftests/arm64/tags_test.c b/tools/testing/selftests/arm64/tags_test.c
new file mode 100644
index 000000000000..1452ed7d33f9
--- /dev/null
+++ b/tools/testing/selftests/arm64/tags_test.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <stdio.h>
+#include <unistd.h>
+#include <stdint.h>
+#include <sys/utsname.h>
+
+#define SHIFT_TAG(tag)		((uint64_t)(tag) << 56)
+#define SET_TAG(ptr, tag)	(((uint64_t)(ptr) & ~SHIFT_TAG(0xff)) | \
+					SHIFT_TAG(tag))
+
+int main(void)
+{
+	struct utsname utsname;
+	void *ptr = &utsname;
+	void *tagged_ptr = (void *)SET_TAG(ptr, 0x42);
+	int err = uname(tagged_ptr);
+	return err;
+}
-- 
2.20.0.rc2.403.gdbc3b29805-goog

