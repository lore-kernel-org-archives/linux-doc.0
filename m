Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1C714B964
	for <linux-doc@vger.kernel.org>; Thu,  1 Aug 2024 22:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722552317; cv=none; b=dDu9MQjZpOI7miyhdWnm9/vooVxTq4B+DVYmD3pBhwE8t1yEGCeJGCTNvemorODdWCYyHqunEVY4Kv6cuBxtp9sD7/1EDDmuhdUQpjckqNYdIRmwFWdW7SYCzgh6ysH3sJ0XIDp7z4wdu4gAkuXAAu1u5zmmp/FDstdSncAnekk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722552317; c=relaxed/simple;
	bh=px06ln8f03zbfmJaslWzxgpAk22Qif17pX2SjSFhQeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r8lmxXVgufqtqg8tK5G4/YahEzt+M03A+hYWcbs0Umg3h0/Dcxj3xR4DoCCUep9l6s/rzo+sUqEVMFrhnBZVNdkSGkZXBrNyvh5XEF/R+nbLSg6vvTt+sphzq6/REStNKponwZ0rqr/Vpd5YmuKI2YCIcPL712l8iIkvmNE1qbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DWo9vuzD; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DWo9vuzD"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5a28b61b880so42885a12.1
        for <linux-doc@vger.kernel.org>; Thu, 01 Aug 2024 15:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722552315; x=1723157115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpNg5HuVdIrfzzfqVoTf0KzPKFikGceLUb5rAzqj0j8=;
        b=DWo9vuzDCtGzHLrcVORw3JWJHKvZeP2onfcH7qMCiIRoefhevFGIVa3x37ISNDvYZS
         LttnxRv+enfhMfUyPsNS9qoX4W6ONVSWtyfs6W4PFRb/QAkzgQFinh/RtaTQhWDp3cP4
         A2u+7RcwJZ79sb2MVb2Wwwx4ng7U3DCzB8pwWeZlsVN9zZb2N628eQMi0Ue7NoM9OzQp
         QM11mX+mwvmhB7Pai9KM/0DMxeo8/wxeAPAbd2unM3F5KEXPeVIs3HeJx6mOXypqDAUc
         blFisoNIiyrvExtpHJHnFV+yKauLPXLF4dVMUS+CgzH+gTcXI7Gfd6Uw5msJWL99sSVq
         TKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722552315; x=1723157115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpNg5HuVdIrfzzfqVoTf0KzPKFikGceLUb5rAzqj0j8=;
        b=PAxtNHaJWbFXh7NzAnmDfOliPUH2RF/LutVcVT90QsmseE1JBSIeD7nDAnGojXtzIV
         gMqZiEq+h8wA03kd1kMrW0EcqJryeX0g5+nQCGgNLcKuX+CF6LsPWcszqyCD9Eb63cne
         XGlVzxTzsahICrU8MEN3PQkN58+9WcCC6hobVKbUG+XGrtDd0F0ZZh9rdhhX6KYkvc6o
         MZE+wRqMaj3jhLryUsHm8d9zjus4SKolzHXf6WsP51quoJvHU94bVMUoxpMco3ZXamI7
         xMswQKUI2uk03vW9F0rRS+x0Tu30eVLlNSyv1+arfuAxAOp07vJrz8AV5m410S2keP0/
         VLIg==
X-Forwarded-Encrypted: i=1; AJvYcCX2ZHQGWUMDlcBmXnxcQ4SBpZjuF9zWoI4yfbm06k5yqlacnDxzeTCC2W7IiG8vK8TNqqPq7ut4QOM/L7OSdWNtfe9pcqIR04w8
X-Gm-Message-State: AOJu0YzYz0Ozicdsgz2wf19uTQuLOcITYj0cukSA1Nw55bWG4/kAOSx4
	pEcCIECc5XQSNwdkDKVn5KX3S6j34y+8fpJ0UxV3fxhet338Wj9Tbnoi+vZRZcbzouR76EmCZft
	omySVPuNRoUX5/5/WkdV4BYFPOI/46NixcOu1
X-Google-Smtp-Source: AGHT+IEU4bu5xxsNW5+2UHYkD8TADiTNSthVu469k4Sq2U0yowJnxuxqrmuAvA9kMCXyFv2TdRSsKQ1vg6RQn5YkczQ=
X-Received: by 2002:a05:6402:270b:b0:57c:b712:47b5 with SMTP id
 4fb4d7f45d1cf-5b86bf8eda2mr34536a12.4.1722552314243; Thu, 01 Aug 2024
 15:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1720043311.git.babu.moger@amd.com> <e04b721a-b5cb-4089-a3ad-125a6247e5b8@intel.com>
 <1c50b589-a738-4ae6-8362-bd1ce0d0dc98@amd.com> <05b4e345-ad14-4ea9-a13f-2c9b3a6eb422@intel.com>
In-Reply-To: <05b4e345-ad14-4ea9-a13f-2c9b3a6eb422@intel.com>
From: Peter Newman <peternewman@google.com>
Date: Thu, 1 Aug 2024 15:45:03 -0700
Message-ID: <CALPaoCi_TBZnULHQpYns+H+30jODZvyQpUHJRDHNwjQzajrD=A@mail.gmail.com>
Subject: Re: [PATCH v5 00/20] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: babu.moger@amd.com, corbet@lwn.net, fenghua.yu@intel.com, 
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

Hi Reinette and Babu,

On Thu, Aug 1, 2024 at 2:50=E2=80=AFPM Reinette Chatre
<reinette.chatre@intel.com> wrote:
>
> Hi Babu,
>
> On 7/17/24 10:19 AM, Moger, Babu wrote:
> > Hi Reinette,
> >
> > On 7/12/24 17:03, Reinette Chatre wrote:
> >> Hi Babu,
> >>
> >> On 7/3/24 2:48 PM, Babu Moger wrote:
> >>> # Linux Implementation
> >>>
> >>> Linux resctrl subsystem provides the interface to count maximum of tw=
o
> >>> memory bandwidth events per group, from a combination of available to=
tal
> >>> and local events. Keeping the current interface, users can enable a m=
aximum
> >>> of 2 ABMC counters per group. User will also have the option to enabl=
e only
> >>> one counter to the group. If the system runs out of assignable ABMC
> >>> counters, kernel will display an error. Users need to disable an alre=
ady
> >>> enabled counter to make space for new assignments.
> >>
> >> The implementation appears to be converging on an interface that can
> >> be generic enough to be used by other features discussed along the way=
.
> >> "Linux implementation" summary can thus add:
> >>
> >>      Create a generic interface aimed to support user space assignment
> >>      of scarce counters used for monitoring. First usage of interface
> >>      is by ABMC with option to expand usage to "soft-RMID" and MPAM
> >>      counters in future.
> >
> > Sure.
> >
> >>
> >>
> >>> # Examples
> >>>
> >>> a. Check if ABMC support is available
> >>>      #mount -t resctrl resctrl /sys/fs/resctrl/
> >>>
> >>>      #cat /sys/fs/resctrl/info/L3_MON/mbm_mode
> >>>      [abmc]
> >>>      legacy
> >>>
> >>>      Linux kernel detected ABMC feature and it is enabled.
> >>
> >> How about renaming "abmc" to "mbm_cntrs"? This will match the num_mbm_=
cntrs
> >> info file and be the final step to make this generic so that another
> >> architecture
> >> can more easily support assignining hardware counters without needing =
to call
> >> the feature AMD's "abmc".
> >
> > I think we aleady settled this with "mbm_cntr_assignable".
> >
> > For soft-RMID" it will be mbm_sw_assignable.
>
> Maybe getting a bit long but how about "mbm_cntr_sw_assignable" to match
> with the term "mbm_cntr" in accompanying "num_mbm_cntrs"?

My users are pushing for a consistent interface regardless of whether
counter assignment is implemented in hardware or software, so I would
like to avoid exposing implementation differences in the interface
where possible.

The main semantic difference with SW assignments is that it is not
possible to assign counters to individual events. Because the
implementation is assigning RMIDs to groups, assignment results in all
events being counted.

I was considering introducing a boolean mbm_assign_events node to
indicate whether assigning individual events is supported. If true,
num_mbm_cntrs indicates the number of events which can be counted,
otherwise it indicates the number of groups to which counters can be
assigned and attempting to assign a single event is silently upgraded
to assigning counters to all events in the group.

However, If we don't expect to see these semantics in any other
implementation, these semantics could be implicit in the definition of
a SW assignable counter.

-Peter
