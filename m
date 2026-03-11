Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422343B7747
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215796; cv=none; b=r0lxxjRRCVQWhwDjNMgAlM9zgEx87B4dNIzfelYy4XK7JG0VACIYXGKIeCNtV5jzodQ81HGTHr3yeiCM66EgrGY56O7p7MdhxibLe50ZBdiIpq5THnt6OvDh798FwhxiNePN5Exyl5m/zBVhvnxwvYLgRE2P9y4lotmzEOQaW8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215796; c=relaxed/simple;
	bh=jPhrqcmDRhUMlM7YZP0Vfe8I9hineTPoN8bOhKWBAv0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t2VCKlbWtzqy1krMQ+23CP/CAkzcduvmDHUvndy8PNc0lNPxKoXVH6zQJBH00+2cPswZiS42bpgTdgYwldxCz2oECaSxPy9THmKHXnLFEGfagghNIpEU4Inm++he+xEVHZpHi+Z3jPFCjMOKIzJbpNXgmIAdPo/v5N5dzCQwmh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1CsQpNo; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1CsQpNo"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-40f387a688dso6998447fac.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 00:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773215791; x=1773820591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wacSMrdd6YBSycXcvfypm/nD64eKKUdf2M/29BZscYc=;
        b=S1CsQpNohQf8dC1hcEbbvhhBIN0GGWYdx7VS/SnXvB6+7d4ONkyBsj1dWWoinKVXlz
         diWGDrpkVpvYnWp/QVF0lVnF8qLNRFIjIXx/aaltrDAwz/ypULZjOh09j78TUEX/NuEr
         QyyT29asTIHqmd1JGj/Ja3eRRxvZKIbICFOFa2oRna5Ra/BBh9LKWuFakqVC53uDINgr
         WJs//TuoM2pjPTtGaPia/aOcf1pNXF9CAFNg9UcMH7H8buLuRxV5jLMKCdZRnBMyfrsb
         lgrTVtRkAx+oOROD0aiFAWM9Y3iNMLjNbGrKKAMJwdduuYz8iRq4yimGwMsI8f4/qgXh
         bNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215791; x=1773820591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wacSMrdd6YBSycXcvfypm/nD64eKKUdf2M/29BZscYc=;
        b=nzI0fnW+WPxATr+vfNL+afUKzUg0i5ryVBx0T7WBDDI9PyJuCa1yHIS5V2kl1tC5fE
         PhWrMfeVMOf2h73YgDXDEadZ/gDp5pRLWi3PuxBmA7bC7cLbEm1gavvvH36T7xJ4YXfc
         6bsc/8I9K89f9ux8pg8Moij1W3NWu7fJ+HMmPIL5YGhM4Oc8qdysJxcJ9m4AKR7CQ9+e
         sihx38rZKvT0jvwAvYUhMOuGxX9BsnZhCuClhbeDrzh3bHGcula55ExwUvKypfTajBGx
         L1o5xkQVAm72beHKrFJ3+rMx4y5ugPKLtgteLY/6m2e6xF+M3ZYfCx23uESKeHErU25a
         jtRw==
X-Forwarded-Encrypted: i=1; AJvYcCW4OqIZCZIGzKce7gVZFh3xTtyuvb6ziInqqEz+85e7l3UVq6pGr11IGlpT7lwWdiCIWzciGAHASFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmzGGJhdI+y3JlJcyPOI269H7lPIFhvLIgiLFvHbZoKVL/uNeF
	juuQ2W/p/aStgiXkVW5XC7dyuEBWiloeMscGe9FilR711IEdC+Ci64F3
X-Gm-Gg: ATEYQzwvOjDRtMV6UTnLOSYEdDF+Um8yR0jKMsXpR93fmEC4I3NIOUiNpsrT1er+t4J
	hRIq1ZYq+YvdNWB/ggziUH9xdMtUNvjH3mw3YWXJTmhNegBhvlaNBrhcL1lVY9rZiHzXGCat9oD
	DfVELhk3Q/GPRiaf2G5qJGh3I0SFsARDPiGwvcxQvxWNPFmbG9BEwvf9FOj7Nv6b56531UBJ12S
	yRLJ/FpAhM00ahgsAuv5R0/WUtBpBb5ArzrQ5waySJqKIY5xrKjX9T58wejaAgnc1B+6Xgnpssy
	aaoMtjFVE41GD1crfq9v/jgIb3Isi7q/t7oN+JdzvOXJ1Byt07ltR4MCaJhr4jrzpHPByQwGwds
	+fDJNE1MBjPbPEXcoV+qD0oDr13YRgZVQ8fhgdLPeD/a5tq8ydBNtm0tTzhIjvpOg6ymCAHRRsv
	NuAkNdK72TTI6Dvt0xhUC84jeAYEzuxUsXiW/3eW58EcoUGS+K9l25nQ6ygH44+2p3A0NrP81PH
	GGdcD3jZz87mycZPUuJ4nACdeJL8Y8xelC/jtrQT43+CaiD
X-Received: by 2002:a05:6870:91cb:b0:3e8:8e56:674b with SMTP id 586e51a60fabf-4177ca09363mr1118957fac.53.1773215791030;
        Wed, 11 Mar 2026 00:56:31 -0700 (PDT)
Received: from localhost.localdomain (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6ae0e3sm1568938fac.16.2026.03.11.00.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:56:30 -0700 (PDT)
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
Subject: [PATCH net 2/7] tcp: preserve rcv_wnd snapshot when updating advertised windows
Date: Wed, 11 Mar 2026 01:55:55 -0600
Message-Id: <20260311075600.948413-3-atwellwea@gmail.com>
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

Once tp->rcv_wnd carries paired snapshot semantics, every write of the
advertised window has to refresh the snapshot at the same time.

Convert the active-open, passive-open, and normal advertised-window
update sites to use tcp_set_rcv_wnd(). This keeps new sockets and later
window advertisements initialized with a valid advertise-time basis
before the receive-memory logic starts consuming it.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 net/ipv4/tcp_minisocks.c | 2 +-
 net/ipv4/tcp_output.c    | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/tcp_minisocks.c b/net/ipv4/tcp_minisocks.c
index dafb63b923d0..ae8a466b5298 100644
--- a/net/ipv4/tcp_minisocks.c
+++ b/net/ipv4/tcp_minisocks.c
@@ -603,7 +603,7 @@ struct sock *tcp_create_openreq_child(const struct sock *sk,
 	newtp->rx_opt.sack_ok = ireq->sack_ok;
 	newtp->window_clamp = req->rsk_window_clamp;
 	newtp->rcv_ssthresh = req->rsk_rcv_wnd;
-	newtp->rcv_wnd = req->rsk_rcv_wnd;
+	tcp_set_rcv_wnd(newtp, req->rsk_rcv_wnd);
 	newtp->rx_opt.wscale_ok = ireq->wscale_ok;
 	if (newtp->rx_opt.wscale_ok) {
 		newtp->rx_opt.snd_wscale = ireq->snd_wscale;
diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 326b58ff1118..c1b94d67d8fe 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -291,7 +291,7 @@ static u16 tcp_select_window(struct sock *sk)
 	 */
 	if (unlikely(inet_csk(sk)->icsk_ack.pending & ICSK_ACK_NOMEM)) {
 		tp->pred_flags = 0;
-		tp->rcv_wnd = 0;
+		tcp_set_rcv_wnd(tp, 0);
 		tp->rcv_wup = tp->rcv_nxt;
 		return 0;
 	}
@@ -314,7 +314,7 @@ static u16 tcp_select_window(struct sock *sk)
 		}
 	}
 
-	tp->rcv_wnd = new_win;
+	tcp_set_rcv_wnd(tp, new_win);
 	tp->rcv_wup = tp->rcv_nxt;
 
 	/* Make sure we do not exceed the maximum possible
@@ -4150,6 +4150,10 @@ static void tcp_connect_init(struct sock *sk)
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
2.34.1

