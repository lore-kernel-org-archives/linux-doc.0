Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793213468;
	b=YOzCVkfy/6qu+CfuB0nvacl/rCSx6Y4nDF7u8gGBm/RrF0GmvTOalS+ZPwqqVZeYVZnC
	 Kwdxj9RP/1T5atnYD3Vjv4FjN9ObDhU3swZLcbYvqE9tzgW2vGeu6APjW6Hs3TCOLRoIO
	 Ap6cbbeSSCBai7HK77KSNn54wqrl8vh2ZK8Wuv9aqHtZIDZEGLNr4HfVy34U91loViJTB
	 wvKyXIe/1ReDNBVCT5Va1rpOkq4kVf5LlmnLtgCWSXEpyCufevOCrB1V2ANClbh7mnjJO
	 nPTfjbtUsEW6MfHwPqKM9dFt9FIJeimHasXzAe5JgPtLrYfFax1v72dtC1Hd6MKaEHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YsxFQdeZKl70TZpDvN7IvbuYmeaB4nmztdIPw08KPJc=;
	b=ZXDvz3OWRWt+1v01SmN3PJNXZ/xbgPkemz8ne3zyK3l9BNIXVtUzExNqhA2uk3pnjX8C
	 xuO1B4wsxAMUqq9hnP28grchCyHrFbpBPLPCHLq7eyFe3XxUHUQQmScHQPIl/KeuDEoOY
	 IhhRE2mjd7G+OUzLsefYB72pLeg9yMu0g2UY8ExcJJXWwD0DNPDdznW4Q6hOWe4SEvptj
	 sN8AUISeuY+mhdFPfCquqDxuhW4CR0PtIPlpjvxsZTLDVXbTXy2852xunlcFEh45ryQfE
	 EtYSzCUei79snLeKgotfB1bxSjWuKowg2UJAZ+GEjKB9xndkMbomkvRiCOMeXszkt/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0Asfuux;
	arc=fail smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C834D606A320
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 18:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C834D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0Asfuux
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c45111bebso666080f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 11:51:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793213466; cv=none;
        d=google.com; s=arc-20260327;
        b=UnyxafK3lu94U2PFaNThfCUWL8Um+sBFuEJhAKyN2dOuinR8yxDK82/MMpZgXGTrIV
         UK99+lED0EhGsn/wzyP8LXNgc21epmkYWtoX3rE/6i5zQXJPZhadHTjC4tUyJxhuZt6t
         TiszVZvU7SULUxBgNVwAmQ8pTF+VZJWZg9maOqf4V3SF+wtjvhCiqAvLu7gMwxQSZsvo
         xFPx++49OlNzK3cfvM9sCXpXYjUAxAplDS9uh1/rQNw/lVF2GBbNybrqajBkFR8e2nsv
         jKSKuC8SfNMMd03M8gUOW2W+O53UZzAM/Uc2xKe22gfOluKDAI6ssKepd0lkkJutnXlX
         mMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YsxFQdeZKl70TZpDvN7IvbuYmeaB4nmztdIPw08KPJc=;
        fh=DCzOivpeLgKFnWYpELfp1i8MuFIMHEgVEWU2eNMjs2M=;
        b=nWM6ijt3ToJPEqgNrdrNZ5R55YW9uPxnpwqaLV/lpCeOdQMYWh6L4AZsGz7ES582ob
         vInDoJ9tERs8iKwfwnFl+mTQ66gja8VmV6zL3CSbHjKKnWUO1SFUkTzQVq9EzxSl9aZm
         7snDJfL5VSQl2kBOS5POTKQ8AyTkYl8Gt6v9ecnRrLaXvDSwVt8V8lONtxj8BTXLIksi
         yTUYkrSqA2jS+HQHp0Vjws7mBaNzAYY+0vm89DMf/dSQ8myvd9gFNZ2Uqus646/+yosU
         /fYh6ulAFYa7gjWfouP97kNJVXCGOjqhBmCXyJ5pKw0s6bB4uo964fHAdp6xF0Ae2hlG
         KGeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793213466; x=1793818266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YsxFQdeZKl70TZpDvN7IvbuYmeaB4nmztdIPw08KPJc=;
        b=C0AsfuuxwRpzhksmh1ZND/ylkN13pRdx7Kxf1KnOi5bablp1AE8thUo+dzAYNmWgzF
         JoxRq/+In78VSZP1feuD67V0gaRvK8cZqNcIFHUsCmFVkI0fK0t1i/3F/GaJJH4ULlVr
         QUKbIhN74olsjXZK1q3SIzmbBfk4ilFwQk1IjatO1KFf+2DSRgHVALTVQOg67XkX6TXq
         6uxe+ufB53w7i6JOUhYzkpd56iJIr5oI+D8U6NrmAQgIcby6V8+Pneuq4KVrDHBdI6qO
         r0//ziZSP5WjeOg1iHWES5moe1lLMvfXWkESuLanvIlurnG+mpW7eYLZ0b4Yrb5Jglo6
         zgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213466; x=1793818266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsxFQdeZKl70TZpDvN7IvbuYmeaB4nmztdIPw08KPJc=;
        b=TVOGqakB/7bvV/3JKme7rUT5y0dAqiuJ1UaLytX5fo6218qny1VZqT8NqcsC/FrEfK
         s/lJVsh24E2kzgMzWAr9MXocmJjB9H4gU6FmU2QQFrZpcF5W7p2GA1Zh5+PMs+/PgRHr
         1s2JngWmC35xx8a83zD63OJ0buPTpYdgSGTUpOrFb0iBJaFmt4JGQjCy6Mba+D+3/AWe
         KcziDNanoXKOzV1/s4jgYa3NMkmwl/zyp0tHJq0Dnqvg4tVYvouPeE64c3q+W9MI0+iS
         qAAhGyhdCnLVs0/DemBvuWVD22FUsh9dqqYoJCD98aphMrQb3AfCE8HpDiPFMVkmy977
         CMMA==
X-Forwarded-Encrypted: i=1; AKwUvBwt8CCkUPQ99QWG2rGlsa8pa0z8lIz+CXz9MRwWqRAyabXUX2Gq1tVWB/N+hjagtpFecKJKmk7JCig=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgJTDSEHerkIxJhTIxbKd6qmsFAjChNsUiB32fTHoAji8l6onJ
	ZxbLPooiMSXJNf2uDWcexFOEx+5zJsp7lFcEUfj9aa+GLiWZ8/TpTzW0pO3y0mygEBAI7gRGCGY
	LmK2SmeyUx7pGMCxkoS7JpA0D5wIbLPY=
X-Gm-Gg: AYBFou2YwfrttBW7bCtW0h+YUiVprktM/dtZ/FDVEmOqezsIsLcMU2McHo6I+ecmn3d
	aX8jORhzWkbAeMuNEalZ06U2x1qYQZjvZ2E72jxCQ4ADMMB4E9Xtfenq1P1yk/HO6235Oog9xM+
	x7kkpwoiu7h/2Q9KXAZZcFA5Fs5dba7m3P5BSP7dWu6eiZ/XWezq17cPFbAiR+Tfwi2BvDg9BwN
	nSt8EcNCK6Gho+Q13FJ8Rj3a7r0nkSzcmTMWQVuaiuA6djYR3NOCToalW81dGQdXC3z5jdEMQyb
	ZAvk4BjFueiQ3Zpe1S7hNEWFeUJ7PlUF0eH6N6oWdrx0n/GSo1yIqLCYNWywbjI0Ejqd//BZhj+
	Rcmw4FAyM4PcEAjA7uS0bdZTIe+v/NrOHfo8Ikga1MBa1zNB8IcTwLalfjot3klB7S/Q7jgLOD1
	tfQdRCGlyVE8enlzTnK8065J14gb9N6gPukS6iKEuYtNOOTK7Z8sjD
X-Received: by 2002:a5d:5507:0:b0:48c:6fa4:fc89 with SMTP id
 ffacd0b85a97d-48e5d2e704emr6315682f8f.12.1793213465946; Wed, 28 Oct 2026
 11:51:05 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
 <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org> <20261014195354.GA371161@cmpxchg.org>
 <CAKEwX=Mwc+D+AN-B5T7p=80fqCDijdsiJjd6aN_3YMrEQjyvwQ@mail.gmail.com>
 <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org> <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
 <CAKEwX=PCSyCEAqxeOH6CkCMu1eB3xUn3iz5XNuTbpDM3EmWYAg@mail.gmail.com>
In-Reply-To: <CAKEwX=PCSyCEAqxeOH6CkCMu1eB3xUn3iz5XNuTbpDM3EmWYAg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 28 Oct 2026 11:50:53 -0700
X-Gm-Features: AclHuK-Cll-04Q9PCKTnwQsH04kXEbIsuiNTHafay22oqcGn_p331RDj9A27JMY
Message-ID: <CAKEwX=PEkQEap=KRsutwtuXp23=zoeCNjdk=4rcLJtO_3ESFJA@mail.gmail.com>
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

On Fri, Oct 23, 2026 at 10:24=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Mon, Oct 19, 2026 at 5:35=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > On Mon, Oct 19, 2026 at 5:28=E2=80=AFAM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> > >
> > > On 10/19/26 14:24, Nhat Pham wrote:
> > >
> > > I'm traveling this week, so it's a bit tricky. I cannot make Thursday=
 morning.
> > >
> > > On Thursday I'll be traveling back from Cambridge. But hang on.
> > >
> > > My plan lands on Oct 22, 11:10 PM. I should be home around Friday 1.3=
0am - 2am.
> > >
> > > I could just naturally join that day.
> > >
> > > So one day later would work for me.
> >
> > Would that be too rushed for you? :)
> >
> > For everyone's convenience, this would be the time slot:
> >
> > PDT: Thu Oct 22, 5:00 PM
> > EDT: Thu Oct 22, 8:00 PM
> > Europe: Fri Oct 23, 2:00 AM
> > China: Fri Oct 23, 8:00 AM
>
> Hi folks,
>
> Thanks everyone for attending - I didn=E2=80=99t realize swap was so well=
 loved :)
>
> I took the liberty to summarize the points being discussed - please let
> me know if I missed anything or misunderstood any points:
>
> * Swapfile sizing: Kernel kept swap slots after read faults to save IOs
> if these pages are swapped out again, and thus needed swap occupancy
> (and hence static size) for a heuristics to trigger reclaim of these
> swap-cache-only swap slots. However, this is not useful for fast
> compressed backend, and zswap invalidates its compressed copy on page
> fault anyway. Vswap does not need this heuristics because it just
> frees up the swap slots eagerly on page fault for in-memory backends,
> and rely on the existing slot reclaimer for physical swap backends.
>
> * Logical footprint limits and charging: cgroupv1 allows logical memory
> footprint limits (unique page tables). Cgroupv2 controls physical
> memory and swap resources separately instead. While virtual swap
> entries continue to count towards memsw, cgroupv2 counts only the
> actual resources they consumed - post-compression size in
> memory.current, and nothing in memory.swap.current. While cgroupv1
> continues to be supported in its current state, a cgroupv2 transition
> will present a problem for memsw users that still needs to be worked
> out in some form of overcommit control.
>
> * Swapoff: this was brought up as a request, but we ran out of time
> before we could discuss the motivations and use cases behind them.
> Folks interested, could you explain as a follow-up?
>
> * VM_SPARSE v.s xarray: no performance difference between vswap v.s
> part 1 of the xswap=E2=80=99s patch series. With all 3 parts, there is a =
win
> for xswap, according to Baoquan=E2=80=99s testing.
>
> Let us keep the communication line open and coordinate on the next
> steps.

Hi folks,

We made some nice progress last time, but I think it will take more
collaborative efforts to drive this one through :)

I'd love it if we can meet again, say next week (making this
bi-weekly). Some agenda on top of my mind right now:

1. Use cases that are glossed over last time (swapoff).

2. More interface design.

etc.

I can bring some concrete proposal to the floor so that we have
something to work off of.

Regarding the time - would shifting the meeting by 12 hours (so that
it's morning in NorthAm, evening in China, and afternoon for Europe)
help European folks attend? I'm fine with the old time otherwise.

(BTW, we'd have 5 timezones to accommodate, because where I live,
Vancouver/BC, will be in its own unique timezone starting Nov).

Best,
Nhat
