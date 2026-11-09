Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248959;
	b=CvEh4nbYeVzEuv0dEwqZbpkenQdElOsgC0NUzopx36bZhL6WqDJyrBmugHwXLwbMtxYm
	 UeYSS8+uRRlHSjW9YsbiXFhWurlsGx71u7QYhALerx0BaW/0FMrdh22IIfP9LNPdfcQGu
	 y+Iz09zOnuUalrtR7gVXqhacm2wauJHMnxyCnVnjxR8SlCvlHWejPFiGdsS4qym5TaWoH
	 HggoQw6CIu0OT8KIHzB5VSPrMcBy+1edj/DRtSwbmV/PkanlMlUFR2V/YAQyqVdP5zxMa
	 X6hCrk30x4z1+sqAMCrhmiCpvhImM6b/Xzr4s2ZHbq4SoXZH7bNiTBMTWyIwEVFjVdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type;
	bh=9ABICdwqhmlXu+0O9sYf0hzD9JleqZBucAewgH7hCEo=;
	b=bRh0U7YAGJk3muoud1jSegYLm727CeYZ+bSI7u+nwMFLaj+kOYDYXfcfQ+vHXlSJGIWh
	 LnhOuqhwuZSazybhik/d6cGanD0OPWxxPLAA5JQ1T+Qfs/NRIRPbN8hkPZmO8/64SQYGM
	 Mo5AY0z0xDZkKX2WH7o/gwDKtl1uR3SDEuNV+NTIsEIt80/04ywt37YgD+iGrZDjLSZF/
	 pavQ4+d8tWWpk17Kfc+1ir/nfQCo4+M/FUznh5Ekt8q6JyACeMeA7BRNf33ezYOJXQumN
	 2OdlGmE01jgZ+SC+eJG8MFfW2PmqCgm0hnGNQVvpreU5oM26GimqVuaJMwY55etMQ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLFcnmT1;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD51D606A5C6
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 18:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD51D606A5C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLFcnmT1
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso930206eec.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 10:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248958; x=1794853758; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9ABICdwqhmlXu+0O9sYf0hzD9JleqZBucAewgH7hCEo=;
        b=jLFcnmT1udEkBHH8ARZmBU+AHoffdfpm15WgGjDE73KYjuYejVwNQNw4vhBCFbzzSZ
         3HdPMNTl/3sOA+nmNz9n9I3cN0gI1TLo2PuQhNV9jjJ2mdGIaLXQuSR9lEXNTqJtiEGT
         b0ali9Y0D/2oBxr5WuI6PYyCSKic/EPQHdL40/bxKAyTduon4WIMOaG8Czke1mc5FuAn
         7NXD3qXGcob7VykrCwbrZOpUZfPsRvMEcatTaNLvZ4DB/VrDCPWBmccSqLSG4klLZ3zF
         cOKVFzgLV1jlFqnSNxPQQiCRxZa/1qLNeXnSMrUteziGLz6fVM/kBOjY5Xi1sgYAs/5P
         UlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248958; x=1794853758;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ABICdwqhmlXu+0O9sYf0hzD9JleqZBucAewgH7hCEo=;
        b=RehlmF8/5luZsq2AvrA6x0GlZnM6RXosi47lRK/rYmiJUfmRX/aV/Sl9Zu/aJO3cq+
         6pdcBnFy7p6X54QomPrgWG4R9axyrRf9oGf2LWakS3uIhKMj80f19RoOOr7Yz8vz7Buo
         j3EummhwjoMW5TZBakg+zMSe07NkBCXV6I9k3LvtU7Qf24r30zvJotU92VUTOSZidvkr
         Fdss0oC/H8pXCtLicrjaEJrQsKi2aanP98Ze5vQgFtd1+BKHbCTYqwaKaP/wsts+6XO9
         zZTcwCMoH1GPPXRi46gX7++rV6mvUUwXBo7rnkhBTkDTXaSJLUr8zg8drYH2zlGFsHMu
         COqw==
X-Forwarded-Encrypted: i=1; AL+hErFRobNl9yd7oJzsvkoWCl6JHfsq9jS25k3tQSwstnJE8k8o9pAJHj+rdvMTb/19tkD56Db6HEtiDSE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YUtoDN6xewGjb6GYJ4h3RNVpFArWVzKKJyLPbrpa+OwiBSzgr
	QgAI4hPiDLyK9SzoT6ollx7nJUWyM8t11JhrpDYdBiM25Pa3nOOiLZ24
X-Gm-Gg: AYBFou3ZeSH4nK10XK/JKiT9dQqDZIJPrEuxS0YjlkzDeLT2Vr+AnGWqiW+0r0gue0i
	3ZSQy+vS9M4lghSn5lWonZHwMDnVSr7OlGvU4nafOPgo/bj8if30HOKPC3UG6ArdR7bGRcvdOHw
	vvz/P7HW7ICL5ddQjTS9sayxxTnI9UzE5lMqDnFV3mNgCnH5V3jabZMAb/0ur0nHQWO8IVn06AJ
	VHAc12xjsasQn0T4N7YGlAMvJkeZYuNcYmRObkhvH6ueIvW2CWulNZqXFcVr9/6CS9xVbr9rY95
	NEJfmRRK45eM35KwRv4ze9oN4aKXN+FbtpaVfxGdSGvjzf2REt9OyxUCrZA+WNJghUdginYQldQ
	SE8/4ISYNzKGN+QnoIkbophkHq9MSaVyuux1t4L7319TmtvCnhmpi2SgY0dYBbpcDZ4Yydfkss6
	pe/ql2yi4X5AEDMzi259t3osaY9dwXWTALBDZc093m+fDZcEGG2ZfXvNn6RQzCBiM+N4opJz8/J
	/Kwi0tah42rATI8UothafthR3P9YpYR6fSKH/XaRH8vDEuOPvJZstXosn7EHHcdkWPxEMbywoVy
	3/DkGjh2a4a5ZzN/t861wE+bYBdEUeKbAHxEQGWjffaY
X-Received: by 2002:a05:7022:b90c:b0:1a1:8bac:c1c1 with SMTP id a92af1059eb24-1b3b5fd4344mr353755c88.15.1794248957752;
        Mon, 09 Nov 2026 10:29:17 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6f::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm722817c88.2.2026.11.09.10.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:29:17 -0800 (PST)
Date: Mon, 09 Nov 2026 10:29:16 -0800
Message-ID: <3d2b8463b7ea74cde9327a3b8678f1e5@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 edumazet@kernel.org, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
 sdf@fomichev.me, dimitri.daskalakis1@gmail.com, almasrymina@google.com,
 dtatulea@nvidia.com, bobbyeshleman@meta.com, asml.silence@gmail.com,
 daniel@iogearbox.net, razor@blackwall.org, leitao@debian.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, leon@kernel.org
In-Reply-To: <179418738408.994134.12387400537759262351@kernel.org>
Subject: Re: [PATCH net-next v3 8/9] net: devmem: size TX net_iovs from the
 dmabuf sg table
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

> [Severity: Medium]
> netdev_nl_bind_tx_doit() now passes niov_shift == 0, so a hugepage-backed
> dmabuf gets 2MB TX net_iovs. Can a devmem TX frag then end up larger than
> dev->netmem_tx_max_frag_size?

[..]

> Is a cap applied only at build time enough to keep that contract?

It's not, same as reported for patch 4. In v4 tcp_clone_payload()
won't merge net_iov frags, which keeps the cap with large net_iovs.

> There is also a related issue in the same code. It is pre-existing and
> was not introduced by this patch.

[..]

> Would either of these fix both problems:
> 
>   - compare skb_frag_netmem() and apply binding->tx_max_frag_size in
>     tcp_clone_payload()
>   - don't coalesce unreadable skbs when building MTU probes

Not merging net_iov frags in tcp_clone_payload() fixes both. Mina's
series also compares skb_frag_netmem() there:
https://lore.kernel.org/netdev/20261108013838.1454450-3-almasrymina@google.com/
