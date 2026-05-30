Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B31378D63
	for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 22:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179606; cv=none; b=GCiHbYnYyqaLthmuf15FaqaqssyRypFgbxNJ3pS3FqOIsMz7xiHmu1HuHZ1VFcN3tS20tPxZ/IHAZRGJfU+CQryvzuS0+drsXu7aokyDvl9Pud1RJKiGRlB02qy7V8965xP3gu4Hd+x/SkGJZTe6T74TS9yXaZs0bFh6xONanO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179606; c=relaxed/simple;
	bh=l5sCPInN24558zDa0DI5TQ1DcCXBUgAOZ3PiWzJQJoI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJR3JgdPMvv9U13SdjfQYkykdj17gixXKCoskZQiOJdnSSOtiX88BRbcM0DeP56HD0TLHmIxJU8lmiR7x6i6zSAMzmb3TNjggrL377kYMjH6sUWvJ+CCSZS1RfULyy9Ik2fnFMVneqhkU+17S/1XePdtzsAAccCSbfy7fZt1I1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=UbRANhl7; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="UbRANhl7"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-91550dda53cso32287485a.1
        for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 15:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780179602; x=1780784402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/PRPWvWF9f7qW0XjjBpwGc/NadY8LWCtXHDn2RYoSI=;
        b=UbRANhl7Z1zD09kwlBAc/uuNUHzbsyQ2LsqHRGtyaAG2B41vtl5s1pD7T/CeVP2XZz
         3KTGvbXNifl2Wa0wy0n/GPr3BA7b4mlKk5Mz9IzlZi6yNLw+mqznhH4sI8Nnq3afhQEc
         5qhwTbTkMWbq2iW4iVaVtEeCqF9/2IAVLxSkkfRxGgUhEKxWxpEepkf63QBst0N+gh2Y
         jFcrezpQq0Dj0/8patMbr3nKoIIhvLQj17pmx5dAIlugLKChItZIzL+2ar0AN99eB8U2
         KB+UXO2TKodW2pG8EuzwixWYqNqepQ8ianS1o4biX3XNYcG0+fhFSFJmBEdev3/7jju9
         WBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179602; x=1780784402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l/PRPWvWF9f7qW0XjjBpwGc/NadY8LWCtXHDn2RYoSI=;
        b=iixmPbwCNr1YrKmvguAe2pyWJSK/okSLOx2DS9PTNBujt0wE5Cnphga1HPj97AIq7g
         IGnOOGRQlpmuQOPgKsCTLnCyKkJi6/nlUH6gKgkRh2JRnSFIDVHZKL2wTmsH+P7YHnIY
         CY1GwHifasujBZ4ZvMaHQnXrawr1zSMxHOZzRdim1WNo/RQgcTyp3/8i6R351nMnHlfS
         HNyHLZbkgtU1TM+PwTYbkmHdaozhub5/FR9Tn7noh8a8zYX//cV67CmNC/N34WjT/59A
         d05AaEy1S2jbZqSywI7qjtMobpLk/n4MjiW/yQlmXpO3PMRcxnHiV1+OHOyEQ9er5uZc
         XR9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9QdIf1x9AzZahJBi5JWFo3L6oB8n08lAWRUhuZghEaekiBfe29FGR+GvyUD81gF4+wcCUwKHqssFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ7zJmJassf+OmFo+Uz5Hm6SA4JapVuL4wXJS3lSX2eJqW+0CH
	QE7xOGb5Qio/1K7MH/Y6wL2m1pKLWK+dpfK9ebzZaNh6NAE3ViNq3BBt4AlTC74G74c=
X-Gm-Gg: Acq92OEPx2DqbXAo/VeLu7fYkDEg18J6LJIKGjOcY5GRDCmw4ZakNKTuzyoMgOYr28U
	jh8GoC+KTw4IAbq4EvP5/j7UJhydIo2CNNGFBjEN4x0lP7BtAXVRs0p/dyQsOyvPA0WCP+edLPC
	GmHf62b13D4Sqe0l3Afe3PHBvl6V6+tZtipzhZei4XeYcrqG+Z/ZudOARkQESBMYt2VVX/K2n9c
	AFnBboruKYuNiKnSmDxGNxgdNx5mR6eY/rsr2DJaQzV+rrQE5RLHe3iOwg8wLNvGlujL3/CuoWK
	4CCZEo6LFYAIxIY1umx+fTzHXESF9cB5fdRFCcdFWEhDyRNbEkLYrB1vIj3hpnObDa17S9nFo7l
	45da95+p3Blh7C6kNUuT7OkdHUc196s6Jd33dj6qeRxrPDbtkrk5JQDcIxpVmbjKqiFQOZ8Xkj3
	tLKbnILplOirTYJ399Sg7cGYfwfOkKYFTjSn2Dt+NoowHQwtJPb++i7X7gQba66f+pAeyCW/i9
X-Received: by 2002:a05:620a:648d:b0:914:db82:f791 with SMTP id af79cd13be357-9153dc29a52mr727746685a.49.1780179601868;
        Sat, 30 May 2026 15:20:01 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915324868a0sm651790085a.18.2026.05.30.15.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:20:01 -0700 (PDT)
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
Subject: [PATCH v4 11/13] selftests/liveupdate: Test session and file limit removal
Date: Sat, 30 May 2026 22:19:36 +0000
Message-ID: <20260530221938.115978-12-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260530221938.115978-1-pasha.tatashin@soleen.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
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

