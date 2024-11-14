Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56101F891B
	for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2024 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731580299; cv=none; b=CcsJmZ79IFweTo2OV/Xs8rNzFQ6x95CRb/vsOnDvybdG6nhuMN0SNv21vnCrgClok83dw9+HVSHK3sduHViN20W4u9+GZomO7rfmL0bTZ52JiYwTW/o6nGLpJwzhA8C10GBjs9GqgpfrVhLTdPPEtGraE3V4GNU3H+Is8yqOmqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731580299; c=relaxed/simple;
	bh=1HMteR7GeWi+aLLIBziHVSG/j/GJwhJ4tatT18md6O8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvc3j8lTbcmyDZc69eO6+YcdSdQTSxN+DSqnizhBgyJUj27svFvMclbgWG5yPXd0ueafgvZcklWa25LUYNPdA1/DOLPk0aYx5JYeFrgKGTZthytV7p2uWNYJJQ9YMRVPheGraUmGwgHEUAKXOBvduEA1f/AOAS4pxHwESIuSiFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zuHOBEY1; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zuHOBEY1"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso78101466b.1
        for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2024 02:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731580296; x=1732185096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=330+bk+cS3icGrLIMivP9QZx02A0SNk2s2BiDL/dZNI=;
        b=zuHOBEY1poMH707/Im3WFRZi5LAi3cYfFPomInUZ2BovLGctqetjtRiIUiB2wIJhrH
         TNz3txrLzioiaNpHcwv7QHaT9hECmopRyWIpZExg10QrPihapHAbWwq7Xdolywm/J3Ov
         t/qmuVD46hLVpp+8ZdQ9H1sfsdJmTOVBff9ujtOPBOvUarxI/cwU3HJ2c2X2II1jDjo/
         F0YkGT72WDnnTTtgYLqjjaPysCrZcEta6bF2DDTeqoEBGAUvinvPdn445uVT14A+ws5M
         2kn+mYLyW/lH2leFyK68APE+v8R3hjlrzqZmhtVCnNH/ZuMzKrhsUD6SKlxVNM4wyAhS
         iv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731580296; x=1732185096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=330+bk+cS3icGrLIMivP9QZx02A0SNk2s2BiDL/dZNI=;
        b=dxTaa70rdAOopjHqIPETXbsBjTlgMxes07M5f2PU1SaEuzlaMCr4pFMix7TCiCQ/tZ
         WM7bb2r7aUZbJQ0hFX4c6LJ7ARDDJKsIsTFGOW63iNS2vDjC9/McAa3VamE+gd3LqBb7
         J53qChAiplid6PurnSt7xXLB1UpUOcEx8AnPRTXi+c7HlaVj7XufQ4OnRGhlne4km5w5
         wbkcjQYEjhp0RGBBuFShzJTT+ipHMouHcES57YpyT86j+PfIkmq3HV3Cl/YovJ8VCaVU
         15otjNaT3yvwuv23ySppTogNEfbkkJHlXreQonDpjZeIfLcepe/eLiXwgBBdBrR5MCbU
         mnFw==
X-Forwarded-Encrypted: i=1; AJvYcCUuE3sRXQS7CKL/g+FKLJq3hquaAw9uNNSh5by8m8ec5z4HMSvIUtw4YJAGO/Z+rwOWfz6rpJ9WdzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOSATdcNZQAXZoeFIitrCC5NE1FNRXeC8ee31hDfCLEHirlZZL
	9QNeixahKWddIJK2XG6D4pn5l1tsXoA98JF9f/m+gwTu5g+ysLGzyfAJR6cWqNLRKXLJk4Cjnfh
	JVV9iVzOicnROl91kY3hFUUyaDrBz5nhLGNzj
X-Google-Smtp-Source: AGHT+IFqjZNothSKY3NQ7z6Ssb06hcvdumgEbAL12tHf57bGbqlxiboD7hH6ovHLn0T5dGBaodALGFZhMKIIJi3hdzo=
X-Received: by 2002:a17:907:3e1d:b0:a99:4aa7:4d6f with SMTP id
 a640c23a62f3a-a9eefebc409mr2436865566b.12.1731580295828; Thu, 14 Nov 2024
 02:31:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029172832.93963-1-tony.luck@intel.com> <20241029172832.93963-4-tony.luck@intel.com>
 <f4845fee-3f91-4e78-a186-a7bdc58f7873@intel.com> <ZzUvA2XE01U25A38@agluck-desk3>
In-Reply-To: <ZzUvA2XE01U25A38@agluck-desk3>
From: Peter Newman <peternewman@google.com>
Date: Thu, 14 Nov 2024 11:31:25 +0100
Message-ID: <CALPaoCi94amaO4ALGhLPn=zWEJ3STJWyYid4L+kMjXYf9wKqAQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] x86/resctrl: Refactor mbm_update()
To: Tony Luck <tony.luck@intel.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, x86@kernel.org, 
	James Morse <james.morse@arm.com>, Jamie Iles <quic_jiles@quicinc.com>, 
	Babu Moger <babu.moger@amd.com>, Randy Dunlap <rdunlap@infradead.org>, 
	"Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tony,

On Wed, Nov 13, 2024 at 11:58=E2=80=AFPM Tony Luck <tony.luck@intel.com> wr=
ote:
>
> On Wed, Nov 13, 2024 at 02:25:53PM -0800, Reinette Chatre wrote:
> > Hi Tony,
> >
> > On 10/29/24 10:28 AM, Tony Luck wrote:
> > > Computing memory bandwidth for all enabled events resulted in
> > > identical code blocks for total and local bandwidth in mbm_update().
> > >
> > > Refactor with a helper function to eliminate code duplication.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Tony Luck <tony.luck@intel.com>
> > > ---
> > >  arch/x86/kernel/cpu/resctrl/monitor.c | 69 ++++++++++---------------=
--
> > >  1 file changed, 24 insertions(+), 45 deletions(-)
> > >
> > > diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/=
cpu/resctrl/monitor.c
> > > index 3ef339e405c2..1b6cb3bbc008 100644
> > > --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> > > +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> > > @@ -829,62 +829,41 @@ static void update_mba_bw(struct rdtgroup *rgrp=
, struct rdt_mon_domain *dom_mbm)
> > >     resctrl_arch_update_one(r_mba, dom_mba, closid, CDP_NONE, new_msr=
_val);
> > >  }
> > >
> > > -static void mbm_update(struct rdt_resource *r, struct rdt_mon_domain=
 *d,
> > > -                  u32 closid, u32 rmid)
> > > +static void mbm_update_one_event(struct rdt_resource *r, struct rdt_=
mon_domain *d,
> > > +                            u32 closid, u32 rmid, enum resctrl_event=
_id evtid)
> > >  {
> > >     struct rmid_read rr =3D {0};
> > >
> > >     rr.r =3D r;
> > >     rr.d =3D d;
> > > +   rr.evtid =3D evtid;
> > > +   rr.arch_mon_ctx =3D resctrl_arch_mon_ctx_alloc(rr.r, rr.evtid);
> > > +   if (IS_ERR(rr.arch_mon_ctx)) {
> > > +           pr_warn_ratelimited("Failed to allocate monitor context: =
%ld",
> > > +                               PTR_ERR(rr.arch_mon_ctx));
> > > +           return;
> > > +   }
> > > +
> > > +   __mon_event_count(closid, rmid, &rr);
> > > +
> > > +   if (is_mba_sc(NULL))
> > > +           mbm_bw_count(closid, rmid, &rr);
> > > +
> >
> > As I am staring at this more there seems to be an existing issue here .=
.. note how
> > __mon_event_count()'s return value is not checked before mbm_bw_count()=
 is called.
> > This means that mbm_bw_count() may run with rr.val of 0 that results in=
 wraparound
> > inside it resulting in some unexpected bandwidth numbers. Since a count=
er read can fail
> > with a "Unavailable"/"Error" from hardware it is not deterministic how =
frequently this
> > issue can be encountered.
> >
> > Skipping mbm_bw_count() if rr.val is 0 is one option ... that would kee=
p the bandwidth
> > measurement static at whatever was the last successful read and thus no=
t cause dramatic
> > changes by the software controller ... setting bandwidth to 0 if rr.val=
 is 0 is another
> > option to reflect that bandwidth data is unavailable, but then the soft=
ware controller should
> > perhaps get signal to not make adjustments? I expect there are better o=
ptions? What do
> > you think?
>
> Skipping mbm_bw_count() is also undesirable. If some later
> __mon_event_count() does succeed the bandwidth will be computed
> based on the last and current values as if they were one second
> apart, when actually some longer interval elapsed.
>
> I don't think this is a big issue for current Intel CPU RDT
> implementations because I don't think they will return the
> bit 62 unavailable value in the IA32_QM_CTR MSR. I'll ask
> around to check.
>
> But it does mean that implementing the "summary bandwidth"
> file discussed in the other e-mail thread[1] may be more
> complex on systems that can return that a counter is
> unavailable. We'd have to keep track that two succesful
> counter reads occured, with a measure of the interval
> between them before reporting a value in the summary file.

At least for the purposes of reporting the mbps rate to userspace, my
users will record from the files one per second, so it would be fine
to just report Unavailable (or Unassigned when it's clear that the
error is because counter wasn't unassigned) whenever either the
current or previous reading was not successful. Then they can assume
the value or error reported always refers to the most
recently-completed one-second window.

-Peter
