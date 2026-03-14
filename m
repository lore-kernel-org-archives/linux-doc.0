Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B566C386C05
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 20:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773519293; cv=none; b=rUBMhOZbrWHcD88GfshF0+QcjBiUd/cM9FLJSOz5KdGnlsxfVBgLzaU3gKkTGm/8JUnh+Og2ZBw2tkO1RdEvjuPYp+jQDJk/GVJpvOgvULWCHDkcvdEa2iguUI54IhHCXmumW2cbiH4W/FEVpea5BjC5k0wjfGA8M3X5E/kXDgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773519293; c=relaxed/simple;
	bh=X1zLIw1J0h9kTV3NoqokrWtcJn8B9ET3Wq/q4qH3Vzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uhqMymXCvhw9FWO4378M3gjN2CCWXkqju7co19Wk8hM4S1vCwMwsER22Vm0n/iKva+bpfFenHE8VQ1E0Jkhso1XLHvDEU+Rn7yPg2QPMw/ZLMvFtpKE1x2plDyFQMIjHeC3yuAEBwa3xzgFZ/uy23y51z8o2lAFVLENfpmaaAto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=av4C9+ab; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="av4C9+ab"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d7653db148so2321277a34.2
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 13:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773519291; x=1774124091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q07GcXVkZ6+WpFEBkbyw8fuqV93z6jZU74lSMjAcsUw=;
        b=av4C9+abqVpl1yMfwP13WzFukND7oTB7bmhw/zU+qs7arventB0BU1KB4Mbsou5O+k
         6DRJJrkSnX7dOSovGsorBbjyap39bFfQGwd9zn0pmCabgitQ3aGWUXM2Kq3ShumzS21K
         S4U0DuPE0UlEdXoN/+jcyQwD22HlteF2XGQcWzONGCc2q72voKQIm/HP4CoxGXuJVagY
         ohNaxMSy0L6t3uHxjB/zD9ya7F219NmdlOpPj/tTZWGriZQc1N63XXGmWzlLOyWUuZOV
         la5lceDE1cuF5SiB8JBi8dEXDq3ND1sgIheSbwJn3HqodREIbOvahlN/u1khl0jM+dBi
         K4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773519291; x=1774124091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q07GcXVkZ6+WpFEBkbyw8fuqV93z6jZU74lSMjAcsUw=;
        b=cOte9jCbKame5GopIIz8Op1M42o2N7CcA7JjqCQbhHrBXpLcm2EJSprlfurJNqmzeT
         kJdZhdWfOZVuqVxszXwA+zUtKAxVLlmhkcVYYcUxGEJjpShlf7CsU/eNIpjFjok5brIN
         txURtS4Pq6rtHFa88LaiIQG9bXUYLO8/aKMaLkQtL3Fkg22ahFYkEl8kaXHtq0QpW4rY
         J3TuzexXZNZvHSV29sPkiT82yFoKtSQqVhG8dnV3Hh2Ewn45+CXTqev6sl23S3YqsDW+
         Z5VSsQ0KT7R1K267Ey+dY+ttdnGWMYlptqh+aSeM8YnFLDjZ6m2Idw7o+F+hYiX8FB1L
         1EpA==
X-Forwarded-Encrypted: i=1; AJvYcCUlaGcRtbFNk+j3u2LtoueFuSSWkcQ5/LhQRo+3NE3rMnVksA7/CJd4g8Kv66iYilR8o0OkOduXlko=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ465a1UwBRZ9XL6fE7D8GqiQ/ISgN2L8gefPl8QKW9Tzr0miY
	f3Ghvo3IDIuVjFAqNz5u63Yd3um7ZcLu/vt/4AYz+SQ3QZCz8zu4zXUc
X-Gm-Gg: ATEYQzwfCUy5kCbnqgQHs7qRTBu2hlpx96hiJyJXsaT6Q9lXclMlLjh0lPM4F2YnQyX
	gj87TvUGMd0FX5mx4f0gZ+UBUPZLouYvJpGeCBuWI+IWPzoUhM1hA2ei7h14Ucbyb3i3TNiWXrD
	2LSv7lYrvf5WWUe6AHNI40T9CLTD5tGL5R12udvGr/TgsS7iBo+gMMPTMntwtNYWNu2G1PvesS3
	qtm5DV1QX0+fnyF0sFDyIZjQHaZhBi/s2uFkfDFHMl4idhnulzArDrWbWcYR0o34FfGOkZh9xM6
	OdC7mrPjTwHQ2MPirWmuzUMj4ATvWrEXrb3Vz3XL6dd30MuihEw8IwEktiPHr1F76mzCPosLyqX
	N+frOYjlIt338NbbCYqPS5ehlLrK3w6kYtoKJ/nfNMeAieQ/HkdUJ4IAZaOy+h2VZMfyexYJarm
	RR/BpJgfJjx5UpaILviu9Zsx3AejR8MH894q9pvYDCWpkzIE7vj67BRWyea+W/NIVGUl+Tw91td
	bmTmNMxayMfhSu1dApD6KeiEnJhnF29be0i1dzhS11zGg0Wg9Q=
X-Received: by 2002:a05:6830:370d:b0:7d5:13eb:6010 with SMTP id 46e09a7af769-7d78259393bmr5062611a34.33.1773519290685;
        Sat, 14 Mar 2026 13:14:50 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e5e8185sm11914165fac.12.2026.03.14.13.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 13:14:50 -0700 (PDT)
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
Subject: [PATCH net-next v2 06/14] tcp: regrow rcvbuf when scaling_ratio drops after advertisement
Date: Sat, 14 Mar 2026 14:13:40 -0600
Message-ID: <20260314201348.1786972-7-atwellwea@gmail.com>
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

When tcp_measure_rcv_mss() lowers scaling_ratio after a window was
already advertised, grow sk_rcvbuf so the remaining live sender-visible
window still has matching hard receive-memory backing.

This repairs the live advertised window only. Retracted-window rescue is
handled separately in a later patch.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 net/ipv4/tcp_input.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 32256519a085..d76e4e4c0e57 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -221,6 +221,31 @@ static __cold void tcp_gro_dev_warn(const struct sock *sk, const struct sk_buff
 	rcu_read_unlock();
 }
 
+/* If scaling_ratio drops after we already advertised tp->rcv_wnd, grow
+ * sk_rcvbuf so the remaining live window still maps back to hard memory
+ * units under the old advertise-time basis.
+ */
+static void tcp_try_grow_advertised_window(struct sock *sk,
+					   const struct sk_buff *skb)
+{
+	struct tcp_sock *tp = tcp_sk(sk);
+	int needed;
+
+	/* Keep this repair aligned with tcp_rcvbuf_grow(): do not adjust
+	 * receive-buffer backing for not-yet-accepted or orphaned sockets.
+	 */
+	if (!tcp_rcvbuf_grow_allowed(sk))
+		return;
+
+	if (!tcp_receive_window(tp))
+		return;
+
+	if (!tcp_space_from_rcv_wnd(tp, tcp_receive_window(tp), &needed))
+		return;
+
+	tcp_try_grow_rcvbuf(sk, needed);
+}
+
 /* Adapt the MSS value used to make delayed ack decision to the
  * real world.
  */
@@ -251,6 +276,7 @@ static void tcp_measure_rcv_mss(struct sock *sk, const struct sk_buff *skb)
 			if (old_ratio != tcp_sk(sk)->scaling_ratio) {
 				struct tcp_sock *tp = tcp_sk(sk);
 
+				tcp_try_grow_advertised_window(sk, skb);
 				val = tcp_win_from_space(sk, sk->sk_rcvbuf);
 				tcp_set_window_clamp(sk, val);
 
-- 
2.43.0

