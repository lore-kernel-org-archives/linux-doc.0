Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0492EFD8C
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 03:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763609835; cv=none; b=KoLsKH1r5vcPuUmqWiKevTgdBM1tg6Ro1kWmcnykRYmfsl/G6lIpQfrqwaBRDpZKnqw8A5/pJGQW+TEJ5cjEXjmPUs/1Bx51Tq+edlgv+4CxokQlPStiiUmJ8Jw5Zj/2lVaeKz/vsjV90/A4TfPUvkM9iuIvW6UzKyhMBsmIyRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763609835; c=relaxed/simple;
	bh=7/XNyB/QLFMRNjNb6PbYdwSizLyVpMNRusy8wp8n+pw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QOHc4xqDYOkP5kZ26yY4vFAUuJz6CJJu1ZTylrTbwqHjtkr2ZonitU4zp1qbL4DHkUVFqEgXLElwBHJ+fLGIe2X8cbEqpw7PUFg8iHOxU/ViwdTr9HUAPbPOLFeTBVB881ygS/kztmcmdYQnKimhgGd6Em+NZYZM0KS+pNzATMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ioh+t15g; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ioh+t15g"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78802ac2296so4191287b3.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 19:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763609833; x=1764214633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8HPHcTcPHipeEg2J18CsLH7RrVON818AUh8XbynViI=;
        b=Ioh+t15gUP1FCkd+u+1wtNH1+icyAb7TgFSIk6rfTt8t6X0aFy9u4O2fcFE9JddFPl
         Jn7+9ppxCHSLMGhLfmnGvD0Pc27M9EFixc+/7o7JwipbIcFSqE5yN3E2tew3I13gMfSw
         lKl0oBJlk7Y6PCsDwpalzjolzGmPIqOwqqtzcwhI/S8WC6RbONgTw+xdg679Xp1V+CRQ
         pGBMc+qmJsCFrwXKPltmREf2KHIfRQ6SMnHYP39Poff3uTwkJcGAuKWOdFg6opck773v
         JPbvZAXvATsStAp4dqZpFycuBwHvcaCwyajXDdQReAFezniYm7ZELYG6ADsn3rrfK2d3
         PDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763609833; x=1764214633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y8HPHcTcPHipeEg2J18CsLH7RrVON818AUh8XbynViI=;
        b=Dald9PF5T9y0VhBQ27yhiAZ3iydMxaJfzWp5KWPh+d3RikaOnosUZfhWuWXvQ1UjBd
         xXhNhb1w8TOPQGEnZ3w1FWWnshxudJ6XcoYI9tHVG/MQ93v7F4qaOalS5QposyXLtvOA
         5SpbEzOvtQcMXME5K3XPrjTLNlM99L7DmtPB9W/3BS/pRuNtpayzOW4qzihiUiWNlpbE
         t/iep5XwJtstjfd3UK2UeWaSUKSxqci72G3zCjNsrBtr8X0hRQeOoVTKYHqjB0aibvI1
         kQqR1Xf6k9NdWf5WYOCB6tsd8B2Ct6Dm+q9x+ZidQXYMMHAc0ORk735wJlgMoauMnXVz
         HLkA==
X-Forwarded-Encrypted: i=1; AJvYcCVDJnFgw7fc+AbU+zcmgQBsyybnfdfLH3pH+/m1Rpvej0GORm4YEtk7TqxJO/BCiwCSfSlVEJ8ADbI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx76iChyI2VjmA6OaCAWUF0aRLB/SmveafPUMmiUD/sU/Qwv8ab
	9RQS/ewevpLFTqTYovM6hoEbPsvV3SdlpMOenpzG2hYTNEXJQNtn0Z11
X-Gm-Gg: ASbGnctQhDK180uyvoh7x1UeVwrL2VmhfMxTTcqL/ddu2219eUwgTIty2dcl4a46Zrp
	NB7KkV8+JS17xF4tNCmp/s/5HEW/vXbS4xNjvkUc9JLr/c7yxvxgJca8TB0Y91a4NGdxvguqIpc
	ywelzIUE01wucWQ1h9gp1LxkkRAss/7MNxVHXsCIZMUhujfnazFtBSjCsiaQZK0uEOaTzfcwdCL
	vrWAQpxFdwGL/Le7rBlok5v/5wx1qP5y5G0NvEWOlAgyqbQ5NSZHYjvWwDNddOSjHU5yTNG9sPC
	T2kub3rH9b3irmnCYADqrEnxo0CBYrY9Jb9TKAfMR7GQCLfRRVLWGyCPzy0T16xxNY73RZeuq7t
	g0TuvgNmqSdKMTP9D6VZh1sq7PyLkftS78odbId/7Xiff0AluqTBpL3vuvI1/E+XcOxUnq/J7mh
	9LdonnMSswsCFQ88JbqGP2zq8ntAsSSyV5
X-Google-Smtp-Source: AGHT+IE0rUu8qu5Rkx9gHq3ccJHYL3kg9sZQWOC4lc4TwPWjYLNRb4WIbwmt/9NAqgJ1/c/9jA9W/w==
X-Received: by 2002:a81:ee0b:0:b0:789:29ba:562c with SMTP id 00721157ae682-78a7965dfcamr13513017b3.64.1763609832623;
        Wed, 19 Nov 2025 19:37:12 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:53::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a798a77d0sm4153177b3.22.2025.11.19.19.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 19:37:12 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 19 Nov 2025 19:37:09 -0800
Subject: [PATCH net-next v7 2/5] net: devmem: refactor sock_devmem_dontneed
 for autorelease split
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-scratch-bobbyeshleman-devmem-tcp-token-upstream-v7-2-1abc8467354c@meta.com>
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
index 3b74fc71f51c..41274bd0394e 100644
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

