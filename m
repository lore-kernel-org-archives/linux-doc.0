Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DBB7D7DD32
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 13:13:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbeJBT4R (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 15:56:17 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36654 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728122AbeJBT4Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 15:56:16 -0400
Received: by mail-wm1-f68.google.com with SMTP id n23-v6so2156012wmc.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jKYsVlgDfkccan6ieeKzVaMnn6OiwgAPoKEMH6GgvtQ=;
        b=dCBVcCGfEkOp2yZaISW/VbCXrMw/roS3ig2VtB55vdMEYEdcc/N0JZvN/VK0XUG/vE
         q8IQc15Veee7CyQPFcN4SsbYldChP/FYEqamRzfm+EMDwScW4NnC7+nL/WVcXY4YkxXH
         IaLDvKPYeiZLSd6eTTyOwGRK7yY7FV+zz24fER4CRRtpt6fdP7FHKNa+sGQGNFp4xqiT
         2ikGu6YSkQfB33XL8xLyxL9AM7V5tbcy1QM6XaN4QBbjg/hZJkmhb7/WqbYk+Q0i72PC
         1E3XO0yS2UZtrhy8q6K5bwYxsqbd2crZpd+uOHwvRVP1OGBqcxh74WmYSqKcp9Zs8/Nq
         KaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jKYsVlgDfkccan6ieeKzVaMnn6OiwgAPoKEMH6GgvtQ=;
        b=AfupJX8NNKd3Uly8TMBWf8UP6racYd5Xs/IdJKGZMupmGCwPaibbiv+kOkH56ZS0qK
         FqgF8+HLGrLMcjabjtW9w544pnDxcD0KyL4+wbytZsHK8taEt6xAO/8jPUXRF9A1fki7
         HuHXP2utbvXolVnxYB/0E5B2qJfJ5nAvD0kSp+ATO1WzThw9XO8lR1kzFBqAbYYwFAl5
         GoQh/ke8khSLXpaDkS9M0cM89f9nN4wvQdD7wpPt1LnIuz1gnnRiUIrF+qwWWz7Eye8S
         8hSUDR9oW8JQhDCJAaKU+hkrkrkImZqKzTJV1B3SxQRqzNfHy5cVywkNcqHFmWk4fyvP
         ASbg==
X-Gm-Message-State: ABuFfogkqwVUbHfcLSWsXHvIlLRrfBC4Fpnw4fOswhRjDN5TkylxLAEs
        EKUGvUHR5nZjsgjN7mJT4BAFpA==
X-Google-Smtp-Source: ACcGV61lYLeUyN6R/Xs9pciDC3H43amhfekx+exm3H5Gj+xhTN4aSmtpre7zcIkfD40I7FhghfLIPg==
X-Received: by 2002:a1c:8bcc:: with SMTP id n195-v6mr1947045wmd.118.1538485977684;
        Tue, 02 Oct 2018 06:12:57 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id v10-v6sm17458681wrp.0.2018.10.02.06.12.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Oct 2018 06:12:56 -0700 (PDT)
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
Subject: [PATCH v7 8/8] selftests, arm64: add a selftest for passing tagged pointers to kernel
Date:   Tue,  2 Oct 2018 15:12:43 +0200
Message-Id: <3a2c0a6b2499a328cc9471d4095ae36f0f05252d.1538485901.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
In-Reply-To: <cover.1538485901.git.andreyknvl@google.com>
References: <cover.1538485901.git.andreyknvl@google.com>
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
2.19.0.605.g01d371f741-goog

