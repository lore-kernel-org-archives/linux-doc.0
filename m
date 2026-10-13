Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4855F40DB4C
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 10:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887958; cv=none; b=L+R+F4fvul9XyWELRDHjzqQ5Z/GUOd19vqPm/RNZgiQtdJm6DisIQMLmfLSzrd3G8PRiBVWwiFBM146glKiAmwOzGchyL9m3yngL72Mn+dFBCEFgudT9KQ4W3+EM5lPpzSRippuZN5h/EGueFP+hrgVdfxadbC6MXAyCIUmJ5w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887958; c=relaxed/simple;
	bh=0uJ+kESm1PwiYPBfflB5thPfi9nQFbOwnmyUiLZ2SEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=suXrC9r6TjyAxOEC0jq++cNrGQT1IdW3FjR1t7OXnr1a5kCSHPB2yhc7l6spvLBJL4voZ/AB4+cs+GvRLcSun4/Eno9wdoWp4c/HuczvsiBxkzpB+7nHr5PltnZsH0Omquteh8jRTPryQdMM6f03g4hfZq7DPg7LRni04GZH668=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=ditXe7mU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="ditXe7mU"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso1761182a12.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 03:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1791887954; x=1792492754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0VR4BhwU3dfr1tgwz6hrqGOWxE0skLoQ18O/+G4pO8=;
        b=ditXe7mU39OVQwRxu9fO4NaNK4aubND8FdlfmCwc9eRIdMullVnmwMQI8qg7C3FBiW
         DhCfTTNwfEPh156povT8B/8OMoLLQwl994tmfoO5ELuq4xE6sWALN+zJqx3CJRSx0KHT
         Efk/CvDJCm36lCO6kAxjy8c1zZMxAMg3DJV//lj8OYg+U9q83oHjsxYIsyp4tSKyJDoM
         RjVeDbDm0FIuBGNpyav9d+95qGv35YKsoOBM/6KAxZLbY3Y3UXCVJFx9PLAlpNHULADR
         CYse4/TZmIm8ZfJBH0K+BWE7XhZrH2JtLeLwz4v9yzFvghbxkvR0SZAvKxJTxJkw8T+Y
         U2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887954; x=1792492754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G0VR4BhwU3dfr1tgwz6hrqGOWxE0skLoQ18O/+G4pO8=;
        b=JL7ko4UDO9/ntUj/Bs3vpGfzhNvvkrEiPJUVdDJH2RWmJLP5zB9UXdiYUEM6XlxaGT
         Cuhj/YLe81Xxcr2belNz80gLi1btnnIJ3z47zH+0VUZctUVINRQiUdmuBBX2QAN86clf
         25K3I2H+RDwPjN78c3Htuhtoev+HgzM8jlNA690c2XE5dZA6449/1izPO7BimN/8M0jx
         BRNtsmMCs3G3s++xhEIPd6cr5r5+q7IQm/xCrMBSt07Jy1rmLzFnh+WaxAUtmnYyGh+h
         rexPyYuitUDjp5yFIhvMjKAtqvzBiIRZ1qlt5Sg5gIZoZdmPuXz4O4y6uJvgaqpjAudJ
         2f1w==
X-Forwarded-Encrypted: i=1; AKwUvBxkylqE4zzgU1kJ++rOf7+iMiat7q43on+Medam7GtAywX1y3s8ZZU6r2/MlH8EnP9eoXTS8mVqQg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJidMBynCF6wfTvIxPSLj/oQ1esvoZ0Brliyqng2RBWcpL05GQT
	K7ZxESIV3nBAfA4fUqC91HOEBuDMpi/cDlVdF9Ga1L1E+lHma5wxl/uUg3sS6WDYT5U=
X-Gm-Gg: AYBFou01P4aGd0oTOiC7MfqLDboXu54uhkzU/9w3rbvtKN8WTJQduX/Qg4/HNIvdEeq
	uFsjmubHdw2bB04uFrkujARX/R4ToHqnHNBCoqV0U40HbyTbRLzfSWtM4ZUb/D1in0YJa+Kuc6r
	70nBMGeJIWuiHCiUhKGtmuX5yN2AT81mH/M+T6bgtxGHd9+Ij76qT2m4riY+8TA4ykMeCFn9CFt
	qvpY3aGsUcd0/fAeJVZojEmaN4m/wDDmG+/Usaa99U+EdXo/BFMFjDYImNAM6nKUI9Js8X7k1zB
	o8lSV+ESTUKorqkrtvtV7S4Z2skRkJODaWq7kvnrl2mbhl40ABZteLtRdG2OdhfZQiD+kY5FvXy
	8v+S7yXq8LzCxVVcFdsCtbfwXcoHGFGNm6hv7VcMp0uGX5kfAruSxWwKtT8lEvZ8a2yKNulHr9P
	JUSJ9a4J1c1nNH5+7RNDI35xs2ORSn74pNRDTpHygaAZWH0wFZMckzZy/SzxdDTXesguQWI0Z+0
	oNRAkxMhvyJd+eUwfY08t2ftA==
X-Received: by 2002:a17:907:3da7:b0:c26:2fc8:4e91 with SMTP id a640c23a62f3a-c31a9d579d8mr1148888566b.29.1791887954405;
        Tue, 13 Oct 2026 03:39:14 -0700 (PDT)
Received: from 8951987238ab.arnhem.chello.nl ([104.28.187.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac62a7sm552462166b.63.2026.10.13.03.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:39:13 -0700 (PDT)
From: Willem Ferguson <wferguson@cloudflare.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ncardwell@google.com,
	bpf@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com
Subject: [RFC PATCH net-next 3/4] tcp: add TCP_TS_ID socket option
Date: Tue, 13 Oct 2026 10:39:05 +0000
Message-ID: <20261013103906.2660384-4-wferguson@cloudflare.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013103906.2660384-1-wferguson@cloudflare.com>
References: <20261013103906.2660384-1-wferguson@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a read-only TCP_TS_ID option so applications and tests can see
which TSval identifier, if any, was assigned to a connection. The value
packs the identifier width into bits 8..15 and the identifier into bits
0..7. Zero means no identifier is encoded.

The option cannot be set. The identifier is chosen by
BPF_SOCK_OPS_TCP_TS_ID_CB when the SYN arrives, and there is no way to
restore it onto a new socket, so connections that carry one do not
survive TCP_REPAIR. ip-sysctl.rst already documents that limitation.

Signed-off-by: Willem Ferguson <wferguson@cloudflare.com>
---
 Documentation/networking/ip-sysctl.rst | 3 ++-
 include/uapi/linux/tcp.h               | 8 ++++++++
 net/ipv4/tcp.c                         | 3 +++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index ce669f282250..d5e992623326 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -1123,7 +1123,8 @@ tcp_ts_id_bits - INTEGER
 	often than this interval prevents it.
 
 	Progress is visible through the TCPTSId* counters in
-	/proc/net/netstat.
+	/proc/net/netstat, and a connection's identifier can be read with the
+	TCP_TS_ID socket option.
 
 	Checkpoint/restore is not supported. The identifier is selected by BPF
 	when the SYN arrives and cannot be restored onto a new socket, so a
diff --git a/include/uapi/linux/tcp.h b/include/uapi/linux/tcp.h
index 03772dd4d399..5d7f37b6f8d9 100644
--- a/include/uapi/linux/tcp.h
+++ b/include/uapi/linux/tcp.h
@@ -142,6 +142,14 @@ enum {
 #define TCP_RTO_MAX_MS		44	/* max rto time in ms */
 #define TCP_RTO_MIN_US		45	/* min rto time in us */
 #define TCP_DELACK_MAX_US	46	/* max delayed ack time in us */
+#define TCP_TS_ID		47	/* Read TSval identifier and its width */
+
+/* TCP_TS_ID value layout: identifier width in bits 8..15, identifier in
+ * bits 0..7. A value of 0 means no identifier is encoded. Read-only: the
+ * identifier is chosen by BPF_SOCK_OPS_TCP_TS_ID_CB and cannot be restored,
+ * so connections with an identifier do not survive TCP_REPAIR.
+ */
+#define TCP_TS_ID_BITS_SHIFT	8
 
 #define TCP_REPAIR_ON		1
 #define TCP_REPAIR_OFF		0
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index af994edde7f7..5991b16396b9 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -4711,6 +4711,9 @@ int do_tcp_getsockopt(struct sock *sk, int level,
 		else
 			val &= ~1;
 		break;
+	case TCP_TS_ID:
+		val = ((u32)tp->ts_id_bits << TCP_TS_ID_BITS_SHIFT) | tp->ts_id;
+		break;
 	case TCP_NOTSENT_LOWAT:
 		val = READ_ONCE(tp->notsent_lowat);
 		break;
-- 
2.47.3

