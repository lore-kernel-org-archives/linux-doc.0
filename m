Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365993BC67B
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215803; cv=none; b=qSny5h9pJk6LyO7dbTs+v+RLJXeRbTkNUHYKp9bWSZYqOkK7+SlttlBZMl5A6wIyGRxFOp7XY6rM3yTDyApm9WBVDrHtRohjujXO+bXMVFYS1sGHTIOwLgq6PaXhufaz0shnw144yLswJNof/95vpYxcNhLxZIdP2nQd4Xpu/AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215803; c=relaxed/simple;
	bh=9YrqMac2RvVbcQMvhIkvAs6CdxSyWCSfXy/rvRlKfmE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U+MWM4Ln1rWq89dSnMrqbyLVDGowXM+0Gwf6XjdNEQAy2XriKC7moqFLcUz7o4JYJmvcZd0flq9HsWW/DT+wl33HQg1n91d2+gbTsK9p69SSQ6nD1i0eZyMk1HYMgfjygYqpW+6S0mVYTpQE2MzVTcRLZ4OyttWfU6RHPQYlKao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bf4OdtH7; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bf4OdtH7"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40efc77933fso5703292fac.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 00:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773215797; x=1773820597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQ1OrwVz8Z3OJFcYGZCm4ACsYMr8Af3yv6w/TQO392I=;
        b=bf4OdtH7dYvZH0Pm5BCE0v6Kyxgrqcm9ifR02nbDzdUgjo4ncoo7rOA6dUpoXbNOjl
         Cf18YTTMviUOYlpP6pO4GkC9utn3BDvSRM18341vKYC+if5y93YQ89ulI/GZlVhEIB6I
         3RamUOhKpNPdZSdRSvU2vlG8WmcwO1I7w5cF6qDNtfbNMdWux7C4uOrzuWX9CE0Ms6oz
         EsIgclWrrW399y8mn/r12uYJRC4B+2LkZRW3YmZs+B6OvsmEDFFOHblSC1kG0ETkG/AU
         BzCvlhugDNX1fI/4IROI5CgS3sv3hosqE80Lk9ZkPMPB/Uo1ROn16Qfz4CiMFrDCA2k+
         BAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215797; x=1773820597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DQ1OrwVz8Z3OJFcYGZCm4ACsYMr8Af3yv6w/TQO392I=;
        b=tWGi+XL6KFoX8v9u0jrWEsAVwCc5V/t3iRQCYL1H0AhqMFueUohqi5xrKexDKTXrri
         BhxfHzubH4fFkQsisndw73o/3Z6OL924yHszOzXfDzmvjY5kf9KVck4s4v+9dxBIcKXJ
         i6UlTaGRCNAiAb2tC+C7+tPUJmjEfZYOE+es4leoOgfBgbD6fwe0OMXNd3xsmJH2+kjw
         lGg6qn3qlWJoBg19/J0/GMK6zy+NK/eQFJ/aVuOL8+CrMpCdveyTNfvMlGNI/SmZh1b+
         EdyaUqiKIPr0GvCJXEO6slreXLAffDsA1m5lbjrVgb/uM/IELoI4Xa6H2xaVfyL0Z2aC
         hZVA==
X-Forwarded-Encrypted: i=1; AJvYcCUNA7vouD5eKkbDY1VSvq1uMX+wuEgfOu+55Pfp5ElzDiRy6oqPorQJUCmCPNAheUXu4g0rOFviJ4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJXqGPbxHwkm3M0cNllUd06kwbPagPEZcObyQeBG6ngVG0i/I1
	fOgfk4VCrWjJyldt7LeHOaJztMR4HJFt1kEX90vUoKyX+qulY3a+hUeN
X-Gm-Gg: ATEYQzz9lgVLuhJ99uyPvqpMggcbSJHSiZoZMHIrfjgmH6Ms1UW6di+9p+0jdipcw5s
	3q2GV7AQNHeVPfxX1jG3kCejQiF5DL8H39qW6EPbfMs4HliaWc/AZaLAPjg0lT7ABqxdeGNGMWB
	xYz87h+JAPuRhgchUoNJJgbQXbE0SMvv5r4K7tLLtXppnWWWLKtNZ8nqJY3+l9jC4je6XU7eon3
	m5eoGI3HvXAEdWDkxQX8TCy9lnnflpSGtHK6lrWEyIaBPmWxlhwh4+XFN2y8tlbmiglx4idBSYq
	Ph81PFD2v3BY15FMpIxr2JS6K0sj73CjGe7qKh8YXXE3ci4uakSAvNiAijiDg5zKDHeDmcGbTb9
	b4OZdiQ2i02O9bgiLSEQNCzEIeiHBC/B1wMsWoMXMIERjTxqjRlNhQQkLs38FpfzWjikxbtpAvC
	3WWCyxPOtF+dZruL/hVfpeWvCa83jA7z+YFov0WJU2aCFG6+8JyxZ+Hy/iN9fTvH+YKdIXpPoFx
	pQnCajMKUwLLcZDDPhGwNLVs1OWCc1vZkGzO/nXrxKU0elT
X-Received: by 2002:a05:6870:2e04:b0:409:7cfc:7392 with SMTP id 586e51a60fabf-4177c96b888mr1211062fac.42.1773215796875;
        Wed, 11 Mar 2026 00:56:36 -0700 (PDT)
Received: from localhost.localdomain (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6ae0e3sm1568938fac.16.2026.03.11.00.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:56:36 -0700 (PDT)
From: Wesley Atwell <atwellwea@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	ncardwell@google.com,
	dsahern@kernel.org,
	matttbe@kernel.org,
	martineau@kernel.org,
	netdev@vger.kernel.org,
	mptcp@lists.linux.dev
Cc: kuniyu@google.com,
	horms@kernel.org,
	geliang@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	0x7f454c46@gmail.com,
	linux-doc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	atwellwea@gmail.com
Subject: [PATCH net 5/7] mptcp: refresh tcp rcv_wnd snapshot when syncing receive windows
Date: Wed, 11 Mar 2026 01:55:58 -0600
Message-Id: <20260311075600.948413-6-atwellwea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311075600.948413-1-atwellwea@gmail.com>
References: <20260311075600.948413-1-atwellwea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MPTCP rewrites the TCP shadow receive window on subflows when shared
receive-window state changes.

Once tp->rcv_wnd carries paired snapshot semantics, those subflow shadow
updates have to refresh the snapshot too. Convert the MPTCP window-sync
write sites to use the helper and keep the aggregate receive-space
arithmetic using the explicit rwnd-availability helper.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 net/mptcp/options.c  | 12 ++++++++----
 net/mptcp/protocol.h | 14 +++++++++++---
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/net/mptcp/options.c b/net/mptcp/options.c
index 43df4293f58b..6e6aa084cbfa 100644
--- a/net/mptcp/options.c
+++ b/net/mptcp/options.c
@@ -1073,9 +1073,12 @@ static void rwin_update(struct mptcp_sock *msk, struct sock *ssk,
 		return;
 
 	/* Some other subflow grew the mptcp-level rwin since rcv_wup,
-	 * resync.
+	 * resync. Keep the TCP shadow window in its advertised u32 domain
+	 * and refresh the advertise-time scaling snapshot while doing so.
 	 */
-	tp->rcv_wnd += mptcp_rcv_wnd - subflow->rcv_wnd_sent;
+	tcp_set_rcv_wnd(tp, min_t(u64, (u64)tp->rcv_wnd +
+				  (mptcp_rcv_wnd - subflow->rcv_wnd_sent),
+				  U32_MAX));
 	subflow->rcv_wnd_sent = mptcp_rcv_wnd;
 }
 
@@ -1334,11 +1337,12 @@ static void mptcp_set_rwin(struct tcp_sock *tp, struct tcphdr *th)
 	if (rcv_wnd_new != rcv_wnd_old) {
 raise_win:
 		/* The msk-level rcv wnd is after the tcp level one,
-		 * sync the latter.
+		 * sync the latter and refresh its advertise-time scaling
+		 * snapshot.
 		 */
 		rcv_wnd_new = rcv_wnd_old;
 		win = rcv_wnd_old - ack_seq;
-		tp->rcv_wnd = min_t(u64, win, U32_MAX);
+		tcp_set_rcv_wnd(tp, min_t(u64, win, U32_MAX));
 		new_win = tp->rcv_wnd;
 
 		/* Make sure we do not exceed the maximum possible
diff --git a/net/mptcp/protocol.h b/net/mptcp/protocol.h
index 0bd1ee860316..4ea95c9c0c7a 100644
--- a/net/mptcp/protocol.h
+++ b/net/mptcp/protocol.h
@@ -408,11 +408,19 @@ static inline int mptcp_space_from_win(const struct sock *sk, int win)
 	return __tcp_space_from_win(mptcp_sk(sk)->scaling_ratio, win);
 }
 
+/* MPTCP exposes window space from the mptcp-level receive queue, so it tracks
+ * a separate backlog counter from the subflow backlog embedded in struct sock.
+ */
+static inline int mptcp_rwnd_avail(const struct sock *sk)
+{
+	return READ_ONCE(sk->sk_rcvbuf) -
+	       READ_ONCE(mptcp_sk(sk)->backlog_len) -
+	       tcp_rmem_used(sk);
+}
+
 static inline int __mptcp_space(const struct sock *sk)
 {
-	return mptcp_win_from_space(sk, READ_ONCE(sk->sk_rcvbuf) -
-				    READ_ONCE(mptcp_sk(sk)->backlog_len) -
-				    sk_rmem_alloc_get(sk));
+	return mptcp_win_from_space(sk, mptcp_rwnd_avail(sk));
 }
 
 static inline struct mptcp_data_frag *mptcp_send_head(const struct sock *sk)
-- 
2.34.1

