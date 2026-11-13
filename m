Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559927;
	b=xCs0nuvYTOnX9sQVoRlVNro9lHDYkRlW+/eyraL5k8iwjLRr/99F7dejru9FEY8Q9iIp
	 PcTlqvDLNjeUvAXot3A/ZICqY9btsUc4c8Tgl1C+fnAEr445XbySiBIZlyAkKphyEjj/D
	 J0IBPLU0e4YQk+30qaJV6es3TZ1hphPe4kz4cQ9tRZW9PfugV27MsF9QBQ+AbxcbTHOvy
	 FZbNHs0Q2TWDL4VKCm4OOcMNFfT820VhmjbaqMivdSdtQ3FWfuAA7NVfQq5YDl093/TsG
	 VLk1zNK1g4jemvqoTa/mL+pls5UnPwTLGi9sIrG79aCVLkAEMyqI+T2a5Kx2Z6JE65g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=bwUDB2KW6o606MZkDo/fjGb0dXbOTwa5lnzMBFGM+38=;
	b=jHcKr0i7TmctO15upCqDl7SqKiErtfqjD/NAFEw0QlK4eHoHJllSEueNWzDgaED4jITx
	 bh21H36DL8GVzNBWCiuJdeNffBigOSSRcC7vwIJ41R52ZDi10ue77QJfKQ2rxHzUtayoc
	 +K31Ys/MzO9LRRglBZUFeSd5JsLPLJEEw2kbietBdSA3vJmki5U4J/0bI3IoQs4ZPvchN
	 zvBbNeZFjtzIt/GCaFICFZdHdbtw4RKlzt9rBw5B5f/rjbQbiVbifyt/PrTl8CUxRxQS7
	 uv8gE0Zu2WF4F9vtQgiImva3dY2cJ6bwIlq/zgqcXzmVWGvx8y7mt0cGEc3tDjikDLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qfYTAkPa;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE0A606A890
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE0A606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qfYTAkPa
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b1a38a5088so195956a91.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559926; x=1795164726; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bwUDB2KW6o606MZkDo/fjGb0dXbOTwa5lnzMBFGM+38=;
        b=qfYTAkPaHlJoKZndJ1amhv8QdpihkbMCquLcZkhGlKDUylG8GW0BZvSAikFffhjx0t
         ii9EpRoXoEVeVC9qma7452DsMHJMLibW+zE9u831VDMGj9Z9IWM/6pd+uf+2NLS0IVgc
         ZwzONvdSovIkb4u/wurJ2rUTWJNcZZjBVVUVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559926; x=1795164726;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwUDB2KW6o606MZkDo/fjGb0dXbOTwa5lnzMBFGM+38=;
        b=ieReyauK9IxxbHiE/nigSncFRKbsz8f8v47SH0MSSH+gLqDzF3G57+1F3Hnqxdpg9Q
         xxF0LMLFgRzMojQCTj7I1LWW9TJ9pIOnPrudXGhbTY73uiqSoCJ2vI9qIE3ed8TIBH/q
         0kBgyj8K9NS6HjbzTeNfC8gdDJ23PZMETo5sXIMjWbULk1hAGud1khntuCFPL30X/UdV
         gh+o7v0h1meHxQc0fae2SILqG7uUmCV3pTm7HZry2rGh5B2Y+O/dnv1Ew5lE+xy1+8QO
         cIwwxyT5u7/0KSOO4Q0eS3AA/Kl0qMV/usROPeqVaF1LTiyfhgcVF5AXCzJ60zYbxAkf
         0kGg==
X-Forwarded-Encrypted: i=1; AL+hErF9+BkCHh2vJgmp3mOaznDaMUwax6UPnyCsYUCDfpQWijc56pRkQRL3aB78D4O+PcA2zqd6QgOtD+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YMIIjYIIlhpuaEVZX6YxPfcbAuWsAMRxKBy63YlH7phvMsLbE
	AIg/NZI7g9EJgZtwJ4rEZJ+v8WPFXem0UPN8nEg3gDMziYGMkjDXDungKt4dzUg77pY=
X-Gm-Gg: AYBFou2FkOMpEXE5rAmfYKvddDjGYSaUApniyicpGjDdQ+tHE+pOrillD/4uYqPzKNB
	yRuMt5ZwI14NLKK4FFm4bIn2ORvohvak+Yuz/+ezQa4uw1oUVWNnzzroCZqjp+GBqVpLAHF9xUR
	MvIz6PyhIg09SERN3lQ083xIY//ku7zctqVa1K95PTeDXhtEoZmiXXqpOE4SMjIFobpkoMmAS/r
	lHvan1t8ipoyvzGISVbOj6WS0Ty5l72NRLH4bfdguB3tCc+LdYc8vLZEqX3yy4KAJhrn5IDBfQG
	mMSJyr58pvlYYtuj6bENZthyWY85nnxME6O+BNotFyzzFCe10IqtmkGQYvcTdXR3fAXhsYtSE2L
	M1j0LpUs6RVziMw7ukvhJ4BPTLA3sxUBfP4UWdK4q5bQd3C8b9JKM8dmqugNTKFM3wCEeEpUIU5
	rZq0o6fW6YK/0kFsDBqEXcAEeWwTPRSwW0YOBCY3ZATAvD1yJf5/oTI3dw883LiYrXRqaQZjW/4
	trb2EjPwNiuXoCWOW9MzPpERYtDWvDsOtfJwuKsZKjMnvVQl65m/I83o8utHD6kn2tPUjuAcbYj
	W48UrODtHKTymVgt+LqAB7h0swyPxTFo9OhFHc6tkBSNp+IN0tEKE5MK5ikCdCJKzBzmzU1beZM
	+comKatIf7h3lR6NVkXwSzCLevsn3KQJ0BA3eNB+ZBa+46TwDh+YkyMCgyEV9GLe0tWtrmtVqYe
	rd+PasRfV6r8WXkfyV5gTxpw5pzszX/xOARVtNISM0vqhIFvpuwEtahiV5Krs=
X-Received: by 2002:a17:90b:3148:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3b1b07ff58amr1597563a91.6.1794559926135;
        Fri, 13 Nov 2026 00:52:06 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm8791005a91.8.2026.11.13.00.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:52:05 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:59 -0800
From: Chris Down <chris@chrisdown.name>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, Marco Elver <elver@google.com>, GONG Ruiqi <gongruiqi@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 3/6] mm/slab: Support disabling SLAB_BUCKETS at boot
In-Reply-To: <202610302115.8C7AD110@keescook>
References: <cover.1793253633.git.chris@chrisdown.name> <9a68a4d95830352ad3821437c2e22c30a673055b.1793253633.git.chris@chrisdown.name> <202610302115.8C7AD110@keescook>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113005159.840c7b1a6049a81b@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Kees,

Kees Cook writes:
>I thought the issue here was about calling convention (i.e. with
>CONFIG_SLAB_BUCKETS Vlastimil had suggested making the argument lists
>for the call chain shorter by dropping the bucket argument entirely).

I think you might be thinking of Harry's kmalloc_params idea from the
slab_alloc_context thread [1], which would fold the bucket and token
arguments into one struct. That's a separate thing. This patch can't
change the calling convention: with slab_buckets=0 the kmem_buckets
argument is still passed down, it's just NULL, so kmalloc_slab() picks
the normal caches.

What this patch is about is being able to build one image with
CONFIG_SLAB_BUCKETS=y and not pay for the separate caches on hosts which
don't want them. Harry measured that at about 1 MiB after boot [2], so
it's the smaller of the two, but it's the same "needs a separate kernel"
problem as kmalloc_partition=.

>Regardless, I still prefer this being a static branch so we don't end
>up with a needless rodata global check.

The flag is only read in kmem_buckets_create() and
create_kmalloc_caches(), when a set of buckets is created. It isn't read
on the allocation path. Allocations never look at it: they just get the
NULL that kmem_buckets_create() returned. So a static key wouldn't save
anything at runtime. Also, some architectures (arm, for example) parse
early params before jump_label_init(). So we'd still need the bool, and
would have to flip the key later as init_on_alloc does.

Is there somewhere else you had in mind for it?

[1] https://lore.kernel.org/r/e650e125-5f6c-4de7-88b5-9da666bb0a4e@kernel.org
[2] https://lore.kernel.org/r/179312451613.474906.1475329637924619088@kernel.org

Thanks!

Chris
