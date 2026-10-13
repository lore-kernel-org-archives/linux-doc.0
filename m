Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4DF47604A
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 10:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887961; cv=none; b=qyN7DqBSumKR9ACZHPzjnr1lYKaQaGuk3fRlaTjFeN442/4Y5rfA18F/GrwZIL0hu64XiTNn7W2iAkEiudYYZdo1f1xqQ/QalR5YEEQ47W0v8BijCGI4WXpgZ9hK+01xPaGROLjFzTRfSZV/0IYpre5cfSwGtOFf7on6sL8rkxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887961; c=relaxed/simple;
	bh=kxEUmV+ihpDFc8QHCmkg0V33mIxMiSVPhPK4vTg71HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2KRSOW0wEhY1x++svxdzAGR2CPcDwnv5b6Iq+o4QlTpVbcvHpDh72FHJv8NA3aVqXsm9MTPehvc0wcPe1cPLlR3B8QKGgZNSTW8UF3I90S2NCnest4xLwCpciIv2oZRD6Dk6Qx2JTRHt911kvd+L/qGLFILQhlfnn6+KZMo1Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=KVOpGcuT; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="KVOpGcuT"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2e5f8fe879so444177666b.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 03:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1791887956; x=1792492756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfY/iHYXv3QwhJKAf6/gyW5d9fzrVKGW9h721jZH2IQ=;
        b=KVOpGcuTCsnBbKPrJZPfYCr2GuIMZ2lZebWZKMPKnoqcCWAR/MpPaD+3qcy1W1uS4L
         xy3in4Xk2z5I2rQkizmPVYnohGuxylq9NKPdPblh4j1g770TqNnNrCIpV9tnrPae1iNx
         VV5uRpodhzlOWfFZo7YZAi8Di3VaKYIoo85RJfZ3WR0iLxjIOMiPyGjUgvH6egZEDJXE
         NsfdXUGuUBnt6s0Q1/0vmxVkMOoBEKGHOxczJxtli+4LGJehZUiRTi1iicJtb6+AYL+O
         5RodsmeFyGMyEUTD2qFvw7eaRY9twWUv1AvRa1BuVbHjrpcpZdRILJZRWMfmNCnWb8wn
         Fd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887956; x=1792492756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YfY/iHYXv3QwhJKAf6/gyW5d9fzrVKGW9h721jZH2IQ=;
        b=lNZMmWHCZ1V0+OElPiQBMKHnd0/I7bxTjSBkUFdQLmGKpQCE0Rw/J5WI6l/iBTPPIA
         ViFDAOSDwtrrdVvT2gMYgijepdxb3W/s+t9XU5jgMGnupy9PQd40fHhbaYdCDTbpYB5/
         fq5b4CVZPOPSBA2fT7ZDsjZMMgvXs/J94p+x48yNiCQ2Ym+8PldfN+8I5mBY6J7FVKFB
         A4m1JkY4rCjGp43GLQa4q2q3+Am3v7tCrRBcbZVbv3R0aoGf4CdourkSK5yIwpS8f7DF
         6XblQlP0TQDl7gpeyCaAhRIQhW5HKwXhc2untvIOPyT4Zt7yGEzzp6ce5cfZUBTFkOHN
         DVkw==
X-Forwarded-Encrypted: i=1; AKwUvBzRT2N1dg7zByz+ZWklp/oPUFAWtrcysojC5oaS5t2EsL7Fn/Aiblu3INC6vgDv8WikOzzRsqNFccw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJALT1YcDCBsanZKRmQp2bRl6VkAW4P5uCTLFFunDGYfhNOLWJl
	r9WWL7gExBgUz4iCb5igHYTNICWSAHFRtDWMEqVaqILb6XaO7/B117GefLjwZN0VozE=
X-Gm-Gg: AYBFou0ZMfZsYX1dHo6VA31481RURaswugObyHAswjvazjIuZnZSyZiHO0QJc2cdM3r
	A+KqQZBDOK8b/RA5ZARWLX8oaMIvuUBcF589VCsjcWTzaB+4gfl3u/ZwIrJiN+4whR+LVReAPE4
	aG4F6uDejCa2Nf/nvUmGFBk8yY286rdBtlbJ2EKe181tQrE4o+fFWr7PHxIW2+hDxHKHds88YoN
	IRr4Y2A5kS+nXZBKpGCRDK/+ZHOozlUQltOZPvJAC8CVfyum7BXwk/2rCOrFVKaNwMgHlb7CWDs
	o62ODFK2xA+BZCByigTh1XftCMg6dCUxVZ22pxxZ08yhNIiFmPfSyi9/Ox24QaDRHa+Fov9Eco6
	w4Vbg/5U9H0cFdq1JoVgZ7wutFj5CZGf52KK5A+LJyns3MZd0JLXhb4mFIzm6GvdBpymKcOwtkn
	JPgItBnsVr0AjAmE2V8ueGAJfrBg+tD+QaStwMWQqGLYLXQzCcqjUiqoewsFpvjtkkRXbloB7f2
	5MTNuuAe8+UlOGQE9O88X5HOA==
X-Received: by 2002:a17:907:7211:b0:c2d:c7c9:906b with SMTP id a640c23a62f3a-c31aa083268mr1171982666b.28.1791887956529;
        Tue, 13 Oct 2026 03:39:16 -0700 (PDT)
Received: from 8951987238ab.arnhem.chello.nl ([104.28.187.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac62a7sm552462166b.63.2026.10.13.03.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:39:15 -0700 (PDT)
From: Willem Ferguson <wferguson@cloudflare.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ncardwell@google.com,
	bpf@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com
Subject: [RFC PATCH net-next 4/4] selftests/bpf: add tcp_ts_id test
Date: Tue, 13 Oct 2026 10:39:06 +0000
Message-ID: <20261013103906.2660384-5-wferguson@cloudflare.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013103906.2660384-1-wferguson@cloudflare.com>
References: <20261013103906.2660384-1-wferguson@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exercise BPF_SOCK_OPS_TCP_TS_ID_CB end to end over IPv6 loopback.

A cgroup sock_ops program sets BPF_SOCK_OPS_TCP_TS_ID_CB_FLAG on the
listener and answers the callback. With tcp_timestamps=1 and
tcp_ts_id_bits=4 the test checks that:

 - the callback runs exactly once, on the SYN, with args[1] equal to
   the configured width;
 - the accepted socket reports the identifier and width through
   TCP_TS_ID;
 - the connecting socket reports no identifier, as only passive opens
   are covered;
 - a reply that does not fit in the width ("decline" subtest) leaves the
   accepted socket without an identifier.

The test skips when tcp_ts_id_bits does not exist and restores both
sysctls afterwards. It defines TCP_TS_ID locally when the libc headers
do not have it yet.

Signed-off-by: Willem Ferguson <wferguson@cloudflare.com>
---
 .../selftests/bpf/prog_tests/tcp_ts_id.c      | 150 ++++++++++++++++++
 .../selftests/bpf/progs/test_tcp_ts_id_kern.c |  32 ++++
 2 files changed, 182 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/tcp_ts_id.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_tcp_ts_id_kern.c

diff --git a/tools/testing/selftests/bpf/prog_tests/tcp_ts_id.c b/tools/testing/selftests/bpf/prog_tests/tcp_ts_id.c
new file mode 100644
index 000000000000..25c1f6d8dd43
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/tcp_ts_id.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <errno.h>
+
+#include <test_progs.h>
+#include <network_helpers.h>
+
+#include "test_tcp_ts_id_kern.skel.h"
+
+#define LO_ADDR6		"::1"
+#define CG_NAME			"/tcp-ts-id-test"
+
+#ifndef TCP_TS_ID
+#define TCP_TS_ID		47
+#define TCP_TS_ID_BITS_SHIFT	8
+#endif
+
+#define TS_ID_BITS_SYSCTL	"/proc/sys/net/ipv4/tcp_ts_id_bits"
+#define TIMESTAMPS_SYSCTL	"/proc/sys/net/ipv4/tcp_timestamps"
+#define EXPECTED_TS_ID		7
+#define EXPECTED_TS_ID_BITS	4
+#define EXPECTED_TS_ID_BITS_STR	"4"
+
+static char saved_ts_id_bits[16];
+static char saved_timestamps[16];
+
+static int save_sysctl(const char *path, char *buf)
+{
+	int err = 0;
+	FILE *f;
+
+	f = fopen(path, "r");
+	if (!f)
+		return -errno;
+
+	if (fscanf(f, "%15s", buf) != 1)
+		err = -EINVAL;
+	fclose(f);
+
+	return err;
+}
+
+static void restore_sysctl(const char *path, const char *buf)
+{
+	if (buf[0])
+		write_sysctl(path, buf);
+}
+
+static void run_ts_id_test(int cg_fd, bool decline)
+{
+	int listen_fd = -1, cli_fd = -1, accept_fd = -1;
+	struct test_tcp_ts_id_kern *skel;
+	socklen_t optlen;
+	int ts_id;
+
+	skel = test_tcp_ts_id_kern__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "open_and_load"))
+		return;
+
+	skel->bss->ts_id_reply = EXPECTED_TS_ID;
+	skel->bss->ts_id_decline = decline;
+
+	skel->links.tcp_ts_id_sockops =
+		bpf_program__attach_cgroup(skel->progs.tcp_ts_id_sockops,
+					   cg_fd);
+	if (!ASSERT_OK_PTR(skel->links.tcp_ts_id_sockops, "attach_cgroup"))
+		goto out;
+
+	/* The listener has to be created after the attach to get LISTEN_CB. */
+	listen_fd = start_server(AF_INET6, SOCK_STREAM, LO_ADDR6, 0, 0);
+	if (!ASSERT_NEQ(listen_fd, -1, "start_server"))
+		goto out;
+
+	cli_fd = connect_to_fd(listen_fd, 0);
+	if (!ASSERT_NEQ(cli_fd, -1, "connect_to_fd"))
+		goto out;
+
+	accept_fd = accept(listen_fd, NULL, NULL);
+	if (!ASSERT_NEQ(accept_fd, -1, "accept"))
+		goto out;
+
+	ASSERT_EQ(skel->bss->ts_id_cb_count, 1, "cb_count");
+	ASSERT_EQ(skel->bss->ts_id_cb_syn, 1, "cb_on_syn");
+	ASSERT_EQ(skel->bss->ts_id_cb_bits, EXPECTED_TS_ID_BITS, "cb_bits");
+
+	/* The identifier must reach the child socket created by the SYN. */
+	optlen = sizeof(ts_id);
+	if (ASSERT_OK(getsockopt(accept_fd, IPPROTO_TCP, TCP_TS_ID, &ts_id,
+				 &optlen), "getsockopt(accept_fd, TCP_TS_ID)"))
+		ASSERT_EQ(ts_id, decline ? 0 :
+			  (EXPECTED_TS_ID_BITS << TCP_TS_ID_BITS_SHIFT) |
+			  EXPECTED_TS_ID, "server_ts_id");
+
+	/* Identifiers are passive-open only, so the opener must have none. */
+	optlen = sizeof(ts_id);
+	if (ASSERT_OK(getsockopt(cli_fd, IPPROTO_TCP, TCP_TS_ID, &ts_id,
+				 &optlen), "getsockopt(cli_fd, TCP_TS_ID)"))
+		ASSERT_EQ(ts_id, 0, "client_ts_id");
+out:
+	if (accept_fd != -1)
+		close(accept_fd);
+	if (cli_fd != -1)
+		close(cli_fd);
+	if (listen_fd != -1)
+		close(listen_fd);
+	test_tcp_ts_id_kern__destroy(skel);
+}
+
+void test_tcp_ts_id(void)
+{
+	int cg_fd = -1;
+	int err;
+
+	err = save_sysctl(TS_ID_BITS_SYSCTL, saved_ts_id_bits);
+	if (err == -ENOENT) {
+		test__skip();
+		return;
+	}
+	if (!ASSERT_OK(err, "read " TS_ID_BITS_SYSCTL))
+		return;
+
+	if (!ASSERT_OK(save_sysctl(TIMESTAMPS_SYSCTL, saved_timestamps),
+		       "read " TIMESTAMPS_SYSCTL))
+		goto out;
+
+	/* The callback only runs when timestamps are negotiated. */
+	if (!ASSERT_OK(write_sysctl(TIMESTAMPS_SYSCTL, "1"),
+		       "write " TIMESTAMPS_SYSCTL))
+		goto out;
+
+	/* Identifiers are disabled by default, so the test has to opt in. */
+	if (!ASSERT_OK(write_sysctl(TS_ID_BITS_SYSCTL, EXPECTED_TS_ID_BITS_STR),
+		       "write " TS_ID_BITS_SYSCTL))
+		goto out;
+
+	cg_fd = test__join_cgroup(CG_NAME);
+	if (!ASSERT_GE(cg_fd, 0, "test__join_cgroup(" CG_NAME ")"))
+		goto out;
+
+	if (test__start_subtest("assign"))
+		run_ts_id_test(cg_fd, false);
+
+	/* Only one sockops program may be attached to the cgroup at a time. */
+	if (test__start_subtest("decline"))
+		run_ts_id_test(cg_fd, true);
+out:
+	if (cg_fd != -1)
+		close(cg_fd);
+	restore_sysctl(TIMESTAMPS_SYSCTL, saved_timestamps);
+	restore_sysctl(TS_ID_BITS_SYSCTL, saved_ts_id_bits);
+}
diff --git a/tools/testing/selftests/bpf/progs/test_tcp_ts_id_kern.c b/tools/testing/selftests/bpf/progs/test_tcp_ts_id_kern.c
new file mode 100644
index 000000000000..07e4e56c4fb1
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/test_tcp_ts_id_kern.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+
+__u32 ts_id_cb_count;
+__u32 ts_id_cb_syn;
+__u32 ts_id_cb_bits;
+__u32 ts_id_reply;
+__u32 ts_id_decline;	/* set by userspace to exercise the decline path */
+
+SEC("sockops")
+int tcp_ts_id_sockops(struct bpf_sock_ops *skops)
+{
+	if (skops->op == BPF_SOCK_OPS_TCP_LISTEN_CB) {
+		bpf_sock_ops_cb_flags_set(skops,
+					  BPF_SOCK_OPS_TCP_TS_ID_CB_FLAG);
+		return 1;
+	}
+
+	if (skops->op != BPF_SOCK_OPS_TCP_TS_ID_CB)
+		return 1;
+
+	ts_id_cb_count++;
+	ts_id_cb_syn = !!(skops->skb_tcp_flags & (1U << 1));
+	ts_id_cb_bits = skops->args[1];
+	/* -1 does not fit in Arg2 bits, so the kernel assigns no ID. */
+	skops->reply = ts_id_decline ? -1 : ts_id_reply;
+
+	return 1;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.47.3

