Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEDE52D2CC
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 21:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789767672; cv=none; b=gOAVVtbQYsBPCFyppH6YhHSU1XXoXIBK+alzCvrlwpAsipqC5Zqv7FZSxYKN132zMVPcifpvbb3IUt4vmFsZjRm7B7ORXGQ9UJeS34bpG+lkUokIzXH3elXdwmrqRYoGwopVHMVEEa9gucHdfuOfcYlOUKuSc/vikQz1LF3pZu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789767672; c=relaxed/simple;
	bh=nDTmUj7sxiRZWw0UZ3oWow7n2lAuqZkJ8d5o3RIweZM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=flEN2QZ8pjqMd3/jK6Noy5t9PpKu2Q5OKItPWI6YPS6BHLAiGNK+KsGT1ErTUEuxoj1bpvteEzRInE0JGcNDygiEVTLqpoANnFmKD0HLSP/WyNEcF0W4CuSB52iCvbDngBStPdI2pdM1eDodI4KZzCHfUdXvJYLieNyPbaVN9fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uyh4QE9y; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uyh4QE9y"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so1047754a12.3
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 14:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789767670; x=1790372470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1bBne8O0S6mfXSySaLyMvwVSNnSHmNTMqD1uvwMapRY=;
        b=Uyh4QE9yq9i2Si2Nk9BMCwdAirU2AySP0L3BL+k8Sup/IOG7eafHN4ivvJYe8RxkfJ
         EZmYYPH2vevDqN6VDegn8Mv3aVDi3fo0vvtNEG01o3wzQd1ku6LFtZvDi8WUVyRG+bfb
         xE3mod/ONhwQAV/M36DOGyEzIYBPRlx0F98Puq8ElBV9nmQguICXf+nluum7KTGF4yxO
         JeDVW3Q6NzliGzT74piRr1Wcj+df/obHo8rd8IsWn/5mjcShZGCiiL2tCsmzMP3R+1lq
         6HuEiNj3rwchLlre7YcLvzNws8YQn+4el1gKhRlhMhJVVEayYkjzjORcAg5i2YXglP0J
         6eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789767670; x=1790372470;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bBne8O0S6mfXSySaLyMvwVSNnSHmNTMqD1uvwMapRY=;
        b=q6+HfMkW/JGOoYMzrF/EfbqzHfqjSEX8hkTwmF6BHcFsFhyw8GApNvfuvDx92uzMlz
         AR0Gmd8XLmfQSY7PQgkAtIpNB0yAvcIydpXtaGAneVdiZvenKeZmJBiuzrHxrtjHQez5
         VaStVDTGod+OM6uGUEVyT66Tm36ZFuY72uj+ucKnIRdDwdSQ7Nnnr9wZJXooDb3+cIVN
         J1OU3sGjgGrDIEr8ibkc2/6L+vXHrgkXEeodLzdI5+BUSRhSE7zdu2EawNXZkB6prTfX
         EHkQmRn9iZq4SStGn+jrDDd+mRkKVPE/Z/YnP3Z8qXTFSOINY8LkLONmJu5DAkVAcdMU
         SGBQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7ul/mxjtYEwyqXMaC9OrgjbYyOEzUWdNMsqFtlB+xcDMWtnb4i8qlGRpMHvYl/wOjlLzh2wlyssQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lDAfbXCpYPTmsHtDhoMhZR5Uu6JJFR4kv9fitHeOzDjeC55KKk
	gad0voC5tXfrkXxEF878a7hHDVTzUfKczL4Kkn4FaK0Q1aUtVJDI61z6EMDdylPadA==
X-Gm-Gg: AYBFou2mc0vjzaygjYAG4MOvJzb8nJzD52r7Tdj+DCdHCa7GZ/Se0anotVB92He8EhS
	CEXwlp1RBTEXnfcvUV/RTQNN4VEn0cGviaD1tbSnDVdtgfTgg5QEYT5rDc64RPhQX/cA/cWrIXT
	ylYkjdZ5DuUqN9pnZcU4pgBg3isOiJfQiTTvkmVEeXjAbHc9OV4doUOVTw7pTWPBaFWCW5tjWss
	T5pE+Mv+2iTgSrLrfSVIW6UwADAABx06P7oMZWexgj9AJttRFZW7Z7mcf/I58SJ4ZaNFUk1zv8W
	rPgC7EcxYE/LmLyzsyy7jlmaARnLv7oVY13JZWnJ1a6+730IP1nL0oQ6Hm/Tt6D3txkmGROwyd1
	lNQyiNWSFMcn1KkORZQfSlra0DeuUIOB0VoCuC8ezHGt8ryZfpL1wmKCtuf7eDWQ+p69gO/9mvL
	y2QHdeqN7+HUiVjSU8KTXHZBroaQLiUHtpE5qDMd0C9i3h1Y5AnZ5laL4kZwQf916721EajkpPJ
	xA/wHI=
X-Received: by 2002:a05:6300:6cd1:10b0:3dd:a006:7b3b with SMTP id adf61e73a8af0-3dda0067bb0mr1085141637.58.1789767670167;
        Fri, 18 Sep 2026 14:41:10 -0700 (PDT)
Received: from bsegall27.localhost ([98.45.141.147])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55d2269sm1072505c88.11.2026.09.18.14.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:41:09 -0700 (PDT)
From: Benjamin Segall <bsegall@google.com>
To: Zhe Liu <liuzhe1@kylinos.cn>
Cc: tj@kernel.org,  hannes@cmpxchg.org,  mkoutny@suse.com,  corbet@lwn.net,
  mingo@redhat.com,  peterz@infradead.org,  juri.lelli@redhat.com,
  vincent.guittot@linaro.org,  skhan@linuxfoundation.org,
  rdunlap@infradead.org,  dietmar.eggemann@arm.com,  rostedt@goodmis.org,
  mgorman@suse.de,  vschneid@redhat.com,  kprateek.nayak@amd.com,
  dtcccc@linux.alibaba.com,  changhuaixin@linux.alibaba.com,
  shanpeic@linux.alibaba.com,  cgroups@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  Tao Cui <cuitao@kylinos.cn>
Subject: Re: [PATCH v3 1/3] sched/fair: remove quota/burst write-order
 dependency
In-Reply-To: <20260911092258.660771-2-liuzhe1@kylinos.cn> (Zhe Liu's message
	of "Fri, 11 Sep 2026 17:22:56 +0800")
References: <20260911092258.660771-1-liuzhe1@kylinos.cn>
	<20260911092258.660771-2-liuzhe1@kylinos.cn>
Date: Fri, 18 Sep 2026 14:41:05 -0700
Message-ID: <xm2633v6w83y.fsf@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Zhe Liu <liuzhe1@kylinos.cn> writes:

> Burst validation currently depends on the active quota, so the same quota
> and burst values may be accepted or rejected depending on the order in
> which userspace updates them.
>
> Make burst validation independent of the current quota while preserving,
> for finite quotas, the previous maximum configurable burst at
> max_bw_runtime_us / 2. Keep the configured burst across quota updates and
> cap the effective burst to min(burst, quota) when CFS runtime is refilled.
>
> Fixes: f4183717b370 ("sched/fair: Introduce the burstable CFS controller")
> Signed-off-by: Zhe Liu <liuzhe1@kylinos.cn>
> Tested-by: Tao Cui <cuitao@kylinos.cn>
> Reviewed-by: Michal Koutn=C3=BD <mkoutny@suse.com>

Yeah, all the state validation that winds up requiring doing edits in a
particular order is annoying and imo not particularly valuable.

Reviewed-by: Ben Segall <bsegall@google.com>

> ---
>  kernel/sched/core.c | 3 +--
>  kernel/sched/fair.c | 3 ++-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index b998ef6b87af..c399f0a59c25 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -10181,8 +10181,7 @@ static int tg_set_bandwidth(struct task_group *tg,
>  	if (quota_us !=3D RUNTIME_INF && quota_us > max_bw_runtime_us)
>  		return -EINVAL;
>=20=20
> -	if (quota_us !=3D RUNTIME_INF && (burst_us > quota_us ||
> -					burst_us + quota_us > max_bw_runtime_us))
> +	if (burst_us > max_bw_runtime_us / 2)
>  		return -EINVAL;
>=20=20
>  #ifdef CONFIG_CFS_BANDWIDTH
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index ade1eceb39b8..e6f9d9296fd2 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -6627,7 +6627,8 @@ void __refill_cfs_bandwidth_runtime(struct cfs_band=
width *cfs_b)
>  		cfs_b->nr_burst++;
>  	}
>=20=20
> -	cfs_b->runtime =3D min(cfs_b->runtime, cfs_b->quota + cfs_b->burst);
> +	cfs_b->runtime =3D min(cfs_b->runtime,
> +			     cfs_b->quota + min(cfs_b->burst, cfs_b->quota));
>  	cfs_b->runtime_snap =3D cfs_b->runtime;
>  }
