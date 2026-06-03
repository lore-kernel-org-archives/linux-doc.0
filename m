Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF423FE659
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 03:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457369; cv=none; b=tVQGpSX5IvrfmEjpZ5fVXcW2l2N4HpLgZfRFydVejY8TYffxKL0LFArdDZmuJg7WJFBvMnvAUFWkoxFKVoD6wAccom2dmJjdlTAoWkfKNIMXMItueE0qdNLSUyZHTtyzKh8YK2zqsAAj1P0jwnlTcSdScTxlhJ2X82ufXT2z6mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457369; c=relaxed/simple;
	bh=PI26M0khAE7StCXBHeuwdUicbhLFrZpiZfsokDq9n88=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y9StZuhoNwozUcgWR8VNihhfOD7tQMe+vjSKWrjt3tYmGJQZp6/hpG+kS1iHi+DUp+O6RHmtOBYFgsD9y11Eh27i2EdNw9c7hVGOUI5hYeICW5sDMqB9RSof776FwojG8kpEu6Dfo9/mJXiaxaW6nArbSAJD+DArwgwqQi6DzKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=H3gBJSfy; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="H3gBJSfy"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ccedaf0b54so27715106d6.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 20:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780457366; x=1781062166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZ44uuKaEudMkx03Nujcoh6Uuv+6Qpcd4aVYSw8wkq4=;
        b=H3gBJSfyhNg/d6xu8tLy3zhPjq0CIcVT/vNWBe0DuibKH55/qS4e6LLCg+5zeqDmhR
         hhwZQIsVo57hM55ZQDivV6QthQNfw6vBcVPhYuUS7p8LAiYLOE6N/cGo6VOaJ6epJPgU
         0wCwLZcspfeG20llEo2UvjtXyGe3J/5zBiPPolqLtA6J8xbD9wZeseSIW0sC2K+cs47z
         CxuvDvrCq4BiuXhYBof1v6DlVLI+JpGuVPPDiczcylwEmSjiay76x8Ax1qSl5eoUqHbL
         FgkfC+fYpuMSDtd2RcKttTwoU7FMSUgarS6naaReiZmhx5didspEY4QLcu+jFsE06j9R
         NVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780457366; x=1781062166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LZ44uuKaEudMkx03Nujcoh6Uuv+6Qpcd4aVYSw8wkq4=;
        b=EVYe+xc3KylTl0KDUutb5lvDZ26ht3k64scvDNakbTE7VPm8ZPr5V++rokbLi268hN
         B69k5LNLbQ3nyNWHVIDptW+cEGllMkjl8vvj9+98Za2npFASk5o16BzSjK+ZjGMQCC8O
         Tn5smyMoJGZkNr3IFDykrQxUgAMHGckTNKDgH5epUkyE1Ij3lZoighHd44yig1ZaMpfw
         9Tgzxerwvr3o4/FVbSZyyXOXk5LupN9LCSpeqYYDVWocfzJ6wNfJM4iugdsMDvCX5PRQ
         61GiAeWFW+g/lfdPIdclBpPBCVPr+calfprBUgWWUxGXbwboDMBfyumJOQzf7aaBvnoT
         S/PA==
X-Forwarded-Encrypted: i=1; AFNElJ/ou0Ls8QMfIAV/imIykHt0Lg/U6LcmdQbxjlYtjqAz5O6D371F8l+NY8ApWuB4ZSR4fYB6Fvg7G24=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx57QdEAyHYi7GzkPJhA27L6a4Ie27y3mJ3dRBl1bdhbNZ+70H/
	z82y+8VBMdzssAzCny7no/wOmad0XPsLVTsRMEDvj1W2ynpXaaloXDxV2OnpqMf1f4g=
X-Gm-Gg: Acq92OGFXbapk/aRJE6rQ/0sg1fVo5fBVHyPjBjrcApotDPBS63qfkMLJJS5SAdmRMu
	ND1wewMVxHVGJyKjf5m64hoZgrAmKKaa7BzcGcbQtChe5jiYeSrigTrWSRhgYzlpo4JYfjEGZmS
	lLPOxgNvF8vtQn+5/Xt7GoFvQExRD+RP66/msTLop96UlffcGwCOHHzpKZffEdOfnwqTy5tVleH
	HkoHKKi5tbq3L0pP3Jnk6CoNNZCuawUQ0+fbrYYCCaOaaajV45IT+lEMU4P5H39tkONu1ISN+17
	wGha8zznZePVXFOXXjzo2DIDk86RmJLM4KT5kKhZLAoxUMqsl5q5wXAa6bCG7oQme7qVlSMN1EU
	FisP0TEz4G2S+Fqki8dM6FVYYU1mae6YMfdCMLpgDHSGvGMdPQOhQBP0PUYnchyToPzigXXCidk
	31IOGjXB0RpBr0tTXgy/5/HBNqjWrR1Top/6G/HuCiQtNs8IJto+lakZkudRJZbw==
X-Received: by 2002:a05:6214:500e:b0:8a0:4e92:c45f with SMTP id 6a1803df08f44-8cecdc18097mr21849986d6.11.1780457365747;
        Tue, 02 Jun 2026 20:29:25 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b3b9sm9244566d6.45.2026.06.02.20.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:29:25 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v6 13/13] selftests/liveupdate: Add stress-files kexec test
Date: Wed,  3 Jun 2026 03:29:04 +0000
Message-ID: <20260603032905.344462-14-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603032905.344462-1-pasha.tatashin@soleen.com>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new luo_stress_files kexec test that verifies preserving and
retrieving 500 files across a kexec reboot.

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 tools/testing/selftests/liveupdate/Makefile   |  1 +
 .../selftests/liveupdate/luo_stress_files.c   | 97 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_files.c

diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/testing/selftests/liveupdate/Makefile
index ed7534468386..30689d22cb02 100644
--- a/tools/testing/selftests/liveupdate/Makefile
+++ b/tools/testing/selftests/liveupdate/Makefile
@@ -7,6 +7,7 @@ TEST_GEN_PROGS += liveupdate
 TEST_GEN_PROGS_EXTENDED += luo_kexec_simple
 TEST_GEN_PROGS_EXTENDED += luo_multi_session
 TEST_GEN_PROGS_EXTENDED += luo_stress_sessions
+TEST_GEN_PROGS_EXTENDED += luo_stress_files
 
 TEST_FILES += do_kexec.sh
 
diff --git a/tools/testing/selftests/liveupdate/luo_stress_files.c b/tools/testing/selftests/liveupdate/luo_stress_files.c
new file mode 100644
index 000000000000..0cdf9cd4bac7
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_stress_files.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (c) 2026, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ *
+ * Validate that LUO can handle a large number of files per session across
+ * a kexec reboot.
+ */
+
+#include <stdio.h>
+#include <unistd.h>
+#include "luo_test_utils.h"
+
+#define NUM_FILES 500
+#define STATE_SESSION_NAME "kexec_many_files_state"
+#define STATE_MEMFD_TOKEN 9999
+#define TEST_SESSION_NAME "many_files_session"
+
+/* Stage 1: Executed before the kexec reboot. */
+static void run_stage_1(int luo_fd)
+{
+	int session_fd, i;
+
+	ksft_print_msg("[STAGE 1] Creating state file for next stage (2)...\n");
+	create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
+
+	ksft_print_msg("[STAGE 1] Creating test session '%s'...\n", TEST_SESSION_NAME);
+	session_fd = luo_create_session(luo_fd, TEST_SESSION_NAME);
+	if (session_fd < 0)
+		fail_exit("luo_create_session");
+
+	ksft_print_msg("[STAGE 1] Preserving %d files...\n", NUM_FILES);
+	for (i = 0; i < NUM_FILES; i++) {
+		char data[64];
+
+		snprintf(data, sizeof(data), "file-data-%d", i);
+		if (create_and_preserve_memfd(session_fd, i, data) < 0)
+			fail_exit("create_and_preserve_memfd for index %d", i);
+	}
+
+	ksft_print_msg("[STAGE 1] Successfully preserved %d files.\n", NUM_FILES);
+
+	close(luo_fd);
+	daemonize_and_wait();
+}
+
+/* Stage 2: Executed after the kexec reboot. */
+static void run_stage_2(int luo_fd, int state_session_fd)
+{
+	int session_fd;
+	int i, stage;
+
+	ksft_print_msg("[STAGE 2] Starting post-kexec verification...\n");
+
+	restore_and_read_stage(state_session_fd, STATE_MEMFD_TOKEN, &stage);
+	if (stage != 2) {
+		fail_exit("Expected stage 2, but state file contains %d",
+			  stage);
+	}
+
+	ksft_print_msg("[STAGE 2] Retrieving test session '%s'...\n", TEST_SESSION_NAME);
+	session_fd = luo_retrieve_session(luo_fd, TEST_SESSION_NAME);
+	if (session_fd < 0)
+		fail_exit("luo_retrieve_session");
+
+	ksft_print_msg("[STAGE 2] Verifying %d files...\n", NUM_FILES);
+	for (i = 0; i < NUM_FILES; i++) {
+		char data[64];
+		int fd;
+
+		snprintf(data, sizeof(data), "file-data-%d", i);
+		fd = restore_and_verify_memfd(session_fd, i, data);
+		if (fd < 0)
+			fail_exit("restore_and_verify_memfd for index %d", i);
+		close(fd);
+	}
+
+	ksft_print_msg("[STAGE 2] Finishing test session...\n");
+	if (luo_session_finish(session_fd) < 0)
+		fail_exit("luo_session_finish for test session");
+	close(session_fd);
+
+	ksft_print_msg("[STAGE 2] Finalizing state session...\n");
+	if (luo_session_finish(state_session_fd) < 0)
+		fail_exit("luo_session_finish for state session");
+	close(state_session_fd);
+
+	ksft_print_msg("\n--- MANY-FILES KEXEC TEST PASSED (%d files) ---\n",
+		       NUM_FILES);
+}
+
+int main(int argc, char *argv[])
+{
+	return luo_test(argc, argv, STATE_SESSION_NAME,
+			run_stage_1, run_stage_2);
+}
-- 
2.53.0

