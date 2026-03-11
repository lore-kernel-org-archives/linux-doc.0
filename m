Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335F13B777D
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215790; cv=none; b=qHLadYghRkXxIcP1cKzv+Bf0XfoZ/9YHg33MWjWT7p7MeH6/geACPSlm8T1E3tfP8sXVITNvNDWYqSIJtOha45Vg7a5TNGN5BZpcAzMIvlUCE50qJu0TSMnxST1M112wmpR08TXRTQmatF96oU2dPERJTggKtXFOdKR4lCZj298=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215790; c=relaxed/simple;
	bh=FDmpie23sScGP+OdflWzKGb+2xENXEuu2nCfUaQR7H8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LhYEWYXzZKLx802SwE72/hAyThwUOy7+qn8VbuLRP22RAim5gkmvQYW0asBgpdVq5ZhVhw6VAxPyQSdk0WU/Ia5vlSOEAuVNnfT8rF6jbCKGmke/9vQ6yPXm+/lrsGxVezzij65ZZuGsUV3INI/9vNW7AZ2wQkP3oA4mrlFGVVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ep5ux/fP; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ep5ux/fP"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-41708f6aa5fso2531187fac.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 00:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773215787; x=1773820587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DRAOu3vndgNWWBgUC2jVEJ5hsRD9mDPq+B8T4vBDYFI=;
        b=Ep5ux/fPJChFYDWKlpLfuOO1GEiWepqX5YSftIEKjejsYgGZEgeFdk7VC2EWhb8sjw
         yZnAWSme2lhdMgJGZLPGlkWY87JyXHwKw4yrx4cKfk23r8vUdUGfRNsGcr3wepcvvpnX
         +ZBiNo36lnBHhItUD6h+wVdvz4jzLaBKAlOq1ct3IXYo96QCzlMTTcFLlSNkm0Gy/73m
         dbxk/35kkRGr+emMCJkLKVbfK+YxTXvDUZ1LCaE3Y2UvyHgKdd2b9BZSFfc8E3U8nK5s
         GoY5MNQo7LXXV+p5HCmzioTWpk5jhKPwayapprzlHQmD1/h79E7bvS/tQtw1ERPogvQg
         3hUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215787; x=1773820587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRAOu3vndgNWWBgUC2jVEJ5hsRD9mDPq+B8T4vBDYFI=;
        b=ipXpeQ1HSEejquDSVzllfHC0vRT7kG6tET5VW+tw74LFbsHKs9KdAX6xZ181JTEvqX
         +jk6WQHtVUk1zoYyuyxKQwLNLinX6kGDPOc966boohOpg1vVP9fO1MMbdRFHT5YZSt+5
         nWdNVKwDltHqNJF04bFzkzeTzqSBNOJ9vxmetZrIjvZ18l6Lf5UUIzaoE5yAugbvuNob
         Bh8vtMhtG4jQ3OVk+WiU4rLamAjC6dlXWe8JfuRHb3UnAm95Fp7BxcCiktm9V+I76N5I
         Ko94a3OrgnIIHv9FwiyplChjfyOM9Uvb/pzlyiopNrrmiGIo+ydt2vfftERcap2T1rOn
         F/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVQzUa5m8/X1RcpYqRhlyOIW+/IzBlRh2z3WaJ2mKS6bm6vlEwi3UJh11JWfHzUWYiNTVLwp80eYFA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz0SSFPWTFFldB9soZYmRD9kb+N8aQSo3q9OmZR/LMxHcbiF3+
	W7ZLFB31SiFcguWeBhulnPP5eFALlq/nI1UWwcvIEgqX8ylYinKEs7h9
X-Gm-Gg: ATEYQzw5gb+ql6cofEaOFiMOFk9/VNkeXOFhZ3prCRDUmRup0IVuY8Mzdq9I2UVMv0v
	S2oF7rz7aOGuWHL34YMJUFGiAc7+c4+SM4EjSHArwoOHvLz0CliLYT0hVs61iunH5XEZsIEcKU7
	oMWqga3qehgot/9zKce7NJqKZeN7bKWzv0+eSH3fbqrtlUgTl3tAl1chJ8lJ9+rH9KqtVm444P2
	0bewxn+Ju4b19zK1RYznuN8DHDl47Sfb9MiPYw79JfG3BjxvM4g/fZ7DFHZkF23vVPKn5uk6JH0
	eCwZxZanJdD+TihJQDOguMSfTwsFuCuDUJxgLyKwFYU5H0kJRPgHXY64Cdvnxzte0Du5e8xwvl5
	ePEtPOOKFNdj/iGdbhdEtVLe1FaA281gmbnbYb0HMlIY/0i+RcTntLt7imHz3CdX/xSm8kq5M4d
	nV0ZugenZXeMsgGaY3XAqR60Q2sKdBXRiP/xdVUhmyYlRD1C2TFooe5sKxg3BEGP3batlazVp1e
	34vXZ0Xt2u3M/08aq1KcKyov517iKMO1qJEaPuSr67uG8Bw
X-Received: by 2002:a05:6871:8a5:b0:409:6862:aba5 with SMTP id 586e51a60fabf-4177ca9e65dmr1127232fac.25.1773215786910;
        Wed, 11 Mar 2026 00:56:26 -0700 (PDT)
Received: from localhost.localdomain (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6ae0e3sm1568938fac.16.2026.03.11.00.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:56:25 -0700 (PDT)
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
Subject: [PATCH net 0/7] tcp: preserve advertised rwnd accounting across receive-memory decisions
Date: Wed, 11 Mar 2026 01:55:53 -0600
Message-Id: <20260311075600.948413-1-atwellwea@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series keeps sender-visible TCP receive-window accounting tied to the
scaling basis that was in force when the window was advertised.

Problem
-------

`tp->rcv_wnd` is an advertised promise to the sender, but later
receive-memory admission and clamping could reconstruct that promise
through the mutable live `scaling_ratio`. After ratio drift, the stack
could retain or advertise a receive window that no longer matched the
local hard rmem budget.

Fix
---

- store the advertise-time scaling basis alongside `tp->rcv_wnd`
- refresh that pair at the TCP and MPTCP receive-window write sites
- consume the snapshot in receive-memory admission, clamping, and the
  scaled-window quantization path
- preserve the snapshot across `TCP_REPAIR_WINDOW` restore when userspace
  provides it, and fall back safely when legacy userspace cannot
- expose the accounting in tracepoints and cover the ABI/runtime contract
  in selftests

Series layout
-------------

1. track the receive-window snapshot state and helpers
2. refresh the snapshot when TCP advertises or initializes windows
3. use the snapshot in receive-memory admission and clamping
4. extend `TCP_REPAIR_WINDOW` for exact restore plus legacy compatibility
5. refresh the TCP shadow window snapshot in MPTCP
6. expose rmem/backlog state in `rcvbuf_grow` tracepoints
7. cover legacy and extended repair-window layouts in selftests

Testing
-------

- `git diff --check origin/main..HEAD`
- `scripts/checkpatch.pl --strict --show-types` on patches 1-7
- `make -j8 headers`
- `make -j8 net/ipv4/tcp_input.o net/ipv4/tcp_output.o net/ipv4/tcp_minisocks.o net/ipv4/tcp.o`
- `make -j8 C=1 CF='-D__CHECK_ENDIAN__' W=1 net/ipv4/tcp_input.o net/ipv4/tcp_output.o net/ipv4/tcp_minisocks.o net/ipv4/tcp.o`
- `make SPHINXDIRS='networking/net_cachelines' htmldocs`
- `make -j8 vmlinux bzImage modules`
- `make -C tools/testing/selftests/net/tcp_ao -j8`
- `make -C tools/testing/selftests/net/mptcp -j8`
- `packetdrill --dry_run` for `tcp_rcv_toobig.pkt` and
  `tcp_rcv_toobig_default.pkt`
- `virtme-run` guest pass for both packetdrill tests
- feature-enabled guest pass for `restore_ipv4`, `self-connect_ipv4`, and
  `mptcp_sockopt.sh`

Thanks,
Wesley

---
base-commit: 908c344d5cfa0ee6efb3226d22ea661e078ebfa0
-- 
2.43.0

