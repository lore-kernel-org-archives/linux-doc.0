Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795173412;
	b=IxMGz/dXvjrEjgfBoSLdscpK+YYeU4iIZk0MMnhA6PBIGqU4jgBOLbLzQEwwQ5rNNVnf
	 /Nux5YwJURkAtFfHH7VPcjiWmSmW+1Ifn4w3FkPLaRh8iEZ0bsbIzhhRM33zrfQl/WmPO
	 RywCqL+h8QoyBoKHaJ7ci6GDLv/g0eGVHd5eJ8FNKwcmgQt+Ieh7etPdw2scUbW54q7rP
	 HmI+14+wxsZ+ZhAJG10FMgwIZlaThP3CnSTXJd2UJWUGyjfKkwEduMg/2qBP+/ady6xrI
	 ZLfNc6yZlR40RM8PZTvi/YorKCcgOWOcZ/w+TxNu/ZGr+AuccXPQFRMefCHj5wQK9Xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0NaMGQ4Owpl3Co7yhqKVZHVr+kTFNUk1Lb3ecw2usVA=;
	b=vMCHs1Cdr19QFX0KPz+oU8CfuRLixz0Tx/r2U1q3ROPSILQsbXL8H7U4fHFnWRjW+BeA
	 Yf+cwawctGDqZ33D2vufYMqIoUqCIPsM72wsYIkTWO69hZeMoeygp6Ze2qkTlR7AT4YNB
	 jBvbHQ371yrvz2rUvCasqfD8snjA3JNGs98B0CapmY7wTneaQhxHUDceP8ZA9/ydCb6jr
	 I8d2NBFofxEPHEtcbL5/NxVIUABI9VYDUFmJ7TV8Ep6xfV2pqLP2e95aO32/5O4f6M0kA
	 1q+/+i7LARO/5AHNug0WNetrK656pKPsdK4YSroCxAecFDls0fIZBwME0A4xpRJHdBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dg0qNTaw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C8F606A333
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 11:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97C8F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dg0qNTaw
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c506a231b88so115528066b.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 03:16:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795173410; cv=none;
        d=google.com; s=arc-20260327;
        b=O5wJE/zp7j4V0Bjho7kbcE3MlbHEtZKEUc1OiYv0kuAKd3//Tw+9tFSxr3G0DqqFeO
         ksBz0ekC4CBoDjcib+xQeB1RQNBHuYvx0EIL1IHrM3Q5W9VkqIl5pse3L56QOqMQSzeU
         KTvsXRbdxKOx8UBSH7F9ZBodxiF4AbSHSQCa5TJBeFw++/ArRc8cdZCGwGwEaquAyWo4
         pADew8Raylh8mzIoP+JADwkZTQNQAzWMS+gxqO2fjCDgVI+gqZzK5Mm/J24T78xdysHP
         8zO9b1AJO0WGNJYJP98de8x34cwRiKmPbHVbgyLqUIMHplAdFM2FYTg/4La3WRA0TJim
         vf/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0NaMGQ4Owpl3Co7yhqKVZHVr+kTFNUk1Lb3ecw2usVA=;
        fh=Yc0tezw6IVTU2soYhGOQHcTXk41VADGbFyBpJQcIzVI=;
        b=qea4vWmu2DVNEIQ45IK7cPTlNRcCXKyP2FznQ1dFuGSZrXFXDDGR3cLU6hd/5LrZDX
         Ki7s0gNbIXW2xQNxyFwURrEV4DChS0sgiqTNFqWlf552zWKRxPvWDjhvxWqvsqFNK3NV
         DYQ5frdAmB6KW56WV5PKBhtSnQeljFCnQjcDSpPQzDr7s4FiyEG2a898bs0ZTqcWjMZD
         hyWOlFswO5D3Hvg7zdTucq2Xk9IHeMXnHS4TeHL9RxKkv/f9USYgCK/jwsdLZIJTMQbp
         ARkaRed7aYC6kpoqAUZixpYIVHzpzsZFn7zNovUq0HZJN6VAfLk9Zn++mf1f3mXTv/QE
         rk8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795173410; x=1795778210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0NaMGQ4Owpl3Co7yhqKVZHVr+kTFNUk1Lb3ecw2usVA=;
        b=dg0qNTaw1I2FaQAtzF9Y7WtNR27A4Rv9Gpi6OeW4VqDaX+wfWjw4ofghPyRQkqlbX3
         QBPsfWsfquSDRqV0JKcgNBvei06W6DbpFeVHjNn/yIXk5cn3hBKOfU2ovzx6qaoswy45
         N3lS2HywAUUOlvpAM0RiyBr2j8lbDIdVIunwVAXI9YP3Z9nNOPxtpGAY+NtZuFHBAjMQ
         KNODN0cu1psGJpIR9i9C3P/sbOssnq865mc2HSWIPpz+3JuSvJVs/h5G5ZZnj6tPOvc9
         AmNmtgavvxMNUJK3wCyQrWliBPcdDTKyZhWwEf8RdanEMh1JyuFchDfRuOF1fJVOq6tD
         MrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173410; x=1795778210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NaMGQ4Owpl3Co7yhqKVZHVr+kTFNUk1Lb3ecw2usVA=;
        b=qa/Upvujq65Q8zksdwYGXktf5K9EyLnIuGZsfV82zcbMkJqw7cYY5J1n8y46P4OxtS
         grc718bIfpgf9j7g+f+d9TDzeQFMbfQsMjn29xqY+9Un6q9BIBuCUGXF/7FkPP8NNmwZ
         NdK4jFGpFKAS9lKGzJwh/cHkBSt8a3hOQiIKeyh5nNQeJCV5nXR12lqC1ouLM7JJzh/H
         x3sBctO3fEpSy1FGCDRSpEm8q7agji2I99NxP/YqXWBuIXXkXVia2bONJmD0aZOAad6Z
         Kod6D8g6QRsoQwkItte6oNUUqm4TT2YXuJ9HE7zTyiBGO0MPBifxnim7D4x7XFFJpKLV
         DnSA==
X-Forwarded-Encrypted: i=1; AL+hErEO/gF6rRpFmQZWz0ro5rpt9a5y3SSn52c5ivVTvh8HD+alyTmrNY+Xx3K2CQApjwTe4odUu4fOxJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bzgxoSpMwYOQHFd4eD4q1JRY3syUBvaepd24UcooGVBJONazE
	6x+lAzhe6+rOEy/tf+940vSqc8ajLAwEB6k580HcRmAAUr8UWM/oCUmkO++ViF0yO7ax2O+keG+
	8IvDW2bpdaMkgt4/a3xKBlJPN8r2eeqc=
X-Gm-Gg: AYBFou2tywGCxBYOGI3hDddVpD9G1EZDREelslaahDTZw6uuUCSWZtmzCig+xCbjdfw
	Y4u5vjM4qZlOeGJDZoKJVot6GviBeFIkrjItsAwmNaegv2esKAZ8eo3EjVjZ7hOtfeAC1uQ/2VI
	3zr0NrZMN6x1n5aXdnLGQw7p4ASxEJhm00ipBiRnasFamaxRxd/d8JAsTx7OFEM8LFartRKp9aV
	9u+LwhSKoC+XlbeHlGv9FmK9RA7zSKAsC5lCV05bKFsO1huhRWWY81SS7d82i3jqhFMOGsHfLZr
	zTgvvFAq9RdEF1fgO1JAydGNU5TT0l42ElOgXsKD/Cs8MnE2x3vjQZxGvU+EV2tIAMOp6sZ4W4W
	aQaBhEzg3EWeMwRPbbJUuQG2do+szebK7P+mPBjudodAVLrKbakbSQekMiegaRH6Ug7Drgg==
X-Received: by 2002:a17:907:73cd:b0:c40:38b5:d784 with SMTP id
 a640c23a62f3a-c513a614467mr280155766b.22.1795173409664; Fri, 20 Nov 2026
 03:16:49 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119154001.9b9f953136935a09e8a50af6@linux-foundation.org>
In-Reply-To: <20261119154001.9b9f953136935a09e8a50af6@linux-foundation.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 20 Nov 2026 19:16:12 +0800
X-Gm-Features: Aa3M54pc2xETNqoexA8P5jVd0jSnzthhaZdG2Uuuwphbutgg3FiGQAMnp8Ovueo
Message-ID: <CAMgjq7Dd=Y+GekSD9WO5oGdoa+S1eG3T-U=VsCexopvb723zFA@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] mm/mglru: frequency guided promotion (MGLRU-FG)
 and flag cleanup
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nico Pache <nico.pache@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, 
	Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:40=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 19 Nov 2026 05:03:32 +0800 Kairui Song <kasong@tencent.com> wrote=
:
>
> > This series implements MGLRU-FG following the idea proposed at LSF/MM/B=
PF
> > this year [1], based on current mm-new. Depending on the workload, it
> > improves the performance or reduces IO by roughly 10% to over 50%,
> > fixes multiple long-standing issues with MGLRU metrics, and drops one
> > page flag.
>
> This is looking really good - great stuff.
>
> Review is thin, so I'll remain in wait-and-see mode for now.  What do
> people think?
>
> I told LLM to put this series through its paces.  The performance gains
> were confirmed (actually muchly exceeded) and it couldn't find a way to
> break anything.  It found a smallish slowdown in writes to clear_refs,
> which doesn't seem very important?

Thanks! Glad to see another positive report. And yeah I think
everything is fine.

The reply below is a bit long (and 99% not LLM generated :-), so
TLDR: We fixed a long standing "bug" here in with a small (IMO)
interface performance drop, and that interface's user was already broken
(which we fixed), and I think the performance can be easily recovered too.

("bug": it's just messed up metrics readings, there is no leak or
race, just these values are just no longer meaningful in anyway and
are breaking real world usage, see appendix)

A slightly (~10% end to end, that one interface only) clear_refs
writer slow down is expected, smap is the only user for that (maybe
DAMON too but it works differently and won't cause this many calls).
However, the thing is smap reading was almost broken for MGLRU in
mainline, just like K8s users have to disable MGLRU by default for
years because it keeps giving gibberish readings (See Link [20],  the
refs and workingset are tangled in PID controller / aging in a
hard-to-describe way so we see seeing unrealistic values).

This series fixed that, metric readings are now sane, stable and
accurate, close to CLRU and provide useful data for workingset
estimation, so the trivial slowdown of a lessly used interface seems
very reasonable, and we only slow down the even colder hard reset
part, readers are good as before. (We'll also need to update the tools
ABI part later, but that's too long for now, and I think we can live
with it for a little longer considering it has been broken for so long
time...)

Meanwhile, if we want better smap reset performance (I'm not sure if
we really need that, since it is costly by itself already, a whole VMA
locked walk & PTE update per page, and ruins the hotness info), we can
do this:

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index a2442e49aca2..45808f7ae50c 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -562,10 +562,12 @@ static inline bool folio_check_lru_refs(const
struct folio *folio)
  */
 static inline void folio_clear_lru_refs(struct folio *folio)
 {
-       if (lru_gen_enabled())
-               folio_reset_lru_refs(folio);
-       else
+       if (lru_gen_enabled()) {
+               if (folio_lru_refs(folio))
+                       folio_reset_lru_refs(folio);
+       } else {
                folio_clear_referenced(folio);
+       }
 }

It should speed it up instead for most cases, I didn't include it just
to keep the code a little bit simpler. Smap and DAMON are the only two
users, so it's safe to squash this into Patch 10 "convert to LRU refs
based operations for MGLRU" directly.

In fact, if we really care about smap performance we should start
batching it instead of doing things page by page like right now, I
think that may bring a much larger speed up.

And a Appendix: Measuring the smap Referenced, and active / inactive
reading during a build test (LLM did help on this :-D ):

      =E2=94=82 smaps Referenced/Rss % min/med/max =E2=94=82 span =E2=94=82=
 stdev
CLRU  =E2=94=82  99.4 / 100.0 / 100.0              =E2=94=82  0.6 =E2=94=82=
  0.0
MGLRU =E2=94=82  38.0 /  99.6 / 100.0              =E2=94=82 62.0 =E2=94=82=
 12.3 - erratic and unstable
FG    =E2=94=82  99.9 / 100.0 / 100.0              =E2=94=82  0.1 =E2=94=82=
  0.0 - matches CLRU

      =E2=94=82 active_anon % min/med/max =E2=94=82 span =E2=94=82 stdev
CLRU  =E2=94=82   0.0 /   1.1 /  24.9     =E2=94=82 24.8 =E2=94=82  4.5
MGLRU =E2=94=82   3.7 /  96.4 / 100.0     =E2=94=82 96.3 =E2=94=82 23.7 * c=
haotic, almost random
FG    =E2=94=82   0.0 /   0.9 /  12.3     =E2=94=82 12.2 =E2=94=82  1.9 - m=
atches CLRU

      =E2=94=82 active_file % min/med/max =E2=94=82 span =E2=94=82 stdev
CLRU  =E2=94=82  34.1 / 43.8 / 52.2      =E2=94=82 18.1 =E2=94=82  4.7
MGLRU =E2=94=82   0.0 /  0.1 /  0.1      =E2=94=82  0.1 =E2=94=82  0.0 * en=
tirely wrong, always ~0
FG    =E2=94=82  24.3 / 33.5 / 42.2      =E2=94=82 18.0 =E2=94=82  5.7 - ma=
tches CLRU

Pool over 3 test run with make -j48, defconfig, ZRAM as swap, 3G memory.

It can be seen clearly that the metrics readings before FG were almost
gibberish, FG fixed that just fine. These are causing issues that
describe in the Link [20] above, and many other components. And they
don't write to clear_refs, they just read meminfo, smap is also
included here but less used.

The active anon reading for both CLRU and FG seems a bit low, mostly
because this task is under heavy pressure and aging/reclaming fast,
and FG also provides the way to tweak it in the future
(LRU_REFS_ACTIVE). And FG reporting a bit lower is somewhat reasonable
since it does reclaim better.

Note, the goal here is not to match CLRU, but CLRU was clearly doing
much better on this, so using that as an reference shows the
reworked readings are indeed normal and reliable.
