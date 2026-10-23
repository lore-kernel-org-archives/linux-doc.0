Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792776275;
	b=aumayZj2Qz+kMVEfGQA7eGdl9n7F8tpRCP1DXhYvjH/9LhExS37otrSbKUKhEW0nEX4F
	 7Nz1OSCvdtFb1oFvVfJD07SOqHPZxWOcfDMbWoWFdN6lTkdByiDOy5RlhmthBvke90i+l
	 X1Oki9vYtoh4vexLzxbliMJHErByKri5/L8Ozcdou5m96kXX0Hc1/2KQiAdWW97K9vlzd
	 F9ajOX+ulnTD/yqRoeMxEBJAz4O0Abs4069ohwZiFpmHkz9wRSYfvk0nQnAYc1X2X8J+T
	 JhtzJ4n0bHx3w16aY3+z5yRo5tGuxHOqWOR09dmn1LQcnY9eJurxaVqnX7svdkhssdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eals/84abdHEOTEHYo1O4S1OdoccFJaWdA/VZnmG1HM=;
	b=nVCwqLnKMQwA03b10aqjtiy9Q8toI9Pylz8sdwWcfTVE+WJITKvXKsp7Fd8eYgzYimUJ
	 iX7YSHvDd5GKY8Xs3b+FUaicHuDUQdmEw6OGALV0ue4jNfu5eXt2cXh6SyQDk2ZsFNGTA
	 p1J6qp3gtVOE4DNBnB76JAKCzJMPQunV8KnzfkdQUVmJFwvRIfCKUBwvfZgVVbGNhN7hy
	 L7Q2+9XJEdQHpmJE69hSRYYcFuq0n2VwG5u6zCbfVyMxNx9ca0l6V4vXxz+6JDbi+n8yY
	 llO/O59drzVQtFX1Yl1hyy8jPcjeRhNSqRAbpEuXqKWNSfU9UAuF1+Kvn9cHpfYG7Aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P9y7fnPi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F99D606A31E
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F99D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P9y7fnPi
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e011d370dso930419f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792776273; cv=none;
        d=google.com; s=arc-20260327;
        b=faaCSi05WXnJW/IEbXn502V0X3sPwK7leyq0S50K/+jW9pITc9IMJc36IbQHfEL5u+
         uvXs5LKJ+OSY/Qq2UBBjiZ9itE0BYWyRaxTDO5j5IIlPhu99nLLISR6Zy4YJKlwi+KTh
         YL8p/E1i403AEzbkpyDqqjs+bKNAoQxFSTiNbEHxOeUkfKK00S5QDsw7iRG8h3Ft8W0I
         Vk8AeH0A7j/iddr65kEfkk9veBEMN6OSKbFO1ERR3AuqC59qJnF/mBQwBDOR0DSvalbw
         LK1DPbIacNSR6dJD7OekGQk0lXFi8Lr3WO4YFkqHvQaGYZvKUs79/HzZ7ZxoIzk84lQX
         zaSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eals/84abdHEOTEHYo1O4S1OdoccFJaWdA/VZnmG1HM=;
        fh=EriG4C5twLoeCTCRt+jobs+k9qHi3y7LLPanZHUj1/s=;
        b=MhPFedr3OWDZwredElRsuOba4/FbAtFBM5G/mdHD7YmOwqvsbSWEjJJnxP2YWO9+D7
         /rhoF4rQqKGIvrl22qxlMOeJ195+cQ0jIIpITjPLYqVqJSDl/n3wVbE5hPjjsbpMzODD
         0gb2teaPv6t0rRsYhl0UyeE/hQM6eXyWnerwRVCZK2AkfJAib0EcQLVUrQSJogSa37o4
         8EirjpOLNPUppqYguLbzbJPzINu8cwpPxohz//COyerfhNoJURslJmnBwOWL4peXJFSd
         XWRI/KujkVrT8EVrSugMCEpIu9NbtKbW8rZusx/mAl3LgmLfs0YBpq3yk3kCWYe3e5Ze
         VIUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776273; x=1793381073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eals/84abdHEOTEHYo1O4S1OdoccFJaWdA/VZnmG1HM=;
        b=P9y7fnPifOtWSrrXNHRkS797j5HZKJ6sBgMscYlD4DTb0DK/L5+tIiA2eHEdC+cwQ/
         fyJozZAgPWWVs3PbPl6pn8ZG4sS5UVHydDltzJ9VdBsIhu+3g37QDav1luMYBANFoBFl
         4c+Jh91093EhKdeGYgMd/e9LnCkl01LByP+L7FM2SHkPe1DFHNbytLyFuA3alN0WL+XF
         GVts5NNnDezu8yoKBHxAjfClvieimnE9k9WwfB8PMgEc9BEPm6hIHfIEIsH1qEi7ujbU
         ePKXFhXW3jtKCw5NHAzXXg0dnDY98CD1ee+ZoWZqfcpmJcbH4fn82UTcPdnr8HdEDgag
         Y/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776273; x=1793381073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eals/84abdHEOTEHYo1O4S1OdoccFJaWdA/VZnmG1HM=;
        b=sDtn8SIGsGcs1MPqrqvlJh69AoeYYa99PUpUs1I6RFD7+QlmBEerprJmjDy9UxWfEx
         iYI/pUkIEQwqjE1E40Owy+FJ3PSTVZSxowoDrjHlFokVpF40u4DAtHoP+h874KA4YMLq
         FgJvYmPGpVRjzUqHYYitM29HpuQLsuo507Qlv32s7Mc/HE567X2OEhWMIsp3q6Lv/6d3
         ps3FeKLL4qucx87ozqadEjLduq144y1XlWFOyCeqqzgCX/KZIF/1lE542H7DqQvzafez
         vT7Kj2mHGx39dLGMzKYQigu7vF/z0I0NG7ssC2dfijgeQByOKoHA1118UA6CbtGQaE+R
         mJNw==
X-Forwarded-Encrypted: i=1; AKwUvByS+a+LrCeWQO0+s98uzuF/Y/CRHtRehGqrHvuF3msgVi3Mnw5xGX+E6ykXYUcQBzb41UW06ErVhJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpLD/rIT2gCKuK56/1bgkUUOjYTswHn20vlFE+OGVD/PaGIvkJ
	9o9tFncV3sRbB/RxBJAL8pepNZYsXfo9bO/Vs6o2dAFffvIu0IvMuivj9eqgTgF/LVKAD3fFfbv
	91O6gYcP+tQ4OhLkQJ7GSQcOLX3WwdVo=
X-Gm-Gg: AYBFou3LMzlJC1lX/qklnl1ac02cn5s6cm/02U3RPV4K0jKAdP2QJE4NiXQFsBKdtL9
	Ap5d2snksa8knm2u7j7ujhX1ZlprN8+ECfx97shknniEEORD3vjVIBrjOaSvCBNxotwiezU/piX
	hcMfRvfYfvJCEm/aQpHn1iqLB4KeWY6u6OGDorKCMU+c4LK41/rw00QT1q7AfBpNWFZ5qXT8Dbt
	jW3GlfDVnh7qhqcTZYudNBKp6yYP4RjWp07HhsrBJHC9FCWGTEwvtkTHBJVNuilNBna0+tDrW2j
	gkUfyU07GzXQ4XoIxRvfAQiata2Cs192DDEW08A7CPTuZyjuQ1buQhgw0kO5/1nrJ5+QVPB2tS5
	ymdYxw4DTGILwz9G+zPk+hvtyeIHbEF9CpWvPy84SZzqpOXDFGb1yB3lPc+x8hkBELW10Xgt1H4
	A7N2NDgto4WQ3M0Wpi6OwmOW/SX44u7wh9Jv88bJf3tx+jVFIO2eSr5mu4Y3m3CtaW9ZXbqV5wc
	Q==
X-Received: by 2002:a05:6000:40dc:b0:48d:f5ba:fb02 with SMTP id
 ffacd0b85a97d-48e385cb0cemr4762440f8f.49.1792776273056; Fri, 23 Oct 2026
 10:24:33 -0700 (PDT)
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
In-Reply-To: <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 23 Oct 2026 10:24:20 -0700
X-Gm-Features: AclHuK90U31JbVkPlQ2JhTCxhfOcbXN8AAPY12NmqFk3jj-EPn44-86VqmxU4HI
Message-ID: <CAKEwX=PCSyCEAqxeOH6CkCMu1eB3xUn3iz5XNuTbpDM3EmWYAg@mail.gmail.com>
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

On Mon, Oct 19, 2026 at 5:35=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Mon, Oct 19, 2026 at 5:28=E2=80=AFAM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > On 10/19/26 14:24, Nhat Pham wrote:
> >
> > I'm traveling this week, so it's a bit tricky. I cannot make Thursday m=
orning.
> >
> > On Thursday I'll be traveling back from Cambridge. But hang on.
> >
> > My plan lands on Oct 22, 11:10 PM. I should be home around Friday 1.30a=
m - 2am.
> >
> > I could just naturally join that day.
> >
> > So one day later would work for me.
>
> Would that be too rushed for you? :)
>
> For everyone's convenience, this would be the time slot:
>
> PDT: Thu Oct 22, 5:00 PM
> EDT: Thu Oct 22, 8:00 PM
> Europe: Fri Oct 23, 2:00 AM
> China: Fri Oct 23, 8:00 AM

Hi folks,

Thanks everyone for attending - I didn=E2=80=99t realize swap was so well l=
oved :)

I took the liberty to summarize the points being discussed - please let
me know if I missed anything or misunderstood any points:

* Swapfile sizing: Kernel kept swap slots after read faults to save IOs
if these pages are swapped out again, and thus needed swap occupancy
(and hence static size) for a heuristics to trigger reclaim of these
swap-cache-only swap slots. However, this is not useful for fast
compressed backend, and zswap invalidates its compressed copy on page
fault anyway. Vswap does not need this heuristics because it just
frees up the swap slots eagerly on page fault for in-memory backends,
and rely on the existing slot reclaimer for physical swap backends.

* Logical footprint limits and charging: cgroupv1 allows logical memory
footprint limits (unique page tables). Cgroupv2 controls physical
memory and swap resources separately instead. While virtual swap
entries continue to count towards memsw, cgroupv2 counts only the
actual resources they consumed - post-compression size in
memory.current, and nothing in memory.swap.current. While cgroupv1
continues to be supported in its current state, a cgroupv2 transition
will present a problem for memsw users that still needs to be worked
out in some form of overcommit control.

* Swapoff: this was brought up as a request, but we ran out of time
before we could discuss the motivations and use cases behind them.
Folks interested, could you explain as a follow-up?

* VM_SPARSE v.s xarray: no performance difference between vswap v.s
part 1 of the xswap=E2=80=99s patch series. With all 3 parts, there is a wi=
n
for xswap, according to Baoquan=E2=80=99s testing.

Let us keep the communication line open and coordinate on the next
steps.
