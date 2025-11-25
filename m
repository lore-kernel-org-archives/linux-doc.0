Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE1E331A63
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 16:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764089984; cv=none; b=at3pFNNAHi92+LtUXO2UnQVA+apm+Nvaqqz40LRUUzLPYQPs11zXVmVVQfyD2iNWlCIS0n52uv+aC82aJTIIj6nesmq7hSodFPGDxLGvrNRCHFGiczgJaSyCED3Y5BMOxNFB54YM4qNbeN4DTWUpjShe13x/cBUnyHn+rttTfUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764089984; c=relaxed/simple;
	bh=nU/T6u7xPoCdN1CIsmHHus/vm+8czfvaxNynn5WVm3w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=le6rSLQCmuuuvAQBTMf6JmPi8y9GZvUzyuKwmnERtCk4gwq70vpMunBNPJOVXaoeesoc+EbvhfPOQVEhjHeRICSoWgoHKnocL1Af6j/4D4qgqDwk15UM2JWGZGzNOmUtr3Ojg1EyxDfEl6TLwDHCwLA3mHnIo7lkQiBWz5RdGHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=QDESGPoZ; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="QDESGPoZ"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-63f96d5038dso4960749d50.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 08:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764089980; x=1764694780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zn01wPWOlP3y55xcUHgz6OrhAWK/GekbUUj2NOJck4=;
        b=QDESGPoZwZI//DRxxH1o9Nrl7KrUeCeCkaHSAO68eUx3W9SR16cFn9JOTa8xmrEbfb
         iKzfMrBbYb2CLXl3tgifOn6dqX7qlmaMfn/eI2aqkB8WHL8zQsN457UtyD2fjtxOxCVg
         55DxY+IdEj94UzA9LxxWUBW0IHPf6r/cSEo03hVKpjBrPQUngpQf7hXfzCaXfZFEtNOK
         knwC+jqQoaF2yN4qOfzCoXfS7E7iiPohYTdN9Fyi8JoSEeBu/Izel0KXsWfK+AuZibpe
         Q1naw3OgYi5qUdhJi0j54ynjicxysMBVw4edDvk44Gu1xMgZ6pK6ZGugZb+fDNZUlEEv
         +kLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764089980; x=1764694780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1zn01wPWOlP3y55xcUHgz6OrhAWK/GekbUUj2NOJck4=;
        b=M9xnIYyMnS0gOn9wHMGKAc/ZcsbxExuHwN3fEE1ZM1olY5EQfADa3OPpSb/qUb4qCw
         /F7iVmi03dJb4vbzsXDhvzLXU+VCzZVvJYTv7COQwZZRs9VdmaJmH/MmGNRbffxa9WdJ
         29VD4aZquyOh6DITyWeqeCpmzDt2FGev3hdqhkzjvP9xP4gQa/QZY5JxsNbmjEtlTY8B
         eOgGQVI8l9ki+8bxWmXg4FD1T/IDAbCY87gdRKRqNBx/XcZPu3vQk6glUcgdXlICAR7U
         AnUdURpSG1+PQ4givkHqbNHIQrpw12WOBBpglrjDPHV7HWOW8gLxIvTGZXrHmgXtRh92
         8oLg==
X-Forwarded-Encrypted: i=1; AJvYcCVQHtCo0Yv0wA0+KMRYq3fHE4aRJdzwsKRiewiUQrz5twCL9ukSgQPLuB15jG0HFNK9p8vHZPmoFrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZfeYUt2KRe5nwCAL+fXm8CvYjAjcj+9qdI6uOZn83qlnARm2k
	+NpgRVx+cv5AsOCmdi/tIZTxViSBQ3w8WV1wYbMfZqaLPbUuieO3/DLw/NlLR0z4qZs=
X-Gm-Gg: ASbGncuTbIwsU0vmwslJE0N4S9DCEbMdR8ZmTHG3nKjo2ksxi40sa5YQDh9tpmO3g3+
	34QGjBSAPsDRUy/YgN6Pl3aEZg0nmCXgiv+oBvSm4uNjg0HY5/x3SiBEx/c13nWkOEGpZ0pH0vM
	p1weMWgKxrTWldnebCK/crmc+0Ud/eA5sFqLYkk+/qRsik8A55W6mBNtNWhTftxWyEXcs4cvy+M
	+yzd30+RQvEaoZFYBYThvMkOa6MK0K7rDP6K+bdj6euURgTVs90ePzPCs1vEpg1gB4y9xWonDp4
	ax8EjZqY6DGnlE4veE5s/LicVX97xBf3biGKY607z2tTBy+lg51LRGWaz93OwDboR9/B5MuFeUP
	StxKiTCy8ozR2fCYnqYpMvULpF+7Mt0kXfUXVJaUZDye5qLDrI4LljbOWjZx6rDKf2ykn6VwYdw
	bUwnJ+qqVILsVlqmxTEkQcMX5vWDU+G1gHI1qN/wRdc3DoV0mjLe8HfbCUYe6LT9PM
X-Google-Smtp-Source: AGHT+IHaLBHTW0gdKW5yIXp86TXIcw0le8lgb42O63AJOI349kwyVeCAoddVEYxKN/vR8v7sgdqIVQ==
X-Received: by 2002:a05:690e:2459:b0:63e:30e1:4429 with SMTP id 956f58d0204a3-64302abcb44mr10008545d50.38.1764089980255;
        Tue, 25 Nov 2025 08:59:40 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a798a5518sm57284357b3.14.2025.11.25.08.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 08:59:39 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com,
	hughd@google.com,
	skhawaja@google.com,
	chrisl@kernel.org
Subject: [PATCH v8 17/18] selftests/liveupdate: Add simple kexec-based selftest for LUO
Date: Tue, 25 Nov 2025 11:58:47 -0500
Message-ID: <20251125165850.3389713-18-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.460.gd25c4c69ec-goog
In-Reply-To: <20251125165850.3389713-1-pasha.tatashin@soleen.com>
References: <20251125165850.3389713-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a kexec-based selftest, luo_kexec_simple, to validate the
end-to-end lifecycle of a Live Update Orchestrator session across
a reboot.

While existing tests verify the uAPI in a pre-reboot context, this test
ensures that the core functionality—preserving state via Kexec Handover
and restoring it in a new kernel—works as expected.

The test operates in two stages, managing its state across the reboot by
preserving a dedicated "state session" containing a memfd. This
mechanism dogfoods the LUO feature itself for state tracking, making the
test self-contained.

The test validates the following sequence:

Stage 1 (Pre-kexec):
 - Creates a test session (test-session).
 - Creates and preserves a memfd with a known data pattern into the test
   session.
 - Creates the state-tracking session to signal progression to Stage 2.
 - Executes a kexec reboot via a helper script.

Stage 2 (Post-kexec):
 - Retrieves the state-tracking session to confirm it is in the
   post-reboot stage.
 - Retrieves the preserved test session.
 - Restores the memfd from the test session and verifies its contents
   match the original data pattern written in Stage 1.
 - Finalizes both the test and state sessions to ensure a clean
   teardown.

The test relies on a helper script (do_kexec.sh) to perform the reboot
and a shared utility library (luo_test_utils.c) for common LUO
operations, keeping the main test logic clean and focused.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Zhu Yanjun <yanjun.zhu@linux.dev>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/liveupdate/Makefile   |   6 +
 .../testing/selftests/liveupdate/do_kexec.sh  |  16 ++
 .../selftests/liveupdate/luo_kexec_simple.c   |  89 ++++++
 .../selftests/liveupdate/luo_test_utils.c     | 266 ++++++++++++++++++
 .../selftests/liveupdate/luo_test_utils.h     |  44 +++
 5 files changed, 421 insertions(+)
 create mode 100755 tools/testing/selftests/liveupdate/do_kexec.sh
 create mode 100644 tools/testing/selftests/liveupdate/luo_kexec_simple.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_test_utils.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_test_utils.h

diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/testing/selftests/liveupdate/Makefile
index 620cb4ce85af..bbbec633970c 100644
--- a/tools/testing/selftests/liveupdate/Makefile
+++ b/tools/testing/selftests/liveupdate/Makefile
@@ -1,7 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+LIB_C += luo_test_utils.c
+
 TEST_GEN_PROGS += liveupdate
 
+TEST_GEN_PROGS_EXTENDED += luo_kexec_simple
+
+TEST_FILES += do_kexec.sh
+
 include ../lib.mk
 
 CFLAGS += $(KHDR_INCLUDES)
diff --git a/tools/testing/selftests/liveupdate/do_kexec.sh b/tools/testing/selftests/liveupdate/do_kexec.sh
new file mode 100755
index 000000000000..3c7c6cafbef8
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/do_kexec.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+set -e
+
+# Use $KERNEL and $INITRAMFS to pass custom Kernel and optional initramfs
+
+KERNEL="${KERNEL:-/boot/bzImage}"
+set -- -l -s --reuse-cmdline "$KERNEL"
+
+INITRAMFS="${INITRAMFS:-/boot/initramfs}"
+if [ -f "$INITRAMFS" ]; then
+    set -- "$@" --initrd="$INITRAMFS"
+fi
+
+kexec "$@"
+kexec -e
diff --git a/tools/testing/selftests/liveupdate/luo_kexec_simple.c b/tools/testing/selftests/liveupdate/luo_kexec_simple.c
new file mode 100644
index 000000000000..d7ac1f3dc4cb
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_kexec_simple.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ *
+ * A simple selftest to validate the end-to-end lifecycle of a LUO session
+ * across a single kexec reboot.
+ */
+
+#include "luo_test_utils.h"
+
+#define TEST_SESSION_NAME "test-session"
+#define TEST_MEMFD_TOKEN 0x1A
+#define TEST_MEMFD_DATA "hello kexec world"
+
+/* Constants for the state-tracking mechanism, specific to this test file. */
+#define STATE_SESSION_NAME "kexec_simple_state"
+#define STATE_MEMFD_TOKEN 999
+
+/* Stage 1: Executed before the kexec reboot. */
+static void run_stage_1(int luo_fd)
+{
+	int session_fd;
+
+	ksft_print_msg("[STAGE 1] Starting pre-kexec setup...\n");
+
+	ksft_print_msg("[STAGE 1] Creating state file for next stage (2)...\n");
+	create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
+
+	ksft_print_msg("[STAGE 1] Creating session '%s' and preserving memfd...\n",
+		       TEST_SESSION_NAME);
+	session_fd = luo_create_session(luo_fd, TEST_SESSION_NAME);
+	if (session_fd < 0)
+		fail_exit("luo_create_session for '%s'", TEST_SESSION_NAME);
+
+	if (create_and_preserve_memfd(session_fd, TEST_MEMFD_TOKEN,
+				      TEST_MEMFD_DATA) < 0) {
+		fail_exit("create_and_preserve_memfd for token %#x",
+			  TEST_MEMFD_TOKEN);
+	}
+
+	close(luo_fd);
+	daemonize_and_wait();
+}
+
+/* Stage 2: Executed after the kexec reboot. */
+static void run_stage_2(int luo_fd, int state_session_fd)
+{
+	int session_fd, mfd, stage;
+
+	ksft_print_msg("[STAGE 2] Starting post-kexec verification...\n");
+
+	restore_and_read_stage(state_session_fd, STATE_MEMFD_TOKEN, &stage);
+	if (stage != 2)
+		fail_exit("Expected stage 2, but state file contains %d", stage);
+
+	ksft_print_msg("[STAGE 2] Retrieving session '%s'...\n", TEST_SESSION_NAME);
+	session_fd = luo_retrieve_session(luo_fd, TEST_SESSION_NAME);
+	if (session_fd < 0)
+		fail_exit("luo_retrieve_session for '%s'", TEST_SESSION_NAME);
+
+	ksft_print_msg("[STAGE 2] Restoring and verifying memfd (token %#x)...\n",
+		       TEST_MEMFD_TOKEN);
+	mfd = restore_and_verify_memfd(session_fd, TEST_MEMFD_TOKEN,
+				       TEST_MEMFD_DATA);
+	if (mfd < 0)
+		fail_exit("restore_and_verify_memfd for token %#x", TEST_MEMFD_TOKEN);
+	close(mfd);
+
+	ksft_print_msg("[STAGE 2] Test data verified successfully.\n");
+	ksft_print_msg("[STAGE 2] Finalizing test session...\n");
+	if (luo_session_finish(session_fd) < 0)
+		fail_exit("luo_session_finish for test session");
+	close(session_fd);
+
+	ksft_print_msg("[STAGE 2] Finalizing state session...\n");
+	if (luo_session_finish(state_session_fd) < 0)
+		fail_exit("luo_session_finish for state session");
+	close(state_session_fd);
+
+	ksft_print_msg("\n--- SIMPLE KEXEC TEST PASSED ---\n");
+}
+
+int main(int argc, char *argv[])
+{
+	return luo_test(argc, argv, STATE_SESSION_NAME,
+			run_stage_1, run_stage_2);
+}
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/luo_test_utils.c
new file mode 100644
index 000000000000..3c8721c505df
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.c
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+#define _GNU_SOURCE
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <getopt.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <sys/ioctl.h>
+#include <sys/syscall.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <errno.h>
+#include <stdarg.h>
+
+#include "luo_test_utils.h"
+
+int luo_open_device(void)
+{
+	return open(LUO_DEVICE, O_RDWR);
+}
+
+int luo_create_session(int luo_fd, const char *name)
+{
+	struct liveupdate_ioctl_create_session arg = { .size = sizeof(arg) };
+
+	snprintf((char *)arg.name, LIVEUPDATE_SESSION_NAME_LENGTH, "%.*s",
+		 LIVEUPDATE_SESSION_NAME_LENGTH - 1, name);
+
+	if (ioctl(luo_fd, LIVEUPDATE_IOCTL_CREATE_SESSION, &arg) < 0)
+		return -errno;
+
+	return arg.fd;
+}
+
+int luo_retrieve_session(int luo_fd, const char *name)
+{
+	struct liveupdate_ioctl_retrieve_session arg = { .size = sizeof(arg) };
+
+	snprintf((char *)arg.name, LIVEUPDATE_SESSION_NAME_LENGTH, "%.*s",
+		 LIVEUPDATE_SESSION_NAME_LENGTH - 1, name);
+
+	if (ioctl(luo_fd, LIVEUPDATE_IOCTL_RETRIEVE_SESSION, &arg) < 0)
+		return -errno;
+
+	return arg.fd;
+}
+
+int create_and_preserve_memfd(int session_fd, int token, const char *data)
+{
+	struct liveupdate_session_preserve_fd arg = { .size = sizeof(arg) };
+	long page_size = sysconf(_SC_PAGE_SIZE);
+	void *map = MAP_FAILED;
+	int mfd = -1, ret = -1;
+
+	mfd = memfd_create("test_mfd", 0);
+	if (mfd < 0)
+		return -errno;
+
+	if (ftruncate(mfd, page_size) != 0)
+		goto out;
+
+	map = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, mfd, 0);
+	if (map == MAP_FAILED)
+		goto out;
+
+	snprintf(map, page_size, "%s", data);
+	munmap(map, page_size);
+
+	arg.fd = mfd;
+	arg.token = token;
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg) < 0)
+		goto out;
+
+	ret = 0;
+out:
+	if (ret != 0 && errno != 0)
+		ret = -errno;
+	if (mfd >= 0)
+		close(mfd);
+	return ret;
+}
+
+int restore_and_verify_memfd(int session_fd, int token,
+			     const char *expected_data)
+{
+	struct liveupdate_session_retrieve_fd arg = { .size = sizeof(arg) };
+	long page_size = sysconf(_SC_PAGE_SIZE);
+	void *map = MAP_FAILED;
+	int mfd = -1, ret = -1;
+
+	arg.token = token;
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_RETRIEVE_FD, &arg) < 0)
+		return -errno;
+	mfd = arg.fd;
+
+	map = mmap(NULL, page_size, PROT_READ, MAP_SHARED, mfd, 0);
+	if (map == MAP_FAILED)
+		goto out;
+
+	if (expected_data && strcmp(expected_data, map) != 0) {
+		ksft_print_msg("Data mismatch! Expected '%s', Got '%s'\n",
+			       expected_data, (char *)map);
+		ret = -EINVAL;
+		goto out_munmap;
+	}
+
+	ret = mfd;
+out_munmap:
+	munmap(map, page_size);
+out:
+	if (ret < 0 && errno != 0)
+		ret = -errno;
+	if (ret < 0 && mfd >= 0)
+		close(mfd);
+	return ret;
+}
+
+int luo_session_finish(int session_fd)
+{
+	struct liveupdate_session_finish arg = { .size = sizeof(arg) };
+
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_FINISH, &arg) < 0)
+		return -errno;
+
+	return 0;
+}
+
+void create_state_file(int luo_fd, const char *session_name, int token,
+		       int next_stage)
+{
+	char buf[32];
+	int state_session_fd;
+
+	state_session_fd = luo_create_session(luo_fd, session_name);
+	if (state_session_fd < 0)
+		fail_exit("luo_create_session for state tracking");
+
+	snprintf(buf, sizeof(buf), "%d", next_stage);
+	if (create_and_preserve_memfd(state_session_fd, token, buf) < 0)
+		fail_exit("create_and_preserve_memfd for state tracking");
+
+	/*
+	 * DO NOT close session FD, otherwise it is going to be unpreserved
+	 */
+}
+
+void restore_and_read_stage(int state_session_fd, int token, int *stage)
+{
+	char buf[32] = {0};
+	int mfd;
+
+	mfd = restore_and_verify_memfd(state_session_fd, token, NULL);
+	if (mfd < 0)
+		fail_exit("failed to restore state memfd");
+
+	if (read(mfd, buf, sizeof(buf) - 1) < 0)
+		fail_exit("failed to read state mfd");
+
+	*stage = atoi(buf);
+
+	close(mfd);
+}
+
+void daemonize_and_wait(void)
+{
+	pid_t pid;
+
+	ksft_print_msg("[STAGE 1] Forking persistent child to hold sessions...\n");
+
+	pid = fork();
+	if (pid < 0)
+		fail_exit("fork failed");
+
+	if (pid > 0) {
+		ksft_print_msg("[STAGE 1] Child PID: %d. Resources are pinned.\n", pid);
+		ksft_print_msg("[STAGE 1] You may now perform kexec reboot.\n");
+		exit(EXIT_SUCCESS);
+	}
+
+	/* Detach from terminal so closing the window doesn't kill us */
+	if (setsid() < 0)
+		fail_exit("setsid failed");
+
+	close(STDIN_FILENO);
+	close(STDOUT_FILENO);
+	close(STDERR_FILENO);
+
+	/* Change dir to root to avoid locking filesystems */
+	if (chdir("/") < 0)
+		exit(EXIT_FAILURE);
+
+	while (1)
+		sleep(60);
+}
+
+static int parse_stage_args(int argc, char *argv[])
+{
+	static struct option long_options[] = {
+		{"stage", required_argument, 0, 's'},
+		{0, 0, 0, 0}
+	};
+	int option_index = 0;
+	int stage = 1;
+	int opt;
+
+	optind = 1;
+	while ((opt = getopt_long(argc, argv, "s:", long_options, &option_index)) != -1) {
+		switch (opt) {
+		case 's':
+			stage = atoi(optarg);
+			if (stage != 1 && stage != 2)
+				fail_exit("Invalid stage argument");
+			break;
+		default:
+			fail_exit("Unknown argument");
+		}
+	}
+	return stage;
+}
+
+int luo_test(int argc, char *argv[],
+	     const char *state_session_name,
+	     luo_test_stage1_fn stage1,
+	     luo_test_stage2_fn stage2)
+{
+	int target_stage = parse_stage_args(argc, argv);
+	int luo_fd = luo_open_device();
+	int state_session_fd;
+	int detected_stage;
+
+	if (luo_fd < 0) {
+		ksft_exit_skip("Failed to open %s. Is the luo module loaded?\n",
+			       LUO_DEVICE);
+	}
+
+	state_session_fd = luo_retrieve_session(luo_fd, state_session_name);
+	if (state_session_fd == -ENOENT)
+		detected_stage = 1;
+	else if (state_session_fd >= 0)
+		detected_stage = 2;
+	else
+		fail_exit("Failed to check for state session");
+
+	if (target_stage != detected_stage) {
+		ksft_exit_fail_msg("Stage mismatch Requested --stage %d, but system is in stage %d.\n"
+				   "(State session %s: %s)\n",
+				   target_stage, detected_stage, state_session_name,
+				   (detected_stage == 2) ? "EXISTS" : "MISSING");
+	}
+
+	if (target_stage == 1)
+		stage1(luo_fd);
+	else
+		stage2(luo_fd, state_session_fd);
+
+	return 0;
+}
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.h b/tools/testing/selftests/liveupdate/luo_test_utils.h
new file mode 100644
index 000000000000..90099bf49577
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ *
+ * Utility functions for LUO kselftests.
+ */
+
+#ifndef LUO_TEST_UTILS_H
+#define LUO_TEST_UTILS_H
+
+#include <errno.h>
+#include <string.h>
+#include <linux/liveupdate.h>
+#include "../kselftest.h"
+
+#define LUO_DEVICE "/dev/liveupdate"
+
+#define fail_exit(fmt, ...)						\
+	ksft_exit_fail_msg("[%s:%d] " fmt " (errno: %s)\n",	\
+			   __func__, __LINE__, ##__VA_ARGS__, strerror(errno))
+
+int luo_open_device(void);
+int luo_create_session(int luo_fd, const char *name);
+int luo_retrieve_session(int luo_fd, const char *name);
+int luo_session_finish(int session_fd);
+
+int create_and_preserve_memfd(int session_fd, int token, const char *data);
+int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
+
+void create_state_file(int luo_fd, const char *session_name, int token,
+		       int next_stage);
+void restore_and_read_stage(int state_session_fd, int token, int *stage);
+
+void daemonize_and_wait(void);
+
+typedef void (*luo_test_stage1_fn)(int luo_fd);
+typedef void (*luo_test_stage2_fn)(int luo_fd, int state_session_fd);
+
+int luo_test(int argc, char *argv[], const char *state_session_name,
+	     luo_test_stage1_fn stage1, luo_test_stage2_fn stage2);
+
+#endif /* LUO_TEST_UTILS_H */
-- 
2.52.0.460.gd25c4c69ec-goog

