Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47938337694
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 16:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760546168; cv=none; b=dTQlbawoajYLuJhQYqyBE5PBhH/nRZQcGpxD0+gs2uk1aIj09rLHVh3yRRKFesyB3n914Cd7YdPqLTs8pmGDdD+t0uv3p/aYzxqH+iwRkl8X8HeO5Q6zHGCxzclEcCop5VI/jYXp03l+G5yFQvznTH64LlPrgZ2a03iRL9DWPqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760546168; c=relaxed/simple;
	bh=xH40ds73k+2XlYhTO+MkHbE0jGwPWYCtKVwxkuUpaVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bkit8Cduik3RHnXjLQZtZjk5OoZGlFXSORNRWQmiZGGyF8wSRsO67Qo5vuYljVzn9o4ciHYf4GRauF/6IiMq4VAYv55b1DWoEEqUtotPuVck8OiE1iL8al56uvcC9C7twieU/ljG/Cr5hFN0Eyr9ZuiSBsR2fzMFl4Gwm+8nImg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0oNVvXQ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0oNVvXQ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-33b9df47d7dso350453a91.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 09:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760546165; x=1761150965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pkn+CqkssDx8H+vXeI6R3v2XcqWE9l2NOxynVDwDTlI=;
        b=k0oNVvXQLiHvQYjLFNQ87ElZq4C42/eyoPEuxcBR6dYuYolDFxM06MmV7EzetI92aE
         bduTm/PHLuBaHgPlua9d3yPKLt16KuGqSWDm4nCP929mIcpdAXHPD5crAZ2/PHtEhi66
         5AZXsaiLceqBPmWP1/oYB+yWpFGNQIZ+pTHasR+RUrWKBi/FTqF/gu/V02NBmVrRI24w
         7a9PguXhUpV0tCtjxfCHqSj9NXD1J1U2QG19S4FPvaVDAAmBX+ahJPX5BSpNrNiZ2ShN
         Wf0AZMy56hDiAQKR6xMbc+bTWn8MxQEBkM3Io1UiXL6Bp4nA7anwF9bGScAlf3ewLcaz
         h/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760546165; x=1761150965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pkn+CqkssDx8H+vXeI6R3v2XcqWE9l2NOxynVDwDTlI=;
        b=m869AgD42DnzjJkuw/4oL6rM6WwxdnU3TqWAU5GobPzWhTMAtr0W/z8g6lBKyc+/Cf
         B1iZOeK7eQj/3RC70zxlJiqhOlE+8+iaQONeL6TrDCVirY3j/2ul3ntWT7Y4GCmtuQiE
         7Tu0oTjI4MuSb8I0ug3OdgG2IZRoIk8zClTvvM9mbA1V3ZWxUbK2V42jRoDP9v8GW3uL
         s5yOyglKdiu+mczBG5jsdTvPP+caBH5qUPyglSbMOYApk9Na1Y9Ec2ypAAkC7vp0Vgis
         OECp+Tn6J2h36ykx3daVg/L938nMG8kkUTMYF0+OB5JaaDGtum/xB7FyhJlXB7Kb5V3Z
         VD+g==
X-Forwarded-Encrypted: i=1; AJvYcCXL+CEIuybLA+P1niKsD+P7uNCSgsk5vk30+EwtePGu/2+Nt883RAFTpV4Bf+GZgXi9iwxWga2C908=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1igWyr6gFNWYEflDh4O02LEVpPPjANNsHkPe92wpUlRaCN7Ln
	W8Z4QMYF7ffhndPKK+989EuJXmVokpjwVCB7uTNYj2q5p7ZGqVpJrshow19vrw+yaBR2yv7/fBK
	BT0QvAOMPDSI+tPuc7njcIMjZgBboyuM=
X-Gm-Gg: ASbGnctYbVAu8EBoIf6Hao/i4C2jcB4rQ0jhrovG13AA7QJ8FILgPeqqzAuX4KqAlL2
	jFRl6Sg0RD/VbYlSde0J/IPNGIOq/bz9zdTaVwsNrWhr1N/OJXzrgFHgMTq1BFKHnGTulWdWKsJ
	h/AWJkCcUR+U+skyqNy9hjW0iT96d3/qhMSY0CKRleVZEz6O4Vd+M/MEXejA9PoBMGa01cyPGDw
	zmDEP9LjidKYtURXsUv5CYW+bWVJpwYEjWMmH4szLTS3d+C624mwQIpWi7D7zE=
X-Google-Smtp-Source: AGHT+IFGNrAI2dq3NSrRL0OcSYM4Z5okAFYQKhuh27ccqKymPLtZeC7L6zTwS+qJQzu1LIvsGty8JwB7F48ezlC7tv0=
X-Received: by 2002:a17:90b:3ec6:b0:339:ec9c:b26d with SMTP id
 98e67ed59e1d1-33b510f8488mr41389554a91.8.1760546165323; Wed, 15 Oct 2025
 09:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015141716.887-1-laoar.shao@gmail.com> <20251015141716.887-7-laoar.shao@gmail.com>
In-Reply-To: <20251015141716.887-7-laoar.shao@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 15 Oct 2025 09:35:52 -0700
X-Gm-Features: AS18NWADyZQhCWHApHI8yY-s9dj0g7hVHDNjJ__LLzs5iWjWLcNDNGLGYWesqlU
Message-ID: <CAEf4BzZYk+LyR0WTQ+TinEqC0Av8MuO-tKxqhEFbOw=Gu+D_gQ@mail.gmail.com>
Subject: Re: [RFC PATCH v10 mm-new 6/9] bpf: mark mm->owner as __safe_rcu_or_null
To: Yafang Shao <laoar.shao@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, hannes@cmpxchg.org, usamaarif642@gmail.com, 
	gutierrez.asier@huawei-partners.com, willy@infradead.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, ameryhung@gmail.com, 
	rientjes@google.com, corbet@lwn.net, 21cnbao@gmail.com, 
	shakeel.butt@linux.dev, tj@kernel.org, lance.yang@linux.dev, 
	rdunlap@infradead.org, bpf@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 7:18=E2=80=AFAM Yafang Shao <laoar.shao@gmail.com> =
wrote:
>
> When CONFIG_MEMCG is enabled, we can access mm->owner under RCU. The
> owner can be NULL. With this change, BPF helpers can safely access
> mm->owner to retrieve the associated task from the mm. We can then make
> policy decision based on the task attribute.
>
> The typical use case is as follows,
>
>   bpf_rcu_read_lock(); // rcu lock must be held for rcu trusted field
>   @owner =3D @mm->owner; // mm_struct::owner is rcu trusted or null
>   if (!@owner)
>       goto out;
>
>   /* Do something based on the task attribute */
>
> out:
>   bpf_rcu_read_unlock();
>
> Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  kernel/bpf/verifier.c | 3 +++
>  1 file changed, 3 insertions(+)
>

I thought you were going to send this and next patches outside of your
thp patch set to land them sooner, as they don't have dependency on
the rest of the patches and are useful on their own?

> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index c4f69a9e9af6..d400e18ee31e 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -7123,6 +7123,9 @@ BTF_TYPE_SAFE_RCU(struct cgroup_subsys_state) {
>  /* RCU trusted: these fields are trusted in RCU CS and can be NULL */
>  BTF_TYPE_SAFE_RCU_OR_NULL(struct mm_struct) {
>         struct file __rcu *exe_file;
> +#ifdef CONFIG_MEMCG
> +       struct task_struct __rcu *owner;
> +#endif
>  };
>
>  /* skb->sk, req->sk are not RCU protected, but we mark them as such
> --
> 2.47.3
>
