Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F39386431
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 20:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773519288; cv=none; b=tE6iPPFVizwjwqXAAHmJ9zZVv3KQYPEuEETtTnc/ZgImDpTLtA4w4dmRSyLjjEvnw8aas+BnIVr2PH+8xCYoSr5qrx1xSHTD5n2rkTA+l908QH4g2um7439IfMvGRIsWXA07Iudfs0Tyb3Tz+T2gAVhp6AbBX5KKOj5+JWknYw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773519288; c=relaxed/simple;
	bh=Ttxd17H5LIzMMzsw2TR13aHibCW2LBBebxMgXaknmMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2Z0dI7YCijiDUJtKzs9m0ZV3M26hj7VK3HR0gy0YJX3Vx99q5HAoOgxX/+fcPzpNO/6LYtFve8FXKNQbAqugxI8ZCwVd4BFJv6lGqFkhTO68f9mk6dhf1IzMj3sc5qeXr+K8x0f30LZ7zUjGIogMdBM3QET7KGxummHB6/eCq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYmglQBk; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYmglQBk"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-40946982a78so1278352fac.2
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 13:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773519286; x=1774124086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMcuR3aCCM7PiXgftnIc+4nYAKR8gQqAUuswiZ7+FpY=;
        b=GYmglQBkG2E1X7kBarsxxIkNHb6EjaPAexNG1J/bbJZ/0cXvJUreZuGHd6Q8gpCRJc
         THax/x7rWjLdmM93OMlNnpCT6vIx0UK2aWUQwZyYq285oHH2S/GXRP6Hh4G0zUj8G9ZH
         BaoLhauFbOMn6zIIziSlGKm9KLpd8yMaohK8FEe2mw/u8jtJJw4Nt1/KtZSdbznqP9dO
         B5/JjRREpPF0nZGjCDEX4bQQ4+i837nS/KDXSE7C+XV6rClkeTa6XyIG4kaKMeWW9HyO
         9N9bsmPdqkKZEUXtur5bUZFEyOiLFOcW0S3Bcr6PBYq0+xFor32PLTZXUTlUBFPpmhN4
         ZsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773519286; x=1774124086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zMcuR3aCCM7PiXgftnIc+4nYAKR8gQqAUuswiZ7+FpY=;
        b=AS6icAijFQ+9Ny4+vbbuV6jLzz3TPw31AW7QXjDKD1/5nTd5XtrsW6giSsOnTsYLta
         TxVb9ACNitZ2ln6I43KuC1pPvVLAnsgQ69UdlzNaeLtOCPx081utLsC1nEtkIOESoHi2
         IKZhqqt+9tmNGhIufn5udxr+V+TcaLy5TmX05xi1lqPcHWdsMo93CHBfDtbZ2REdHLNC
         qMCaAbsDTdHj3On/y7BbUoDz4vFlUprHLMHlBPs08w9mTqFWqI5doquxioEhkX6O+gP/
         Uzbv9eHUoDnlfDJtMMuwTfM6XoJjMJ7Tb7w/925UaGBjlwJZmfxEoeMXviqPr8KBLpYG
         oasw==
X-Forwarded-Encrypted: i=1; AJvYcCXCPRe4/vQLjFkDMYCNEJat6+suHxlMUbCqbAl+0bdX7pokez2OV0t77ki5WE9A+EEEvkoRbZwYzDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuAva6LGcFDKwaecPtS+YMQzOUMnxb1IdT2i2di41z3By6idi+
	QY443o6pLTAgmeQkDpbPFgp9MF2CBlTHzf04cd83drpiCwSVlPIeAOTv
X-Gm-Gg: ATEYQzyGO6AAnD189HkwYbOZj1KT6FWT2uvZud6Xprm/f3bSFWqzEV6hHgFXoUcmST6
	RFbcq2oW3ta/y/lusduVDCeOOu/hnqo4HNSSyeswPzlYU0aosMVQcx7f2hk0bsH7Mbem+Tl88hJ
	/ezDfTD5qhXS1nMt71o6eNZ9+03w03EWprxa42bxcveidAW0Y0vRhcb5/GOIPlvJs9sTgq3iC46
	D//6RUooTt/ABiwMeN5+3uHK5+zitKRJzHxOebJKbeXUMFAJQ7s6lgScuuFFOk6u400Lxd/+MnF
	ef2MancWtXxVqoBNJwxNMXB2niexSstk1Y39LCZIsju8+2Iuu8P9b8JTF/RQ2Ww6LIQ3CzvK463
	/Qo+dTvuu41/u4EPf7EUmixjkf1U7t4It7bQUFA3jiEGXrn7WH4KtZIq0uRtZIHGGYnyBHwMeGi
	4xTHpLR54i0PFSzU9WP30wjScpMRyjVtNuBdJ6Sg+xHlJZAfFGxMvRylkG/ReykVGh49G8oxuRV
	G/k9Kl3mmPy13tYSfNhOlMLJXdGV2axmWjv3bW+
X-Received: by 2002:a05:6870:ebc9:b0:404:590:59dc with SMTP id 586e51a60fabf-417b938f328mr3924319fac.33.1773519285922;
        Sat, 14 Mar 2026 13:14:45 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e5e8185sm11914165fac.12.2026.03.14.13.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 13:14:45 -0700 (PDT)
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
Subject: [PATCH net-next v2 03/14] tcp: refresh rcv_wnd snapshots at TCP write sites
Date: Sat, 14 Mar 2026 14:13:37 -0600
Message-ID: <20260314201348.1786972-4-atwellwea@gmail.com>
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

Refresh the live rwnd snapshot whenever TCP updates tp->rcv_wnd at the
normal write sites, including child setup, tcp_select_window(), and the
initial connect-time window selection.

This keeps the live sender-visible window paired with the scaling basis
that was actually advertised.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 net/ipv4/tcp_minisocks.c | 2 +-
 net/ipv4/tcp_output.c    | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/tcp_minisocks.c b/net/ipv4/tcp_minisocks.c
index d350d794a959..1c02c9cd13fe 100644
--- a/net/ipv4/tcp_minisocks.c
+++ b/net/ipv4/tcp_minisocks.c
@@ -603,7 +603,7 @@ struct sock *tcp_create_openreq_child(const struct sock *sk,
 	newtp->rx_opt.sack_ok = ireq->sack_ok;
 	newtp->window_clamp = req->rsk_window_clamp;
 	newtp->rcv_ssthresh = req->rsk_rcv_wnd;
-	newtp->rcv_wnd = req->rsk_rcv_wnd;
+	tcp_set_rcv_wnd(newtp, req->rsk_rcv_wnd);
 	newtp->rcv_mwnd_seq = newtp->rcv_wup + req->rsk_rcv_wnd;
 	newtp->rx_opt.wscale_ok = ireq->wscale_ok;
 	if (newtp->rx_opt.wscale_ok) {
diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 35c3b0ab5a0c..0b082726d7c4 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -291,7 +291,7 @@ static u16 tcp_select_window(struct sock *sk)
 	 */
 	if (unlikely(inet_csk(sk)->icsk_ack.pending & ICSK_ACK_NOMEM)) {
 		tp->pred_flags = 0;
-		tp->rcv_wnd = 0;
+		tcp_set_rcv_wnd(tp, 0);
 		tp->rcv_wup = tp->rcv_nxt;
 		tcp_update_max_rcv_wnd_seq(tp);
 		return 0;
@@ -315,7 +315,7 @@ static u16 tcp_select_window(struct sock *sk)
 		}
 	}
 
-	tp->rcv_wnd = new_win;
+	tcp_set_rcv_wnd(tp, new_win);
 	tp->rcv_wup = tp->rcv_nxt;
 	tcp_update_max_rcv_wnd_seq(tp);
 
@@ -4148,6 +4148,10 @@ static void tcp_connect_init(struct sock *sk)
 				  READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_window_scaling),
 				  &rcv_wscale,
 				  rcv_wnd);
+	/* tcp_select_initial_window() filled tp->rcv_wnd through its out-param,
+	 * so snapshot the scaling_ratio we will use for that initial rwnd.
+	 */
+	tcp_set_rcv_wnd(tp, tp->rcv_wnd);
 
 	tp->rx_opt.rcv_wscale = rcv_wscale;
 	tp->rcv_ssthresh = tp->rcv_wnd;
-- 
2.43.0

