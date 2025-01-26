Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D724964F
	for <linux-doc@vger.kernel.org>; Sun, 26 Jan 2025 14:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737900736; cv=none; b=rN9CiioYVrXoXvaIvfE25CLPrIGV3via2/oG2UMwCviqxLFlY7PYZsl3B2xrkY90CZQGSqGz/D5SGQBVMcUMmvkHn/lTn6UfsVkDgd/R1GcgmbPur5KuBtj5PWsorxOmKEwgzO2FaMH+Ln5ta15NEhJGgNuWbzLwXKKjm8NcEdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737900736; c=relaxed/simple;
	bh=da9YorvvFk4UIYAefIerEYb4xCuivSVbVedCiCnFYfA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i7J9epO0wpNgg0Z5dRAUiSYVmoNdHkkbKeEFppFzOrevhwWsS6rKPlmnAaUAyiw9fFsEbU0DzH/vBiIxRMGPWAaUkZq/RWbjVsWp5EbUeGUcvArz5JVkTBNs6Fc2LPYT5QOsFJ6gzYqTmTaVhjaGwdkOr+jkCatHZoNGnKwKfMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=H2WWdMxT; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="H2WWdMxT"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso8030273a12.0
        for <linux-doc@vger.kernel.org>; Sun, 26 Jan 2025 06:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1737900732; x=1738505532; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=da9YorvvFk4UIYAefIerEYb4xCuivSVbVedCiCnFYfA=;
        b=H2WWdMxTEBWu8YzCIX7u2/9XZXqzo1mKYjwVtSD3h4/dByN4Z6N2UrMXOqxljunCje
         Pqh52tYfxCAWMjPAeGKyyGiJNWpmEwGStY9IMMTuJnR7NuVVQboZTdD+xrquWP7rs2yf
         U0j0tEdnklmUatLiNIx/OGwo1mgYooIBdN3LeeJEDJ5pD600aUBuwLsa/WRkSB9CKRdd
         No8jyYnX/TWy747D808Bo8tsxezlEsWuJ7d/6mYbg8+pQy39bsesQR6+cEVOensfdC9L
         GbVB/w1wrt+4nvBs1BkRlEtDmbfc1f2HUZaBvvbewkFR4ZQYYbsyhibrrHZN4nO4a+kX
         JMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737900732; x=1738505532;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=da9YorvvFk4UIYAefIerEYb4xCuivSVbVedCiCnFYfA=;
        b=eQ2s9TOpugMKUFieVi8t3lCQRjUn1rgtdMfD7hCCZDLvHGsg/zNgz8fc5juTRhMVkf
         /sca/h7umfWptDbxf6y9G/nqmaHlRC9zR825ov96HjLdP365Miwto+wnU/UHsJAFF7Gf
         c+Yt6i7sa9h1VnEODdZmINwyaaEh5lnBivQBel3wb5nGSozT1+SDrXASPvW3Sru93rA2
         xZ0vF/VinVg5/0BqQUPD2vgWRwheEn2MZDjShVfekewkkXRW1Li3G9ge5v74ZvEIxAxp
         Uz/RRvpMWUz1eQA3J0fpAnwtZ9gcsXWhCK9Wam6fnAMajaUKON/ogqyLd1zL+XGgG+mv
         zLrg==
X-Forwarded-Encrypted: i=1; AJvYcCVOVqyCH4XXdb3jNCgu7rFsZQlfz5+DwU+j1CRpY+Ae7/TbGSmzM/Li9246RlnDqORrnuu/ZOoP3zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcUSIFYZHAvDQSFo6qmPuujToi371puo9/WZEYIdXEAJKGyzY5
	dvqkVHw5CG5QAn/KMsfHWsdcrf2xM6/vLxIY1vzz7IlHCpnWfy6tzyPZm1RX/ck=
X-Gm-Gg: ASbGncvCxecii49OurXTI15YpdGwSI9Lx0d4RfiEmcocQqKxdJSR1uZqaeMDO4ZwweX
	Lm36RwX6d9MudcTyCmQYksTqKmQyh+gFdN97Hai2QTTfe2XMOyq2n6+VRMrBTaGsg7rypdC2U22
	zbMLpWnMZ2Gp0uVztob+WMhn/QjiflrbfYnQKR7XX41GleYEm89KfQN1FIMmS+ofIhLmlD6XNVv
	92B+TogN1RqIcwn6YTNSfOzsfC5c3ULAnmfYy6BgzW11DRc3VnCrrSD8tUcZ0aBJKVFEzd+kA==
X-Google-Smtp-Source: AGHT+IGBKFasEkaDtZZ5CWcrV1Bxnz3k+ijYYsGxkH5Dhoqoj3FM7YBEen0VjurFTCvcD+kWOyT5Vw==
X-Received: by 2002:a05:6402:3509:b0:5d0:cfdd:2ac1 with SMTP id 4fb4d7f45d1cf-5db7d2d9958mr37213488a12.6.1737900732189;
        Sun, 26 Jan 2025 06:12:12 -0800 (PST)
Received: from cloudflare.com ([2a09:bac5:506b:2432::39b:69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc1863a1fasm3986231a12.37.2025.01.26.06.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 06:12:10 -0800 (PST)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Jiayuan Chen <mrpre@163.com>
Cc: bpf@vger.kernel.org,  john.fastabend@gmail.com,  netdev@vger.kernel.org,
  martin.lau@linux.dev,  ast@kernel.org,  edumazet@google.com,
  davem@davemloft.net,  dsahern@kernel.org,  kuba@kernel.org,
  pabeni@redhat.com,  linux-kernel@vger.kernel.org,  song@kernel.org,
  andrii@kernel.org,  mhal@rbox.co,  yonghong.song@linux.dev,
  daniel@iogearbox.net,  xiyou.wangcong@gmail.com,  horms@kernel.org,
  corbet@lwn.net,  eddyz87@gmail.com,  cong.wang@bytedance.com,
  shuah@kernel.org,  mykolal@fb.com,  jolsa@kernel.org,  haoluo@google.com,
  sdf@fomichev.me,  kpsingh@kernel.org,  linux-doc@vger.kernel.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v9 4/5] selftests/bpf: fix invalid flag of recv()
In-Reply-To: <20250122100917.49845-5-mrpre@163.com> (Jiayuan Chen's message of
	"Wed, 22 Jan 2025 18:09:16 +0800")
References: <20250122100917.49845-1-mrpre@163.com>
	<20250122100917.49845-5-mrpre@163.com>
Date: Sun, 26 Jan 2025 15:12:08 +0100
Message-ID: <87frl5d5qf.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jan 22, 2025 at 06:09 PM +08, Jiayuan Chen wrote:
> SOCK_NONBLOCK flag is only effective during socket creation, not during
> recv. Use MSG_DONTWAIT instead.
>
> Signed-off-by: Jiayuan Chen <mrpre@163.com>
> ---

Acked-by: Jakub Sitnicki <jakub@cloudflare.com>
