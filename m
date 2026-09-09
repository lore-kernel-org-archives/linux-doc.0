Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4FD38DC75
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 17:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976037; cv=pass; b=X108CXo2efWnNIQCCiLXYvKUqzO6m+U4HkNRBWXD7M+LsBOkZlLO+4PIr/c2Z8MfQKxp+6YFkhtFyXdA8EBFbTcQfA2y2L3BmtXtAwB+Mj07vDIpwqLnYziTmeLQUskHpE5akhOx3YutJa11965U4oAeaQjDtuMsISB4ZJfd4rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976037; c=relaxed/simple;
	bh=hRHhNgr7L5x2Qzex+NhnB6McSSZGczX4V1lZLt3GATI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jvv5rseN1sILDTSMZzpiu/zGmuQcwy9+xC2Jng6vOI4nXEyT70VSuKeIssnJPPHzdkaClAwAIEUDKBoeb66ERtGMwdnU3D+fWoI/aK/FiW4N8PtfWNfZjKrmgpEtNgDQByG5JK4BMmoafbJTwik3TLCzkT7P+lBZyg7bwSVr3VQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iA8B8xGZ; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iA8B8xGZ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48586861639so52447f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 10:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788976034; cv=none;
        d=google.com; s=arc-20260327;
        b=bTF3gXFiLNO+0LO46KrVbkyWzV914ESjYNLk4QhvDQUomMmOCWMT02okfRmu+aOQG5
         r6oxyP1XzdpCS/7RF4dnQMobxhdK4+QQRxuXIay27w04tOVOcf9k0WCe+4WZYuOOOhKy
         sd9h+HVqOLV7ltgGAqnlbHpPjAHo4JaW+WOL063LBBqhp9W5ZzybOtTW5Qhs7YM9rMsV
         bXzsmWGyNWQdnTXx9hApYKg7bkmGPPfu2Uqjol5f6ybZdVm5xlmQOa0YJqd0zhN39OWD
         Z/a58/T5Pxoe1tMUjc4BTYSRz1soBNiF17E4EmiLSjvMy/jGxdC7kmnFxUef5h1X6WAt
         W/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cjBT/gijlT5nlkZYair5/Qqr3lqnucD6OCBJtzUzH/Y=;
        fh=RrdKmtBV4dKkPkX11lK8SpBM6RrGfYKLPgqEKnQMi6I=;
        b=LF3syJhRpXr9RddDy0CzCWEqFcDc4IUwPgF4e8eFdqBOJKHy1klOLfaI8Le8oxHTNK
         tgASQxZkdGmfkpwMyGpH+agSWlP9EcNnEVBXY/Jz2SNv6eeD7GuA2sGlFJRRIuCHSBtP
         pnTaboWZMMDINGbCdZc3hkBeq3hO+StDhBuhjjyMJMCQzffo6tFu0nHi5k8g/f3Oj8bx
         Ukk4zkL7z/OEoI6I0XrTR88aQtYTlSOiALYQ+Okro8h59LuQdK66lnKh/R0VE73xb0uu
         QXgHM4rhFny8EocVwLP68KIgaL+HXs2zr7t7AMLCrLNFagfX4JkzsKcIw0pcgrQR1hLY
         D+0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788976034; x=1789580834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cjBT/gijlT5nlkZYair5/Qqr3lqnucD6OCBJtzUzH/Y=;
        b=iA8B8xGZoUgEd3TwUaCb9cZFEzDs3z3WI+vHB7hKD7wQUsG8+vWP1rgmKBVTNnr/sR
         sMkOu2q384Z+G7kvwjD84N/i5RqPkDzav0owndb1nCU+a2RT7eZSKd+vO/axQLGr2X9E
         xkDFHVLBOndWNGczBPzSiwfYXANqCdcjQUtyg5RT3axb87FiyevsbjulKDYi5VdATdFG
         g3xnr/1wW+HEva9edTjUxqldSucvCF5EBXkkKs0xTp4dhrAMFdAVWcEEQx7qQwmMU46E
         ZJXqJUw1uqUVHL/dVbF9W9hmLhBwk6roK1LzVZdVas6Ix9HV36Vpp0SCFWm/FadLTTO8
         tUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976034; x=1789580834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjBT/gijlT5nlkZYair5/Qqr3lqnucD6OCBJtzUzH/Y=;
        b=ILdOLEL1yyDRARbI2uc4PIPKIsgpyzR5j5RIcpeaYz9U32lhFHHYZl77Yb9rmh0Df1
         7o8NRx7O9tGs8nykzn2T1SKJJtSvrv1Eah+NfJGxTOfrIgi8s7wmC9GowDbw71BM5bZa
         ClEMST6PsM77JpTaOJMMKtB0kykvONYm6ucaXP+qZLA1blJhGzHQPUC4fm8QxpJGAjCY
         BCOYxgXNQVs9Gjq1/xL8Dqh0HCVdZx2G97nllZ554R1KxRtVDpUTPz24YtR1hv+y2d+Y
         C8PhjhjqOVLo5cUEQPNR+8cJoKELju4UmXCKr8AwBzVC2Ncn92fjciVKmr7puwNaMYjU
         dMVw==
X-Forwarded-Encrypted: i=1; AKwUvBzhQTew6LhGczJ2i+cTfu9fxHkTLYDMyVcTYJIcG/jDGbwF5QibZ+zwA8fpASIw/upSm1kKI5qP+T8=@vger.kernel.org
X-Gm-Message-State: AFuF++msNhc7A0aJIZ87V0olfhPWef37PmtBysNdIVmgv+Kb5pcIY9Wf
	xMw38oxEU/dN20ABPpCc7llAkCq0gXGPP3ts+cbzRW1rDZeAnYhNv2pFCDFIXh5t5a0XVOEBcPG
	TBtmo7L0AwhhRIJCaU/QvkhUx1oLS+pU=
X-Gm-Gg: AYBFou3klh9BHsyUehRw5dlj/NDw4vLvUL3592ZC0q5IC8Fc1qn3uV1ooVu1rEYBRIR
	m946+5EesZzgdRHZWIenmQ1qP1qTZ5yMgaIFvEGKaIgUgAiQO6HQWugxpGuCNklRD9x+CwTBYGQ
	4xftkqexEjihyodDChFPmGOI5GjeUmGkbi4SwugNozH0CxI6mcGLfI4d91PGlB4dM6SP9Xj3HrM
	Wa/9gVnhTu0bzeq7MNqXT6eBK3gUB/WvptTzoNR931Jq3sDjzVzsczjZTaR+P2I4KCOr7Hdb19P
	mAId8XeTpCL+jraeOlZFP2+MzXcRBzT04WQg4B1z+3f7KIZs9e5if79hINsNTwqUKsL+zggL1fS
	R2ShDGGl5dig=
X-Received: by 2002:a05:6000:470f:b0:484:4779:bcd6 with SMTP id
 ffacd0b85a97d-486e0f6c735mr589913f8f.15.1788976033902; Wed, 09 Sep 2026
 10:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>
 <aqBT_35E-eSoN_zj@cmpxchg.org> <CAKEwX=N4aaq_oD2agTUNrUNXhaYGeQ9vxu+dywFvEFgWFi4uQg@mail.gmail.com>
In-Reply-To: <CAKEwX=N4aaq_oD2agTUNrUNXhaYGeQ9vxu+dywFvEFgWFi4uQg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 9 Sep 2026 10:47:02 -0700
X-Gm-Features: AcwNN1UaR9pHD2h6-LXbXZDQ7w46sDfAFt5QkIQi55ban0K1e2MIGYElY-fudaA
Message-ID: <CAKEwX=NYoMH8pTKeCvA=XHFmmNVMeDz3mxbhp5q6-PxSTJ5wOg@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Kairui Song <ryncsn@gmail.com>, Chris Li <chrisl@kernel.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
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

On Wed, Sep 9, 2026 at 9:41=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote:
>
> On Tue, Sep 8, 2026 at 11:30=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.o=
rg> wrote:
> >
> > On Mon, Sep 07, 2026 at 01:51:31PM +0800, Kairui Song wrote:
> > > Where I've ended up is that unbounded growth is a real concern. On a
> > > host with no memcg limit (root cgroup, and most desktop and embedded
> > > setups), an unlimited pool means usage can keep growing, with no
> > > admin visible ceiling at all. I'm not attached to xswap's percent of =
RAM
> > > knob specifically, but I do think some kind of bound makes sense.
> >
> > Swap space is just process virtual address space, no?
> >
> > Swap entries already have one or more page table entries pointing to
> > them, which in turn are managed by trees of vm_area_structs. That
> > means rlimits apply, overcommit protection applies, and OOM killer
> > attribution works as well (oom_badness()).
>
> I tested this theory. I spinned up a process, and let it spam 0-filled
> memory + swap these pages out continually.
>
> As you predicted, oom-killer picked it up eventually. The host was
> (and is) intact otherwise :)

Oh digging through dmesg - I did find something quite interesting:

[12462.749663] ------------[ cut here ]------------
[12462.749670] refcount_t: saturated; leaking memory.
[12462.749817] ------------[ cut here ]------------
[12462.759267] WARNING: lib/refcount.c:19 at
refcount_warn_saturate+0x1b/0x70, CPU#17: zeroleak/76075
[12462.759276] refcount_t: underflow; use-after-free.
[12462.777208] Modules linked in: sch_fq(E) tcp_diag(E) inet_diag(E)
act_gact(E) cls_bpf(E)
[12462.786790] WARNING: lib/refcount.c:28 at
refcount_warn_saturate+0x42/0x70, CPU#25: dmesg/76074

Seems like it managed to oversaturate mem_cgroup_private_id:

struct mem_cgroup_private_id {
    int id;
    refcount_t ref;
};

We should either fix mem_cgroup_private_id to use 64-bit refererence
count here, or hardcap the swap usage to below the saturation point of
refcount_t ref. I'm leaning towards the former in the long run.

This is sort of an argument for handling all of this transparently
though - expecting users to know what the cap should be based on a
myriad of architectural and arcane implementation details (which can
change arbitrarily in the future) is very unreasonable.
