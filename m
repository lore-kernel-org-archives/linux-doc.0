Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b="c9sCvN1V"
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E8719F
	for <linux-doc@vger.kernel.org>; Tue,  5 Dec 2023 08:00:59 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6ce3efb78e2so2925895b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 05 Dec 2023 08:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vimeo.com; s=google; t=1701792059; x=1702396859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlx3FgdhGHDUnh3L6/3hGq4qNfTS6+do/JBa+IYdpms=;
        b=c9sCvN1VBFYYxeKPaoFf5jzEUVwrhxwQYsy53sfJvM8hX5uOV9sJnra9OS479u/ysk
         N300Dvzzh7prqRsXjqLNisV82OBOqm33SGkRPMs4BZx8krF7z/mnTam5fxwKCh+8l/Nk
         qs6xQAgXUrHfqbA/FQZLTRY6sSzt541OrKAuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701792059; x=1702396859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlx3FgdhGHDUnh3L6/3hGq4qNfTS6+do/JBa+IYdpms=;
        b=YREKOCkbswUi50krFof0NNzYu/r1/f2HYaTKdYcCZWWZobqw9sYDQXTBTfNEIMASDf
         WkJykQ3wt0ggIiPwV28dxdYFAVIPTyxVMxDVx+N0BzGEwO1S6bp3eSewQNMH1GMGPrun
         Ehh1wBt8ehPxwyNRq2ch48J5bLNaVHUHBvxmUisGbNhMKKHhs0WG2rBUhj6AZqihZULc
         wiYRsrn0OTLSo+Gfn0mNkYvVixhqDsxzWfxtV0FVGnnDnsGGJlt4oWB/V5mkQ8M/gzTQ
         b883S4Fcc2JRosAVEeOnF6n6zVuzjIt3BhVKjt44eWjc1jxVbslKjzGA9Tm0sVyZWiYU
         NumQ==
X-Gm-Message-State: AOJu0Yx2tw5U5+3TrCDAC8QpY46DxzSF3yK99CaLFs7Uye1kImrV6r1L
	1iacg1fDk14Fw7nsbtjkdLo7eKTM3pCbi+lg80+7pw==
X-Google-Smtp-Source: AGHT+IFecjzlwZCWC9hGQmND+h9du15cUgm27Fh3OgcOXx0irs/362chWEHXRwdyodfBRyRJkY6F7AS9A/nDP477DRs=
X-Received: by 2002:a05:6a00:2d89:b0:6cd:e8c3:f733 with SMTP id
 fb9-20020a056a002d8900b006cde8c3f733mr1974241pfb.3.1701792058636; Tue, 05 Dec
 2023 08:00:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204194156.2411672-1-davidf@vimeo.com> <ZW7oXalrpQWdWZNJ@tiehlicka>
In-Reply-To: <ZW7oXalrpQWdWZNJ@tiehlicka>
From: David Finkel <davidf@vimeo.com>
Date: Tue, 5 Dec 2023 11:00:47 -0500
Message-ID: <CAFUnj5PqZ5zybYJ4uCiv-8cfdyg3d9NmzMjy=cYB+DkRNEiJug@mail.gmail.com>
Subject: Re: [PATCH] mm, memcg: cg2 memory{.swap,}.peak write handlers
To: Michal Hocko <mhocko@suse.com>
Cc: Muchun Song <muchun.song@linux.dev>, core-services@vimeo.com, 
	Jonathan Corbet <corbet@lwn.net>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 4:07=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrote=
:

> > This behavior is particularly useful for work scheduling systems that
> > need to track memory usage of worker processes/cgroups per-work-item.
> > Since memory can't be squeezed like CPU can (the OOM-killer has
> > opinions), these systems need to track the peak memory usage to compute
> > system/container fullness when binpacking workitems.
>
> I do not understand the OOM-killer reference here but I do understand
> that your worker reuses a cgroup and you want a peak memory consumption
> of a single run to better profile/configure the memcg configuration for
> the specific worker type. Correct?

To a certain extent, yes.
At the moment, we're only using the inner memcg cgroups for
accounting/profiling, and using a
larger (k8s container) cgroup for enforcement.

The OOM-killer is involved because we're not configuring any memory limits =
on
these individual "worker" cgroups, so we need to provision for
multiple workloads using
their peak memory at the same time to minimize OOM-killing.

In case you're curious, this is the job/queue-work scheduling system
we wrote in-house
called Quickset that's mentioned in this blog post about our new
transcoder system:
https://medium.com/vimeo-engineering-blog/riding-the-dragon-e328a3dfd39d

>
> > Signed-off-by: David Finkel <davidf@vimeo.com>
>
> Makes sense to me
> Acked-by: Michal Hocko <mhocko@suse.com>
>
> Thanks!

Thank you!

--=20
David Finkel
Senior Principal Software Engineer, Core Services
