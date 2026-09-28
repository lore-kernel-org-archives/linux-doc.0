Received: from mail-wr2-f27.google.com (mail-wr2-f27.google.com [74.125.225.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8835228B4FD
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 12:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599147; cv=pass; b=NmqBUlXrhBgePUEre8wH+b4uMFmBN+9gngl5Uz5k9c6V71R2FeB7d3uMM9dM+jCfJ+hyAtdnvl/cEvt0GTGS2VrtxyzJX5b+dl58TSW2b6FMdD+tuPmDhRDug41oLElZy2zXxQq0YLV6zf90oqS6Qq/RzRRs3qHkp7ZiiKzmh0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599147; c=relaxed/simple;
	bh=DR3g9bGNtZFpf0xFNaanuycRzVRv1O6/PdQwaVpb92k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8nVmKcpnYLR0Q5nd65vAI73GSIIaTIvcL2s/QseaXiVmFJaQ0ej2ebLFCBkqJ7kH/oAEj/YuPleNVBKU985MbCQU1yvCmf7Rv1Bvu5LXRoYWkFYFozi49xLpV4f3ZDM5kfsKLYxJFCGRmhxfjfY9yB+vVaGpgzV81Mo3TvCdJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7plmV5f; arc=pass smtp.client-ip=74.125.225.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7plmV5f"
Received: by mail-wr2-f27.google.com with SMTP id ffacd0b85a97d-4843796e373so1689369f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 05:39:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790599144; cv=none;
        d=google.com; s=arc-20260327;
        b=m7nMsuehEbLDRvbYEMSEvyYNv1lQXaUNYPNUlM0/7Q5OuLpySNqYId0E6WWjVWbFOV
         nSLgA832YR10waY1d5lNEON+jcLbnUCBBZX49OA8IRwnIv75fyw8jMILeh60A/cekQF0
         KMHGxsnVuySLkWLzAa1sxJdfwdM7JPO/3Jm9h+HvqUW3jA/McC5418r0tGuqdr6SuITd
         HUqSQiO+a4SOIp/15K0ckXq74BIXD2fkHMR7Pe2ChaX2FVvkovRQoCiS/isWweE7jAJN
         6ZFL84zkHpaDB9oerYqP6qgLusX5f9xxgClENdoM7voGVPh98xxf6GtlLPneTfHz8tF8
         lciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DR3g9bGNtZFpf0xFNaanuycRzVRv1O6/PdQwaVpb92k=;
        fh=s79lm0HWjU6cksKbFaKu2vaUka5UNlVEwCJoWmX/WlI=;
        b=B8mF5tKmYZh8XT4jy85e2TH6ZwDyVe23dMEEgHlwsMFVq5lXd3U/h/IP1UVtAae1e9
         q1ILePaJE7ez1a6nS1mX0XrpEV9w0H68yGr/a+Ur/EYA9e385CZzgqW8dWFCUon5Oh/3
         O1Q/ZRWSJH77qObZpGEEPUywCuXvSujH+B94vXyqNlSgDPy2wyW2o7TJqIEDUkQD13HN
         GgxACjLIbCk9ke7y0XC8lL06en9HdOS4ZgxS27I/x7EkrHiLdqU7hWnHEgza2i2dhiSY
         pJotR9S4uTVoa3PcT0UjUSWVWhlwBoF1+Cn4jA5UeGuy+itTfdK4CSvJrwjUzwC9QGyx
         hWQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790599144; x=1791203944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DR3g9bGNtZFpf0xFNaanuycRzVRv1O6/PdQwaVpb92k=;
        b=l7plmV5fKwZ9PSQKJEmlTz0kRbxPB6UbjFGJL+ySee8T69iIeGtU+DxVeE79XGNqUy
         LuWr46y/XOzOwedoDKBE9vgohQTOa27GeNAPPwhjt8Z1KegP1429TJiWLgPVfn+LhnIG
         ZP+YJytIkWa7X22gV92qlzrXZb94bycTi293bnb8CoAJJbQOPQhozf6zrZa1a3PhE30A
         YdrHppdyEwGzg1BP/rbdyf9Zl+PvS+/tl3sQIElvJBnfFCPPaw+O9kr3jwPH/AbdH84N
         XEH5sE8E85ieHj6d5vJt+6jflRvUKbLLt0xB9v7+3AYrRyBJ73h64GCR3R4Mh05D4RGN
         xhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790599144; x=1791203944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DR3g9bGNtZFpf0xFNaanuycRzVRv1O6/PdQwaVpb92k=;
        b=Y7Y28VV7YEV+qrhx08/j5oJ/lOF9QpJd8RzBASWUYk7TluYjQMVmwSSYP99rbeflJN
         eF+jMCG+IbYXYreIB1Mb95qVmWH6mJ4m0/OHlQsu6Ke6vNT5kFGPWtmQO6k7BkAy6YV1
         JaGxXzNjG2znfnVJp+5+lFZ4N8+RFPe2zZ2hfFlz5naS+Z8Ot8b9bFdEHUxFVNl/p3gb
         T+3uNJwqsDhaO4NaJ2B1qoJ6rIghFZVQ9Xn3fXfL0LM7WRJRkxTghFo6bJxonNIWoUqU
         Aek9s7DI0jUnuIBWNrt9N1CIKUmmF0WpvVJYT+t7B237P/r7TxnFWSCdgnwzoo267M78
         ODIA==
X-Forwarded-Encrypted: i=1; AKwUvByf4OyOIEcVGgTpgp4fZf2CpAaSmDQ6tm3VV0pVDevfofkal9i/pRaV5J1I+3J3H9RsmHkIxrlj2Pw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqOZo88voq3j61ceBWzIyt1z+ybqk/tnTMdLSjSengLTQYO9ud
	w6dt0h+X3y4NPVp8t06nN1lJ1cwaHeiAiRX9T7HZ5IsZ/A2YKYI+hF8PFQEBnwDAXO1o2WjF3Ev
	3lXviCwiFSonkDH34XJkp7yaXWwGopjk=
X-Gm-Gg: AYBFou1KxO0dFqsSzJtelUUk0HDjXJn3KE7aUMtlq7wHq3Sr46597wkWk62MFz6fOrY
	p0zY6YM0kY7MQUjC7wsdBVnasydeDeeBSRtGXjZMNwXbFu7x89NL/E1y8ut7rsx1b0zavty1a10
	fVp+OBNeqleS+7kcoAbfxNd58aE9C1ZmAJxLTvcsAD88kgw3edlUjaVr919CJMHjOigavzwr63/
	tfEcpTDkBxkJYITLuDdrkp8Cpq/Vl0rzPkABlCpBV2OPK/FwcXlpWlUMfCaAxLDqa/w3KNuOoK0
	ORbBIZBp552eZY2lJ1gVuANnbnCkbWDEMl6meGplmbgK8H+2RvOLyVX4sqMgcgFG4J7NxI5hccc
	BSk2O+wcxuqKof8oWmd16ARV4aQI=
X-Received: by 2002:a5d:5850:0:b0:488:8132:1425 with SMTP id
 ffacd0b85a97d-48881321709mr15591817f8f.17.1790599143518; Mon, 28 Sep 2026
 05:39:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aqjpYHbZ14A8xRtK@fedora> <CACePvbUwTxcMPVK_1GAz5gPDdh0BV9JZSnKXaUFLqDHBzBmPQg@mail.gmail.com>
 <7ee199ddee81bf8026688def82f78ad9db09be9e.camel@surriel.com>
 <CACePvbVA+DnDJprMx3qOrGb98y1ORQ-LfaENy_Btfx3uW=E4eQ@mail.gmail.com>
 <f3ca71f1c561f28a341de0e5a1b3f24bd4da3201.camel@surriel.com>
 <CACePvbX5Oy98DygLZjC=Z03Lqb0nk50_OEKQCT9svbQOOwwDew@mail.gmail.com>
 <CAKEwX=Mv+tnL8K4rfPuof6mKaLQp=tqR_qjtKrtY0-5L85FLfw@mail.gmail.com>
 <CACePvbUF2QQMh_GiCNQn-RTmZNkkLWkmaHSYzdQwv2fupjNQiw@mail.gmail.com>
 <arUcil9kxUPiymXI@KASONG-MC4> <CAKEwX=PXRB35bUL1=O4Bgx9A7aD4izZZ3dcEcCuMBBhBrMv7fg@mail.gmail.com>
 <arbTTKE6nYWlNCLd@KASONG-MC4>
In-Reply-To: <arbTTKE6nYWlNCLd@KASONG-MC4>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 28 Sep 2026 13:38:49 +0100
X-Gm-Features: AclHuK-lq27s41PviCE5Zcm-NPp3FDhb-jdltfQx3nihLbWFQzzSVs0yJpd5MbI
Message-ID: <CAKEwX=MPrgkJdzAc-xjuz57nC2Rd7MrVkFzvorBpn1kV600iXQ@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Kairui Song <ryncsn@gmail.com>
Cc: Chris Li <chrisl@kernel.org>, Rik van Riel <riel@surriel.com>, 
	Baoquan He <baoquan.he@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
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

On Fri, Sep 25, 2026 at 9:26=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Fri, Sep 25, 2026 at 09:54:25AM +0800, Nhat Pham wrote:
> > On Fri, Sep 25, 2026 at 6:15=E2=80=AFAM Kairui Song <ryncsn@gmail.com> =
wrote:
> > >
> > > On Tue, Sep 22, 2026 at 09:44:37PM +0100, Chris Li wrote:
> > > > It seems you are talking about a different topic: the vswap chargin=
g issue.
> > > > There is a golden rule that we should follow: don't break existing
> > > > users. At least with the same persistence, this rule should apply
> > > > universally.
> > > > In the swap tiers discussion, the UAPI was such a big deal that we
> > > > couldn't implement new UAPI. On the other hand here we argue for
> > > > liberally changing user-space visible behavior.
> > > >
> > > > BTW, I already shared that changing swap counter charging will brea=
k
> > > > our and others' existing deployments.
> > >
> > > Hi all
> >
> > Hi Kairui,
> >
> > Thank you for your thoughtful response! Lots of food for thought for me=
 :)
>
> Hi Nhat, thanks for the reply!
>
> > >
> > > Just for reference. Maybe a seperate counter, tiering, is a better id=
ea
> > > than changing the swap counter?
> >
> > I think memory.swap.* is never meant to be used as the "offloaded
> > footprint". It is incidentally correct, because of architectural
> > limitations: zswap/swap cache/zero page usage leads to real
> > consumption of real resources (physical swapfile).
>
> It's not that "incidentally" I think? TGhe defination from the function
> level seems pretty clear, folio_alloc_swap -> charge. A logical
> limitation.
>

I don't think so. It's just that until now, architecturally, physical
swap is always required, regardless of the state a swapped out page is
in (whether it's in swap cache, in zswap, or already wrriten out to
disk). So folio_alloc_swap() gets you a physical swap slot, which you
need to charge. That changes when a "swap slot" can now be virtual.

memcg folks can explain better than I can, but cgroupv2 is meant to
isolate concrete physical resources, because physical resources are
often limited/static, and can therefore be contended. As Johannes
commented, that's sort of why memsw was not ported to cgroupv2 - it's
not an actual "physical" resource, but rather just a logical quantity
(that's useful to reason about). You can also find this quote in the
documentation that explicitly spells out that cgroupv2 is meant for
physical resources:

"For trusted jobs, on the other hand, a combined counter is not an
intuitive userspace interface, and it flies in the face of the idea
that cgroup controllers should account and limit specific physical
resources. Swap space is a resource like all others in the system, and
that=E2=80=99s why unified hierarchy allows distributing it separately."

So I don't think memory.swap is meant to represent "offloaded
footprint". I mean even in the current state, that conceptualization
is already shaky - a page in swap cache is resident in memory. If you
mincore() that page, it's reported as resident. It's not offloaded.
But it's counted towards memory.swap because memory.swap tracks
physical swap usage, and swap cache page, despite being resident,
still occupies physical swap (until vswap is in the picture).

A really good analogy would be virtual vs physical memory. Correct me
if I'm wrong, but I believe we do not charge/limit virtual memory
usage at the cgroup level (at least in v2)?

I think it is fair to expose useful counters that users can monitor and act
upon. We have a bunch of such counters (anon/file usage, thp usage,
etc). But virtual swap usage is not a resource that can create
contention or isolation issue independently of the backend it take. I
don't think it should be handled/charged similar to (or together with)
physical swap!
