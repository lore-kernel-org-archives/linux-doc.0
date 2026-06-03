Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3823FC5A4
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 03:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457365; cv=none; b=jmaM95mvZRy2bt0r69ToTHIZiAC2XeKX9PXWTp7ViPx4d0fe3tVVgVX97jmExptgNzPzVHWI2dG6TsODZWvLeXZbuX3mZa6fQc2zL6b2db5+NWEFEu4liiIQMjHy6DlEVtjlrgWtVlBvBVe2uITlrEShiMkDwwhXnw3U31/Pi2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457365; c=relaxed/simple;
	bh=GqAk9WL9MH7rJUNKZjopN3vwXWkbaerKBCceA/gzAA0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gPJ7f5NOvNkP5H0ZL0uwLbgGl/DisLLB9PBt5z0ZVve/6t82xEvteAcl2cBSA7vQRr3W1pTShvzqFR4qnY5HpWbDLIFmdD9qh5iuGLwkF25DEUZAl38MaIQSNwaTaETpcoFqYxczT7iHaqfxdgsFrgPTOD58KuWRUVh7UGg1hpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=XRGUJ0UN; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="XRGUJ0UN"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ccf01ba514so34383606d6.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 20:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780457363; x=1781062163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdAegEf5u3em8MUzB4xyEunyt/xoJrJRQD9FIOINoRs=;
        b=XRGUJ0UNmoPk6xP3bivJjzDmBze24+arUiWsunPSzKxbhNPP7DEhI/ujxVXhvEjQ0n
         6RHOCMyvE5qmschJm5pYqCGh1yzPDToIfIoUN9L1PEqCB/V+vs1MDPzFgSETGD5gEl9b
         9lU4Xe7Dpkvi44kz6DA+2C/Iey+k09O3OnHWhdpOz4jM+CUC2v1MwPLyxYxDdBFN7fN2
         nY7zBeq+Wtsn0wxaT5k611chqCKpN2ro2R5bLStufRTjtvn+Otww60iiMRwWtbseQgbn
         09e+LuEykr6cuxi6Ze1tY4V18M1WDkxEbcZezfzbSraC+OpXc2F/ki4GcNHUhd4pNIud
         nthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780457363; x=1781062163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SdAegEf5u3em8MUzB4xyEunyt/xoJrJRQD9FIOINoRs=;
        b=aEVX5a2jkZsbYh82ViQpxPxZTnttYeX4w3jeqzp0+pE+7B5qBZo6k/sHJ2O3u00jXB
         e6e1SWvsoeqCPXCthR57nn3DK+0nwBmi8YSwQDQlKOB7WfnBvPjoWJNCql+3Zpy2tbVw
         iX4sTX+IbkMgIhUvrxguLEZMpqvJEUr6zAS3wx04TcsPmPJ/ttj6P2vTqV1sFG0FOgyv
         P7vuIKA2oJaWAADXHDD8KbnJHnKfEkHYC3Inltdao3MpguOJTOpVmEaY1djAPZ8/RhDY
         SAfy5o6XCm37oLVkzwM2vCEjkp4i0ZCVOI1r/d1y/3BxY/Dzdv9XcbzTl6MCNdMKCCv8
         L2fQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PjaFCBoySKr/TQl9YUCrFU/K7PO9mtfxGcB3R3oIYF8n5Vs6xFYEWw9hfSE5W5oXrEjA8hOHQxHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUT4Z22mYwwaz7+VltMhnfUs+kUbvFu4Lk547oY4087Acotqyb
	SfMAqcYNTRwgfldkr2iakL0Bn2LXhuv5PWEOcLTyZCV5PkZqpEqloh5936g+wKn0FJc=
X-Gm-Gg: Acq92OEYLoG+vcWjk6Evxt6By73nd+lKNdNk6sGGCoxvLIc8gXk7rsRTNcD4I90QtNc
	eF9Rfp2bltehISvRuS+6w4etqSRqenATzbs8WgzUjWX2XFhExWplhFd0TGiNHPgFDtr9AE63tJj
	zGb79pA1EbED/Xq3ayp0KaHz9JVF2EP1lES/O0o/DG/uK6vqJcSjoZUaONtHCcXNhW0ZZyU3VGQ
	ub2Qqa5LqeWLrLZvMuqlStYhxhMTT7kKK6mHfgHJo0XTIn9VSAjkpay+LsQawsFqsn4PeMaHtrF
	FMVD4wjJJj6R4I5RbfpZOHAh753AleJtHrSE2evItNUwg5AcgZpCGBkjXGOLtWiESsF84O45rcy
	f0xOmgCJErTuZJOIjFejXKWU4/zO/3z9JXzkImpyB901b0i0H26A5L42GDT/nomVj6stfEbiEwK
	NWi9pG7dnQcZCXnK+BKOhc6n8FFoOkF7CHYQdAsposmNScU4dvHreyuENLb2SF+Q==
X-Received: by 2002:a05:6214:4c86:b0:8cc:f354:f47f with SMTP id 6a1803df08f44-8cecdf0ee3emr21236886d6.29.1780457362975;
        Tue, 02 Jun 2026 20:29:22 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b3b9sm9244566d6.45.2026.06.02.20.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:29:22 -0700 (PDT)
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
Subject: [PATCH v6 11/13] selftests/liveupdate: Test session and file limit removal
Date: Wed,  3 Jun 2026 03:29:02 +0000
Message-ID: <20260603032905.344462-12-pasha.tatashin@soleen.com>
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

