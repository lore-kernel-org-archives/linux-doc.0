Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795029316;
	b=JfRTy0+3T3Jct7SDZpzaE65G8I1zs0KRxqO8Uext+o+bW5TOj4ED5XFTDZM3nwBhf+fQ
	 vsIMRWEXDEff/JPRUDRZd6JamRBauzCxJbfKp9EoR1jeN/4iAA9S1YNBrwC2+lyZxhmUu
	 Ou1DkdwBlMvdSl3DsKYXfXrT1S1m5B+riDxRwjTTau3GNeTxAfFF0Xv5AXcWRwtFFmGbz
	 /04DP6hDi9DdGRTllvhCvJTSKOoGK+SgcwnMfIapop/4EOj1fnFry6nuuUpFY2tcUT10v
	 zUrZTVKLNH3Orw4BdqkTv73QWh6FoJ8OlOZDpop92Mwm52OXTRk+BXJuQjU3mF1TnWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=+xA+qBnR4DhGTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=;
	b=WIqTezliRbnCyR3YLSITPUxY5CbvxgZuON7D/DMQgJWsyW7FY0JeIRiXW3o9NO3uENZo
	 s6Jo6iciRoXBI6ll+e3td9momlMEsdQUxs5i1ijPXXYBWcKH5r0ZqMaj+x63N7dwFd4fM
	 LKEBJlv7hZ7y7jRXRXOrwktSjNC0VVOY7bBjOnwY0bjxykj04C0e4FDG0NZlG1ju/UPFz
	 Ds5AxwiHTmiNISR97X6PuVtp5M0/mOUgyPSjz+OF7CYTE6K7Llac0pTFcOkyyL6FHa3YJ
	 rOwd2YLMO11CE6f5bl5VJCjDEFrPeRcReRyY4BCDnhFxcB97v/2TFbFaSpY3Vpg4/6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CI0coo5M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E4A606A330
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 19:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E4A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CI0coo5M
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGcZH422193
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 11:15:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=+xA+qBnR4Dh
	GTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=; b=CI0coo5MCl6PeMetoQwNQwkRIbu
	JiJgmxit9cRt2nDJWrdAARftxPhoMHNyIVJskaAed9S2yJwVu7Ra0ZkweQuyB5yF
	guA6b+B7Ror/Ay/Qt7H0gVuOq2ynwudmNifTkBxQAYnk71ts4xr1AaSkk4W+eOa8
	idyTtCCV0m4sS5SbBYGeYAKxD77vl1xiK52a0aXDUovzXZHhLZIrtRdrfVhCe76Q
	12cyZpAXp16EprTl+WZPucOgkRXsuml9kXyb/gOq3sIF+GsDHZrnxqsx5q2OGKk9
	Lta3g/1SFu0Ht7eUlEGwKj9v2nyojzUDtpEBFE/6gMcWgBLoOUalALEMPcw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0yu5r9h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 11:15:14 -0800 (PST)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a073778890so1226554b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 11:15:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795029314; cv=none;
        d=google.com; s=arc-20260327;
        b=rG0KFALK/P0KUuS8clUO3DivbtxVJhYmG4MU9NEdfra2zt8uXOp/7f1I7PJw2dHhyw
         BwTzSP7LbaRM5LDVhlOQZwXsentxTp1UpzMgudBAL8c4goscv0vuy7P6gzJLqSL0/tkH
         +cm2oTQpsIN2pE36+Mdlslo7Z8ljZGiFxFooekNE9Rsp1fzdM6I5XYK60SbJJyGQk8IJ
         zloJV6z6l23n3/YzZtuWHN53DE+8h0ZFX8netxb5ECLDKsBNWwGSUXBpxNBwAAIZEyq3
         h8jIeJvyoqMDg/xQ5bYrDeRuKAezqk9tNu4youA7kZiz3FP/wmGd6TXU31gP7naZoeDw
         T7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=+xA+qBnR4DhGTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=;
        fh=mj2RKzrEwP2Xfh2W+Hx+SsnfF3aVOr1gG/VHYr5rq2Y=;
        b=QglveunJJrM7t+eisu6fWZSJI2NAJY6qC5n8/YaPaN97C7+TeAJ3bHQ0/XMxqLog6y
         I+nqRXEkeAVFJXEIJnlB+JKYI401Xjjypq1CTYkpXnW3xkWA4kRiM2di9h6ty1j7zF8X
         qmYt1qsOTqS4DuqCf3YpPrX3rHbtFuKpBYeQpjPS3r74yNcXhBcKT7LYzM72pRJQZyQi
         Y/xDGkXGAn6lYGymDUDzjECb4GChfejXsTVpetolLYxO2RZw5VpJ1cr2q/WpbNhmXdEh
         Yu/4T+myQFO65nPxDQ6wgofwFxd1Nli2c64HO/r9tKhC9RNgaS0cLpRPPeoJjnAQlmZ2
         +1WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029314; x=1795634114;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+xA+qBnR4DhGTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=;
        b=qdaCPlqneB6G1fc9ZBM+luLigWoJI4bEouzKbXRdxReMFmrHa7s6yiQE585qqUcX4b
         dGpjCbweM4A3hIiXGFb8tKynIry0dI1FbH2GuK5ep4hYdvhoMokmcKQxcwEYukh07zoB
         skDwlEPURX5kOocb2LfoFUCzSgcNQs+B9+SYJMuOPAEGpGufLrVELnzwnxadAAOe31Ec
         EMFz+Ex8q0MWloGDXLkef5bFDIrRX+iDhrP5pZU1tHzXfLHD7vIZfnVeGXYnAvtNX9rK
         wtdiURxR5DjiymIkB6247ENDNqKSujvgbQmT8RvL2JxrDP2+X+5tlacuRsYzSOl1ZH1B
         zPQg==
X-Forwarded-Encrypted: i=1; AL+hErE97phluQYDyCvX2QGQLkI3z/mpD4ptt/dSukTKExMtzye7I8PDmbGwEv9ou9ZQv1xjdV3iFs777I0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h9xX3Nq/SgaoHh5fTxlF5nJAwRxyGBjNl3agI5WuyfTnhdQ+T
	Ar+H1FbO0wZEuVoq12SfFsvKaI7ASGpIJ9RNdECSuB5RyOF5wc41Z/XT2fDcS24hjs6hhU497LH
	3yvVWFLcgP4i1gOJQI22GfE8WahcX2dEPie0lARZqmf6xn7UeCJDhBQt6IeWAgrT8z46tyhK5Z7
	r4/wqsXoaMKonnVnXvQ26gdsRDfcL5HH9Q21Q=
X-Gm-Gg: AYBFou17+xbvBZ3fB5zvDfRuHqqEX2kHH74vze0XaHTXc8kkF03lFP/f4p8E93XzATZ
	9AmLgDjMjZb05MVUX0jV4/LDaUZ0ZKLxfrM3v9GQN3VAIdVFuioBtUOH/yv7lzn0iNkfZurZkWW
	h+FWGsWYUy+xZhEerB9T7lAj0HiT1nlh5xvLKO3KcgR0t8616X70AP/dEoFAavl12OdBT9agWYU
	xA2GHPYur0cyDvpfGQrww/BjfD7gMBP
X-Received: by 2002:a05:6a00:32c7:b0:880:e4a7:b1aa with SMTP id d2e1a72fcca58-8c5d46deeffmr3344628b3a.55.1795029313757;
        Wed, 18 Nov 2026 11:15:13 -0800 (PST)
X-Received: by 2002:a05:6a00:32c7:b0:880:e4a7:b1aa with SMTP id
 d2e1a72fcca58-8c5d46deeffmr3344573b3a.55.1795029313133; Wed, 18 Nov 2026
 11:15:13 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <20261111005533.6436-8-toddfreed@meta.com>
 <ea8a18e0-12cc-48e0-903e-325a8ece5a0f@iogearbox.net> <CADh2yMxffQ3cywT3aNg3SkVfog5CFnUSp34F1esyun-xUBVa9g@mail.gmail.com>
 <4d271539-b2f5-4fb9-a4dd-32becd02ce5e@iogearbox.net>
In-Reply-To: <4d271539-b2f5-4fb9-a4dd-32becd02ce5e@iogearbox.net>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 18 Nov 2026 11:15:02 -0800
X-Gm-Features: AclHuK-4R9Nf7O3FLY7hrUyXB1KdmwvUFFQk3aRrICEDQQcjmr2v5AAMDg1nX5s
Message-ID: <CADh2yMyo1VCNKC58oJiOLJ2NtGqAFQfxLY3iNbP5mtQhaFsR0g@mail.gmail.com>
Subject: Re: [PATCH net-next v1 07/15] bpf: don't redirect decrypted skbs from
 egress to ingress
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Zahka <daniel.zahka@gmail.com>,
        Donald Hunter <donald.hunter@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
        John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: i5kV6Npnre8KAIWDokQIUNM0BCP6CU7O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfX8oNAGKA9fjtq
 noMCnz0eBpNYXdsP2cUzONE2DBfCTC4EgfNXpm6TWgkTSIdUOLe0tRN8H+Dz3LbsTSoSGJ9XaAC
 jrIH2ny9M1LI+NmRMBPZ39q6crPg5xQ=
X-Proofpoint-ORIG-GUID: i5kV6Npnre8KAIWDokQIUNM0BCP6CU7O
X-Authority-Analysis: v=2.4 cv=BPomP1QG c=1 sm=1 tr=0 ts=6afdf942 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=03ozwUkBphtHgyqjj1sw:22
 a=DIuMb9_t4Eg30DVr1XQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfXxWJjgrF3oSWI
 f/cJ+7PGY5iKS2rEugYG0FdOTB0Qw3pfcmFLcdP6LL8qVHHELZpjM2/6QAzCuCE1rPs0zfokpfm
 oyhnwS8QEi+cm/kn/XYqU9MkraEgyltWIY422aik7HtlLxHARIwLLcwIVT29/MaSWWI4qU45T2R
 X64rv6av1sM5PuUjYk6whSqcdxyfBZSO6JBbw3ENc/PaCH2lutNJbTPJ4voQ5W1xba2Q3V5TNMM
 km42HGfNwPmw8i/PYk64hTDRi2q6wedf/9Wf8DWRGs1oKlijcX6lKy64xYIJwQ8/y52IZE/ue7t
 WorZVRdhKsARCDtuqpr3kDgsyqAyyoH/xD1QNBtzCv59UE4m0M+OZx2xp2ceplENhN5BVRo/OJX
 Ufqih/n6yEZmmIWCN8bXbzHkIfsqI2PnPwp3HkaiLd2cOk8S21z1JuviCm32qxqCvRs1ghz0//W
 YHHkl2wOmFj6Qug5IlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01

> But why under skb_do_redirect? I meant just here:
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 532405988fd9..ba112111de22 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -2471,6 +2471,8 @@ BPF_CALL_3(bpf_clone_redirect, struct sk_buff *, skb, u32, ifindex, u64, flags)
>
>          if (unlikely(flags & (~(BPF_F_INGRESS) | BPF_F_REDIRECT_INTERNAL)))
>                  return -EINVAL;
> +       if (...cond...)
> +               return -EOPNOTSUPP;

Yep we are on the same page for this one.

>          /* BPF test infra's convert___skb_to_skb() can create type-less
>           * GSO packets. gso_features_check() will detect this as a bad
> @@ -2563,6 +2565,8 @@ BPF_CALL_2(bpf_redirect, u32, ifindex, u64, flags)
>          if (unlikely(!bpf_net_ctx_get() ||
>                       (flags & (~(BPF_F_INGRESS) | BPF_F_REDIRECT_INTERNAL))))
>                  return TC_ACT_SHOT;
> +       if (...cond...)
> +               return TC_ACT_SHOT;

bpf_redirect() does not see the skb, so it can't check skb->decrypted.
After the program has returned TC_ACT_REDIRECT and
skb_do_redirect() is called, is the earliest point at which the policy
can be enforced.

-Todd
