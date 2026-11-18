Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013011;
	b=QudJKqJNVhBx+XwnZYFUTc+E5FtmcPX4G5q/J2DZiDdsfv8W23qzqJRBdGxoh8psfW9i
	 dA3zGulaYrtzHyqaEqs35c9lYF+TF4fJb0VJb2NQ7AnPU/awg7auVSld/6YEapTh0Lbvl
	 eEXIFdIADgKhwM1GgvA+eg1UlpX9THUt3KtB+5JI4eB5VSLq7Kl+f0bgTv4GP+tJFfaCY
	 AyeTH+tK0GrpXvB1K4R8BVCxBpI4EzC/AXFxjUtTjBAhJw8zCbFv8+i0ind4dRa8DGG/X
	 Da1iILhQowlzo1CZ5B6FAl4hkE+xOh9UUlmnCTAs/vxxEhcywiYRNuJRmGVExStJy6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013011;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nQI31A8nM1HFXrWHagb8jBMaXz6oHhOttNUJXUBc14I=;
	b=RdL+9ioXjgLub6psTI9BZr1RQLj4SOGR6CkoPSF3hvjj4qhAGbd3aY7UzTF+3u/4YD+q
	 6sWpI2uFG4xrVanvZbYqWDM3aGjl1Hag+waK27xGbVPQhfPIRiuAyurNnf9BqpNuMNYnN
	 mpws+jEwTKT4l0ysvAApyvIBg+GJ6ul0+54k/Rf/4qJVMsjDM7qfjP3NSaxFn4Azgu/O2
	 ydGc/fkaWlpF5A9ljmai8O64joivR3r5xNSg57PFQooX/Q7ZqqUZY0j9D0oz1I8bF5fTQ
	 I/syPhX1x/0KnMAEdEO0EVTrpd+RlrtzUYihOXGENrGLnzG/5oVePy1tTBLhtHInKhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GdqpYixL;
	arc=none smtp.remote-ip=91.218.175.160
Received: from mta0.migadu.com (out-160.mta0.migadu.com [91.218.175.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F2606A32C
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 14:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A39F2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GdqpYixL
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AppivPbRx09iLKxx7zqp6xlSPgYNyfP4WN/ejwBB+TY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795013008; v=1; x=1795617808;
 b=GdqpYixLK04rGvDIEpCcezWIcHXU3SMQs31qVddNTfQp+dpXq+gLTdkPJ0+1SoRhHPLjE6U2
 vwGTAyamXhW6BQTKONX/64YmNVODcGx4hA7afq0awKVodT7wCuwEPASK9FgtIQy10cjxtQkB+U8
 fJFdyGsdPn8AqAvTqls88lnY=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1d825a135c3023ab;
	Wed, 18 Nov 2026 14:43:28 +0000
X-Mizu-Trace-ID: 1d825a135c3023ab
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Kyuwon Cho <kyuwoncho18@gmail.com>,
	Eric Dumazet <edumazet@kernel.org>,
	stable@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 2/2] tcp: fix shift-out-of-bounds in inet_csk_rto_backoff()
Date: Wed, 18 Nov 2026 22:42:38 +0800
Message-ID: <20261118144249.358481-2-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118144249.358481-1-jiayuan.chen@linux.dev>
References: <20261118144249.358481-1-jiayuan.chen@linux.dev>
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

icsk_backoff is used as a shift amount in inet_csk_rto_backoff():

	u64 when = (u64)icsk->icsk_rto << icsk->icsk_backoff;

It can go past 63 on the paths of both callers:

 - RTO: tcp_retransmit_timer() increments it on every backed-off RTO
   with no cap of its own, then an ICMP unreachable goes through
   tcp_ld_RTO_revert().
 - zero window probe: tcp_send_probe0() increments it up to
   tcp_retries2, and tcp_probe_timer() calls the helper in its orphan
   check. commit 6d4634d1b091 ("net: Limit logical shift left of TCP
   probe0 timeout") clamped tcp_probe0_when() but not this one.

Seen on the RTO path with tcp_retries2=255 and a silent peer:

  UBSAN: shift-out-of-bounds in ./include/net/inet_connection_sock.h:258:40
  shift exponent 73 is too large for 64-bit type 'long long unsigned int'
  Call Trace:
   <IRQ>
   dump_stack_lvl+0xc1/0xf0
   dump_stack+0x10/0x20
   __ubsan_handle_shift_out_of_bounds+0x1d1/0x390
   tcp_ld_RTO_revert.cold+0x16/0x92
   tcp_v4_err+0xdb3/0x13e0
   icmp_socket_deliver+0x1a7/0x390
   icmp_unreach+0x2dd/0xe50
   icmp_rcv+0x93e/0xe30
   ip_protocol_deliver_rcu+0x36b/0x3e0
   ip_local_deliver_finish+0x37d/0x620
   ip_local_deliver+0x165/0x1d0
   ip_rcv+0x284/0x320
   __netif_receive_skb_one_core+0x16b/0x1c0
   __netif_receive_skb+0x21/0x150
   process_backlog+0x37e/0x1200
   __napi_poll.constprop.0+0xa5/0x5e0
   net_rx_action+0x4c0/0xf70
   handle_softirqs+0x204/0x9b0
   __irq_exit_rcu+0x13c/0x220
   irq_exit_rcu+0xe/0x20
   sysvec_apic_timer_interrupt+0x92/0xd0
   </IRQ>

The zero window probe path gives the same splat from tcp_probe_timer().

On x86-64 the shift count is masked, and the u64 can already be 0
before that (e.g. icsk_rto == 200 and icsk_backoff == 61). An orphan
that should be dead can then be seen as alive in tcp_probe_timer(), and
tcp_ld_RTO_revert() can end up with a smaller RTO than intended.

Cap the shift at 32: any non-zero icsk_rto << 32 exceeds TCP_RTO_MAX, so
the min_t() result is what the unbounded math would give. The
ilog2(TCP_RTO_MAX / TCP_RTO_MIN) + 1 bound of tcp_probe0_when() does not
fit here, as icsk_rto has no TCP_RTO_MIN floor the way tcp_probe0_base()
has.

Found by checking sysctl ranges against their users. Reproduced the RTO
path in a VM with UBSAN: a - r - b netns, tcp_retries2=255 and
tcp_rto_max_ms=1000 on a, blackhole route on r for 75s, then switch it
to unreachable. With this patch the splat is gone on both paths.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Kyuwon Cho <kyuwoncho18@gmail.com>
Closes: https://lore.kernel.org/netdev/179499954853.1440581.6627074959099619480@gmail.com/
Suggested-by: Eric Dumazet <edumazet@kernel.org>
Link: https://lore.kernel.org/netdev/CANn89i+=QRibXsm6tw-eVwhB3wjOtgF-MtVu0G--K5=oWP97+A@mail.gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
v2 -> v3: mention the zero window probe path, add Reported-by/Closes
(Eric) and Suggested-by/Link (Neal), say how it was found and tested,
point Fixes at 1da177e4c3f4. No code change.
---
 include/net/inet_connection_sock.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/net/inet_connection_sock.h b/include/net/inet_connection_sock.h
index 903499581db7..562e12033a5d 100644
--- a/include/net/inet_connection_sock.h
+++ b/include/net/inet_connection_sock.h
@@ -255,9 +255,10 @@ static inline unsigned long
 inet_csk_rto_backoff(const struct inet_connection_sock *icsk,
 		     unsigned long max_when)
 {
-        u64 when = (u64)icsk->icsk_rto << icsk->icsk_backoff;
+	u8 backoff = min_t(u8, 32U, icsk->icsk_backoff);
+	u64 when = (u64)icsk->icsk_rto << backoff;
 
-        return (unsigned long)min_t(u64, when, max_when);
+	return (unsigned long)min_t(u64, when, max_when);
 }
 
 struct sock *inet_csk_accept(struct sock *sk, struct proto_accept_arg *arg);
-- 
2.43.0

