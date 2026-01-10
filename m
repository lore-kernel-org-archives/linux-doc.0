Received: from mail-yx1-f67.google.com (mail-yx1-f67.google.com [74.125.224.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113F1263C7F
	for <linux-doc@vger.kernel.org>; Sat, 10 Jan 2026 02:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768011551; cv=none; b=q4f4DEBAz65lgfudjobwLBGw8e2Oz0LN741W/Kq8pyhngrvhCnT65XE5rKQhOKkElwFZyHiQXdfkcgZdkrSdxuPz/Ix71gKKQauMC0ckVswtVum318ld6dSKpcyqZewup4oXA6edTGvd7hrvyOQbvv/BXRHjBDElorvQ/c39Xtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768011551; c=relaxed/simple;
	bh=6tucM9ZQ59G0xrDfMuItsfF1GTt7N8xzYil/t1gA1PQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lNzZjok8WQ9hy4MnHYKA/i/ILcHW5x9OACEJkAtKPFtV79x/P8vFtjqPtJciIR0IK1pJJQHGZBHi1WAU8kzj3/MKygZewG8VWOl/oAc9uUDa3oWzXSMJcQIg48+WgQVt9GeWlYFbkUaN/zUo8bZiuUEAEDFV2gAhYyzoJrZVy+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRZ//9XF; arc=none smtp.client-ip=74.125.224.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRZ//9XF"
Received: by mail-yx1-f67.google.com with SMTP id 956f58d0204a3-6446c1a7a1cso4213889d50.3
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 18:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768011544; x=1768616344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXRdbOnUYiudn9GxHVVfvuR3By+3aRth8g9ruHEmquY=;
        b=RRZ//9XFWutooYFdB4GTmpzjV5zZXDbguHHvTNrat3+JjePN7DsXSBz2YEoc1sBUNr
         CWu19+T0PsjbWWn41lO6qbwbaQCFgEKUdQZRxI6vEVYheN8zDQV/QhDWt1gK53qaLMxV
         wBg6p4gCF9VZK3tj0a7cQ2ddG+jgbuShYTP4Ijfwm9A1A7+pU9pml2geDMy4xT0YWuZG
         BqjWeoJXTdjafCZrbOD/GX980Rkv6SR8HuaMHHTTdDLCdIlDx+KBx2QN4XIEAeFvTfW7
         5usfQLENdof2Bu2Z7IWiVc121bGmVIZb6qnKORdhNx18h83RXKnRXKU7JJn4RmFRM0vI
         zrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768011544; x=1768616344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DXRdbOnUYiudn9GxHVVfvuR3By+3aRth8g9ruHEmquY=;
        b=Z/N+g3Dr7UBi8jQSRyMJ2qAZX4wqyPiH+5bc+wE9FsV3vyuPAkDmFneXFZs4d/2u5l
         zlaJ7413btP0sGPO2nXn0VYjYUMrsjnNuXdbesjcZ/9RsFqGGMi4eZCIig8m/ErK1/ML
         OJKAqTPH2tJ0QnIYtsgMrmKh+5t6G4W1Pll6FRC6gyUr1zWzqazjRDLXfIrHCbUchRm1
         fkeDE1NpMokL4Ngs/14CsvcYMhsLxkGtvXMC+Z85QqFdLFvQ4oSqsXxt593KKFsQN855
         vyWURQmtXjnhYOuq6Ya3LfQHFIGPjoazrNdjnnia/3Cjkt3YubD8OO+xBbFrLiMrksNn
         ZMwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW+Z2OvAuAIPuke+ZJHGKiaAItuawsBzJCeKl82f0OIS3oLlnD8Q9nKclqSMTWOH1t4nSZF9UDGB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHohTZ2Fb96eCZzJQ9vF3w6YnI8Hp2B1CJl9kZAFAnOhF3/JTw
	Ullf2tSvqLgbwCvqg+TwIN93Gb1unmiIPmjtcclv2/9dDHjSGyUkUfj8
X-Gm-Gg: AY/fxX4bOTM3f4OS/nXFm2R93+wxo3TbDxc1iT3Xt49Pj+fF4hq++14gzMZPWY9yRBx
	3nWak+aM/AyjgsUCZsWKz1+v3ybQs7CfkQfjOkN5Tk6GKQFxITvTF7MKYHJqM6A8VGRJGZg4FmA
	9Vlnn2rGpoM5CMLhabNVVHqM13CpxIdNtFAWuvMrM2AIbCpPBVzzrYO0vB4x+4Tva18uBxdI2zA
	cfYGCKmnBP8ilOviCUWn6i87BF9ldU7iSDncWCKlJNy9e9hvmC2UBpExK6lvR99iiwZRqJgXxGZ
	sGFOtbXXof4XE2TVqsmNSEshA/NxVLGMM26zezE9kSzFAMvxOgnPgAyXavrK6RmAOBnneNPNkcN
	rVWddLbUSmellswvBew3N++OEkOH6Gszc/uK/hUAmvyY6rhv4OhPJjPXlLe3C2Ap7h452s8hyZE
	AESS5oC9qaPw==
X-Google-Smtp-Source: AGHT+IGzRizbGlIsAZwDp+VnMT+8idkBjcUWkmHJRYK1pkT2bOkNYQhUeyud4a1V268OgPfep68gmw==
X-Received: by 2002:a05:690e:400a:b0:646:a3cf:a2e8 with SMTP id 956f58d0204a3-64716ba374amr9762926d50.40.1768011543796;
        Fri, 09 Jan 2026 18:19:03 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:53::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa672725sm47421447b3.34.2026.01.09.18.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 18:19:03 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Fri, 09 Jan 2026 18:18:18 -0800
Subject: [PATCH net-next v9 4/5] net: devmem: document
 NETDEV_A_DMABUF_AUTORELEASE netlink attribute
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-scratch-bobbyeshleman-devmem-tcp-token-upstream-v9-4-8042930d00d7@meta.com>
References: <20260109-scratch-bobbyeshleman-devmem-tcp-token-upstream-v9-0-8042930d00d7@meta.com>
In-Reply-To: <20260109-scratch-bobbyeshleman-devmem-tcp-token-upstream-v9-0-8042930d00d7@meta.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>, Neal Cardwell <ncardwell@google.com>, 
 David Ahern <dsahern@kernel.org>, Mina Almasry <almasrymina@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
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

