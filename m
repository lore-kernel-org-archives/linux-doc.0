Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5948D388E6F
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 20:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773519298; cv=none; b=DGPsX9cxl1Wy1adMDUHUwrTAav+8OYSRY3W23zSiIwELkhaiSbrBV47ruRK+s+Tf0F+ZpohuzNRWDtFFh4K73W5wDSs2Pu3O21i2AzydSJCHxwvhdcdaBSjSBBGgUpAB5h+ID095hkSi/aMjM9A5C27tTxynVDxTFurii8wjoxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773519298; c=relaxed/simple;
	bh=dcj1s6Dgcrw3Y7tNOEUlJFcSNNEIPs4iabts40+JwIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htLw03m2OIKjPDTYlAqflLb3lsBdZbKzUr+eCk2cdQxBz80x70d9E1kPlRo0FvkSsoajJS6Qi/Ez5oNpEEMxDUoKQ/v7XlLJpz13WzMaQnMiWersJrypRA7lFDeKWT8UtH5wtYS+Inr54LaIYcHyIKoK73Zf1Kt7ThtlWhZmJi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFW7KEXb; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFW7KEXb"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40ee9b945d5so2138470fac.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 13:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773519295; x=1774124095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpvhfo9p2XSrc/tbQHeJ0/cabcWcjahm5y6siccjbzs=;
        b=mFW7KEXbx2xHzOcHzEC4+WerjZYDr6T5uY/8RXTxpLRLV9ogJJQlGWMN7baacQtjD8
         0w6nsnlYIhN/otPV6vVvu3g8yy/JiJI5mnP77ZdS4pQ8DJymo/PXbkmVocG9uNYovlLz
         4/5Ocjf42HImX3dEKcpcff1fprnlrROEXn3BA8jyNwI6LVH6z61MUT2DXpwnDo+NBHsn
         nfF8O5euOI/3LCSqq7X6hHeSQb2r1QurUdXyaxbvzNuljzDXVgWg9qd3mAn9NdJQGQsA
         VlLzjLF2EcJ5MOmMhrQ38lHjicLFQO9IiTLg2g4acWNXyaaQvZoGTL8TdOdq/eArIkf8
         QIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773519295; x=1774124095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xpvhfo9p2XSrc/tbQHeJ0/cabcWcjahm5y6siccjbzs=;
        b=Fh90vWx7SveDBWzEY0/J5p/riwXSf8EoEARf3XiUI7XWvxaZ7A1oTpLY4AzwQ8rc+B
         tHfwsAcQJUtpMYi/KWfjfG8QGSMPTkhoqle4Zjc4wDVB6sNDoe2xgyaugyOyZgBzXQ/I
         /HAdqE8a99DLlJtBTOA8yRdLO/Gg5fH3pq61oaEFgkykRk3LISeTbQkChlxmqupLok0O
         TTPKnIV9wG3NPsh8q6tPPSlLBHhC2elTB1ek6BMrg77e0Rfb13GcsUD27hTVw/iRfVI1
         b2k+mIPViZwh2CKVmADW8sY7QwPSvj40TANNsCAWnebyGb0gvNHRD+H2n0lZomE7G6PW
         m4dw==
X-Forwarded-Encrypted: i=1; AJvYcCW8QupucTY1fo0iQ8PhAqrweigkXAIESVifENQy0ujknrG1JPct6rG2ti/oakePDqD5O0hNvN1LmDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzytAKHm2JLMOmDnSRk7sXE7XWphqCYCbcn0ftGNL+eEpuDIFYl
	W9CvxbvcCymmbz3EBcwsJtwU2y6R68/9WcUUblNhIvIig2q293wi1WXq
X-Gm-Gg: ATEYQzxpN4wFCc1hD8REjQ7VjAN86UA3fvPzJaQ8HnxdLcXTgnVoSSitcebpyyG8LLS
	+lB6XHKIwCZiWBp+asjtiGV57Z9b8ogDhLRSMwSsTNBgCkQcqidTWO1m74gih8t2KHYS146wYhg
	WoytQfnX2m1oN6+2zYHVCgjYuWNKKIw6Qv18XLPrdiu5pqwgfwUyO1T8+J4RqLmvlZdhlqXe91f
	oIgSz/vkLVvr2NR2pisSwjn6YCLnQN7KUGr86T9FA0zVfz+6pgrVkeGU+iEG2pXGmV5PYBs9gyf
	CSUeMyeCQoHlczCE9aXXjznldtIyOe56JNSv7RBTFoaBGWKHTMP0JWcaTYZPWZmQ84hbTQg1Twe
	TyleflWu4hqskC855cih8QjTIMoTeb8bk8fSgWsVClLbCsUAPOW3saIeo/BxtK55ADVyIbHPL5E
	HHNwWT5a6cDJEz+ILXoF78CjQRMB0aYrrcCfrWSY5CNSC7C8OzeI9AMGYB2cghT+lb4QjQW4w/m
	4a91C2yu/cedfVAhlreckZyPrJtQBzhB0ci5iMZ
X-Received: by 2002:a05:6870:a796:b0:3e8:8b6f:9d85 with SMTP id 586e51a60fabf-417b937d46cmr4417226fac.29.1773519295129;
        Sat, 14 Mar 2026 13:14:55 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e5e8185sm11914165fac.12.2026.03.14.13.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 13:14:54 -0700 (PDT)
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
Subject: [PATCH net-next v2 09/14] mptcp: refresh TCP receive-window snapshots on subflows
Date: Sat, 14 Mar 2026 14:13:43 -0600
Message-ID: <20260314201348.1786972-10-atwellwea@gmail.com>
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

When MPTCP resynchronizes the per-subflow TCP shadow window from the
mptcp-level receive state, refresh the live rwnd snapshot and the
remembered maximum-window snapshot along with it.

That keeps subflow TCP bookkeeping aligned with the sender-visible
window state tracked in the core TCP patches.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 net/mptcp/options.c  | 14 +++++++++-----
 net/mptcp/protocol.h | 14 +++++++++++---
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/net/mptcp/options.c b/net/mptcp/options.c
index 8a1c5698983c..64cd637484a4 100644
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
 	tcp_update_max_rcv_wnd_seq(tp);
 	subflow->rcv_wnd_sent = mptcp_rcv_wnd;
 }
@@ -1335,12 +1338,13 @@ static void mptcp_set_rwin(struct tcp_sock *tp, struct tcphdr *th)
 	if (rcv_wnd_new != rcv_wnd_old) {
 raise_win:
 		/* The msk-level rcv wnd is after the tcp level one,
-		 * sync the latter.
+		 * sync the latter and refresh its advertise-time scaling
+		 * snapshot.
 		 */
 		rcv_wnd_new = rcv_wnd_old;
 		win = rcv_wnd_old - ack_seq;
-		new_win = min_t(u64, win, U32_MAX);
-		tp->rcv_wnd = new_win;
+		tcp_set_rcv_wnd(tp, min_t(u64, win, U32_MAX));
+		new_win = tp->rcv_wnd;
 		tcp_update_max_rcv_wnd_seq(tp);
 
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
2.43.0

