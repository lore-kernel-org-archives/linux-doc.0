Received: from mail-yx1-f66.google.com (mail-yx1-f66.google.com [74.125.224.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454F51F3FEC
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 00:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767833926; cv=none; b=YAmGMMNC+tzF9Y9rs85BZvCNvTBCsDqev8h040ebcdkaphNMuklKjHd+AlA5jkmeew2w1c5tglBGmic+wlzeue4hlv6820n1QntkglmSkii/XcPrHgW75GXRr9vbsi983hMcvcjRNKiY9ZUqTEYCbZpMWAB5t5rA5TRojN4SXwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767833926; c=relaxed/simple;
	bh=6tucM9ZQ59G0xrDfMuItsfF1GTt7N8xzYil/t1gA1PQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VInFirnMQcn6Td1osc+sp8iNJMk/Uka9ajrujGjmNa++uL4Ghb16c40deLGyMDEyeqY1+NLrNzOO2x1Ex/2OmyUaMsI8iFxJho6QYuLz0t+3RYhSwTMgFDKn7EEUQncXIoVdIGtKuBDUBUyrfWU9a0ZSVjUY6vEOIWPsEc0eiek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2QjA1Ek; arc=none smtp.client-ip=74.125.224.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2QjA1Ek"
Received: by mail-yx1-f66.google.com with SMTP id 956f58d0204a3-6455a60c12bso2582717d50.3
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 16:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767833923; x=1768438723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXRdbOnUYiudn9GxHVVfvuR3By+3aRth8g9ruHEmquY=;
        b=l2QjA1Ekya05GYHt01OxB2dyZAG1P5dMJwxi9qkXuZgkJOHcTH+LwfxBKo6PjaRmFr
         orpLTsra1X/PwHcIkfIUXSCKM9yGMtNWiRbk7AJEnT/cICaHlAe7on3rAMNtFrspKCDP
         HkLEy09D9hE7YbQWA1D+KBiobO3sAD8vZOqksl4Ed1ZxFC1spnitG4746M+oXJUOtGef
         Mfvgs5ki/n27Ejv2qoeB29W7ZTHniI27cZP9lE1S9OG0H9aPvvUsbPy3zD7pOxPvV8UT
         Xlw1cQ03tmZjfvDGPBBT6w7QzdBzsX+Nf8UQ+wDk0S4adMXN6XDS+8UCmb+rMLMCIi19
         KPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767833923; x=1768438723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DXRdbOnUYiudn9GxHVVfvuR3By+3aRth8g9ruHEmquY=;
        b=ITZEDDqgl4Mq+SW4QcP2vh8tX4Dlmfl8ueMg0/vjFDcXdXfV+Ei04SpqvfmcAeNbCM
         MxahTTQfmpxqHBkOvosdJTYEdA48js5PAHzMx855qJYE7mDp7nWYnjR6smYC0ekGUvZa
         uHVX3+aq/BG7RF/O4xogYFSzVDcAbQlCLzGOh63lP19GEWdxsYr/61Ucg4oBmGluksN2
         dUqTC+XiuoRLk6vMSB6FJmHR5xYPzWHST39DPS1xI1IO+l6lT0NP0DaODE/mMbQp9or0
         FJpRNSXXC2qO4NfQmn7cBuKvKvhOL+UcHpMr1wEg2Ve7Hvgn3tdugBXxwIMD1jR3K92u
         nTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIXjumi3l9pxh1NSd38jULlt3vCP6bucqlrMQwpbmkiRy7JfYQaOxwBWtLZyht9jdmiFzRlSv34hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBfeHtWnragWEGGZESz7t6tZIPQ0Ki+I6zpcsZBkz9cmaOuwXW
	9da9GL319kOF6GOmgPt9EHJDkiCLGduPNJD9JMTBiF14jT9GvZCWNjzf
X-Gm-Gg: AY/fxX7TmVu3zkaOL4cuTewX14e4k+32hl+71/r3C3P3CyOENv2IepJgxn0R1J79RR4
	sYlynyrYlbgeQfiv5BUkoK87ATelB3PR5V9Y8lSki3pAXgfEbxz3yHe7PejV+YGuw/k/1wTosKJ
	RxxmWWJX1pPTVwOGAzQcHo4YQDysxltYMVGkmqqcR3U3RLIxK7ABA5+Gfsy6lZKRwI31OrTXrEb
	v1ug039t1IYPwV2zHM1XyxgVxjlh/32KlS1iMYLhv6XhE0kCQeJxKAfwtu92+4A0rQYu4Yh5ItO
	LajzpnhrpKGoasgxmacuLLUP8lBIKDw3Y1+lyMP9zeMcrzpEEC8V9CthNmzcyL2nGRX1Z587gAG
	EWDIRq8ApGzYZ0kyBaTyKlCMmB6NVGOjO7t7xpD/+hujyVEaU6gMd0sD/yH5hkcQQqIwc+FIuxK
	zbRauKLNKt
X-Google-Smtp-Source: AGHT+IGSZsqPA4Z0otbmZ3NOTLwk4921dfCJ5SicHC0H7KIg1eX7bEw/y3LBIJTZ2PC9nnY65wqkaQ==
X-Received: by 2002:a05:690e:419a:b0:63f:ba88:e905 with SMTP id 956f58d0204a3-64716b99817mr4126568d50.30.1767833922740;
        Wed, 07 Jan 2026 16:58:42 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:4::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6470d89d510sm2724820d50.16.2026.01.07.16.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 16:58:42 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 07 Jan 2026 16:57:38 -0800
Subject: [PATCH net-next v8 4/5] net: devmem: document
 NETDEV_A_DMABUF_AUTORELEASE netlink attribute
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-scratch-bobbyeshleman-devmem-tcp-token-upstream-v8-4-92c968631496@meta.com>
References: <20260107-scratch-bobbyeshleman-devmem-tcp-token-upstream-v8-0-92c968631496@meta.com>
In-Reply-To: <20260107-scratch-bobbyeshleman-devmem-tcp-token-upstream-v8-0-92c968631496@meta.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>, Neal Cardwell <ncardwell@google.com>, 
 David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Shuah Khan <shuah@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
 Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Stanislav Fomichev <sdf@fomichev.me>, 
 asml.silence@gmail.com, matttbe@kernel.org, skhawaja@google.com, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Update devmem.rst documentation to describe the autorelease netlink
attribute used during RX dmabuf binding.

The autorelease attribute is specified at bind-time via the netlink API
(NETDEV_CMD_BIND_RX) and controls what happens to outstanding tokens
when the socket closes.

Document the two token release modes (automatic vs manual), how to
configure the binding for autorelease, the perf benefits, new caveats
and restrictions, and the way the mode is enforced system-wide.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Changes in v7:
- Document netlink instead of sockopt
- Mention system-wide locked to one mode
---
 Documentation/networking/devmem.rst | 70 +++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/networking/devmem.rst b/Documentation/networking/devmem.rst
index a6cd7236bfbd..67c63bc5a7ae 100644
--- a/Documentation/networking/devmem.rst
+++ b/Documentation/networking/devmem.rst
@@ -235,6 +235,76 @@ can be less than the tokens provided by the user in case of:
 (a) an internal kernel leak bug.
 (b) the user passed more than 1024 frags.
 
+
+Autorelease Control
+~~~~~~~~~~~~~~~~~~~
+
+The autorelease mode controls what happens to outstanding tokens (tokens not
+released via SO_DEVMEM_DONTNEED) when the socket closes. Autorelease is
+configured per-binding at binding creation time via the netlink API::
+
+	struct netdev_bind_rx_req *req;
+	struct netdev_bind_rx_rsp *rsp;
+	struct ynl_sock *ys;
+	struct ynl_error yerr;
+
+	ys = ynl_sock_create(&ynl_netdev_family, &yerr);
+
+	req = netdev_bind_rx_req_alloc();
+	netdev_bind_rx_req_set_ifindex(req, ifindex);
+	netdev_bind_rx_req_set_fd(req, dmabuf_fd);
+	netdev_bind_rx_req_set_autorelease(req, 0); /* 0 = manual, 1 = auto */
+	__netdev_bind_rx_req_set_queues(req, queues, n_queues);
+
+	rsp = netdev_bind_rx(ys, req);
+
+	dmabuf_id = rsp->id;
+
+When autorelease is disabled (0):
+
+- Outstanding tokens are NOT released when the socket closes
+- Outstanding tokens are only released when the dmabuf is unbound
+- Provides better performance by eliminating xarray overhead (~13% CPU reduction)
+- Kernel tracks tokens via atomic reference counters in net_iov structures
+
+When autorelease is enabled (1):
+
+- Outstanding tokens are automatically released when the socket closes
+- Backwards compatible behavior
+- Kernel tracks tokens in an xarray per socket
+
+The default is autorelease disabled.
+
+Important: In both modes, applications should call SO_DEVMEM_DONTNEED to
+return tokens as soon as they are done processing. The autorelease setting only
+affects what happens to tokens that are still outstanding when close() is called.
+
+The mode is enforced system-wide. Once a binding is created with a specific
+autorelease mode, all subsequent bindings system-wide must use the same mode.
+
+
+Performance Considerations
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Disabling autorelease provides approximately ~13% CPU utilization improvement
+in RX workloads. That said, applications must ensure all tokens are released
+via SO_DEVMEM_DONTNEED before closing the socket, otherwise the backing pages
+will remain pinned until the dmabuf is unbound.
+
+
+Caveats
+~~~~~~~
+
+- Once a system-wide autorelease mode is selected (via the first binding),
+  all subsequent bindings must use the same mode. Attempts to create bindings
+  with a different mode will be rejected with -EINVAL.
+
+- Applications using manual release mode (autorelease=0) must ensure all tokens
+  are returned via SO_DEVMEM_DONTNEED before socket close to avoid resource
+  leaks during the lifetime of the dmabuf binding. Tokens not released before
+  close() will only be freed when the dmabuf is unbound.
+
+
 TX Interface
 ============
 

-- 
2.47.3

