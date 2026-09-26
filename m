Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E8533CEA7
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 01:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386102; cv=none; b=igOc76xtLlBkRmO8laHIpWKD4+peDMIw85T2W0po5wueKvU12VAYVKbhx+4K0XnUCBQSv7GUd+Z2TwbjFZ3qaNMQB9lXOmviFKwTr8WD7/QjkgTZmF3/0CUZbqotAFhxY+cYruOZGLxgOgaTjFPt194rFTIIoI49LF+rhRx32z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386102; c=relaxed/simple;
	bh=8f074t0PhW4bKYmSqUt9X0UaX6qttBGQDYhsJlTCgsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tsH/U/JRoiRikKVJGl3jYTfFY536VgeI9Rb9B4SilMWZKi9SCdVZxUDiLzwTw4zZz6WXlBEXpMU7AYEBC1VXZLjIzV5p5NzHSAEde6t2EEC9yWxjt8dovr7S5W+P/OpX+UmG0pNH5m9SElrvMceXvE+QcxglYbgD6asLCsfadeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yg50hycZ; arc=none smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg50hycZ"
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-805440319deso940450a34.2
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 18:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386099; x=1790990899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ceesP0p9wSFk3r7eOvCPcEnEaxwgQZImuOn8nzfUzVI=;
        b=Yg50hycZffOpgymx+oaSY4I4ygK9OwVQCjcJNRBj4JhEUcXMwyIyceQxh2/hXs0MuF
         bH4uwOVEG+lv31cUsUF82cDxVYC4GLtL7LTmKqhUG/RPrPIF+yXS4sP+wVm859Kn/Pw+
         Mqv2FB9w/Ok12hCiQYscB1MtLoJtH6L+oNXrkEh/N+cYu6pe9HYe0qzNb/dX2q9SI+XW
         kMG1e4ttOwgexa6st3D07KOKArt3KOVwfr9Jv0xZUTxSlubk1c0VK75qD/DuNBozRMYj
         1ctwIcqcAgjNjMw07ZDXgjsFXYph0Zy1re9mwF83KRvBYa/af1DK8L1kiGgh+PY/rx8i
         JdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386099; x=1790990899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ceesP0p9wSFk3r7eOvCPcEnEaxwgQZImuOn8nzfUzVI=;
        b=26bHGVsm8liU1xI8OoxocXoh/Jvcj/jE3GdoccbR23Q61PfvsRw0nQw9KtlzWk6pA8
         GKulSRH38ah6LFd50mguocmf/Kjr80YWTuRy3N9KoDxwWK2Rnk4/J2/xrk/TIcTRPFIC
         9z38i8wJeDOmpulnPeuDCrHxpg/rT+wLaQhC4wJSm7V/d/JoUJ8MadZf3JxNBt/6sECs
         /RfxfBvrXy9Pv0L8kvACUgx+xbbSTc+ssNd0pm2yZuVe8sEaSmKsqUVeFaQpppD7ZhVG
         1mi51Z81sR+Kbj5+v8f0vGAzXJTmiEab9V05ShxA6nMpgtI6Xcu+n/VmwcWqhTTV4+8Y
         4+9w==
X-Forwarded-Encrypted: i=1; AKwUvBzyvfxeQRwbAzgLFOs9Nr9qeB9jnOP90HxtwzmLXGASj4qfiDjraV6pXF+EJF7qjIzqOXDhmsNR+Yk=@vger.kernel.org
X-Gm-Message-State: AFuF++kp4ldAB9tqSM1TZKNyLEQ3x7C9bMbt2Y1ODR5qwYUOLjt62FaI
	c8h2RIPx1dymK6u7UXSjP0z314DoRYS709vS+6vj7L5mFB/1eppjBNMx
X-Gm-Gg: AYBFou0ZNJfgex4W3/Ul0uNGp3kmZjtPIBLRD4mRfYy3Uc70BTH/ofchrNmQH+nL57Y
	oqh88ZPMRz0aNsNIiSAEioalqH8hMIYouEUJcGH58/qKHRhBEIP2g7aMOkWiLT/jSzYrR6bdLQ2
	BZKxOUi6a4CFWRMy/9YOlwv01bhL6n0apum8Gm1Jn4wzUubYQN4L47UYRSu1hH3gHR5qAFDlqu7
	kn+xVfkIR+BR/ySSEO8RJ9bCw13gDOdL1IhM52blLIDL0mrPo4K0DNtBHzDSA/WDacRXFRJ176Q
	hP77TbFTdWswdXFqqvbQzGH1nD/11TTZkWJ8tSbCWfajXbh8OOs77bvI/xWMb6OFal8uRY2QGuX
	n4M+jF+0a6rn2rA4EL9gAgT03TxPn60MmNxYN0FDXB7i81x7Y9jZC81Ca6aLbyubIQNjdM2kv6V
	TJVKzObzwLoOcpC2NFYL5yphRI4eryOG7TRhl89QF2iQUIl9+5dknty9VUcUzWapx28O4Z
X-Received: by 2002:a05:6830:dc5:b0:7f4:d1aa:2f32 with SMTP id 46e09a7af769-81782c8976amr9142398a34.11.1790386099697;
        Fri, 25 Sep 2026 18:28:19 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e814ac66sm4210989a34.5.2026.09.25.18.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:28:18 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 25 Sep 2026 18:27:59 -0700
Subject: [PATCH net-next 4/4] selftests: drv-net: psp: test that assocs
 require an established socket
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-psp-defeat-v1-4-9f0b430107aa@gmail.com>
References: <20260925-psp-defeat-v1-0-9f0b430107aa@gmail.com>
In-Reply-To: <20260925-psp-defeat-v1-0-9f0b430107aa@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13.0

Cover the three ways a PSP association could previously be installed on a
socket with no connection behind it: an unconnected socket, a listener,
and a socket whose connection has already started to go away.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 tools/testing/selftests/drivers/net/psp.py | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 0a2329f41431..6b761c981c6b 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -319,6 +319,49 @@ def assoc_sk_only_unconn(cfg):
         ksft_eq(the_exception.nl_msg.error, -errno.EINVAL)
 
 
+def assoc_rx_unconnected(cfg):
+    """ Test that an Rx assoc is rejected on an unconnected socket """
+    _init_psp_dev(cfg)
+
+    with socket.socket(socket.AF_INET6, socket.SOCK_STREAM) as s:
+        with ksft_raises(NlError) as cm:
+            cfg.pspnl.rx_assoc({"version": 0,
+                                "dev-id": cfg.psp_dev_id,
+                                "sock-fd": s.fileno()})
+        ksft_eq(cm.exception.nl_msg.error, -errno.ENOTCONN)
+        ksft_eq(cm.exception.nl_msg.extack['bad-attr'], ".sock-fd")
+
+
+def assoc_rx_listener(cfg):
+    """ Test that an Rx assoc is rejected on a listening socket """
+    _init_psp_dev(cfg)
+
+    with socket.create_server(("localhost", 0)) as s:
+        with ksft_raises(NlError) as cm:
+            cfg.pspnl.rx_assoc({"version": 0,
+                                "dev-id": cfg.psp_dev_id,
+                                "sock-fd": s.fileno()})
+        ksft_eq(cm.exception.nl_msg.error, -errno.ENOTCONN)
+        ksft_eq(cm.exception.nl_msg.extack['bad-attr'], ".sock-fd")
+
+
+def assoc_tx_non_established(cfg):
+    """ Test that a Tx assoc is rejected in a post established state after shutdown """
+    _init_psp_dev(cfg)
+
+    with _make_lo_conn() as s:
+        assoc = cfg.pspnl.rx_assoc({"version": 0,
+                                    "dev-id": cfg.psp_dev_id,
+                                    "sock-fd": s.fileno()})
+        s.shutdown(socket.SHUT_WR)
+        with ksft_raises(NlError) as cm:
+            cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
+                                "version": 0,
+                                "tx-key": assoc['rx-key'],
+                                "sock-fd": s.fileno()})
+        ksft_eq(cm.exception.nl_msg.error, -errno.ENOTCONN)
+
+
 def assoc_version_mismatch(cfg):
     """ Test creating associations where Rx and Tx PSP versions do not match """
     _init_psp_dev(cfg)

-- 
2.52.0

