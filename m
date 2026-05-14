Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0D93D47DD
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 22:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797610; cv=none; b=nkSNDpxcccggU3mvgOzO0MqG+GWkdeXQuQXgyj02/M97CkM5AvAEXk9bORGXR2KpB4CKGgOzPacqBrEOOCXZslW7CRXAEdJcGofZ/z9+rwG+7kxJ1Nt1adNRu3jNjte6Rdwi6INYdGsdprsAlQo5fd1cpl60Q4708A8mE0nj5ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797610; c=relaxed/simple;
	bh=WTBJUEEMM7K7ob4xZeJB7qcdaYVjvJmNAEO/PdJgFis=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtPWrWauwAViSx43hVpbG4CJOCBSHIALr+5zx1cti36p+w0/o3oyqPCJ/A8Q0t6CZnXvLANpo86uD3SCDIhoC+K5+Ao5sTcvwTOlktIN2sflIBnJRHo2MPXlhwvfd+fX7OsxthFOTgG2GeNH0/ksIr8TiEs8cJlb4g7i+JibbdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=G9qChUUP; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="G9qChUUP"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50faf8ed9c5so45563901cf.2
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 15:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778797608; x=1779402408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+TDIuCJZXpxQehieZyZSUnjXJ4NsIJyCoOgTpI/vhI=;
        b=G9qChUUP2pceoS8Sp5qeM4P+165yrFC0mNQUOYQuU1NZDfsSZr5IXR5k5UiaAthqOi
         NU/vILiRhPsYf2/U4IhdnfJUrwH02oAwNNlLTVW+CCDxVHQ/Tf5kKB6uNErGNHAInmDI
         BCEWU0I27zaMcRxI4Edl5RY9vHn4ButA2KIzKop5KjzRQiYKfC7kOw0/mEyYpdvU99WT
         WWT/VFcRytvUIXYdS/6MjNsR1qpXX0dCTL/Ar1GDi0br+AZGt927BBriBFv0NSX2WS1U
         TlkVyNxMqC146SdKTCKoz+1aX/uYUQXEenARywIxDPwDzCMsQRQGPuZB5Yr4tvccXDPa
         TnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778797608; x=1779402408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+TDIuCJZXpxQehieZyZSUnjXJ4NsIJyCoOgTpI/vhI=;
        b=Y2SYSbg0g6InqTudFJKqIC0RKRkrq6a5OfxPRLrTjWJAYzqhJWc3GDTFVbiwr4U50o
         aCgxKYGXGTTe72JrFOsJpq0s6mIxvHfr5/BG56UR3PD65EVbrZKfxGq360ZKbrG2Mphe
         v1zAIP+wOcp28wTTGk3ttJ1bMkfgzELWkzYY22YLNmorgTegwL34B836wtC20klR/Et7
         PyYWptMdPCgxqFkAmYFox7gTZiFl53iBs+uWTexqKlxqq8KQMBkG0SubXKY2n1ubhBQE
         jqTHX4HAk6R7braKpBmM0Zxd3ogMwcAmDnBCpsHEsvNaJHX5wHmmOkl/8OK0ZB7ScNIM
         TcNg==
X-Forwarded-Encrypted: i=1; AFNElJ+6BfPz6eeSw01lyUy20+pzoqJRXQB7qIO6z5q77LO3c/978qeUl0Y+cXSz6VOTqNaNVj91pyTS758=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyjOKCBScS/98kyTOqkX8LTVCssKqf+38M7uVSrPfixnq5Jrr3
	SqNmPxXGlaTP+aCWkWISSbtMRU47EevvTmWqkbRTSPPv2Os1I8tElxoZta9mwjPEwC8=
X-Gm-Gg: Acq92OFGQpVaqVQdxs6a+JMyj4Gy1B+kj+aqBp9uML8mXJ50QeOXGUFtHmPrWVfyFyk
	1//vQGYNKQDv29PUNABj2KsMsTBTAU6ITqcNZuZWsnPXCs7ax5ikxYkQaglpm1FbYjO6v1KZM4i
	+Zzj1ISpVR+IDW545NCwvNGvuR2XJj0Rb1D6vKCF1bozQsVcKgZPOTyHIIjnY+OD/ZnKt762RL6
	J0oXAeN0lnILLT9C7WYqn3SOjzDI7NHK2DMWCU8DgII+dber/diay6RNkot4aGRlgGLy2yxbXNP
	F1SIIcdDvQrOXtbNJYrbkoVMMh25DJBfkcqGvXRaoIweC4VnH2LKka2c+4ynn9XTk9+4TjioptX
	hPyX0KSvsJf4BYuTLgQhf8VuVVlfuxy3B/nSOLeGus81s0aBmcBQMaLQ69ueN7YyeEq4cU3a+Vb
	WisXVyuhrxKQlVwGvbvbjjJYSkr/nbIXIQxI8hQ+PYkXp/Fo+As8w=
X-Received: by 2002:a05:622a:15c5:b0:50d:a8f5:1c02 with SMTP id d75a77b69052e-5165a219a43mr19531391cf.41.1778797607915;
        Thu, 14 May 2026 15:26:47 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456ba92fsm28671901cf.9.2026.05.14.15.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:26:46 -0700 (PDT)
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
Subject: [PATCH v2 09/10] selftests/liveupdate: Add stress-sessions kexec test
Date: Thu, 14 May 2026 22:26:27 +0000
Message-ID: <20260514222628.931312-10-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514222628.931312-1-pasha.tatashin@soleen.com>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new test that creates 2000 LUO sessions before a kexec
reboot and verifies their presence after the reboot. This ensures
that the linked-block serialization mechanism works correctly for
a large number of sessions.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 tools/testing/selftests/liveupdate/Makefile   |   1 +
 .../liveupdate/luo_stress_sessions.c          | 102 ++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_sessions.c

diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/testing/selftests/liveupdate/Makefile
index 080754787ede..ed7534468386 100644
--- a/tools/testing/selftests/liveupdate/Makefile
+++ b/tools/testing/selftests/liveupdate/Makefile
@@ -6,6 +6,7 @@ TEST_GEN_PROGS += liveupdate
 
 TEST_GEN_PROGS_EXTENDED += luo_kexec_simple
 TEST_GEN_PROGS_EXTENDED += luo_multi_session
+TEST_GEN_PROGS_EXTENDED += luo_stress_sessions
 
 TEST_FILES += do_kexec.sh
 
diff --git a/tools/testing/selftests/liveupdate/luo_stress_sessions.c b/tools/testing/selftests/liveupdate/luo_stress_sessions.c
new file mode 100644
index 000000000000..f201b1839d1d
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_stress_sessions.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (c) 2026, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ *
+ * Validate that LUO can handle a large number of sessions across a kexec
+ * reboot.
+ */
+
+#include <stdio.h>
+#include <unistd.h>
+#include "luo_test_utils.h"
+
+#define NUM_SESSIONS 2000
+#define STATE_SESSION_NAME "kexec_many_state"
+#define STATE_MEMFD_TOKEN 999
+
+/* Stage 1: Executed before the kexec reboot. */
+static void run_stage_1(int luo_fd)
+{
+	int ret, i;
+
+	ksft_print_msg("[STAGE 1] Increasing ulimit for open files...\n");
+	ret = luo_ensure_nofile_limit(NUM_SESSIONS);
+	if (ret == -EPERM)
+		ksft_exit_skip("Insufficient privileges to set RLIMIT_NOFILE\n");
+	if (ret < 0)
+		ksft_exit_fail_msg("luo_ensure_nofile_limit failed: %s\n", strerror(-ret));
+
+	ksft_print_msg("[STAGE 1] Creating state file for next stage (2)...\n");
+	create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
+
+	ksft_print_msg("[STAGE 1] Creating %d sessions...\n", NUM_SESSIONS);
+
+	for (i = 0; i < NUM_SESSIONS; i++) {
+		char name[LIVEUPDATE_SESSION_NAME_LENGTH];
+		int s_fd;
+
+		snprintf(name, sizeof(name), "many-test-%d", i);
+		s_fd = luo_create_session(luo_fd, name);
+		if (s_fd < 0) {
+			fail_exit("luo_create_session for '%s' at index %d",
+				  name, i);
+		}
+	}
+
+	ksft_print_msg("[STAGE 1] Successfully created %d sessions.\n",
+		       NUM_SESSIONS);
+
+	close(luo_fd);
+	daemonize_and_wait();
+}
+
+/* Stage 2: Executed after the kexec reboot. */
+static void run_stage_2(int luo_fd, int state_session_fd)
+{
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
+	ksft_print_msg("[STAGE 2] Retrieving and finishing %d sessions...\n",
+		       NUM_SESSIONS);
+
+	for (i = 0; i < NUM_SESSIONS; i++) {
+		char name[LIVEUPDATE_SESSION_NAME_LENGTH];
+		int s_fd;
+
+		snprintf(name, sizeof(name), "many-test-%d", i);
+		s_fd = luo_retrieve_session(luo_fd, name);
+		if (s_fd < 0) {
+			fail_exit("luo_retrieve_session for '%s' at index %d",
+				  name, i);
+		}
+
+		if (luo_session_finish(s_fd) < 0) {
+			fail_exit("luo_session_finish for '%s' at index %d",
+				  name, i);
+		}
+		close(s_fd);
+	}
+
+	ksft_print_msg("[STAGE 2] Finalizing state session...\n");
+	if (luo_session_finish(state_session_fd) < 0)
+		fail_exit("luo_session_finish for state session");
+	close(state_session_fd);
+
+	ksft_print_msg("\n--- MANY-SESSIONS KEXEC TEST PASSED (%d sessions) ---\n",
+		       NUM_SESSIONS);
+}
+
+int main(int argc, char *argv[])
+{
+	return luo_test(argc, argv, STATE_SESSION_NAME,
+			run_stage_1, run_stage_2);
+}
-- 
2.53.0

