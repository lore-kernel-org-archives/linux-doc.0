Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FC9383983
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 02:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119263; cv=pass; b=a7Z15WOihAQTq3dxxuX/EsKJnuCUYRGfdfa1Nq4zrcStwPW508jvwsfv6iDR7kEAB94r+bxNdw45WWEVN1oLuxcKGE+jpooHxRqiJ65IbrqCTnm0MF+mXUxHTShG/d9YVPYnHAp2KAW53wyglDbY4S87p0U++f+wd4zwmGojA3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119263; c=relaxed/simple;
	bh=us/11YAXNZAJTaNhyo9E62+zmvvW7qcD47cClAcfiSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wyca7d7wXOZk3l/LriOvfExV1tTvhyCkCsKVOZGq476tJmefbOcEwe8E3/KcDnzln0OLkNei8kJc81QwakxH8ceEqEfWlM78SSWyGJfWBlk4Q1YHNr8m5lCywRAeeZhlseNCwIoM4ygHQj1lFm4tE9HFV6jC41axttIN9bdxWjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOAASw0F; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOAASw0F"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67990a45e02so2447714d50.3
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 19:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792119261; cv=none;
        d=google.com; s=arc-20260327;
        b=bJiZDsAfsIeejlX+wt6MTDmW7ITs8zwQsfPdyaZAsZZD5PwwfENwFo8XTdje5HxnBg
         et0r5m0Y4ofnW7mTsc9l7fBqhYSz5kN30+h/T41n3ky54iepPEu26c1LNY4CmpCPZYRU
         5EGRIzi6wKozV6vF2viNEh5bHyuI11islJh8IX3EKBKbQVsBHbRIhNyGcGVqrBFROcJV
         IutQPyFCKW9tpR4LiY0rurLanKPdrZk6yOaqYNVwyD/9t4U9eYLavq6b9tAZjtW5ACgs
         k7KGPS9PzePDhGwW8+qJfR1QarTDTDAmuruATkRQlEq5g67xq2Nmq9fCOqcWCSD/Xnb+
         kp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JyIFEq0u7TVUkNhoCer0bct9PHOlpUfGx4eaHSe+U3s=;
        fh=MVurDiohkoH6syTgVupGFxZxvftvwOHMFEGojAZwAsE=;
        b=X8e5PQDl1dSSmwqUC1ql3/iFSUyiEyADqc24mcHB8GJhMCROBzAHi3jN71uigUH5RF
         zH4ntrGRSMbNs1VD3Kzrfy4/ArWPJM1LJrPw15c309SOFUIAd4a8LovjCa/DEbHAiUCc
         MDg2Odi0Xl2snsUTgQTWOU+AhFQnuL8eZAHAo+Mbsbvk2voLb+0XmZyeG+J0ODrk2VX6
         LY6XqEeA2mV1vUitpP6BLo++aU0eRoJP5d3QRF5n84m4W1y3yYTc+T2HM+yc3WL2myjF
         nzm//AhTLljGDU/Efy0+j4c/ffqQ5E1rLKq+wa9kQff/+xJYC6KFXSdZvc+tebN6kahn
         MwDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792119261; x=1792724061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JyIFEq0u7TVUkNhoCer0bct9PHOlpUfGx4eaHSe+U3s=;
        b=VOAASw0F/ltYp0O7Z/4NwzoZtg3+BBxiQywkf3+3ReUBuA5nD1Mw5tQDgtzgoc5GVP
         zVKb1RF/I9SP0eS5jGg8GJnYr3+59GosM/DPnuBgTt0DK4x2LYG6Y9ykqxFIwuEj6UBH
         4in/US3aY7xmS1Fbya/FZcnWfkbkrnt/f4PO57sWkV+tc0kQ3Ru/vQLQWcwFID5G98jc
         NSAxy+xiPqC2eq2ZhJLHNPx7xctj1VzFjU7lfn1hzK9KusNga8PQnvmfzpXMw718jfPr
         UfUZI/54FCExS8paKX0oWTSCJ6gX84LjxeHuSq9IAjeRw695Hixvh7R1x+DLFpV3d+Vx
         x4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792119261; x=1792724061;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyIFEq0u7TVUkNhoCer0bct9PHOlpUfGx4eaHSe+U3s=;
        b=IRjYCaLKNOxzt/ks7HtCJn8uQBh8ntF7qDctKBYJdy0X8tpGPermyYYT6N1MmQ0PrX
         aHLWURBBDSyEO+TdZXKfHgI8SiLVpHeVJ2p+wYJr6xYcBWEEHq94i+TTWpwgZNTiwFfL
         0mNeIL1bGq6n+vf1yYOWUDkW7yxD5ajMKCZPEt5HubqxIUCagCW7G9sklousYxILsMjc
         AJ5eYkkKI3o11yKi6i0zc8KNifypKmiaNMiwmxoefrENiQUt9JEA/jRIk3TULzRjk6p6
         bDV8vHt/UuOmSCwnPjIytLaYVICdB6yOmdmKLx+0bsTYgAku8K2Tq81zraf/Q+KQu+eL
         f5gA==
X-Forwarded-Encrypted: i=1; AKwUvByUyObGiw4SCmFP4ekb6YHDeR90CcR2IcIyLdrCdkQae7t/jtpSaJ0qh4ruF7m5G7A8T78rcOwjVwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoNqx6FQ2317lFsdNxo173PZI1pFwjoObLwY8AXlrnPrMXz1+c
	hB90YDQ1rVfBmMzQTt6ItS8t8h3Ev4BYxYcYfcgaSN1Gzv+1F4vAQXLI/kseMUvg82CQu3mOc1P
	20RhFEp1FIiNlJL0yfBa3qMoaSWrMHbk=
X-Gm-Gg: AYBFou3Pcyq6f0IrhEtFS9IlyFsPRtmV4RdtFQjc+nAweyjdilx1EbZW3Hg0/I7QhgJ
	pa0F2T7BGf2c8e7CHEnYQw9mVLR1/IB0daRqMiixQgqw6+hfpQyD7W0seJrIvyHRI1mPMjejhGE
	h0LQkhyAcLD8+XrYt6n/+9DFVggsbu8drIG2dU0WS4fq60PJuzjLjKX3LnqzfZNtKlNswBsFHzq
	e/I8NbRYgYJBHkdYvi5lN4kJ4wLPBl6MHvO7hdwP0qOniRrgbOEXFS5rVssyH4tX5OCwb44vvJo
	sS995OAGFMtkbxnOBsPRxzr9CKjnJXwC4QJYHyCx+sU2BvQE+OnmWGS6Kt++g63OngUSj3cQJYF
	6uIeBTHbjXQ==
X-Received: by 2002:a05:690e:4391:b0:675:7425:2524 with SMTP id
 956f58d0204a3-67936aa3dbamr5234450d50.81.1792119260762; Thu, 15 Oct 2026
 19:54:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908122446.56708-1-lizhe.67@bytedance.com>
 <as3gQ8jfa_6eBf15@chenyu-dev> <CALOAHbBssx9ZHGwebGZCvzT4d_soyjNfZRj4L6gnxHRXtc7eMA@mail.gmail.com>
 <807eb0e80c76c3ccb85024b360bd47ace201931b.camel@linux.intel.com>
In-Reply-To: <807eb0e80c76c3ccb85024b360bd47ace201931b.camel@linux.intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 16 Oct 2026 10:53:43 +0800
X-Gm-Features: AclHuK9NvOmDvMmMhzfhk4kvGNPZ2SAyeDlPkOeYdYrkbV0ocflHS9n1Sl7gAjU
Message-ID: <CALOAHbCt+iGGWMxzjrcRamdSqD48_v+V685-qi7_Qy7UL8bxxQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] sched/numa: Add per-process automatic NUMA balancing control
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Chen Yu <yu.c.chen@intel.com>, "David Hildenbrand (Red Hat)" <david@kernel.org>, ljs@kernel.org, 
	Li Zhe <lizhe.67@bytedance.com>, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	tim.c.chen@intel.com, mkoutny@suse.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 3:58=E2=80=AFAM Tim Chen <tim.c.chen@linux.intel.co=
m> wrote:
>
> On Tue, 2026-10-13 at 17:31 +0800, Yafang Shao wrote:
> > On Tue, Oct 13, 2026 at 3:52=E2=80=AFPM Chen Yu <yu.c.chen@intel.com> w=
rote:
> > >
> > > On Tue, Sep 08, 2026 at 08:24:42PM +0800, Li Zhe wrote:
> > > > Automatic NUMA balancing is controlled globally through the
> > > > kernel.numa_balancing sysctl and can be influenced indirectly throu=
gh
> > > > memory policy. That works well as a system default, but it is too c=
oarse
> > > > for workloads where a launcher wants most processes to use the defa=
ult
> > > > policy while a selected process opts out because it already manages=
 NUMA
> > > > placement or cannot afford the sampling overhead.
> > > >
> > > > A recent per-cgroup proposal tried to address this by adding a
> > > > cgroup-local enable knob plus a NUMA_BALANCING_CGROUP mode where
> > > > balancing was disabled by default and then enabled for selected cgr=
oups
> > > > [1]. The discussion also noted that automatic NUMA balancing alread=
y
> > > > operates at task/process granularity, that the knob is not a resour=
ce
> > > > control attribute, and that task/process controls such as sched_set=
attr()
> > > > or prctl() may be a better fit while cgroups and cpusets continue t=
o
> > > > describe workload grouping and placement domains.
> > > >
> > > > There is also prior art from 2023 prctl() proposals [2][3]. Those
> > > > versions used a per-mm mode with disabled/enabled/default states, a=
dded
> > > > NumaB_mode to /proc/<pid>/status, and changed the global static key
> > > > handling so a per-process enable could override the global sysctl.
> > > >
> > > > This series takes a more conservative variant to preserve existing
> > > > administrator and workload expectations. Keeping the global sysctl =
as a
> > > > hard off switch means an administrator can still disable all automa=
tic
> > > > NUMA balancing activity with one knob. Using a weak two-state
> > > > per-process opt-out/allow ABI avoids exposing a "default" state who=
se
> > > > meaning depends on global policy and is therefore easy to misinterp=
ret.
> > > > Storing the configured mode in signal_struct gives the control expl=
icit
> > > > thread-group semantics and avoids making unrelated non-thread CLONE=
_VM
> > > > users share the policy merely because they share an mm.
> > > >
> > > > The series implements a per-process interface: a thread group may u=
se
> > > > prctl() to set or get its configured automatic NUMA balancing mode.=
 A
> > > > process can opt out of new periodic NUMA scan scheduling and NUMA
> > > > scheduler accounting, or opt back in. Existing hinting faults and q=
ueued
> > > > work are allowed to drain naturally as the disabled state takes eff=
ect.
> > > > When kernel.numa_balancing is 0, a process-local enable request doe=
s not
> > > > override it.
> > > >
> > > > A separate task_struct scheduler snapshot is used by enqueue/dequeu=
e
> > > > accounting so the scheduler can consistently account the state that=
 was
> > > > in effect when a task entered the runqueue. This avoids changing
> > > > historical task accounting while still allowing a process mode chan=
ge to
> > > > take effect through the normal dequeue/update/enqueue path.
> > > >
> > > > The series also exposes the process NUMA balancing mode in
> > > > /proc/<pid>/status and documents the new prctl() ABI and its intera=
ction
> > > > with the global sysctl.
> > > >
> > >
> > > Can the global key be extended to tri-state, like the THP settings?
> >
> > IIUC, a BPF-based THP policy is yet to be developed as prctl() doesn't
> > fit some use cases, especially mTHP.
> >
> > > To keep it backward-compatible, echoing 0 and 1 remains the same effe=
ct.
> > > The user can also echo always, advise, or never to it.
> > > We have a similar proposal here for cache-aware scheduling[1]
> >
> > We are also experimenting with the LLC-aware scheduler on production
> > servers, and we want to enable it per cgroup rather than globally
> > there as well.  Given the lessons we have learned from THP, what
> > about implementing it as a BPF-based feature from the beginning, so
> > that the semantics can still change when new use cases show up?
>
> Some questions about per-cgroup based cache aware scheduling:
>
> 1) What should be done if you want to group specific processes in differe=
nt cgroups?
> It may not be desirable to put them together in the same cgroup for other=
 reasons
> like IO or memory resource policies.

Do you mean a multi-container pod? The policy can be applied at either
the pod level or the container level.

              Pod            <- policy applied at the pod level
          /              \
  containerA  containerB   <- or at the container level

This is essentially a cgroup hierarchy: the pod is the parent cgroup
and each container is a child cgroup, so policies (IO/memory) can be
enforced at either level.

>
> 2) What is the inheritance rule for cache grouping of tasks in a cgroup
> with child cgroups?
> There may be too many tasks in parent to try to fit them all in a LLC whe=
n
> there are only certain subset of tasks sharing data that should be groupe=
d
> together cache wise.

Generally, a cgroup contains only a single main process in most use
cases. If multiple tasks have to share a cgroup, they are either
identical tasks or tasks with different priorities =E2=80=94 in which case =
you
only need to focus on the high-priority ones. That's how it works in
practice.

>
> With prctl, we can be precise in grouping only tasks that we truly
> want to be together.  If we want to bunch tasks in a cgroup cache wise,
> it is easy to write a daemon to put tasks in a cgroup into the same
> cache group.

I'm not a big fan of the prctl() approach in practice. Deploying a
policy that way requires coordinating with other teams, and the policy
may well need to be adjusted later =E2=80=94 every adjustment would mean
asking another team to make changes, which is a painful round-trip.
With BPF, on the other hand, all the work stays within the kernel
team, and it's completely transparent to users.

--=20
Regards
Yafang
