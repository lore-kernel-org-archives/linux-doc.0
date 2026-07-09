Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBC13B2FE4
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 06:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783577717; cv=pass; b=j1bH1ZbfzYJ7V8qrTzsFJxNoJY0ySWTQ0DwbB5EdQravjkR7qCLjIlQOd+gFXwrEzQ/MoIQ7dBQx1FV7zsZUN8nn/Qo6ju8jJAoRXp/SJsrDgZjBL1SNhjPOzWlQGKYjgjVRjktbOcXcv73R2sPb6n+jtMdiioVFpGJ7dnfbt+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783577717; c=relaxed/simple;
	bh=JrbsYVzEGqTfjZyxrQZpuPhsJ4MZ4qmxAe6eVAvM7JU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRHjFKCiCPogSJMPPedB8Hd4EnFDyFvAdnCkJDYCjmzjy2IUygz87P6+yij7VqC5d2nzWVagKEXofRnpIX2QT0TELEYN94P0TpQekd3v2MpP8iXuqjtyE9bD8PESMY7j8p6Tnxc8571/sh9QbUQudI3IBWjeCNRp2QTq9/WXEdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NbfdKeed; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NbfdKeed"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b0077d7053so3586e87.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 23:15:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783577714; cv=none;
        d=google.com; s=arc-20260327;
        b=b39tZR6SrwkHE6qALrQ+2OGxtPHDXrkoV1ldBbqm7Q6Ny7w3AocHMuLmRRY/k+zlQz
         GSZi/JYPrIsMVQ5IC//wZgSwUqwIxo7JL+L/fIGWURyVwkZQjFoXWouOXCu2uV6tAfTO
         YPu/+ozDlqwCifh0jV68NduE9D4z3USvo/wBCvTkYfnUZs5MaYJw/CyBNi7LKAZ9qWDV
         Bg8TqAX1DU1h9eG0NbOgnvVEgCjQewLmeTUxrbJFNNVOLfTFOKevoMaXWoM68Cd1caPO
         GxBzjW9wYSljFU/IG6mYEBlmQBN8u4X4Lx+s7QKQ3dNUnbyVN0AeQSO2eqTrTZ8bW9Ck
         yR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nDhfXy+JFjOkSTFePIfLU/zhbaeABDCklVisKt6pztc=;
        fh=/Qzklj5Vn2srWJLvdlCayBA6ptM2XLjxjEsOiN2g7LY=;
        b=LFktjUBLv93EkDctKJ/lyt9qj/B7p/5y5Eu8sLPmWLgF4v0XaN6J+lU3THCbPPpKgH
         Azo7eBCmTBFZHrPNl8t0pDRxy5VYcJEF+hikgkqiGcRzKk422/YjNfscm0DKGr83FtxR
         UWoU+xYNneWEirrLN4SXKDfBhd5dJ2sYizs2B73ZUYpv+If/4KsubGyDkDlDs0nKwBmO
         Lq1GtK+HoYHP239fDFm5OyGW9AoWw2MH928drFVG4GawgTVG3WuUFv8sfYD6+/U1ySqj
         qGSTn7oQqZBYgOoUoL2Ccsn559u5LbkqiIyAmcUaG27QRDAV9tfELKduAE18Hik8Ub8R
         l9Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783577714; x=1784182514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nDhfXy+JFjOkSTFePIfLU/zhbaeABDCklVisKt6pztc=;
        b=NbfdKeedlVfuphQGQYH6kLAcEX5b202OPDgMjfj5jJZGqapl8IGXO1a8CJvhtiWr6a
         m1RE5KtAk//9YgLj4VQR1GPN7LOrW48+qOvE21jwyA0eGty+oo4dGeNZlOI+xKQ1omcP
         IZ3n1ZI+bFEahBVkjcJiAa7GiyYqiR/SU1Oz031O0eF+Xylhq9XTofjH9fHX2IC8fM3J
         EDu4rg7jW2kE60b1E/Y5f6tACWqvd2cCmP/QSGetA+8Id/G5x8zylbZeLAL9CWhlFaBj
         +t4ZRQtcPE3X23SrrpB3HIq8gNZt5MHcEcTnTwyTkWxwktLC141Kwqi5Cav3HXshce4m
         Gnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783577714; x=1784182514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDhfXy+JFjOkSTFePIfLU/zhbaeABDCklVisKt6pztc=;
        b=HfJetIg2iWwXV5/ef7g1cBaBsLXm8RLdeeWnZG1t5AEGI5uDqiaDDN8NcEJCZLPudp
         N8mN4bfBdD7olrjbjKtq5/NHwInQUgO2W+P1dgox/V35uQwLLskYnuVXx/Xogq5klcHd
         WrQJs+NShX+RfGoL4YcWA1w3gSeGsSTZzrD1CMo+/WSbgbvcPWZ9lHD2TjPIjyOeU9Y7
         +ly9Fweouk6oOTNkDprtAMI0t3XzJrrXWu2M/bO0DEHANbgX/zk3vfuLJHt/epbnsSyh
         ykiox/5dpWzsfr+aNWI0OSk+YhW5vQNid0nLwMNCdbicIxnhnXhrfAl9jM33E5EQ73/z
         0mYw==
X-Forwarded-Encrypted: i=1; AHgh+RqNQNehsI1c1U31B2deMZzlzSAewY9gHG2nJth/+XaNp3Id/Kr5mfQUKitdDSTT1mRXyORallILwfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YytA1M2syEoAehWp7boMy2yPuoEK4PMT61YYxOL2tv5p7itZZsM
	9Iw0eCW+M1ipWGjDCgIZq8tfDvgCWcwxKXtJtNkcQPBN5BD5R/+9RmR7qpx1lV+CNM35mIQyfGw
	+dVHVWmqk4R2kDbfNcQsvtSZu2aqq0EI6Hs6W3olL
X-Gm-Gg: AfdE7ckWj2lr84hoPJfYVU7pnWkjpBd59yUJeIPZ6s0clMW4HtVBaVmdFeHpRXlCJb8
	fMuOXgIxO/QxJWlNATj+SOqWrCxDhIGE91kqNSA/tdhgbQWOg8wmk4Yt0B8jc+WQgRuSmKOnY4c
	8hngfEbWwKWkc5SNp7M7tOVhVZCfQ2FqGNSG+cVkhBn8vF2a/5FNfa+njwM/cQoKPg9d3Mw2TjJ
	8LdYAPueRJOrzYNolVxuZuxblilMlXvCl6nHSRZ6BQHSpFOjDlnjE0uGFmi9tXm8TvTU3ELcvN+
	2q3t0eSEWt2/n5TupBLGld61Qy323JO9PHgfY3wP70N3/6HjNN/QScMQn+unlTt0v6vuBzcD
X-Received: by 2002:a05:6512:3d8f:b0:5ae:ba90:8a21 with SMTP id
 2adb3069b0e04-5b0163a0071mr87384e87.0.1783577714119; Wed, 08 Jul 2026
 23:15:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707064235.1386552-1-souravpanda@google.com>
 <9624988a-366e-4884-9408-3f3b88c27290@kernel.org> <20260707062428-mutt-send-email-mst@kernel.org>
 <b9a48d89-74f1-43d4-b7bb-be988b6855c9@kernel.org> <akzZr2jfJ0J8zox4@lucifer>
 <20260707095843-mutt-send-email-mst@kernel.org> <ak0xWgpJPSaNWPsl@lucifer>
 <20260707152755-mutt-send-email-mst@kernel.org> <f9bad4b3-93ee-4daf-84d5-97f6ca305240@kernel.org>
 <ak4JiBcvi29sYx0v@lucifer> <20260708050547-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260708050547-mutt-send-email-mst@kernel.org>
From: Sourav Panda <souravpanda@google.com>
Date: Wed, 8 Jul 2026 23:15:02 -0700
X-Gm-Features: AVVi8Ce9AmF7X4hV5ixsxIF5PZt3E2eW-xAowBuyJMbKi0GinxpYNGmtl7bX_VY
Message-ID: <CANruzcTQbfnsx6dMxbc8=2tQVF2gK1ROm3LOKiHc-sdT3xV2Ww@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] mm/hugetlb: Dynamic, NUMA-aware HugePage Cache &
 Free Page Reporting
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, muchun.song@linux.dev, 
	osalvador@suse.de, akpm@linux-foundation.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	mhklinux@outlook.com, fvdl@google.com, gthelen@google.com, 
	mike.kravetz@oracle.com, pasha.tatashin@soleen.com, rientjes@google.com, 
	riel@surriel.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 2:16=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Wed, Jul 08, 2026 at 09:26:18AM +0100, Lorenzo Stoakes wrote:
> > On Tue, Jul 07, 2026 at 09:46:14PM +0200, David Hildenbrand (Arm) wrote=
:
> > > On 7/7/26 21:32, Michael S. Tsirkin wrote:
> > > > On Tue, Jul 07, 2026 at 07:46:28PM +0100, Lorenzo Stoakes wrote:
> > > >> On Tue, Jul 07, 2026 at 10:01:55AM -0400, Michael S. Tsirkin wrote=
:
> > > >>>
> > > >>> Fair enough.
> > > >>>
> > > >>>
> > > >>> Lorenzo, do you know *how* you want it reworked? Could you write =
it up
> > > >>> at a high level?
> > > >>> Because if not, it's not really practical to make it the asking p=
rice.
> > > >>
> > > >> Michael, you're an experienced maintainer, I'm surprised I have to=
 tell you that
> > > >> the burden for that lands on the submitter.
> > > >
> > > > Oh sure, "fix bugs A,B,C before you add to this mess" is a classic =
way
> > > > to actually not end up with even more of a mess.  But I usually do =
try
> > > > to be explicit of what are specific issues I want submitter to addr=
ess.
> > > > I don't really feel figuring that out lands on the submitter.
> > >
> > > Sometimes it's certainly easier. With things like hugetlb there often=
 just isn't
> > > a feasible way to integrate it nicely into core-mm. It's just too spe=
cial.
> >
> > Yeah exactly :) once you reach a certain level of 'specialness' it is m=
ore like
> > pointing at a flaming trash pile and crying ;)
> >
> > >
> > > --
> > > Cheers,
> > >
> > > David
> >
> > Cheers, Lorenzo
>
> Well as long as I'm not the one being asked to put it out ... it is just
> hard for me to get motivated to do cleanups if there's no actual bug to
> fix, or a feature to develop somewhat proportional in size to the
> cleanup.  But for example, and without calling anything trash, after poki=
ng
> at memory-failure.c, *I* want to cry, because either there's multiple
> races, or I just don't understand the code.  Some of these we discussed
> here already.
>
> It seems to boil down to the fact that when people start getting lots of
> these errors they rush out and buy a new system, so hey. But maybe with
> RAM prices spiking it will become less practical. I'll put together an
> email with a list later, maybe.
>

Hi Lorenzo, David, Muchun, and Michael,

Thank you all for the candid feedback :)

Lorenzo, David, Muchun, your points are well taken. I agree that
adding hugetlb caching and shrinker logic to hugetlb goes against your
long-term goal of integrating with core-mm and reducing special
casing.

Michael, taking your advice, I will strictly focus on Free Page
Reporting for Hugepages as that is a regression in the page reporting
infrastructure.

I will send a single, isolated patch that wires up the standard
hugepage_freelists to page reporting.

Let me know if there are any objections to that!

With regards,
Sourav Panda

> --
> MST
>
