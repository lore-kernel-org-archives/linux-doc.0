Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AA72FF151
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 03:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763609839; cv=none; b=WdcxSa5Lkgf5SJBwmX+FWLF6JA6M1KOcGWzsXpyfMAkb38zNIPit8/wYFt+N9J98oWvz7tNA6NjY1t82LkcH/iaUwsZS6zUQ3DL5Sa0Zdj4NBem6r9FAULzbPT9OtN2tvdnlAt1VfD+xhrWSHvyqJRmWNlubQKuu1n9cMGQ4kJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763609839; c=relaxed/simple;
	bh=6tucM9ZQ59G0xrDfMuItsfF1GTt7N8xzYil/t1gA1PQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rPHlexF7ZvGiNz2NyahDBlfpVqb3DZzgQjKkV1Ra09y4VwTjCDN/vFUgdImFu67bkGmByOH6Oam1BDOjFsEQ78lz51MM3r4TVAzTX/mwg2vIPJpwYYzD8kE+SE7I6gIx2ACnyp+MS8cDHEaDKbhndWfUVv/NNDhAnjRZMI6V+88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G13At/e0; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G13At/e0"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78a76afeff5so4317947b3.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 19:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763609834; x=1764214634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXRdbOnUYiudn9GxHVVfvuR3By+3aRth8g9ruHEmquY=;
        b=G13At/e0ioienxBeW6SQ4+fRmP63PmF11G7gK+KurFlMBg7OkigrTjnVBpsGYN0J0n
         fiCfJ0RsAjB63GZ8//xxoaWEM3ODPdoTvl2NQIr8NVIe1E1Ie2W7lPBWPI8MiJ4v85FL
         VtYKdGz7ogahpf+jJiKYhB3WrjgfPWDKMTyKyU+Gjtvf5MhW+Dsn5060AkHv+MZGwgaQ
         01yL6IYIYcswfHXCVr1uekDjLEwklN5yyOTP/zueoyfuFIi17EYqJBlqpyGTAGJR/bBu
         ueZqnAtGdpdisotGE5eYJKzF6iYTn9pYYZRNS0eQmkUtqlqs79HfOFucgTufrWGJonUH
         5XJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763609834; x=1764214634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DXRdbOnUYiudn9GxHVVfvuR3By+3aRth8g9ruHEmquY=;
        b=OoeX9BI1DHYdvjSXjsgcdJGM97wswZYFVQBca2Sgo1o+z8xXZhFRvOuO0AoP+nQXX2
         QpZNqFSiOkFNOJpSiJeEEnVkuVOw2Cb8tDrB1He54pjNeX9jGzGjJNAKwHciKjBVRDsi
         kmn8nyl+NKVSCVqIMM5X3HjnPQvIm3YZiFycbq3lsUpIdzW9cwpG5Of2JIo5YyvDJG5B
         J+rm9MLr8jfc59x5wzZqAa6kvXYCV3FWm63phemGta5CaPkHKWWRJN1/snewA7xvBL/A
         fPT1D+hb6l2yFjhAndwk7aiT4jd73b3OSe3rz1o8CinBCPMw1PMmUSdHXcQ0634adqAq
         g14Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHDI0J7e7yjirhZmR02LXV3u/c37ysdmgsjCWqeYCp+bha5l666WXs1zkotFG6xcsT0dWPIJsZr8k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5kWcsppgJb54u9E2rSaAti1yB2yLPDMH0p8VeLwVlMgxJCWBN
	0tjdKUbjIoug45zjKctJVClUh1PiOv3hLMGcJ4YGOEJx+HzWg+Xxg0Wu
X-Gm-Gg: ASbGncstNKwj91MaYaySsqqFwv2ubASlB2f/BGzQy6to6NmAgyOZzo1f5QxnwcBEJ0t
	u1zPLn9RF4D5Q6TS6SJ/egCYR4WfkVfVdLOZXAoBtATy/9jYT+O8L0UCjgVoVWr/7AQb/NtF+8V
	1GNlfnoj/rrlZTL3YSCRsD+YS8Uy/xtdpoqzstUkjo/lwgh0L7/bc84ewuq+mDy0j/t5o8Si2Qx
	aR6IBwO6QEhP2rh4/Peod9VigudFON9uOXFbx6VWMdSqjvPLGXyLwjA8oUNvH0pBaRpRhvF05vK
	w1kqIaQsk52DndBCbD+T13kiNvPsvU7nG70syR2rHkg2l1DDJP7qvee0w5HIZ4NxgqHGeR0Eovu
	1x3sYP4wx+U+3og+ZxtmXqWu8W1qvpr39chnzMm3njVX4BEfE9AR45munytetGs3kIWGzqmvPAt
	vZRZz+cBJTSVoPEpvtYr4lDg==
X-Google-Smtp-Source: AGHT+IHc8CUnhbCI562x0BXPS/DRgsQMraAy3qtBr5+up+1mfxjEqc0SEDv6gbxTVE+GeQ4ZI1qCqg==
X-Received: by 2002:a05:690c:b13:b0:787:de81:35c2 with SMTP id 00721157ae682-78a795f89b8mr13892267b3.42.1763609834525;
        Wed, 19 Nov 2025 19:37:14 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:70::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a7993c4e5sm4116457b3.40.2025.11.19.19.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 19:37:14 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 19 Nov 2025 19:37:11 -0800
Subject: [PATCH net-next v7 4/5] net: devmem: document
 NETDEV_A_DMABUF_AUTORELEASE netlink attribute
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-scratch-bobbyeshleman-devmem-tcp-token-upstream-v7-4-1abc8467354c@meta.com>
References: <20251119-scratch-bobbyeshleman-devmem-tcp-token-upstream-v7-0-1abc8467354c@meta.com>
In-Reply-To: <20251119-scratch-bobbyeshleman-devmem-tcp-token-upstream-v7-0-1abc8467354c@meta.com>
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

