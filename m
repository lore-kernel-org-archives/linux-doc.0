Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E984B37107F
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 03:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780024886; cv=none; b=ah1/QkfaPoA0R69+XcykTdLQXENUE+X9vQIjMFRb3hsLCRz8GdiTuy2xCnqkyHf74VL96REaDOVj/vd//XV/k+ECOtzdfw1qcSUNSx5tAOkfNytR9zH/b9O3tuNg25g2CetyUptEuXb2GVfp5rvync4RJrHJMO7K+k38Zan5F4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780024886; c=relaxed/simple;
	bh=5h2GF0XbFDjqAMNI62aGoAqPGag11ae9hGWbCLa3/ew=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MUDDqi0CD4y+RRJqkpXjrQBIaUNK4GL60hjMwpX6YZjmT0yeUKBVUHRFkdMK5U/THNcTAS+wkVSF10rGYV3qz6MFOLJsjXN3t4XJSxuh+dD7J23kpaNhajMMAURnuRu6nT2WmiEO5kyf9+MscPrt47AXQ+P6/GbxvCTdJdXxLCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=YCqbSG4c; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="YCqbSG4c"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9106ea78cd8so2044178585a.3
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 20:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780024884; x=1780629684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DD7mpkHwGkKw+XnhrMPNwFwDdntpab6EeONlinrdH5M=;
        b=YCqbSG4cVmUbbUcN7NfC6z+TlNTNEo1/SoiG5DVgJgJgo3ycs0JYd/9P6j1TOmosfY
         xdzoJ6G7YUp5aL9uZLWRDpSFhNxvdiU0sVDqspADONwWkvLbBSs8GBsbnQER4ZCH000m
         tylGDIikhAy0gNVFewNG/VastMPk4/TJUsRW98fhSoBQwNgjOuR3guMSAYOq4MV4PkvY
         97+De62PaaSn2xluaz6DWQO0NXAr6B/7XDLCGqS/cajTwGXOws9wN//8NGPpvwcyR53P
         Nxa4ldcwP/BkypI07ldV79dOUfJ/tagKXdg0xlSnLHPeY4ymugSSVPR0Ria+2Cg11E4O
         5M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780024884; x=1780629684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DD7mpkHwGkKw+XnhrMPNwFwDdntpab6EeONlinrdH5M=;
        b=SI8KFy23j34AHB9jQ7FeHdZHkOhyFUxt8cmS9cteQ7Nqqa3AKVSOHyiVede9JHZb0C
         m5pD/6WchpWocmrUv8ZbqyQazK6G0+/mIF6kANRuXYu+5DJwAohmjjSbKdh0w/OCTFx7
         bEn0MHVn9TosRoJf1HHXeCbPau20AIwlLzMAjc+9l3WEZbuY2x/q2D1tzALHQUIPNSvN
         swAorCEfs69OgPhr5e1OsFJeEY8b0FRzzuJV9wdwOP4DW9VVnPlz/cQBYxZj95nZK4rN
         XOTVDRVYbm6BtqPc6y6XjR/DN93KqgSz715sOKUInTA1PVdpOHm1wT1hxmOs7sg5vbvI
         Ihbg==
X-Forwarded-Encrypted: i=1; AFNElJ8WCJrOaAl/poPM9PQNa3aGbd475h0UnpgVdlQ2T2N3G0uNPlAAg94aAhjbxRTkG//3Tfx9IoyU8ns=@vger.kernel.org
X-Gm-Message-State: AOJu0YydmLIH5F7nscN/T2mAJAY4ibejU1P73w7QOMhd9ooaJc0sZtPu
	jgK0Sbm0cgwPhLoFR/ybkHeHkKpEp3oltuxMAISdrJs/U19Q5y0IeYEfSDRVHclZzcTctfzmMb2
	TitfA
X-Gm-Gg: Acq92OFcVFTwVydDC03zlk0kks7Yb/+0um7cMf/JHEcEI6IRSD2dwSSXavFlAoMZU4l
	0u4OBAnnjBZiJNzryz5y5RhsvFXBm/PW9w0rhDViQLaQ4HweaPjXTVtLmX8Glb5yWfd/cIaW0Ns
	WaYn5G38SbuGQmM84ErhFnzOUbjc5UKDrpXta4Wj6p5yLyDRDpXxZwIQhxBcRTEmp0kkq12HOza
	1vEKTMH51uDqDUHBEho95cttRT3cekoqUjKx4eZ9BAg0xQ5/oTH3KTHITANcZVg2LLkiTeowuKc
	h4vOMfBjjCvwzXUge94oCMKrKa/dZlpdvJRoGSWme+HDI5JuIWM7zfTfMxlBrih5MjNox3Gpgx5
	nC8YGFuhuLqd4OxiYr7NVLWe78bOc/ZjNJ73iIPUhk8a8W16dMJXxlSjkvE9Y+pDc5oXZGuDxQG
	ioE0WDTUbUuN7cUeUAwgtMENukd7ZAABEpDaOwRV6of/mF+9OyBibsikF3VK4mAQ==
X-Received: by 2002:a05:620a:4709:b0:914:bb8e:915b with SMTP id af79cd13be357-9152fd2fc49mr147943985a.21.1780024883867;
        Thu, 28 May 2026 20:21:23 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea26d286sm1179476d6.48.2026.05.28.20.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 20:21:22 -0700 (PDT)
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
Subject: [PATCH v3 11/11] selftests/liveupdate: Add stress-files kexec test
Date: Fri, 29 May 2026 03:21:06 +0000
Message-ID: <20260529032106.1505796-12-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529032106.1505796-1-pasha.tatashin@soleen.com>
References: <20260529032106.1505796-1-pasha.tatashin@soleen.com>
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
 tools/testing/selftests/liveupdate/Makefile   |   1 +
 .../selftests/liveupdate/luo_stress_files.c   | 101 ++++++++++++++++++
 2 files changed, 102 insertions(+)
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
index 000000000000..b6a0c3899890
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_stress_files.c
@@ -0,0 +1,101 @@
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
+	int session_fd, ret, i;
+
+	ksft_print_msg("[STAGE 1] Increasing ulimit for open files...\n");
+	ret = luo_ensure_nofile_limit(NUM_FILES);
+	if (ret == -EPERM)
+		ksft_exit_skip("Insufficient privileges to set RLIMIT_NOFILE\n");
+	if (ret < 0)
+		ksft_exit_fail_msg("luo_ensure_nofile_limit failed: %s\n", strerror(-ret));
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
+
+		snprintf(data, sizeof(data), "file-data-%d", i);
+		if (restore_and_verify_memfd(session_fd, i, data) < 0)
+			fail_exit("restore_and_verify_memfd for index %d", i);
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

