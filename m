Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC7477E32
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 17:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784570068; cv=none; b=jV2TijZr2c3EuBd/FUbnkwRzlvklekCAcCxwOTFzK0fR3BKVIGax+OiHxxilSnWRD3oQLfdVFvPj3UPB4HmUR6RCzwTp936Su5Le+uqed9cAoSV4M6GBL8NDPMKbJezC3WmhWgwvdoTnYxhQzaeXen2ABxoGwIIMkjtnjFww2po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784570068; c=relaxed/simple;
	bh=YPrW1TXrbX+u0gKgK8sf9Rj21grSgx0mklEsAxueIjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fcEZqvVBr0CidCyLFswEEruHaHAZah71PmyZWdWFhrGM3bHtFm4zlt//bquvw8bHKITwPB8N5e48t0vqosvj0LYObHRps2EFPKTHbNoRi+qv0dLGKkVZQFr+V3+hBn1hMPt6M49ZN/bR/nONRjDvhh9O+FlFXKYKLmITnIiDG24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksr75Z6L; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksr75Z6L"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e08baf860so8007679a91.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 10:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784570062; x=1785174862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyEs7k1vrNWNt95uYWZYqppv3Skiym40EV0k7tALo6w=;
        b=ksr75Z6L6BMa/cCk38UpzCJ2R1JQx+pg5cP3BRL2GjDk+pcginU3hwhuIznpTKpp7u
         Tf7jA0PHkaUy9J6kg9uD9/KMOybSJBUsnSZC9+w9XH77azve59Zdo0pVALDdfWP0rQzO
         IX9U6KMuogQYJ2r07VUdDE0KEq+fn5Ag1jlBYIJHij0jH8hLoxEpvKX3vxMHG3zg+THq
         15CNRHVF6A9hMUQXeOz0N1cyyI7tFm7CYKBxcsxnAUh6+VC02GabY+6kFmEU7VrMS7wM
         6kaQMpPWYOwSyoLqH6QSQHlWlVrHe7epcWPk+iA7qpuwS1LBrJdBn0KlcLskc2PKs1hm
         zUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784570062; x=1785174862;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyEs7k1vrNWNt95uYWZYqppv3Skiym40EV0k7tALo6w=;
        b=BqvcoLZ8SRBYJMk0+hPJQB/lIpre/PVlnRb6/IWbuf3sfSzr7xcgzrAQnI4I9PM/7V
         NfKX79gZ+PeS+4upAXkLlu5fygnzGV7dQV8uwafPZ8Fyg3kO593yubVVJCD3IliSlszC
         fL8JZrfOY2cKjhQ2Ao2hfc4dYguwoPgehnaV2CJYuoAbqAubmyYSQ3jwxKikQT4+cF4c
         ECgxvW1K2x+GPPeqCUQAv1a620flEWVWQizmzYZmhwGuTfsoRuG+6MC8pmqWrpEGOw+3
         eTNrgwmV7+X2xZ7DqTMS2XYiXhUNaGDDTB1SsXcnFQrM2z9vmssHbIZPyx4mCiKJdjHZ
         ytUg==
X-Forwarded-Encrypted: i=1; AHgh+Rpmp+msuLHItmmTd/WwwXQ6/K1QZFqXZtBM6IcZ2TMVLxuY2I9J596wZ3hGDRckWzxlGWgzDc37wpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzetOsR162JXpPbIEwp0NUbffPrjgWn5cspbIpvgul/9knUlQcg
	VrS+07EwRKNBBo84cTGN1toSMDIiJKBojH7G+K4HhWrYEzrPzTrei6TXRY+0r14O7iJtCw==
X-Gm-Gg: AR+sD12iqKaC2Y4xJmBWyNUM1sX8Temn8YMtsXUiBVolNUHAeSR5KR4Xvfb0fEouKHn
	6i4/A4/dLjY8Dr9EpeID36iBFlBPvrZGbtEy+Q8afs6UKJihxV//EdBMWYeezZ5xIsv61i9ri3U
	nIJ2r5OOMLywveo4D2DJK5wve/zNdb9fw4++CmcmOJpO1YAsAtO8vQ6E6+XgwFasweQEgmxh0i9
	I1S/zWBnLVfoir+sILO75DySs2zBRGzLr0EeqdU756RtgwfWXxzlL0/oRR9w6rcQTNlorn8282P
	10BKOqbiBtV4hF//ihVKvPw9IIJVPFxcQZ97VM6pJamDmT9i4R+8o52l+PTpTWR2A4QFI3UjO5Z
	jaNZzqcJw6+U+vAhC97FQfNvINVoDGRgqGq70shG5s0PBWepJhzb+V5N7R3MV2Sc9vOpe0BmP
X-Received: by 2002:a17:90b:1b43:b0:38d:eb10:6f01 with SMTP id 98e67ed59e1d1-38e4b422875mr15703816a91.4.1784570061412;
        Mon, 20 Jul 2026 10:54:21 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2de31a7sm33370583c88.15.2026.07.20.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:54:20 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Elizabeth Figura <zfigura@codeweavers.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>,
	Maoyi Xie <maoyixie.tju@gmail.com>
Subject: [PATCH 2/2] selftests: ntsync: test absolute MONOTONIC waits under time namespaces
Date: Mon, 20 Jul 2026 14:54:02 -0300
Message-ID: <20260720175402.44338-3-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720175402.44338-1-ivanrwcm25@gmail.com>
References: <20260720175402.44338-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cover the timens conversion in ntsync_schedule(): with a negative
CLOCK_MONOTONIC offset, a 100 ms absolute wait must not return
immediately against the host clock.

Suggested-by: Maoyi Xie <maoyixie.tju@gmail.com>
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 .../testing/selftests/drivers/ntsync/ntsync.c | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/tools/testing/selftests/drivers/ntsync/ntsync.c b/tools/testing/selftests/drivers/ntsync/ntsync.c
index e6a37214aa46..ce000ff41535 100644
--- a/tools/testing/selftests/drivers/ntsync/ntsync.c
+++ b/tools/testing/selftests/drivers/ntsync/ntsync.c
@@ -8,12 +8,18 @@
 #define _GNU_SOURCE
 #include <sys/ioctl.h>
 #include <sys/stat.h>
+#include <sys/wait.h>
 #include <fcntl.h>
+#include <sched.h>
 #include <time.h>
 #include <pthread.h>
 #include <linux/ntsync.h>
 #include "kselftest_harness.h"
 
+#ifndef CLONE_NEWTIME
+#define CLONE_NEWTIME 0x00000080
+#endif
+
 static int read_sem_state(int sem, __u32 *count, __u32 *max)
 {
 	struct ntsync_sem_args args;
@@ -1340,4 +1346,85 @@ TEST(stress_wait)
 	close(stress_device);
 }
 
+/*
+ * Absolute MONOTONIC timeouts must honour the caller's time namespace.
+ * With a negative monotonic offset, a 100 ms wait must still take ~100 ms
+ * of namespace time (not return immediately against the host clock).
+ */
+TEST(wait_any_monotonic_timens)
+{
+	struct ntsync_sem_args sem_args = {0};
+	struct ntsync_wait_args wait_args = {0};
+	struct timespec start, end;
+	char buf[64];
+	__u64 elapsed_ns;
+	int fd, offset_fd, sem, ret, status, len;
+	pid_t pid;
+
+	if (access("/proc/self/ns/time", F_OK))
+		SKIP(return, "Time namespaces are not supported");
+
+	fd = open("/dev/ntsync", O_CLOEXEC | O_RDONLY);
+	if (fd < 0)
+		SKIP(return, "/dev/ntsync is not available");
+
+	ret = unshare(CLONE_NEWTIME);
+	if (ret) {
+		close(fd);
+		if (errno == EPERM)
+			SKIP(return, "need CAP_SYS_ADMIN for CLONE_NEWTIME");
+		ASSERT_EQ(0, ret);
+	}
+
+	len = snprintf(buf, sizeof(buf), "%d %d 0", CLOCK_MONOTONIC, -10);
+	offset_fd = open("/proc/self/timens_offsets", O_WRONLY);
+	ASSERT_LE(0, offset_fd);
+	ASSERT_EQ(len, write(offset_fd, buf, len));
+	close(offset_fd);
+
+	pid = fork();
+	ASSERT_LE(0, pid);
+	if (!pid) {
+		int obj;
+
+		sem_args.count = 0;
+		sem_args.max = 1;
+		sem = ioctl(fd, NTSYNC_IOC_CREATE_SEM, &sem_args);
+		if (sem < 0)
+			_exit(1);
+
+		obj = sem;
+		wait_args.timeout = get_abs_timeout(100);
+		wait_args.objs = (uintptr_t)&obj;
+		wait_args.count = 1;
+		wait_args.owner = 123;
+		wait_args.index = 0xdeadbeef;
+
+		if (clock_gettime(CLOCK_MONOTONIC, &start))
+			_exit(2);
+		ret = ioctl(fd, NTSYNC_IOC_WAIT_ANY, &wait_args);
+		if (clock_gettime(CLOCK_MONOTONIC, &end))
+			_exit(2);
+
+		if (ret != -1 || errno != ETIMEDOUT)
+			_exit(3);
+
+		elapsed_ns = (end.tv_sec - start.tv_sec) * 1000000000ULL +
+			     (end.tv_nsec - start.tv_nsec);
+		/* Without timens conversion this returns in ~0 ms. */
+		if (elapsed_ns < 50 * 1000000ULL)
+			_exit(4);
+		if (elapsed_ns > 1000 * 1000000ULL)
+			_exit(5);
+
+		_exit(0);
+	}
+
+	ASSERT_EQ(pid, waitpid(pid, &status, 0));
+	EXPECT_TRUE(WIFEXITED(status));
+	EXPECT_EQ(0, WEXITSTATUS(status));
+
+	close(fd);
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

