Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE1D1A5BA2
	for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 12:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742991023; cv=none; b=tFVe0pVQcyruFn9hKS1TfANE9HZxY1CsYI2ohU3+S2h4hUinDggN5L3ZUjsILEqJZ9iHLuRIrPtWAbOf0edOF3xREoGZJeHjm3JgwbBMcxVDUaZ5EshPvFHJOnJ1xg6ovNyCyJBCyrhpGh+YiGPciC4E9KdQLancO9FkOtb2i6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742991023; c=relaxed/simple;
	bh=Rn7DZzluTD2+MZZoYt3D0u5sryYqeFHqvQWAx2OGmqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nyc+QzLnuwxyAbHbl6iWoIWG37FLpSWypC01IFy5OQ13kXSMoQgr0zzsVa+VVx9B8ey9sCnPIReoWdRPWJdSc8p9E4+BRdkQPU6zyDowCcysuMLsaU/+64oA2s8f5FZezaLNPBkuvsPl0+MU54zmTmMzBlqr/MvYYPXsDm9aAnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X/zIktFD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X/zIktFD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742991021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nDjBICGKa43kYHEOCFvDUYcy1IhXoeMUQwDGcLiaSWE=;
	b=X/zIktFD7ByyPXWq0QjDYagMqQE0QZQFUiTdpGhMopYdChvGxcqBR3xCfaie+HNQTFmccT
	41VGDHPPI6MqaKaeGwOOLEH3rNHBdQmNN7qRACkUycFYsjEiaUHrymrYQCbJW9Sv+3crrS
	+Ob9b46J77YTNLsHBGd4UzdgEUwEA84=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-p4UL1mNGOFeIh9nHW-pQeQ-1; Wed, 26 Mar 2025 08:09:39 -0400
X-MC-Unique: p4UL1mNGOFeIh9nHW-pQeQ-1
X-Mimecast-MFC-AGG-ID: p4UL1mNGOFeIh9nHW-pQeQ_1742990979
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d438be189bso66749515ab.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 05:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742990979; x=1743595779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDjBICGKa43kYHEOCFvDUYcy1IhXoeMUQwDGcLiaSWE=;
        b=dwp+QehxHgzpZgV+E/JJJbgBVMmotsKtLzR/M44f/bRtDqaaOC81+rCb8WuqbyIevi
         UzKneOC+U68GydfvoZ6xOP/ztmi6VRuWiPKzg9Y33HpRXcdUTOsS745isXqDNQ1DgnTx
         53LKlYlfrbr7mRYLsLSmPnQArXh4OeipZlze8mQ0dP3CavnVVdLDE0xAF6zqaqPQYiob
         +0aAMNNFanWCV8PjBKdQ4FQksPPR+XeVvcLBh7lRkIHTJuYK5YfppsQK4+FLuauFgNH/
         +H0Xe/vv/vhmsKd5Q56iHwGij+QlNWXqzO3rFXNe3yayUL+r9ywqTGDP+zEcDl2DT6k9
         ibBw==
X-Forwarded-Encrypted: i=1; AJvYcCWE1zE81swPOMK9xtDyeBkc3riRlB7eMDix/Wl467NqDkcJtcYoArd39lcp27nP1hsybYiF/8b8zVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzA3YlmZfG6VlHTA+9lVFEBeq8sKALcuapHOQByRWdSvVGeDmv
	A6EPSAU8j5aX3yCQeiDvjzrhcEan8uhkGE5wxbwJWAHphMx5qj3hVONWJFbiPIH5/cDsTa2A0NY
	vQvmxkFiZY480CMnP4OFZF87ddeWuEnYvacD2NHrvPPrIyIoN5k63lUKy+j9MqNgLCvBhfXRFF4
	pOfHyOVl4UR6cRfXn7HwIGNVWToSOU4ONr
X-Gm-Gg: ASbGncuIna9wgpF9orfFEg0ffaD8QbzMittFPZQyOaUKRmq+sZObx8CcX3AhByBpfXX
	sz/JBW7BOdM44ga0lnCNYq3FtxPLaxG9SmptTVmK8yNyADD7InETXAnciss1DOm2ECG0grWDJ6A
	==
X-Received: by 2002:a05:6e02:3a0c:b0:3d4:6f37:372c with SMTP id e9e14a558f8ab-3d5960e2419mr225836375ab.7.1742990978711;
        Wed, 26 Mar 2025 05:09:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOuyfQGVOhYyFSi3hsb9kc2zJRzczpD7XPzwNdnwVuHyYQPBafKpH087OtVwDsIyzVWltmG166ADE4aJfipJU=
X-Received: by 2002:a05:6e02:3a0c:b0:3d4:6f37:372c with SMTP id
 e9e14a558f8ab-3d5960e2419mr225831915ab.7.1742990973998; Wed, 26 Mar 2025
 05:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-12-changyuanl@google.com> <CALu+AoS01QJ-H5Vpr378rbx==iRQLG0HajtMCUzDXRO75biCag@mail.gmail.com>
 <Z+JT7kx+sfPqfWFA@MiWiFi-R3L-srv> <CALu+AoQj+mHECTvbuK8CpUTmOYgx6n2oMFm5kQXtSigL+5Ks2w@mail.gmail.com>
 <CALu+AoRdfjNcjweq_ipxCC6UGBzM-a5ma417RBr-C3EQ=Em9OQ@mail.gmail.com> <Z-Pk9Bnr0lDVopKj@kernel.org>
In-Reply-To: <Z-Pk9Bnr0lDVopKj@kernel.org>
From: Dave Young <dyoung@redhat.com>
Date: Wed, 26 Mar 2025 20:09:55 +0800
X-Gm-Features: AQ5f1JrnxWyTc7ruwIDaX1fnmt0FdUmOV-OtIvcwHa3Skex-wO_kM_31tXed_lg
Message-ID: <CALu+AoS9=KttzqgR+xi11jur5eX7dBwUfOoueHoOss3eFn+Hkw@mail.gmail.com>
Subject: Re: [PATCH v5 11/16] kexec: add config option for KHO
To: Mike Rapoport <rppt@kernel.org>
Cc: Baoquan He <bhe@redhat.com>, Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org, 
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	dave.hansen@linux.intel.com, dwmw2@infradead.org, ebiederm@xmission.com, 
	mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, krzk@kernel.org, 
	mark.rutland@arm.com, pbonzini@redhat.com, pasha.tatashin@soleen.com, 
	hpa@zytor.com, peterz@infradead.org, ptyadav@amazon.de, robh+dt@kernel.org, 
	robh@kernel.org, saravanak@google.com, skinsburskii@linux.microsoft.com, 
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com, 
	usama.arif@bytedance.com, will@kernel.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Mar 2025 at 19:34, Mike Rapoport <rppt@kernel.org> wrote:
>
> Hi Dave,
>
> On Wed, Mar 26, 2025 at 05:17:16PM +0800, Dave Young wrote:
> > On Tue, 25 Mar 2025 at 16:36, Dave Young <dyoung@redhat.com> wrote:
> > >
> > > > >
> > > > > Have you tested kdump?  In my mind there are two issues,  one is with
> > > > > CMA enabled, it could cause kdump crashkernel memory reservation
> > > > > failures more often due to the fragmented low memory.  Secondly,  in
> > > >
> > > > kho scracth memorys are reserved much later than crashkernel, we may not
> > > > need to worry about it.
> > > > ====================
> > > > start_kernel()
> > > >   ......
> > > >   -->setup_arch(&command_line);
> > > >      -->arch_reserve_crashkernel();
> > > >   ......
> > > >   -->mm_core_init();
> > > >      -->kho_memory_init();
> > > >
> > > > > kdump kernel dump the crazy scratch memory in vmcore is not very
> > > > > meaningful.  Otherwise I suspect this is not tested under kdump.  If
> > > > > so please disable this option for kdump.
> > >
> > > Ok,  it is fine if this is the case, thanks Baoquan for clearing this worry.
> > >
> > > But the other concerns are still need to address, eg. KHO use cases
> > > are not good for kdump.
> > > There could be more to think about.
> > > eg. the issues talked in thread:
> > > https://lore.kernel.org/lkml/Z7dc9Cd8KX3b_brB@dwarf.suse.cz/T/
> >
> > Rethink about this,  other than previous concerns.  Transferring the
> > old kernel state to kdump kernel makes no sense since the old state is
> > not stable as the kernel has crashed.
>
> KHO won't be active for kdump case. The KHO segments are only added to
> kexec_image and never to kexec_crash_image.

Good to know, thanks!

>
> --
> Sincerely yours,
> Mike.
>

