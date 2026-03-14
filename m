Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C401384237
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 20:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773519284; cv=none; b=FqCFo/cDF4x+2Yg1edv2Nq5IUreiODICjyLzrV+qmxKCkObR0JVvWduhqYJ2N7QskrwdcIcI3wMhMZakOAos/Ph5ivr2dVpfvo5+hoq8yQ5nZXKQx+/Rk1SDLg4BTXi0XmjetMUNNDsYawmC+VBBuhlCnotkmKD2hRBQcZdRIEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773519284; c=relaxed/simple;
	bh=x7JZBaiPMjila4i+dsi/muzHxZeS9PJ/SGrV4i00JNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dgz9f7e0OrKN1quxH8YPjwLf2/mW6d54b4sQWNd5+WSqD4N1xkn2yPUbWo5aMX6tCS9Mf0l9/lPNbop7FCpGmcMCvRHE+rq/lVTlm7qd2ujHRaRdGF8uYbaSw7A0j7+3ao6T41NPmhgp+eev3Igt0QPWJvb4YEZGZeWSnDAm5B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhUkIN79; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhUkIN79"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-415e568a7ecso1194555fac.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 13:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773519282; x=1774124082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iO8Gig+uUsNsJX3c3oLWHfAhxFR79WVWca0SWR3nLZY=;
        b=AhUkIN79mN8ojz/fybmKvpF0JjleCLGY4QbBKJgI6OUDuBXH4XR3lV3+WckMvA4KCc
         0OjOLBcBwM71dp/Mk32iasY+Z2jObUC4pSQP4hQqWgy0rpHeliVj8qTuEtNgwgrUcnoJ
         seV+FVl7Z93NKeu9ucjyvGwlbAFnJbY3D28Gs5S1QmeSbxksLmAUGkHjrA/P1xTN4edZ
         EOb+QWuFCp8WX0ZIJtxHpe70w9ne1eN+Xii8M33lXisL1CNd8vydDrg1MsnigRVFcecW
         bjcQFJWcU58wxnXkq+57nzQ57x/HlYiTb2HC26qEevaQptff6NMfXwj31ErwfQ8+QhUm
         kElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773519282; x=1774124082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iO8Gig+uUsNsJX3c3oLWHfAhxFR79WVWca0SWR3nLZY=;
        b=f0cz3kdxrvEotUcTb/PrP+DsuHyZvm7JopqfRLd5ZQlHhCGqaiczaPcWTe4oGLDwU9
         MXkNxeOiHUSqfHfkjPk30jGOxaRbbmzWw+iNyHhX3gMNrM/GP5GfM9eUpnqjuU8qdEOP
         +T6riZo4QfN+h8/WgQchcjPZiqohEclNThFZ1DrrdXQDf0FLLgZB0PROgA5esZtnbPgH
         IN+w4jzy8zlGIh6aHCOjqIg9ROoGAql1aV4n14fKwpGRgXDwNA+CH/C7BYjnMgdZvDjR
         k2PQxUMsjb+MvLoNmGYcBXct4TuBZIwuGsIqeAVf46DQIcgDk4NLHRMA5CuuMoux2ImT
         /2Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXHboP5wdN5WmvK7du8qfpmvs31MbEqMV10iZbOKDVGV8RyCzQhU2vZmQEqLsy2xJlmxUtEUgvKOjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMF0FaxVIeNX2RbUjzEsT0sgPvhwiOReqE9ZLpvDn9SA5WdSIS
	E6PaI5cuvFXIrsOUsgdygzT+rWmPIbC4Kci4Nn0yqm+IoTIp2gZFhM4T
X-Gm-Gg: ATEYQzwOQ9CBpmMxq7a47IZsDKszu5cPiqFeE91u87WGk+0qqaIX8NXtNe33CCn/mfh
	LOhpjASvr3WZL9QU96HJ+YCJUsF7zYp3x7OOS3+toXwyFg1SwKsX1cuH472zurDrFYI7zORcqwI
	BSAd30LolcShdm+U1tzoe42a67Xi+GgeovXlnd7J9gwK1gmSak7bJsgOAokqjqQYLNhXT7dF3l8
	K67sYFYEs447Hh6lzvuR0UPHD5vitB7kmUnSLWRvElOJySzRRXwlgAkc9EP2sFL/EK5erwoIzh6
	4rLLUS+1R4dpH5w3iHrKS4hyN0h2vmsqYOfcgNm24T4iUFF1s8r9Qx7H7rRtIQWR9MUaKdpBSRn
	zCigx30bfhT+EMJZijdxZv5PkU7UYBY5ZouQTRb50sdJ5MUZ3SHdlkO4TGnbtE6E2QUwif+OyKK
	ORGl8i3P05n3894K0JwPmXUpwx6DloJe35DWxeyVcTtyl3/RVJXdd4ynTEcuivD8eILrnO8Lj4q
	LDZDRtcVKnuR08HmgwPCqP6rtCknVTPPGUYiqN0
X-Received: by 2002:a05:6870:d8c:b0:404:33e1:3cc2 with SMTP id 586e51a60fabf-417b91b2c8fmr4474193fac.13.1773519282232;
        Sat, 14 Mar 2026 13:14:42 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e5e8185sm11914165fac.12.2026.03.14.13.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 13:14:41 -0700 (PDT)
From: atwellwea@gmail.com
To: netdev@vger.kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	ncardwell@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	mptcp@lists.linux.dev,
	dsahern@kernel.org,
	horms@kernel.org,
	kuniyu@google.com,
	andrew+netdev@lunn.ch,
	willemdebruijn.kernel@gmail.com,
	jasowang@redhat.com,
	skhan@linuxfoundation.org,
	corbet@lwn.net,
	matttbe@kernel.org,
	martineau@kernel.org,
	geliang@kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	0x7f454c46@gmail.com
Subject: [PATCH net-next v2 01/14] tcp: factor receive-memory accounting helpers
Date: Sat, 14 Mar 2026 14:13:35 -0600
Message-ID: <20260314201348.1786972-2-atwellwea@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260314201348.1786972-1-atwellwea@gmail.com>
References: <20260314201348.1786972-1-atwellwea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wesley Atwell <atwellwea@gmail.com>

Factor the core receive-memory byte accounting into small helpers so
window selection, pressure checks, and prune decisions all start from
one set of quantities.

This is preparatory only. Later patches will use the same helpers when
tying sender-visible receive-window state back to hard memory admission.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 include/net/tcp.h    | 32 +++++++++++++++++++++++++++-----
 net/ipv4/tcp_input.c |  2 +-
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/include/net/tcp.h b/include/net/tcp.h
index f87bdacb5a69..3a0060599afe 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -1751,12 +1751,34 @@ static inline void tcp_scaling_ratio_init(struct sock *sk)
 	tcp_sk(sk)->scaling_ratio = TCP_DEFAULT_SCALING_RATIO;
 }
 
+/* TCP receive-side accounting reuses sk_rcvbuf as both a hard memory limit
+ * and as the source material for the advertised receive window after
+ * scaling_ratio conversion. Keep the byte accounting explicit so admission,
+ * pruning, and rwnd selection all start from the same quantities.
+ */
+static inline int tcp_rmem_used(const struct sock *sk)
+{
+	return atomic_read(&sk->sk_rmem_alloc);
+}
+
+static inline int tcp_rmem_avail(const struct sock *sk)
+{
+	return READ_ONCE(sk->sk_rcvbuf) - tcp_rmem_used(sk);
+}
+
+/* Sender-visible rwnd headroom also reserves bytes already queued on backlog.
+ * Those bytes are not free to advertise again until __release_sock() drains
+ * backlog and clears sk_backlog.len.
+ */
+static inline int tcp_rwnd_avail(const struct sock *sk)
+{
+	return tcp_rmem_avail(sk) - READ_ONCE(sk->sk_backlog.len);
+}
+
 /* Note: caller must be prepared to deal with negative returns */
 static inline int tcp_space(const struct sock *sk)
 {
-	return tcp_win_from_space(sk, READ_ONCE(sk->sk_rcvbuf) -
-				  READ_ONCE(sk->sk_backlog.len) -
-				  atomic_read(&sk->sk_rmem_alloc));
+	return tcp_win_from_space(sk, tcp_rwnd_avail(sk));
 }
 
 static inline int tcp_full_space(const struct sock *sk)
@@ -1799,7 +1821,7 @@ static inline bool tcp_rmem_pressure(const struct sock *sk)
 	rcvbuf = READ_ONCE(sk->sk_rcvbuf);
 	threshold = rcvbuf - (rcvbuf >> 3);
 
-	return atomic_read(&sk->sk_rmem_alloc) > threshold;
+	return tcp_rmem_used(sk) > threshold;
 }
 
 static inline bool tcp_epollin_ready(const struct sock *sk, int target)
@@ -1949,7 +1971,7 @@ static inline void tcp_fast_path_check(struct sock *sk)
 
 	if (RB_EMPTY_ROOT(&tp->out_of_order_queue) &&
 	    tp->rcv_wnd &&
-	    atomic_read(&sk->sk_rmem_alloc) < sk->sk_rcvbuf &&
+	    tcp_rmem_avail(sk) > 0 &&
 	    !tp->urg_data)
 		tcp_fast_path_on(tp);
 }
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index e6b2f4be7723..b8e65e31255e 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5959,7 +5959,7 @@ static int tcp_prune_queue(struct sock *sk, const struct sk_buff *in_skb)
 	struct tcp_sock *tp = tcp_sk(sk);
 
 	/* Do nothing if our queues are empty. */
-	if (!atomic_read(&sk->sk_rmem_alloc))
+	if (!tcp_rmem_used(sk))
 		return -1;
 
 	NET_INC_STATS(sock_net(sk), LINUX_MIB_PRUNECALLED);
-- 
2.43.0

