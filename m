Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6507338736B
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835379; cv=pass; b=kuESlPXf6nW4rT0u7DfFL8FSM3PBDcV5AAIlFnFzkhAK4oe/YuyFZB+FwaJtiy8d27u/savsnrRdnKXQwJ4sMbJAK9agN2jhkBgOewqR5ovBY2htWi3Ui25og2Al2Pb5V1vHfudsVuMY+pfCdjkdqw5d3u3GZ2qy8vNHGqusy14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835379; c=relaxed/simple;
	bh=9UYprNeVIjPbdEC/Vthez+8t5RhTWtuHYzI22TL9Cf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lf4sJQgK3OAmbESnFj1xKC6YvofJydbkheHZatOiqkj24rOWCCyit+H48etDq7NXAcnRJd6lkNTTUrlC65lDnoy8PTxFD9mPi5rQ0WhCUGXhuukJ6lFvJF54cYgTBPsWDj/cm/YtbHWD6oNEB7QJe/IEBltlnWLynzobxz4l7GM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N383uUms; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N383uUms"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64b66d427e9so10671a12.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 07:09:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768835377; cv=none;
        d=google.com; s=arc-20240605;
        b=Fn60ZEE1IG4BNMSbtFzAcJ1llMVTgdP6ClMCV8gIa9wTsMFNCZa8O9yf+Jp5wcAZW5
         yRphQpPxw9sxqxxPhGneBnUETOUE235V6Iwy+LjoZkIinzck7IfE35ocTaDQLcb4uR/M
         qgZ55dTan71zxMxaaM52eqdOSJY/IuPr66aScO9jlIXxKeLP8peevaHHqW9xE72hFI6W
         rSENvPINkjk0luzX1UP8MMnbZFuLe/eO6TjH0A1m4jYqqNLuNf3xtqVsFX3jVs9vNWyK
         ROeV2xrWaFU1LezhwH29wY70IwS0gNePlGkw2srJVEtCy4pZWtdMZJHp3lgk2iId4q25
         +jMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9UYprNeVIjPbdEC/Vthez+8t5RhTWtuHYzI22TL9Cf8=;
        fh=VnNT5T//g1OtsVEi5/Q3IQm3OqoagZxd6+JgxtUsMWE=;
        b=MUsSSHpnI9sa4TdzXHgzSLuTH8Bqtb+9jxy5sjNToBzoONgeeKg/6WSreVUFXbvLUg
         jmY1Fb6AnglhletbUfXAqBZ68+qfjN1sC6BIPol8BxmDF3lf8e5iK4nYJbcXO+f2hYWO
         pTrBez1zXa9V/5l5/C3gAlszMfurzGVYNaKqrD8UYdGLJh2A4c43ej6atrUzUaXV3Kt3
         mqHS6+NBEC/c/6xXwODkMXRMpwNhAK6tpBEZ/idMb/B3kzGHRZ/TcWF2G7VDxvaGmeHH
         o6TAy5QPounbEnADMCucCI+vVhIn+uZwmm0DlNIhcAnD9roZXdj+6cpfF+Gtt17SL+zR
         cwyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768835377; x=1769440177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UYprNeVIjPbdEC/Vthez+8t5RhTWtuHYzI22TL9Cf8=;
        b=N383uUmsmg/sM8rglIIfFQ346kZawDBdoG9h581GWYVci7tYGVzRaUclkjMtZxkp8l
         oL0EYfh5tVyzAKooh2KAJf9u8d2N5rI0A1ddBxMzN5//WOMg/JBzgMEIBwUjtS02twrT
         ew9UsThZl+PKQzjZZXiRb8rn28+Fwx25QZyw0T+T++eLaQUjbYpLGITed2tJiZl+tSkv
         IZt/51Sz4YRwFk7goVJSgX1zi32PrOeYhyWUZE/PKSfqxhHl9racuyuizVGA3kgM9qgY
         sCiuWZVh2WrNroIODJsj+qE6ap429QZDFj4NlPuL+FCeESPA2iGDgjXtmzqXa+yZgbDM
         Jxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768835377; x=1769440177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9UYprNeVIjPbdEC/Vthez+8t5RhTWtuHYzI22TL9Cf8=;
        b=sgeZFORzrJh+6vgRaMp2iHpcZ0AqPUDk1WUQgnTn+Ujn9lrf/E4EGkYk4i0KqPcBx5
         xvLwMfb2gcf9VkUWx2yirOMu4alZjXkYsPDoMu4XvkWPPRfRDQLey6z/jFQXGLNJ6JHc
         ID2fjsyZs70zBdbdBeVqVnwQgZq9JIp4NUZda3Hvai4swpo/1+8C+oKA1fSgtTWqUk0B
         LPjQPyfdQP+QY90HhSoCARTrOvBEb9aCx87682+ac82yIbmLgiTfX7hKCaWw16ZevzFO
         KHmkf9eUl4e4iVri20sKiHMaxIxSrSEz/YK5G6HWAHi/OoR/cmaoqjkj7WkUI0ZZby5T
         48iQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1afRSeWrRGaMgqevDBU6xoQl3pe0xpTb5PedWD+gD+qRTroKTklZpk9vdO8hHsKRc+zOASwG42nA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGZ1sFQSF8Ym/s5xMqJjyrrLu/mxvdhhyhUsuziLbflL92envx
	CNm4ghxEw8H6NypeXoTrB7ksSWysziS2OXaIGpA8RNV6gYwDIsQOsE9Wpuag5VHl/DhQqxNvWgc
	ezF6q/8oqiJ+C9zTNc26pylvig+0wBVbU3PxkKkC6BAKS3X31jOS2p41kink=
X-Gm-Gg: AZuq6aI9+bZe+qfnu71QQWyXNu28Z2I9jOdM1RaNHzJudvxpwHx14pCRtZJ5dgOiFav
	GRXfd7K0Dm8IK0Pvfw9Xjw53AgvYtMG8DI8PxdO7rbBF5XjXWkQLF/bFOT+OhjLJbj4mgi0AFV3
	OjYnT/OUf1iHfMo5gvmFj/5iXvftBUi5pCC87+72AroQtNfg4HvqGuGZ0zNEkjiUtUPjsGfahY8
	QG9puz6jpt63+NrCvg4OPVpljdRRC6UI60tGUBhIJ3ikC9hWvtxmHFP0dwMDBn6E2pGEsrxOmE1
	PuoU8w==
X-Received: by 2002:a05:6402:518e:b0:655:c10d:70c1 with SMTP id
 4fb4d7f45d1cf-6560b278fa6mr65248a12.8.1768835376417; Mon, 19 Jan 2026
 07:09:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119142246.3821052-1-smostafa@google.com> <bca59694-6b09-4839-8577-c8ac4420eb56@kernel.org>
In-Reply-To: <bca59694-6b09-4839-8577-c8ac4420eb56@kernel.org>
From: Mostafa Saleh <smostafa@google.com>
Date: Mon, 19 Jan 2026 15:09:21 +0000
X-Gm-Features: AZwV_QjVeUiz0Q-zd8xi5T7pPmQe5X_A7eWLr5iRgluDvbc3fWR971kZpw8m3kA
Message-ID: <CAFgf54paL1O22-crK-RufOzwYBqQ-CU4BD6=h30WOOfdA2__Vg@mail.gmail.com>
Subject: Re: [PATCH 0/2] iommu: debug-pagealloc: Remove pfn_valid() usage
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz, 
	surenb@google.com, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	rppt@kernel.org, xiaqinxin@huawei.com, baolu.lu@linux.intel.com, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 2:27=E2=80=AFPM David Hildenbrand (Red Hat)
<david@kernel.org> wrote:
>
> On 1/19/26 15:22, Mostafa Saleh wrote:
> > This is a small fix for the new config IOMMU_DEBUG_PAGEALLOC based
> > on the discussion:
> > https://lore.kernel.org/linux-iommu/CAFgf54pBAUm3ao-UJksiuGKtvv4wzRyFq_=
uKwLe0H1ettO4DLQ@mail.gmail.com/
> >
> > Where it was concluded that pfn_valid() is not enough to validate
> > physical addresses before access to page_ext.
> >
> > The first patch introduces a new function in page_ext that takes a
> > physical address as an argument, and the second patch uses it instead
> > of calling pfn_valid() and phys_to_page()
> >
> > Benchmarks with the new implementation can be found in:
> > https://lore.kernel.org/linux-iommu/20260114164322.787125-1-smostafa@go=
ogle.com/
> >
> > This series applies to iommu/core tree.
>
> This is part of v7 [1], right? Can't we just apply v7 instead or are the
> commit IDs already stable?
>

It should be stable according to Will:
https://lore.kernel.org/linux-iommu/20260114164322.787125-1-smostafa@google=
.com/T/#m59d0b455e3f2160cb6f9980a0ae65bc481c53898

Thanks,
Mostafa

> [1] https://lkml.kernel.org/r/20260114164322.787125-1-smostafa@google.com
>
> --
> Cheers
>
> David
