Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098118;
	b=20WqiJBSwegmFOLlkiQq95P2j/o1OnJ0norS5T3VZsJYv6ejhu9dWEbhLREJAU2EE+3D
	 Y6tkOS/390qkkwFRHMkaRmcknXkO0m9/ntcKRS8gB+DQxWePd+afiaL+3dhmjKiZ9BtlQ
	 n8eCYwjslfAt5pcVu4Q+/szHKRbH3v4GWsg9e1bZEfuM+OgjtTQO9BOxCPK6/2d3Nn3bk
	 wnvFFNAxcp7yFa+6kyv8F91VtCWMn1vvG7xIZT6dR6e9FEL31p914N4uAExZhvdplta7S
	 IZTdpbqbh/QxOyTPA0E2XCWXtM8NxwCNf96FmneLHAaP6WPeChB4zHj4ftKNXxgz8NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098118;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Mt3Mq9SNW050+eWeZNF7XPUNXgUiqiP1/haRS99oyLQ=;
	b=ArH8BHwh7sUdhMdcWfIx+uxczdh6DSh3kosfp9Mh52HiYI6ZQcPFQUMpBc330luXJTlK
	 8dKJVGTFjhQdZ88f7e4yFVUYNq4Iq5h/FJy6U+N3OsrN3gJWddzW07U8zxRoe+jwjpX2p
	 CiavK7yaD+Or9e5V7Dqjfk3fC1g2PnmfSkuNe5VSpul9tPSIwaIdP+6Qxvll/bmJQuZLA
	 4KM21BdbeHPhXHnQXmjsrsHuX9fiMZtTpeuB1Rj5KpPPQ7KA8ylJViyelJYZ2od2AqszT
	 cPe6HQlkEmHV/l9/vicCWbglC4siWKsrpTJXl7XWousTIoUeMTfxWo5hCZq41zeTung==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=v67nMU0v;
	arc=none smtp.remote-ip=95.215.58.207
Received: from mta1.migadu.com (out-207.mta1.migadu.com [95.215.58.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD3B606A31F
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 10:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECD3B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=v67nMU0v
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BlCR7qyhz1RBwYmpMqZM4257yNl/7pbJi2t5We+ivQE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793098116; v=1; x=1793702916;
 b=v67nMU0vGQP/WQIZsCMYRI+TTnGwN0UcjXrjwbIg4xlVGVHgs08fduZdse0S7H6AvqLE2YSb
 hmU+y0GD5J70InBBqCMzvfe5N679LAU9ff6MxvtAsGIxhxDKy/KmYaF0KPOCES33Z1Aw6nNCgnZ
 Hxo+Wc9RtL8ohuR1V8cs0kH8=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 65688ab5fc1ffcf3;
	Tue, 27 Oct 2026 10:48:35 +0000
X-Mizu-Trace-ID: 65688ab5fc1ffcf3
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	stable@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Willem de Bruijn <willemb@google.com>,
	Maoyi Xie <maoyi.xie@ntu.edu.sg>,
	Daniel J Blueman <daniel@quora.org>,
	Jiri Wiesner <jwiesner@suse.de>,
	Gerd Rausch <gerd.rausch@oracle.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
	Wyatt Feng <bronzed_45_vested@icloud.com>,
	Yung Chih Su <yuuchihsu@gmail.com>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	Flavio Leitner <fbl@redhat.com>,
	Petr Mladek <pmladek@suse.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/5] ipv4: fix shift-out-of-bounds in ip_rt_send_redirect()
Date: Tue, 27 Oct 2026 18:45:30 +0800
Message-ID: <20261027104701.296240-3-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027104701.296240-1-jiayuan.chen@linux.dev>
References: <20261027104701.296240-1-jiayuan.chen@linux.dev>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ip_rt_redirect_number is the max number of ICMP Redirects we send to one
endpoint; once we hit it we stop. Before that, ip_rt_redirect_load gives
the redirects an exponential backoff:

	if (peer->n_redirects == 0 ||
	    time_after(jiffies,
		       (peer->rate_last +
			(ip_rt_redirect_load << peer->n_redirects)))) {

n_redirects grows until it reaches ip_rt_redirect_number, and both
redirect_number and redirect_load are plain proc_dointvec sysctls with
no upper bound. Set redirect_number past 32 and n_redirects climbs past
31, so "ip_rt_redirect_load << peer->n_redirects" shifts a 32-bit int by
>= 32 bits, which is UB:

  UBSAN: shift-out-of-bounds in net/ipv4/route.c:949:6
  shift exponent 32 is too large for 32-bit type 'int'
  CPU: 1 UID: 0 PID: 1845 Comm: ping Not tainted 7.3.0-rc7+ #364 PREEMPT
  Call Trace:
   <IRQ>
   dump_stack_lvl+0xc1/0xf0
   dump_stack+0x10/0x20
   __ubsan_handle_shift_out_of_bounds+0x1d1/0x390
   ip_rt_send_redirect.cold+0x2c/0x146
   ip_forward+0x1ddc/0x2430
   ip_rcv+0x2b1/0x320
   __netif_receive_skb_one_core+0x16b/0x1c0
   __netif_receive_skb+0x21/0x150
   process_backlog+0x37e/0x1200
   __napi_poll.constprop.0+0xa5/0x5e0
   net_rx_action+0x4c0/0xf70

Bounding redirect_number instead is not an option: 0 disables redirects
and -1 removes the cap. Compute the backoff in u64 with the shift count
capped at 31, which cannot overflow once ip_rt_redirect_load is
non-negative, and clamp the result to MAX_JIFFY_OFFSET: on 32-bit a
backoff of 2^31 or more is read by time_after() as already expired. This
keeps redirect_number as the limit on how many ICMP redirects are sent,
and the shift can no longer go out of bounds.

redirect_load on the other hand gets a lower bound of 0. A negative
backoff never meant anything, the old code only happened to treat it as
no backoff, and once converted to u64 it would turn into the maximum
backoff instead.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 net/ipv4/route.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 595a3b7f17830..f2c899f4cf8ca 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -907,6 +907,7 @@ void ip_rt_send_redirect(struct sk_buff *skb)
 	struct inet_peer *peer;
 	int log_martians;
 	struct net *net;
+	u64 backoff;
 	int vif;
 
 	rcu_read_lock();
@@ -945,10 +946,10 @@ void ip_rt_send_redirect(struct sk_buff *skb)
 	/* Check for load limit; set rate_last to the latest sent
 	 * redirect.
 	 */
+	backoff = (u64)ip_rt_redirect_load << min(peer->n_redirects, 31U);
+	backoff = min_t(u64, backoff, MAX_JIFFY_OFFSET);
 	if (peer->n_redirects == 0 ||
-	    time_after(jiffies,
-		       (peer->rate_last +
-			(ip_rt_redirect_load << peer->n_redirects)))) {
+	    time_after(jiffies, peer->rate_last + (unsigned long)backoff)) {
 		__be32 gw = rt_nexthop(rt, ip_hdr(skb)->daddr);
 
 		icmp_send(skb, ICMP_REDIRECT, ICMP_REDIR_HOST, gw);
@@ -3573,7 +3574,8 @@ static struct ctl_table ipv4_route_table[] = {
 		.data		= &ip_rt_redirect_load,
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
-		.proc_handler	= proc_dointvec,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
 	},
 	{
 		.procname	= "redirect_number",
-- 
2.43.0

