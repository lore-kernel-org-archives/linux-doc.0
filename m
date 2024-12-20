Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAA32AE8D
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 15:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734708152; cv=none; b=DY21fzhad9VbWzAv6nNVyb9Y3GwoEybtxjtOVP+I18RO+6uHRDtARrvWG5TcEyq7tAFLQypVTOroz1A/3iGOKq3cukVC3XTmJTH2eD7LVby8D7leC4WV6WRiS3Wd3cN/qsxkm3gYEOR3ZNLbS9nY5JnrQpwAlSA+o0cTuAPr4Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734708152; c=relaxed/simple;
	bh=nGqIlV++eQ+cO0NYa2/8LyD76HgvVjRBkvnblBFUqCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Z7J4cZzxv0T8f424EEkYPidyIYcIXGfK6JOVzUZAnjvKXzExf/UXeRzSzuF4s1uZqVrNWqepQs8ekd3pz+1GMZ0OIbgioKcm2uWyhM6lx1QTeCl5wjUSNRchRZTVQW3tplX/H0wOcT2lMUVH1+wiCmYzwZDTQzW1G5v/rCeMfik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NfgVRiiK; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NfgVRiiK"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-467abce2ef9so290221cf.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 07:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734708150; x=1735312950; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yYQ5IMlzE4FUjVthfIAEmcqYzlgRwV98EC6OT0t+fs=;
        b=NfgVRiiKaJkhQjp7tQcv1yFPnYdsmtDlEPAkwE39zJkxHSR2rPcXZfxWXbCD9Lzfs8
         8Pp7wRHzGr6bWRfwb1wuhqIUKry0RNgPxaklG38RZhQEz6Ohabzma+GEnxp2ovlY0C1Z
         zXefji1NttuL1UZf/YSdCad3lAmPQrLFRLy5hFrkPBXhTdd9qFtj5wAL7fa639a5r5RI
         M8F7/AvCJqslHCU0tPRZSMMbKVlm+X14LK8BQWgTggAw5MSy66OCqT11atNRlDrCVkA8
         UdfXawCozZSy29GmtbXz5DCmXI4DmRtsRc8U6bDKTs13nmXdquviTmn3C+WDTGB/cHga
         ivWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734708150; x=1735312950;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yYQ5IMlzE4FUjVthfIAEmcqYzlgRwV98EC6OT0t+fs=;
        b=gaQi7SXnhLhOOEFDqlOG+w1be0wmB3yT4Ecfmt9WdS09Rb1iME1LtPvHP81HV9wdB3
         xYG7F7CkuNOHyE8gjSM+8I9eQ1LlU4hbH7Uam1mSxB/f/VnE0KsJ6JbzUYoYjhP3fLte
         2+NoxhH3IlxeVAS5DWuwwXh9seXuMZ/lEtRBC0zo43Hdn2hv0NGhV4bj83MBndk/Ilyj
         Xq8Gqwy0MxuDWv4bO8Y0bOjJ6XX4fwU0ndvAFByYboMwSJENgFa5jqGMKiqefBtNqzK3
         oDB3NQWReHxuwnAGcRK0nQWrmSGHmhqwYPVXwlI4Hf3H4yr6ldOP5QqH06RHV4DIiGxm
         fEgA==
X-Forwarded-Encrypted: i=1; AJvYcCUquLe/xit9ouxafTgf+dgqiPJQJ+PTmcv/92Nk/l0BMlP2RlZgqFiKiQB7EqzgP88UCyCSvIQXNiA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+TiuBCFs4mLis1RdaycdUJBOHoQeetAL4kJ5rvhc+m/2aiCk4
	JAxube22BpPPVLBN+8mpwO2RMKw46RfjmvHSHI+iiCr0BeIlyZj+ZAnXP0WXFoXoRl5V+CJnS5T
	sQq/TthpPg5ZF4lXYRZP1sMargCU89bCg5y0Y
X-Gm-Gg: ASbGncv/HDbrjf41DMQBWJdK7z8aRSD27pHvRgcQxLlPCuhBCvYUizSCN7kPAhtTnxX
	Z2cUEXvoaoFeCmiNZxToH5+hXQtAcl+Vghm+OWQ==
X-Google-Smtp-Source: AGHT+IFJtKo5TVNvYi7n6XmCnMcs0WZraKFr8gh4VP8l/6sPF0vIFqXPdSYPsO3Dx4n+pwrydFyeCae0NR2udaLRcBs=
X-Received: by 2002:a05:622a:120d:b0:466:9660:18a2 with SMTP id
 d75a77b69052e-46a4a8f1193mr3551431cf.16.1734708150159; Fri, 20 Dec 2024
 07:22:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
 <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
 <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
 <20241219091334.GC26551@noisy.programming.kicks-ass.net> <20241219112011.GA34942@noisy.programming.kicks-ass.net>
 <wfzu6jvbazlxdybsjc54aoivleif6memaxaacd56bcep24nkv3@s3e3aj253hd6>
 <20241219174235.GD26279@noisy.programming.kicks-ass.net> <rnanfpzs6fmojyeaowt65mug6xekorrkeefvn3b4zc7buunzhc@rrzcbhkrjdv4>
 <20241219184642.GF26279@noisy.programming.kicks-ass.net> <6nck2rfwcytqdinsavmewytgcca43mldlczmao3zztrpr5v2ci@4xn6nwp6tcih>
In-Reply-To: <6nck2rfwcytqdinsavmewytgcca43mldlczmao3zztrpr5v2ci@4xn6nwp6tcih>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 20 Dec 2024 07:22:18 -0800
Message-ID: <CAJuCfpHBKuwsZMmz_1Lt4ZGuPiiyHeqizrZu4e+mFM+Bf02CGw@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, willy@infradead.org, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 10:55=E2=80=AFAM Liam R. Howlett
<Liam.Howlett@oracle.com> wrote:
>
> * Peter Zijlstra <peterz@infradead.org> [241219 13:47]:
> > On Thu, Dec 19, 2024 at 01:18:23PM -0500, Liam R. Howlett wrote:
> >
> > > > For RCU lookups only the mas tree matters -- and its left present t=
here.
> > > >
> > > > If you really want to block RCU readers, I would suggest punching a=
 hole
> > > > in the mm_mt. All the traditional code won't notice anyway, this is=
 all
> > > > with mmap_lock held for writing.
> > >
> > > We don't want to block all rcu readers, we want to block the rcu read=
ers
> > > that would see the problem - that is, anyone trying to read a particu=
lar
> > > area.
> > >
> > > Right now we can page fault in unpopulated vmas while writing other v=
mas
> > > to the tree.  We are also moving more users to rcu reading to use the
> > > vmas they need without waiting on writes to finish.
> > >
> > > Maybe I don't understand your suggestion, but I would think punching =
a
> > > hole would lose this advantage?
> >
> > My suggestion was to remove the range stuck in mas_detach from mm_mt.
> > That is exactly the affected range, no?
>
> Yes.
>
> But then looping over the vmas will show a gap where there should not be
> a gap.
>
> If we stop rcu readers entirely we lose the advantage.
>
> This is exactly the issue that the locking dance was working around :)

Sorry for not participating in the discussion, folks. I'm down with a
terrible flu and my brain is not working well. I'll catch up once I
get better.

>
