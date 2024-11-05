Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7252EB1F
	for <linux-doc@vger.kernel.org>; Tue,  5 Nov 2024 10:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730802960; cv=none; b=f7RvU0jvj1/7b8uxo9+8ac16r64Mx5Z2sPtayCuy+4XJZKukig2M/kpWdlAnSqtmW6rQBfk5Uf7oQTa9RlfXcO9NZ2nKKKZfGt2AIYhZfPQfyhLx0ojuvArQP1DRMrO+T28FKXcCcIIJiM9elZifR+6hLXI/a0ytysdpOXp3oSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730802960; c=relaxed/simple;
	bh=6HhMrwij3Sm4Ez5HTdLMk1GmRfoKOqzP5Je5fYiFaKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OENSoaQAf8wZFh4EymzV+9A7MCLCNJPoRBeCfR60YACWonwjJ/KKi4xBl2r24CUL/Usrk61Fo/oUD4KRrFFLVFGIwjqDFmw5rDrTTl9/xJ/qN0pFf9zMnOjCrrV7w65WsngrilBkcz5yTbRO5dzEUMLKomUvBNKsKUbKgpQ56ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2E9iggUA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2E9iggUA"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5cedea84d77so1969991a12.1
        for <linux-doc@vger.kernel.org>; Tue, 05 Nov 2024 02:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730802957; x=1731407757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDJ/Kctg4e0f30HvMWXY+UgoVtT+n9MKZZPRr6MzBqE=;
        b=2E9iggUAKqBSR1LN03HPKhPVOvgh2KKD9pzQ1sUyfa2Rmy33jiwJYmQBibQxNMljfx
         PJgAagA+3V4tVMaZmCtIhO9lJ0I5sSOqXUsVmxRx0vNzVRrd7Q875EwFCYaVvoRj7aVs
         itvpI7inseyDsLACySXkl5tF6tTFTPvFAG0VQYFoZz1s9Dh+b6wx8/RIStIZ/AxTg8U0
         LOP3sO8dnVNCWtPZ8bsJxWl0JM0vAKvKkp+bcs04MeYPRz2lWY+7VfSqAWwPVUH5iV44
         U4FkC+Qvm7WkVQDV4Ov2bADRCOHjQPrqRKLk4piQgt4d/j3IZIxEaAZuk2M/ZKCukxm8
         y5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730802957; x=1731407757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDJ/Kctg4e0f30HvMWXY+UgoVtT+n9MKZZPRr6MzBqE=;
        b=FD2rQrE/+kEQ2s2VQgz+bqD/IriEvyoZn6YxdklB45xvprJY03ETfmXklyhPgdnvPO
         EkufmI1+tOzcGO4lkeSY09Jj1UHAB45wzS2wzfhmDDaghDH4nYOTYs0560lyj9UE5uqr
         tzY56XGSMgMyGF6fKNctEaXEMSBAnDYBatIonMnxFoT1NzRWknAAYd6qx43U6oKhj3mz
         q+ban6BRjY5P6FYROEiFlgRWxHLDmlgOLbJ7l59ytlNFBBjO/iiZq9G/LexNV0GMgw1U
         kBuNhdZJTLZAiUJSh1TIn2RHWBb8stesXml5nENF6tvt5x/vt318dowy4gUg2R07VcUG
         3bJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTjqswtdyjwVgSslC1A3TovXXtfoFlhBbt1pPPj9oBz7eXFWc6NeqThAoi7qJFRdDoeiPRD1xU3FI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvbvx+NOvs5TABayiH2FfplFqt6Zfl37Fl8SpFEYUUVtVfM3ZF
	6Tcfbx7tlpDNO9F6cMvCkCMAxvw0WGnWzqLfG17vpDsGM7EDP8mafMySZbwgGdQkhx/L/sPF0gW
	7cmP/BIEi6a2BXwvq5fVQDVTLT0euh13QD0Zl
X-Google-Smtp-Source: AGHT+IG8aPze0kJVzo0IME8bHugDyPyiohoFX5zaBuXzmMbChOtscLPmMnEKHt24u7PgbFxdiPbd9OFtGrxcTJYEPSw=
X-Received: by 2002:a17:907:7e84:b0:a9a:123d:3f1a with SMTP id
 a640c23a62f3a-a9e508d4af3mr1757814966b.17.1730802956929; Tue, 05 Nov 2024
 02:35:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1730244116.git.babu.moger@amd.com> <d27c3a15ccb11c6ba76794eba6cf7c013b0bb074.1730244116.git.babu.moger@amd.com>
 <CALPaoCh1BWdWww8Kztd13GBaY9mMeZX268fOQgECRytiKm-nPQ@mail.gmail.com> <6fd12815-98eb-469f-8477-0de12af29aa2@amd.com>
In-Reply-To: <6fd12815-98eb-469f-8477-0de12af29aa2@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Tue, 5 Nov 2024 11:35:46 +0100
Message-ID: <CALPaoCgiHEaY_cDbCo=537JJ7mkYZDFFDs9heYvtQ80fXuuvWQ@mail.gmail.com>
Subject: Re: [PATCH v9 19/26] x86/resctrl: Add the interface to unassign a MBM counter
To: babu.moger@amd.com
Cc: corbet@lwn.net, reinette.chatre@intel.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com, thuth@redhat.com, 
	paulmck@kernel.org, rostedt@goodmis.org, akpm@linux-foundation.org, 
	xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com, 
	daniel.sneddon@linux.intel.com, perry.yuan@amd.com, sandipan.das@amd.com, 
	kai.huang@intel.com, xiaoyao.li@intel.com, seanjc@google.com, 
	jithu.joseph@intel.com, brijesh.singh@amd.com, xin3.li@intel.com, 
	ebiggers@google.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com, 
	james.morse@arm.com, tan.shaopeng@fujitsu.com, tony.luck@intel.com, 
	vikas.shivappa@linux.intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com, 
	eranian@google.com, jpoimboe@kernel.org, thomas.lendacky@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Mon, Nov 4, 2024 at 7:21=E2=80=AFPM Moger, Babu <babu.moger@amd.com> wro=
te:
>
> Hi Peter,
>
> On 11/4/24 08:16, Peter Newman wrote:
> > Hi Babu,
> >
> > On Wed, Oct 30, 2024 at 12:25=E2=80=AFAM Babu Moger <babu.moger@amd.com=
> wrote:
> >>
> >> The mbm_cntr_assign mode provides a limited number of hardware counter=
s
> >> that can be assigned to an RMID, event pair to monitor bandwidth while
> >> assigned. If all counters are in use, the kernel will show an error
> >> message: "Out of MBM assignable counters" when a new assignment is
> >> requested. To make space for a new assignment, users must unassign an
> >> already assigned counter.
> >>
> >> Introduce an interface that allows for the unassignment of counter IDs
> >> from both the group and the domain. Additionally, ensure that the glob=
al
> >> counter is released if it is no longer assigned to any domains.
> >
> > This seems unnecessarily restrictive. What's wrong with monitoring
> > different groups in different domains?
>
> Yes. User can monitor different groups in different domains. But, they
> will have to use different global counter for each group.

What is a global counter anyways? It sounds like an artifact of an
earlier revision. This concept does not sound intuitive to the user.

>
> Here is an example.
>
> #cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
> groupA//0=3Dt;1=3D_;
> groupB//0=3D_;1=3Dl;
>
> Group A - counter 0 (Assigned to total event in Domain 0)
> Group B - counter 1 (Assigned to local event in Domain 1)
>
> We allocate two different counters here.  Now we are left with 30 counter=
s
> (max 32).
>
>
> This is similar to CLOSID management we follow in resctrl. This is not a
> new restriction,

It is a restriction in a new feature that resembles a restriction in
an existing feature.

I don't see what function the global allocator serves now that there
is already a per-domain allocator. My best guess is that it avoids the
case of an mbm_assign_control write that succeeds in some domains but
fails in others.

I admit I said earlier that I was only planning to allocate globally,
but now that I'm evaluating how to make resctrl's monitoring
functionality scale on large systems, I'm being forced to reconsider.

As long as this is only a limitation I can fix later, I don't see it
as an obstacle. There would just need to be better documentation of
what sort of internal data structures the user needs to visualize in
order to use this feature successfully.

-Peter
