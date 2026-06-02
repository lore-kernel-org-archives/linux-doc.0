Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A3F377553
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 03:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370260; cv=none; b=YUed5PAbAPzBwNDEmROW8wpkVeHVJ/JzHVdtGs3P5Gr7JOvG9k5DCSmlsR3Qnn3/86MzyuIzdAQMRHJXVGrDue1SSB/73zB2gU28pwBHPBxS3LxR+x8m6AXoUDZuIpuIV5yafTHmVeQw3GM/I65FLGdp6wkUCZkiD+7b0kJ0gFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370260; c=relaxed/simple;
	bh=PI26M0khAE7StCXBHeuwdUicbhLFrZpiZfsokDq9n88=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PKW53Ym1NgoK8+C60OKb8ujfTLwuzxzSfvGZNIXvr9E/P0s2cp2QXMGLq20PELl3q/5amX6Zni7ztqXRidUSO70+hHb+l9qHnFIH2oTx/ehUIZq5YMF9tjuFSYjY7UHGLrSWvOBtdCbyGMpeupKm4qSDabIjmA4bjgJn9JQ2NqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=C4QE7CGJ; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="C4QE7CGJ"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5176096116fso10257831cf.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 20:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780370258; x=1780975058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZ44uuKaEudMkx03Nujcoh6Uuv+6Qpcd4aVYSw8wkq4=;
        b=C4QE7CGJcAqV2/zrxG4d7x5xbeua9cAzc8XndG7qWl+L2/hZHZtwC7KVyRhQOHJtE2
         T5aa8xwbPWfZWI/R3j9XoppRcgaiVHxQchY6sZbaAA+ttazu8Noy/OjpCNYvp47T2lmA
         ZCnaq8pJJvZhm2AuCfdmY7S+SOjeHVCHAXmBsNoIV+7xFK6fDdbmKn7k/pcJXyn0RTDZ
         vLEkbNpVZpRkU/KKG+m32NosX5hB6SY1uAlyxa+0J5k4wEdDgrbdzgmBTlTH2ADz+Y7c
         amIJE8MeSkwcqOSVYF9Rm0B4OYx6wYU1OADR4DRsbZt5d1SczG8KnENG06drf9vNaOV6
         1niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370258; x=1780975058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LZ44uuKaEudMkx03Nujcoh6Uuv+6Qpcd4aVYSw8wkq4=;
        b=O2wDQgZxwfHq1HYX1/vRY73/hWVNbI203BcIdsWNky2rgbN0jNEmufBMhDPmHTqsMQ
         Wjd/NFhVg7l8f0750QUOb5X7i618GLaTSww7nVQ1Llhcm5wPyQ6aW+qMAPhk0s7x5dNQ
         WRoORXPNXlQfnrUwX6HkM7lwb0PSnTEVhX9glIpfBmCwlibo8vl4O9IV8W/vsLfHr4qq
         B4jbjwEbY52RV2IAR3naJuDtW2XTrzfJt61GK44ZHFQaTX4atxhZbK43hCavEGDHC+42
         PNy2ONnUqYhzBJ8T0auztcOWj8BWnJgUjnpaBiOrLHqgoSiX130vIcPZcy7b6TfoQVgL
         XC1g==
X-Forwarded-Encrypted: i=1; AFNElJ96hjDrAMQ30a/K2OGWWqDHPujtIX4UL+bH1GHmhlKrL+E3XHLAJfYBkCso94s9PO/Xq03JIM7yhsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YynfL71d9WoiPgZUEz6Vd43xYfT4po7t/oF0M732vbFd08P50b1
	48KR+hbdsad9pYxY11ecPaUBZLYR2HpUf8rJgWjdmaC2HIiW8XQ5yymgDKQfDilphJg=
X-Gm-Gg: Acq92OFlDAdYPmK4Pc7Xz3xqbQWpMstiT3Te9WE75VcgbjJASiGnbw+0Ox9G4+Cb+fd
	Yqk0E72hgp38QCcix20J+NV2Qom5PG/0Ojy2QUnUDb1a/f0KPHvzkjFSR2QDz03AwVj6RbSaZMB
	BBhoPt4sXXucQ/zlUEvuRe/4WkqEuBxricSvBZ6JtzuN5/NSU7VgygYpk/0I1lOMZpT5qARBPzc
	5KSrr471aQvBi2uqmy0wlU/EcbliSL/XUPRYMitj9UWg+xGkpRZNyLBG9RlW7IETba2dmSlIqp6
	h1tcgjQTiOrirWvnr3aFIBDe1Gj/9LP8UG4b14Ok54wyYEo+22sARngCL0ysr993/U3zJ9+iEgB
	SzH258PlTsSh/dzff63U26ELo68GsdtKqIIoMaMCV5nznfg/GiQNjr4xbLAZtIzxIh2z1WzLlPU
	7twsvUsnmzy2gHh5EozfWNWOdLATyaCsrvWg+euuxyGfcThiq/EPAuVUFM3I9R3P0Kb+DRqqBD
X-Received: by 2002:a05:622a:1f9a:b0:516:d781:589a with SMTP id d75a77b69052e-5173a73b0aemr208229881cf.22.1780370257673;
        Mon, 01 Jun 2026 20:17:37 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b29745sm71219081cf.8.2026.06.01.20.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:17:37 -0700 (PDT)
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
Subject: [PATCH v5 13/13] selftests/liveupdate: Add stress-files kexec test
Date: Tue,  2 Jun 2026 03:17:17 +0000
Message-ID: <20260602031717.197696-14-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602031717.197696-1-pasha.tatashin@soleen.com>
References: <20260602031717.197696-1-pasha.tatashin@soleen.com>
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

