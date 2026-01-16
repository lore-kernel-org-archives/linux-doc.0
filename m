Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D742834BA24
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 05:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768539808; cv=none; b=QnfbhGt/qZbKARVzKSKTXnv9RkSObBn7Yn9Sys4Td2S02DpMWTz0dXZMuhehAY8AWFcNYJWochC6C9OE2I7Lp/cSCRY1G30jt6wCoxKbvT1fv9v8CviB1rHfMWer2xF/pnkXZH+8Ayc5Eum9iXQiyCJAK49LFt++oTgrHjKHqzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768539808; c=relaxed/simple;
	bh=s3BhnRo4qYeui2ODW6ff8S6N7tSfK9I74K29oR3s67M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/8L8NRKVtZJuqP+ww65wdQAwIaWNtItPmRnLDaCdgP9CoO+2wUo/6tMnz30PVxP6UDI8DY7/wzQXg/0nOmw3FEcaY8aL9P86qHFvP5ogcXvopQn6PQ35ue1+IpbxlVvbgXVGhMCid9JxPgrUnNTRC0Q70Wzf7wY0kKcvxLTN/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJvglZt2; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJvglZt2"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-78d6a3c3b77so30750417b3.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 21:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768539801; x=1769144601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+I56CVp15hcfRzFNLZYMGassuBp58/sVTYq1ymlLks=;
        b=BJvglZt2EHUWZv3P2Z5dXbAAF5ohuFFr0vlbMVfB/ewM9z6S95XtSXAU5S+hjlaneV
         w6mNPh2RPODTngH1nCrwsSNqIzeZ/KQMfZc9+jNlrV9Gag06Koqafxzs6V7EB83c65S7
         0iXs95woS82onCi+0K70TfBTZ8ngPh0vf5oOzLfA3f26SiuG0UPg1zkX7TvqmvnL8Z9s
         oUgiQGYSaCkYc2zwzFHkvA3AIvXPHp433pPVg754O7vUElhH3oJiiER6widNMLlwIEy0
         Iej+iKBAofWwGA0pR8ky/DzgrFzk++1p3TlOAUsUC2N3/lzrMbfi0CanUZ7H7CWDg1Jh
         UvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768539801; x=1769144601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K+I56CVp15hcfRzFNLZYMGassuBp58/sVTYq1ymlLks=;
        b=BcedPJ3ChKzEAoivbxQDKvNMUnotrvX+TimvfGYLDgHHuWdPhpItxx5KQORsCr/9bE
         hhFLMZ3FQADdhnVj6wmIcI7jV7yNH1bxLUl/bm++jcFwHXfu+c+kYZc0bQ8xNX8gvEsm
         ndKHQMggejOkwoXwxS+uuy/xND5oDb2RFUA08mYoCrxbCYARJe/XbJObgoRKkHrEW/Hn
         g6EyZY8hSyVYQ9y58NhXeD7MpWTJihy2tw7qZaV+uKYHuw5UJ4pKFbRKcZJyy6qdPTmV
         1iMCqLawEupv1DP1qgX1Dvo6lU/HqyY9MelU479JMZ35BUF4UkWujpz1A41+e1RXRU6Y
         ixYg==
X-Forwarded-Encrypted: i=1; AJvYcCX7035DD52ztqgky9MVyvgcMGSVMCbTmmhleqRVOiTv9/rznRFRIJTlXr+mLC014xknKl1ZhLpuKhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPhsGuTSnf368anIpL2ye4YQ4dOuqpC0c35CBjbBuAJiixDqkD
	xgeNhWo2N9/vwvM2/7xf0cXb1BFUxGxPJlSCI5NooKQ2LJiF8n48PLF4
X-Gm-Gg: AY/fxX79qI0kJzRcT2Kz58k0lMyTKyNl881GJiMSqvlp6d4LGgtUT6NRrGB9JNLnl0v
	5qnJ0QYsaCJRGHZwYOTk7pdSf/7Iheg3fFCVZnsUqkT9NT4Vm/BRFcNLncdGtnwovLax5FTBrbE
	NvcXsIrFKSotlpd8Ec9EaPWLkZkrpSCHp7MdcOOGdBUIAVZnlLhgUVxTB09GudKduWCMC5bEQ5X
	a84dmB12XmmAn2j0lMqwZQb5luKn1whI7FdhtKYSOOyBHWKUe+R5/iiRjDlaiFZYxRK3Bn4tKOc
	AJkUuzYdsK8Jw3WqE0MdLVDscRIlNiGY/5png41/1EWutwXaQ00byHDndggu1ZRCwAhC8L3G77n
	V27GOmXjnq6/YmtbheHyIdURx1brKYpd5tfmPvlmUkQaYm0To6zm4c4XnWxjx0Ah8+jwk0adBhH
	Uc5dsKE7PC
X-Received: by 2002:a53:ac89:0:b0:645:5ac1:8ca with SMTP id 956f58d0204a3-6491691b79amr1489058d50.11.1768539800827;
        Thu, 15 Jan 2026 21:03:20 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:c::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649170be5desm713936d50.19.2026.01.15.21.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 21:03:20 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Thu, 15 Jan 2026 21:02:15 -0800
Subject: [PATCH net-next v10 4/5] net: devmem: document
 NETDEV_A_DMABUF_AUTORELEASE netlink attribute
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-4-686d0af71978@meta.com>
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
In-Reply-To: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
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
 Documentation/networking/devmem.rst | 73 +++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/networking/devmem.rst b/Documentation/networking/devmem.rst
index a6cd7236bfbd..f85f1dcc9621 100644
--- a/Documentation/networking/devmem.rst
+++ b/Documentation/networking/devmem.rst
@@ -235,6 +235,79 @@ can be less than the tokens provided by the user in case of:
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
+- Outstanding tokens are only released when all RX queues are unbound AND all
+  sockets that called recvmsg() are closed
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
+will remain pinned until all RX queues are unbound AND all sockets that called
+recvmsg() are closed.
+
+
+Caveats
+~~~~~~~
+
+- Once a system-wide autorelease mode is selected (via the first binding),
+  all subsequent bindings must use the same mode. Attempts to create bindings
+  with a different mode will be rejected with -EBUSY.
+
+- Applications using manual release mode (autorelease=0) must ensure all tokens
+  are returned via SO_DEVMEM_DONTNEED before socket close to avoid resource
+  leaks during the lifetime of the dmabuf binding. Tokens not released before
+  close() will only be freed when all RX queues are unbound AND all sockets
+  that called recvmsg() are closed.
+
+
 TX Interface
 ============
 

-- 
2.47.3

