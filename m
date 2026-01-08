Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DD11F8723
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 00:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767833924; cv=none; b=tid6dGFjdDQNkzxLeo5cHqO+MNmAhG5l6sKgt9fXyDbhMjHK7v7RCEBsb0gCzah6Ea3udHlHFYBnP35IO983xP3+yT+qxSXhYFrgEnfAoLhnvi39zyD1ca0CSk4OHMZw/EFJfTerX4o4+rjBydsv+zZqrxKHfV/b84Gfv5M6cqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767833924; c=relaxed/simple;
	bh=yEzJ3QFqJEMOCSgYnwJO8nTuZMKBVcvq+HA+PHxU/yo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WDKUrKYYd++xPPB3Lc2NwkwHiAG8TdOl9ShRD3kOUj9SsFWSj4k5fTc3eJF8BRghcRn2P22GmqrBuv7BWDpdDbDvoxxsPlcUpaY8DBRCHjpy2pIgIe/idBWkAa4VZQZz2rr7278B9XNWkim9hdOiWbeRORu7HaXs/jPPNQLV3sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqWmDDEP; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqWmDDEP"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-790ac42fd00so22313417b3.3
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 16:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767833921; x=1768438721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxcwUUyeLF3N634r0h3gWr//mt0sjdpsyX6Na76fXWE=;
        b=gqWmDDEPzvDw3i1jVToG2tazNKarZJzsS929m/vevyyO7dcoGz5fxgkB+PY1Yr6aFO
         PtmkGLadnFUCuZHsio/RIpTDJC+aArfNi/37oTJ1PPnt7kB+UKZeTwJY40OuKwvLvKni
         vCF2NL3X6p2Uqkoxm3E8E+H3qhHci6WEnU3lz6oPWxi5xDR4DPsXVYM2i9nvnb6reuYI
         OKo4oOHfujsv/8YNwfR5XzMpRu8QS96/adf9n7s1tbhVbtfISj12s14WvRhO+J/oZZ+T
         Lc3NivwqQyZhaiO609f/s1CIO8gaEUqJ50DY9tyy8rF3cZX6DYm+mt7u9qewqVN8RhhD
         +I8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767833921; x=1768438721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lxcwUUyeLF3N634r0h3gWr//mt0sjdpsyX6Na76fXWE=;
        b=r8qizh6xbpCWcwOq65PGJCZMmzygH8qMerlflmlX6hdOf+cdW6wUq59gv+cW4UM8BE
         GTu8gsQcysV0d3h0G7ExSxL+TUmo/Oj+oZjw55E3Khw+icsas7u1lOiRnBa6eedxWX31
         ID0mtaBu7qVNjcJirccbtzoyQcp5NBlHVcz0DWeNAz1QxV4/f0xjJJ3PdG/V6Ak1Jxd7
         2FxYnwGF9DeA/Fq6x5KTxwBrGAn/XUaTkRUV/Zt8EIAyjw3wy10ocYJ04mm5SyxX6U0P
         Lu7b9dnRgSIgVycOBdhawl+JHGw5aq+EQaKMWJ21EiRm5i2xDZiAapAzhJzr1YhZvK+A
         Bk0A==
X-Forwarded-Encrypted: i=1; AJvYcCWu1aLgw190RT7Bkvt7sH4bsDyX9lE8ZYEeaqPg7PwInDTWICSI0XNJNxlq8ZoUyI5U0qp/uw5OLLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS/kRu+jvi7C78jBk3GF7eb0dNsL8mswv2CXzZYO7NAhIl1sqO
	MJiwYGGXfjrDg+Oqq08Hd/5K4sB26/lPyGAbnUlpqdLPY7umkAsL93Iu
X-Gm-Gg: AY/fxX5MTSm+2f+Jp8QQ2/6zHTPfjzMCl2NWGSIynIwCbTQhj1xfndkf/+gMMa3aUpi
	Xfv41HBy7zsbzkoRUdS/gFrDF9XU6+dMZccpG7ilnivnuh3M7H5ABL+7lS2gTs9TJBGR8HP7OmY
	LbdhzExzs5R47QcXhx5QIqWKSRUAyBMYuH3nCTk058MHTLmnxNXGU3GmzsQ8Uu16ZvOH0orF7WR
	gfi2ydQ20JWN4b9yPx00sK0vK7qiH+hXAFWHIPGl3wkyEFnkgvQ4WmxelWANyCbc/bRTxTHyFXn
	xAwcHTyy+HIwjCXfMsN5mHCxYhdd8zKVg4l4XqiZkJOdhccF5GVXmd+bWzNssd3KvfVIn8nYBKD
	8FfUthOOPftVRsXlsSJCqxojpDn1NeuQ0vp3Z1m/HfjNy6d1Bx+yp8cLCGEYwJoQRrgjLdQE+Ek
	bGPBDHO9BjzatEZAWT8b7G
X-Google-Smtp-Source: AGHT+IFHk0bBnJUnAJm0mlyVWIOTUg1tPnVZCbcNGWEk8FS2m/HgVqpWwGTUKe/5Fp4+/MYhz2UfHg==
X-Received: by 2002:a05:690c:4910:b0:78f:bede:57c0 with SMTP id 00721157ae682-790b5758118mr90008177b3.23.1767833921038;
        Wed, 07 Jan 2026 16:58:41 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:44::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6470d89d4c9sm2728934d50.14.2026.01.07.16.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 16:58:40 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 07 Jan 2026 16:57:36 -0800
Subject: [PATCH net-next v8 2/5] net: devmem: refactor sock_devmem_dontneed
 for autorelease split
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-scratch-bobbyeshleman-devmem-tcp-token-upstream-v8-2-92c968631496@meta.com>
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

Refactor sock_devmem_dontneed() in preparation for supporting both
autorelease and manual token release modes.

Split the function into two parts:
- sock_devmem_dontneed(): handles input validation, token allocation,
  and copying from userspace
- sock_devmem_dontneed_autorelease(): performs the actual token release
  via xarray lookup and page pool put

This separation allows a future commit to add a parallel
sock_devmem_dontneed_manual_release() function that uses a different
token tracking mechanism (per-niov reference counting) without
duplicating the input validation logic.

The refactoring is purely mechanical with no functional change. Only
intended to minimize the noise in subsequent patches.

Reviewed-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 net/core/sock.c | 52 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index 45c98bf524b2..a5932719b191 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1082,30 +1082,13 @@ static int sock_reserve_memory(struct sock *sk, int bytes)
 #define MAX_DONTNEED_FRAGS 1024
 
 static noinline_for_stack int
-sock_devmem_dontneed(struct sock *sk, sockptr_t optval, unsigned int optlen)
+sock_devmem_dontneed_autorelease(struct sock *sk, struct dmabuf_token *tokens,
+				 unsigned int num_tokens)
 {
-	unsigned int num_tokens, i, j, k, netmem_num = 0;
-	struct dmabuf_token *tokens;
+	unsigned int i, j, k, netmem_num = 0;
 	int ret = 0, num_frags = 0;
 	netmem_ref netmems[16];
 
-	if (!sk_is_tcp(sk))
-		return -EBADF;
-
-	if (optlen % sizeof(*tokens) ||
-	    optlen > sizeof(*tokens) * MAX_DONTNEED_TOKENS)
-		return -EINVAL;
-
-	num_tokens = optlen / sizeof(*tokens);
-	tokens = kvmalloc_array(num_tokens, sizeof(*tokens), GFP_KERNEL);
-	if (!tokens)
-		return -ENOMEM;
-
-	if (copy_from_sockptr(tokens, optval, optlen)) {
-		kvfree(tokens);
-		return -EFAULT;
-	}
-
 	xa_lock_bh(&sk->sk_user_frags);
 	for (i = 0; i < num_tokens; i++) {
 		for (j = 0; j < tokens[i].token_count; j++) {
@@ -1135,6 +1118,35 @@ sock_devmem_dontneed(struct sock *sk, sockptr_t optval, unsigned int optlen)
 	for (k = 0; k < netmem_num; k++)
 		WARN_ON_ONCE(!napi_pp_put_page(netmems[k]));
 
+	return ret;
+}
+
+static noinline_for_stack int
+sock_devmem_dontneed(struct sock *sk, sockptr_t optval, unsigned int optlen)
+{
+	struct dmabuf_token *tokens;
+	unsigned int num_tokens;
+	int ret;
+
+	if (!sk_is_tcp(sk))
+		return -EBADF;
+
+	if (optlen % sizeof(*tokens) ||
+	    optlen > sizeof(*tokens) * MAX_DONTNEED_TOKENS)
+		return -EINVAL;
+
+	num_tokens = optlen / sizeof(*tokens);
+	tokens = kvmalloc_array(num_tokens, sizeof(*tokens), GFP_KERNEL);
+	if (!tokens)
+		return -ENOMEM;
+
+	if (copy_from_sockptr(tokens, optval, optlen)) {
+		kvfree(tokens);
+		return -EFAULT;
+	}
+
+	ret = sock_devmem_dontneed_autorelease(sk, tokens, num_tokens);
+
 	kvfree(tokens);
 	return ret;
 }

-- 
2.47.3

