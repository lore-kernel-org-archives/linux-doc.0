Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682334DE724
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 12:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413337; cv=pass; b=P+eRQrEaPB42RRve852vRuHRUc5bUTDd2faROp73tnD285nEk8SBupvsFfsg4qnn5T5FrfbS6N+2a0NEZwbO/hZDWVx0rvreQI5FL1qAl8/MHTA5kX/iE6zfHl+AEndllmhPwB0FjyDLu+l65Ze6ocpYVlrsuW9+k2VzXMb2j2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413337; c=relaxed/simple;
	bh=h2JbWnV9rUc1EeFvFy7Tjt14h2irL2wrPatMAzjOJ7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AnP4WxxsZ2aSRjZKDSYffhvMl9ydIyGp6+uCLf/9+nTUEacs+zpc9llwUIpIG7Inw+q7vUMnidEVwZvW+ATVrtSmMXmV1wMrHRYLr374ZZfubVOBoVmLpsw9rJp44YeQXKT7z/+hCtSY2dBHi4r5Q438fxECphq2exJOtNK+e2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTvgTBaM; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTvgTBaM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1000777f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 05:35:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792413323; cv=none;
        d=google.com; s=arc-20260327;
        b=Fj0HgQbzE3WJ9/AXT9bhWtBZf5y95WhLgthNsLZbG1WchXizlWxBFIJNQJyyPWe84y
         fAO1HZGgOk0p36aoD7SzpbLM++Md7ac//9r8EbDSL3sp48huRn/ok8dgwPK8HO3JmUfM
         gqosVOjIVK5vdZkLvIC8g3UH/TkVXsvHwJjZDlpy1mByFGpJoIiapzGzcqqw9ySitoqE
         dDuwqDPy+e6N0QGhygWRke00wNJt5Z06DnMnoaRz03/Gcw/IxzESwM8AOK7LRiK/y5gl
         YgKM+SyP7zEt+1gl7Lr1g08BiyV7FolstVsCJloopK2MMQH9da6qN6BBOwo97vLMwcFD
         1uZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h2JbWnV9rUc1EeFvFy7Tjt14h2irL2wrPatMAzjOJ7w=;
        fh=w/iQWR2cVny46EPMycjk3vH5pBPzRT/j4KEWEJalZgg=;
        b=jid3heBUYot8i1PZ2jlF3QRxNKe1HVXVBgVQrlXWV1UrmHtuccylE9e4QkwIiWlcfK
         hzSAfLN40w69HWhxT54hCqWRBfnUkbaShusQWrNZ33OAOpBwNFL4rFW5pUNntOBeI/nQ
         Tw/Pf9qCT5SW75NSkmGiSTmpC1cPCD4Mt/bMaf8TGXfbshFAIIAbuhmy0YxIDCr/3unV
         OoSpmwiB/UZRFVsYjV9sb/mThKR+1+NoSHHgtTvDUBx3Gfzr53qc5QJu1147Swy4zMDc
         tP+/0nBAHBpCrMxGaBkAWqFqpucCj5z1rb2W2J+yFceHF8tGQQAs8VAfEZ6ZAmBKFQjm
         NsUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792413323; x=1793018123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h2JbWnV9rUc1EeFvFy7Tjt14h2irL2wrPatMAzjOJ7w=;
        b=lTvgTBaMCa4ZKG4V6wMLE2eP/d7WRz7sxcNslCTgjSzmzn7wxfsLAZGIw2FIkasboh
         06b5zxWkhCcKg2YQ4KLKKaPhfwT1CzyVn85Cg7RxE0qnE1K+OtJGicUqiByHoo2DPcKt
         2MZpI48UuoaK0crE+VsMbkHty1XqZ7gVlt4mWpA6LyCC+L2frjakQ7a5Fi/T2csjqrEh
         ISuIzLpLAdXyd0CjRA0x6B71oXWjsIYKJ9e1eCUT7bq2ndNSzQLNJ6/O5rYbDoyXnjvS
         6a7gFPZ5kDLxZtpqMJsSRzaoHTtUbUNa0Tt5mcu2kJkczGE9B9wYjxPC2UpRQFDzgCNq
         Rsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413323; x=1793018123;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2JbWnV9rUc1EeFvFy7Tjt14h2irL2wrPatMAzjOJ7w=;
        b=ok82v8jGQEGSTjwCJQlS8sewbXLkdapYii+lc2Q63d/kp66DCDjlI98/t4IMMhWkD5
         K5sQS2HrH8AI+sZkeFdOe0hTKgR+pai1b4qgmnlyMbdTnTgFFzVgGeGgd+NyVGlankB+
         wnYxWRCsCejlVNL4KtUyjUR8WuRmDuxFN+YvkKKSg6SNXIbbzGEKRPv+s/x6qWp3ksgC
         Nbk+1CzaANmOTGmo0YWkPHkdIcSGEt3jce4RgsPBnNS5KvyIAAXV39yWWkSzu88V+nf+
         DifHhXxjEM+Boog4CJ2lpaziLi+4etRohC26qv2sEGUFXmog4cYUHbbIR5fpREo+c7/V
         qPoA==
X-Forwarded-Encrypted: i=1; AKwUvBzBsPcQ3aTA366qRQ1Lfasc/U38NGwbePKzp8JkToNqx+UI1ZQ45TKOmWIsV/fSjijhJ/Z4qb71FoI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJgTK71phq9ZNzRcLbh5e/JdNZVwWaXIuMpzAZo2JRzIHKb4H6
	vUQZ7R5NMnhU9leSjrxCFlcBuJCvuxfPJuQbfO6Co9KmeikbEYqhM0oVjZgpWWlJuJ5bnKuMdQI
	iUU8J+15G+5xNfj8Xr/OsF7Ev5rywBvg=
X-Gm-Gg: AYBFou1LKzOSGGFLEgmEUOYOGsP3GvawqCJ7obcpSZQ02zGok5PD5DSkYtDp1F/HWMy
	RU6RztMs/TXF/R7XUDUaxHpdN58u/eEn1i3JZ2I/MeQjm8OiYChq+Vt413ZJQZZfueRiWnNI72K
	hHsHSXyViKQCeE1szfTkVDmhwNcqWoHu8g6jz7uZYgCBSKfe3guwesfpekson0S19XjKtxGbCYx
	8/Kyf67zMrLAKe5N0M72ADOetUDNW73wCekMuz+hr+KMO3OmwT+mYpODZyAkPJrWLGYKmGIyN+D
	WC9h6uHG5zmrTnBKNTH693cgZ+JEWFAYf6AmgbHWNzr7DeCfGbpUeGYzQN4JPVS1mb4ahbVlmNa
	UsFT7W8quKZtBKFD55ZjW8th3mDU3BEiqltgAzduDwRxuH5vJXwprHm6NRCuI/Ujg0ANbGJ0=
X-Received: by 2002:a05:6000:220b:b0:48d:ca32:e90f with SMTP id
 ffacd0b85a97d-48e07fb8457mr14720830f8f.55.1792413323141; Mon, 19 Oct 2026
 05:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
 <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org> <20261014195354.GA371161@cmpxchg.org>
 <CAKEwX=Mwc+D+AN-B5T7p=80fqCDijdsiJjd6aN_3YMrEQjyvwQ@mail.gmail.com> <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org>
In-Reply-To: <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 19 Oct 2026 05:35:11 -0700
X-Gm-Features: AclHuK-Ym9EzJ2CIcu1okawbU1UiB-xvQtvgaUvkzS7VoDFrSu5HhWBluHPj1QE
Message-ID: <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:28=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/19/26 14:24, Nhat Pham wrote:
>
> I'm traveling this week, so it's a bit tricky. I cannot make Thursday mor=
ning.
>
> On Thursday I'll be traveling back from Cambridge. But hang on.
>
> My plan lands on Oct 22, 11:10 PM. I should be home around Friday 1.30am =
- 2am.
>
> I could just naturally join that day.
>
> So one day later would work for me.

Would that be too rushed for you? :)

For everyone's convenience, this would be the time slot:

PDT: Thu Oct 22, 5:00 PM
EDT: Thu Oct 22, 8:00 PM
Europe: Fri Oct 23, 2:00 AM
China: Fri Oct 23, 8:00 AM
