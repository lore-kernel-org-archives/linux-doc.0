Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB1C2BCF4C
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 16:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782146501; cv=pass; b=nJkMkFPTbA6S8WSz973nLHr2OAdRnyGjcERF5ILQQfxn1bcUoJM6jw62MFI82CcdfQMoVddrRo7qWSxXom8AiXanEF7cXXrHYHVn19JpMXJfMxKPwDEUNaBHoz9dEA6ZlCezdsv5/6GNr9p1znreA9A4bFJEw/e6QKb3dgMR3iQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782146501; c=relaxed/simple;
	bh=oEFJM2xVD+jdJtGhPooMvFbQOOY2K9LW1MgvzB3/sn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKtfFQJHWjLkNfTcyRw0SeMZVRThvtEof/QoHH+8NE5Y6csEpY+ZTHAjh8Z+B18095EAfsCAP2Pv4Hb5dxvAf6ZMqg435FVtMXE2Oy4lnWxGqEXonnkJistzwAuqik2pWajEKe2cnb6575XM5mCflS56QViHWrZr8BlgOwCWytg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRGeQtuc; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRGeQtuc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49249707788so16785755e9.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 09:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782146499; cv=none;
        d=google.com; s=arc-20240605;
        b=Na6ybvXH9trfcW7fJCJ2QQwukXObhrdWLglDojRZcLqAd1LvjHy68ZI1LOXMlD2eDk
         E6Xe0iRTcX0TqTtCsvk6J0SQdkfkd1E2Q9Q2Jo64JN/aumHJsDlPDBtrUX2yb+1UqzH0
         Qh6FKa05MHAqq4sMdM/05nbS4OGWj1wL8s1Gk2XNf5hoOb0qbNr1FSVOdWYIJvLX3JUK
         JV6RY50++1F4F7xySgN6y4qi9dluy68CvX1B5XRFKa7ZYwNNDdIznR+MpgrqX97/6eE1
         ZsTel9pOj6OOiyHbkcSDh2MFMaM0YoN20ugPbGgFT3kl1eq48xR/T2ztbdr9zpQiHD/f
         WjoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LO4CLyWX1yuYF8Ov//x4PcViKwdSdNNQusnOJRyN6do=;
        fh=r5zfofZ7hOh5yWzzle5/Rw7dFGoKDLtEWH+bik9VNdA=;
        b=haUAC+18dT2suK0o2IEo0xabWLK0HZAjLjE/5Tfw4omSou9qiCW2asQBJAE5ya/7GN
         sRojyxJ+KngxkEpQkLJTX91lyKUQYGNjiIYfwNbTIg+p7QLZ0lv0Ij+R64bX24wW3Byc
         UQG1EFjuJVMYzc3z2CdNilP6HzgEKmmJUPuMDzvALzvIFHJn5dE91YS/TqCbtAcamW/8
         mG7okVnL0ry/4RsnLGmL4nUa/aiBpghoDJY8PWiZNFMY+vgh6pj9Qi9IrApAkHMwPlSW
         LQW0ki5wU3BFLZnB8zxVP3y4DYY2KblYBOsc1nDLmyZ4OnDUgDGqK8GPtU68fbpDAkj1
         I+kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782146499; x=1782751299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LO4CLyWX1yuYF8Ov//x4PcViKwdSdNNQusnOJRyN6do=;
        b=WRGeQtucLAET+6KsAAE5ssKgAwyFGsGdoBIACUDMI62X6lbQmyewrKl7UpZQwAQb6f
         PrUEvYOewzJRELRBGwZV1HJrTWwtWLnUVI7K+QcrMNac6YKsGb4QUMwT0QLYwvSeKcvQ
         3FI6WIIWvNTuXresOuMagpAnl80Yn43c2bZRmYr8lg0y3W4YbryNxuK2hRv3HTqiLClz
         vB021ssQD1fwd46LZbdg0Nx/sm0VK5HQDohZnzVz57JDCUjFeeqDkAygzx+dSc28KxWS
         eyfGj1g70bPM+OpWq1Jm9B1VkvAcD62S7utr9vuHfRKJ4EHhUgy3sktIn96Re3pLfZji
         Er6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782146499; x=1782751299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LO4CLyWX1yuYF8Ov//x4PcViKwdSdNNQusnOJRyN6do=;
        b=gx0W0KJWql4YZzsjZUCwPOeKH7AGYWMFYT91Cu6dIUvmLIyF6PAvhSqIhd6TYQVxa3
         1c4Md0m/jOmgiDMcnlKwiICwntm+uE8rYxzqdpvrrXOaseea/0voYc4+JHvxVQ1+39rD
         adakKn0OnlACPb/NQPbzCwjMRreCXeCpOaz+23oltVx22QHimHFJhHMTx0Sf3amwsJla
         ybyJ2TQ6uIN9Ad9u298tkiXbN9q/Szp/CcrzT7Y8Hc/ZqxNhNlYZG2SlHkFOl9FKKcQ9
         d3gW994P1qvaKkHIw2bophqpAdo/EhgX56LPkp89U9x+zDHLDNsl/OKdPVbGE7+Tisp5
         iWsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+S4ns/KB7mJlLnzMrgrMNC+QymUJDNJTIGuN2ZpekJhdx9sj7tx0lc9laypad+rZcL3RgHSdd5tTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKGY938ZD7NiqmE9GO5Zy0mZTw16VvRHQcOfl8OlH3rx+TggZZ
	BvVYE1bJ4jIw4bWgjW1QBMs+tp2u6Mrg3UQi3/9jcs5jDzNYOV9FtM6Pz4/kxD47ef0LKLjM77b
	+m99rtR8IIeP6r1eXns6qYESlJEiA90E=
X-Gm-Gg: AfdE7clp9OLYJUbGsnStZVTNRzIDbB/48XOWD6HIga3fdrkXxMytYzeeOhK/x/SX7A0
	AlYX5SG5dcprDMBA05L46JCJyhigLz9piAjG1EGfTZSTXIIy33A/0dhv5k4cH0NuJbT9JnDF1EY
	8kmOaLS/6AIDXKjtI0CvGQYKK5iGnpsm+ALBZJ3ErthQIVTPARu5W5CRE0sx4Mo/rDW5XGW8o8u
	dBeLl4aShAYz05JNp58oErhMzarHJyVjL1GFfNSMJwshxDWj7uLuC7M9/huXwtrevBYhbwctYIp
	VitPGnxPKNWypvBdVDDMlcbAp1/r
X-Received: by 2002:a05:600c:4f93:b0:492:3e44:214b with SMTP id
 5b1f17b1804b1-4924908ec09mr160471055e9.13.1782146498862; Mon, 22 Jun 2026
 09:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260620122751.388770-1-doehyunbaek@gmail.com>
In-Reply-To: <20260620122751.388770-1-doehyunbaek@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 22 Jun 2026 09:41:27 -0700
X-Gm-Features: AVVi8Cd1E9iWuTavN333q7KTJh9z6lMcL3JaeYY8kLllaHZeODJX9lKEfi3XoXA
Message-ID: <CAKEwX=Oe+Oz3h2+jkg=EDszbaM5JaeO3H1dAfXqudskad58N-Q@mail.gmail.com>
Subject: Re: [PATCH] Docs/admin-guide/cgroup-v2: fix memory.stat doc details
To: Doehyun Baek <doehyunbaek@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Yosry Ahmed <yosry@kernel.org>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 20, 2026 at 5:28=E2=80=AFAM Doehyun Baek <doehyunbaek@gmail.com=
> wrote:
>
> Fix minor cgroup v2 memory.stat documentation issues.  Correct the
> vmalloc per-node marker now that vmalloc uses the native NR_VMALLOC node
> stat, and document zswap_incomp as a byte-valued memory amount instead
> of as a page counter.
>
> Fixes: c466412c73c3 ("mm: memcontrol: switch to native NR_VMALLOC vmstat =
counter")
> Fixes: 5ad41a38c364 ("mm: zswap: add per-memcg stat for incompressible pa=
ges")
> Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
> -               Number of incompressible pages currently stored in zswap
> +               Amount of memory used by incompressible pages currently s=
tored in zswap
>                 without compression. These pages could not be compressed =
to
>                 a size smaller than PAGE_SIZE, so they are stored as-is.
>

Good catch :)

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
