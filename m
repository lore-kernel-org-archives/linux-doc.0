Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03E0386434
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 20:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773519297; cv=none; b=Kvy2n0OB9dAM8yUlutF8yYCllrO59flqpYO1CoVTqt5LfXIbuIjn2CV7iISslTc2jAh2RDrYhFDuXpOdC/0WzFs8JE2819lUHqvPcskfI+uRhuooNE34BB7iYIwsnltCAl+7gqoJ5PLkfTClvm/TQTVObK+7Czhj3wyk5VEamMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773519297; c=relaxed/simple;
	bh=UwI3YBDLFZSN0Qol0fxNTwazKut7aA5SPPECRbpGROI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHXl6BqVEa9ZaQrBm/9BKJ77DhnWpevsdh2PjcqDZYMkPyO3pNpa5XNytoOry7uUqds6i/3LT2kkmQ0rkxX1maUDOXiXruw/oCFdUwlq/mIUMg0q5zVmeCd0ZOf5oUeAzO7tv+6rIlO8bhqPBXr2kDBYkaKtzF7TpZNlO0OLCcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j49SHDWy; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j49SHDWy"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-408778a8ec4so2016592fac.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 13:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773519294; x=1774124094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8jG5HL0B71BMqNMR6IMNfhIt0KSqCtw04UXTW9LEYQ=;
        b=j49SHDWyhL6wVPV5IL2n94528OcExoRQnxUY1jTYXuP9K5S7QNJhuDq8bK7PGpVdf2
         IqZrZw86ALzFrFB7Dm1rYuRSKE51wU3EBTogSlIzUc8xR7rhpUWSEgMkUE3jmocumDW3
         ZXRd33PWAzTNzUQIcWtqxbrFNOrq00xB6l/Afjl+nBygCSzgG3J8KYC1MXTabkdXlG5Z
         ho5UwDBIsi6JuMoafh9D1E73l18caLotal1OPM62yTIie9pZ+IcMRXu/muCXIk7W6eAv
         Q221WX4LU4hrfBVNoXINbhrBMEwgtWdBRAO25EnJl/8EHyc6i8KbPBQrnVbLQN0uz7L4
         4BoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773519294; x=1774124094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W8jG5HL0B71BMqNMR6IMNfhIt0KSqCtw04UXTW9LEYQ=;
        b=oqIvnLn5c8HPbozTWNc69rJMr9ga5UN4bjxr8Ywx4t9P7luqim1ix5LeGMV+8nA7Mz
         SqgfsDvgehZuWzw4tIZwrx7NpXZ1fs9FbBgu2JPjSWQVRzohRFD8e0NAAFnE/qDWOY0+
         xGXmGNjAP10VxNCgUGuONCwfCMeHK9Pj+Zq+3zqdmn1NWNcYN8x0kpcE8XyIPoDhWA4K
         atgG/7xTugDnPSGJJ9j9XE3zAbk7lxfariQkkUpLPwGDVBfJY6PYkyWsI6E7MVAw/f8l
         VpSogvyNcaFf6SS/l0lyQI92FM8ml/WZDDdwqHatuZZ2uq6BLa4M59hR4Dm0NSBNDCUG
         d0Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWk85bYEOB8ybxg5Ox2kyToGwbj5la+DhC5kYCkiOuGegv8qf/9Z68hS47WhQGIg4vmGdOCxa21mkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKMVzWlgJGkmt2/5SEyMCz70vtBOfoXx1SEBzLljLqDdIuF8e7
	jS6cx1lN5POThf+fIu1zXcJ1SfQsGcx5n+cTsohgegGmLUQnBhhtwDVI
X-Gm-Gg: ATEYQzweXFbIyZ3kwnX/ldCe2rYPHycVvQ98wvf7FaZwQvag6EfwkrpvPoYIoIcx63H
	Pk+quRAMDlqLvSUg3v3nQK+4QqyyIe+5F8o5zYCWlvhUDpkCXUY/tpuRS5odUFKbXtuIvsSq6Wj
	QE3lehH8UwV0jAHNgaSa7+YWn8SGoVUS5BypHGSMdOxWXPpb7rR/htaSN0eQy/i+doh52U/4YgN
	XKcyk2RcedDtWJudEAOKy3Ezju1es79bzVfvcFA+9Dd7ehMhJVTpBTUjiQfRjvZ9Zv2qd6BBExz
	9nk6Op94Dpyr7UD5L5067CUgz7fSByBJv9Lh0C62Ex2kq314W7mZjOJn99qGiwJJPH5FFLM9C8E
	qvVmqz8r5XMiyc+UaNNc5qy67nE4FVM+QwET/ykEUOeEaVRLJFROO85/E+Xt1tlHCv+RKJsuxD6
	gDs697cXtn2vA3ztOh1LtKzpzYeGmFvwYkw8ADW2cRm6G+6kdtSdgz/NW0hvAa5oC6ZBzKzdHWd
	ceHHBeLl2vyRJNvBAtSgyvcFCnguPDqgM10zAY9
X-Received: by 2002:a05:6870:a70b:b0:409:5241:8abc with SMTP id 586e51a60fabf-417b91902e7mr4222211fac.20.1773519293652;
        Sat, 14 Mar 2026 13:14:53 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e5e8185sm11914165fac.12.2026.03.14.13.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 13:14:53 -0700 (PDT)
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
Subject: [PATCH net-next v2 08/14] tcp: extend TCP_REPAIR_WINDOW for live and max-window snapshots
Date: Sat, 14 Mar 2026 14:13:42 -0600
Message-ID: <20260314201348.1786972-9-atwellwea@gmail.com>
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

Extend TCP_REPAIR_WINDOW so repair and restore can round-trip both the
live rwnd snapshot and the remembered maximum sender-visible window.

Keep the ABI append-only by accepting the legacy and v1 prefix lengths on
both get and set, rebuilding any missing max-window state from the live
window when older userspace restores a socket.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 include/net/tcp.h        | 13 +++----
 include/uapi/linux/tcp.h |  8 +++++
 net/ipv4/tcp.c           | 73 ++++++++++++++++++++++++++++++++++++----
 3 files changed, 81 insertions(+), 13 deletions(-)

diff --git a/include/net/tcp.h b/include/net/tcp.h
index 5b479ad44f89..12e62fea2aaf 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -1766,13 +1766,14 @@ static inline bool tcp_space_from_wnd_snapshot(u8 scaling_ratio, int win,
 }
 
 /* Rebuild hard receive-memory units for data already covered by tp->rcv_wnd if
- * the advertise-time basis is known.
+ * the advertise-time basis is known. Legacy TCP_REPAIR restores can only
+ * recover tp->rcv_wnd itself; callers must fall back when the snapshot is
+ * unknown.
  */
 static inline bool tcp_space_from_rcv_wnd(const struct tcp_sock *tp, int win,
 					  int *space)
 {
-	return tcp_space_from_wnd_snapshot(tp->rcv_wnd_scaling_ratio, win,
-					   space);
+	return tcp_space_from_wnd_snapshot(tp->rcv_wnd_scaling_ratio, win, space);
 }
 
 /* Same as tcp_space_from_rcv_wnd(), but for the remembered maximum
@@ -1800,9 +1801,9 @@ static inline void tcp_scaling_ratio_init(struct sock *sk)
 }
 
 /* tp->rcv_wnd is paired with the scaling_ratio that was in force when that
- * window was last advertised. Callers can leave a zero snapshot when the
- * advertise-time basis is unknown and refresh the pair on the next local
- * window update.
+ * window was last advertised. Legacy TCP_REPAIR restores can only recover the
+ * window value itself and use a zero snapshot until a fresh local window
+ * advertisement refreshes the pair.
  */
 static inline void tcp_set_rcv_wnd_snapshot(struct tcp_sock *tp, u32 win,
 					    u8 scaling_ratio)
diff --git a/include/uapi/linux/tcp.h b/include/uapi/linux/tcp.h
index 03772dd4d399..564a77f69130 100644
--- a/include/uapi/linux/tcp.h
+++ b/include/uapi/linux/tcp.h
@@ -152,6 +152,11 @@ struct tcp_repair_opt {
 	__u32	opt_val;
 };
 
+/* Append-only repair ABI.
+ * Older userspace may stop at rcv_wup or rcv_wnd_scaling_ratio.
+ * The kernel accepts those prefix lengths and rebuilds any missing
+ * receive-window snapshot state on restore.
+ */
 struct tcp_repair_window {
 	__u32	snd_wl1;
 	__u32	snd_wnd;
@@ -159,6 +164,9 @@ struct tcp_repair_window {
 
 	__u32	rcv_wnd;
 	__u32	rcv_wup;
+	__u32	rcv_wnd_scaling_ratio;  /* 0 means live-window basis unknown */
+	__u32	rcv_mwnd_seq;
+	__u32	rcv_mwnd_scaling_ratio; /* 0 means max-window basis unknown */
 };
 
 enum {
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 66706dbb90f5..39a1265876ea 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -3533,17 +3533,31 @@ static inline bool tcp_can_repair_sock(const struct sock *sk)
 		(sk->sk_state != TCP_LISTEN);
 }
 
+/* Keep accepting the pre-extension TCP_REPAIR_WINDOW layout so legacy
+ * userspace can restore sockets without fabricating a snapshot basis.
+ */
+static inline int tcp_repair_window_legacy_size(void)
+{
+	return offsetof(struct tcp_repair_window, rcv_wnd_scaling_ratio);
+}
+
+static inline int tcp_repair_window_v1_size(void)
+{
+	return offsetof(struct tcp_repair_window, rcv_mwnd_seq);
+}
+
 static int tcp_repair_set_window(struct tcp_sock *tp, sockptr_t optbuf, int len)
 {
-	struct tcp_repair_window opt;
+	struct tcp_repair_window opt = {};
 
 	if (!tp->repair)
 		return -EPERM;
 
-	if (len != sizeof(opt))
+	if (len != tcp_repair_window_legacy_size() &&
+	    len != tcp_repair_window_v1_size() && len != sizeof(opt))
 		return -EINVAL;
 
-	if (copy_from_sockptr(&opt, optbuf, sizeof(opt)))
+	if (copy_from_sockptr(&opt, optbuf, len))
 		return -EFAULT;
 
 	if (opt.max_window < opt.snd_wnd)
@@ -3559,9 +3573,47 @@ static int tcp_repair_set_window(struct tcp_sock *tp, sockptr_t optbuf, int len)
 	tp->snd_wnd	= opt.snd_wnd;
 	tp->max_window	= opt.max_window;
 
-	tp->rcv_wnd	= opt.rcv_wnd;
+	if (len == tcp_repair_window_legacy_size()) {
+		/* Legacy repair UAPI has no advertise-time basis for tp->rcv_wnd.
+		 * Mark the snapshot unknown until a fresh local advertisement
+		 * re-establishes the pair.
+		 */
+		tcp_set_rcv_wnd_unknown(tp, opt.rcv_wnd);
+		tp->rcv_wup	= opt.rcv_wup;
+		tcp_init_max_rcv_wnd_seq(tp);
+		return 0;
+	}
+
+	if (opt.rcv_wnd_scaling_ratio > U8_MAX)
+		return -EINVAL;
+
+	tcp_set_rcv_wnd_snapshot(tp, opt.rcv_wnd, opt.rcv_wnd_scaling_ratio);
 	tp->rcv_wup	= opt.rcv_wup;
-	tp->rcv_mwnd_seq = opt.rcv_wup + opt.rcv_wnd;
+
+	if (len == tcp_repair_window_v1_size()) {
+		/* v1 repair can restore the live-window snapshot, but not a
+		 * retracted max-window snapshot. Rebuild it from the live pair
+		 * until a fresh local advertisement updates it again.
+		 */
+		tcp_init_max_rcv_wnd_seq(tp);
+		return 0;
+	}
+
+	if (opt.rcv_mwnd_scaling_ratio > U8_MAX)
+		return -EINVAL;
+
+	/* Userspace may repair sequence-space values after checkpoint without
+	 * also rebasing the remembered max advertised right edge. If the exact
+	 * snapshot no longer covers the restored live window, treat it like
+	 * v1 and rebuild the max-window side from the live pair.
+	 */
+	if (after(opt.rcv_wup + opt.rcv_wnd, opt.rcv_mwnd_seq)) {
+		tcp_init_max_rcv_wnd_seq(tp);
+		return 0;
+	}
+
+	tp->rcv_mwnd_seq = opt.rcv_mwnd_seq;
+	tp->rcv_mwnd_scaling_ratio = opt.rcv_mwnd_scaling_ratio;
 
 	return 0;
 }
@@ -4650,12 +4702,16 @@ int do_tcp_getsockopt(struct sock *sk, int level,
 		break;
 
 	case TCP_REPAIR_WINDOW: {
-		struct tcp_repair_window opt;
+		struct tcp_repair_window opt = {};
 
 		if (copy_from_sockptr(&len, optlen, sizeof(int)))
 			return -EFAULT;
 
-		if (len != sizeof(opt))
+		/* Mirror the accepted set-side prefix lengths so checkpoint
+		 * tools can round-trip exactly the layout version they know.
+		 */
+		if (len != tcp_repair_window_legacy_size() &&
+		    len != tcp_repair_window_v1_size() && len != sizeof(opt))
 			return -EINVAL;
 
 		if (!tp->repair)
@@ -4666,6 +4722,9 @@ int do_tcp_getsockopt(struct sock *sk, int level,
 		opt.max_window	= tp->max_window;
 		opt.rcv_wnd	= tp->rcv_wnd;
 		opt.rcv_wup	= tp->rcv_wup;
+		opt.rcv_wnd_scaling_ratio = tp->rcv_wnd_scaling_ratio;
+		opt.rcv_mwnd_seq = tp->rcv_mwnd_seq;
+		opt.rcv_mwnd_scaling_ratio = tp->rcv_mwnd_scaling_ratio;
 
 		if (copy_to_sockptr(optval, &opt, len))
 			return -EFAULT;
-- 
2.43.0

