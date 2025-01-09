Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACA0214A8E
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 06:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736405958; cv=none; b=ryraQW4hp7AKy+QikeKBagwRcl1MkbiW931ZKKbIXQsjiFg9qQ43X6kgxK/wn/uUePRFgascby6DJy8UxzIdusRzNSCh2JVsEosj85aPKsrtrB7//enJX80S/DePVrffoe7aCQB+y4gu96j1UP2VVlxiga66hujr0vF/063++zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736405958; c=relaxed/simple;
	bh=3se5b6ZtcapIk1Hj4cssqIsg8szJXXkbOptd2HkOcvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=ZuOaNwrH3BSDi1tJcEXP5ut65J+nXtkUrr2hoxhQaDUler4Q36+VD3z4lyL0i/V0Ja0Bn1Exi/j16vmFXtp5BHFjSRcpC6g8FmJ0Y5rxwCZ0psCKy9ESkuz4J+lbU4M29UTmrORUAH7jlkwh5WQ7SPfkniCHkY0jwAC/ZtMcul0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=b3UJ78L7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="b3UJ78L7"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2167141dfa1so9881685ad.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 22:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736405956; x=1737010756; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/vBDwZ1bg1e1swp4oqyRL1d2OsnyaZOIbrFToORcQk=;
        b=b3UJ78L7G1njfFa1gyJTcH4IyhudVDVCJ0UjAfJvSee5zYsHzNzssWdBqEnzwnRne5
         djLiDvbncuoMyDj+etfYDKhMzFf518BDZMsClSKhbLOnxug2fQRJ/jyZd/qnsiSC4gQP
         Fbvb5Da2l4Lc6mPBMrGJ8OgJqdRMke0EmA0cf7uTQ+QQ32pgudio6HaXQSh7POkFUpHG
         KekfbgYM3nGChmSAhPKbfb+hJiAF+d/9pkXOA/fc2+wB8Qyn1D0SRcLk9Bi45mK2ixFS
         LckPhyTsSFb/k5uHBnGc6y82hPRua6lES0oEwpdOJemUq/j+Vw4BUIiDhW1E2DqwDmcj
         9FCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736405956; x=1737010756;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/vBDwZ1bg1e1swp4oqyRL1d2OsnyaZOIbrFToORcQk=;
        b=LMigpmVKcjyZP4BhHTIpjYS4+PN4vVnX39YMNI0iStkRLxr8CRi9mlyWZSIHvHxBh5
         0yE4e/eLV1sFSyB/dvtWS/2WvZAC4LerhmivfnUmKcXPcIbPDWPRmdjxexbKCpcLoL2T
         RTuOILpG9ror781vFKaSk37RIXn1dMTcPHaAi5nfqvu5mxDM08LS/EqBqAUMQGd1luO6
         rV+g1UcCq96NQgr+nmtWfWhazye+XWDNptdhxppOL94pT4xBUmWHWabZV5uXqfGY4CcD
         Szz+NOBokxsjZHh5Y/omJp73FvlnuMMv1eka7KpO8TgXEBRBEjg8+5LSl/7/szPjDG7n
         2y3w==
X-Forwarded-Encrypted: i=1; AJvYcCU2WO1jsJ8w9DRwWw490VKwHECeSVJUojn8ceRmQZPnNPPTcRepPreinFMvWZP5CQQ/gNPZxQ6XlX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YycJ1wluZbNIGoxo4JuarP6NYuI8jtAbiPmjNeQactplRHwZpUj
	VMyroxPZOKszCmfWgDv7nlt+2a5G8uiNDXW2yCIUIujVkaTffjlDc7NxrZjYU5Q=
X-Gm-Gg: ASbGncuhfb3UxgjwGZpbMQXPUGZpgdj3j0aEg2qHYXvJsACe2xDSx4JJ2zZA0MUq5bz
	RolP303iK4nMogVKIG9ST4cc7AdAWVJm76bnxhgatBfAIzMLSZ+zHoFr6h8gGcho2GjLSnTaD+c
	vIGxTyMtH8Z9pFYxZ9x25LnsAbmYdw1fau6z4/RgRSJmRznzVxhxZIPsumZuqLIoVpr0cT4xwsc
	ec83j+WmWkTH5N2GlF3PLagE5/4JvkufmKX0u0LLz+yjzKeE0hexJilCTQ=
X-Google-Smtp-Source: AGHT+IHzUk5V+EAYcYWqJwWaC+MFXwZq/71Rqs76Md4T53EAaSJMcMoBTEhlBWSKQlkkuLACd9/8+w==
X-Received: by 2002:a17:902:d589:b0:215:9eac:1857 with SMTP id d9443c01a7336-21a8d6335f0mr35770975ad.5.1736405954425;
        Wed, 08 Jan 2025 22:59:14 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21a917694efsm5382895ad.11.2025.01.08.22.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 22:59:14 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 09 Jan 2025 15:58:44 +0900
Subject: [PATCH v2 2/3] tun: Pad virtio header with zero
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-tun-v2-2-388d7d5a287a@daynix.com>
References: <20250109-tun-v2-0-388d7d5a287a@daynix.com>
In-Reply-To: <20250109-tun-v2-0-388d7d5a287a@daynix.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 Andrew Melnychenko <andrew@daynix.com>, 
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3

tun used to simply advance iov_iter when it needs to pad virtio header,
which leaves the garbage in the buffer as is. This is especially
problematic when tun starts to allow enabling the hash reporting
feature; even if the feature is enabled, the packet may lack a hash
value and may contain a hole in the virtio header because the packet
arrived before the feature gets enabled or does not contain the
header fields to be hashed. If the hole is not filled with zero, it is
impossible to tell if the packet lacks a hash value.

In theory, a user of tun can fill the buffer with zero before calling
read() to avoid such a problem, but leaving the garbage in the buffer is
awkward anyway so fill the buffer in tun.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/tun_vnet.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/tun_vnet.c b/drivers/net/tun_vnet.c
index fe842df9e9ef..ffb2186facd3 100644
--- a/drivers/net/tun_vnet.c
+++ b/drivers/net/tun_vnet.c
@@ -138,7 +138,8 @@ int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
 	if (copy_to_iter(hdr, sizeof(*hdr), iter) != sizeof(*hdr))
 		return -EFAULT;
 
-	iov_iter_advance(iter, sz - sizeof(*hdr));
+	if (iov_iter_zero(sz - sizeof(*hdr), iter) != sz - sizeof(*hdr))
+		return -EFAULT;
 
 	return 0;
 }

-- 
2.47.1

