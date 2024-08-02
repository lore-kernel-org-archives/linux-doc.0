Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428084501F
	for <linux-doc@vger.kernel.org>; Fri,  2 Aug 2024 19:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626020; cv=none; b=T+1/jKn9uQIK1oA82Z+ip16q9YJ58eM6YIAtRra2vUQAevZy0/H/LeHPHjiNH5b9wSggpaV2EwcDaE4/GWcnn+sjbthHz+kv0WtO0S07T421JRDiivaLcYKxgvn7mqKo/tnAmYlpTaYf9kN/cdHPFlvJMA8R2APsFL/OagzuD0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626020; c=relaxed/simple;
	bh=Jua3J/LayVcC+eTgoSkiSKa61qcgp60XVTJ0ZVoNlAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGGnVaber59htG9XdhiCTS8U3xQWnAHP+ag4wPe3QNV8UKX1Utxhb9/UPLt6v208/Bf5kZYQjwUsT/NK6vAf9Gpe3O1/6kNath3og4/drKK9HeVjYDFONaKnRLANAgaGUIccwKJLsWBV5UMW8JNp0Goa0KA04zWOkArZ4GhfzQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TnNj421O; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TnNj421O"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42807cb6afdso252975e9.1
        for <linux-doc@vger.kernel.org>; Fri, 02 Aug 2024 12:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722626016; x=1723230816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jua3J/LayVcC+eTgoSkiSKa61qcgp60XVTJ0ZVoNlAM=;
        b=TnNj421OBE+viljwMfnYrn+dS9mDFDshKE34X3ejpwM+8LDQUyBp3yDrWLS0edxehN
         TTxhv5BVLgwe/R/0DyZ5nD4+AgSevYEcZlvMB0FRF7qZfP2S1/VBlbT4xdVL2fWLryk7
         z94386ZePO3nP+RwAJehMiBvKy4+lIekng6aqa+nLxzEmjHrqG51UC8tz6BMhP/7/taf
         GGw7bsuPCq798ZBI5Fuz52Og0IEe0heKsIUhIm2M6NPtgsSmeA0M5YCT2HrLU6d+6SNn
         XKRtHcMOMAxuHB8J9d5X8Lh1zJFfxNYgJyUhE8iOw3GnIIFgVbKnrRKiajNj3d0miLU0
         pgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626016; x=1723230816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jua3J/LayVcC+eTgoSkiSKa61qcgp60XVTJ0ZVoNlAM=;
        b=EL0hwmOtTN6VChl3uKdHrHoZUismMW8k5oLIvb+q6xpZcj5jkmOk+un2VIQgNFqyLN
         VtAHBUOaG4wIIUaDeZECxaejIiTvmItqw4sxp2vf3tL9WNupgZw197DTXZbG+nLvkfTk
         5nALfspH1NtDprN1Rai7+wqZbBxyiklbYeQZOGLwoVtA/Y6piJj9SJ2R7TQfbxY8sdLD
         kjE+14E6Z0BU91ge/WfmjLkPBtEz4n0wNefRVa7KbrmLrzzC1BnunV654pHTPEohc0sr
         eyGjct1NlrVxqv+4s/b0ksazEMsY1AVu+as7dewTRZPVIZND6OzcVUfU9GYbIKqKLMWj
         D1yg==
X-Forwarded-Encrypted: i=1; AJvYcCUcjyDh5bwCdxSJ2bEVGsRtiEoOS8HIRIi57xXIy/zyXf8QBY22MYgRWzZSxJmp6oJkAQ0iCk0optxgWds/S4T8YquEVuM1dOp/
X-Gm-Message-State: AOJu0YyAsu7DnXcx7X40099smnYeI36iwMwnxWsHaK4a/Vzq1p5meCJB
	1DjzLEjNC/Fd87Qu5CLu1R4nXqQFiHiJPuBmcaHeMLKZSp7Y1+OOhUErZPpyXRwSd9K2AsjdHNt
	Hg4RKlWT6wScLRozogz8k66dBDm9w5f3Zca97
X-Google-Smtp-Source: AGHT+IHXCP4djMRdMYQl12cHAtf0Pg03G/+hHpBldAw68EnWkHz53MNEFLATBuNAIQQfmSo4ksTfZus3Hn/R/QILRYc=
X-Received: by 2002:a05:600c:8112:b0:428:31c:5a42 with SMTP id
 5b1f17b1804b1-428eeaa09famr217385e9.3.1722626016218; Fri, 02 Aug 2024
 12:13:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1720043311.git.babu.moger@amd.com> <e04b721a-b5cb-4089-a3ad-125a6247e5b8@intel.com>
 <1c50b589-a738-4ae6-8362-bd1ce0d0dc98@amd.com> <05b4e345-ad14-4ea9-a13f-2c9b3a6eb422@intel.com>
 <CALPaoCi_TBZnULHQpYns+H+30jODZvyQpUHJRDHNwjQzajrD=A@mail.gmail.com>
 <b3babdac-da08-4dfd-9544-47db31d574f5@intel.com> <05786b1c-cc4e-26ea-581d-3aad3b594f91@amd.com>
In-Reply-To: <05786b1c-cc4e-26ea-581d-3aad3b594f91@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Fri, 2 Aug 2024 12:13:24 -0700
Message-ID: <CALPaoChDv+irGEmccaQ6SpsuVS8PZ_cfzPgceq3hD3N2cqNjZA@mail.gmail.com>
Subject: Re: [PATCH v5 00/20] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: babu.moger@amd.com
Cc: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net, fenghua.yu@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	paulmck@kernel.org, rdunlap@infradead.org, tj@kernel.org, 
	peterz@infradead.org, yanjiewtw@gmail.com, kim.phillips@amd.com, 
	lukas.bulwahn@gmail.com, seanjc@google.com, jmattson@google.com, 
	leitao@debian.org, jpoimboe@kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, jithu.joseph@intel.com, kai.huang@intel.com, 
	kan.liang@linux.intel.com, daniel.sneddon@linux.intel.com, 
	pbonzini@redhat.com, sandipan.das@amd.com, ilpo.jarvinen@linux.intel.com, 
	maciej.wieczor-retman@intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, eranian@google.com, james.morse@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Fri, Aug 2, 2024 at 11:49=E2=80=AFAM Moger, Babu <bmoger@amd.com> wrote:
>
> Hi Peter/Reinette,
>
> On 8/2/2024 11:13 AM, Reinette Chatre wrote:
> > Hi Peter,
> >
> > On 8/1/24 3:45 PM, Peter Newman wrote:
> >> However, If we don't expect to see these semantics in any other
> >> implementation, these semantics could be implicit in the definition of
> >> a SW assignable counter.
> >
> > It is not clear to me how implementation differences between hardware
> > and software assignment can be hidden from user space. It is possible
> > to let user space enable individual events and then silently upgrade it
> > to all events. I see two options here, either "mbm_control" needs to
> > explicitly show this "silent upgrade" so that user space knows which
> > events are actually enabled, or "mbm_control" only shows flags/events
> > enabled
> > from user space perspective. In the former scenario, this needs more
> > user space support since a generic user space cannot be confident which
> > flags are set after writing to "mbm_control". In the latter scenario,
> > meaning of "num_mbm_cntrs" becomes unclear since user space is expected
> > to rely on it to know which events can be enabled and if some are
> > actually "silently enabled" when user space still thinks it needs to be
> > enabled the number of available counters becomes vague.
> >
> > It is not clear to me how to present hardware and software assignable
> > counters with a single consistent interface. Actually, what if the
> > "mbm_mode" is what distinguishes how counters are assigned instead of h=
ow
> > it is backed (hw vs sw)? What if, instead of "mbm_cntr_assignable" and
> > "mbm_cntr_sw_assignable" MBM modes the terms "mbm_cntr_event_assignable=
"
> > and "mbm_cntr_group_assignable" is used? Could that replace a
> > potential "mbm_assign_events" while also supporting user space in
> > interactions with "mbm_control"?
>
> If I understand correctly, current interface might work for both the sw
> and hw assignments.
>
> In case of SW assignment, you need to manage two counters at context
> switch time. One for total event and one for local event. Basically, you
> need to calculate delta for both events. You need to do rmid read for
> both events and then calculate the delta.
>
> If the user assigns only one event you do the calculations only for the
> event user is interested in. That will save cycles as well. In this case
> "mbm_control" will report as one one event is assigned.
>
> In many cases user will not interested in both the events. Also events
> are configurable so users can get what they want with just one event.
>
> Does that make sense?

I think you've confused soft-RMID for soft-ABMC. Or more likely I've
confused you by not using consistent terminology.

soft-RMIDs are simulated by reading the counters of HW RMIDs
permanently assigned to each CPU at context switch. We found the
context switch cost of this approach unacceptable.

soft-ABMC is permanently associating an RMID with the local and total
counter-pair that will be automatically associated with it when it is
first loaded into a PQR_ASSOC MSR in a domain, then using the
mbm_control interface to choose which group to associate with these
RMIDs. This does not require any context switching work. This
technique is specific to the behavior of AMD hardware.

-Peter
