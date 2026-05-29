Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8090370AEB
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 03:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780024884; cv=none; b=AcEur9lean8PE7tVH8iyME+wJmUMlo3nXILS+FJWy5ahQkxwa3mObq+cJbhtvTEqE1q5AAupy8vBTjf+RnmUdZ6HiT5/GIYAwYdiogv5ZGzTIogwqxOSQiwqlpQi2v+iFlGH47+kk6SfR9gLH+ihyL0n+iqivva3ngrBHt0+4+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780024884; c=relaxed/simple;
	bh=PwW6M86VtpCYbVanCRu9RC9XepQoEWHm1vY/6gS4fT8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0FpTOvIxl5ZhtwjQ0bEteq3cRa4WNsXKOaFAKXzV/sUsBtVuC5QZghmLsQ1u0zZkVTUuhRhqXLS/9wZm1JVuZCpSsQH1pvsMGAwwiLst0KLznh0Jznz/Bf8ggVZ7QZRfqNtwekvTcYm08WS4KKeNA8irqJqUjlc5U40Y4CcJ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=b+4kwRa8; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="b+4kwRa8"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8bb09239328so102516236d6.3
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 20:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780024882; x=1780629682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMNVhv3SnOTuZ3xqpMfMs2g7riJHPagItEAHtnUEWTI=;
        b=b+4kwRa8f7qrkyNsbDVjH0o6FjozCDeb8hD4uzPe2/f34l0/Kpab6HKSKhDZlwcFA5
         v9Y+mm0dEzdSOhwAsGrTI1eQCNAJuFop/qtwur22W0cYDPJTB/cjx83EKznqE+X5iYD3
         n6R32cHt4+9XnqW+zwEBPTQnm9bO1OLPsT1NlLIm+vM5uQZCqFSIUG5EFkXlqf0C9xO3
         0pYh16JHzgVyXOu91BYTtaDcXt+6iY2Qgn7CjcPbAWKYiE0HJtvoevzCzCM30V6ncexg
         NAcx5SllZtIBQr9lNhJPREvjtRZIcmgQJooyFkXS4HOCK6tU/8jDPqWxlPTg23GrokJy
         XkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780024882; x=1780629682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zMNVhv3SnOTuZ3xqpMfMs2g7riJHPagItEAHtnUEWTI=;
        b=jaY0N0rjYqzuizzwEKxpYJMCUcOde+Pr45TBwr/cQBZfaWe0yNTMa3sTmlHFUhslbA
         eMLbY8mCTbAoE6PP6MuB5sFMi59fNuIsXycX+fuPrtG1y4bfjvR1E2YEmkdMb+/jNQuM
         YTl/XB5VV8/b5FDDfja2KibRNtyxCYQo3Duqve1yaeRR5yDpdVVqwCwicOyTSeqnnAb3
         Dk0CMTkxvqxI3IR9W9NkFw/nmo0W7xBfBGzQUNELWFaBdd2de5nJo+LPuUpe27/nPyfZ
         0B6/IMkZNedF/Hx3LDa9trI6K8SmfNJQB4WduMkEW66oUQPD3S4QSP9QjHnZzCPWnFXW
         eS4w==
X-Forwarded-Encrypted: i=1; AFNElJ85PsmebcQnEbARR6AiescKqeP1zoHVvFh3RLvNMVpQ4b0EvgXoCc2itvMmPoGbDg85LDI8WeISKxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNVt/vo7QidWsOyvD1rAC4Zm2Dpq4MI9Y2OB0VhQtTaP5SOnPv
	XJiijosE4HMVgcTLSqM1DXXk9157AkpRlX2bCyEfNrq/DpJYMX1XVUr/IyFXDuvvCD8=
X-Gm-Gg: Acq92OH8Nb73N8Z16jzqcMCXYjiPkznssdKqA+8L96L77y4eHcgoN24Tyn8+dA5pzhw
	pdgehWIEoXyPpLvl3lokICKsbd+hgqcruJcANZqkNnLb8Cr6akL2It08kQ+IGyQ8hG5rp9y2Nmp
	DXCVQDQ1B9gMgnOAIMsW8qucimNJlj9UhNMSpHRbhcTTodew5gGlv9MtOH8u7GGTatn1Jw7BGxO
	dtrZlqE26hPyLb8fprNik8YtbjoyC+r7w/TGGC0vwFWbpL1uCV4iMxuVqroms1jrNZIrKXpAXmg
	9q4fPWnn1m8qHx8YDbfDmBN1iSs4hgboTs5x4k5IsA9W1EYb7ZSo/2BkmGyKkku9wtmBa8W34oZ
	6GC3wTZtMBEbkW+9+tdeF2F9e0eJdGRkD6ZOPtcsPhKYjQAnEkz6uuvi3WYEQHwbo/b+9ne6s/e
	FdMzDydjcFB/nmrSMDKu0Gkwbx20ACw6hh+mN8IeY+566VFNBByFRvOloDo7wLeA==
X-Received: by 2002:a05:6214:518b:b0:8ca:deb:3f9f with SMTP id 6a1803df08f44-8cce82412d1mr11698806d6.34.1780024881756;
        Thu, 28 May 2026 20:21:21 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea26d286sm1179476d6.48.2026.05.28.20.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 20:21:21 -0700 (PDT)
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
Subject: [PATCH v3 10/11] selftests/liveupdate: Add stress-sessions kexec test
Date: Fri, 29 May 2026 03:21:05 +0000
Message-ID: <20260529032106.1505796-11-pasha.tatashin@soleen.com>
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

Add a new test that creates 2000 LUO sessions before a kexec
reboot and verifies their presence after the reboot. This ensures
that the linked-block serialization mechanism works correctly for
a large number of sessions.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
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

