Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6887C233935
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 01:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782436443; cv=pass; b=drft5E0vsDJUcIPMbDhgQe9Ckvw1awPzbMkc5cg4Xc/hd93Qpow66l6/sMfhqlwBToxeJBCB/PFDYowCNAPq2Lz8Z9hIRxOBeqMG+a6You2PwoVSpTstdG5Qq4hw8YO8wy0Au7Z1htQPj2rsXBbLeLDJpTYdl2ZgyQs79UXua1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782436443; c=relaxed/simple;
	bh=rtrg3DQaQYSKGWCB0QbtWivfJ+mli+yXS4Opc9OEzwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eH7Q0/zi7JdhCfqJTieIBibs63FovjvHOck1paFq8ly7kEFQEf5hxOMKo70wod8A4IfqzpIPhNP8N5lo2/cAk5b6y24UNqVAQdlUs99R34IfOixupboHnK7cKcvII4swwO5e6IdISnm+l5d+QEGwOJmct+gjzQhe9VRMqBB7cIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hziPLlsd; arc=pass smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hziPLlsd"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-13986d61b4fso664029c88.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 18:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782436441; cv=none;
        d=google.com; s=arc-20260327;
        b=VmNcPVNEYRCAAwRvEz+N/zBCFbLWwL/kuqwYY+wWNrhw5c+oGrioT++RzAlduC662u
         eGVNAn1dActXiYDugYvbYkMzD4ZGNqdNvbjaLSSPT2U7JKbwvO3wPVDxedl4tBmmrVlY
         Jrtyp+sVh0wI7ezSjQjrZiWCBcOezlr4H0vUUM4OE2KZNBzE+8rti5FW0bIQlEmXHB61
         hJKQ4qgqss/DhCvk/vwxUwQpOSx56Jvs963dGMx4XKW6RXwj9Yce7bld9XOqoFV/3fML
         DqaN+DZMfes+WPhVSex2YJP3vBbVAyzVAfK80NTaZNGHIMVVKeC2IfGqALhxljvB51wY
         Kijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0QrPux/jb9B/TQh4lL67jDfn0fMtva20UhkYnPdI7a0=;
        fh=sj3uyJPOvP583OKRIbC6v9V3AgH52e9eYiwSXA1XvWQ=;
        b=bR9wfPzyCNhQ5bPSU8xPsVCV0m16iKty0VQyrnZrfO7gSX5YmfaWZJcS1wra9TiWQu
         RJaK/QPf7lcnaMKeJ22GJ6A+HlJ6DROBn+8aulaWRvgV88lT1lMwaGq0Ex4X8XKHVa2E
         e5WNyF1IojlJK57AtbjcmMpFlWrSSWoaWit0GZm7YB6wj8VuIEllcRfsSuuDHmcxOvlC
         KRYFhoQ0YwgWkzBLUcAgvd1m47k20L/u+Lvb7Duk5Da3+Imp3GCXpthwFt1tWGqrQ05w
         QADyuUC0+ev+/TgZ+1No6pacZXbHD1PlP/MrpvHkikTqbUegJiUdmUcn57N6yRAeRmFf
         KlYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782436441; x=1783041241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QrPux/jb9B/TQh4lL67jDfn0fMtva20UhkYnPdI7a0=;
        b=hziPLlsdJxyjUZUJXSOEVj8SfV+5vIxENQGyDU8XoLu2gUfpX7Nze2Z9E91r67CggM
         01CBoKzLDxEZYImJ6dzWFpE/89zKY6/f/js+47vwSdnothIYHehvkY45Gy9S6Vrwf/af
         HcisSxtrVI1a+VwKY8WdsRMhhw7Ngr6oWsf31YEqYAd194roiFIDoZ128aq5KXnLFw57
         hkRT1eXV/LyfJG7RxmHpZ/cAlHtaFNDALu1mTgNrZIoI62PH9ur0mmxv+OLSHZkJIKKM
         h8c3Jp8c6q0PudgifVONyRwBGmqa6bF/yNG9ThPPPck8Yj18QXZMhgKC+vl9ODu6YppJ
         IZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782436441; x=1783041241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0QrPux/jb9B/TQh4lL67jDfn0fMtva20UhkYnPdI7a0=;
        b=Q/tUPD9ytxwpTZ+1KfX+xNUrP4LLAubakxG9NSQfv7LAFWvBZ1kpFRxJ5WZePykm9z
         XhG/4gxhsAUoLl07QOjsG35b9Vuf4uyhmy3hY0lkV5SNzpz7/moCWQJhH/dA71z6WjlV
         CsU5ie6BgCfqJv/q8U4BKj5VRadcxalwTuilZxwaCdrUSzSPZg8385+3yQtm5BSG0bep
         soz78H53vlzdT61Uw3BMPxW7Svdpi5z/TsYEl91MjcQeBC9sn9hF1v2AK8/wWbP9W7Sg
         CfWkaN3vRVGBNNxj12XpiFj2L1WKd3E8v+c2im/Zal7tMpSc6Ftnl2Qi5+mJg6nilUgn
         f1zg==
X-Forwarded-Encrypted: i=1; AFNElJ9mkoBLTZkLmoxImPFDdSHJFDQYObm4qqula9DqftC+ExgDpC65LaHwZ+3flXT/PllFEfEP85gZfDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcLpt61zF1MM1YZ9DK4vGpPZeYOEjuZQyNpdIZTuY9uz8zcpFz
	g3agg2iZ7+6I2n/wG9skjQU/e4o7WpHmb5GzMUF30QNlfzunVgqmo1mSiw70Xgn7KxuHNBqE9Vh
	eUYzvTH4D6JEWCJICrxvU98ddiI37oA==
X-Gm-Gg: AfdE7cnPRFuwT/1UVjfME5SDXTWguAa+CTnUC3EAl+Q3dXNsRO4s68k6EXJFKlUcksS
	W9z6ZtLlzVvlgB/tQJZORsuhkoNuoq35ZTWFmAW9rk/sRqd6Bv+hez2+2PRFaOTBR5LmdOCo116
	n30jsN2yKjUi7V3UFHIRPqMyBmAjxth7b8IfmRSJYtC/iyU7V8airveI6LnRkLKVUbL1dkm1vbV
	PUvyA8VUlgOxIlVh53AWilU2Xn4JEYHfcVVg3iGJnhFawvUHrpW4yGXJD6IvlHTOlRZiw==
X-Received: by 2002:a05:7022:6726:b0:137:f4ec:29ff with SMTP id
 a92af1059eb24-139dbaa660amr3557337c88.22.1782436441314; Thu, 25 Jun 2026
 18:14:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624001425.77489-1-sj@kernel.org> <a9018e68-866a-c251-9e0a-67e31f4baec2@huawei.com>
In-Reply-To: <a9018e68-866a-c251-9e0a-67e31f4baec2@huawei.com>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Thu, 25 Jun 2026 18:13:50 -0700
X-Gm-Features: AVVi8CfGl0EXx2soTnROovfPq8W8ILXy4EngHWeoIXW7I1TDJmmJsZwRtoDNA1Q
Message-ID: <CALa+Y15kQbXW8NnZtbjr79_K9ooBBy5JemgHXqASABsNPJRqgw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] mm/damon: hardware-sampled access reports
To: Zeng Heng <zengheng4@huawei.com>
Cc: SeongJae Park <sj@kernel.org>, akinobu.mita@gmail.com, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, bijan311@gmail.com, 
	ajayjoshi@micron.com, honggyu.kim@sk.com, yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Zeng and SJ,

  Glad the branch built cleanly for you.

  You can also refer to this branch, which carries the same series
with a few fixes from an internal sashiko run, folded in preparation
for v2.

  https://github.com/ravis-opensrc/linux/tree/damon/perf-event-integrated-r=
fc-v2

  Note this is still based on the v1 sysfs surface (raw type/config
knobs). The v2 I post to the list will reshape that userspace surface
to align with SJ's milestone plan, so the configuration interface will
change:

  https://lore.kernel.org/all/20260525225208.1179-1-sj@kernel.org/

  Happy to help if you hit anything while testing =E2=80=94 particularly
interested in which PMU you're sampling with (PEBS / IBS / something
on your platform).

  Best,
  Ravi

On Wed, Jun 24, 2026 at 4:23=E2=80=AFAM Zeng Heng <zengheng4@huawei.com> wr=
ote:
>
> Hi SeongJae,
>
> On 2026/6/24 8:14, SeongJae Park wrote:
> > Hello Zeng,
> >
> > On Tue, 23 Jun 2026 22:08:03 +0800 Zeng Heng <zengheng4@huawei.com> wro=
te:
> >
> >> Hi Ravi,
> >>
> >> On 2026/5/30 0:56, Ravi Jonnalagadda wrote:
> >>> This series introduces a vendor and PMU-agnostic substrate inside DAM=
ON
> >>> that consumes hardware-sampled access reports through the standard
> >>> perf-event interface.  Userspace selects the PMU through sysfs (raw
> >>> type/config knobs), driving either Intel PEBS L3-miss sampling or AMD
> >>> IBS Op sampling.
> >>>
> >>
> >> [...]
> >>
> >>>
> >>> Ravi Jonnalagadda (6):
> >>>     mm/damon: add struct damon_perf_event{,_attr} and per-ctx perf_ev=
ents
> >>>       list
> >>>     mm/damon/sysfs-sample: expose perf_events configuration via sysfs
> >>>     mm/damon/sysfs: install perf_events on apply
> >>>     mm/damon/core: per-CPU SPSC ring drain and damon_perf_event lifec=
ycle
> >>>     mm/damon/vaddr: implement perf-event access check
> >>>     mm/damon: add damos_node_eligible_mem_bp tracepoint
> >>>
> >>>    include/linux/damon.h        |  80 +++++
> >>>    include/trace/events/damon.h |  49 +++
> >>>    mm/damon/core.c              | 403 ++++++++++++++++++++----
> >>>    mm/damon/ops-common.h        |  39 +++
> >>>    mm/damon/sysfs-common.h      |   6 +
> >>>    mm/damon/sysfs-sample.c      | 579 +++++++++++++++++++++++++++++++=
++++
> >>>    mm/damon/sysfs.c             |   3 +
> >>>    mm/damon/vaddr.c             | 267 ++++++++++++++++
> >>>    8 files changed, 1370 insertions(+), 56 deletions(-)
> >>>
> >>>
> >>> base-commit: 4c8ad15abf15eb480d3ad85f902001e35465ef18
> >>
> >> I wasn't able to apply this patch series to the linux (and linux-next)
> >> mainline branch, and also had trouble identifying the source of the ba=
se
> >> commit.
> >>
> >> Would you mind sharing where this baseline is from?
> >
> > TLDR: I pushed [1] a tree having this series applied on top of the base=
line to
> > GitHub.  Please feel free to use it.
> >
> > I think the baseline was a commit on damon/next tree [2].  Because damo=
n/next
> > is continuously rebased, we cannot get the commit in a simple way.  For=
tunately
> > the commit is still available on my local tree.  So I applied this patc=
h series
> > on top of the commit and pushed [1] to a branch of DAMON kernel tree at=
 GitHub.
> >
> > Note that the branch is not guaranteed to exist there for long term.  B=
ut
> > hopefully this series will be merged into the mainline before that.
> >
> > [1] https://github.com/damonitor/linux/tree/ravi_hw_sampled_access_repo=
rts_rfc_v1
> > [2] https://origin.kernel.org/doc/html/latest/mm/damon/maintainer-profi=
le.html#scm-trees
> >
> >
> > Thanks,
> > SJ
> >
>
> Thanks a lot for providing the branch on GitHub. I've pulled it and
> confirmed it builds cleanly on my end.
>
> Appreciate the help!
>
>
> Best Regards,
> Zeng Heng
