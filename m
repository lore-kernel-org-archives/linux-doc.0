Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AA625776
	for <linux-doc@vger.kernel.org>; Sat, 27 Dec 2025 17:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766857832; cv=none; b=QckCUGLQLL/sSnDhinK8B8vBA9MTG/L//kzrab3WWOaMcUErCgffLWijFEJSwA14qkzGQcyJdnGii0DQp4mOSl7N9J58zDusUIDvVokqdN6E6VJhlG5k+5QeLgeXMIxsfRrC59EkyluY8RPujMOYj/E3D9Qik1vQ7dsjqBwwKKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766857832; c=relaxed/simple;
	bh=mOrKFdy9550WIYMUm0xDARXdKVKOJHA4toCYLC89Bbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jln/Kefd/jwd7ZyU88dFgXM5f+zTpnGNe3YIwfRgLqXbpwogUsjtRYNoLfipBJJOnmBprZoewsYJZGGpwTNucZ140SyPKUny8v5ZEq5dARVW47ueIT7oVh97Zjen/uUjK3aD8g1sEYCOvS1gUlfWZAsd1M3oT+AUltEZgfLAkf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+hZOtrM; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+hZOtrM"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b83949fdaso10396545a12.2
        for <linux-doc@vger.kernel.org>; Sat, 27 Dec 2025 09:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766857829; x=1767462629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WL14hCGzkiqmAvKmCU+thkeYezwIsMSVDEfVrt3GJis=;
        b=F+hZOtrMVY0jzdQh8nsTVOIpKPDKhrZmMqAd/7nC24boBxb750C14aupy3uRbEoqLV
         0+KpnY3PtWxOgPByMmoacSg1HMay4G06vWW0zNaSlvpnv9eSj/bcyHYtRSeCAcfN1Azb
         A/3PPcrfz9KCkOWl9ztVSDVdUReucR/mCsMiD4jo3zQbzNZr+TEVd4u9CsWEUA8jPj9s
         Vp/CPqG8AHN1bcRdRiLhSDBsCN7i/1+YyQkwwghqlBKe5mf4+LSKy7am+AfwCek32x2q
         58POyPmtnlDf9HP9kHrHNnl8saUTtzUe4wByc10doL9AFOPYOeTgW/r3Vlq1mBnM+j3f
         Oc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766857829; x=1767462629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WL14hCGzkiqmAvKmCU+thkeYezwIsMSVDEfVrt3GJis=;
        b=VQDgCSO+3MorNScYOOxvc2SdKt9KOnJqXwIlhTWoMQ8PzWa18RO+eHA85x3yWWavx0
         PH1F0stz8EsNyTg6Rgk7LsHM0z54meEbB2AJLBxzghFF8WJqRq6U4HYV7Ln5r76xqSDS
         BGc8G3SwN04aOmHqajmsl/k+49gmc10PGVvTFqlVB+V+0bsXI+b7lsPeXTN4nDCQNZgB
         DlxpoPGKISBvrIXJLxTptWSoW3BJGf/VrNhYOB7c3XAFgAyvtxroSO40xskyS0fLqcq4
         42vBdL0EnSYtQXM9oiEEVfYRnGkePHJ3E/xjfZCbKyE9pWvfnov987PpZSkvPLwyg826
         lV8w==
X-Forwarded-Encrypted: i=1; AJvYcCU8PID0Z1Dd8qXz6a9nfK4ITKphgdzWypuM0r4HpO30HNmyBxT8eDbdgDbWeQn9RVworxP4aBmdHe8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKW/KH+5tcqW8EK+CATG0X61qLr7tk80wRjOpUJsZxw0eXNFTA
	oF9+ORRNA9Mq8cAaP+GDV7M+7q+uWAk/8NvT0UdQGoXH2IfvAaCCs2qJGBRRgmb4bBF7W8C3W4U
	Ri1eiuZLnxw7pw9b/AGm2rxNA5enio7c=
X-Gm-Gg: AY/fxX7Ge2h875McoFnNwyfPEacEHHe+bB16aLyQSu6OTIyBEShmH3B32/j933w/5kJ
	Tf2ZwfqwsMyfmPa67oVvEh31OwwmHDQ3tx0DPz/r5a5nJJWmumKT4FHkqlnefKF0eyazFgTfM+e
	/N6OKO9bF7eBHUArfgzA9i1iR0SRRMY7K1Wk/tcFoqX3m9sE7PUDO+2gWG7LAnseH75ZOEeu2QV
	i1zO4l1fq5KchpiK0NPsKOINvEThNT3cYAIP9wO3vzHy66Y9+V+lQb3BqCofm0anTEGyHKTQdRv
	64JcXZS9VD8Tv3nh9nAiGhMDLiughs5A
X-Google-Smtp-Source: AGHT+IEZgbvqTOYwo3FJJfnfUezy6+2cWZ9EeFPcolMCxdO4EgAtFxeH9qjjcUEpdcjraPKWzcZMdilgj0ntgRU/07g=
X-Received: by 2002:a17:907:829a:b0:b83:246c:d125 with SMTP id
 a640c23a62f3a-b83246cd206mr560818966b.41.1766857828401; Sat, 27 Dec 2025
 09:50:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224073032.161911-1-chenridong@huaweicloud.com>
In-Reply-To: <20251224073032.161911-1-chenridong@huaweicloud.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 28 Dec 2025 01:49:50 +0800
X-Gm-Features: AQt7F2rOR-WeID-Ov1CqYlda8yYcBaRSvHcd5dFl0LZVdgzXP8wohTfuzaZzioI
Message-ID: <CAMgjq7DQmdoQKZeFjpnYQ4wgMx3j-Lu7na+Ghs_Dh=Rq36MDOw@mail.gmail.com>
Subject: Re: [PATCH -next v2 0/7] mm/mglru: remove memcg lru
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, david@kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, corbet@lwn.net, hannes@cmpxchg.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, muchun.song@linux.dev, zhengqi.arch@bytedance.com, 
	mkoutny@suse.com, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, lujialin4@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 24, 2025 at 3:56=E2=80=AFPM Chen Ridong <chenridong@huaweicloud=
.com> wrote:
>
> From: Chen Ridong <chenridong@huawei.com>
>
> The memcg LRU was introduced to improve scalability in global reclaim,
> but its implementation has grown complex and can cause performance
> regressions when creating many memory cgroups [1].
>
> This series implements mem_cgroup_iter with a reclaim cookie in
> shrink_many() for global reclaim, following the pattern already used in
> shrink_node_memcgs(), an approach suggested by Johannes [1]. The new
> design maintains good fairness across cgroups by preserving iteration
> state between reclaim passes.
>
> Testing was performed using the original stress test from Yu Zhao [2] on =
a
> 1 TB, 4-node NUMA system. The results show:
>
>     pgsteal:
>                                         memcg LRU    memcg iter
>     stddev(pgsteal) / mean(pgsteal)     106.03%       93.20%
>     sum(pgsteal) / sum(requested)        98.10%       99.28%
>
>     workingset_refault_anon:
>                                         memcg LRU    memcg iter
>     stddev(refault) / mean(refault)     193.97%      134.67%
>     sum(refault)                       1,963,229    2,027,567

Hi Ridong,

Thanks for helping simplify the code, I would also like to see it get simpl=
er.

But refault isn't what the memcg LRU is trying to prevent, memcg LRU
is intended to reduce the overhead of reclaim. If there are multiple
memcg running, the memcg LRU helps to scale up and reclaim the least
reclaimed one and hence reduce the total system time spent on
eviction.

That test you used was only posted to show that memcg LRU is
effective. The scalability test is posted elsewhere, both from Yu:
https://lore.kernel.org/all/20221220214923.1229538-1-yuzhao@google.com/
https://lore.kernel.org/all/20221221000748.1374772-1-yuzhao@google.com/

I'm not entirely sure the performance impact of this series on that,
but I think this test postes here doesn't really prove that. Just my
two cents.
