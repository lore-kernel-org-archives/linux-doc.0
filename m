Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7F322DFA5
	for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2025 11:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654464; cv=none; b=AQkEj4hNgzxxO+dvDG6UYts8sJ7twUQT61UYNTaeIbMeNVH8L92zexmN99b1JRqlO6Sr//2KKO9+MNaUstRgJiVaNKxbbZ0VxYTakcJo75AM2hfOMQr0/nZvv2QeBqH9dDnO0hT57DqAanfvnqjbE5lPzKJsMSu7qQk7NXAWoSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654464; c=relaxed/simple;
	bh=8oCbUgvLn/sQJx2uOd5+l25bEzDN0Z0d6xPvAJvQrkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4RHLjIvaoJBbspui4D0ud9CifxD2gOX6CdT+nXww7qMug4d/8sz2ncrCAyA4zfRCa46JnWIwor06ydWOyr+nLjW01Oh+MrAARdW4JU2XZAA8Z8pVLLHccxPNX2a05yt9urVigrJ+gyDnlWR99ORCz3O1FGQWixAeCcEK4D6xA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0ouT2t5N; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0ouT2t5N"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abb79af88afso149568566b.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2025 03:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740654460; x=1741259260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqFRLt1nek5g0Qrvf+5r2Tt/Pe06Y6U2imMhnKXQRHA=;
        b=0ouT2t5NQDurklMHitWP5A12oQvv7bFHW/zXThdFUUR6rcjLwSShqlx3RrpqdZEi/E
         QaC8WeqTTbMSJn5gcCUWIIVwvXg2XJbrhFkY5Okl0ycCkCmyD7LcScYOIdVRrJRFBguE
         IHsZRUuaYLgPi16awTc5RxoPEJaMS1R7v6ESf5i/X2e+7iPjk4JDcjooYCx77ckfUR9N
         xlYvmpK5wXfvWhKBUrGM9Lq4Ui3vrVJNbozeMHheHeENam5oMFgrebyY6EPVvQpDD1Fe
         /Fextwk6pAmluPsQHJJKtYlk9xVR+B/5WBYRvEiRVecDtRxe7qHYRNSrOrAW2EYgsK+S
         rUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740654460; x=1741259260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqFRLt1nek5g0Qrvf+5r2Tt/Pe06Y6U2imMhnKXQRHA=;
        b=QERy0xrHEPT14cjnRb6bFFD8zqnFuGuVgJ0bdppLYHgxDA/0EhY/7/H5clKZf8fbKn
         Z05mQKir1YeiwtSoKZDoWRofIZTPN1J6YvbxB3q/Aji2xBsBZVWe88t8ZMTTUU5LE0eC
         vmvTu7Y4eOsN1EObOQ9V1Wqq9LQUQoZlpiRcppNgnz3jQBpqLg6+0YZpYVbR2EReC2vK
         K35D041PxDg7Q1PuMXuwFhHwBiU9t7dPubpQjAWfJzilY/lu4PYlKgSAdnIfjhGzv08C
         mX8mMBjLk4W1j9gUHODo45hcS2xWm+dPnARUxKIZt5ISgofFpryjmdPfkqgOuxk+EYvu
         +fRw==
X-Forwarded-Encrypted: i=1; AJvYcCVoQDDwiDnwuoKy3fH5xF1GjfzhvcSINCWc82NzqtoHsazhk6TR6g8Ar1dAdMwl8eEsWiTGzCAFyRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2HxHYqyRcKQmJ14lTwDLnxyVgDj8oouYX1q/rMsRdSuAnTZ50
	nmsWAUW5hJq1y1xtOBIo+i49mAv6ZPXyV0mjTX5FAQxLm3LO4aISN7aT5tUmS0SqB+mhTa181T9
	7WKDMnc18axXLCQnf58Sm0OyTINbICPOAAXK/
X-Gm-Gg: ASbGnctHUmf1+OE8IALQ/TdyJBiHEU/H2ggUvdlMOHNBls3zmLQ0bkESBmSMVQ6/oTA
	1kobti0W7iS1VKroEcLMQheXgs+9ly7PROV2EAGfDintHFQNwT/BG2MLHexOuD2iaUqSzL+70W6
	TF7jMuXurIzwLTNcGsKrRggCF/I3m4qdV4URxDOg==
X-Google-Smtp-Source: AGHT+IFmfzmc+FWogzCdKra4+FHOi08QWF9y3RJ7gSx71UaTeiWsL6r9LP+ItQlLDdcnu5Wvg1fHRypeU3I+Ps2F4UM=
X-Received: by 2002:a17:907:2d14:b0:abb:feb0:547c with SMTP id
 a640c23a62f3a-abc09e38f64mr2655736866b.51.1740654460055; Thu, 27 Feb 2025
 03:07:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1737577229.git.babu.moger@amd.com> <2119b76ef8be21b1d8b2deedfab23e8e33ba724c.1737577229.git.babu.moger@amd.com>
 <Z7XfcV05ZZkHm6bc@e133380.arm.com> <CALPaoCiPkjbTf2He2tXsguxHDtGF+YfVUZScL8dseVc6rvAfvA@mail.gmail.com>
 <ac6860d4-92b4-424e-af4f-d6e3d5722232@intel.com> <CALPaoCh8siZKjL_3yvOYGL4cF_n_38KpUFgHVGbQ86nD+Q2_SA@mail.gmail.com>
 <Z7cw4JTp3Hfx/4li@e133380.arm.com> <2889da50-b654-403c-910e-13b9144596fd@intel.com>
 <Z7i0etOZcZ9jM/ZU@e133380.arm.com> <5f651b5a-3470-4ca8-80dd-4593acef6df4@amd.com>
 <84e31944-39a2-4e15-9772-56f82e70fbe6@intel.com> <c0afa85d-d196-4873-acb7-08b515410fcd@amd.com>
In-Reply-To: <c0afa85d-d196-4873-acb7-08b515410fcd@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Thu, 27 Feb 2025 12:07:29 +0100
X-Gm-Features: AQ5f1JpsyWCwKXcwGSLObESI7qszDDV-z8-t11sJudIzbcBe7jRtW6a3zrDDxHQ
Message-ID: <CALPaoCjjkBnBF5aYBupiESBrkkOjYeXumkyRrQ9uooyEzTcA-w@mail.gmail.com>
Subject: Re: [PATCH v11 17/23] x86/resctrl: Auto assign/unassign counters when
 mbm_cntr_assign is enabled
To: "Moger, Babu" <bmoger@amd.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, Dave Martin <Dave.Martin@arm.com>, 
	Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, tony.luck@intel.com, 
	x86@kernel.org, hpa@zytor.com, paulmck@kernel.org, akpm@linux-foundation.org, 
	thuth@redhat.com, rostedt@goodmis.org, xiongwei.song@windriver.com, 
	pawan.kumar.gupta@linux.intel.com, daniel.sneddon@linux.intel.com, 
	jpoimboe@kernel.org, perry.yuan@amd.com, sandipan.das@amd.com, 
	kai.huang@intel.com, xiaoyao.li@intel.com, seanjc@google.com, 
	xin3.li@intel.com, andrew.cooper3@citrix.com, ebiggers@google.com, 
	mario.limonciello@amd.com, james.morse@arm.com, tan.shaopeng@fujitsu.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maciej.wieczor-retman@intel.com, eranian@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Sat, Feb 22, 2025 at 12:43=E2=80=AFAM Moger, Babu <bmoger@amd.com> wrote=
:
>
> Hi Reinette,
>
> On 2/21/2025 4:48 PM, Reinette Chatre wrote:
> > Hi Babu,
> >
> > On 2/21/25 10:23 AM, Moger, Babu wrote:
> >> Hi All,
> >>
> >> On 2/21/2025 11:14 AM, Dave Martin wrote:
> >>> Hi,
> >>>
> >>> On Thu, Feb 20, 2025 at 09:08:17AM -0800, Reinette Chatre wrote:
> >>>> Hi Dave,
> >>>>
> >>>> On 2/20/25 5:40 AM, Dave Martin wrote:
> >>>>> On Thu, Feb 20, 2025 at 11:35:56AM +0100, Peter Newman wrote:
> >>>>>> Hi Reinette,
> >>>>>>
> >>>>>> On Wed, Feb 19, 2025 at 6:55=E2=80=AFPM Reinette Chatre
> >>>>>> <reinette.chatre@intel.com> wrote:
> >>>
> >>> [...]
> >>>
> >>>>>>> Could you please remind me how a user will set this flag?
> >>>>>>
> >>>>>> Quoting my original suggestion[1]:
> >>>>>>
> >>>>>>    "info/L3_MON/mbm_assign_on_mkdir?
> >>>>>>
> >>>>>>     boolean (parsed with kstrtobool()), defaulting to true?"
> >>>>>>
> >>>>>> After mount, any groups that got counters on creation would have t=
o be
> >>>>>> cleaned up, but at least that can be done with forward progress on=
ce
> >>>>>> the flag is cleared.
> >>>>>>
> >>>>>> I was able to live with that as long as there aren't users polling=
 for
> >>>>>> resctrl to be mounted and immediately creating groups. For us, a
> >>>>>> single container manager service manages resctrl.
> >>>
> >>> [...]
> >>>
> >>>>> +1
> >>>>>
> >>>>> That's basically my position -- the auto-assignment feels like a
> >>>>> _potential_ nuisance for ABMC-aware users, but it depends on what t=
hey
> >>>>> are trying to do.  Migration of non-ABMC-aware users will be easier=
 for
> >>>>> basic use cases if auto-assignment occurs by default (as in this
> >>>>> series).
> >>>>>
> >>>>> Having an explicit way to turn this off seems perfectly reasonable
> >>>>> (and could be added later on, if not provided in this series).
> >>>>>
> >>>>>
> >>>>> What about the question re whether turning mbm_cntr_assign mode on
> >>>>> should trigger auto-assignment?
> >>>>>
> >>>>> Currently turning this mode off and then on again has the effect of
> >>>>> removing all automatic assignments for extant groups.  This feels
> >>>>> surprising and/or unintentional (?)
> >>>>
> >>>> Connecting to what you start off by saying I also see auto-assignmen=
t
> >>>> as the way to provide a smooth transition for "non-ABMC-aware" users=
.
> >>>
> >>> I agree, and having this on by default also helps non-ABMC-aware user=
s.
> >>>
> >>>> To me a user that turns this mode off and then on again can be
> >>>> considered as a user that is "ABMC-aware" and turning it "off and th=
en
> >>>> on again" seems like an intuitive way to get to a "clean slate"
> >>>> wrt counter assignments. This may also be a convenient way for
> >>>> an "ABMC-aware" user space to unassign all counters and thus also
> >>>> helpful if resctrl supports the flag that Peter proposed. The flag
> >>>> seems to already keep something like this in its context with
> >>>> a name of "mbm_assign_on_mkdir" that could be interpreted as
> >>>> "only auto assign on mkdir"?
> >>>
> >>> Yes, that's reasonable.  It could be a good idea to document this
> >>> behaviour of switching the mbm_cntr_assign mode, if we think it is
> >>> useful and people are likely to rely on it.
> >>>
> >>> Since mkdir is an implementation detail of the resctrl interface, I'd
> >>> be tempted to go for a more generic name, say,
> >>> "mbm_assign_new_mon_groups".  But that's just bikeshedding.
> >>> The proposed behaviour seems fine.
> >>>
> >>> Either way, if this is not included in this series, it could be added
> >>> later without breaking anything.
> >>
> >> How about more generic "mbm_cntr_assign_auto" ?
> >
> > I would like to be careful to not make it _too_ generic. Dave already p=
ointed
> > out that users may be surprised that counters are not auto-assigned whe=
n switching
> > between the different modes so using the the name to help highlight whe=
n this
> > auto-assignment can be expected to happen seems very useful.
>
> In that case "mbm_assign_on_mkdir" seems on point and precise.
> Thanks

It also looks like counters are not assigned when a domain is
hotplugged, so explicitly stating that it's on mkdir gets us off the
hook for that.

-Peter
