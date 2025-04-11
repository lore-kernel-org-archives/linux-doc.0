Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455BC2586DA
	for <linux-doc@vger.kernel.org>; Fri, 11 Apr 2025 17:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744394093; cv=none; b=N5Z9K8aWnm2QAuj8v9+vepsF7q2KnkkXUQanvEhKMQUSHTiJy+TxR53qp6ayT16Q4inTb9iNCw5GOW37WhXDec0mP5+hQ4kArnihlumw83HsdkyRaqP661982k6BjmZc0v+Jewy5F8ebyI9xDGiuCdSv1KuJwy4IDMjno35NLJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744394093; c=relaxed/simple;
	bh=ucba/TyRjphp5QB5NmFsNbDWb/WFdcnndSRrwoEMpJA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=StrHfNj5RWvvGO+8/JcmL+gxT+lfTeTL51kc+dLikOJzWj9cEvdwtIYmXTVxWaydRFlMr6/O6EkPelhlq4LfvD/Zlw2IHfLiAop8eY3a7eP05QFevsRVO/mtDurUDxLnTthyw8M7uYxyvQ0ScTrbgQbo1S9dEU8gNWyYmQ5TA70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=XIe8zYUP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="XIe8zYUP"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab78e6edb99so325025466b.2
        for <linux-doc@vger.kernel.org>; Fri, 11 Apr 2025 10:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1744394089; x=1744998889; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZElioqvOJMRGLrrbRjtOKF/8Aggf8tT1T8UOQr1p6A=;
        b=XIe8zYUPdcuX4Vl9xiQHoFR6q7oqLvwv7yFoLGQk/648ktFbwV4erdH8vnG4UNV7W/
         4gqjXnDyTNzYf7Ro1TApfEldZpVvs2o4d5tZRSfNwQZZGsfeSL3BlxAtULHN1M7aKQgi
         XXFwNGzogrlL+z+9HIxZiUIR/mQLyNwX3Anda/UWqZiSq1c5axT8sqvWU3EutLven15V
         Jj8OWgsfRDeufCHi0tqPqmDdZifzNWFXR2NNmESArXmCMW25jJJlFQucVAgGt52nsfLc
         G1lnt9LX1ARITZ1pqid+Mb/R8j46HIDBhKJkvRaFHjCILoxzPbQrs4h+2d/2HnkwD9hH
         P7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744394089; x=1744998889;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZElioqvOJMRGLrrbRjtOKF/8Aggf8tT1T8UOQr1p6A=;
        b=r09WMkN+b3BjrLGbE6uJeJnbTWdpUH0VqGsuwwvHnFyr7vUsV9SxyQqvkWSUVQ+A4g
         IfLC15BIqy/CIymSUXwsm4aobf6fm31rGBImkYTBpGfLpcV9DMPj1rvlH1n+dtVxtZiW
         BtboXdbljpEtrcAPDZEL406v6V0vaHtjVlgDNddMB1hsy9QZJRsCGZPXXxvJb4P2za96
         rwsEb1JUBDwzVHORCRItcFVfjvWIFiPLPZZ7vx7PSzgs+grkJRB2b3agUGwn1V2TpK3W
         t3fRA88ShERkVjnRaz7h7eY+2qrEkwxt873432yoO1+PhZIbxL9PjWjPTHZWxjJyvU1Q
         atpw==
X-Forwarded-Encrypted: i=1; AJvYcCWF3z3XdCUFkIZ75us6Z4TpuaOWKiAzJyAU9KaWBPB/ksW989hVCr4fsHU94stvL89P90w8tVqygnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBv77V3X28QaqxIz7RrGSy0S04/voo2rag54W0JvgLdrxCbGWi
	KagWlE8cI2RL74zbSKDBJSTKR013lSgHxLmj60WJgMom4RxRJLLJRH2Jgf44Ubs=
X-Gm-Gg: ASbGncsHMxYCHPFGe5ZsRW8R9axYFBDHdrEc54rBMDCJmLPrdXZ9d2sAVbeBRU8G/VY
	NkO3iAAyReoHVcRaTv3jlGbznx/UENbViue84lKUQ2a/Ubjm1HWJMKs73O2mkQ28Xmgfd7hakXM
	aZLknEwmRBsPjnL0vcTDIj2Rg9wdNf98lV/Yg7497rRwsdpJ3MoQDnD2VfU7t3Dwlyovc5amczE
	Rps8PU5oPEYPV8boOcJ30whGsBhP1z5HGRiXjnIa1aDllmVhdnPW8ZeytG+NQYvPItaqcN3yONh
	+j7j07dpTJ76mppBzDfAZk6Vsu4USuvz
X-Google-Smtp-Source: AGHT+IHlsd1OjqlMWlAQPwwAuOKfCl8uk/pGPlrihEPFE8d9StcXjSTkGzgHNBrELNxLTW7C3iUInw==
X-Received: by 2002:a17:907:6d0b:b0:ac2:cae8:e153 with SMTP id a640c23a62f3a-acad3445f7emr328570666b.4.1744394089440;
        Fri, 11 Apr 2025 10:54:49 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac5:506a:2387::38a:3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce70ebsm479714666b.178.2025.04.11.10.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 10:54:48 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Jiayuan Chen <mrpre@163.com>, Michal Luczaj <mhal@rbox.co>
Cc: Andrii Nakryiko <andrii@kernel.org>,  Eduard Zingerman
 <eddyz87@gmail.com>,  Mykola Lysenko <mykolal@fb.com>,  Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>,  Martin KaFai
 Lau <martin.lau@linux.dev>,  Song Liu <song@kernel.org>,  Yonghong Song
 <yonghong.song@linux.dev>,  John Fastabend <john.fastabend@gmail.com>,  KP
 Singh <kpsingh@kernel.org>,  Stanislav Fomichev <sdf@fomichev.me>,  Hao
 Luo <haoluo@google.com>,  Jiri Olsa <jolsa@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,
  bpf@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 5/9] selftests/bpf: Add selftest for
 sockmap/hashmap redirection
In-Reply-To: <fnsy7wey4vaewoyur5363w2q2nb7dvljmaroijflgq2hfqbumo@gqdged7tly47>
	(Jiayuan Chen's message of "Fri, 11 Apr 2025 21:09:53 +0800")
References: <20250411-selftests-sockmap-redir-v2-0-5f9b018d6704@rbox.co>
	<20250411-selftests-sockmap-redir-v2-5-5f9b018d6704@rbox.co>
	<fnsy7wey4vaewoyur5363w2q2nb7dvljmaroijflgq2hfqbumo@gqdged7tly47>
Date: Fri, 11 Apr 2025 19:54:47 +0200
Message-ID: <87a58mh9co.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 11, 2025 at 09:09 PM +08, Jiayuan Chen wrote:
> On Fri, Apr 11, 2025 at 01:32:41PM +0200, Michal Luczaj wrote:
>> Test redirection logic. All supported and unsupported redirect combinations
>> are tested for success and failure respectively.
>> 
>> BPF_MAP_TYPE_SOCKMAP
>> BPF_MAP_TYPE_SOCKHASH
>> 	x
>> sk_msg-to-egress
>> sk_msg-to-ingress
>> sk_skb-to-egress
>> sk_skb-to-ingress
>
> Could we also add test cases for SK_PASS (and even SK_DROP)?
> Previously, we encountered deadlocks and incorrect sequence issues when
> the program returned SK_PASS, so explicit testing for these cases would
> be helpful.
>
> If implemented, this test would fully exercise all code paths and
> demonstrate a complete example that covers every aspect of
> sockmap's packet steering and connection management capabilities.

This could easily be a follow up in my mind.

[...]
