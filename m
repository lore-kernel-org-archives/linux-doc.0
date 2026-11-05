Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854866;
	b=aLXYHD91OfBS7DlhmHcvW0Lue7dL+DZDBWnXtHiU7cyDL9moOI3Z8V9qDhHcgEb3/n6P
	 PkDURpcsNQicOYBTX5bmHIoFEgguKuR3zN1ZwTEci8D0cV5qd7E8lnYa182gCeo2fTcDX
	 +VsIzuiAqKYqmMVlHO8/gh93VmFJstI1ShZgLhZQsniXDLHcnwoF1J2zDHF+0WkvLLKAr
	 kIC90DB6ZcFLsefHTkehqsFn86xrr9OaIuOH3Tb+xgBaxuZLQj/brPNWkQsstQrJd1CV8
	 1+KnY1OnrB1H7IqYHrV8mGySIbfVDepvZwS6Z8+FI334sBKsicp5E74Xbq0M7FuYlcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PsAwlx2j4fW8q8aMdYc1iycHvTmI4Op6n1GzgHBZx5g=;
	b=b/BfO1ZS1TqZXwMwnH7PYsJHC+5YPyuIdP6zLwaz9IhOniLsLzc6we+PCzZtQx4V9q6u
	 lbX1zMDyk/tH4MVVvVR661iiAl1HnxfE06MLRBW7fMzH7rPNKiB+Fdr1uC9ZL3YoBkXTe
	 UT8afeLeAtilvw5fkCqW5a0SKTYNuoMyR4FpR+Cc4lCm9qphdEWkXWcySZ6KTV3jy+LD9
	 k2PTwz/JXWVk8O+AjSyQ/R8fVGsUi2sm5zfl1Mq0x9VZorHJdXXKpFx0kSAKczZVhXuGl
	 MhnedvDMpVhIYG3qQI7ueCKxi77jN3eJlc+aGGdfnkjUvc2L/euUCdw4rtc8V/2dVGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="iM76nqR/";
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E86A606D801
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 05:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E86A606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=iM76nqR/
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7cc53938a8fso841919137.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 21:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793854865; x=1794459665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PsAwlx2j4fW8q8aMdYc1iycHvTmI4Op6n1GzgHBZx5g=;
        b=iM76nqR/M1wetTqLCJPxHjBNaoxISS1IVWfeqbkVTML9kJVVi7WyxMztr69Zd1jpbs
         eT+/Zgo0nzGG18jpL5kFc6f0Rq6gdzBVZ1WiL2lI+6WhZ0QUFN90Qe18burp+ferJ6vR
         MbgS37pRIf3jcTobydX+iOVyIXPPWBajBbGjvT2J8oUyf9FURPO0wq39ZOALmLq5xowV
         MuV/3WQIw869pcD3ThQuK8c9C7+/WwRVs/uIH9gSCw3Dijpnyvf3FTdvayIrHaB4MNoK
         XlzaBi2zwrn4VVKmliq2pjTfPziteFVILxCpY8nUtnl8JxIIc+NIWEfeObC0qXb9zt8c
         7hWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854865; x=1794459665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PsAwlx2j4fW8q8aMdYc1iycHvTmI4Op6n1GzgHBZx5g=;
        b=LB4z49TxjimhShatKPQOYCLlOimdWrwldiymeEO1rjTt48pTmENAbNLruroGrlkeSS
         nWVp+hG1Sv3Z/sX+ieOFO8S9/Jf9Z28fOMmeUEYUTHKi0uZgV6KZgfaBiWA3NUBuBN0h
         r28/ABCDr+W5Zmzr0EOkeVW0/NoMGZHJcBE27TWa6csfp8GbwgzmLNx5hKFDQ5D8Eqhg
         6h4IYbFWy68MD1Qsv/1BzOMx/W1hvigaPnXru1hNfHMbyOOfHGge++ROpF8/vLzr97h2
         EwrNErgS4bLvbXllRQYL+9uKGlF821fFMbPTgPHJUbKEpSX1DevH4KNhVqy/OGjvX9m8
         7rGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDtiTyCH9hBRoPDfWSStzFpyPG64LPP48K/upwSVxHk2lR12da/8Q+01Rx7lGExXxWQWAD9SxUI9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K/USSRT522m9zdL5VfHoxcK1OW4N6+uyTVjSfcvoKsZ7agzbR
	4MIUkNwP0lc+/XPVPYssSuQjaUbh9Z8cwwGzCmsflz9Yrtj63z1+cPdi1UD6zgbBuhM=
X-Gm-Gg: AYBFou3rkUr5vZJGnmoD0N638ChbUmM+VXoVm6M62yzSIwAsPe+iGwz1izXMnMEHKD2
	xV1oA9WFFkEn+u5Pywngb4oDW8dxwtqkKqhjD62aJSmrf2lrKGvqaFidA+VW6Jr/K3nduegzMxx
	nETA6exbknBBzS5UFH7m8Zmxx7I3p+miYrGJjlJwrntCdT1bXORVvZrR/ac8FtEx64wsLmaVHpU
	Jqu7WHQASF4FuurvCSIXILvr+kW4udZP5TWXY+xpCwQbXkeWuXXml5GDkNEysWuzLmMpOoWyza/
	KvWCjr5ep6ZdN9kxuZINZeBK3vqA9MQ/NGE46sXPrIfsw0PdEWiJqHg7XP4asAomU5digIf2leW
	tIKuzHVeRjfLjLYQn1WVZR5Jz/EL1XldZ0Y7EWLtFqMCeE9v2zVlgnMsByrnE+NcH0rLIsduILa
	IXvLH/xk6/vDkwRiOVzPB0W7Z3QVYJSp3gyZ9iif6EINGT7M293xTf/QSrsbL9AgUKjuxzfOQ7O
	xSk+4FQaigAZVZ+QQeUJm2jvv+G6dIcR9ultwGoZY1AGkOgDiPxijKqk+AMcmgUXypMNbXm8o2X
	rWQl2AUmemvTjqgTil/pfFNK2T16AM2LWxeooC8q5fY667ca1h7Tk9s9xABlbNnBvOWFhjPBQca
	JlavW3/IpoU+xoqTiDDhiwWVEcuLoxEpqgfUoSjSdurQMoiI/Fw==
X-Received: by 2002:a05:6102:f0b:b0:7ab:af4a:f2f3 with SMTP id ada2fe7eead31-7d072cc2323mr8731716137.26.1793854865027;
        Wed, 04 Nov 2026 21:01:05 -0800 (PST)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9d62bsm3305282e0c.8.2026.11.04.21.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:01:04 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v5 6/6] selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE
Date: Thu,  5 Nov 2026 00:00:52 -0500
Message-ID: <20261105050053.3063001-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a luo_session_freeze(session_fd, flags) helper and selftests for the
LIVEUPDATE_SESSION_FREEZE ioctl:

- liveupdate.c: verify unsupported flags return -EOPNOTSUPP, repeated
  freeze and post-freeze preserve return -EBUSY, closing a frozen
  uncommitted session unfreezes and returns resources, and closing a
  committed session (LIVEUPDATE_SESSION_FREEZE_COMMIT) retains LUO
  ownership of the session and its preserved files.
- luo_kexec_simple.c: verify end-to-end kexec preservation of committed
  sessions after closing all session FDs and exiting without
  daemonize_and_wait(), and verify freezing an incoming session returns
  -EINVAL.
- luo_multi_session.c: verify auto-frozen, kept-open frozen, closed
  uncommitted frozen, and closed committed sessions together across a
  kexec reboot.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |   5 +-
 .../selftests/liveupdate/lib/lu_utils.c       |  21 +++-
 .../testing/selftests/liveupdate/liveupdate.c | 107 ++++++++++++++++++
 .../selftests/liveupdate/luo_kexec_simple.c   |  22 +++-
 .../selftests/liveupdate/luo_multi_session.c  |  33 +++++-
 5 files changed, 179 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index fa07fed08364..a35871cefb82 100644
--- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
+++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
@@ -26,6 +26,7 @@ int luo_create_session(int luo_fd, const char *name);
 int luo_retrieve_session(int luo_fd, const char *name);
 int luo_session_finish(int session_fd);
 int luo_get_session_name(int session_fd, char *name, size_t name_len);
+int luo_session_freeze(int session_fd, __u32 flags);
 
 int luo_ensure_nofile_limit(long min_limit);
 int luo_session_preserve_fd(int session_fd, int fd, __u64 token);
@@ -34,8 +35,8 @@ int luo_session_retrieve_fd(int session_fd, __u64 token);
 int create_and_preserve_memfd(int session_fd, int token, const char *data);
 int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
 
-void create_state_file(int luo_fd, const char *session_name, int token,
-		       int next_stage);
+int create_state_file(int luo_fd, const char *session_name, int token,
+		      int next_stage);
 void restore_and_read_stage(int state_session_fd, int token, int *stage);
 
 void daemonize_and_wait(void);
diff --git a/tools/testing/selftests/liveupdate/lib/lu_utils.c b/tools/testing/selftests/liveupdate/lib/lu_utils.c
index 74d41115c281..e71e7e90da27 100644
--- a/tools/testing/selftests/liveupdate/lib/lu_utils.c
+++ b/tools/testing/selftests/liveupdate/lib/lu_utils.c
@@ -198,8 +198,21 @@ int luo_session_finish(int session_fd)
 	return 0;
 }
 
-void create_state_file(int luo_fd, const char *session_name, int token,
-		       int next_stage)
+int luo_session_freeze(int session_fd, __u32 flags)
+{
+	struct liveupdate_session_freeze arg = {
+		.size = sizeof(arg),
+		.flags = flags,
+	};
+
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_FREEZE, &arg) < 0)
+		return -errno;
+
+	return 0;
+}
+
+int create_state_file(int luo_fd, const char *session_name, int token,
+		      int next_stage)
 {
 	char buf[32];
 	int state_session_fd;
@@ -213,8 +226,10 @@ void create_state_file(int luo_fd, const char *session_name, int token,
 		fail_exit("create_and_preserve_memfd for state tracking");
 
 	/*
-	 * DO NOT close session FD, otherwise it is going to be unpreserved
+	 * DO NOT close session FD unless committed, otherwise it is going to
+	 * be unpreserved.
 	 */
+	return state_session_fd;
 }
 
 void restore_and_read_stage(int state_session_fd, int token, int *stage)
diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index 2dedd5fc2534..16b210da37a9 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -530,4 +530,111 @@ TEST_F(liveupdate_device, preserve_many_files)
 	ASSERT_EQ(close(session_fd), 0);
 }
 
+/*
+ * Test Case: Session Freeze
+ *
+ * Verifies LIVEUPDATE_SESSION_FREEZE with flags == 0: unsupported flags return
+ * -EOPNOTSUPP, repeated freeze and post-freeze preserve return -EBUSY, and
+ * closing the session FD unfreezes the session and returns all resources.
+ */
+TEST_F(liveupdate_device, session_freeze)
+{
+	int session_fd, mem_fd1, mem_fd2;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	session_fd = luo_create_session(self->fd1, "session-freeze");
+	ASSERT_GE(session_fd, 0);
+
+	mem_fd1 = memfd_create("freeze-memfd-1", 0);
+	ASSERT_GE(mem_fd1, 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd1, 0x1111), 0);
+
+	/* Unsupported flag bits must fail with -EOPNOTSUPP */
+	EXPECT_EQ(luo_session_freeze(session_fd, 1U << 1), -EOPNOTSUPP);
+
+	/* Freeze the session */
+	ASSERT_EQ(luo_session_freeze(session_fd, 0), 0);
+
+	/* Subsequent freeze attempts must fail with -EBUSY */
+	EXPECT_EQ(luo_session_freeze(session_fd, 0), -EBUSY);
+	EXPECT_EQ(luo_session_freeze(session_fd,
+				     LIVEUPDATE_SESSION_FREEZE_COMMIT),
+		  -EBUSY);
+
+	/* Preserving a file after freeze must fail with -EBUSY */
+	mem_fd2 = memfd_create("freeze-memfd-2", 0);
+	ASSERT_GE(mem_fd2, 0);
+	EXPECT_EQ(luo_session_preserve_fd(session_fd, mem_fd2, 0x2222), -EBUSY);
+
+	/* Closing the session FD must unfreeze and unpreserve resources */
+	ASSERT_EQ(close(session_fd), 0);
+
+	session_fd = luo_create_session(self->fd1, "session-freeze");
+	ASSERT_GE(session_fd, 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd1, 0x1111), 0);
+
+	ASSERT_EQ(close(session_fd), 0);
+	ASSERT_EQ(close(mem_fd1), 0);
+	ASSERT_EQ(close(mem_fd2), 0);
+}
+
+/*
+ * Test Case: Session Freeze and Commit
+ *
+ * Verifies LIVEUPDATE_SESSION_FREEZE with LIVEUPDATE_SESSION_FREEZE_COMMIT:
+ * once committed, the frozen session is inserted into KHO and survives closing
+ * the session FD with ownership retained by LUO until reboot.
+ */
+TEST_F(liveupdate_device, session_freeze_commit)
+{
+	char name[LIVEUPDATE_SESSION_NAME_LENGTH];
+	int session_fd, session_fd2, mem_fd1, mem_fd2;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	snprintf(name, sizeof(name), "freeze-commit-%d", getpid());
+	session_fd = luo_create_session(self->fd1, name);
+	ASSERT_GE(session_fd, 0);
+
+	mem_fd1 = memfd_create("freeze-commit-memfd-1", 0);
+	ASSERT_GE(mem_fd1, 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd1, 0x1111), 0);
+
+	/* Freeze and commit the session */
+	ASSERT_EQ(luo_session_freeze(session_fd,
+				     LIVEUPDATE_SESSION_FREEZE_COMMIT), 0);
+
+	/* Subsequent freeze attempts must fail with -EBUSY */
+	EXPECT_EQ(luo_session_freeze(session_fd, 0), -EBUSY);
+	EXPECT_EQ(luo_session_freeze(session_fd,
+				     LIVEUPDATE_SESSION_FREEZE_COMMIT),
+		  -EBUSY);
+
+	/* Preserving a file after freeze must fail with -EBUSY */
+	mem_fd2 = memfd_create("freeze-commit-memfd-2", 0);
+	ASSERT_GE(mem_fd2, 0);
+	EXPECT_EQ(luo_session_preserve_fd(session_fd, mem_fd2, 0x2222), -EBUSY);
+
+	/* Closing the session FD must retain LUO ownership of session & files */
+	ASSERT_EQ(close(session_fd), 0);
+
+	EXPECT_EQ(luo_create_session(self->fd1, name), -EEXIST);
+
+	session_fd2 = luo_create_session(self->fd1, "freeze-commit-check");
+	ASSERT_GE(session_fd2, 0);
+	EXPECT_EQ(luo_session_preserve_fd(session_fd2, mem_fd1, 0x3333),
+		  -EBUSY);
+
+	ASSERT_EQ(close(session_fd2), 0);
+	ASSERT_EQ(close(mem_fd1), 0);
+	ASSERT_EQ(close(mem_fd2), 0);
+}
+
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/liveupdate/luo_kexec_simple.c b/tools/testing/selftests/liveupdate/luo_kexec_simple.c
index 786ac93b9ae3..f065418a047f 100644
--- a/tools/testing/selftests/liveupdate/luo_kexec_simple.c
+++ b/tools/testing/selftests/liveupdate/luo_kexec_simple.c
@@ -21,12 +21,18 @@
 /* Stage 1: Executed before the kexec reboot. */
 static void run_stage_1(int luo_fd)
 {
-	int session_fd;
+	int session_fd, state_session_fd;
 
 	ksft_print_msg("[STAGE 1] Starting pre-kexec setup...\n");
 
 	ksft_print_msg("[STAGE 1] Creating state file for next stage (2)...\n");
-	create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
+	state_session_fd = create_state_file(luo_fd, STATE_SESSION_NAME,
+					     STATE_MEMFD_TOKEN, 2);
+	if (luo_session_freeze(state_session_fd,
+			       LIVEUPDATE_SESSION_FREEZE_COMMIT) < 0) {
+		fail_exit("luo_session_freeze for '%s'", STATE_SESSION_NAME);
+	}
+	close(state_session_fd);
 
 	ksft_print_msg("[STAGE 1] Creating session '%s' and preserving memfd...\n",
 		       TEST_SESSION_NAME);
@@ -40,8 +46,15 @@ static void run_stage_1(int luo_fd)
 			  TEST_MEMFD_TOKEN);
 	}
 
+	ksft_print_msg("[STAGE 1] Freezing and committing session '%s' and closing FD...\n",
+		       TEST_SESSION_NAME);
+	if (luo_session_freeze(session_fd,
+			       LIVEUPDATE_SESSION_FREEZE_COMMIT) < 0) {
+		fail_exit("luo_session_freeze for '%s'", TEST_SESSION_NAME);
+	}
+
+	close(session_fd);
 	close(luo_fd);
-	daemonize_and_wait();
 }
 
 /* Stage 2: Executed after the kexec reboot. */
@@ -60,6 +73,9 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	if (session_fd < 0)
 		fail_exit("luo_retrieve_session for '%s'", TEST_SESSION_NAME);
 
+	if (luo_session_freeze(session_fd, 0) != -EINVAL)
+		fail_exit("luo_session_freeze on incoming session did not return -EINVAL");
+
 	ksft_print_msg("[STAGE 2] Restoring and verifying memfd (token %#x)...\n",
 		       TEST_MEMFD_TOKEN);
 	mfd = restore_and_verify_memfd(session_fd, TEST_MEMFD_TOKEN,
diff --git a/tools/testing/selftests/liveupdate/luo_multi_session.c b/tools/testing/selftests/liveupdate/luo_multi_session.c
index aac24a5f5ce3..6b532ec6b82f 100644
--- a/tools/testing/selftests/liveupdate/luo_multi_session.c
+++ b/tools/testing/selftests/liveupdate/luo_multi_session.c
@@ -15,14 +15,17 @@
 #define SESSION_EMPTY_2 "multi-test-empty-2"
 #define SESSION_FILES_1 "multi-test-files-1"
 #define SESSION_FILES_2 "multi-test-files-2"
+#define SESSION_CLOSED "multi-test-closed"
 
 #define MFD1_TOKEN 0x1001
 #define MFD2_TOKEN 0x2002
 #define MFD3_TOKEN 0x3003
+#define MFD_CLOSED_TOKEN 0x4004
 
 #define MFD1_DATA "Data for session files 1"
 #define MFD2_DATA "First file for session files 2"
 #define MFD3_DATA "Second file for session files 2"
+#define MFD_CLOSED_DATA "Closed session data"
 
 #define STATE_SESSION_NAME "kexec_multi_state"
 #define STATE_MEMFD_TOKEN 998
@@ -30,7 +33,7 @@
 /* Stage 1: Executed before the kexec reboot. */
 static void run_stage_1(int luo_fd)
 {
-	int s_empty1_fd, s_empty2_fd, s_files1_fd, s_files2_fd;
+	int s_empty1_fd, s_empty2_fd, s_files1_fd, s_files2_fd, s_closed_fd;
 
 	ksft_print_msg("[STAGE 1] Starting pre-kexec setup for multi-session test...\n");
 
@@ -57,6 +60,8 @@ static void run_stage_1(int luo_fd)
 		fail_exit("create_and_preserve_memfd for token %#x",
 			  MFD1_TOKEN);
 	}
+	if (luo_session_freeze(s_files1_fd, 0) < 0)
+		fail_exit("luo_session_freeze for '%s'", SESSION_FILES_1);
 
 	ksft_print_msg("[STAGE 1] Creating session '%s' with two memfds...\n",
 		       SESSION_FILES_2);
@@ -72,6 +77,25 @@ static void run_stage_1(int luo_fd)
 		fail_exit("create_and_preserve_memfd for token %#x",
 			  MFD3_TOKEN);
 	}
+	if (luo_session_freeze(s_files2_fd,
+			       LIVEUPDATE_SESSION_FREEZE_COMMIT) < 0) {
+		fail_exit("luo_session_freeze for '%s'", SESSION_FILES_2);
+	}
+	close(s_files2_fd);
+
+	ksft_print_msg("[STAGE 1] Creating frozen uncommitted session '%s' and closing FD...\n",
+		       SESSION_CLOSED);
+	s_closed_fd = luo_create_session(luo_fd, SESSION_CLOSED);
+	if (s_closed_fd < 0)
+		fail_exit("luo_create_session for '%s'", SESSION_CLOSED);
+	if (create_and_preserve_memfd(s_closed_fd, MFD_CLOSED_TOKEN,
+				      MFD_CLOSED_DATA) < 0) {
+		fail_exit("create_and_preserve_memfd for token %#x",
+			  MFD_CLOSED_TOKEN);
+	}
+	if (luo_session_freeze(s_closed_fd, 0) < 0)
+		fail_exit("luo_session_freeze for '%s'", SESSION_CLOSED);
+	close(s_closed_fd);
 
 	close(luo_fd);
 	daemonize_and_wait();
@@ -91,6 +115,13 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 			  stage);
 	}
 
+	ksft_print_msg("[STAGE 2] Verifying closed uncommitted session '%s' was not preserved...\n",
+		       SESSION_CLOSED);
+	if (luo_retrieve_session(luo_fd, SESSION_CLOSED) != -ENOENT) {
+		fail_exit("Expected -ENOENT for closed uncommitted session '%s'",
+			  SESSION_CLOSED);
+	}
+
 	ksft_print_msg("[STAGE 2] Retrieving all sessions...\n");
 	s_empty1_fd = luo_retrieve_session(luo_fd, SESSION_EMPTY_1);
 	if (s_empty1_fd < 0)
-- 
2.56.0.398.g882cbad275-goog

