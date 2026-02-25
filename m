Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F48192B7D
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 07:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772005612; cv=none; b=eQW6xL+a+PlWhYVQ3tFeLOSNuFORD41RNQ2SpXTpjKu7HYqo8W4+F6HPz6jcp4csxgJH7+L8EtPEhDn6U6Xddp4VtDb3i+8PUI/OeQ3g6+EMFzAvFFR1BbggDU+flwcAOp8h3SjqY3rzoikCqY/NNQjqta/ukgkgf26FQi+yx9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772005612; c=relaxed/simple;
	bh=oVSmkTDt2CC7vagB/7IKxbULhl8iz92yFIuiTzbBb00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aTl4v4/Ugd/n+K42MHo9vUb7RRCzXITCg/g80btkvQpc1YSk3JAxE/2JUTJxgzDRRthtE0/Akb4SWTwH+cHnJBFosb607U6nqb3e2auQ6VQrGQm7yuL0Si7rZZUA80DACdjq6HzdjhgoJBCjDQNXUb5embHrPafSeWq/+aO4HxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=bo2ZnJuD; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="bo2ZnJuD"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2aae4816912so44506435ad.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 23:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1772005611; x=1772610411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d5uWqej63a79hXQBLP6LiTHLyAOyVWFc6uQobJ5V1EQ=;
        b=bo2ZnJuDYLLJgRlA4uyEoN/74nIOfy+iPbb+OKNNKGWgphs98VJtywYP5pBwY8pyZh
         NnhRNY8xxTi7G4wjVX7W7GSna0P/NuUuY2ARQ4yHi1O76xU9wTP7un7tDW1C/fVKt9bW
         Q/YW2nncF8tg8hWdTOS7Ce4KGRSrVWuSuZM6cRHy4Eqj8ibNVyl6/56TF77jkdFbjP2h
         8APO1XN6lFkcHrwleVBdqVtqUM5sGMnAGmF+cH6tmc2mcb+fPBeGzg2F2Uf/Lx6zJ642
         AuobWZAee3wfiOBqDB0pXZm3iyXlDjf0Hg0NQmSgws6KEm12P8Hw8tiSHjxC0fz8OPfj
         lQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772005611; x=1772610411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5uWqej63a79hXQBLP6LiTHLyAOyVWFc6uQobJ5V1EQ=;
        b=IK6rQVlMh7OUhNF/5EJ9O9eg8nVhY7llzTjyH1CsRtTMqg9QjpZXWZWwqps/8IjxvW
         +/UFgJBxb77J35GPGdAJcIYgDhS031hbuNT9finTjoVHpYM/yiKbQYHYTeIm20a7qxpg
         vCPi9iwE+92svtXrI6m0o3qczMdIUZIRe9TR+7ewWlcLnVnW5d9A8zxjkCgayahxicJx
         vxWT3GeXReAbYcjaUS/ZwMcruHBvuY0qnxC2TYmg0wfWF08TZJTEZ2E3vzZaZJs1F2TR
         4ddroT/FD3ErdGVU144Hfg7t5rrXtS+sWnHxH6z5YRXwwnreemPnZxMOLaybvuVi/nB9
         olzw==
X-Forwarded-Encrypted: i=1; AJvYcCX7tJ4ztMF8XyIjCBWcRcb2qx0zr1cSkYQk8taiuhNdWTH90EYvOTW6JPBDlW8w6XgqzWKc+7ddCQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQDJF+hc/y370kwOLdIV0AsfyPla8FkQmsUb1V0H3yVGe+FyVV
	Uv+hC1Vjb1Ktabl566UnxBpeSIYMTJBCcaNJExViESjCwerWMZKx3rVWHzErJEoPlNTbqCsfeNE
	nAVJ5qFk=
X-Gm-Gg: ATEYQzy2IDXlj6sp51GY10NdSHTWfZOFswbiC7S5uQ5Pz+Pr7Z6Eem7Xv7Ah/aUeMHU
	feR5Dx28lvUtuYknShSvZmao9pl4eRzGNdOn6cyb+I8Sa2fPH6VWzgdm6dzOzHpRG2tZD764WdB
	zjHp4C6KC5OxHkzn+xy2zbnD/dg5KeQ0vSuvDR8nrgc3+YdHIBzpBIDy3+oFZu+B/8W3KBDSsAW
	1SUhyGTVdOwIMyIqoIkwa4JZBQJhClPQFD1XpkRkeWur9nsWePrCd8zFwsYBMIEICQPBqQuOLK3
	ftEH/hah4vHnZ4fhge1A47JR2yqQJoM3TstONLna9Al5hePY9CN6p08yJE/DLKdYjH01OZNlEqZ
	GvWHMUjbK1yXu0jyK9JCWLinvYV73jai262YS694i7lAqqp6sAdBjNIXFzlWPO6Y5Hg7NZ4JEXP
	VUeu09CunB5AjFBuKx4Myn7ILDHrwW3TcVT7oVLACBaMyQuqk0
X-Received: by 2002:a17:902:e885:b0:2ad:b957:e7ff with SMTP id d9443c01a7336-2add14401b4mr16154695ad.45.1772005610812;
        Tue, 24 Feb 2026 23:46:50 -0800 (PST)
Received: from bms-ytl-d1-app-10-251-178-27 ([147.136.157.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e062sm170844165ad.48.2026.02.24.23.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:46:50 -0800 (PST)
From: Leon Hwang <leon.huangfu@shopee.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Ahern <dsahern@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ij@kernel.org>,
	Leon Hwang <leon.huangfu@shopee.com>,
	Ido Schimmel <idosch@nvidia.com>,
	kerneljasonxing@gmail.com,
	lance.yang@linux.dev,
	jiayuan.chen@linux.dev,
	Leon Hwang <leon.hwang@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next] tcp: Add net.ipv4.tcp_purge_receive_queue sysctl
Date: Wed, 25 Feb 2026 15:46:33 +0800
Message-ID: <20260225074633.149590-1-leon.huangfu@shopee.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new sysctl knob, net.ipv4.tcp_purge_receive_queue, to
address a memory leak scenario related to TCP sockets.

Issue:
When a TCP socket in the CLOSE_WAIT state receives a RST packet, the
current implementation does not clear the socket's receive queue. This
causes SKBs in the queue to remain allocated until the socket is
explicitly closed by the application. As a consequence:

1. The page pool pages held by these SKBs are not released.
2. The associated page pool cannot be freed.

RFC 9293 Section 3.10.7.4 specifies that when a RST is received in
CLOSE_WAIT state, "all segment queues should be flushed." However, the
current implementation does not flush the receive queue.

Solution:
Add a per-namespace sysctl (net.ipv4.tcp_purge_receive_queue) that,
when enabled, causes the kernel to purge the receive queue when a RST
packet is received in CLOSE_WAIT state. This allows immediate release
of SKBs and their associated memory resources.

The feature is disabled by default to maintain backward compatibility
with existing behavior.

Signed-off-by: Leon Hwang <leon.huangfu@shopee.com>
---
 Documentation/networking/ip-sysctl.rst         | 18 ++++++++++++++++++
 .../net_cachelines/netns_ipv4_sysctl.rst       |  1 +
 include/net/netns/ipv4.h                       |  1 +
 net/ipv4/sysctl_net_ipv4.c                     |  9 +++++++++
 net/ipv4/tcp_input.c                           | 16 ++++++++++++++++
 5 files changed, 45 insertions(+)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index d1eeb5323af0..71a529462baa 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -1441,6 +1441,24 @@ tcp_rto_max_ms - INTEGER
 
 	Default: 120,000
 
+tcp_purge_receive_queue - BOOLEAN
+	When a socket in the TCP_CLOSE_WAIT state receives a RST packet, the
+	default behavior is to not clear its receive queue.  As a result,
+	any SKBs in the queue are not freed until the socket is closed.
+	Consequently, the pages held by these SKBs are not released, which
+	can also prevent the associated page pool from being freed.
+
+	If enabled, the receive queue is purged upon receiving the RST,
+	allowing the SKBs and their associated memory to be released
+	promptly.
+
+	Possible values:
+
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
+
 UDP variables
 =============
 
diff --git a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
index beaf1880a19b..f2c42e7d84a9 100644
--- a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
+++ b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
@@ -123,6 +123,7 @@ unsigned_long                   sysctl_tcp_comp_sack_delay_ns
 unsigned_long                   sysctl_tcp_comp_sack_slack_ns                                                        __tcp_ack_snd_check
 int                             sysctl_max_syn_backlog
 int                             sysctl_tcp_fastopen
+u8                              sysctl_tcp_purge_receive_queue
 struct_tcp_congestion_ops       tcp_congestion_control                                                               init_cc
 struct_tcp_fastopen_context     tcp_fastopen_ctx
 unsigned_int                    sysctl_tcp_fastopen_blackhole_timeout
diff --git a/include/net/netns/ipv4.h b/include/net/netns/ipv4.h
index 8e971c7bf164..ab973f30f502 100644
--- a/include/net/netns/ipv4.h
+++ b/include/net/netns/ipv4.h
@@ -220,6 +220,7 @@ struct netns_ipv4 {
 	u8 sysctl_tcp_nometrics_save;
 	u8 sysctl_tcp_no_ssthresh_metrics_save;
 	u8 sysctl_tcp_workaround_signed_windows;
+	u8 sysctl_tcp_purge_receive_queue;
 	int sysctl_tcp_challenge_ack_limit;
 	u8 sysctl_tcp_min_tso_segs;
 	u8 sysctl_tcp_reflect_tos;
diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
index 643763bc2142..da30970bb5d5 100644
--- a/net/ipv4/sysctl_net_ipv4.c
+++ b/net/ipv4/sysctl_net_ipv4.c
@@ -1641,6 +1641,15 @@ static struct ctl_table ipv4_net_table[] = {
 		.extra1		= SYSCTL_ONE_THOUSAND,
 		.extra2		= &tcp_rto_max_max,
 	},
+	{
+		.procname       = "tcp_purge_receive_queue",
+		.data           = &init_net.ipv4.sysctl_tcp_purge_receive_queue,
+		.maxlen         = sizeof(u8),
+		.mode           = 0644,
+		.proc_handler   = proc_dou8vec_minmax,
+		.extra1         = SYSCTL_ZERO,
+		.extra2         = SYSCTL_ONE,
+	},
 };
 
 static __net_init int ipv4_sysctl_init_net(struct net *net)
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 6c3f1d031444..43f32fb5831d 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -4895,6 +4895,7 @@ EXPORT_IPV6_MOD(tcp_done_with_error);
 /* When we get a reset we do this. */
 void tcp_reset(struct sock *sk, struct sk_buff *skb)
 {
+	const struct net *net = sock_net(sk);
 	int err;
 
 	trace_tcp_receive_reset(sk);
@@ -4911,6 +4912,21 @@ void tcp_reset(struct sock *sk, struct sk_buff *skb)
 		err = ECONNREFUSED;
 		break;
 	case TCP_CLOSE_WAIT:
+		/* RFC9293 3.10.7.4. Other States
+		 *   Second, check the RST bit:
+		 *     CLOSE-WAIT STATE
+		 *
+		 * If the RST bit is set, then any outstanding RECEIVEs and
+		 * SEND should receive "reset" responses.  All segment queues
+		 * should be flushed.  Users should also receive an unsolicited
+		 * general "connection reset" signal.  Enter the CLOSED state,
+		 * delete the TCB, and return.
+		 *
+		 * If net.ipv4.tcp_purge_receive_queue is enabled,
+		 * sk_receive_queue will be flushed too.
+		 */
+		if (unlikely(net->ipv4.sysctl_tcp_purge_receive_queue))
+			skb_queue_purge(&sk->sk_receive_queue);
 		err = EPIPE;
 		break;
 	case TCP_CLOSE:
-- 
2.52.0

