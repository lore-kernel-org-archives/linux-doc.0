Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2058024C077
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 01:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762305808; cv=none; b=s4wOTdiuNMU66fVUoGfY6/udqTmRhimcjjjDDZnZei5XFnQDSMqtufteYB8VGQFIhwTwGWjDAM5yVNcY/fFMj7Bz32R6of7zwPQ/IQ1TTRaskM+5GchiEGXZV26fUlA0a+VqUaNzTVyyr4owxx46cKgR8jCthowpuI3r9JOf2qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762305808; c=relaxed/simple;
	bh=ieGYJI9ziUHUQcaSbEmkTTmHhUJOCFMJhOBD52u6LIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=izZAVxKfvHKSHrAOcvEPWogMG+ySElIMop3KXwfo50KM2ICuLfJjpnKXWOFGyq11iKG+445CJZ2SxQuJ0q0EUERrWoDUObqsxt/PyXtvIA+Sd/ZSW7+vJqPgGdtnnd5DIKyHk90EkMiHQP4BSojvkS0YpzuHu9c4xJByoJm4fhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gquzvXsb; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gquzvXsb"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7864ab69f01so44718557b3.3
        for <linux-doc@vger.kernel.org>; Tue, 04 Nov 2025 17:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762305805; x=1762910605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xpyNjvOpzHicrhK6zjCao8v8pSlxTbvuW+wenQI8Ik=;
        b=gquzvXsbpH+UxQYzNFEyFFmZpA15dmESjWOQQRbU8XpfWAPckLWiXHikV0Ir4jyqvz
         txrb8YotTyfsJymCjh3YcnSMa2ghZz7K13rzsA/1DfBLBLZhR56Y0EZm1TrjWVhRuzGP
         ZGDTj4rBD3T6FzTdoZWYOPiTHFBHAaI+/zt3i2ZtwEJIwjJHuqSlxZtEr2TOT+iD34Vr
         sUthM1OqBCrolHAQYVcukEJeQSEoGZTfhPlPG5kHHPvNm6Y4i63yjBlV2bEBWAgnesL+
         pI2t2JxhxAnnMum+M/eTM192fC/xYelvdtyI6Qs6I8Ib3DIE4wTDPEMo33l7FD3f2lGL
         Ll3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762305805; x=1762910605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xpyNjvOpzHicrhK6zjCao8v8pSlxTbvuW+wenQI8Ik=;
        b=Q990JIHUnsgtqcLwQ//Sl/xx7XevZbUyV9SGSvmbKBzM1QtNuGodG+KxtVwu13rKpI
         45LF/LMQf8GmlsiRFIZSLSknI+IpQOASVy7UJMOS1BMrwPlLbC9OCqErX4Ovi4lijsV7
         rj8+C9JmVire2QR1/lhh2zQTeSP5zSMGVR7E+k3fPnyuT+Et4Qeg6oBRySavLz9TOQdq
         mcMYb9w2Z0aFwXtOvd4wgilEvmwx8mOzAScIAAbRMTLIRUMrJCGarpSX0hg0RqcEJvKJ
         5TQmPekRik86L531ApiE6eF4wCeHucYuH953yDLjSR8u/W8C9fEYlZ4yw13Aqr4fK3aJ
         /bpw==
X-Forwarded-Encrypted: i=1; AJvYcCVQOZWB4p3lhyAvA44NQv/t+rn9rvvjQ5Y29gCI8eZgtfb9aAxBu3xBGd3+3qrXex7Gsl7EeyqRi/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCbrmzic1MnN16yir/OGgpgF92AhSLZOE273tR1O/9VmUTBYDh
	vmu58eLbVBVDn+u8fMg41cDkhz2KNUKO32k482SKhYeIJXlw7g12DAIqtBtr45fU
X-Gm-Gg: ASbGncuEZPL3Tq339PvLFLnKQvau1rw22GnT/kYxsAB8kWENvFamGH6Lag3uSXdVuqB
	5z0omhm1DOlnn98+lHo7zZYYMYO9nx+BB/AExdLCdZexUr4qoPacR+/ogmS13iE0K3zlsjUFXnj
	a1KEqvikERGAFP24WRc2VaLVMZ4ozGiHGFCq7TWInZta2kcb5wjCpKM5JkvV9XsDB0/AVGnErt3
	CRc0+JUDy8UqFsnRk7a8F0yLZx4NdZQ6vGXpPtvVdMjpDhUvWkXHhKWV9P4qmMM6kvxAPsiaukl
	HvHj4GjF/6t6P7O1g/UXnAdZp9Hz5y95adIdVFdpkZ+vktKrKSVrlNAWjJ96NjgzXJbtDfOLNPY
	b9+RAsHNS+6L7tvr7hEj5urE8rXJPTqu/CGuhEy3RCjcz7UGKPzIcEz4n4qceBav2RioUF/UgGR
	7EIUyz5CZdmRo=
X-Google-Smtp-Source: AGHT+IEUvytYvHi/IO2KX++l2Q23Drlof8YVKuhjSICzsPMFHeHVGstmHJL/UBXx/ejfmWw6Z9oZFQ==
X-Received: by 2002:a53:c04f:0:20b0:63f:c019:23ee with SMTP id 956f58d0204a3-63fd34cd657mr1283126d50.21.1762305804817;
        Tue, 04 Nov 2025 17:23:24 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:5f::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63fc95dc03asm1300572d50.20.2025.11.04.17.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 17:23:24 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Tue, 04 Nov 2025 17:23:21 -0800
Subject: [PATCH net-next v6 2/6] net: devmem: refactor sock_devmem_dontneed
 for autorelease split
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-2-ea98cf4d40b3@meta.com>
References: <20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-0-ea98cf4d40b3@meta.com>
In-Reply-To: <20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-0-ea98cf4d40b3@meta.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>, Neal Cardwell <ncardwell@google.com>, 
 David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Shuah Khan <shuah@kernel.org>, Mina Almasry <almasrymina@google.com>
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
index 7a9bbc2afcf0..5562f517d889 100644
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

