Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2A1421231
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541964; cv=none; b=f8U6N/lEC8+UtiUoyXANsMO6+V7H1PrbwsYlxfD+xLn3KI1dQJE4Bwi/o1Qvywmj+xHjF4PFu+wk2nIzb5B21ZE8sj4ZyTAgm0k30vjFhz1zQc9+/j7skxo60CbPyYGY+4tdmd2b1cCTO0+Nd7UIXfAmHdwA7Tu0PPLRrWlLLxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541964; c=relaxed/simple;
	bh=XDjJAS8AgcjW08ZuVEtzP6fjYRa8TGppc8r4LLbIgIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c3wIMosfIDouRtOhqMwu7xCSP1tMkmryeysDUIa8geWDFSNNaTyHWddNuEw4V2M5XDcmX7amhpmieq9BorAMNtBmXMEhkwq7tOwNf5H+ryQ3l8n0F1lVIMtQbIDXlXkPsvAGspOII62NWQAgUL01KzrBXsMu7R1fqOhpOybNSoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=rJyfhFuE; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="rJyfhFuE"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c8e2e39easo10541431cf.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 06:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1786541960; x=1787146760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpdMU/wEB50wNchXuEMT8+DVSA4jPR7scwO7A1aeM6o=;
        b=rJyfhFuEze9ZdG8S8LaZKLIx5pzLrSvax5m0MzaHDiAn15jfOrr1ZCUB3dAMrq/dcB
         prNZc0Xxf7p82nssOGupyeBNyT2Jw6UVj0IBjpXHttEJ+46nbH6Xpiy3jIjoEfgoKw++
         mku8CejRot9ddZ9lgcg6L3wcOO5ix+fJX814CJM1cvc+UagUOtOUzeIFkeSUqlbKnIed
         iKQbKfjdZPgEHz9MDnOtnzMHpFqfYmt6GfzcRqvxZiiusvDE4cTXYBRorHlMELjTa7wV
         /KRbP/gOCty9ggidDYVHDNpS4HMnRkMkqhzBh7vpGke5xARYWCwdezcBlBHDiaGE5TNn
         Og7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541960; x=1787146760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xpdMU/wEB50wNchXuEMT8+DVSA4jPR7scwO7A1aeM6o=;
        b=BR9oCbr/A7KuIGN2dMyOehJ2lFW3a7yBfvvx3FSDVUtImAeXwckhnbWnSaJFDeJsxz
         k5rwXdLW9irVSzBR67ENLazXqLkR9of8W/dl3LqGnpzJbeeF5sd2inU6MFoS3ztxzzFL
         F1t9WWd1H052TuvlrefHWId1hfhdOLO0AxorQAoLM5zqCfRePNHnmyJbbvCUDZDvPnkV
         ZKhX7ZlmLvm+rLTx4CJ2pKeurKloEjDm5dWC/U6aZEaX8jd4eqS2wWTJT2aISMWL5d4p
         3/JLUPL/hITpaFKFpP7XWgn9EXKTeGjyzsCnqlDMQ8KW4FNDi2olwmC/LjJ8tN2uuAIa
         ukSA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9u9i63Rj+iHD1lDyOywXJ8oB9tRRD95qaRJI53HknzyfHVlU5gvXabZUwTzbsLdimOn2mQoE27pM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYUIL9hPKlbHGEvYEfyfrdyDJxEopoiycnii/v647s4T/sE6zo
	r8b9O9j2XLLdlDxALKB7fPtRV1Jfi9J7wcksX9hxc1Dru02L1wrIltjEsWK4Nqg1HIOv
X-Gm-Gg: AR+sD10Q+dHE7/Rn6LcHCrdBZM44RA4tSURYAd/xpg1MNUqrE6SMyW7RkO95HA1VSYR
	Zw5qoYbb4DnCmsS8LWRTx48FJOiRjGufNRZasY6rOxHuhmgf/xUTSPH7GkwNCV98xRq3Ux6IL/4
	6lo1r+USlIOFLN5Q6T7YBZb8gCKRzg7SwZ3tO0YviX1zn3e82ECTm5je/MA3ke3F+JbTGNTTr8m
	6k1SBChR8y/cF4tuGa/x88FQ0/BCsFo8eCWRsJ18sPOE3S3OGGrobLcZeIG6I6yeD/+1jCt2udx
	jDGXpSShpcN6AEdESbnvIkQVv83Ag1DdqZEKgEWsWPxhn5KJBmUsmLqCGKTsIhWnIjE/+cu5CXb
	NZjtT4fbaHsyRBUpCfdJkYf4mgO0wnrn3OwMxlPVBFb/BFn2IZLB7t7APyrSdtRYdRgxr9xkITM
	L8Vhr4ED86XdZy/bUsgx+Dzq/s50OBgF8Cq1gWzd4YFu8wzxNlkdLm3fR9qt2RYawXuCQT/5gup
	c+t
X-Received: by 2002:a05:622a:4203:b0:517:a7ff:935f with SMTP id d75a77b69052e-52d646af7c4mr42649011cf.9.1786541960345;
        Wed, 12 Aug 2026 06:39:20 -0700 (PDT)
Received: from Roxy.localdomain ([203.175.14.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a6c3c0338sm21350226d6.40.2026.08.12.06.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:39:19 -0700 (PDT)
From: Zhiling Zou <zhilinz@nebusec.ai>
To: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	ncardwell@google.com,
	kuniyu@google.com,
	chia-yu.chang@nokia-bell-labs.com,
	ij@kernel.org,
	fmancera@suse.de,
	bronzed_45_vested@icloud.com,
	idosch@nvidia.com,
	yuuchihsu@gmail.com,
	vega@nebusec.ai,
	zhilinz@nebusec.ai
Subject: [PATCH net v5 1/1] tcp: bound SYN-ACK timers to reqsk timeout range
Date: Wed, 12 Aug 2026 21:38:53 +0800
Message-ID: <9ec8921d81d6218946e07e8542b1ac41b6e2d205.1786540242.git.zhilinz@nebusec.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786540242.git.zhilinz@nebusec.ai>
References: <cover.1786540242.git.zhilinz@nebusec.ai>
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

Limit tcp_synack_retries and the TCP_DEFER_ACCEPT conversion to the
range represented by num_timeout, preserving the same defer-accept value
for its timer and bare-ACK consumers. Saturate RTO calculation before
the shift, and cap the Fast Open extra retry to the same range.

Fixes: e6c022a4fa2d ("tcp: better retrans tracking for defer-accept")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Signed-off-by: Zhiling Zou <zhilinz@nebusec.ai>
---
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

 Documentation/networking/ip-sysctl.rst |  2 +-
 include/net/tcp.h                      | 20 ++++++++++++++++----
 net/ipv4/sysctl_net_ipv4.c             |  2 ++
 net/ipv4/tcp.c                         |  2 +-
 net/ipv4/tcp_timer.c                   |  6 ++++--
 5 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 208f46967ee59..fd5038b6cab9f 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -954,7 +954,7 @@ tcp_stdurg - BOOLEAN
 
 tcp_synack_retries - INTEGER
 	Number of times SYNACKs for a passive TCP connection attempt will
-	be retransmitted. Should not be higher than 255. Default value
+	be retransmitted. Should not be higher than 127. Default value
 	is 5, which corresponds to 31seconds till the last retransmission
 	with the current initial RTO of 1second. With this the final timeout
 	for a passive TCP connection will happen after 63seconds.
diff --git a/include/net/tcp.h b/include/net/tcp.h
index 2c5b889530b55..8ab2fd368ed3b 100644
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
@@ -882,12 +884,22 @@ static inline u32 __tcp_set_rto(const struct tcp_sock *tp)
 	return usecs_to_jiffies((tp->srtt_us >> 3) + tp->rttvar_us);
 }
 
-static inline unsigned long tcp_reqsk_timeout(struct request_sock *req)
+static inline unsigned long tcp_reqsk_timeout_sk(const struct sock *sk,
+						 struct request_sock *req)
 {
-	u64 timeout = (u64)req->timeout << req->num_timeout;
+	u32 rto_max = tcp_rto_max(sk);
+	u64 timeout = req->timeout;
+
+	if (req->num_timeout >= BITS_PER_TYPE(timeout) ||
+	    timeout > U64_MAX >> req->num_timeout)
+		return rto_max;
+
+	return (unsigned long)min_t(u64, timeout << req->num_timeout, rto_max);
+}
 
-	return (unsigned long)min_t(u64, timeout,
-				    tcp_rto_max(req->rsk_listener));
+static inline unsigned long tcp_reqsk_timeout(struct request_sock *req)
+{
+	return tcp_reqsk_timeout_sk(req->rsk_listener, req);
 }
 
 u32 tcp_delack_max(const struct sock *sk);
diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
index ca1180dba1dea..fc5152dfa3c86 100644
--- a/net/ipv4/sysctl_net_ipv4.c
+++ b/net/ipv4/sysctl_net_ipv4.c
@@ -35,6 +35,7 @@ static int ip_ttl_min = 1;
 static int ip_ttl_max = 255;
 static int tcp_syn_retries_min = 1;
 static int tcp_syn_retries_max = MAX_TCP_SYNCNT;
+static int tcp_synack_retries_max = MAX_TCP_SYNACK_RETRIES;
 static int tcp_syn_linear_timeouts_max = MAX_TCP_SYNCNT;
 static unsigned long ip_ping_group_range_min[] = { 0, 0 };
 static unsigned long ip_ping_group_range_max[] = { GID_T_MAX, GID_T_MAX };
@@ -1034,6 +1035,7 @@ static struct ctl_table ipv4_net_table[] = {
 		.maxlen		= sizeof(u8),
 		.mode		= 0644,
 		.proc_handler	= proc_dou8vec_minmax,
+		.extra2		= &tcp_synack_retries_max,
 	},
 #ifdef CONFIG_SYN_COOKIES
 	{
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 455441f1b6949..24896fa08a5d8 100644
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
index bf171b5e1eb30..daa4eac072dd9 100644
--- a/net/ipv4/tcp_timer.c
+++ b/net/ipv4/tcp_timer.c
@@ -462,11 +462,13 @@ static void tcp_fastopen_synack_timer(struct sock *sk, struct request_sock *req)
 
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
@@ -488,7 +490,7 @@ static void tcp_fastopen_synack_timer(struct sock *sk, struct request_sock *req)
 	if (!tp->retrans_stamp)
 		tp->retrans_stamp = tcp_time_stamp_ts(tp);
 	tcp_reset_xmit_timer(sk, ICSK_TIME_RETRANS,
-			  req->timeout << req->num_timeout, false);
+			     tcp_reqsk_timeout_sk(sk, req), false);
 }
 
 static bool tcp_rtx_probe0_timed_out(const struct sock *sk,
-- 
2.43.0

