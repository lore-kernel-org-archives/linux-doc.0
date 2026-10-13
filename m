Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D3541F5C7
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 17:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910899; cv=pass; b=p85LZnxvqOCVAh1vwPvXgZmsuAfABCgJGE5iM0gSzz9fd0QJN7RNerl3MANJTdsGiv+glAJxY4iaLtBg0r+uEJExa/mlQFAxFtxhP4CDTdYje8lsftLrGNbdtVp2bLdT3XmHZYQhK/F9wE73S7Y7tvP7Aq8M1zzKb7FWW0WP63s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910899; c=relaxed/simple;
	bh=UQ6am3LgmR/Ys7leJ+gNMiXEAQz+mkoYeAP0NcDYoRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jA/yX0A5cHNvs6S1kbfiD6d96R5QOtViVajPj0iXdH9F4cTNNhj+ewvv6a0SgrBUcT874VuhXBxunbuQWcWD7kFdUdpD4SeTHuCBqvKeDkFRzZG9IY25H6JSuhDTRRK2toulfVUiN+s4ViyE2UG4JfgX/2+JOjkgU/c4JBIIVSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UY0w+n4Z; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UY0w+n4Z"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48af27fe287so2804039f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 10:01:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791910896; cv=none;
        d=google.com; s=arc-20260327;
        b=V0vyhPYyL5qIPrern5Grhicg1L8I/EUureNBYSD85shp6h76rbrXu5LpTfBOLeqzyx
         t+iunAIhrekobJ0xBi5jj6vc9zOZVHHGGViPjUppg0GcCvyX/krxz6I/1dAzpfdbIhsL
         2syaQG663KL2mAqki7HUFkMOAR4A9B3HNHeCOtwhhWl+v+Q9bF2LGvzc5a6dcVWpZy5m
         mVhlEdpE8fRBV3DtlW9Ls86vb0BzlyzOJvOwqWg3p4uSpsi24GTJtsgENdAWD2OcoFzm
         QapWuD6xEt/INOkKSAF+aW6RAZP8/lEzveyuNNbDnRCRAQ3dKvEaw08d/tXxxwO/+FZV
         zTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UQ6am3LgmR/Ys7leJ+gNMiXEAQz+mkoYeAP0NcDYoRg=;
        fh=qKnBmPT4pEdnS/ApR+IAP4Y3pzleEQRkObmMI2QBAXk=;
        b=GSlr0zjkNkV2QNRgbhe5EcTPlh69TgcOkG5CaOm+Eji6B1JUWjSdfmCAZqQUBG91yN
         7YP+b0thoPfc37enrGxD7cxHYpFITns2hQgjPrfYEcKY/5/pXiC3W73PPPSJkLh0ZrFs
         P7kY0VFjtBYEnIFenPpJzgCakB5I/tiWgktgGXP38VFDjbBiQBEmyeVTi5+6L9kQNMER
         SmgH4Nt27Eo07MrXmtlEyP48077bjhlSa2ykERPxgnb43TVn+F66dug6Neh/YjVwBas5
         zdJo76qadHoivXv1ibdx5astMRa8NPOiCpTtKJJ+IS4A9Nd9N3Yvtp+YME+7L7XOk81L
         ELtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791910896; x=1792515696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UQ6am3LgmR/Ys7leJ+gNMiXEAQz+mkoYeAP0NcDYoRg=;
        b=UY0w+n4ZI2oEz92mn6vCgB6jDiC9Q6MTYhpgmrBlOiYQ+W32a1miuVNeU01x6saIGb
         qpc768FDg6saRtoVwUPZYmeX5WqQruAQiahMwZDC1/QWoHSRSro+OkXAMacQ9lJ3Qai1
         uSjK+wdtzYTLfz97Dq8jCrLTZEWtqs83AATENF+WLPiXusbT9aXLOigGGGq2Pb5rCJdI
         0zVXytwmGVqd4wvXdHmKOlCi2EfoGh2o95hVwO7eWmAxJ5dUfnJEZ4ilCxSJXom/cFjO
         bZAmCD+EPKj1ZqbEK40f9Q1UaZ6uTRwDbUv6sKoah14RT+ooPCdVLnJ0ncGwRA7oUyhd
         EOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910896; x=1792515696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQ6am3LgmR/Ys7leJ+gNMiXEAQz+mkoYeAP0NcDYoRg=;
        b=zFAIpqECCs9oR6stXNoOtaUqql/k5FEfV8LSRu1hKOTg1EFfPm08ckOc+DGUleGJF0
         sSjYVBs+G6i8htvbVeHVeJsZ0cGysQ/DRXVKNdnMNtS8+u16OXwVek3sXPfjZlOn9OXg
         uwHpcrbh5ErL4RNEQK9VgZAeFqaGWH+KAyZjYU65cUySDs0q6RuDjLpGZKFSFgDtbwLr
         Q7GWircXN7qSEQWhOQKi/UK9xqqAM3H6fR57N1DX7BU01fS8ux4Eth4tEHyAh69zE2Fr
         R8LF68q9Rbz5eXaJI0gzPhDoGxI8i4sINctjqQ80xntaTZ6Hx7TwV5lvDuBN99tkV8+C
         /xWg==
X-Forwarded-Encrypted: i=1; AKwUvByJZL5gfICk3XRycZJHIPh78INRDeqXNsXNSjR8xwKy3VOYq16vFXIog3vK4ztoS8PMb8J2OhXJirA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMhvdck1BVlb4pgl9msQA/ZXBsxqpFBvTLMI0+xkm+KM5WefGH
	DPXgFMoJoQ+gc0eWoikyLMcIik1pLLHKNx3FuD6oAN+/DEpJxVg0vbEABf2haUt3NHY2+FRc7NN
	lEaskIj/F9AHJmfWvp1Rxca+W4LQrA/s=
X-Gm-Gg: AYBFou2juKv8ZDA6FC7lOrWspQ7RROSP4W0G/VKGbX1ivf+2ZLIFkfI1hi7PpN4yOJk
	s04aLvzXBgo4F9HG4Ke6WoaOyW9Az34GwT9OwIspEqCh/L2If+b8TtVaZ09LbtSjrwNIFKhma94
	cxlAD6vf2Y0IIjfxlK4Voo2SgR0iiR6jEy36+nl55ff88enSzMTD89LdBjH0gH2sQ6urTeJrVpG
	LILq9e8lCsQHjHnSKduBaYVquZ25ONw59g/pqUg+0v975+V5PBYML84pUhOe+KTJVdbBBPDW5g3
	y717kiqVgfvXuDB+grWFYijRWxJbKlgI372ZfKj96u8dmL2HHtYeT4Bu1l4dO+jD5MhDWDNH6rz
	zajYsICXhJBTcrFNF58EVzSFOiVsLdccdFYf3DtxiF5SIR4XFiwVC9EQS69ZmsJbvNozjayc=
X-Received: by 2002:a05:6000:1ace:b0:48c:571a:a1aa with SMTP id
 ffacd0b85a97d-48dba9dacf6mr28217721f8f.19.1791910895957; Tue, 13 Oct 2026
 10:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org> <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org> <CAMgjq7CT2O2VHpwZazugQRopi4grF+T4oOxZznoAGvy93Yjh-A@mail.gmail.com>
In-Reply-To: <CAMgjq7CT2O2VHpwZazugQRopi4grF+T4oOxZznoAGvy93Yjh-A@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 13 Oct 2026 10:01:24 -0700
X-Gm-Features: AclHuK9oUwgVv3XRRzK2ZGaoq7d_UoCd4WV6CrUoKrvhZqpz39_1MbDWEVKEMOM
Message-ID: <CAKEwX=N8qKhhVUR2Xd-UdtE45g80Ges_+BU_sCc2MzoVS4d4ww@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Kairui Song <ryncsn@gmail.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
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

On Tue, Oct 13, 2026 at 9:59=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Mon, Oct 5, 2026 at 8:19=E2=80=AFPM David Hildenbrand (Arm) <david@ker=
nel.org> wrote:
> >
> > On 9/22/26 15:38, Chris Li wrote:
> > > On Mon, Sep 21, 2026 at 8:56=E2=80=AFAM Nhat Pham <nphamcs@gmail.com>=
 wrote:
> > >>
> > >> On Fri, Sep 18, 2026 at 11:50=E2=80=AFPM Chris Li <chrisl@kernel.org=
> wrote:
> > >>> No that time slot is too late for Asia developers. I don't think we
> > >>> should use that time slot for swap alignment.
> > >>>
> > >>> We should find a time slot more friendly to Asia.
> > >>
> > >> Any time slot would have that kind of problem. We're spread out acro=
ss
> > >> the globe.
> > >>
> > >> Let's just use a standardized time slot we have for MM alignment ses=
sions.
> > >
> > > There are more swap maintainers in Asia than in the US + Europe, at
> > > least based on the maintainer file. Please be more inclusive. If the
> > > alignment is done without key stakeholders, it miss the point.
> > >
> > > Sigh, we can't even align on a time slot.
> > >
> > > In that case, let's keep discussing on the mailing list. At least it
> > > is accessible to every one.
> >
> > Looking at the mailing list, that approach doesn't seem to work.
> >
> > Finding a time slot that makes US, Europe and Asia happy is ... tricky.
> >
> > 1 AM is certainly unpleasant.
> >
> > US vs. Asia is also tricky, but doable.
> >
> > China 8AM vs. US West Coast 5PM?
> >
> > China 9AM vs. US West Coast 6PM?
>
> Hi David,
>
> Thanks so much for suggesting this. Sorry for the late response; last
> week's travel resulted in a lot of piled-up work for me.
>
> Both slots look fine to me.

Hmm let's push it a week. Johannes might be out for some personal
stuff - I'll let him respond with a preferred time.
