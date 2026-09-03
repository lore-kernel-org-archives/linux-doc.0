Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AC03E172D
	for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2026 06:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788416322; cv=none; b=CwnN7MzrRxXrnXuhNhXZPyTbZ1v99PvCTWdIAL7aHDNHehykzk/xIEN6W8K5YAs2gXYBviFkypReB2hzZHJvlk4eZN+M7YIkQJP/DOtybOD78wzZBaELFx9NNE/UrN9BLhgMBo9CHIGP9yJ3tbHtBenRUuftlDdzUUqFQ3IU808=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788416322; c=relaxed/simple;
	bh=RS9gOojwOn7DjGKbX9ybTXFn1zHYsYfn65XAQRbBejs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BRvOyBdD+evYBb5ZCpAnxAqdMf8/UqJSGnj1ctwFv+8SMqW615Zcl4jcoV/3OVhdIbs15R9MW7nIQFgTwvp4yl7YPRm8zxCxxDXwxBFFxjEpERsDR/x3cfh94FqChIty5rK8nIfaRRieJwDxMHSd8Zn367t+0K1zRgQkEMbHwX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=hJixE72+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="hJixE72+"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d6e954afbdso12522745ad.2
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2026 23:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788416321; x=1789021121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0mSTBNClPRztZMxjaepTxpIBekuY3D+n3PavvIfUGCM=;
        b=hJixE72+2hbb2uJytxUxlEG7o0n0vVYRflp6TC0rV5ccv9nelOJpgVyB7Ld9EoXGhu
         itK3N1u7+f3fmp+VnZ1xbAllIz7NvmZp/YeklFRnpMEQXVg6/XeXiRXJPGoLkcKdO1eX
         8wiJnOW8k6ZzLEBsrq/G8n0rmJbKyT5clinveZf6+s2SJdZnzbKBU//awW/NHgqrvLoL
         WnOPTPJhhp0+HCImpzyXlZPS7DjEVZmdoz+o5sHrAJOYyKtMARqNnIPa3CZB+GlQUR0b
         7QPTNpzeIxo4kCA5IcaQS/cf6jCwO/agAmotCYEmEaFT7MVIk5hSpjAl8+gdB1t89P8z
         VeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788416321; x=1789021121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0mSTBNClPRztZMxjaepTxpIBekuY3D+n3PavvIfUGCM=;
        b=ej/R+THauUd8olgOJ7/54EEnP7O/sEYT0yCjZi0sApMeHLG+6+2PRp7djXkJJAub1N
         YkIFArVGbEVQcqVdbxELQU55fHSWYf3Ns1WTC1MEULYd0SDAAwPUDPMqFgbv7EoOwF/t
         hylHI+a5R4VmmqXoKFWfJp7RQBa++yzHyEFP7gUEb7E+4XSsiDSb9QetaI7J66VGFPMC
         cZdN67mrliYeMUGnhYlfIjnJ4ZJ+IJYk6nwEG1SIfwkITkWznWq+yHLRUHwJbj+jqKAE
         SxkIznhcsRsmh8sN2coe97pTFsCeLh8s6waGZOqnwLa4TiIshLOxl+aFjPJU6LOrt5Zf
         x3bA==
X-Forwarded-Encrypted: i=1; AKwUvBxR4xDVbSl3/8LnPPrukGr9wma6rNRPnI+WI6kMwyw8tKUKMvKe+howTAzj7iN1/kmxJAycT2Pj5No=@vger.kernel.org
X-Gm-Message-State: AFuF++nsM68mycjPS21qSHVx5c4yqys8zzzccBhUA1p1mBrRHKm73VVT
	aiBh/RbvO1Sr2DQNjLvkP+SAeUuBWgNfKa6JMP0JZyZCI0QYsIB+uMebOkZzuPiAZQKE
X-Gm-Gg: AYBFou16TTbz2AVZDe+RBMmfbsd6B5AcM97+e3lQnG/rwWhxISSbBwvuTzmRmV+5oEv
	mHkvXGDrekNNZWQRViypkWpWJYnEk2IrZ0Ysbt/DvM1GDrmfan1ODBzXprrgySGaDpru8k4pmxR
	oCIbhZ3KPt8Eam5DxztusvkeNeEUcxXX9b/lG2kwL3aZR839ljsvZ7FiMcxBY4Rs6WgGSvlNMW0
	7xmll5uVZREwMdUjbysL6pEkIvfl2vov1//Yv3SmXORd7dQmPG+uxi/2i8nmn+uD4L+jGyjrQhS
	ZY2XV/BfwObV6Io526GvLkQ+k3PMNY186yxCKU6OE6WrNxeTGDvFWD78UmulyZ3PZMY8/HFBBrI
	uoBvSaFceWbiwj+Um0Grlic4+Ym6xfCoxXQ0eY9lEuqakpj3izWJ058nxsm939Ic8rb7r3q4FuO
	qKECNxt2ehmr39Wfb0/QIIrC8pJknHDy2POrkE7RtnDkMQGCpHIIyumaeHf/sUAvA3iphTIJNzr
	wHl
X-Received: by 2002:a17:902:ef0a:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2daec636360mr139857905ad.6.1788416320545;
        Wed, 02 Sep 2026 23:18:40 -0700 (PDT)
Received: from Roxy.localdomain ([203.175.14.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db090c391csm391775ad.9.2026.09.02.23.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 23:18:38 -0700 (PDT)
From: Zhiling Zou <zhilinz@nebusec.ai>
To: pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	ncardwell@google.com,
	kuniyu@google.com,
	vega@nebusec.ai,
	zhilinz@nebusec.ai
Subject: [PATCH net v7 1/1] tcp: bound SYN-ACK timers to reqsk timeout range
Date: Thu,  3 Sep 2026 14:18:14 +0800
Message-ID: <1bf5d64b8ffe1dc1b1f23d5b5ea6cb4ad3b2f562.1788176024.git.zhilinz@nebusec.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788176024.git.zhilinz@nebusec.ai>
References: <cover.1788176024.git.zhilinz@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

request_sock::num_timeout is a 7-bit counter. Commit e6c022a4fa2d
("tcp: better retrans tracking for defer-accept") split this counter
out of an 8-bit field, but tcp_synack_retries still accepts an 8-bit
value and TCP_DEFER_ACCEPT can still derive a retry count up to 255.

If these settings exceed 127, the regular request timer cannot reach
its expiration threshold and num_timeout wraps to zero. After the wrap,
the request can keep timing out instead of expiring, and the next
zero-to-one transition repeats the young-queue accounting decrement.

Both request timer paths can also shift req->timeout by 64 or more while
calculating the next RTO. UBSAN reports that invalid shift, and systems
with panic_on_warn=1 panic before the later cap can take effect.

Keep the tcp_synack_retries sysctl range unchanged, but cap its effective
value in both SYN-ACK timer paths before the young-queue pruning loop.
Cap the TCP_DEFER_ACCEPT conversion at the same range so its timer and
bare-ACK consumers agree. Saturate the RTO calculation before shifting,
and cap the Fast Open extra retry as well.

Snapshot the request timeout and num_timeout once before the bounds check
and shift. num_timeout is a bitfield, so add a raw view of its existing
storage byte for a compile-safe READ_ONCE() snapshot. This keeps the check
and shift consistent when the timer concurrently increments num_timeout.

Document that the sysctl still accepts 0-255 and that the timers silently
cap the effective retry count at 127.

Fixes: e6c022a4fa2d ("tcp: better retrans tracking for defer-accept")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Signed-off-by: Zhiling Zou <zhilinz@nebusec.ai>
---
changes in v7:
- Clamp max_syn_ack_retries when it is read, before the young-queue
  pruning loop, so queue pressure still shortens old request lifetimes.
- Keep the tcp_synack_retries sysctl range at 0-255. Document that the
  timers silently cap the effective retry count at 127 instead of adding
  a sysctl .extra2.
- Sashiko on v6: the young-queue clamp placement is fixed. Adding
  .extra2 was a false positive given the v4/v6 userspace-range decision;
  the docs/sysctl wording mismatch is addressed in the documentation.
- v6 Link: https://lore.kernel.org/all/ba3cd75e76ef82b0ff5b393ff9e54056c00e90eb.1787382800.git.zhilinz@nebusec.ai/

changes in v6:
- Keep the tcp_synack_retries sysctl range unchanged and cap the effective
  retry count only in the regular and Fast Open timer paths.
- Snapshot num_timeout and timeout once before the bounds check and shift.
- Use a raw view of num_timeout's bitfield storage for the compile-safe
  READ_ONCE() snapshot.
- v5 Link: https://lore.kernel.org/all/9ec8921d81d6218946e07e8542b1ac41b6e2d205.1786540242.git.zhilinz@nebusec.ai/

changes in v5:
- Limit tcp_synack_retries and TCP_DEFER_ACCEPT at their configuration
  paths, so all users of each value see the same 7-bit range.
- Use 127, matching request_sock::num_timeout, instead of the previous
  runtime limit of 63, and document the sysctl limit.
- Spell out the 7-bit range mismatch, the repeated young-queue accounting,
  and the UBSAN panic_on_warn failure mode in the commit message.
- Keep the timeout calculation saturating before either SYN-ACK timer
  shifts it.
- Drop a no-op reqsk_timer_handler() formatting hunk.
- Correct the Fixes tag and update the reporter and sign-off trailers.
- v4 Link: https://lore.kernel.org/all/891a220c362e3266efdf6b1aa9dc3e52f6825c00.1784735392.git.zhilinz@nebusec.ai/

Changes in v4:
  - Drop the tcp_synack_retries sysctl maximum to preserve existing
    user-space behavior, and keep the runtime clamps at the timer usage
    sites.
  - v3 Link: https://lore.kernel.org/all/20260702095324.2995243-1-n05ec@lzu.edu.cn/

Changes in v3:
  - Order local variables in tcp_reqsk_timeout_sk() by reverse Christmas
    tree.
  - v2 Link: https://lore.kernel.org/all/20260630035009.55201-1-n05ec@lzu.edu.cn/

Changes in v2:
  - Keep the existing max_retries calculation in
    tcp_fastopen_synack_timer() and only add the clamp, avoiding code
    churn.
  - v1 Link: https://lore.kernel.org/all/02e24eb83639e9d7ecc623f000c60254bb5c40a5.1782643946.git.roxy520tt@gmail.com/

 Documentation/networking/ip-sysctl.rst |  4 +++-
 include/net/request_sock.h             | 20 ++++++++++++++++++--
 include/net/tcp.h                      | 21 +++++++++++++++++----
 net/ipv4/inet_connection_sock.c        |  2 ++
 net/ipv4/tcp.c                         |  2 +-
 net/ipv4/tcp_timer.c                   |  6 ++++--
 6 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 208f46967ee59..4a2ed964dceab 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -954,7 +954,9 @@ tcp_stdurg - BOOLEAN
 
 tcp_synack_retries - INTEGER
 	Number of times SYNACKs for a passive TCP connection attempt will
-	be retransmitted. Should not be higher than 255. Default value
+	be retransmitted. The sysctl accepts 0-255. Values above 127 are
+	silently capped by the SYN-ACK timers, matching the 7-bit
+	request_sock::num_timeout field. Default value
 	is 5, which corresponds to 31seconds till the last retransmission
 	with the current initial RTO of 1second. With this the final timeout
 	for a passive TCP connection will happen after 63seconds.
diff --git a/include/net/request_sock.h b/include/net/request_sock.h
index 5a9c826a7092d..a9781fab774aa 100644
--- a/include/net/request_sock.h
+++ b/include/net/request_sock.h
@@ -58,12 +58,17 @@ struct request_sock {
 	struct request_sock		*dl_next;
 	u16				mss;
 	u8				num_retrans; /* number of retransmits */
-	u8				syncookie:1; /* True if
+	union {
+		struct {
+			u8		syncookie:1; /* True if
 						      * 1) tcpopts needs to be encoded in
 						      *    TS of SYN+ACK
 						      * 2) ACK is validated by BPF kfunc.
 						      */
-	u8				num_timeout:7; /* number of timeouts */
+			u8		num_timeout:7; /* number of timeouts */
+		};
+		u8		num_timeout_syncookie;
+	};
 	u32				ts_recent;
 	struct timer_list		rsk_timer;
 	const struct request_sock_ops	*rsk_ops;
@@ -74,6 +79,17 @@ struct request_sock {
 	u32				timeout;
 };
 
+static inline u8 reqsk_num_timeout(const struct request_sock *req)
+{
+	u8 num_timeout = READ_ONCE(req->num_timeout_syncookie);
+
+#if defined(__LITTLE_ENDIAN_BITFIELD)
+	return num_timeout >> 1;
+#else
+	return num_timeout & 0x7f;
+#endif
+}
+
 static inline struct request_sock *inet_reqsk(const struct sock *sk)
 {
 	return (struct request_sock *)sk;
diff --git a/include/net/tcp.h b/include/net/tcp.h
index 436495ff2271d..a1c20352a8664 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -183,6 +183,8 @@ static_assert((1 << ATO_BITS) > TCP_DELACK_MAX);
 #define MAX_TCP_KEEPINTVL	32767
 #define MAX_TCP_KEEPCNT		127
 #define MAX_TCP_SYNCNT		127
+/* request_sock::num_timeout is a 7-bit field. */
+#define MAX_TCP_SYNACK_RETRIES	127
 
 /* Ensure that TCP PAWS checks are relaxed after ~2147 seconds
  * to avoid overflows. This assumes a clock smaller than 1 Mhz.
@@ -881,12 +883,23 @@ static inline u32 __tcp_set_rto(const struct tcp_sock *tp)
 	return usecs_to_jiffies((tp->srtt_us >> 3) + tp->rttvar_us);
 }
 
-static inline unsigned long tcp_reqsk_timeout(struct request_sock *req)
+static inline unsigned long tcp_reqsk_timeout_sk(const struct sock *sk,
+						 struct request_sock *req)
 {
-	u64 timeout = (u64)req->timeout << req->num_timeout;
+	u64 timeout = READ_ONCE(req->timeout);
+	u32 rto_max = tcp_rto_max(sk);
+	u8 num_timeout = reqsk_num_timeout(req);
+
+	if (num_timeout >= BITS_PER_TYPE(timeout) ||
+	    timeout > U64_MAX >> num_timeout)
+		return rto_max;
+
+	return (unsigned long)min_t(u64, timeout << num_timeout, rto_max);
+}
 
-	return (unsigned long)min_t(u64, timeout,
-				    tcp_rto_max(req->rsk_listener));
+static inline unsigned long tcp_reqsk_timeout(struct request_sock *req)
+{
+	return tcp_reqsk_timeout_sk(req->rsk_listener, req);
 }
 
 u32 tcp_delack_max(const struct sock *sk);
diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index 6257459bcee24..21f96a50c10fe 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -1068,6 +1068,8 @@ static void reqsk_timer_handler(struct timer_list *t)
 	net = sock_net(sk_listener);
 	max_syn_ack_retries = READ_ONCE(icsk->icsk_syn_retries) ? :
 		READ_ONCE(net->ipv4.sysctl_tcp_synack_retries);
+	max_syn_ack_retries = min_t(int, max_syn_ack_retries,
+				    MAX_TCP_SYNACK_RETRIES);
 	/* Normally all the openreqs are young and become mature
 	 * (i.e. converted to established socket) for first timeout.
 	 * If synack was not acknowledged for 1 second, it means
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 1c867a3024446..e551e6adc8005 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -357,7 +357,7 @@ static u8 secs_to_retrans(int seconds, int timeout, int rto_max)
 		int period = timeout;
 
 		res = 1;
-		while (seconds > period && res < 255) {
+		while (seconds > period && res < MAX_TCP_SYNACK_RETRIES) {
 			res++;
 			timeout <<= 1;
 			if (timeout > rto_max)
diff --git a/net/ipv4/tcp_timer.c b/net/ipv4/tcp_timer.c
index e56eae4bc341e..2d2dec1e91565 100644
--- a/net/ipv4/tcp_timer.c
+++ b/net/ipv4/tcp_timer.c
@@ -464,11 +464,13 @@ static void tcp_fastopen_synack_timer(struct sock *sk, struct request_sock *req)
 
 	tcp_syn_ack_timeout(req);
 
-	/* Add one more retry for fastopen.
+	/* Add one more retry for fastopen when the timeout counter can
+	 * represent it.
 	 * Paired with WRITE_ONCE() in tcp_sock_set_syncnt()
 	 */
 	max_retries = READ_ONCE(icsk->icsk_syn_retries) ? :
 		READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_synack_retries) + 1;
+	max_retries = min_t(int, max_retries, MAX_TCP_SYNACK_RETRIES);
 
 	if (req->num_timeout >= max_retries) {
 		tcp_write_err(sk);
@@ -490,7 +492,7 @@ static void tcp_fastopen_synack_timer(struct sock *sk, struct request_sock *req)
 	if (!tp->retrans_stamp)
 		tp->retrans_stamp = tcp_time_stamp_ts(tp);
 	tcp_reset_xmit_timer(sk, ICSK_TIME_RETRANS,
-			  req->timeout << req->num_timeout, false);
+			     tcp_reqsk_timeout_sk(sk, req), false);
 }
 
 static bool tcp_rtx_probe0_timed_out(const struct sock *sk,
-- 
2.43.0

