Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007183B1034
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 21:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707315; cv=pass; b=R1PeZ0OQp5HD8LrjKe2q7QCKwCWJeEH73tslVKqNfuXviQ60gXdSAB+XO+g6269FN4GzFELB9TWx7/vdkcFpJWymxa7Fn00d1+UxvBdKbAovzKEkmrn6FLWuuHXc0pthRLGN30SGK+Gez1UTEMwCwrRiQG7s2eomLguqSwtDxqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707315; c=relaxed/simple;
	bh=GwWTZ9wHU1c1tiJoXgTKyaUHGEkH2A3iGOiUNEu61bQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eEs3Cvh++mYox0j35KvpI+iM702iLhpZ1pjVDOtTa0ecEpjXtk7yOoXFJj6IU3FQ+NGiCdpgg3dijhPw6UHJGwQlsQzIyZ7vTN53iG2DmLvWqVVpy0GMQZv5/cxROHHV83a6GTy2e607bnAhyjY/vcOord4TFHVrqZNH2Ibb+Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cbudxygw; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cbudxygw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso61422305e9.2
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 14:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778707312; cv=none;
        d=google.com; s=arc-20240605;
        b=FK+YAJSzx3ZaBxaQyIGjuZlcklCA6/YUzAR9wdA4w2eoNqjIAnecK9HT1TGSz+SGRg
         dLAUK3005gdxMCkmaqmaHpzW5TZPAzZQg+scY4MLpVBSuAdMDL6UMDOhXis+BzLalhXv
         06M+ZewQrlMUgu3r4ATvOyks+0/NWfk36R8Kmv74Fs2Yto6uyCoGlXRKQE/qp1FjOtFE
         LuOgSVdVU6jRat4ttfAWXffWrYRPxz7mLQFJ3MDEVuHTvpIri4gP+Gi1NgIlsSynjTCW
         etNRL+SfkBgnwXlyy1QdxKPE8/AotK4r51Gaa9f4iYJVVRQG27pM3g8AZfGclbawKMNG
         RtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2LiBJ0GST8n1XIAy51r++M8mb131NJHPjLOoQNAGYF8=;
        fh=zbrFiJ/+1vAFqDUvcSOoEQUOCuaZeGCBQSr6+DY+AUY=;
        b=GJzaQbCtZobtLAirEZ2W9OwRZbFqQbtDdd8XWj1Xroo8THugmu+Wchuu03NKmF1rwZ
         zEZSKh8s/Cnj3Bz2U0mA/imJ7CRUTmeIFTJCQCA6gtnI+tTeQHg+Osx7i8H8U3dGgg5R
         duzxFBJ/BVqhCr8TFMNbcWlB12upGrLvF2/UnwNw6XRA4yDOozbupWGwmUj8qdQUqH2H
         xUWmO64nxBTG2+Vi8xeTePMbfo9y6MUmqd1G2jP3dvBuCKLT9CO6LHvjsT4fF1rmgsb8
         2TNgfZ0rtFI1PS0G/OYnebm/cbkgYzyyyhPqNrn2ZrLbOLbhaY0a5uWPePS6ZmMlowx9
         c35w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707312; x=1779312112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LiBJ0GST8n1XIAy51r++M8mb131NJHPjLOoQNAGYF8=;
        b=Cbudxygwui6or2FS4/nAAP0+l0ghpe+tRnVxJ4IrpdgxmZ4JNwZYXPloMU8k8S3zjN
         JDm899AasKPQ+jtBm91pA7RQNSHIgsHS7yQKORH9615AzUtOhhVGIghcPaB5pW4VuM+D
         U9v1gTW9p//UWhke1XkIqFLfqmlGbsLfONNc4wAH7JcGW2vh0oZgldE8mE89wRpu0Rbk
         prGi3zY+Ohe8zM9wkabfHCsjWu7QSmQBg+09kgJHYXqZwsJbrvXxYGQyqw/NAZJBfGGD
         E6Iza6JMAGwHodUTZaO0pUp1h3R8T2RvfbVWPHGNkIQXNMT6wKTocRe4pMrTF3B7+t8C
         aJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707312; x=1779312112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2LiBJ0GST8n1XIAy51r++M8mb131NJHPjLOoQNAGYF8=;
        b=U0oOKmc1HDi7sNOj4bxLOfGY7XqnWEZMVdkAxhtj9BOvL7pUqUhH2x4I3jFs8eGG9g
         ZKMNGaLU+jGX+4z/qeQeP2hFzuE6bfimNp4Z/LRgqyt7uojF/rIt4PEGNzx0+N0Q7LU/
         vCtaZPkburmKef7goD24E2qBOJTYAx/9ftDyVWXYPTCDp/i+qEMaSr567/vZJWzTaYT7
         6aXbB13fvDqmkrLqrZf6y9GRZFviAV34Q7vHpOUmuLAQ5nb9j9rf3W1fkHSSwD6PKBF6
         oTahJHMKocdz3Q0De9UZunlwwrR48F+p9indSxxbxdi0xgjUs7rBgftAfzSn2e/50zPu
         u4qQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RCZwAVq8nPcH8+l7NYSY47PcRPEOgwBtsGCfc1Hb8DGnM3f4CWNTIDFPctYMvOqJHReKKHSk+dzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLlb28lnxiUdsbulgmFWiYAtSUeuWDeeaE2ZrB1VhLYGb7QMZ3
	ygd+Up82efV9kpZHJiBH2xPM6BL0owB+l9PRipGZa+gEZZMS0chuGwn0zKQJvxZBJYtLvQsIxF3
	ayFS0njuY/vZOAG8Ek8s6bEglngeNvA/NUAp5z/w=
X-Gm-Gg: Acq92OFRMS8IGtfQGWGRaik45HsIIx1U0dt+/bB28cxrYgxAga1YMXo8825FTzs3KYI
	JEMc9hWo4FssFBoKegt2Y4e0IkX7HF68oifTo0nBrJ8eXU6jNrOXXUf2UX1FQ/LlpA0SocoujA9
	8Xhl5GCaDzpNWPHqSwSPlD3hK7n+R9TBuwktAsOIKq8O5WZV4XN0Odl71G9NBgOV3dyag9bLTnn
	O7+85eEAKhWlOkDHIcqcVmtd4GKI1J3tZ9tsHfwZqEdhjoJ0Jfq/9M+RDmMVnwZ+YTeiB/hqS8I
	T4vl6Cjrt6DV4levkWD6Gtk8jG2feZIR3IwtoSo=
X-Received: by 2002:a05:600c:828d:b0:489:201c:dc46 with SMTP id
 5b1f17b1804b1-48fc9a0eda5mr74529125e9.12.1778707312397; Wed, 13 May 2026
 14:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511105149.75584-1-jiahao.kernel@gmail.com> <20260511105149.75584-4-jiahao.kernel@gmail.com>
In-Reply-To: <20260511105149.75584-4-jiahao.kernel@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 13 May 2026 14:21:40 -0700
X-Gm-Features: AVHnY4LlrQC7Ry6VArRSJYRPvyqB23MBm6HpLrXk9Drx2Jq6lQCY_hsRAA8ZZgo
Message-ID: <CAKEwX=OigngmcNo1OU-apCFG2hebt5yZwXQxZQHqgC7SwH_HAQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] mm/zswap: Add per-memcg stat for proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, yosry@kernel.org, mkoutny@suse.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 3:52=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
> From: Hao Jia <jiahao1@lixiang.com>
>
> Currently, zswap writeback can be triggered by either the pool limit
> being hit or by the proactive writeback mechanism. However, the
> existing 'zswpwb' metric in memory.stat and /proc/vmstat counts all
> written back pages, making it difficult to distinguish between pages
> written back due to the pool limit and those written back proactively.
>
> Add a new statistic 'zswpwb_proactive' to memory.stat and /proc/vmstat.
> This counter tracks the number of pages written back due to proactive
> writeback. This allows users to better monitor and tune the proactive
> writeback mechanism.
>
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst |  4 ++++
>  include/linux/vm_event_item.h           |  1 +
>  mm/memcontrol.c                         |  1 +
>  mm/vmstat.c                             |  1 +
>  mm/zswap.c                              | 11 +++++++++--
>  5 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admi=
n-guide/cgroup-v2.rst
> index 05b664b3b3e8..29a189b18efc 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1734,6 +1734,10 @@ The following nested keys are defined.
>           zswpwb
>                 Number of pages written from zswap to swap.
>
> +         zswpwb_proactive
> +               Number of pages written from zswap to swap by proactive
> +               writeback. This is a subset of zswpwb.
> +
>           zswap_incomp
>                 Number of incompressible pages currently stored in zswap
>                 without compression. These pages could not be compressed =
to

nit: once we have reached consensus on an interface, can you add
documentation for the new knob in cgroup v2 doc and zswap doc too, and
how it interacts with the other interface (memory.zswap.writeback,
shrinker_enabled sysfs knob).

A kselftest would be very much appreciated too :)
