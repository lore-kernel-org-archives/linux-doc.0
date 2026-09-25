Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C4B4EE859
	for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 20:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790367665; cv=none; b=iFWkP0QpEdP56OecENWkjOCtcUPDd1r0UuEJAYtCyrm8WPyZqlB2QWQBzNVjWd7bTn0zsUifeRCEBbPsuhSCq8BiKxVgJU60krwhUTpK4imlsn6aGo0PWtNFsnbBQcbrhRhgrBsFt9XQf2zEvxlgILk8rASBCzq7m5yqOtjLj0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790367665; c=relaxed/simple;
	bh=aQdcMnaGRWrcT2d6YZ42NdwPibTOqQqRSFGnSDUxUa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmbaqDmCN59ODsKX493uW6xgQrQqjqIMx+E1XmqwqyHBUCVgA32w4Sg21GkKh/JAahohpjPdb+tXBTxGWExJKX/1BKeli0rJy/JgvKQwOAgAJ65zz9XK1N3B9PgUhIFBAx9qqlwHUYi9gD7NKDoJIYWjRKNiAwvyr69Wm5Gwg/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZfvwi9M; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZfvwi9M"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0c52f9a45so661999a91.1
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 13:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790367663; x=1790972463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xWHZht3/sG7ZvX5La1aBebgJu63RUAKhR/+jLnkgrMk=;
        b=AZfvwi9M+WMp11YAT6155HO1GrvbdzC1CKj+dEnJN5iex4MvSpu30MiNq5bcb0X4Zv
         ojBdMZ+R+5SimlQsM66D/ihwWT6OgGpGwKkprX6pA49ZjR84c8Iq10035mDELRyEP+7W
         YAn3BSoGAOwcSXtc+c66XkNVsexbqhaKFM8s7TNrJvk421FMIzcTU0UGd0Woai16F522
         KOP2FZnNkTU+QzVMserVL/rk8rBa2MmpZugvT+XZWtSwivrSsjHczmWs63pHIJuR3++1
         kduU+XrOgqIyWjp7jHXJlovGXQvcZ96t93Vqx9o8uUPjhDgW7c0VWnTBvhfbMUkybmQY
         0jRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790367663; x=1790972463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWHZht3/sG7ZvX5La1aBebgJu63RUAKhR/+jLnkgrMk=;
        b=r1BG3NNXS9mPmGXqEqxgDvlc7UEVL2TuWpSP5A0ooxJBsAYotKNi80LnDLaZArs/QE
         aWYwZaGUrN6wUDgS10rI+ggMh99uEY/iR29NT4LUeftLhiZaxdUg98kUbhHT9AhLHBV0
         NMWPWO2nHb0gKu4HEzOn+tiwToG+f/o4XbnW389rJf/dbfkBCg2Bnya5wL4qceX4NAYP
         3hBQOkBAESSp9SGurVkOdF6hFhM5FypASCoJSj+0RhF0CLhjurHZXeiIPXuNrQZ+4dlP
         RuVmoSENnmmNP/ZWRRUJX0DugoCZuxxhsJfWK1frNnMN4Z/5oyFHy0Dy9nmvuUuBNu/S
         HTlA==
X-Forwarded-Encrypted: i=1; AKwUvByUUy7qqncVs5HM0H8Hh8Jb5na1FrnQyOTsIcuuTRuVhVSwEM8Slu5EeZ3Pa5iq2TcgypmjnPHlBR4=@vger.kernel.org
X-Gm-Message-State: AFuF++mto+neEXJH5PbhWcTNTofIgiSKUEqibogRnUJ7Enf+sVsfulh4
	j/uIkR6NgkqQaNPKxkTz8B9lNkbK4kLypqNIV6FTy+Hw/WvkX06Mlm/i
X-Gm-Gg: AYBFou3vc81A+xHNLfZFBzR3obGPG1hGHD0/+PP0QHjMAr6mER7axet5GhccigPyn1/
	6HGyKYPi4kI+8N4USVLBEygTT8D3/LXi3k5Pvtozl19/J+YqSiXLjqW5uu1B98g5SmR4hgDdA9Y
	vDT15cRbJythOf9RrGRJHjfDIUN+QA7VfF0zIXwo/YUbQUXM7/fmYSS4wIds8AXqzj8wNFtsyjQ
	HuOTrPIZ05/BCelJbRkJtw88h2QLR02YeZUDhbkccJu4f6TenMEBN5bObdmaaZ0FK4Z5o2VdSZZ
	4WYvJID3BYwLR3hXxtzUxJHJ6XyZQnllqLNSTYLWKoLcQBzlNw7eOvr1rkqfJb6+6OszSPNtVo8
	KIXAbiuLlPjR9lYCnahD1ZlRXXXF8U2w9P2pnuumwfLnjcneqgrbY7FQKnG2iaDVUTX0do0IfT0
	GVALkVM7suKmxTjcYwJbqhR9CIe0AA6xekQOdCjGgkZdM4m6lcUWqJf4WblYFAS+S6b816cvPHh
	yP5QEtcQGJCGAtHe2MMk5UV42lxhJqFvFuU3q1LL9PG28dYSA==
X-Received: by 2002:a17:90b:518c:b0:3a0:dbfd:1a1f with SMTP id 98e67ed59e1d1-3a0dbfd269bmr214015a91.25.1790367663092;
        Fri, 25 Sep 2026 13:21:03 -0700 (PDT)
Received: from KASONG-MC4 ([1.203.116.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99917besm5937983a91.14.2026.09.25.13.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:21:02 -0700 (PDT)
Date: Sat, 26 Sep 2026 04:20:51 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Rik van Riel <riel@surriel.com>, Baoquan He <baoquan.he@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Gregory Price <gourry@gourry.net>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Tejun Heo <tj@kernel.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arbUA-XwLBsty34_@KASONG-MC4>
References: <aqjpYHbZ14A8xRtK@fedora>
 <CACePvbUwTxcMPVK_1GAz5gPDdh0BV9JZSnKXaUFLqDHBzBmPQg@mail.gmail.com>
 <7ee199ddee81bf8026688def82f78ad9db09be9e.camel@surriel.com>
 <CACePvbVA+DnDJprMx3qOrGb98y1ORQ-LfaENy_Btfx3uW=E4eQ@mail.gmail.com>
 <f3ca71f1c561f28a341de0e5a1b3f24bd4da3201.camel@surriel.com>
 <CACePvbX5Oy98DygLZjC=Z03Lqb0nk50_OEKQCT9svbQOOwwDew@mail.gmail.com>
 <CAKEwX=Mv+tnL8K4rfPuof6mKaLQp=tqR_qjtKrtY0-5L85FLfw@mail.gmail.com>
 <CACePvbUF2QQMh_GiCNQn-RTmZNkkLWkmaHSYzdQwv2fupjNQiw@mail.gmail.com>
 <arUcil9kxUPiymXI@KASONG-MC4>
 <arbGo3QTYlUD5cVW@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arbGo3QTYlUD5cVW@linux.dev>

On Fri, Sep 25, 2026 at 12:36:46PM +0800, Shakeel Butt wrote:
> On Fri, Sep 25, 2026 at 09:15:17PM +0800, Kairui Song wrote:
> [...]
> 
> Thanks Kairui for very clear description of what you want and looking for.
> After reading your email, I think you want memsw support in v2. Currently you
> somehow are implementing memsw using memory.current and memory.swap.current.
> (I am assuming you need to subtract swapcache to avoid double counting.)
> To conclude, you want to use vswap (the aim is it to default) but you still want
> your way to implementing memsw keep working.
> 
> Please correct me if I missed something.
> 
> I am wondering if you really want memsw, why not propose memsw. Someone from
> tencent proposed memsw [1] previously, so why not continue that effort? I am
> pretty sure folks from Google (people who actually work on prodkernel there)
> will be happy to collaborate with you on that.

Hi Shakeel,

Right, I believe it is still being proposes as you can see there are some
previous progress, year that work need updated, let me try to do something
about it.

> 
> [1] https://lore.kernel.org/20250319064148.774406-1-jingxiangzeng.cas@gmail.com/
> 
> Setting aside the memsw conversation, I think we should go back to the actual
> vswap conversation and list down what we agree on and where we still need
> discussion and decision. (I will take a stab at it and start a separate thread
> but still on this email and will use AI for the summary.)

Right, the things here is that I think it's not hard to see that
memory.current / memory.swap and memsw (if in V2) is tangled with each
other so I'm hope we won't create blocker for the future.
