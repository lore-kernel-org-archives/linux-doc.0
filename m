Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477D83E9C29
	for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 18:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260982; cv=pass; b=bJICHOMDhfwNRSEjhcsbj0ZSXPrSadUljZhXMC0m+57/rvnAjpRaRwRSLLvQk0t+zp9xr7dzCXXruZnkKfxurhTPxibAETLr7DZ7zSL6jP4zE0JRY5EFhCWV+Yd2SDhidog3CKQjOQby8EfXEjvaj3R6tyru0GyCThCylUe/QA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260982; c=relaxed/simple;
	bh=gcTSzRaGTbutrkt9X+KlfCvLxA9mYQLFAjncxzTeeQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYAMqztE+6vv5ZQBTAIDoCoRRTLeEYqvgvau9IhezSdLxdVbsHC1lhdSF0T07WNtN554ub9MuKawqkeTW2jNIp9HAuOzfas04vReycXiJ+n8QYWbYlmVV9hCfTLrUnnVHfuCnvCw61Z13WNyFgd/oIwds1ATlfcZ7nCBKBZDNzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSBPb9o+; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSBPb9o+"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e5d0ee1951so5796805ad.0
        for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 11:16:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792260978; cv=none;
        d=google.com; s=arc-20260327;
        b=co45/jC0gcoV9jJX37lqmQ88zTPpjfzuEhxFi85LRosi5BuTCgFQmPLHYSOornwOkA
         UQywh1fXiwjNfHxfWCheqUz9bFKclf0o57GChoyVQO8M5iu49ksd/1aZRC5nb0l64WLv
         h6fVzJp6GSd6XNqw367PTmuvAWw9ZDKF9c5YjUNm+avj+4cU2wVCNyOe4qraNvERMF1c
         NrpNaxcl9bvsm9loAkRECag4CkJL/NMq1xd9u9Ha/3qCv3Qto765hMuPS6WzAQdg6IOl
         hXJjLewSJmSu8miGhAGtcWI0wxl8e58lE6zRjSr9ikjtDvFlpfEWg4JtWzoLwUswEFm1
         0IXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gcTSzRaGTbutrkt9X+KlfCvLxA9mYQLFAjncxzTeeQ8=;
        fh=BrnYHsTIuffvJQB6sHjMxoK5P8ukyJBn0THRywMI3vE=;
        b=jwsjAui8qD3H/XYJ9eadogUrM+KBexkQb4d++/5RrQ8NBNJPEhXmWCuoVI3Ssfr0bV
         0koyhfFqyyvB+Lp03ApJX1othns9ih8bYYUG1zscDv39/sIWbskGOREnE4r68qCrojTD
         C7uhG33rWyhyYGuDP/RB4VMlF8ZWHLwmxVoh/WFk11Ky5zPJfbHmKEi75S0p7Z7KHdp0
         g2Z6Big/vMCAAMLCVp6k7e6sKYziokabSivk+vD7Rtul6N57TCnJ8cqUP0NYtxYjT+la
         Iu4Orp1ZVDYGNLdgwKyQoqNvShOsKNlCYIWgE/eVW0W+PocCpwNn2s6PQcUV5BEwUcVU
         z0cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792260978; x=1792865778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcTSzRaGTbutrkt9X+KlfCvLxA9mYQLFAjncxzTeeQ8=;
        b=RSBPb9o+qHBLqf7bPx4y/6eKLwAKmZ+JOdHhySY5dPsZkHK0gGqeGdhpkqiUEfDWTn
         Xz7PgRs27MXpUKTwyE0U+VoeDSTiyToGowF+EzRalz22KGX2leouQlNL31ubIAQqxe0t
         Z//bjUPSCLxz7263vGceb3XbzHMGXb+Pu6OuAeab8pQXlAc/GOQjk1OQHlREVugWF6Ug
         ThgM3qTgDvB0YPC3gEOKxnbYRarTHjvnzPkWed7+rinme3a3Tw8oBwrwogQ5AAbFU7u9
         0b+amr8eG62aakcybZAT3IUX6asuL/0b8FIjFpEn4h/+4MSt13PLy0JYa1UD3EcNtg5s
         AQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260978; x=1792865778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcTSzRaGTbutrkt9X+KlfCvLxA9mYQLFAjncxzTeeQ8=;
        b=ENg9tHOYlo9hQNShC84hjlu1OAS1eD6YRAdxQgv4Kttlw/RoIzXNH8iKhO0Dl97xIP
         7BRqJ8G8pcPJ4qpko9F16vy88I/GxGbG+x4lv/JTbfc3fQeDbjQ42tVP/66Q8ogHZ62N
         zWASVinL3o3lfl46/hZut9tPxhttzvgObmG602pXm/N8uSpRdzIQlovvRdF2+aSVZp4p
         dgZ94wXLz7Ev5SR/g0/h3Y1tvUKp0pZMfIjD7F0ADl+sQWk55EWzBVMTU/HCT1f5yfeG
         QZlZDCxLz1bRCU54d9V73e4+jSBY8RtReKDtTQ4lWQcUhDgOcW71PuuPdwF8xYjgMTTO
         rS9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwBD68Hc+71Ldq9fr02nyBbqZ2a5BFHs2IjgiK7Cbyvp5NzIsH07Awt4a5akn3M5ZVKr3gwyepNUdA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoql0Sf3zRZobq0r4sfCc99+E3mEKdtI1Kr88Z01stZ790rdhs
	FOQMek3y8YjesUORK1Ooo9SA+JbnUpASMHa4W+l1a2zaZF8CXsFwT7xo4hYSQtKhuma+6cANIPc
	SsBOFSoDsKrfaLijHcuExYTPlkjWgklg=
X-Gm-Gg: AYBFou1yJyWnNTNyeUY3qdXRPx/mAssny26uXj4Gza4Gyw2ccrjFrtIQbQBrwNK+0Yn
	ZDB6I8dV5H1yn+6H3EIDrth6BK3+AZUxgWEXa5G+OWagjuhsq+PhYOpACbe9cJqI2UCgzaQjddg
	jSa2Uz73WnqcRKCVMQAIkZsfZf1ZudtbZNtnKwKFO+ocHf8i8OdsYPPQbKzylKJyM68bh3OFaaH
	fEABiZ6R8wMOIaeNccDofjo64qgLLDfPvh8pUtfgTrfrUqCVIYcb9yGX71rTxj2EhTRC2GEZiRs
	E5xq8pDBnv+O0TeF5SWNFp2h7ee+IR1YYnSH1rK5Iqgzih1Exx0gMH2oQFkis8pSM4rIuVFl/eM
	HjvSmXy13K9anqPMF5A==
X-Received: by 2002:a17:903:f84:b0:2e8:1f8a:9113 with SMTP id
 d9443c01a7336-2e9a6f58265mr30097085ad.40.1792260978190; Sat, 17 Oct 2026
 11:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015145053.3664509-1-jiri@resnulli.us> <20261016234354.GA664420@nvidia.com>
In-Reply-To: <20261016234354.GA664420@nvidia.com>
From: Dionna Glaze <drdeeglaze@gmail.com>
Date: Sat, 17 Oct 2026 11:16:07 -0700
X-Gm-Features: AclHuK_VfiECrlJzL8WxJydqMRSqCDHROeCkJ1kn-iT7JVYpxgerlwtvN-75yu0
Message-ID: <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX support
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, david.quigley@intel.com, 
	lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, 
	jarkko@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:43=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Oct 15, 2026 at 04:50:33PM +0200, Jiri Pirko wrote:
> > From: Jiri Pirko <jiri@nvidia.com>
> >
> > Linux has several attestation interfaces tied to individual technologie=
s.
> > That makes evidence retrieval, measurement registers, device state and
> > kernel consumers provider-specific.
> >
> > This series introduces a common attestation subsystem. Its goal is to
> > support platform, TEE and device providers through one model, including
> > TPM2, TDX, SEV-SNP, Arm CCA, FIRME, Caliptra and PCI/TSM-backed devices=
.
> > This first series implements the common subsystem and a TDX provider.
> > Existing native TDX tsm_mr and tsm_report interfaces remain independent=
.
>
> To add some more colour on where this came from for others..
>

Forgive me for my following "I still don't get it" responses below.

> About 3 months ago we started looking simultaneously how to support
> roots of trust (ROT) HW in place of TPM and how to respond to the
> feedback on the netlink proposal for the TSM SPDM.

Given that I was tagged on this thread and not that one, I'd
appreciate a pointer to which you mean.
Is it https://lwn.net/Articles/1079098/?

>
> We began talking about generalizing tsm_mr to handle more than just
> "tsm" into a broader set of roots of trust, including TPM. In this way
> it could act as a multiplexor for any measurement user in the kernel,
> like IMA for example. I see others have independently come to a
> similar conclusion that IMA needs ROT agility, but I also know that
> DRTM needs the same ROT agility too.
>

+Jarkko
The TPM driver is pretty entrenched and heavily used by different user
space applications, so it seems really ambitious to bundle in TPM
here.
Consider that you have to do a lot of command interpretation to know
whether a user is getting or extending a PCR value, or whether it's
systemd doing an NVPCR thingamajig.
I don't think you can intercept commands and translate to intent for
any kind of extension to be correctly tracked by your MR journalling
addition here.
Can you explain a little more what your intent is?

> Bringing in the SPDM side, the netlink TLV uAPI fits nicely and can
> expose all the structured binary data it has. SPDM is also effectively
> a ROT without any measurement registers.
>

I would push back on SPDM being a ROT because you're talking about
different devices.
If we're Linux running on the CPU, the ROT is TPM or one of the Coco
things (SVSM vTPM, TDX attestation on MTMRs, ARM CCA attestation on
REMs).
If we're Linux running on a DPU, the expectation is Caliptra
bootstrapped the device and a DICE boot chain got to a Linux
environment without runtime extensions.
There is nothing to communicate with over SPDM to learn your own
measurements since the boot chain is available to the kernel.
If this is changing, please fill me in.

There is nothing that you communicate with over SPDM that acts as your
_own_ root of trust, with one exception I can think of that I would
call a platform security bug: a platform root of trust.
If a PRoT holds back firmware from interconnects until it has verified
the signature, and then the devices receiving the firmware do not also
have their own secure boot, then there's a physical interposition
attack surface.
It won't be the CPU that communicates with the PRoT, it'll be the BMC
(as far as I know from any architecture I've seen).
The BMC can be running Linux, and be treating the PRoT as its ROT in
older architectures that don't have Caliptra on the BMC itself.
The CPU can talk to the BMC over a privileged veth device and use
RedFish to get SPDM measurements, so there's no new device needed in
the kernel for that communication.

Are we talking about this BMC without an embedded root of trust (eROT)
case to treat SPDM as a ROT?
Any other SPDM communication would be for composite attestation by a
lead attester that all gets bound under the ROT that the lead attester
uses (presumably TPM).

> Combining the two needs together it seemed apparent that TSM is a bad
> name for this expanded purpose so we start calling this attestation
> subsystem. "root of trust" subsystem would be another way to look at
> it.
>

I don't see how a trusted security module is a bad name for this.

> The general notion is any root of trust can come with a single driver
> and expose a bunch of different uAPIs. The modern most capable one
> would be the CTLV based ioctl interface through a char dev, but in
> cases like TDX the legacy uAPIs will also remain supported.
>

What capabilities are you trying to enable, though? I'm not really
getting the picture.
If I was right about you referencing Alistair's patch series, then
perhaps this is a clue?

>>This series is different to Lukas' original approach and the approach tak=
en
>>in the previous RFCs and instead adds the PCI-CMA support as a TSM driver=
.
>>This was described by Dan in [3] and [5]. The advantage here is that for =
PCIe
>>we can leverage the TSM work for a lot of the features and provide usersp=
ace
>>a consistient interface between PCI TSM and CMA.
>>
>> [..snip..]
>>
>>Other transport mode (such as ATA, SCSI, NVMe and MCTP) will
>>therefore need slightly different approaches, as TSM doesn't apply.

I don't really know why TSM doesn't apply, and how this proposal does.

> In this way I view it as a further evolution of the tsm report and tsm
> mr components in a way that lets us harmonize the uAPI and avoid
> hardcoding things in userspace. Though the name has changed so this
> linage is not quite as apparent.
>

I don't know why using a standard protocol in user space would be "hardcodi=
ng",
if we're leaving the SPDM message construction and interpretation to user s=
pace.
The TPM commands are standardized and left to user space to manage for exam=
ple.

> For example the end goal is for systemd report to be able to
> dynamically enumerate all the ROTs in the system, include them in the
> report, and generate signatures. Without necessarily requiring ROT
> specific code.
>

What other than TPM quotes and signed SPDM message transcripts are you
trying to cover?

> This applies to SPDM as well, ultimately every SPDM user in the kernel
> should be able to get an attestation subystem cdev and flow through
> the same uAPI channels that PCIe TSM uses, also into systemd for
> measuring and logging.
>
> I'm looking at something like 7-10 ROT drivers just for the current
> set of NVIDIA ARM servers. Probably another ~5 for NVDIA non-ARM
> servers. Then a couple more down the road. It is alot of variety and
> today all this HW is largely unavailable through Linux.
>

If there are NDA'd docs to get more info on these, I'd like to work on
getting my eyes on them.
Are there some doc numbers I can ask my hardware engineering rep to
pull? They manage vendor engagement.
