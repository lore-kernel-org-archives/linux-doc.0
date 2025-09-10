Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BD2338F59
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 20:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757537094; cv=none; b=mnNLG0Wuztsf09Tm8a9wEFbc+J+XqY/AwZOsw1xgojcIq01q5BDqSxzZcKnBwhaJaKIvjnKlxFHKAbDaIoTRm3N4i7x37DN1LUXh7zCTC7X7gjHC9A7K+g0cV51EtrIEGAPZhBmwJ+DrQMw0gIg9i2fHMYPhR5xjsjeFTa/sabY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757537094; c=relaxed/simple;
	bh=PKRrTKZjGDnwCc9xSD/VofdNKOJmPvBt27BWd4yB0Yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qWmj8EShXAEBnPH42pX+u/g/hf1QyXCuYA5v5gCEQ46dFSUyyWVufmEa5AZ5CxCcfq1sBRCmOrRPtqCr0Jlo5rCZ5xrQ20hE8olE2DTVTyWp9Q2sRkr2wzWep8BOQ7FWLn3H8RA3f5TiRU8zV/cDHWxH0gBctAYj7eNMV3QgLwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEVcF0EF; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEVcF0EF"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3e2055ce7b3so46446f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 13:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757537091; x=1758141891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hURlif60FPSjNG3pKdufMNt+U9y26SiGUSn1HYK+xuk=;
        b=kEVcF0EFinSgGU78S+B/hpxO7gFTN7e8MW2szaA7lNDhzVumqHhzY1HLQcSM4Zz+Ha
         h8K6g/aPSv0hEA2XMPCcVW+oWULWMM0A+tb/98vSE5eM28BSDtLKGRtdYJbi5NMfJRX0
         VpHhC5MmI7Y7FUr8MhjJdhWHPETg9TNd9yPjPwd+eVDqsLK8zXO04j7zMD0MQaE9v3PC
         accUehLsusOWr1OTI7/40lA+Mq455D6Oesymv1ntKzj20vxNfFfiejISJGVH3ov2mFoF
         IR4fNLibzY/n+Mamo5ZmL6CbNp1FEno8c9+J+bZA+AxNAttuISfrF3iuvKlyjvg8cFpN
         tKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757537091; x=1758141891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hURlif60FPSjNG3pKdufMNt+U9y26SiGUSn1HYK+xuk=;
        b=nsHNrrPntuVm+071QbJrEaYCzklktvFpsR18aqIU0i9gss5F/bJpiD+x1+a2ZeqXVv
         RmVW8ASp/yYYiwqDinHpnd5cgJdjbpSeuVZYDH32qfw/POtfao+tF+6lP+yKGBR26dux
         pxWdoFxpPLo2tKitEXQ5nmOeOVyUVI+Qwm82bHggzGn/Jpjc5iBmsnHAyGnMboj/R9hO
         T0PjbF7ZuOlKS1nFfsO/q/vmZweXQiqr+0si9i27VFTljllR7g2+9HDXRrqSygBgvohr
         NadY4ynvz2Jv0/2wianiW1DVekpr7X6ZYaVGqMDgdQRGhE4r/hr6eKD5LbBWieFUbzkN
         uExw==
X-Forwarded-Encrypted: i=1; AJvYcCV63zQmQ8Z8erhkX7RC5A/gxrohb1XP1e+3jxi8xgoAjfdvwFwLJiw4I5uTNQnukLyqnNKPPTL5hBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvbAeqcDPdbNw/Gn6I4MI8ZgZulrm64ha6Oncpx06oyhJVYrXx
	78Ts2eJocmW8pn41KR4/1meTYxLika7OMR5z+92F4T8e5ZQFstcEybG7bB1tTvF/1JRORnf9e1y
	zYttQftimhctP4eFt6/K3wm0GZ1/hggE=
X-Gm-Gg: ASbGnct74xwpu0LEY6af3mgVG1Po+9v7vDVg5GoGniHnomszOXw8bhLty4ks1e6/0/b
	MChJUacVWfYEjkYLytI0EALNTMLaDy1apOZ4eIJJ9MKjXUkxF6z5PpBlyKV1t8CF9A2eakwkzg9
	PfkTe7DyJZeCcXG7UGq6Z+t1h+3Uz8Fuof2KaweaQvd0mZVT8+49cLDy+0Kzsp6TDB52al7+LgZ
	94JtVuFnEj3L1NAmqrOhjrFG/oLqaFUMUTeFVx0VsjKPdc=
X-Google-Smtp-Source: AGHT+IEgKZrxpEMcuKUrNZZ/VjmpOkAy5xtzbBJMsk33KsFm2AIoLuo+xsbMm68dkSaOFsa/gF4LW0lXPvvk+72L35I=
X-Received: by 2002:adf:9c87:0:b0:3e7:17d4:389b with SMTP id
 ffacd0b85a97d-3e717d43b81mr9837201f8f.52.1757537090882; Wed, 10 Sep 2025
 13:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910024447.64788-1-laoar.shao@gmail.com> <20250910024447.64788-8-laoar.shao@gmail.com>
In-Reply-To: <20250910024447.64788-8-laoar.shao@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 10 Sep 2025 13:44:39 -0700
X-Gm-Features: AS18NWC0PddnEh_K4ml7j_4k0fHCbV_INsBk7po365NYjaa9qQUoIAl6ZZzp51o
Message-ID: <CAADnVQJF6YtzOojGV16hmUpFCiZGxuJAi6=Q4TK=VPH=_93eJA@mail.gmail.com>
Subject: Re: [PATCH v7 mm-new 07/10] selftests/bpf: add a simple BPF based THP policy
To: Yafang Shao <laoar.shao@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Liam Howlett <Liam.Howlett@oracle.com>, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, Johannes Weiner <hannes@cmpxchg.org>, usamaarif642@gmail.com, 
	gutierrez.asier@huawei-partners.com, Matthew Wilcox <willy@infradead.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Amery Hung <ameryhung@gmail.com>, 
	David Rientjes <rientjes@google.com>, Jonathan Corbet <corbet@lwn.net>, 21cnbao@gmail.com, 
	Shakeel Butt <shakeel.butt@linux.dev>, bpf <bpf@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 7:46=E2=80=AFPM Yafang Shao <laoar.shao@gmail.com> w=
rote:
>
> +/* Detecting whether a task can successfully allocate THP is unreliable =
because
> + * it may be influenced by system memory pressure. Instead of making the=
 result
> + * dependent on unpredictable factors, we should simply check
> + * bpf_hook_thp_get_orders()'s return value, which is deterministic.
> + */
> +SEC("fexit/bpf_hook_thp_get_orders")
> +int BPF_PROG(thp_run, struct vm_area_struct *vma, u64 vma_flags, enum tv=
a_type tva_type,
> +            unsigned long orders, int retval)
> +{

...

> +SEC("struct_ops/thp_get_order")
> +int BPF_PROG(alloc_in_khugepaged, struct vm_area_struct *vma, enum bpf_t=
hp_vma_type vma_type,
> +            enum tva_type tva_type, unsigned long orders)
> +{

This is a bad idea to mix struct_ops logic with fentry/fexit style.
struct_ops hook will not be affected by compiler optimizations,
while fentry depends on a whim of compilers.
struct_ops can be scoped, while fentry is always global.
sched-ext already struggles with the later, since some scheds
need tracing data from other parts of the kernel and they cannot
be grouped together. All sorts of workarounds were proposed, but
no good solution in sight. So don't go this route for THP.
Make everything you need to be struct_ops based and/or pass
whatever extra data into these ops.

Also think of scoping for bpf-thp from the start.
Currently st_ops/thp_get_order is only one and it's global.
It's ok for prototypes and experiments, but not ok for landing upstream.
I think cgroup would a natural scope and different cgroups might
want their own bpf based THP hints. Once you do that, think through
how delegation of suggested order will propagate through hierarchy.

bpf-oom seems to be aligning toward the same design principles,
so don't reinvent the wheel.
