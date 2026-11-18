Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795024002;
	b=NiEVQr6CYEx9jfLpExoXe1funQnZH7qYGnksEkBkR44wdUsDnzwbcySaJT/r0n2X1RoD
	 +q9c7z9YlNviJMcfXXVmaR+okfGW0XhmuEP5L6yTkKU/daNF4qCStSIGwwvlCo7OppiX1
	 xYOlWq7qOIG0ySFcSZw9m+XA+QJNnJCKFBh0we1mdSwTgoINSU17WeTfSJvvSSmkTOA+u
	 xtCyaI68VQVKMzFDEpAEk8pJZFKug3tiYsVEusO7Ee8PCOScoJf9ZVA+xh3htHb0gUW9e
	 fEtJ0Vadu+1oPpnSBn6wcPTbENjvBzLr0Hups4wc1KDIjSkXvVYpofB/8MoWqyXnnvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024002;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version;
	bh=3ykO91BHuXIQ6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=;
	b=QnTr0e4I2BijNYgkNGJ9vc5mzyTPQQzcHJO2QndO+TZ2+KdnUhfVOyxKWTPnjJBffhgp
	 nrRwl+pxluCdeErK08EWd+6RbCzFrDcYFWLS7OqXydMjAjoJFQ4R6TM07brpGXFNaUGHd
	 yfengM7EF4CTt3m9F2YIVFsaMDcRUDeIcM2lD20f2H3ZMZCzNnnaE3+JTaz/yUILPemhV
	 V7s9Fx38vyWZS2RqFI1F7Dw/vpj5Vd3K3co35S1sHA4NeZ/9wHJB4Kkf0CbUKuI3e2oSg
	 Td52igU6jlnO++Z8bddftdiirAJRF4+OBA8kcBs0CiPpcAqhX6pESwQDSJ3i/DEieuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=mR5cWZhH;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F99606A337
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 17:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F99606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=mR5cWZhH
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGHF7531514
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 09:46:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=3ykO91BHuXI
	Q6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=; b=mR5cWZhHSGlgX9Kp6sEX3IH0+vZ
	7DhjCpS6kNifZvDX+8X4OeETq3AcTzE9isy0aS2loX670ry+7TN75kVbI8yRo1Q6
	gq+x5l6yhhuU6Wk3IRlOTXzEW1O8Kj3CPXaW7nmZ2iZTsfulilCriD9DhvSNbOFV
	+LEfsYSD8WgJDdr759A/H/ZR2SrSVA+o6i8qGD/4Jzx/vvk0c2DA1O8WtVgovNWz
	mS4mSF17IRuXojKZUPJgIbCJz3yts0xln4eo1+Af/NfhEOcjMVu4kVfu/pGgrgga
	CqMpmoyU6vuiNbRC90iCXLfbCcUEM1uT0uRPofW0D9uZzMwYVDSoS0KcRNQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0yu6fewf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 09:46:41 -0800 (PST)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so960393a12.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 09:46:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795024000; cv=none;
        d=google.com; s=arc-20260327;
        b=K9npD2UCZ8kNV7bg43ukq/O5N3xJ2blSWeMf/d/9wyOfMcEtwfmAkIqKekkG3JmvrG
         JKRtCLwAJ3z6BaVOKlU+5Qj5oxFpuKuW4uySycnfyfyNBb54nYcB/luwZssPzacAid/N
         lH6hJ3r5glW29ScaintyvfsKifAIpWiOV7iaK62wGD3dP0WSPaI7qB7Vt3fyjpsFbxtM
         NobpSmT60DB8wVcALNGDMmPOOaO3DB7ZyWFeJyHql7OBsQfglTrsqTbb8c0IoxdpmbvR
         2waY+w7Lxb6A/3uTRuruK7OXEND6ob3fn649PFCKLknbigJyNopshmfoWaC4M/oembaA
         M6+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=3ykO91BHuXIQ6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=;
        fh=pIg4n7wVlQ/cTefkakufCZ3nsZeTzJPpfqVy5EUaypE=;
        b=Aho+4Xc9vLLfLiT2Y3QGfy4Gk4JIc2HpBzEgsiKUbnZAmetE1rYZZttMSEtOq57hjG
         9qxzvJf2NZ1yGNa6bgXZ9dDM95AFkKkZA3m0zcL8JR5yeWL9LC6dz8ZLTXsdtsqrYwdD
         0RdBOpSLcWRI9MBpd7xaNnLNQLSmHU+jUeeEH4z9KD882XeUaaa/c5MFvizFXXBYoCav
         BZYvUc8UaNWT4rGblvxgAeJs0McwusEuht4kjQyy1+cRB3S/Tc28vtKK6qyMSfJrDXpZ
         i2ZwVaQtZzcMQdV4bfPEoEBGp/NB/JT18bvTkXmmKNMaGGncrAY9t6WlLUawX0NiuoMx
         RflA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024000; x=1795628800;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ykO91BHuXIQ6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=;
        b=GSc6lVCFV2WFsPFG/HCjAC9RGzSPsQQSm7Fd2nr08kyuqWtsi4oJ589ICZn4pA93ea
         vxiHCpgjLPH+sY2T0RN0elaIjA1uhrf/5cyi2AvrT4deRMawL989Z1iiTPqIRpNI9xfF
         WjQaO1NddpvxqOqjneVf4TBDeEInWbs1ARJSgY5obc48H7jJ+Wg+SviegcemvDsdj31p
         gxWpGSNXfV4ahqKjGcX+Sr70O1Ee3KrP7dci9ZtQJHnhfdfYeWcQd64qWXAsiUpr2uNZ
         fToVabxMs8AL8CeBMtdbzCPkWAncEaa6ai3xeN01g0qMYsI12H/D58sExa4R+EP44oCC
         7o0Q==
X-Forwarded-Encrypted: i=1; AL+hErG5YJcCBgpGs+U7/LI1wGrU+LoNUlOnwD7uJsDL/XoXdbRKf9ucyRlxiB7Zxqr/dyKmjHU2fO8Lpss=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I8Fkx43IWo+IK0Mvv3c7HqWR79IdEW5jl5M4ooIEciIofJr9r
	9eBE1CsOdyGkqjx1VI86vjIA/JUyD/zn2C83IceClE/jH631UMyBn9vRrjzOrVTsYSla/BBCB86
	3B5VqSaUYlETtuhJipagkMDiRG/S6246Dj8ExZNT8Ilqhq7/PZ0qhQGjjfm2cvt9GvTIaSifjPC
	PucI8kisw8xYcWlc0rHI47s94njozApZhGDFU=
X-Gm-Gg: AYBFou3BZ5zteEjCoC/4kz8bUczQMrGlh6MknAwzjlaqEUYVEGZpRnVr3AABIrLn7jI
	tvkMLh2baI63wVGPlVd7WWINwVwxjMo3CI+ftd5WJ22xbVYmeQJDYnGxZIoLISU2DjMpERcNb8D
	cmDKqWJVSXQNV4QQFSCQv6Cp7/TsiZzefjJ8ZSVRqkEEjNQVdDbVkWbJ6EfgamTHh9zFtJ7vV+z
	LTNmmg3lt200Go+f9zIcO0aUn/MMyg8
X-Received: by 2002:a05:6a21:7e83:b0:3e2:a849:64c5 with SMTP id adf61e73a8af0-3fe970fb016mr3350998637.19.1795024000250;
        Wed, 18 Nov 2026 09:46:40 -0800 (PST)
X-Received: by 2002:a05:6a21:7e83:b0:3e2:a849:64c5 with SMTP id
 adf61e73a8af0-3fe970fb016mr3350979637.19.1795023999775; Wed, 18 Nov 2026
 09:46:39 -0800 (PST)
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
 <ea8a18e0-12cc-48e0-903e-325a8ece5a0f@iogearbox.net>
In-Reply-To: <ea8a18e0-12cc-48e0-903e-325a8ece5a0f@iogearbox.net>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 18 Nov 2026 09:46:29 -0800
X-Gm-Features: AclHuK933nJ--reKuON_iU7qOJYXtOh-j2OhgmEp3HOYoG1ZpPxZFsfMEYfL2v0
Message-ID: <CADh2yMxffQ3cywT3aNg3SkVfog5CFnUSp34F1esyun-xUBVa9g@mail.gmail.com>
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
X-Proofpoint-GUID: CFVa_MIkFHPnZ6TNC4NqIuG5FbpVkmBa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3MCBTYWx0ZWRfX+r6AYIUsxzC0
 e/gZ6Bdt3ka2HyI2WiYdGbEBaZJHMBIs8uzy4iXWdfCl6eWC8tq9KvSUkBftiHnkHOFS3CCJH+B
 g8rh84V78fXsaLzmaJK7MxKKX4ogNz0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3MCBTYWx0ZWRfXxCWAWo6sXTSb
 yjgWMzsO+x42+XkQ36TJXhgyimTJZWbNwfqDBtSgjKpHjT06tHxV3Za8tmPEqhonkxZ7vdF1K8V
 YLhQbJn8SsFCMiZEv5Zo3shuFp3QKET9slIUS8mFGWd2Lf+AvOH3gprR7CJpSSBDPwEA0NJE0JY
 v7a/iPOiEL1wmQGG1M7lX0FNsUR/EJqUUVz38rgnZKd3LJaYRNspUod60oSpMa/zcdOb/aDwWTE
 mDeVklIbs2LClry+hZjJsdn+xyqYUQrEhxMQk2wBoa5BVtEQNIwXb8JlltlmdB8X8WBiHNYVdWv
 xUA4X9wQWyR89AyhdPIgY+Hh6cVj1e003ulDXEq29Q/WaaO9AtBOtv3AlgnVsJguAkR8kt7XRJl
 odE6Yh7dJEAlSMf/AwaCqpkhB1CLeKhxqqGKRIkBfkhopwwIYXnz9n5EuI03rH+U8XDpkF6uTHz
 s/WafuQvGb8r1/9lCSg==
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6afde481 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=tpM8CJlwf7uhpglF1g9U:22
 a=XWTshytv-yXGdKsk3gQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: CFVa_MIkFHPnZ6TNC4NqIuG5FbpVkmBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01

> > +     /* On transmit, decrypted asks the device to encrypt the packet. Sent
> > +      * to ingress, the packet would read as decrypted by the device.
> > +      */
> > +     if (unlikely((flags & BPF_F_INGRESS) && !skb_at_tc_ingress(skb) &&
> > +                  skb_is_decrypted(skb))) {
> > +             kfree_skb(skb);
> > +             return -EINVAL;
>
> This check should rather live in the bpf_redirect (and friends) helper e.g. after
> we check for invalid params, etc, rather than here which feels off. Also, it would
> probably make sense to refactor this condition into a small inline helper so you
> don't have to open code it multiple times.

Sounds good I will move this check into the two callers
(bpf_clone_redirect() and
skb_do_redirect()) under a helper.

FYI this patch was moved to the net series "net: don't redirect
decrypted skbs to
ingress, psp time-wait validator", so you will see this applied to v3 there.

-Todd
