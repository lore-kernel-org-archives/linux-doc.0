Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF86439B943
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 08:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138738; cv=pass; b=RiZ66v423PCw6cYkuexT411SWx2q4b1kPwwTO1s9sdfRa+q4ci0EC36nJOnAzMz3bljDf1x6ZH+ahgjm7RmPZ7/fpxgiR071MufgoHKSIUAl+3NB+8ABvTlb+hwPz8k0AIDbxnq1WfNGi/jup1xGv+usyfICB0ifjyuPy7GJsRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138738; c=relaxed/simple;
	bh=TJpRkoynlry2geAXK8OkwmCvIsCu/qH7mlFTnmgK4Yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfZPx+PofNr0thmbWw/UXkc+Nt9JexQAJ8MEZkjVWQ8ARQ+8wNAKBy6yFztwy0+iZ5CxB9Qyil4Z44sgGpnhWbeBr59iKXRuGeUFSSj8pe5PiZwjh8cPTpBFGkBAHhsnJWjGL2aaxpLNHlPt3tnERxIfN6Y282MotZ8nN1g5iLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDctdG3P; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDctdG3P"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679a420b96eso766157d50.0
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 01:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792138736; cv=none;
        d=google.com; s=arc-20260327;
        b=O5WU8bLj8RLCTaXLLf7EERyidTH1MMHKcWfEf33gWGCj4I0eZkC7ykW/8ru6wr/Xo3
         4Cx2mbwfpIm0BKpAeQy5gjkagUqoVyR6rR6fXjhRjnoHVMze741AXLHUnYYsGdM7njvy
         u3pmG26VY3f5/WObpy0rSKxVgpEDZu5ZY6SpTQsqPfUcLKYMZ7ISbmIJKI08XtiiQ7Wn
         lLN43GPDE7ffb1TsC/wMjhUTEB87avRFJi5sBuna/SyGvAKnMFM8ksKSQgoXEbvVDCux
         lIRC3kURTNEr0I16Ejyu9pw2e23bRq4S3SXrhw+WxIh9/c0GOJgLb4MAAon7LLLcDTc+
         BOSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7jP1ajt49g9ePjtG83cMVBJePTr3Nno+FbpJNYv5nwM=;
        fh=x0TG9FgYYRE+pEcvq1oSBl0us3FdBCfCiRGWT3bd2vU=;
        b=k4bQufulAjuVsQO06qQu1TqW8531PAUCXy72kY3UJMFgmSRE8OtHgeDOgcudF1c+8n
         ABTE7AErtOvslt9sL+44cb+HF43WhwNrIcBOSaxbANACtnj9r2ebJKonUeUQIHlNGKqc
         m9Fcc1MSbwa6bcChzmhijUjOvC8AlCYRpwzyTfW90BrT5R6dBS9Imfj69BvAaDPKBwAk
         M4i1dgrlruqIqrCIf1Dz+D1Yj3VbUMutuDdeGehfmdBqNz6vmr4GosNn/1Z9teSstc1F
         hR3QcSbMU80xq/AuJk/+FpUVf9T9W3Tx0/qzAaXaIzwfGDzSsrQshD7DhAmgcbK3NZUO
         /GNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792138736; x=1792743536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7jP1ajt49g9ePjtG83cMVBJePTr3Nno+FbpJNYv5nwM=;
        b=TDctdG3P3hqBv7Kmp9O69TG/m8pZWfGK3WkV8CEODNgKQ4ETVbdNSk6ewwgHGYwaRe
         O8U2S4+OqkYRsjloampfShtwy4XKMrVtbQw3Bk1nlCT/uB8UyKFl9/Ozm+3UZm7F68ZS
         lcaH0omgr4sMqtAXnmzZbF40fWYU2J6/JGISbJTo1MlrLItg/f9eVjGcmGc/TbM1xPmG
         nVU23PzrABXRfa+WHOQJjPZDqcjmVNRHD9zxDs2V451VykC1BiHMn/woKRYcsSoyryIV
         slCadhfuKr0QSoyFzna/MrQ0eHMR/ZgjJWOWAq/l3I47zBkVdb9NFmiku2rGoa39pO0/
         iwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138736; x=1792743536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jP1ajt49g9ePjtG83cMVBJePTr3Nno+FbpJNYv5nwM=;
        b=me9jvg2xF13AZms8jKzP7PHYLjHXypeZVqAN1DJ9k3gXbI8LNWfiugvyrKJQE8kDlo
         5+lW5MgKbCOgVVlhouQ00YnpG+0B2w/KwvUuEoSxthC4wo9WnNTb+XUcmwg7L0eDpEJb
         CuldPXD+9YSOAkZTwJn3ALkf8IJXy5mp56Z7DWz3RqYHw94oneW635mPkNFp55gnxTHO
         ylF+ThPhkSdAh1fMLKZp4kEb1L4p376nayX5L6aB5Tc1VkPo0UCGQlx1pzN6qfsr+F0h
         IgLZTjLcdziiu2R0jjJ6tO5Rfc5ymAsrhWgGEwEibGuHWuvrCKgLKkPob6NG3KaIjvQu
         zm7Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/ndAUtMeJ1jC0CXdI8qRZ+mxO/3v0OEPSgMLXvrrydYEzAOeRRg273uhg+mEngzDiOJzLiRTJdpc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZfc/eiBcQy8j765IYz1cTkBmPdGnLAcSUXROeT3JUl/QSUWdw
	A8YzktgeR5yM8l2HN69iMVgfFH6Yf0YUAR3yFVhH7IMfsWZXqmpTDCAclxsLTBjs0FO/qWoAFTS
	EkxSvipXWPlTFhnkMsYktQwalIyw1sXA=
X-Gm-Gg: AYBFou35YEObuhOyITH4ipMeY6C1S/SJcLiEGUOlMRM7/jy8m1hPQYDIiHeSPNI3kQD
	zl6LOGJPxGfJix0Ug4epnaPH1Q2Ezku7yH1cXF2xs4yF2v6tWDY8y4AXHUQe0uEfKRTJo9EdWNy
	OZFBfyLAVpccUEqrwjY2xiUKZwNeQody2uo1WFX6kAs8812wZZVaG2lkz0CpJ5qSF2m5MZZS+ov
	NHmKALawjGQ5iNtZ/dczVAoP4oONy6fledvcXqwEnE3tiUFWuIJPhGyw92NWnMO1ppoPfe9kTn5
	BZfPAYXkGpCWirgBjTdWlyS96CWxTUV9/zDYVUEsAhCvQVBwA7IcrzSEqTRgHzk60npIS4IWFCc
	La3RM5iqoeivsFnO77+ql
X-Received: by 2002:a53:ac8d:0:b0:679:97d1:439e with SMTP id
 956f58d0204a3-679b0e651ddmr785846d50.2.1792138735738; Fri, 16 Oct 2026
 01:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908122446.56708-1-lizhe.67@bytedance.com>
 <as3gQ8jfa_6eBf15@chenyu-dev> <CALOAHbBssx9ZHGwebGZCvzT4d_soyjNfZRj4L6gnxHRXtc7eMA@mail.gmail.com>
 <807eb0e80c76c3ccb85024b360bd47ace201931b.camel@linux.intel.com>
 <CALOAHbCt+iGGWMxzjrcRamdSqD48_v+V685-qi7_Qy7UL8bxxQ@mail.gmail.com>
 <atG4VXk4t-m8VubY@chenyu-dev> <CALOAHbDY6zLcEc4kGhC9GSFsOsREadkWN7Q4CmZuR_m_BMHAyg@mail.gmail.com>
 <bcabbe25-5b2c-464a-a22d-5375a342f938@intel.com>
In-Reply-To: <bcabbe25-5b2c-464a-a22d-5375a342f938@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 16 Oct 2026 16:18:18 +0800
X-Gm-Features: AclHuK9l0UDwRtdZnr0wuccDYOekKzVCW2ycclDkqHbzyqX2JXnysUW2dhrKAo8
Message-ID: <CALOAHbALpHebACLUmvet_tFH_w-iK3TWpY52OhYTUVoLzoGKkg@mail.gmail.com>
Subject: Re: [PATCH 0/4] sched/numa: Add per-process automatic NUMA balancing control
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, ljs@kernel.org, Li Zhe <lizhe.67@bytedance.com>, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	tim.c.chen@intel.com, mkoutny@suse.com, tj@kernel.org, chen.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:01=E2=80=AFPM Chen, Yu C <yu.c.chen@intel.com> wr=
ote:
>
> On 10/16/2026 3:38 PM, Yafang Shao wrote:
> > On Fri, Oct 16, 2026 at 1:51=E2=80=AFPM Chen Yu <yu.c.chen@intel.com> w=
rote:
> >> A more complex scenario is when cgroup A and cgroup B become threaded =
domains:
> >>
> >>                           root
> >>                          /    \
> >>                         X      Y
> >>                         |      |
> >>                         A      B          A, B: threaded domains (thre=
ad roots)
> >>                        / \    / \         separate memory.max / io.max
> >>                      A1   A2 B1  B2       threaded cgroups
> >>                      ^        ^
> >>                      |        |
> >>                      +--------+
> >>                    want to share one cache group
> >>
> >> In the above case, we might need to change the deployed cgroup hierarc=
hy.
> >
> > I think we can enable LLC-aware scheduling for both A1 and A2 =E2=80=94=
 does
> > that sound right?
> >
>
> Here A1 wants to share data with B1, but A2 does not want to share data
> with B2 nor B1 nor A1. Enabling cache-aware for A1 and A2 might not help
> in this case.

I'm not sure whether this is a real use case or merely a theoretical
one. I'd suggest we not focus too much on purely theoretical scenarios
unless someone can demonstrate a practical need.

>
> >>
> >> Suppose threads in A1 and threads in A2 belong to the same process Pa,
> >> this reminds me of the cgroup bpf NUMA balancing case: after enabling
> >> NUMA balancing for A1 but not setting it for A2, what would be the fin=
al
> >> NUMA balancing decision for process Pa, is it enabled or disabled?
> >> The NUMA balancing scan/invalid seems to be per process, so if we chan=
ge
> >> the setting of its threads, the whole process will be impacted. Or may=
be
> >> we should not enable NUMA balancing for threaded cgroups? Anyway I hav=
en't
> >> digged into your cgroup bpf patch set yet, let me try to look at it.
> >
> > cgroup NUMAB works the same way: the setting is per cgroup and opt-in.
> > For Pa in your example, since its threads spread across A1 and A2, you
> > would enable it on both =E2=80=94 enabling it on only one of them is no=
t
> > meaningful.
> >
>
> I see. I haven't yet digged into your code, is there a per cgroup flag
> cgroup.numab.enabled?

Right. I will introduce a cgroup::numab_mode field, but without a
cgroupfs interface file; it will be written through a BPF program.

> Would there be a logic in the kernel, when
> A1.numab.enabled
> is written to true, the kernel detects all the other cgroups {X} that
> contains threads
> share the same mm_struct as A1's threads/tasks, and then update {X}'s
> numab.enabled
> to the same value as A1, to keep consistency?

We have no plan to support threaded cgroups for now. If a real need
arises, the BPF program can be extended to handle it, which would just
require more kfuncs.

> In summary, if threads are
> spread
> cross different cgroups, when you set the enable flag for 1 cgroup, will =
the
> kernel iterates all the other cgroups to update their flags as well? Or
> leverage userspace to do that?

I believe this should be implemented in userspace, not automatically
in the kernel. Use cases are always complex, and flexibility is
important here.

--=20
Regards
Yafang
