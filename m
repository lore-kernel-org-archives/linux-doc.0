Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D26372ECB
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 03:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370257; cv=none; b=pWzP2S116njiITKdpdVY2jbAdMzZ6T8AEhAwOiINxDBQ0x3x/l7pQI4q/gG1dlFImHGnbxXw6k8ut9qdhJNljBkGsONUvaJ8xoFHW2BLzemJ8fskAFjVGofuZEvfL17qhuIfiWoUvRubELIAqLyiz46Xa6+rMX2PvHYDNx2gr18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370257; c=relaxed/simple;
	bh=GqAk9WL9MH7rJUNKZjopN3vwXWkbaerKBCceA/gzAA0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unz//AJDorR8MaRQ6IuYyqV6F5f8kc5d8KNCZ22fgrJt6dqmUCK03VWQKE9KGHVXv5ZzfI5t6X8ZThPqIznMcOcKSE/hmjDR0+CTLY7BSiGHYSYBbBEBJvMKhwnSmNjUIF9x6LZXgydSc2dn+vhaQey/N+hQw4Yz/pTrg2TFY2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=NPOuCZLu; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="NPOuCZLu"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5176d4c14f5so1009121cf.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 20:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780370255; x=1780975055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdAegEf5u3em8MUzB4xyEunyt/xoJrJRQD9FIOINoRs=;
        b=NPOuCZLuLPDsop8BcLV48NuvSoaOulDxTw/E0mW4t+kNQdA+f2agMd77hy0kkq4vBW
         hCv2tZ0hwf9BAlwbuGmFyupmUcjs2RhNq32qvZhswklNjO942BaGgDZ33Nu1zJSQ5LAr
         ehkTT3VAr5b4tav7mNstTqQGgdXCjWPtpKrc2W9XaUT7ktkxjxvY7X1qJPCVnn3DkGzY
         2mJVl40l8+SxK4nsTm71PuVxRbIICwOBLczH8w0a1bTHfBSIRHZpZc2UYNxtHwZyVELf
         bVPEXYKLskY81/qjDBBF+aJvonh3ant1CJBAtAZXJUAuS+QF0W8CQWxMHzaltSb8H/8w
         f2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370255; x=1780975055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SdAegEf5u3em8MUzB4xyEunyt/xoJrJRQD9FIOINoRs=;
        b=Q83Fdt5x+kpbz7ZmQd9HY7EO3/7O/QE6YxwFFr8o/vuTx3H8RCWlXP7rnyD0q8RNXQ
         ncLDreRn+ZJoQFfe8qOIlzD6rNQD2tWSJpcMxd8bR16aM6yrwfVPBcfpfmREQtkr9lbU
         kTD2Bcp0M+Z5nfguMExg5g9eU3KFlSeOysE8AIXRZSNdq1z2QWD0ttk9T2uPMyM5RH+O
         7P1F1W9HAxmekTENRWnt4iwYv/X3UK7UYlHi/iAH93TPGVJ9acLtMtghYETvUZf5YkhF
         IDy7R05IYGH1wqo6Pn52il6SvLPWB6o/4dlNJiD8F3SK51GCU/JtLrTBgbySyIlx3gLl
         XJDA==
X-Forwarded-Encrypted: i=1; AFNElJ89ffWV1p7BVHIwENgRF6OfCX+oD6d++/L4+i+fzo1ucS6wBlkDFAOIjZuATf+s2qpqHKTeAu91UMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFlziPqHgdYOaPnnGDGWc5uclTGzGj9qSKRzTvaHK7rL8dZqPQ
	jpH4X0czu136+JUIMtRkhV/VtAI93g33oFM41QP1U8ipSAr/P6hk3N76WiyTlQAPAOU=
X-Gm-Gg: Acq92OGfi8Yg9mZmckyWQGTgz8DOKpS/sJVjZqPY98eX+vBMHF1TamxkZy39FxOdX1h
	4dsR2ZcsXDTDCQFHoh6UPkHjaS3y/97JDSYFxxX1hqxZxOzUoU8nnbubqArh1tTbzNmQTzFLvBR
	j03fkMlEc89cmANIJ/OJ2Amo9h+dmZQjyiTFdfZM/u9rv08TtEXlOIjVjRwjkYVKdUIKTMxpFUs
	okE3Xxkr6wR0zSjmj1RzCxF0Imx9PdvKV3MEa6w4P+vbK4H3kWkpWA9wh4DL7RN23N+6YZ1jWqx
	MbC68rILub9PjI2XJM/+sFJrbfWt1NxIsbu5BKdW1i49S/DQEZrvOpuxAMzgYrt++K5SDTOAYvF
	SkQdbxB0pX8L3HiP55gavXGkcvmn78WPTMtkK9G797FgwyRQ6e9rxvnAp99QFPafZjzRfHNmSDN
	poJ0mL+8RL0n6GlPLWZgpKedvejgqC4/SMpP1EYOyTBHuphoxZOJKkqFPp53+/YA==
X-Received: by 2002:a05:622a:4d44:b0:516:d971:1cb1 with SMTP id d75a77b69052e-5173a7b5766mr182980701cf.39.1780370255021;
        Mon, 01 Jun 2026 20:17:35 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b29745sm71219081cf.8.2026.06.01.20.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:17:34 -0700 (PDT)
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
Subject: [PATCH v5 11/13] selftests/liveupdate: Test session and file limit removal
Date: Tue,  2 Jun 2026 03:17:15 +0000
Message-ID: <20260602031717.197696-12-pasha.tatashin@soleen.com>
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

With the removal of static limits on the number of sessions and files per
session, the orchestrator now uses dynamic allocation.

Add new test cases to verify that the system can handle a large number of
sessions and files. These tests ensure that the dynamic block allocation
and reuse logic for session metadata and outgoing files work correctly
beyond the previous static limits.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../testing/selftests/liveupdate/liveupdate.c | 75 +++++++++++++++++++
 .../selftests/liveupdate/luo_test_utils.c     | 24 ++++++
 .../selftests/liveupdate/luo_test_utils.h     |  2 +
 3 files changed, 101 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index c7d94b9181e1..502fb3567e38 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -26,6 +26,7 @@
 
 #include <linux/liveupdate.h>
 
+#include "luo_test_utils.h"
 #include "../kselftest.h"
 #include "../kselftest_harness.h"
 
@@ -499,4 +500,78 @@ TEST_F(liveupdate_device, get_session_name_max_length)
 	ASSERT_EQ(close(session_fd), 0);
 }
 
+/*
+ * Test Case: Manage Many Sessions
+ *
+ * Verifies that a large number of sessions can be created and then
+ * destroyed during normal system operation. This specifically tests the
+ * dynamic block allocation and reuse logic for session metadata management
+ * without preserving any files.
+ */
+TEST_F(liveupdate_device, preserve_many_sessions)
+{
+#define MANY_SESSIONS 2000
+	int session_fds[MANY_SESSIONS];
+	int ret, i;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	ret = luo_ensure_nofile_limit(MANY_SESSIONS);
+	if (ret == -EPERM)
+		SKIP(return, "Insufficient privileges to set RLIMIT_NOFILE");
+	ASSERT_EQ(ret, 0);
+
+	for (i = 0; i < MANY_SESSIONS; i++) {
+		char name[64];
+
+		snprintf(name, sizeof(name), "many-session-%d", i);
+		session_fds[i] = create_session(self->fd1, name);
+		ASSERT_GE(session_fds[i], 0);
+	}
+
+	for (i = 0; i < MANY_SESSIONS; i++)
+		ASSERT_EQ(close(session_fds[i]), 0);
+}
+
+/*
+ * Test Case: Preserve Many Files
+ *
+ * Verifies that a large number of files can be preserved in a single session
+ * and then destroyed during normal system operation. This tests the dynamic
+ * block allocation and management for outgoing files.
+ */
+TEST_F(liveupdate_device, preserve_many_files)
+{
+#define MANY_FILES 500
+	int mem_fds[MANY_FILES];
+	int session_fd, ret, i;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	session_fd = create_session(self->fd1, "many-files-test");
+	ASSERT_GE(session_fd, 0);
+
+	ret = luo_ensure_nofile_limit(MANY_FILES + 10);
+	if (ret == -EPERM)
+		SKIP(return, "Insufficient privileges to set RLIMIT_NOFILE");
+	ASSERT_EQ(ret, 0);
+
+	for (i = 0; i < MANY_FILES; i++) {
+		mem_fds[i] = memfd_create("test-memfd", 0);
+		ASSERT_GE(mem_fds[i], 0);
+		ASSERT_EQ(preserve_fd(session_fd, mem_fds[i], i), 0);
+	}
+
+	for (i = 0; i < MANY_FILES; i++)
+		ASSERT_EQ(close(mem_fds[i]), 0);
+
+	ASSERT_EQ(close(session_fd), 0);
+}
+
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/luo_test_utils.c
index 3c8721c505df..333a3530051b 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.c
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.c
@@ -17,6 +17,7 @@
 #include <sys/syscall.h>
 #include <sys/mman.h>
 #include <sys/types.h>
+#include <sys/resource.h>
 #include <sys/stat.h>
 #include <errno.h>
 #include <stdarg.h>
@@ -28,6 +29,29 @@ int luo_open_device(void)
 	return open(LUO_DEVICE, O_RDWR);
 }
 
+int luo_ensure_nofile_limit(long min_limit)
+{
+	struct rlimit hl;
+
+	/* Allow to extra files to be used by test itself */
+	min_limit += 32;
+
+	if (getrlimit(RLIMIT_NOFILE, &hl) < 0)
+		return -errno;
+
+	if (hl.rlim_cur >= min_limit)
+		return 0;
+
+	hl.rlim_cur = min_limit;
+	if (hl.rlim_cur > hl.rlim_max)
+		hl.rlim_max = hl.rlim_cur;
+
+	if (setrlimit(RLIMIT_NOFILE, &hl) < 0)
+		return -errno;
+
+	return 0;
+}
+
 int luo_create_session(int luo_fd, const char *name)
 {
 	struct liveupdate_ioctl_create_session arg = { .size = sizeof(arg) };
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.h b/tools/testing/selftests/liveupdate/luo_test_utils.h
index 90099bf49577..6a0d85386613 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.h
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.h
@@ -26,6 +26,8 @@ int luo_create_session(int luo_fd, const char *name);
 int luo_retrieve_session(int luo_fd, const char *name);
 int luo_session_finish(int session_fd);
 
+int luo_ensure_nofile_limit(long min_limit);
+
 int create_and_preserve_memfd(int session_fd, int token, const char *data);
 int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
 
-- 
2.53.0

