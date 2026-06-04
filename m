Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AC24C6F1C
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 17:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780593831; cv=pass; b=s33g5P/I2tl1dqsiQcdSirdbdXz6fz7efm0kO3rxdqW2bM33A6CmEsM/0Jz1541l/60ybEeaIYRNlBGozn7Hq4kJj+Xtt7FBURUc/PHpJONEqsf/k70bvWnOTeHM0FnTK7plKrItFI7cDgtbU4UII6dN8rAdW5P1fMPCklyILGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780593831; c=relaxed/simple;
	bh=WgIKM3EBxa7eVRr1Qp+EPGWEolxCAu6y4pk0+g25Gr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ma650Fpj6ivsqFcgEQNNCt7CGgIwrcycj9zHcQyEA1VZ/oChoDMBEpfhJqAZZnrA9/8OXXAwTR/uL5RYtRZTfNW13Gcscf176aY8qc4ss1EEWksPkbRgXcY7wotYbPHDpI77w3tz7bCncpFpBmQ//0Mm84iGxWXuL2ndrFh4/os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8xCd26f; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8xCd26f"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so798466f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 10:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780593828; cv=none;
        d=google.com; s=arc-20240605;
        b=f1R8Krx8jvTQNI2y6Ga1O264nRdpUBCHTpTacFxJgOZseKFlXO5Nx2LwEpP0ODpf/L
         mz8+hZfyIlQSZO8DMSYqlPUPLxcfyGhUYEBLTzbCDy0GIHBIPkPSt99CGI96GyiYj175
         6PPNcoI/lzJdMhLAM3U7AwzKF+GxiNIBwFo8w5wFQ0OfvfKLUFt70yP38f/iZQ5PUkge
         p8UjXq5WmM5uuPAUC27E8iTHbKfi6W3L73vbC+Cu3CdBp9yt3pR/tglID2whaTB7KXaP
         anjurVtnY38EvTIrpKzT5CC+1NEgL5pfiOA4Wh7CSCNFGTzNvkDbFzda0T6/898R0SiC
         k5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/rB/IXV+OMc2A+R0X4txGzVE+20Yu2JeN9gbqIkZf1A=;
        fh=B9DYsscDCUFt4VlP+M3J1aOQ0gnQs+IA3I//cbEriwQ=;
        b=Yy6UYRGsXKxHqtVbMbhpUrevMGUtqZxwevWSDVf1ST4n3a64r2AYi1hqv35E5U3kBi
         gVhMPR0M+eRQjdcPc2gpySWqDX0Osx4ZApCMui0yXVLiE9sUIc44UxKI3Ui0R8BXniXd
         uq5QwKbZnAMISRZvXv2wtKFZaki0rq3CLA5ohi8g7oyO06thtlDXRJ0f8ySja+XFFoqw
         RdBpPE6zdcuGjpI1jVPorE/XePgFYq0je0lmGPzH65vPsUPqSGViKH3yaFptXJeGw+8n
         nUUXyC0WGWdpGZJl25RRPZGSeNyPQtA5Onnmu5l3hO9Tpxw/49xAr9Qy0TMkpBGQF/d+
         mJZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780593828; x=1781198628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rB/IXV+OMc2A+R0X4txGzVE+20Yu2JeN9gbqIkZf1A=;
        b=K8xCd26f2jR2srH2WJ5ijXhlT8cgZ6PqnPdioj0r+nI/S0Qr48jEUxIOGJIjpbV+0X
         K47vwwIgo00nOo8RbqyBIdnLUG0MZv+UIRtELeJnHtrdmvVk6FnWR71PRGfzobV+GBGN
         1X+YCQuRNbEi6RUDSZIpOun2lkHfac6THvsUgEZW74pS60qnqikFM1fvZcEoDnn9MPlZ
         +gMGdfS4jhtzb9JzaWkATdTwLJeV9FncYCWX2kZMRtGxuV3uemghesicJMane/whLYRw
         R7C7lQwZNRaxLHwgQ2PyjuMyJc38nfO0zT81SZSmeuxw+XCPwHUZ9d3OA58eNQM1aT4Z
         g+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780593828; x=1781198628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/rB/IXV+OMc2A+R0X4txGzVE+20Yu2JeN9gbqIkZf1A=;
        b=qk8RWrD+32oKEbBStPb+/7Yaf3EHba9ggBf7IC09IFK9dwDIUVf49ng9tb9a0f3DAy
         IBp7aUt1tkyl3wOXtw0KWwpVO4ca0KBr9sXNnSKkIgBkAEjAAPkoh/PNVZK6EAr91pMS
         sTAfAvEZPTTAoASIdmmF35ZeGClH+EGaqqOY1ZajSLtfvpOrmSgidN3ZefjvJrDyj1YZ
         C/8vzyxI35Y0OpncunB0z0yp57k7jzlUbVGhgxn++myvG6zhP4fJNf0VB3QtMNXHN5aY
         NthQzSTlOtXl0jNVDsUfDhgG+1MEdj/fndCyb8lveoqF/OfsFXZj4y7S08AC2OfRIX9E
         r70g==
X-Forwarded-Encrypted: i=1; AFNElJ8wn4apYzRhH9rqfQ2MY2rP3II93QBrveFhdoFh8heIxXGm5tPZPwlahF+4jJtE0fWbWY6ehmau3gE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgARG+5W75TQ4WPCSyMRpLvO3MtaYSP2tgCM/bjukH8+3ofi0a
	eIpHg7h05vd0mnZovbl4K28Rj7IFBsm1AZ9EumdvP4lQ/Fws9bHJSFY2En4WFU0lGVZp24rYa0u
	x+418i49SaO5c/ad4SE7NPU8Ke19znvE=
X-Gm-Gg: Acq92OHl6m/yBNSX9gYVTC8aPFc23JQ59iyJpRILLpSkh06sVwvq7UPTuSs+FYVR7tl
	PyQaPfIW1GmqHuhfQWuC9odoHnbkubCNEn+MAjZE+XOaz8YbgTPy7Wge1Qz30m9gSXON57aP34R
	S+PsiqodUmZ3rFytQFty6FWFkxa+aCmL3KI4dE7wk6G+R5nNHBuvcUFYf9mMSJAi8+XMZRNWMH1
	44cFBhHDMOLH4T563uBfi2LiBEVtsrVV119Wr35kT3wAgoC5Mot4a3AahtBmcGpprKYuu4q02ub
	eWSHEew3aYDHwuechRSJY1jbRvrrnFBPDt9aVW1tLnR0flvZEQ==
X-Received: by 2002:a5d:604b:0:b0:43d:69ff:6898 with SMTP id
 ffacd0b85a97d-460302e6f06mr103580f8f.9.1780593827921; Thu, 04 Jun 2026
 10:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-2-jiahao.kernel@gmail.com> <aho7nepN5jZtKmef@google.com>
 <8c0e60e1-5713-69f0-a687-088c87e75764@gmail.com> <ah4ZZGl7GYJf54Wz@google.com>
 <ff344c9f-51da-8b3a-e7a9-c4a7f4702ef8@gmail.com> <ah9i3uhh3PFiS0Uk@google.com>
 <c7870fe2-3588-79db-cbfb-bd6a2b78f594@gmail.com> <aiBpibRNi0BcM1Zu@google.com>
 <9898f83d-fae9-e284-6b85-c7f4089840a0@gmail.com> <CAO9r8zPBH6-0SQ6-_ZOhTQeyu=rz4F=ugikCrU-JR_skm6fEWA@mail.gmail.com>
 <a60eedb6-f3fd-4092-b726-04a17a695ace@gmail.com>
In-Reply-To: <a60eedb6-f3fd-4092-b726-04a17a695ace@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 4 Jun 2026 10:23:36 -0700
X-Gm-Features: AVVi8Cflh7M61FcoQfkq5TRPiQaxI_Tappj1TjJNCo92lEJSIG0y-zr5pc0cdEk
Message-ID: <CAKEwX=MQ3xXBAY-2H8vA+XSX5GHNBubJ2GCYAXGD+Hra++ZM7A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] mm/zswap: Make shrink_worker writeback cursor per-memcg
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 6:06=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> wr=
ote:
>
>
>
> On 2026/6/4 13:34, Yosry Ahmed wrote:
> >>>> For instance, suppose a parent memcg has two children, memcg1 and me=
mcg2,
> >>>> each with 200MB of zswap (100MB inactive). Triggering proactive writ=
eback on
> >>>> the parent memcg will exhaust memcg1's inactive zswap pages. After t=
hat,
> >>>> even though memcg2 still has plenty of inactive zswap pages, it will
> >>>> continue to write back memcg1's active zswap pages. Writing back act=
ive
> >>>> zswap pages causes the user-space agent to prematurely abort the wri=
teback
> >>>> because it detects that certain memcg metrics have exceeded predefin=
ed
> >>>> thresholds.
> >>>
> >>> This will only happen if the reclaim size is smaller than the batch
> >>> size, right? Otherwise the kernel should reclaim more or less equally
> >>> from both memcgs?
> >>>
> >>
> >> I gave it some thought. Not using a cursor could lead to unfairness
> >> issues with certain writeback sizes:
> >>
> >>    - If the writeback size is an odd multiple of WB_BATCH (e.g.,
> >> triggering a writeback of 3 * WB_BATCH), with 2 child cgroups, the
> >> writeback ratio might end up being 2:1.
> >>    - If a memcg has 5 child cgroups and a writeback of 2 * WB_BATCH is
> >> triggered, it might repeatedly write back from only the first 2 child
> >> cgroups.
> >>
> >> Although setting a smaller WB_BATCH might mitigate this unfairness, it
> >> could hurt writeback efficiency. Let's just use per-memcg cursors to
> >> completely fix these corner cases.
> >
> > Exactly, the batch size should be small enough that any unfairness is
> > not a problem. I would honestly just do batching without a per-memcg
> > cursor, unless we have numbers to prove that the efficiency is
> > affected when we use a small batch size. Let's only introduce
> > complexity when needed please.

I'm impartial towards the complexity of per-memcg cursor. I don't
think it's that big of a deal, but only if it's warranted.

Hao, if you're convinced that doing small batch is not efficient,
could you run some experiments to show the improvement bigger batchign
and fairness? Maybe implement a small batch, no-memcg cursor first.
Then implement a patch on top of it to add per-memcg cursor, and show
how much performance win we can get from that patch on top of the
patch series?

FWIW, zswap writeback right now is not that batch-efficient :) There
is no IO batching, or batched lock operations (we drop the lock
whenever we attempt to writeback a page), etc. Might be a good avenue
to optimize.
