Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4AA24DCF9
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 01:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782869216; cv=pass; b=ZRDsFV7xHK76jxlW67MoXyCz4mdbJ1Hfeerw/cnITphXgVFuoYi5Ifxn8Uv6Vhvs+5XC+E3A58x2tIzcV4BfA6wkpsZQ1GmYRmcx4v8ke1Rkjtq5uAlAZYEABzjR0fca+QoCSAzbqO56F6C90nSDFZOAyi+INWwlYlvpXfCEEi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782869216; c=relaxed/simple;
	bh=nn44OXfsXbSy/YGYXvazJT7BtR910hPGEJFfOKFr6fI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kdrn6TRoGjJxe7fYtQbaqcjy/j5alPmFyGC79hSJVFOPwIdkMW+hqrhxx69cYRPXYdSkiGkALjcTVpDAq9pEXqaOEAVHHlb5ux9lMTpBO+4eOKdreICWutO9VJAco8PAcZeXqDoTl2SoTdvOe+tIgmte9EDfLYj9MAxzOTMbRyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQGKcv/N; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQGKcv/N"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeae771c49so62734e87.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 18:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782869213; cv=none;
        d=google.com; s=arc-20260327;
        b=XAKxKLEz7gv7lxxJX0WnH99GwFsHxR+7TV9U1jABd5zqr0j8FIaltWTrS69JJd+Yq1
         OXZaNvrvCxUDnXzrd2ksuLFJoNsWwIurEg0dVHSjfduiO0mZAaW2b6DIp0yKjCMQm3Lc
         UigKKfBdsawoXt/S/YTtl3C7Fd/SF/OON/GPJ2YNmUElHSV0NinT6iWQPPwloYxywjy/
         l0ba5xuSYVPmUuHgbrWMCOan8Zj7kXW/2sv6/+ugLSHTdupfRVbsSWQf2YBi5JAi6Ayq
         HLcM97wm2C6hvC7HVm5xlYZTFHshmqVWD1v2b8h3O1RZRU79cMZCK1gBQPOhr0WrD2RA
         3y/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nn44OXfsXbSy/YGYXvazJT7BtR910hPGEJFfOKFr6fI=;
        fh=U562MFDama6jv2NI+kB+EpFumwpaDrhUJd2v1osXdsI=;
        b=T3hfVOsJdxelX9a7OVFzYU/xAZcHS35z8zZTOtb3UD8DLL+R4O1sQROyzq+wZ7kXTP
         tHIoCdR+7Ozycg8ECbDTtO8IwLqEvCoc84xrXlS+a43qnWOhZSjJNGsw/lFc66B7kkUa
         nUoQIjcqpzt/zdeTrIwh/TkjYFNlzUaSh3pShDG/g5Kb0KF8Od2RriXsB6JZ0SN3L+4L
         mV2Mzf9SdMM0VQTbVGbcwMbLNl66pZMXh9my32g9cZGDyWPguAtk6jXYifcyvBz+j28Q
         jauQrJomi1vWJz2bBGX4NePTAKFMy2bVahaDVWkzVKrdZrQP3fkAc57q3LrI+VwxqZLZ
         NnRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782869213; x=1783474013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nn44OXfsXbSy/YGYXvazJT7BtR910hPGEJFfOKFr6fI=;
        b=sQGKcv/NcmQcAorLERtGwSk2B8MXgFKVV3LbgUYD+tfeGLnF4Z49A1kxI4O0ifu+Mj
         CB4rLm8vUay4btMnHCHXhQ2XhP/plczNPc8qjiNBfiH4lq4TvKaDaqFJbkKYMsR42PHm
         QNgIEIF4OC6M59nLdZ2OHh49frli/s8syWLMYxeVU+ecnFqzTrNz8cSRI71EsFViNEcN
         TMD9yW9Z1Szj/v4iLAH6tQpvHBwtgPhKtZBspssYTMd3tg7MPsSO2G02vnAm307amFtn
         rre17c3QobE44IFdM370rQPsKVuBEdsgDymHeqy3nPdKQOm6JVh9LjT25xupMoCCMmCL
         yI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782869213; x=1783474013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nn44OXfsXbSy/YGYXvazJT7BtR910hPGEJFfOKFr6fI=;
        b=JnRDIzEdRTS5lkD48IbtZa8Wj0QvgZM83qMqTcZXsAgPL0prbOUrxYiUIsGDRYxRGu
         ItdzGs4WbPhrXCsmtGSbra4UPuBsgkoo1QT9pOggP/UkHfIzagwnxYyIlZik7H1eHWF+
         jsP499VqzTw4ILPUUjGnNKefImoZ7yOOWB22/wx4KQlCAKROc0GxGZk7uNUd/9H/TL5z
         wg5mPNm9iH8HkNs0P+tq/Zv8VgUkQlf9NEx+bjTRBAeV187FegrbC7sAP0ifGFjB4yZy
         UXlgWUFKYWDvaTmXwyS39sE4L7X0d2/KQcSFQ8U9FkEcjKSkj9S4NaZfe/IBkZZPBSAY
         NZCw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7lJVcQQ2Anhu+V/9c1+mOZyhSMzqGTb63s0/IlQ63jk5UwQSQT6m62NzkhpKQ9syg+xK21GG2cdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqjjaQWXY9iTsU2hyWdc++WNU57P6aJgwKdS3L3xZ3XfipWBM9
	gy/Qa3LOdIQIoEqtzVYLuU32qQPzzbrxoUqH6aY3J4/1a/vOO+7MdkMhWrplri4C6lF7L0C4wEf
	wmWTzjkRst7nfB+F9rgOOWXaQ8aa2xeE=
X-Gm-Gg: AfdE7cm0eMb7HhpEiGbuOUqd0hb+59EwQyEaSE/rmlgpZ2/oV6KV2QBMe/wVYfHddAE
	TuaYBniSl3M3JwVCT+0kua9buJw/sXGkRZYLCdhC3REoDFmOXK0xM0B4OwSK6muiuh7zhthubSp
	foQW3dgnKmab/3wXA0CkzBGHgsRYWfQL8xvThYRnR8KwHvcfcsmaG8ANIUZkn5Of/nlP+IQ2TZi
	PX40RvqynhxhC91vLVV+c9gk0TBojnd6qcAXQ6KJEd3GHLAnnlyhcOjd1LeqvWL+Ar7OXSpFxBe
	ayUKrQ+00fkngJ5o8rVlZ4x+prmT31qMVI08
X-Received: by 2002:a19:ee1a:0:b0:5ae:b8cc:7090 with SMTP id
 2adb3069b0e04-5aec10ac84amr514208e87.17.1782869212973; Tue, 30 Jun 2026
 18:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-0-d4f648963382@gmail.com>
 <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-1-d4f648963382@gmail.com> <akPwKK22ahROxDqL@cmpxchg.org>
In-Reply-To: <akPwKK22ahROxDqL@cmpxchg.org>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 1 Jul 2026 09:26:40 +0800
X-Gm-Features: AVVi8Cdt8tgnGzZA_WeFA3JAUzVfHE9BvykEBi_G2elgToaz929JtXbx_b5q4WA
Message-ID: <CAJxJ_ji1JhqPnKoO+KdTREXnMpaOMzZ5VQUMcHS3yu2uF7g5Jw@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] mm/swap: colocate page-cluster sysctl with swap readahead
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 12:34=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Wed, Jul 01, 2026 at 12:27:32AM +0800, Jianyue Wu wrote:
> > page_cluster and the vm.page-cluster sysctl are only used by swap-in
> > readahead in swap_state.c. Move them out of swap.c together with
> > swap_readahead_setup(), and make page_cluster static to that file.
> >
> > Rename swap_setup() while moving it as well. The helper is internal to
> > MM and now only sets up swap readahead defaults and its sysctl hook, so
> > the more specific name matches its reduced scope.
> >
> > swap_setup() previously lived in mm/swap.c, which is built
> > unconditionally, so the vm.page-cluster sysctl was registered also on
> > CONFIG_SWAP=3Dn kernels. swap_readahead_setup() is now a no-op stub whe=
n
> > CONFIG_SWAP is disabled, so vm.page-cluster is no longer registered
> > there. The knob only tunes swap-in readahead and had no effect without
> > swap.
> >
> > Suggested-by: Baoquan He <bhe@redhat.com>
> > Suggested-by: Barry Song <baohua@kernel.org>
> > Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
>
> Btw, I suggested this:
>
> https://lore.kernel.org/all/adUTC-7iyOAUlhR7@cmpxchg.org/

Hi Johannes,

Sorry I missed your Suggested-by tag on patch 1/3. Exactly, I moved
page_cluster and the vm.page-cluster sysctl into mm/swap_state.c
as you suggested.

I'll add it in v7.

Thanks for the review :)
