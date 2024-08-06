Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A6D18D640
	for <linux-doc@vger.kernel.org>; Tue,  6 Aug 2024 20:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722975405; cv=none; b=KEnXlvXvcGIhmo0EEXHObWRXgtdQirpsrGVmRygqMfyJw5dHcfeWGRdZ8r/sKv0f63dfjxRov+q7EDWqAlDqjela6Um0msNoQv06eLTfrQqhlIPWYDEz1EDInKze5GSdHt6LHGyUsiI90PrxJoEPQvdbXSs5kufGFWQl39ntk4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722975405; c=relaxed/simple;
	bh=wmNIyw9GfP97kFsvXGRb22gPsp3TKcMyPea6l0UwV1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TfkCCK09+NOR+EAHKiPG530Gy2209Xyp/vha+G/W1WvXwDDm0CbK9FFaeWizWO6rRc3SwmLAVvr+rz3bs0Px+9fmXJOdTMUyHHmVTSNNONzWJ7tcmeKPYuacQoKvHaIHxDhUWhfj8FIeI3ScaUC6nbl00hi70qTAWRKraNXKOu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com; spf=fail smtp.mailfrom=vimeo.com; dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b=gs72Azaw; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vimeo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b="gs72Azaw"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70d333d5890so877950b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Aug 2024 13:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vimeo.com; s=google; t=1722975402; x=1723580202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7ljGM0irjWendNnux5k7jsBLUadWXI+HcIMyBsdx1A=;
        b=gs72AzawManMBskwkstP4Jyz44cru3nxgOL7EmPDQUQskYWC/xptsYs8mplje18ZMs
         ekZLxM87dTcs24SRMAxoVE76UAgwkK2dHnjvAlOLz3ABKlO7qGePEWDOsl256JOpESDT
         Fit6qdxi0TQ5jx/Iv6Z730nTv+NU4ogkMUmmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722975402; x=1723580202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7ljGM0irjWendNnux5k7jsBLUadWXI+HcIMyBsdx1A=;
        b=U72z4+4VqA5P4tpWhJJ/Z+Ay20ZghlPeDn3Z9yKj3edk/OojQAMy8ORHNnczBl9ukV
         VtzhZdqqDMt/pfRqMZNMd2/t+Vww9On/HeBhJMGfFdYFSZWqrZEaOa9llRMgBKcrJS0t
         brnbqheAwZKb7YK7JQMrySi8lWuUe1zKHcRff6Z8WKbfRgeVYlEjXm9wcURAMsVbzcJY
         dO+7niNpCsz5YLQP/dBKgQxdPSybxQgsqxkK0hbFvuynlBcbXmVtfWU1mfb9rm77ZXBJ
         G6/mSdKyZva6ZmkUpJLwVrOBAT7/OOFpIiNzUaHinZnKC8Wf9pnvT+zcqVN8SCDkiZlm
         qLlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSKHNRY5vnE6kgZ/CnAEO/ZsoGS0ViMfDEBFXAOOqjoDokUA8OngK4iB1FUkA02ZPUTAwbOh31vUubtxWe7Of7tTL01vVVWHWN
X-Gm-Message-State: AOJu0YztWavyUAGPJR+yMCaCLQfAIQA7imjO7SDCKqgUWiGOs+jis4xk
	3Sa8lt4VjVH4grhSgTEz1GaK6dq8+RQUohi9z/n3RIc4ULnaOYC/6urXJEoS3fgBAeKctwy4WWW
	QzvGZ+lYzAE+ZYdDrsIYoozvP8jZgdadUDsu+KQ==
X-Google-Smtp-Source: AGHT+IHv0AN++1OdFYFThfaFBPC/QvFLeShPR/7012JBfWJkUQxlr8Fi2xoKQeWo0FlTjWcTIHRMaayWlN1DRcfdEII=
X-Received: by 2002:a05:6a20:438d:b0:1c4:c160:2859 with SMTP id
 adf61e73a8af0-1c6995d4947mr23275824637.31.1722975401973; Tue, 06 Aug 2024
 13:16:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730231304.761942-1-davidf@vimeo.com>
In-Reply-To: <20240730231304.761942-1-davidf@vimeo.com>
From: David Finkel <davidf@vimeo.com>
Date: Tue, 6 Aug 2024 16:16:30 -0400
Message-ID: <CAFUnj5Nq_UwZUy9+i-Mp+TDghQWUX7MHpmh8uDTH790HAH2ZNA@mail.gmail.com>
Subject: Re: [PATCH v7] mm, memcg: cg2 memory{.swap,}.peak write handlers
To: Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
Cc: core-services@vimeo.com, Jonathan Corbet <corbet@lwn.net>, 
	Michal Hocko <mhocko@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Zefan Li <lizefan.x@bytedance.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 7:13=E2=80=AFPM David Finkel <davidf@vimeo.com> wro=
te:
>
> This revision only updates the tests from the previous revision[1], and
> integrates an Acked-by[2] and a Reviewed-By[3] into the first commit
> message.
>
>
> Documentation/admin-guide/cgroup-v2.rst          |  22 ++-
> include/linux/cgroup-defs.h                      |   5 +
> include/linux/cgroup.h                           |   3 +
> include/linux/memcontrol.h                       |   5 +
> include/linux/page_counter.h                     |  11 +-
> kernel/cgroup/cgroup-internal.h                  |   2 +
> kernel/cgroup/cgroup.c                           |   7 +
> mm/memcontrol.c                                  | 116 +++++++++++++--
> mm/page_counter.c                                |  30 +++-
> tools/testing/selftests/cgroup/cgroup_util.c     |  22 +++
> tools/testing/selftests/cgroup/cgroup_util.h     |   2 +
> tools/testing/selftests/cgroup/test_memcontrol.c | 264 ++++++++++++++++++=
++++++++++++++-
> 12 files changed, 454 insertions(+), 35 deletions(-)
>
> [1]: https://lore.kernel.org/cgroups/20240729143743.34236-1-davidf@vimeo.=
com/T/
> [2]: https://lore.kernel.org/cgroups/20240729143743.34236-1-davidf@vimeo.=
com/T/#m807225dd0944b0bf78419639272bf6602fe053fc
> [3]: https://lore.kernel.org/cgroups/20240729143743.34236-1-davidf@vimeo.=
com/T/#meac510a72b4a282fe1e5edec3323c2204d46cf11
>
>
> Thank you all for the support and reviews so far!
>
> David Finkel
> Senior Principal Software Engineer
> Vimeo Inc.
>
>
>

Tejun or Andrew,

This change seems to have stalled a bit.
Are there any further changes necessary to get this patch merged into
a staging branch so it's ready for 6.12?

Thanks,
--=20
David Finkel
Senior Principal Software Engineer, Core Services
