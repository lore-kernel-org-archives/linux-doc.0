Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397061;
	b=yX7p4xwjRsXeerKwfJggXRIVMKjQpm/5M/qimHu/kuhKGc93+DQKkqrxHP7nQ4siRstU
	 S1acA8Xrgn3C+Gyfv0YcB0VWYHXlPbSsXYKKyClvB+cyKbKjKnGmSRl3uBJW37HMJw+9T
	 M3Dikp825nX3bE1I0iyxoP7i/8hvfculE9H2c776u0WKAWgaeCvCRLXUS9xX+8NqjQYA9
	 3AZKnhnnP1ZCCT5VvM4K7pJiJHUZVTPQADg9/F2KJRp+1o/cZt/4dJ6rYRK1KxnkvCKy/
	 IhuD4B8uVnGPq24Zk9cHnM9FcN7SpF0Q5fti4dRmiVvOyFpb6myZJ3Bcx6lkPAhAHVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=GWmJbLCR3Z0PWF883WQy0SlXPcx6C4wxGpgsQpGnChg=;
	b=SAfO2/ljF1yNAKUBj4QE0q+wtV5ZLzOf4wuymfAY/mzZ3Z0gvFloPDs08zeONZ3It6/9
	 6VX6vFqqlPDo7MGvZzXP7NUSPaSS7fPemvhUnuC5i2+Vho+RXIgpWlxK0gv8VM0LIhHpI
	 sacRcNW2+sfFzTiF8q/jVgzw9oEf3zYPBcm3FOU4lvehtYqbc4wZI2BrTpJkfPirzEf+M
	 RtI59tif2rAvYnCV7/vXlGocR+0AvMLK9TUMV1QTZwlzmLyiIAGnZvXdh2ap9E2OQ+1Jo
	 +7Ux3nJnjVWSbgtERDiA1BXg7TAXOEAsNDkgPddQLXIiZuohvSeLWScGb3HIX2Fb+Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BlC5Gblx;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEF1606A326
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 11:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AEF1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BlC5Gblx
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f259cdc86so275142085a.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 03:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794397060; x=1795001860; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GWmJbLCR3Z0PWF883WQy0SlXPcx6C4wxGpgsQpGnChg=;
        b=BlC5GblxeuC6mh7E5mlcHWaa6FbwL7M5zsHQyzNo0ElWDR1HAb/10OXHf4NPTjJrYZ
         28qVLgXYI0cEYMl1lacrKBU6nz6AUicANfMZJzE7tO5nUNNb/YLGhvSTEHQIGzEOAuHd
         nVuqyNnNQTSTYCKjeMB9T9GmTGazkGf9pwsNZ07qbwteqNGC2d7g3SsUnHMTDJ/U9yLA
         UNk/kC7bqqiC/S3ciUXpdExCDcSYSMdftZTBSKD4owXddH4eUYyHOmIyppHH6JwIk37s
         OAcw2gv8gQOn9dcZudYcQ7SMmXcsyH1a+VEFKbwnhezz+4FwBTNzgzrVoz9I0rpjutiu
         fZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397060; x=1795001860;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWmJbLCR3Z0PWF883WQy0SlXPcx6C4wxGpgsQpGnChg=;
        b=QUbNP1Q8SIhKAOhaHztK6YReK9pnQgctIHI67Ymdi/uEZSlEhetPs2PUGHMFiq5c9M
         n3VwwRLtYz7BzLm2PGKc325/7YVXCnWhV1d8f1kd3kLgYEp0QZBytE0/IW1ULU4Stz+u
         kLllB3DfqKaPdfmVQI24+Bak44pmIsWFqpcOHY3bxOCfAIrTk2/G3hCmUm2Pc0PZont+
         4FWIyh11iW5F1I2LGyDW1TC4cpBxaynf7tD/ozquCTCTin/8sTNnGsxShGzoVaiWfWT6
         IyaylQDpN471tlfI4rAx8PpRdkQKcbVsPsVvIiGztb+LEUlQbDNsQBl2RUSckiPqsUIu
         0Ydg==
X-Forwarded-Encrypted: i=1; AL+hErHms7O6W5FR6kFKhFw9Y7zxdphQPhpIzZ7v4E/GR9/We2Alc6+fp2bnn/5Fd5eVWsHFuLjAPWi4emw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zekVzAmGTH2dxeJI8H6LjBZhSLFZs6k92a0DC/6qeQncfey0i
	Ezp7Len0/sMShyXZ7DGa+i20lotj6ULu5ylXOeRHZwRvpdvgBt8fpH7N
X-Gm-Gg: AYBFou2NQdtGDK0QQL/PuWnYluoAwJpox6juXgzWFPervvCD/4ok7KNetWGD82MYjlj
	RCV9aEWcYhZiUoSkAhGKnvsc54WeJUZpL4asKDh5kMYuMXp8CbvZLAN0/wS4hu/5Tlgz7W8oXp8
	Gnr8JXAckBgsiHMymobXGNErNUc3UgxMzBy0RgpAhPuDP/Eb1gCV3kNX/qnlyihileqUPbNjBgF
	woF9n+CPQes1CQcCx9okls7AFaiCCZEwFwbFJ5Oc2HzP8Fv+Hxg9u03dgW5RwakvgS/PZuiUpyc
	9kod8bzJhsMKLbNUITlLrKFJ7v3hetzfDeLjQAvp1sXyM0TAvh94IAsbPiEQ1zW4o07+5r3arDE
	KmaKYbQN6wX93lwdjGWk0jdCwmug2D5oXUslag5TTrRRtzYAeFUSrKGsco1q0lRZyVjfmnv8pgK
	T8OoY+WT7JlmWEHxLDx3FDeARiDLXqGJQ8t8mgyVIu1YGXU8hJfkw1PW247DL3VnSL4wmL/4XO2
	eB9QYzyHeYL7pOU1n4kmQuIdb3V2H7wgXclyPudL5Nkk9LOUviJGvL+ukzRfzK+W//kKGXJcKuT
	NgbBfauF/nhs65wxXFXavT1bj2XN4bOeBcDpgYMB+91I6hIP3LqAaJM=
X-Received: by 2002:a05:620a:4444:b0:93f:3e45:a419 with SMTP id af79cd13be357-947b002af5bmr318209785a.38.1794397060199;
        Wed, 11 Nov 2026 03:37:40 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7dc398sm462686385a.35.2026.11.11.03.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:37:39 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 06:37:38 -0500
Message-Id: <DMSCO4I434TK.15MMEZI0V4UZR@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Daniel Zahka" <daniel.zahka@gmail.com>, "Donald
 Hunter" <donald.hunter@gmail.com>, "Eric Dumazet" <edumazet@kernel.org>,
 "Jakub Kicinski" <kuba@kernel.org>, "Jamal Hadi Salim" <jhs@mojatatu.com>,
 "Jiri Pirko" <jiri@resnulli.us>, "John Fastabend"
 <john.fastabend@gmail.com>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Paolo Abeni" <pabeni@redhat.com>, "Saeed Mahameed" <saeedm@nvidia.com>,
 "Simon Horman" <horms@kernel.org>, "Tariq Toukan" <tariqt@nvidia.com>, "Wei
 Wang" <weiwan@google.com>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net-next v1 08/15] psp: only give time-wait sockets of
 psp connections a validator
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Todd Freed" <toddfreed@meta.com>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261111005533.6436-1-toddfreed@meta.com>
 <20261111005533.6436-9-toddfreed@meta.com>
In-Reply-To: <20261111005533.6436-9-toddfreed@meta.com>

On Tue Nov 10, 2026 at 7:55 PM EST, Todd Freed wrote:
> psp_twsk_init() sets tw_validate_xmit_skb on tcp time-wait sockets.
> today, that becomes set whether or not the socket has psp offload, which
> is not needed but is harmless. psp_validate_xmit() passes such packets.
>

This can get sent as a standalone patch. I would probably tag it as a
fix too, even though it is benign. I can't remember why we (I) didn't
put the validation hook under the branch, but looking at it now, it just
looks like a bug.

> but a validator makes a socket look like it has an encryption offload of
> its own, and the tc psp action, added in the next patch, relies on that:
> encap refuses the packets of such a socket, and sk_validate_xmit_skb()
> drops a packet with a psp association whose socket has a validator.
>
> set the validator only when the socket has a psp association.
>
> Signed-off-by: Todd Freed <toddfreed@meta.com>
> ---
>  net/psp/psp_sock.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index 609b06c7af65..664955bfb4fd 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c
> @@ -330,10 +330,14 @@ void psp_twsk_init(struct inet_timewait_sock *tw, c=
onst struct sock *sk)
>  {
>  	struct psp_assoc *pas =3D psp_sk_assoc(sk);
> =20
> -	if (pas)
> +	if (pas) {
>  		refcount_inc(&pas->refcnt);
> +		/* Only for PSP connections: a validator makes the socket
> +		 * look like it has an encryption offload of its own
> +		 */

comment nit: for my taste, having a comment that starts with "Only for
PSP connections:" two lines under an if (pas) branch feels unnecessary.

> +		tw->tw_validate_xmit_skb =3D psp_validate_xmit;
> +	}
>  	rcu_assign_pointer(tw->psp_assoc, pas);
> -	tw->tw_validate_xmit_skb =3D psp_validate_xmit;
>  }
> =20
>  void psp_twsk_assoc_free(struct inet_timewait_sock *tw)

