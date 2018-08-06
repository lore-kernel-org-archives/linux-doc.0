Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 77B037E3E8
	for <lwn-linux-doc@archive.lwn.net>; Mon,  6 Aug 2018 16:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387814AbeHFSvF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 6 Aug 2018 14:51:05 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:38279 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387820AbeHFSvD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Aug 2018 14:51:03 -0400
Received: by mail-wm0-f67.google.com with SMTP id t25-v6so14971601wmi.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Aug 2018 09:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZrhxEh1LXKnM2IrXVIXbI5DKlDD8oKDUSL0rMpxw/qU=;
        b=Ro3MVatE7Wpum1+4Kk+2wXZyHXWGz5DhEhdhzVDpd6n/5zWbox/Ku85U5aRyxxnzQJ
         1J/xWvRyFAc03TrVnYRNw8OmHId2EwNePrTxpSWu1Ofv1SyERhzredl8WNaZAOK9NUox
         kdSLR0PzMNwDcdf8IDNrR/K6Rn2/Oq2YV3/c4uct4BnX14eyZ8BAMtfJTUrExgVGB4/D
         CVBWJPc3EidgI39apO4xklbv+Fl96U1MRR2IF/FLrVGIUHoTHo8+XdeER10wgCNAs+pz
         Ume8Ot7SFSHyWHNqaSQSC14cH5byqzRoQ0+VYrRQwYDbd2MRQJguQiz5Xk4ALJ4R63mL
         Zn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZrhxEh1LXKnM2IrXVIXbI5DKlDD8oKDUSL0rMpxw/qU=;
        b=p12KV/EgTaCaPSehLyctMsRYpV9BJEcXPNRe9E0ep0YIU9LfBO5O30gevlykC14TSr
         4Bigpxw16lUxb/nMPVow6IXcTWB13aYZeL9561ORAr8py3QsMMwQDrbHicNP6edj9KCj
         iE1eEOmibeycPkMMa1AYUMtQXvmmdQv+RVX/cwXKe4NYckFR45jnvvnMHIyFyWFxrK0v
         cbpl51xVxALz8oaORRkbRuTNMcv14T9mKeXng+XQuXvQxu3sM78H7o79yhFVAIoIKt+i
         kb6AtHN5TNxmyQjh6sD8b/fA4+fU7ac6xfyhudLs4K3Tt4MbhmvILyY0wOR9C1cGcQ/3
         1QRA==
X-Gm-Message-State: AOUpUlHXgIuLo513gKC/f7+8XnELPxrg7CMA78yQbKcfDXRWjXSs/gFS
        DaJHTjCgh4aVZFgHITqWgCIjcA==
X-Google-Smtp-Source: AAOMgpcDi4MsvNpmW3WExVMPVjcfyNYV436aYUrVpmhZEgiIKgBhHcCGOm+96ozBcTKn96ws7pU/kw==
X-Received: by 2002:a1c:8010:: with SMTP id b16-v6mr12985397wmd.9.1533573668058;
        Mon, 06 Aug 2018 09:41:08 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id 66-v6sm16385790wmw.34.2018.08.06.09.41.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Aug 2018 09:41:07 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
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
        Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH v5 10/10] selftests, arm64: add a selftest for passing tagged pointers to kernel
Date:   Mon,  6 Aug 2018 18:40:45 +0200
Message-Id: <44c929e1128adfa5e84ed7db832d2b34edc55f19.1533573460.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.597.ga71716f1ad-goog
In-Reply-To: <cover.1533573460.git.andreyknvl@google.com>
References: <cover.1533573460.git.andreyknvl@google.com>
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
2.18.0.597.ga71716f1ad-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
