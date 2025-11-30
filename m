Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32F8302747
	for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 23:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764545751; cv=none; b=uieZFJQVjujdy0kDaR9LsBYh6JvH1+KF59TC83OVqlu+UcKAx4HOhhqksA5JSibrPO+zg/PvakWBV4tyV0O/KLX6Qm4s/q1MTI0aIU7M6jFLJd/y7/lXnvkaW7+k6QFjNkL6bahdMbJHX4RcruF+IMePC8cDHnk3S5O6pkfmMhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764545751; c=relaxed/simple;
	bh=/jxCrpK8l6glGcqt49LNeHrXzbo3WZk9EY0AmmIwENo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYVfcGis4Hf2p/EfDyceg8nFc+3mW1IdpKNDjoY8bEKky2DdcylqkRNSWeMBcPOBKDhMJH/OKCYRfrd21cc7Xx2ZDCeG+4n8CqhxqZMYRuYF3B6CVBy56WjHeWEvMQg+AfH95sH8qgtiTTzyC4qy/3wKVkx4N2ynthTvUzWP3dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4C57Jqn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4C57Jqn"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso37852425e9.3
        for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 15:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764545747; x=1765150547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJRC4dPidxMIa9vqar4Y3LK2OFHt6WzESXNCWKhLD0s=;
        b=K4C57JqneyOxdD+kcxOXNpAtHCFPZDZ4ziofb7b6ea+Y5GVoCFxSbm7+jof8fDJCPT
         RzLjLX3oitW4dXH7lTRxBco/3yQ8N2meGswMXf9aS/ZlylTtKbRiR/RlXsxTWjVj9tvy
         XLGC/dkShYW7RecqSdBQOiS7EXSzeWin1aNR9QvsQWQUGnqd9TXVNyOdnfn5JSMkF/z5
         2iZN3vIe1zaaTbRws2GJIsdfvR4O8RSAzvLX63Eo20FNTa2w0Um66CwqSPj06w6F88Lw
         vOkBnHkWF6BuWnNxxwsKJfBDOlw6nUvkK44ZZyL7H+F79sl6FFu1v9j727Un1B3tyRle
         y6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764545747; x=1765150547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WJRC4dPidxMIa9vqar4Y3LK2OFHt6WzESXNCWKhLD0s=;
        b=dZGh75XQ//IYkJYl7yKtj67fZa/Kd2ZD3eJklr5BOimuo3v6RBbLJ0coyCHfrxKgGj
         goqQs5/zQxUF66JEInEVqTnh5vyOxMkjpL1XA8zPOzBaV9s7Q3zCbsysXcagnPGr8yzB
         adZa/FYmJ5D5yR68vqgm1RRAM6In9mKO3v6dRF0N8zQXkzz2aZpInAo821dQIefN7a5K
         MjuPVYfYs8nTeWcDjOtUnq0kdF6haYJgcXYE/BkZny0VhhDCivhZY03XZeDf5b1ljNL3
         xEd5ESFVVOxRv72s6Vg5eKLSkw13kdGIBJsaRzwRremmmXFVf+CVcMjGqWDF+KAZzCL7
         AvAw==
X-Forwarded-Encrypted: i=1; AJvYcCU7+2keqVYUhFTnL1mqGLyKeeCyb1hpibNE5XpK7PD8BK4U5sMyOEi2HEyzh5L81322w9ZYIZewzpE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdsp4Wp03PRmn854WdEvU07RvBxAZAQ5NFP3mETv20D5Yf+B0s
	vFL5hCNpmoevTzAmqa3mZpNGgZ50ODanTKSRCBdaS8abdoZNKzYUyaIC
X-Gm-Gg: ASbGnct0oTfT3mSwtWVfd/RWtoHs6HFHKrmf87FgZJeqZEMHYg53oVBPFgx5ybaCMhX
	ARCysd9nJkegFU7x6LWPL+jfiHW1DIpPYFhpUWRDYrROrNSYSUjt82AXxmwHkMqXSpSXwzL0OKN
	RJbpFe9dnHHKNIURdhH575w2YaB0E19/e64xeKcnTHzlcLCCxyZ6x9bCQa6g7A3uNoB7QqqlZUF
	oS4ahFIJWn6JKqR5EELUT9bekMW10kYRkrci7hu1Y3CCnZOLcBYfdKrH2sXF7AgDXxX5BtoXQBy
	wB1qmBzQNusTDrM+lRkBe5wRHfgUip8g1F1yutPrpI3bI/RM1bBJQT8Jr87KfIjUCInBEOomlmv
	7KHvOPH6nRUDnuQppMdWXHu22ymMpPxISUM1s4+pPpQw+kdM5ADMxq669sI/WcPWr3QnQhlUasD
	mjRJQTmPYrnDteCMBYSuvk9dfljMVOZhpwIbyJavnXT37ArbxGKcs30UJzwE9epxZrt2hwy8HA0
	qtePc/UKhxGhBCV
X-Google-Smtp-Source: AGHT+IF1C3BU+0TmVLhFFFLC7lJAEa9+OLBtLvpfXcpFjqpVlWK06cPRlsUJhKHpdqODVbDSNRV+FQ==
X-Received: by 2002:a05:600c:8b35:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-477c10d6fdamr359420355e9.10.1764545747159;
        Sun, 30 Nov 2025 15:35:47 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040b3092sm142722075e9.1.2025.11.30.15.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 15:35:46 -0800 (PST)
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
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Yue Haibing <yuehaibing@huawei.com>,
	David Wei <dw@davidwei.uk>,
	Haiyue Wang <haiyuewa@163.com>,
	Jens Axboe <axboe@kernel.dk>,
	Joe Damato <jdamato@fastly.com>,
	Simon Horman <horms@kernel.org>,
	Vishwanath Seshagiri <vishs@fb.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	io-uring@vger.kernel.org,
	dtatulea@nvidia.com
Subject: [PATCH net-next v7 9/9] selftests: iou-zcrx: test large chunk sizes
Date: Sun, 30 Nov 2025 23:35:24 +0000
Message-ID: <0339cb58a22925687ce66dbeb1efec7f13bdd7c3.1764542851.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764542851.git.asml.silence@gmail.com>
References: <cover.1764542851.git.asml.silence@gmail.com>
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
index 62456df947bc..0a19b573f4f5 100644
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
+static unsigned cfg_rx_buf_len;
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

