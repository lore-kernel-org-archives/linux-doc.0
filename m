Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709442;
	b=YIa6bczf045BKT/+K5qNMe/RnGAmpzaNIV9kWnl7vDDqkoag5mzWd4P0TimtwiqRI42Q
	 Ap0usc7vaJN+7ddE9VUspbYMsHfT2Te596mkBgL1bouBICA8Lct6/k2cQPrZ10d8vCp9x
	 hk50RRdi6BDW84EaPruuAQD4sVl5vV04Ry8uEbTrw063gytqoyolGI0HMa3/fpsBADIMO
	 HIRbF5Nw+mFrYubczjBeVyeCMaTr3gt3Hb6QNMhLdbDS/jbiAF9Eha9FSv/Zd6zkCm0oM
	 cbyKTpqB4auXelGn7jZhSl3WmxOmJdDcgh8+JUbZZvhCnoawIi7JiljQcysPj1bXk/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/hb6F/Gq2Qdu71NqEP5pvDxejRfCT+lDCwtB3sS5Hqw=;
	b=bhSje07iSqUHcmSGJ7+LLF7rmLexiRDwmc67qPs4U1Pk526+Cpqz7/cDFTzZPTYoWwb+
	 PEIvBXGGEjXctAdKYE17bp7F/k/yB5RbmW8WHRa6+kFjAB9SnUq4sIk8/KlcHafRyUcgJ
	 01Z9lFywHfp4ZDyo7YTxjPTcgPSfAc4h6iIidEBcdf0MFoM+CT/vZeLxWkZ0jDIIYXFeC
	 0m1khziRp96DS/Dqd1ITgjE1lEQpW9CRZvjzT9KCQgNqlGtdxI24qNAY3jUtV83UtkjJl
	 zI6ve1spJWPZoaHwHo78fu1Av5ZpltDR6kBWA0x9tWTJirzj2Hl08vNw3lZqmmENNCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I6Ds6E2h;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1D6606A335
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 22:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F1D6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I6Ds6E2h
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so267156a91.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 15:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709442; x=1793314242; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hb6F/Gq2Qdu71NqEP5pvDxejRfCT+lDCwtB3sS5Hqw=;
        b=I6Ds6E2hIejnCdsJzOF96yrrb1+kTx5PjHt/PHBfVhxa49Rhvxb8mFgpVIJjCWqt7W
         pUXk0d2sIizdTn1Tl1rLi1yT9wcRPIdoQNo4L7xiPUVYaOmOZn6b3h8Cpav8XkPDUc76
         80pj+uosxppzxryA5vUTsqLP293/FNv8Xl17g6tnibtsx/IzYoyaVJXboIjWlxWJ6Iod
         UsDCKZHIjT0yckM0A4x7c1d+PWqfuXaRoHBm9NR3ARUUWbv4qzlzrzHaSx7CXm0jaBjq
         mmsH9SbTmBjXqtxagKGv8uNxIyWXFUBo/vzWfdli0kJNGwUl9Se87XEFr7Wglnaj5932
         CN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709442; x=1793314242;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hb6F/Gq2Qdu71NqEP5pvDxejRfCT+lDCwtB3sS5Hqw=;
        b=1cqBEetBaqqAOYWAXOHZnCsUvXYGshHJEViSd8L9m94z7hFDcUjNCI22VM+0AscVKD
         hGMTYVLTfXdpZQ+oRWyxAjtrxNFUZ0GRFohab0pJKIYx9C1bpbwcaMdAL5kndqMrQYHp
         wHEPFK1tNq0sfNEZY1Y/BdmJDokEUsFgkcbRyeIDhzmN5iMzg3f599QeeSsry96N9YXk
         ZLWIgD0KnBuOrTYUQv2pbWsw0nv0um/zH382pKfhH6hYOQ4j/Su7vijiJvSKQpeddRsT
         lU6Ni9bhEC6aLbj70P2NHhF8jLzGzzkJwcMGeOKJkRd3Seib0+VS+IcP4tD5DEXg3IAI
         jcPA==
X-Forwarded-Encrypted: i=1; AKwUvBwgTQ6PNVl0vdpGpr9II224VYiAjaUoyG0Td99XyrPYt5GZ4Te055mEuHMSmi3mqRDCiTxP806GqLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAwBeYw/QGSWPdRU8krXLT5rjqUKJUC6Abw3WzL1Xvn+8KH5Ew
	CkcL0fnXb78nNhVcpKd+sgryzQsLb3ygz7l7ZyJD0oL23dGfyqXl7YJr68pPYSu/CAV2+Ia8qgp
	bbn9529gw9GyQKA==
X-Received: from pgbm22-n2.prod.google.com ([2002:a05:6a02:6196:20b0:cd6:a6ae:1ba0])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:538f:b0:3ac:97bc:4c98 with SMTP id 98e67ed59e1d1-3adce7e67bcmr237048a91.64.1792709440118;
 Thu, 22 Oct 2026 15:50:40 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:50:27 +0000
In-Reply-To: <20261022225035.377445-1-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022225035.377445-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022225035.377445-3-dmatlack@google.com>
Subject: [PATCH v2 02/10] selftests: liveupdate: Add tests for preserve and
 retrieve user argument
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pasha Tatashin <pasha.tatashin@soleen.com>

Verify the user argument support in LIVEUPDATE_SESSION_PRESERVE_FD and
LIVEUPDATE_SESSION_RETRIEVE_FD. Add luo_session_preserve_fd_arg() and
luo_session_retrieve_fd_arg() helpers to libliveupdate so tests can pass
a handler-specific argument.

Add a preserve_memfd_with_arg test case to verify that memfd
preservation rejects a non-zero argument with -EOPNOTSUPP, accepts an
explicit zero argument, and remains compatible with callers passing the
legacy struct size up to the token field.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |  3 ++
 .../selftests/liveupdate/lib/lu_utils.c       | 17 ++++++-
 .../testing/selftests/liveupdate/liveupdate.c | 44 +++++++++++++++++++
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index fa07fed08364..cd1d843a0d3d 100644
--- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
+++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
@@ -29,7 +29,10 @@ int luo_get_session_name(int session_fd, char *name, size_t name_len);
 
 int luo_ensure_nofile_limit(long min_limit);
 int luo_session_preserve_fd(int session_fd, int fd, __u64 token);
+int luo_session_preserve_fd_arg(int session_fd, int fd, __u64 token,
+				__u64 user_arg);
 int luo_session_retrieve_fd(int session_fd, __u64 token);
+int luo_session_retrieve_fd_arg(int session_fd, __u64 token, __u64 user_arg);
 
 int create_and_preserve_memfd(int session_fd, int token, const char *data);
 int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
diff --git a/tools/testing/selftests/liveupdate/lib/lu_utils.c b/tools/testing/selftests/liveupdate/lib/lu_utils.c
index 74d41115c281..db7a90b002cb 100644
--- a/tools/testing/selftests/liveupdate/lib/lu_utils.c
+++ b/tools/testing/selftests/liveupdate/lib/lu_utils.c
@@ -79,12 +79,14 @@ int luo_retrieve_session(int luo_fd, const char *name)
 	return arg.fd;
 }
 
-int luo_session_preserve_fd(int session_fd, int fd, __u64 token)
+int luo_session_preserve_fd_arg(int session_fd, int fd, __u64 token,
+				__u64 user_arg)
 {
 	struct liveupdate_session_preserve_fd arg = {
 		.size = sizeof(arg),
 		.fd = fd,
 		.token = token,
+		.arg = user_arg,
 	};
 
 	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg))
@@ -93,11 +95,17 @@ int luo_session_preserve_fd(int session_fd, int fd, __u64 token)
 	return 0;
 }
 
-int luo_session_retrieve_fd(int session_fd, __u64 token)
+int luo_session_preserve_fd(int session_fd, int fd, __u64 token)
+{
+	return luo_session_preserve_fd_arg(session_fd, fd, token, 0);
+}
+
+int luo_session_retrieve_fd_arg(int session_fd, __u64 token, __u64 user_arg)
 {
 	struct liveupdate_session_retrieve_fd arg = {
 		.size = sizeof(arg),
 		.token = token,
+		.arg = user_arg,
 	};
 
 	if (ioctl(session_fd, LIVEUPDATE_SESSION_RETRIEVE_FD, &arg))
@@ -106,6 +114,11 @@ int luo_session_retrieve_fd(int session_fd, __u64 token)
 	return arg.fd;
 }
 
+int luo_session_retrieve_fd(int session_fd, __u64 token)
+{
+	return luo_session_retrieve_fd_arg(session_fd, token, 0);
+}
+
 /* Helper function to get a session name via ioctl. */
 int luo_get_session_name(int session_fd, char *name, size_t name_len)
 {
diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index 2dedd5fc2534..4c4272167635 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -20,6 +20,7 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#include <stddef.h>
 #include <string.h>
 #include <sys/ioctl.h>
 #include <unistd.h>
@@ -530,4 +531,47 @@ TEST_F(liveupdate_device, preserve_many_files)
 	ASSERT_EQ(close(session_fd), 0);
 }
 
+/*
+ * Test Case: Preserve MemFD with User Argument
+ *
+ * Verifies that passing a non-zero user argument to memfd preservation fails
+ * with -EOPNOTSUPP, while passing a zero argument or using the minimum struct
+ * size without the arg field succeeds.
+ */
+TEST_F(liveupdate_device, preserve_memfd_with_arg)
+{
+	struct liveupdate_session_preserve_fd min_arg = {};
+	int session_fd, mem_fd1, mem_fd2;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	session_fd = luo_create_session(self->fd1, "preserve-arg-test");
+	ASSERT_GE(session_fd, 0);
+
+	mem_fd1 = memfd_create("arg-memfd-1", 0);
+	ASSERT_GE(mem_fd1, 0);
+
+	/* Non-zero arg is not supported by memfd handler */
+	EXPECT_EQ(luo_session_preserve_fd_arg(session_fd, mem_fd1, 0x1111, 1),
+		  -EOPNOTSUPP);
+
+	/* Legacy struct size (up to token) should zero-fill arg and succeed */
+	min_arg.size = offsetof(struct liveupdate_session_preserve_fd, arg);
+	min_arg.fd = mem_fd1;
+	min_arg.token = 0x1111;
+	ASSERT_EQ(ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &min_arg), 0);
+
+	/* Explicit zero arg with full struct size should also succeed */
+	mem_fd2 = memfd_create("arg-memfd-2", 0);
+	ASSERT_GE(mem_fd2, 0);
+	ASSERT_EQ(luo_session_preserve_fd_arg(session_fd, mem_fd2, 0x2222, 0), 0);
+
+	ASSERT_EQ(close(session_fd), 0);
+	ASSERT_EQ(close(mem_fd1), 0);
+	ASSERT_EQ(close(mem_fd2), 0);
+}
+
 TEST_HARNESS_MAIN
-- 
2.56.0.257.gf7497c7d27-goog

