Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5033338BF92
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 19:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778615916; cv=pass; b=li/uQIMpzSQDQD/fadH3L09FZqpqYr1R5MSHK8aOk9opH0SAXzeOCdNJe80yjbcwITagucHBwqvwZnO4fN3a7mB+Ziq23H4RZK6RW36UDr2AFtQu2q2jRJ1Ar8dYaPTX26f8mNqdU1l+wuCVLbjW5f/b+aFTZezVqkMK74AAvlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778615916; c=relaxed/simple;
	bh=2ZhacnruZi81vEfvvBZsGee6NoPNbhQQU7a3Yf/yhss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ks013w+O3NmNqtFmfXPR+PCi5pWwJsFIe0YUJC3TOIrMMT3RqQKWkh+3o6enI5cV5lU0SDFzAb1t9Apx4XZZmhvdRbxVZ8D+jLWwkP5EIz3tB5Cbu6qlIeEZhVF6fUo3dyoqwOMa0WoINWFKv02Onpet/ZHRvrM/pIgXZKSKKZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dsEDQhuz; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dsEDQhuz"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-671588ab0cfso303a12.1
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 12:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778615914; cv=none;
        d=google.com; s=arc-20240605;
        b=aDxoc08wRKtgRgA2ayXq8uvT2ohazs1HHgJUD132m/9uwzgrSkWpfW0WPPut2RUQYf
         UgUbwPJBwReUD64t64/Pz360MmKhWxMqHs4KNGL0YnyPc1yYLDMIle0qDwe9XaGtt0UN
         5EL0SDKma4BhfytRfIffbbMBysqgzE/iej4gjBMVVMDc+v6BUAxF290wEZbCFhLuktde
         j9LX8spB2iufoM9qqMrXujIxRkgHZq67EDCLO8UveKhDKsdL2cXjYo0LveSgEQBXEgJv
         SZBcb6ydTBUTOlJ5zpKGddzHUa1D8bAY8Wfzn/H//1kUJbUKXKXL8zYTbMdLmceNm9MO
         aGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5m6NJ/GUzSXfukEznvlNg7F/rj3o2Ed2/fJnLfv3lGI=;
        fh=PrSQg7P+SnjNLTanE7dgivaR94rpwjKFqKWb4zsj+T8=;
        b=Iv3UNoBgvkaMAVIczrsGB3Vk9CAV3SELoeJ5OhjRM2ZqfLmoNMW7hAZHVjinu+vwAm
         Q6LnM/n8aq5zWJNGCAE9nKYmHnDps6i0Obphc/RCBA6J53ldJNuqnm4SWNpbbwPzzPKZ
         Ms5PXchb7BM/htyD9RslCyk5uNjCbH6+75z9L7LYHbcy/pFqboN6kHj/AT+AmtP1gPtU
         eTyixCxfKWW4I0Kme7Emtj/hYjOf7zboxFWMOcPMeKLTLUEXsdUX6g0BMpmP8lI6Wv4X
         y8hP35BsnUlNs725YBLB2UUBhlCCh4SYxLFjXnDST1CN+u9oVEv6OtkT6Nv084HfD0An
         nzmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778615914; x=1779220714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5m6NJ/GUzSXfukEznvlNg7F/rj3o2Ed2/fJnLfv3lGI=;
        b=dsEDQhuzJaSKVV5kpKY1pPbtORW4TWb4X3QHhH/k5W8b74HmjKsNW/Wt6cVVlfQprs
         v6nobaCOwx04ODUgDjJD1Lktfiq1RTluwDR3SLGxA5z18ue2FMJmkOz/XBmXMDd714pU
         7Fa2cNOBRaJzCa7YoUfx+3XSc/XNjs/2GNroC7A4+u7sJHraOdQbvJ63xObQuZqf+Ocj
         oux4+mQrVmhZ1y9JZ1pHemh1IcPYoAAuEWKa8//kNk/xVggJvqmoFnKaqfcWxQJ977Ub
         IkfsZEYDhojpOANSMeCBPeqFzSD8YQ5v7E7LG91WB0xd/e28OwzG5hhuc3/phQ0HaUe0
         Enwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778615914; x=1779220714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5m6NJ/GUzSXfukEznvlNg7F/rj3o2Ed2/fJnLfv3lGI=;
        b=IQoU638sSQ4wIpOb604mBo2/D+D9y3o17hDa0X9GodxrXw28h2UaEPgciloeXukzlS
         /kqeGlNzrlOUBy4wKM9L+rC+gLQnk8CxFVMyniP2ubVp/oZe1/JkbP2QPUkZI7KZLJc/
         vGZdaZyrBXwMxuMSU6h7oKU/F4UBScI6s/EG/aqcGNMFriLhxJLuteilRRFT2tF11Y3a
         jsOl0fczFyFuQpKV+pb0WI/N9L0TK/pygya/qLiglJMz/Lu9pplPmJ1BouKQ/2q+G/Wl
         +LZReNWewSImzyTzruJ/zCo3B3kcY4+/rl+bsHiz4FMsTMWy6cPxfInwL9UMtfkQFAdu
         VFdw==
X-Forwarded-Encrypted: i=1; AFNElJ8ufcQRVoxGg/ln4bkuqfc27kIbi7e+7Qtg0gWDl1hzxwRwVeOFoukAJn3uJewmNVT5HuxdEpYzZ9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfXoXHBoCq+2DW1s67RxbQXlN2oVG1mYebukXU9EZul+DGeQ09
	Eu9BWpB2xHKfDCJA4235avnKuY/WkylEDRpK2WIKDh0FcaPOryhE74ort3B6aJk+0t4XjmiHG71
	SfE+FK4AIXTl6gAX/N34lNapYH7w8Ec0Kctqx14O5
X-Gm-Gg: Acq92OEiD1FaKVQ7PDTHGQBJiqjcDOFKmIwQn5O6AZ0t0wWh/ywJ+mbD9vnHNnA6xG3
	5cTPpIG3TGds8hvj4HbN9cPxfzl/dLS7QHsAZtd/kTTt1R454hwd8MQ5fSscbY4KDA97EKs3uYD
	Jtre4Cb5KY4K8MBeiB8iwj+Ik6RYoL7XM7ZbEhtiRI0w9/3SAs2smu9xE72JHsV8zNMZqK3AzzC
	zS40FTf/Jgz6JVFyBuYfm/ENxWVGfXCwtopjoGe7Jl6bksufLXk9abKUgEOt3p/6lwlkaCfJZij
	dgBWfhDVy2IhltS2kN866x8iANWSsNt+vvcz9avy0+RBNVx1
X-Received: by 2002:aa7:d987:0:b0:670:2007:668c with SMTP id
 4fb4d7f45d1cf-682143aeccfmr17629a12.4.1778615913243; Tue, 12 May 2026
 12:58:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777936301.git.abhishekbapat@google.com> <9bff01a8-eb97-4d09-81a4-f4dbf9b59b73@linux.dev>
In-Reply-To: <9bff01a8-eb97-4d09-81a4-f4dbf9b59b73@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 12 May 2026 12:58:18 -0700
X-Gm-Features: AVHnY4K4mgRxMzZXs9TbGliBXSUNhj5QutdOEj_iYOol2xOCgNXTxL2QFRb81Ko
Message-ID: <CAJuCfpE9_Njy7Tm4DnNin9HEVoqqfKzTRgxYkEEyzm+OCc49sw@mail.gmail.com>
Subject: Re: [PATCH 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
To: Hao Ge <hao.ge@linux.dev>
Cc: Abhishek Bapat <abhishekbapat@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 1:45=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Abhishek and Suren
>
>
> On 2026/5/5 07:36, Abhishek Bapat wrote:
> > Currently, memory allocation profiling data is primarily exposed throug=
h
> > /proc/allocinfo. While useful for manual inspection, this text-based
> > interface poses challenges for production monitoring and large-scale
> > analysis:
> >
> > 1. Userspace must parse large amounts of text to extract specific
> > fields.
> > 2. To find specific tags, userspace must read the entire dataset,
> > requiring many context switches and high data copying.
> > 3. The kernel currently aggregates per-CPU counters for every allocatio=
n
> > size, even those the user intends to filter out immediately.
> >
> > This series introduces a new IOCTL-based binary interface for allocinfo
> > that supports kernel-side filtering. By allowing the user to specify a
> > filter mask, we significantly reduce the work performed in-kernel and
> > the amount of data transferred to userspace.
> >
> > Performance measurements were conducted on an Intel Xeon Platinum 8481C
> > (224 CPUs) with caches dropped before each run.
> >
> > The IOCTL mechanism shows a ~20x performance improvement for
> > filtered queries. The kernel avoids the expensive per-CPU counter
> > aggregation (alloc_tag_read) for any tags that fail the initial string
> > or location filters.
> >
> > Scenario 1: Specific File Filtering (arch/x86/events/rapl.c)
> > 1. Traditional (cat /proc/allocinfo | grep): 22ms (sys)
> > 2. IOCTL Interface: 1ms (sys)
> >
> > Scenario 2: Compound Filtering (Filename + Size)
> > 1. Traditional: (cat ... | grep | awk): 21ms (sys)
> > 2. IOCTL Interface: 1ms (sys)
> >
> > Scenario 3: Size-Based Filtering (min_size =3D 1MB)
> > 1. Traditional: (cat ... | awk): 21ms (sys)
> > 2. IOCTL Interface: 14ms (sys)
>
> What a coincidence! I was just about to send an email to Suren
>
> asking about plans for upstreaming a filtering tool for /proc/allocinfo,
>
> and then I came across this patchset.
>
> I have been following and using memory allocation profiling since
>
> it was first introduced. It has been very helpful for our memory
>
> analysis by providing clear visibility into allocation data. However,
>
> we have always wanted a tool to efficiently filter this data to get
>
> exactly what we need, so I previously developed a userspace tool [1]
>
> to help with that.
>
> [1] https://lore.kernel.org/all/20250106112103.25401-1-hao.ge@linux.dev/
>
> So this patchset provides efficient filtering of allocinfo data via ioctl=
.
>
> Would the next step be to develop a general-purpose tool under
>
> tools/mm that leverages these ioctls instead of parsing /proc/allocinfo
> text output?

Hi Hao,
Sorry for the delay, I was travelling for LSFMM and missed a bunch of email=
s.
Yes, we are planning to upstream alloctop tool
(https://android-review.googlesource.com/c/platform/system/memory/libmeminf=
o/+/3431860)
and now with ioctl support it becomes more relevant. Once this
patchset is merged, we will prepare the tool and post the patch.
Thanks,
Suren.


>
> Thanks
>
> Best Regards
>
> Hao
>
> > Abhishek Bapat (5):
> >    alloc_tag: add ioctl filters to /proc/allocinfo
> >    alloc_tag: add size-based filtering to ioctl
> >    alloc_tag: add accuracy based filtering to ioctl
> >    kselftest: alloc_tag: add kselftest for ioctl interface
> >    kselftest: alloc_tag: extend the allocinfo ioctl kselftest
> >
> > Suren Baghdasaryan (1):
> >    alloc_tag: add ioctl to /proc/allocinfo
> >
> >   .../userspace-api/ioctl/ioctl-number.rst      |   2 +
> >   include/linux/codetag.h                       |   1 +
> >   include/uapi/linux/alloc_tag.h                |  87 +++
> >   lib/alloc_tag.c                               | 249 ++++++++-
> >   lib/codetag.c                                 |  11 +
> >   tools/testing/selftests/alloc_tag/Makefile    |   9 +
> >   .../alloc_tag/allocinfo_ioctl_test.c          | 508 +++++++++++++++++=
+
> >   7 files changed, 865 insertions(+), 2 deletions(-)
> >   create mode 100644 include/uapi/linux/alloc_tag.h
> >   create mode 100644 tools/testing/selftests/alloc_tag/Makefile
> >   create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_=
test.c
> >
