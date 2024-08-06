Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154C914901A
	for <linux-doc@vger.kernel.org>; Tue,  6 Aug 2024 20:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722975692; cv=none; b=AbXwjdWLmS9SIqS9Z/xn2X4SbbNdnPM0QFv3MUX+cIgY5q7FS4aLiyqxc96MMNzcPf/VpNFD8ws/EHMXiwzfqA5bdJ2gZLeNSZwgPyQ5NRlb0fUOPsHRAfYdb/JDAjNVu/hPwb6n2M4YOTDwpNkK/KEWjMmCvQaAscFrpxCr0GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722975692; c=relaxed/simple;
	bh=qWDWtGhMbgLfsMxEb/+40gvdUiavX8iRTFTkmGd967w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RwMs56QE4Fjhgbkt4Vz/g53PA7rpt+KShF7gLDucATH5fuz5CgDpV6lIXIX/SPETuXryKsrYZWVNEu1sykVXMV0c7/5sbFToPWt/m7Jr1bJRWa3LSJ/qWq53j9l9VE9ZU46Rv9nEB0vnknyprhyMuG+6GKbtxeT2NAw7kaOnmEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com; spf=fail smtp.mailfrom=vimeo.com; dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b=BFVvcSSO; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vimeo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b="BFVvcSSO"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71080f4c006so809748b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 06 Aug 2024 13:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vimeo.com; s=google; t=1722975690; x=1723580490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QlBm+jC7wNlpQF23HO6ozZiIQGXZMXkusHU0sBp0qU=;
        b=BFVvcSSO5yQ1JL6gdovAFkM7WoNSfAC6vg4ZGR1cFbnVlqr8zI4oU8R0KDTGXxPcSP
         DoDDgxxfXFwx8sdwIfj9wumWbcX+PxLK1yzsnnubomoocS+4iCQlGmWaeEj7xsgFoCHB
         CMNlDnAg/uoi3gud+cEDOOLqM0QaxkpUGCUEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722975690; x=1723580490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3QlBm+jC7wNlpQF23HO6ozZiIQGXZMXkusHU0sBp0qU=;
        b=p03DnLuTavOPkBSzI8W8ADB1zMwBKXsYOSbszrm8mElASrKDgeFTfxaZW7/AS+NGBA
         0RxW7zsghH+PlZtLJ+hJbBc3vwcJxHTp983gZWqwEIOrWPD/uVau0/3sI0/x7qVR5hoY
         yyk6qV/zX/MaCCYWk2MB3FRMVNCIPkUh4EbEkzZNGv688oin7Zb+kFTj9OGrd4PZlNnW
         Q+opg6kA6Bn7sFJxxnTVnUGoW2d/T+EO7RvUxVQsXGQXit3lsmM55fCKiORq6x1/ME1C
         eslQFx4q8GldnH9rB2eu6z5gHB3J4RN4lgmmxv/+cESEh+aUkM0L8INpW4c4J51Gwzbq
         rDdA==
X-Forwarded-Encrypted: i=1; AJvYcCWhdFlPE4VhReiNJwyQRet/QbM5VsFztlA7xlHoB2g1nD7dpY/Mo6BLzudKd0LIFAJ6SPB4emAM4JaAUKWbFMJRaURNRUr3k4tP
X-Gm-Message-State: AOJu0YyJ0ffD4xTuoqdc67XQxp6oNLGHl7iqPzpeGhO1qkensVB9Jd4h
	FCO4ZIquhDE4n/3eWwLbdy4cr0gCsyIlVJaY/GeqR5Lt4WycrLnq2rKiSohhGTViPIA9vj9KCzY
	jDIGoT/eElxVOkjBArplT4gqJScKrRr6E11lcjw==
X-Google-Smtp-Source: AGHT+IG46TNFDF/EMCaO2JQlSmtorbFXbaM5w2I6TBnIgggaM5OBcZpVglvKgHo+KklHseqM7XOXzwn9DwbC+GtGi08=
X-Received: by 2002:a05:6a20:72ab:b0:1c2:8e77:a813 with SMTP id
 adf61e73a8af0-1c699551254mr18895308637.1.1722975690196; Tue, 06 Aug 2024
 13:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730231304.761942-1-davidf@vimeo.com> <CAFUnj5Nq_UwZUy9+i-Mp+TDghQWUX7MHpmh8uDTH790HAH2ZNA@mail.gmail.com>
 <ZrKFJyADBI_cLdX4@slm.duckdns.org>
In-Reply-To: <ZrKFJyADBI_cLdX4@slm.duckdns.org>
From: David Finkel <davidf@vimeo.com>
Date: Tue, 6 Aug 2024 16:21:18 -0400
Message-ID: <CAFUnj5MFqjTGZ0n3JBuD7a+LSEJ16KyrVyJiseTe_e04RuE=nQ@mail.gmail.com>
Subject: Re: [PATCH v7] mm, memcg: cg2 memory{.swap,}.peak write handlers
To: Tejun Heo <tj@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, core-services@vimeo.com, 
	Jonathan Corbet <corbet@lwn.net>, Michal Hocko <mhocko@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zefan Li <lizefan.x@bytedance.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 4:18=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> On Tue, Aug 06, 2024 at 04:16:30PM -0400, David Finkel wrote:
> > On Tue, Jul 30, 2024 at 7:13=E2=80=AFPM David Finkel <davidf@vimeo.com>=
 wrote:
> > >
> > > This revision only updates the tests from the previous revision[1], a=
nd
> > > integrates an Acked-by[2] and a Reviewed-By[3] into the first commit
> > > message.
> > >
> > >
> > > Documentation/admin-guide/cgroup-v2.rst          |  22 ++-
> > > include/linux/cgroup-defs.h                      |   5 +
> > > include/linux/cgroup.h                           |   3 +
> > > include/linux/memcontrol.h                       |   5 +
> > > include/linux/page_counter.h                     |  11 +-
> > > kernel/cgroup/cgroup-internal.h                  |   2 +
> > > kernel/cgroup/cgroup.c                           |   7 +
> > > mm/memcontrol.c                                  | 116 +++++++++++++-=
-
> > > mm/page_counter.c                                |  30 +++-
> > > tools/testing/selftests/cgroup/cgroup_util.c     |  22 +++
> > > tools/testing/selftests/cgroup/cgroup_util.h     |   2 +
> > > tools/testing/selftests/cgroup/test_memcontrol.c | 264 ++++++++++++++=
++++++++++++++++++-
> > > 12 files changed, 454 insertions(+), 35 deletions(-)
> ...
> > Tejun or Andrew,
> >
> > This change seems to have stalled a bit.
> > Are there any further changes necessary to get this patch merged into
> > a staging branch so it's ready for 6.12?
>
> Oh, it sits between cgroup core and memcg, so I guess it wasn't clear who
> should take it. Given that the crux of the change is in memcg, I think -m=
m
> would be a better fit. Andrew, can you please take these patches? FWIW,
>
>  Acked-by: Tejun Heo <tj@kernel.org>
>
> Thanks.

Thanks
>
> --
> tejun



--=20
David Finkel
Senior Principal Software Engineer, Core Services
