Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66024BC00F
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 23:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790812022; cv=none; b=pxdrXXkn2NRKRp6ijWRDtC0dsWscpCWeVJVgPqzn11TnF7NojkpcdgteVK5/ulpwI/L2w3QQ9fI7GpvLHHrZfSdvU8PcBop2Ye7JBU+//8QmqcU03Mx/7tKuRv3sawnefW1XNtqNj5FKz1sRgDGjwN7+lSAcX4Jmk5vocElNTsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790812022; c=relaxed/simple;
	bh=TsKEM23vrGNZP59nClNAGbEF4QPHeuq9r9xlzWpsDi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B6jlcHZTGE7H/hDSAgB7FHBvlvAftMgHiTFp9prxS6EZa3KTPjrn4I5CjT3RrLsD8pFaYRETptrItIjAXeRWFvbyWcx4ai3BAqoAbpu/kzwQA2J0ka3xMRAJyy1rJXuHP58IIlAQNZOz0JhFBS4+lxPe7BHPLwCIJwjR7N3SQuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUX1kLeF; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUX1kLeF"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-80a18990c76so3754186a34.2
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 16:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790812019; x=1791416819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKazThAjDvEancv5DllE0t7hYEI/Pi0fz1aTpnksd5Y=;
        b=FUX1kLeFelJ/FZlVzCuvg6arDKp/L41BWts37Udf+dlXucGs0pnjVP48wCPcPfMw7D
         lENgOg67FtmVvvyxvBXyjX1yJa2+itG07uF8HBUrednPzKmaUrHOcb5/DBBQj4UsvUH+
         w0/VuHE0WSaKGLBAfm4dfPD0n9vnBo29pTtTo8xLYxr3uU2vWorffwJ0ZYGAhFwVxjTm
         j9JmFu5z4TMXDPHUYdtIuVqlcZeuk6H7Sioa+ptqm04NDlB1JqRhh6SIlUUOekUJGo5w
         tf6LUaLelZGZRQrTkqfH2Nk6EsKgeq/jfqXMP0dotfFwJIHtK+dR+ynqnWZ6FPNXXqzn
         mycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790812020; x=1791416820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKazThAjDvEancv5DllE0t7hYEI/Pi0fz1aTpnksd5Y=;
        b=Zb4mq26mlIsY8SyCl1DfXIkfvUfKsPjZzpANIXHpTSEfPbY8TYE45IqThAdk9tFn62
         VfHbZUWNFKt2BASbp22C9k6wzjmtna0Kh6AXQsNRbEqefTsXeVZGCO2wEl0+U2+WEwDV
         yBmERl0IdKMIKbd84DoR7iWqsLSkYzGTidZSYjgdvrSvpflxpD1eQtz69zO0888qaozv
         JM6LjSFMKpFFiphHSxaE1zGwCCXo7wOF9B6sFudKrs4Oag0Y7B545mlN1RCbfRhejosa
         e2juIsPA1aWZjBR3UmJ4cGtvhSFngFGynjsjfkyjXF4oizfJGvZfACvjunsHdC1kGTNp
         6ghg==
X-Forwarded-Encrypted: i=1; AKwUvBzzklcz1vGXMhyLx9zCtCuYzxFfp4CY52xzc1OTdtRxfTjN34akSDwrXaDUgAMdeHSdcmyAyvXQaRU=@vger.kernel.org
X-Gm-Message-State: AFuF++nZX0zybOACb/lBrpr6rEVBeHmir7JkqiGYuWNlRju8iYZPOUIC
	z1itu/NVS4jROVkwD2utW2cSykPmaaLJp39APKjhrCS+7CWfCbmIPtGI
X-Gm-Gg: AYBFou3u/PtIfXHAtZ9gwMBVmv5NSfda9l0VMJa3zFUi8qjEdtJa0jo0yvXF5sGhLLI
	cNUNmFIJx9pY4rj7uzoQ4X+Mb2cPviygt/rrLyPzUwMdMiSaanxNeuIraTsYoKs74xRr8TxdGk2
	bHYYtLc9SleKlIkAVpdftCT5oFOdbR+W5671YlYnhhChbjVu4ylZvPgP4QpV3Azl3DGRx/zc0FX
	XI/nAYTrFuF/3dzRWMlLvKOkhErjHvGNXyT2HkAgX+yD3ucfVnsrk4z2jJQEEBV9B5iFF3Eggbw
	FPp7VNECPYjuisEveDftJxos+6xn+pKLPjx/eA4obnDlXU4gavQKsHlFJeYA4nweaMCFh/G1MTN
	AKabr0bkLQxdmQhEw84N1VQPhGe2sUkKtJBwS3+R861naXiSKrSWF2U8QJblAdSAEjh4ZhSQeCm
	7wlY5xq03NYIjwOtc/cKDUXr0aiUiMOAkGeGIong/YzaYFJq0oCSpAIBVWgjEsTo7v1RU=
X-Received: by 2002:a05:6830:4110:b0:806:6e79:c7ea with SMTP id 46e09a7af769-82048f1eec7mr4160685a34.6.1790812019674;
        Wed, 30 Sep 2026 16:46:59 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:6::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8212ae3ed24sm1348726a34.17.2026.09.30.16.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:46:58 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 30 Sep 2026 16:46:48 -0700
Subject: [PATCH net-next v2 3/4] net: psp: drop psp assoc clear in
 sk_clone()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-psp-defeat-v2-3-f266e7447129@gmail.com>
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
In-Reply-To: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
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

Unwind the change from commit 1d2929d0850f ("net: psp: do not inherit
the Rx association on clone"), now that assoc state cannot exist on
listen sockets.

With commit 8cc3aef0cb19 ("tcp: Do not allow buggy transitions between
ehash and lhash2."), and the change in this series restricting PSP assoc
operations to established sockets, this state should be unreachable.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 net/core/sock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index 2948dffcc3e1..d7ddd365abeb 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -2496,7 +2496,7 @@ struct sock *sk_clone(const struct sock *sk, const gfp_t priority,
 	RCU_INIT_POINTER(newsk->sk_bpf_storage, NULL);
 #endif
 #if IS_ENABLED(CONFIG_INET_PSP)
-	RCU_INIT_POINTER(newsk->psp_assoc, NULL);
+	DEBUG_NET_WARN_ON_ONCE(rcu_access_pointer(sk->psp_assoc));
 #endif
 
 	/* SANITY */

-- 
2.52.0

