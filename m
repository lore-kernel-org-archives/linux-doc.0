Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595AA39280C
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 17:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787937261; cv=pass; b=XYOwvdSifUEysV3l/iyGW6EnF9zIwWefOQjkZTLhX+TZiZlvRhOZnCSOvu8z/eRiBkgANT/kJ27cyBFBuqN+gHkQNSra8JD8Spft2XPGARwftC9jj5TGlbCNjKG4A4x/uy04GqicS7sy8WpJf3JQbzGq0hfpAuQ2coN8+M9G/XY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787937261; c=relaxed/simple;
	bh=RTw5eZPViX4U6YbuomM2SMnBYmpA9Wuf4cmaoazLpuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlRM4Excyu7lSr4NBsRjdQjcgkb2cDo+DRp2YxLxxOJuv5MtTg3ecuG7DieDKYTSgXsqglHhMYX8vbTMg4bpaFOA0Dfpe4ai7/x8Fc2dBXy/Ks6D9jYlWXfQK/zbYsT86rycX1nebSjv3YylSuEPmz3Ha6MUI/rBKxxZFJK7Bkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgXm3bgY; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgXm3bgY"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so528450f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 10:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787937257; cv=none;
        d=google.com; s=arc-20260327;
        b=Z6dSx1JfgN6J/mUp7yhVdlR0TpIC10FBVVkxJer1vzEsWEoAsvK70tGsxVQVgL2Gyo
         lq5hPxQR5HYcH7VeP6F8zG+1oyQ72rPBYaT+aVNWScAhUJAkqKTdZX0Qt6R7zj2DpyrG
         07F/CatvNCjZTRethf8b+9gaGigDqJ7ERdrEkeKtv5d84rrOA09cUrDA/jBK55c7IMp2
         sn3fQw5pqdbWxrELFOy07ccwYIzISawkEFyNK/zVWHDfN5q2UghfNKUdLhIh0CwpQ2UE
         RQ96DYLsyr/OEBnyZ/DPLp2Hn9DFSo67jf2PeCQ0HSNNIto3lKSjV9M1LuD8Snf3Grax
         iMqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fLW8KjG+1iJkxaiPEbmpBvUr0x4Qil1Zdzs/J2jlauI=;
        fh=mtCmFCHmMprN+K8hQeQ0ofkVW8HSzl10+arUGC4Yj2s=;
        b=kGXQhReu9QqIlTZ/4nBV1ouqLiLZTVofbPPOIdjgGN2vuuN9EpIUEjoLBB+lNb4px0
         la0VScwZBGNIMA1EbDLpAFYg1iRCfqq3sQaTND1kYefVER6K3WFdKnrNERgLAe2xd+Ue
         tQoONjbXUn58KkvSZ7LW387Z+lYHYNJoSYY2LDj82oZv3u5FBd1otzB86worTIf2lfs3
         SYSCkUHpDyqWxjEN/19v1SnoBM/D0jZEdeeidOh/NQqbYhmhcpj1dxc6nKXKH9Z7tYct
         ub02wsp9ZJynItcGR5jmnc6rJ0llro2dHrH24c315Xwq21C+hgBCd5U5a6qaE+TtP5jk
         OfVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787937257; x=1788542057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fLW8KjG+1iJkxaiPEbmpBvUr0x4Qil1Zdzs/J2jlauI=;
        b=IgXm3bgYaZHU/OuEB1CzwJkJ4T4UWKXbz6YQbLI46gKQmEHEo1o215LFVMzxKR8127
         mS6sZj/27figRw+OMbtn483mFrmIUKDzMmxPDwreFZrPi1PGs8eFsba+Pqa/msqvYB/l
         9QXsDDryEa2wFMQkKinig3EHpBelkorPntQlaf4YHywD8EdO7dCu3diSQNS0oPxbYQ6P
         /pnia78JJjKtVgusvSacam1uEnZfo5mwnNoJKeEJlg+xs4GVaBDWtaciy4jIiVh8C+9H
         bHJKCTe+zEKfkxL8F8t11h/jtEhoDe5JJkPoFKV33Ib2zZ6Kf0zBc0NyT+YACEhI9I4D
         1uNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787937257; x=1788542057;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLW8KjG+1iJkxaiPEbmpBvUr0x4Qil1Zdzs/J2jlauI=;
        b=HmO/KjPBU8vhR1mPiDonldBvCM9iVeI7dvjfZhWX6MijuNhNBpy87xn6UVwZnjlinv
         vXdh4zzSJhlYiCgmONaCOIXyvWchR+YhY4y4q0j3UvRBm9FCD+dIXKNbGaSwl2kpb47L
         n27nHQ+G/ofwAtZLOITiCN7GK5KXd01czozusZjeZNAIZ4z59qIsZvqc1z/kYqyVdKGK
         ymY/DCpbaSVMwIeB6KXZN6wz7ZBhz0ycNqnZqTxQB2aMykB8XwAD5y5BVFpfqEs050WE
         nMdRCjF6R5QI6nzFZPTaixbC4Ra6OZGtZowGhQ+/+VwN6YGCk1aFgs6qiIiEnSniycHv
         yERQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrr1NXkZj44i90/o9hmR/KVbOV5wLuP2jqWnpl5N/uEsVQZwB5mgTirPO75po6LlOAQ/Dvos042EmM=@vger.kernel.org
X-Gm-Message-State: AFuF++mIjwPzk3z02q93gMkKcqKc8WnQ82+TMkssf51lzBiDyzDntI51
	76s23X7ih2LYA/UYCVHvc2FSXdXlZRKOltXwI8rPqVPOKtgQhyCLwHUv26q+axZJqSRowaOncu+
	te/S6xXg0x2sRD7QhvbNXggHRVNuQbCs=
X-Gm-Gg: AR+sD10oaGi4pI04ZU64OceJzg0gfbgevTChA74LvZ2G4JBWHaJVWZuE3D6iz3LkkXZ
	eqx+mdinlyde5ZQbs58hnSkz81K1TTaSimBaQBETTT+y4qqZEY2oODtZhPmIfE13gm6x71VIReg
	ppI60L5BJiFcUUTkhAZG4SD2Ss9c+4BrP6qWrS4qFoP0jLEsCFLmseg8yOeyEVDkO2ZLhkCqGQg
	b16XlY5IT86ecnUgHE0CN/w+QpYtIN5Urr4RaUMR59OY/drlHJYv6kd/qDjoqkcJBcbi5UGlymt
	hJWAYmoftv8EefLBA51+hml7PA1UrRBjdp2kSSWOc2ydg6cAYpmofGN/FNlRtqZASizV76hsbgA
	q
X-Received: by 2002:a5d:5f91:0:b0:482:fbb0:a262 with SMTP id
 ffacd0b85a97d-482fbb0a404mr7651916f8f.20.1787937257283; Fri, 28 Aug 2026
 10:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825153238.2695446-1-nphamcs@gmail.com> <20260827200716.97881447f243c4afd275144e@linux-foundation.org>
In-Reply-To: <20260827200716.97881447f243c4afd275144e@linux-foundation.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 28 Aug 2026 10:14:05 -0700
X-Gm-Features: AcwNN1VqRctLWtrJqo_bsUXm3dQvc_4Ji-SS_KiORUhzWLUsKtjvYyQhD1-JmPo
Message-ID: <CAKEwX=NdnBM7cqbO3rSsUB7JFZK6DBxNMFbpGWgLh5m6M7yRXw@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] Virtual Swap Space (Swap Table Edition)
To: Andrew Morton <akpm@linux-foundation.org>
Cc: chrisl@kernel.org, kasong@tencent.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	yosry@kernel.org, david@kernel.org, muchun.song@linux.dev, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, baohua@kernel.org, 
	youngjun.park@lge.com, chengming.zhou@linux.dev, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, kunwu.chan@linux.dev, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 8:07=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Tue, 25 Aug 2026 08:32:26 -0700 Nhat Pham <nphamcs@gmail.com> wrote:
>
> > Currently, when an anon page is swapped out, a slot in a backing swap
> > device is allocated and stored in the page table entries that refer to
> > the original page. This slot is also used as the "key" to find the
> > swapped out content, as well as the index to swap data structures, such
> > as the swap cache, or the swap cgroup mapping. Tying a swap entry to it=
s
> > backing slot in this way is performant and efficient when swap is purel=
y
> > just disk space, and swapoff is rare.
> >
> > However, the advent of many swap optimizations has exposed major
> > drawbacks of this design. The first problem is that we occupy a physica=
l
> > slot in the swap space, even for pages that are NEVER expected to hit
> > the disk: pages compressed and stored in the zswap pool, zero-filled
> > pages, or pages rejected by both of these optimizations when zswap
> > writeback is disabled. This is arguably the central shortcoming of
> > zswap:
>
> Thanks.
>
> I asked Gemini for a tl;dr and was told
>
> : Introduce Virtual Swap Space (vswap) to decouple swap entry management
> : from physical disk slots by using dynamically allocated virtual
> : clusters that back swap entries on demand via zswap, zero-filled pages,
> : or physical disk.  Eliminate wasted storage space, remove the need for
> : static swapfile provisioning, and enable in-memory swap features on
> : diskless systems without degrading performance.
>
> I'll take no action at this time - let's see what the other swap
> developers make of this.

Hi Andrew!

Thanks for taking a look. I'm also waiting for review from fellow swappers =
:)

>
> Sashiko was talkative, as usual:
>         https://sashiko.dev/#/patchset/20260825153238.2695446-1-nphamcs@g=
mail.com

I've been going through the sashiko review on every iterations!
Hopefully the list will keep getting smaller and smaller.

There are a couple of false positives, as per usual (the first issue
for e.g was intended behavior, at the point of that patch at least).

That said:

>
> There are a few pre-existing things in among this, They look legit to
> me, from a quick read.  SWAP_USAGE_OFFLIST_BIT should use
> BITS_PER_TYPE(atomic_long_t)?

I think that might be pre-existing. Maybe we just have not seen users
who used 4TB+ swapfile yet?

Might be worth just putting in a quick fix independent of this patch
series just in case.

Let me see if I can quickly whip sth up :)
