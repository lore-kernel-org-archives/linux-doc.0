Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4841315D3E
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 20:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764276283; cv=none; b=r0R7lWSoxJw3WrHTYfRLvDpUeleJtvqzCAwKz+85dad1NH5E1wYZrQ1g+3+M0oliYM3clGqTqvEK9mr+htDPQ8b9nqXuQZkN4BmCt9m7Nbs7zn30Jo7zKi0iqvKwJ8zRFeiry4dP0HcOqo6tb2nTDXr3U/BdLrYo5PsOtXy+CMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764276283; c=relaxed/simple;
	bh=2LyuBsPor15Og8w8FehldYD9uvgj0U/Qd8569PQOz/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltNI2606LOtdGZI6HS7rnkazkcYDuWAzjIhRm34ViTSPFwlwXAZBf+dLwu1Qlxmcm5B3GhuzV9p9tOFFd+P6N2BqIeas76mBhOF3eCJPOq4T9lhEhQSwSQHp4eQuZhYDs6h5LkZ1zxMsOA3thqqrjtuSXBaz488x1o4wtME5osM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dt9Zt17j; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dt9Zt17j"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b3b29153fso734621f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 12:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764276280; x=1764881080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8Gbmeh89/N4kjz62es84Em0iR2fT9OzX01rnhn2RRU=;
        b=Dt9Zt17jvBDfWOm7l30BS/Oc9Qe4F/BCWiKv+NhmEU+EbZvJPCxVKJjkVJ7p05Qsk7
         f+8HMtAEyrJ/LQu9mxbnstQIKAqZWcOo7jj53Um9pLTE1/W5SgENl/f71t6civSLcKS6
         TaFFcDsqJ8YuQSea11TSOhuoTfDcqc3QveUkZsU0qlpRkGXJAJuyUJi2LeFrufincLTE
         mMa9vRq30CO//JeW4SAmfpybZg/NdMb02WZLscsQcs6SoNP9RKnwlzc4iHx/ow4os4XJ
         +rir21G5YO0AvWbqVK4MN9F94EakNOkiLfbxe7G9f8ik8N7dk+z8OCgg+COok/ENF4ZF
         7jiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764276280; x=1764881080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M8Gbmeh89/N4kjz62es84Em0iR2fT9OzX01rnhn2RRU=;
        b=EjvfknE2ki5T6M4DABht71Fo7QOREDQT9kxiI+ljVF4LJ/mhpgJUl46HFOYTZgWovQ
         N9Mgf10Ie+DbXL+G9i9YcTQ0FI03OXSqQIHY9rnjYOq+QRgyyvsraLv8UAusB+wdZvrs
         tl4oF1XRd6PVh2MRCEWUKvTSbjBhfmFq/eLQXtB4XK/RSvG/zpIKXIy3NPye/+Kguywz
         te02Ucg325bsHqikyVRKGlsd0JBm9NKLhVi1o6soU0/6So8M1SegbU/b3W6eYkUuRGXN
         6Yvb8+99T5S0RM8DpH9SwwzVz2tlPOtng1f1MaZDQv/kHqRjvBA4TaHDNgZyfcy679iD
         zTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo1q7aCSIQDcdLGxR0GWj2UrHuW0R4HYm0+jxNOeBjXjL5bsDABz4+edRNHte0Eoh36746EJYcRb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwPA+ouyDl6qKg7OhRpWE2oNwuaSVhXcVj0vUYv+xDxBy3xIQU
	4aP1h2hhcK4F4hm12HBH12RQPQl4LiICjwR6wdCm+qZLF3XXQnAo2jic
X-Gm-Gg: ASbGncsfIyrYo0px5EaLTtMrOfaYNzNokqFni/i3jdZrJss471zGRWoWpjPgNhu/XHv
	idrSiSm+xzXyH9ratxCe8PSNhOC9mKTaWxGX07NmmLhYv8F2FAFoclIt7YJVGXw28jlWZGtgP3i
	+RUPeAyxur40VDcQg4nrWeV/7UiprhgDar+DXJJBSYoO5EmoGrcrue4tGKI9XMx4jC+yY2B6Ywa
	468H9sVSxwIp4haGHVXzeocRqSKcuhyd3+IvuIOmliH0zL3F8m8eoVK1+b10J2pIpfh4ixNwOp3
	9m/Zi5LzQHR9oibyhVhwVNX+Hof3KYTBOmYDW+iJwFzC9W1J5/61Wm7KPtEG6tBl6r/wX1K5h5l
	Je7OYqj8AjKvyuHC/mFUMJoriFZfufiLtT8CuLdNf+PgWsuyx7k4CgjMp51eXcSQd5sGD0VTiHK
	DKh5UXMbaiWWpRpw==
X-Google-Smtp-Source: AGHT+IGuV2DWxNxvizrrGr6FH3gzPVUslsgMTwKhOGOXoIvvKJIWs4/U+A5R9xyG+U9svjhm0G8y7A==
X-Received: by 2002:a05:6000:26c9:b0:42b:30f9:79b6 with SMTP id ffacd0b85a97d-42cc1d62843mr26242387f8f.58.1764276279891;
        Thu, 27 Nov 2025 12:44:39 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d614asm5346105f8f.12.2025.11.27.12.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 12:44:39 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Simon Horman <horms@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	io-uring@vger.kernel.org,
	dtatulea@nvidia.com
Subject: [PATCH net-next v6 8/8] selftests: iou-zcrx: test large chunk sizes
Date: Thu, 27 Nov 2025 20:44:21 +0000
Message-ID: <ef9cc9f58d60656a8afef1fc84f066aeb7b27378.1764264798.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764264798.git.asml.silence@gmail.com>
References: <cover.1764264798.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test using large chunks for zcrx memory area.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 .../selftests/drivers/net/hw/iou-zcrx.c       | 72 +++++++++++++++----
 .../selftests/drivers/net/hw/iou-zcrx.py      | 37 ++++++++++
 2 files changed, 97 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
index 62456df947bc..fed5452e2ca3 100644
--- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
+++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
@@ -12,6 +12,7 @@
 #include <unistd.h>
 
 #include <arpa/inet.h>
+#include <linux/mman.h>
 #include <linux/errqueue.h>
 #include <linux/if_packet.h>
 #include <linux/ipv6.h>
@@ -37,6 +38,23 @@
 
 #include <liburing.h>
 
+#define SKIP_CODE	42
+
+struct t_io_uring_zcrx_ifq_reg {
+	__u32	if_idx;
+	__u32	if_rxq;
+	__u32	rq_entries;
+	__u32	flags;
+
+	__u64	area_ptr; /* pointer to struct io_uring_zcrx_area_reg */
+	__u64	region_ptr; /* struct io_uring_region_desc * */
+
+	struct io_uring_zcrx_offsets offsets;
+	__u32	zcrx_id;
+	__u32	rx_buf_len;
+	__u64	__resv[3];
+};
+
 static long page_size;
 #define AREA_SIZE (8192 * page_size)
 #define SEND_SIZE (512 * 4096)
@@ -65,6 +83,8 @@ static bool cfg_oneshot;
 static int cfg_oneshot_recvs;
 static int cfg_send_size = SEND_SIZE;
 static struct sockaddr_in6 cfg_addr;
+static unsigned cfg_rx_buf_len = 0;
+static bool cfg_dry_run;
 
 static char *payload;
 static void *area_ptr;
@@ -128,14 +148,28 @@ static void setup_zcrx(struct io_uring *ring)
 	if (!ifindex)
 		error(1, 0, "bad interface name: %s", cfg_ifname);
 
-	area_ptr = mmap(NULL,
-			AREA_SIZE,
-			PROT_READ | PROT_WRITE,
-			MAP_ANONYMOUS | MAP_PRIVATE,
-			0,
-			0);
-	if (area_ptr == MAP_FAILED)
-		error(1, 0, "mmap(): zero copy area");
+	if (cfg_rx_buf_len && cfg_rx_buf_len != page_size) {
+		area_ptr = mmap(NULL,
+				AREA_SIZE,
+				PROT_READ | PROT_WRITE,
+				MAP_ANONYMOUS | MAP_PRIVATE |
+				MAP_HUGETLB | MAP_HUGE_2MB,
+				-1,
+				0);
+		if (area_ptr == MAP_FAILED) {
+			printf("Can't allocate huge pages\n");
+			exit(SKIP_CODE);
+		}
+	} else {
+		area_ptr = mmap(NULL,
+				AREA_SIZE,
+				PROT_READ | PROT_WRITE,
+				MAP_ANONYMOUS | MAP_PRIVATE,
+				0,
+				0);
+		if (area_ptr == MAP_FAILED)
+			error(1, 0, "mmap(): zero copy area");
+	}
 
 	ring_size = get_refill_ring_size(rq_entries);
 	ring_ptr = mmap(NULL,
@@ -157,17 +191,23 @@ static void setup_zcrx(struct io_uring *ring)
 		.flags = 0,
 	};
 
-	struct io_uring_zcrx_ifq_reg reg = {
+	struct t_io_uring_zcrx_ifq_reg reg = {
 		.if_idx = ifindex,
 		.if_rxq = cfg_queue_id,
 		.rq_entries = rq_entries,
 		.area_ptr = (__u64)(unsigned long)&area_reg,
 		.region_ptr = (__u64)(unsigned long)&region_reg,
+		.rx_buf_len = cfg_rx_buf_len,
 	};
 
-	ret = io_uring_register_ifq(ring, &reg);
-	if (ret)
+	ret = io_uring_register_ifq(ring, (void *)&reg);
+	if (cfg_rx_buf_len && (ret == -EINVAL || ret == -EOPNOTSUPP ||
+			       ret == -ERANGE)) {
+		printf("Large chunks are not supported %i\n", ret);
+		exit(SKIP_CODE);
+	} else if (ret) {
 		error(1, 0, "io_uring_register_ifq(): %d", ret);
+	}
 
 	rq_ring.khead = (unsigned int *)((char *)ring_ptr + reg.offsets.head);
 	rq_ring.ktail = (unsigned int *)((char *)ring_ptr + reg.offsets.tail);
@@ -323,6 +363,8 @@ static void run_server(void)
 	io_uring_queue_init(512, &ring, flags);
 
 	setup_zcrx(&ring);
+	if (cfg_dry_run)
+		return;
 
 	add_accept(&ring, fd);
 
@@ -383,7 +425,7 @@ static void parse_opts(int argc, char **argv)
 		usage(argv[0]);
 	cfg_payload_len = max_payload_len;
 
-	while ((c = getopt(argc, argv, "sch:p:l:i:q:o:z:")) != -1) {
+	while ((c = getopt(argc, argv, "sch:p:l:i:q:o:z:x:d")) != -1) {
 		switch (c) {
 		case 's':
 			if (cfg_client)
@@ -418,6 +460,12 @@ static void parse_opts(int argc, char **argv)
 		case 'z':
 			cfg_send_size = strtoul(optarg, NULL, 0);
 			break;
+		case 'x':
+			cfg_rx_buf_len = page_size * strtoul(optarg, NULL, 0);
+			break;
+		case 'd':
+			cfg_dry_run = true;
+			break;
 		}
 	}
 
diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
index 712c806508b5..83061b27f2f2 100755
--- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
+++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
@@ -7,6 +7,7 @@ from lib.py import ksft_run, ksft_exit, KsftSkipEx
 from lib.py import NetDrvEpEnv
 from lib.py import bkg, cmd, defer, ethtool, rand_port, wait_port_listen
 
+SKIP_CODE = 42
 
 def _get_current_settings(cfg):
     output = ethtool(f"-g {cfg.ifname}", json=True)[0]
@@ -132,6 +133,42 @@ def test_zcrx_rss(cfg) -> None:
         cmd(tx_cmd, host=cfg.remote)
 
 
+def test_zcrx_large_chunks(cfg) -> None:
+    cfg.require_ipver('6')
+
+    combined_chans = _get_combined_channels(cfg)
+    if combined_chans < 2:
+        raise KsftSkipEx('at least 2 combined channels required')
+    (rx_ring, hds_thresh) = _get_current_settings(cfg)
+    port = rand_port()
+
+    ethtool(f"-G {cfg.ifname} tcp-data-split on")
+    defer(ethtool, f"-G {cfg.ifname} tcp-data-split auto")
+
+    ethtool(f"-G {cfg.ifname} hds-thresh 0")
+    defer(ethtool, f"-G {cfg.ifname} hds-thresh {hds_thresh}")
+
+    ethtool(f"-G {cfg.ifname} rx 64")
+    defer(ethtool, f"-G {cfg.ifname} rx {rx_ring}")
+
+    ethtool(f"-X {cfg.ifname} equal {combined_chans - 1}")
+    defer(ethtool, f"-X {cfg.ifname} default")
+
+    flow_rule_id = _set_flow_rule(cfg, port, combined_chans - 1)
+    defer(ethtool, f"-N {cfg.ifname} delete {flow_rule_id}")
+
+    rx_cmd = f"{cfg.bin_local} -s -p {port} -i {cfg.ifname} -q {combined_chans - 1} -x 2"
+    tx_cmd = f"{cfg.bin_remote} -c -h {cfg.addr_v['6']} -p {port} -l 12840"
+
+    probe = cmd(rx_cmd + " -d", fail=False)
+    if probe.ret == SKIP_CODE:
+        raise KsftSkipEx(probe.stdout)
+
+    with bkg(rx_cmd, exit_wait=True):
+        wait_port_listen(port, proto="tcp")
+        cmd(tx_cmd, host=cfg.remote)
+
+
 def main() -> None:
     with NetDrvEpEnv(__file__) as cfg:
         cfg.bin_local = path.abspath(path.dirname(__file__) + "/../../../drivers/net/hw/iou-zcrx")
-- 
2.52.0

