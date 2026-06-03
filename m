Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B8C3F54BE
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 03:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457367; cv=none; b=AFy2X3I14ZQ7HL6UnMiLoqD+cZ3//ZmuTLnTEyimGJmCA9GJDd0bfqDWhR47wYmXs+DyepaMKibzq4PAvlg2zgUmket5fVMUfJWAw73tGrCI6RJsDWGujYyxrXkzJZcSujjVTd/VoOKpLjy+1Fvwz104L+8pI/88FbMl3YW6UUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457367; c=relaxed/simple;
	bh=zVenBMcmRxURhVBZmDsLf2LabKQiVm7GKN1LU8rMyS8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CsAg5WHcReUz8TY38VjcRt1ON9lYN3TAKGRiiz2pzfVWiQUOnsJOts4Qs/nJzBlrboyaAOihvsKdQC0U+H6KeMhmcDbvXJK8VXYu/FO9HXFLOPsyvhB5+bnyrujlAh4z2nsWu7V/N4laXy6zsYfRs8NsSEo5kwu8HWx7iZYy6a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=XcFBWTb6; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="XcFBWTb6"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8cce26ee1e9so82146486d6.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 20:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780457364; x=1781062164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psMAwGaqe9xuyJY3Mn283ARVP/GQQXmgr+1HpWpGRKs=;
        b=XcFBWTb6hZQAhAjn3K7CmzlQYZ5HKzAUaHLOiOssReJ0XjOKQgMHVQ3rWuLRdUIchY
         fd2DnWuCLs5nnFQmy1hQArIIz3+b+4Mf3uWwkpqEQ7cq5+X86qKsDUQep7Jm1mU4xRrT
         Su57PCruJvvsWIE7F9ajNVNJ5m/gzrUa7VhLAN4c0Ag2Ik4tXKGdsC74wYcGnQkLWGzc
         nC6N406w2XsG5h4c2dbTfp7VVkallWqNnIx8R9zdwqs2GSqcg47tNfYUnjPv+9eUavbq
         M0UYlj0yuKAo5F1muDoCnCB5NrEXqzvHJyeiJd7FMIKuoGup6HBqR9s3rljRyNw6zT1g
         s5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780457364; x=1781062164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=psMAwGaqe9xuyJY3Mn283ARVP/GQQXmgr+1HpWpGRKs=;
        b=SIArx8CgIEsgJyTP8eN7guxLXjiv7DIMRSmW4QXM9dC/Nc/Rt8kA+TOjZlZG+3iGOH
         Xuipz48EfoIYjXzp3Hd2hlTIGcjJ96+THP2XZ373mY3dU1c3UpxPf9QcVnAlnwdAdYlT
         M4LBC3hplPiL++5yFI4c4GhOc1LkkOhnZsIU1QppneR5PLeG+6T0lYfSflAJH9Exgi3m
         fTVNw4XYUaXhmtwz43yLhpBaxO7fX0c+QmiT6nZ0a0fPMjFe1tMLM811RBTdjmfDqkNT
         dkX3apR5tigRt+A57WczhQkwVc0YIIXoHmCXjafltmI/1jAD3a3P+kglFvm8RcXHWM71
         YtGw==
X-Forwarded-Encrypted: i=1; AFNElJ+E4Ui7gaCGRcvyHUcYOgTeIGcLjCbySeiqhn++o1LRujEerdiUK3kSXo7m67FpRzRpbQMJCZVIj0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YysNgA3oDuP3wxN0wDjhY2YLPtJZCNKJERYtjBhBBafKkNmHuf5
	AXu0LCPcwJuRNctqr6DXI6J+LCqTj2ROMVdHLzkVIU9UYJ8bK9xPdNvIB4vLRIoslPk=
X-Gm-Gg: Acq92OFDSUdj6Zkil/j1PLOqFH7cWGnreCoPdODURB+8iP5ukC0REzITglLAXeDnGXX
	zUYEZaiFUcmwNqE6ccUc3d7ra28S2EtTqZWgnyfmklIxgOHkZrel1lxT+Y2ho/VKTX/dhCP6n2P
	bL7VS7/8WREU9saXrI+NNwY3LaNv5bzDr1AiKOA6THG2Rh1h93ZWMVf+9vi2rzz3if5PF2uzs7c
	QVbfYI2otqEn+ZK2K4sQ56I3U94XS9oEiubzeof80ZEy6ctWMCUwjYDdMPTKGFqHaNTxl94JUz+
	1YYe+yKIvjrFmKaRLTQ72vmexuls0ESYio/cx7zF+tBJ1pnjqqQjyEvggdIzJxOVCBqGL65SqMQ
	ENSd/bDZX19OYOWsivuobJnnUKVC+pkllFxGeMYsa5ZQ6qa8WMMLN32edptdj4BO8CKxuW9uNxl
	3rVPItrPpNezQoQdNuIGm6Lc5ZYUtT0BDa/xs05zaQBSKYVsOgpUA43C/Pm/9Lzb/0ihPQ40Sw
X-Received: by 2002:ad4:5044:0:b0:8bd:59a6:4165 with SMTP id 6a1803df08f44-8cecdc04bc1mr16915496d6.4.1780457364532;
        Tue, 02 Jun 2026 20:29:24 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b3b9sm9244566d6.45.2026.06.02.20.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:29:23 -0700 (PDT)
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
Subject: [PATCH v6 12/13] selftests/liveupdate: Add stress-sessions kexec test
Date: Wed,  3 Jun 2026 03:29:03 +0000
Message-ID: <20260603032905.344462-13-pasha.tatashin@soleen.com>
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

Add a new test that creates 2000 LUO sessions before a kexec
reboot and verifies their presence after the reboot. This ensures
that the linked-block serialization mechanism works correctly for
a large number of sessions.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
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

