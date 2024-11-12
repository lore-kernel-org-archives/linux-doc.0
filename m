Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEF621314D
	for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 17:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731433468; cv=none; b=APG+33hiT/7OZCVVo8rMvjQqsGsDyYNLxqhHDnImoVmAiVKlWIc8hAkR710Bj3cYmDsxNG+DQZeTiC0gWtEGgH+c/Z2UDfpQd18RTerBaQY66uT6VhVasdo37sd3Q7SOqEp6NKja3JxqgH1MN3YziUCi/AVLjFb3q2sFbKd9ONQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731433468; c=relaxed/simple;
	bh=RDfArepTU8NJiFtWt6ibJ1faxB56iYRNzWqS2Kgk2uY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nFn18CvTf5aRgTuMb/BM47Dw+/U016PTJN6nGhlROyOqDzVSWGHcAX4aQ17hLyWaA6WuL8uCU4EGOzVQnkbxo+cXXTyP0hZZy5jUOn9PDu2AecVuhoThFifMvemkk7qAJpJ66iV60fWu79hUlKgrTBvHG29JNoQbFDHiLfovfzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NYKW3wa4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NYKW3wa4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731433465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eVzX8IrUiHDIGjgNVYIdt2apAWg2olnejFrDZpVW494=;
	b=NYKW3wa4c8eH6J31r647I8RM3NKO+yUtzg8YY7bogY1zTM1yQsl9VqPRDwY+S9GnF0V2R9
	qDXJYTA4XTafCKMT8b/o3ZyyOGxDPPwl67+DuaMZBt4wiuXzxutkq5J0KrSGUC5DboRyP2
	bWE0JSoeJ1jj69cmr2xG1/cSoO2qkm0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-klzfxcYcNuSZdwKQNkgUDQ-1; Tue, 12 Nov 2024 12:44:24 -0500
X-MC-Unique: klzfxcYcNuSZdwKQNkgUDQ-1
X-Mimecast-MFC-AGG-ID: klzfxcYcNuSZdwKQNkgUDQ
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4316e350d6aso42509685e9.3
        for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 09:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731433463; x=1732038263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVzX8IrUiHDIGjgNVYIdt2apAWg2olnejFrDZpVW494=;
        b=TQj8TvBMCGg0Orikhpo8cD/46peJb5LLfwRUcdAzZFuQVUxB+roZy4JrET/iW2XUyC
         P8FNIHbQ+aMcMMDXuCHLKE/QhgInh/AiXrVF7N/hTV0HwqamVTHNCljeFdhhL6vJ5CRe
         4OVzf8+rQdqZqKztcPI+KNm/hau+r/mODdPOVmgTrUY/ckyU5Iq9N0tO/n2ko8amwbR+
         ZyUozvxoQJeRQm4+N1i7cm0HjzpDjjuFwfqSowuz/Hald55CiRw/ybDNtFzXzNtAjz6s
         bnd4PEAGaCzOFMQJh+63xMCvyLM6aCFCfpUxixw4VvHb1lYbA1U+/KgNXdOQN0JnQQxx
         HnQA==
X-Forwarded-Encrypted: i=1; AJvYcCWt1AhGXBoktJYOfw6Gwb9VyN7LK/EdmXzY4T7XzUaItKopGHaAlZ3GlvyRRfVmtc20R+LeeMwTbLY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpwl14VeGN+ymVaTIwzM+LUaJlAy4Gl2ahNYiBFwad1ZCUomua
	KWgYRmmCmFevYg605uOPfdXJdPIGk3OrvjPRIwg3NzvByR1NOIqgZjudlu/i/x4T54j4aHZhNRN
	Lkq3uG5ibsvq/LfZ5IqYo2drqoJIhb+D68eCW8jQ1vcE/8Rmtf7Sp5rdsFkpltQmGXoX4KJJt5C
	1mguMPbKv7O+03XPWE0c+E/cXufjcjD/9f
X-Received: by 2002:a05:600c:6987:b0:431:3a6d:b84a with SMTP id 5b1f17b1804b1-432bcafc5a6mr122920595e9.4.1731433462944;
        Tue, 12 Nov 2024 09:44:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFk1+sll6qKj8ZxjfW1Guv/zAkO9AMei6W+uBdtH7yxnyBBvnBSeRCXgDgU3LYFUHOhAclwT5YnnRTovc4RLzg=
X-Received: by 2002:a05:600c:6987:b0:431:3a6d:b84a with SMTP id
 5b1f17b1804b1-432bcafc5a6mr122920445e9.4.1731433462644; Tue, 12 Nov 2024
 09:44:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030033514.1728937-1-zack.rusin@broadcom.com>
 <20241030033514.1728937-3-zack.rusin@broadcom.com> <CABgObfaRP6zKNhrO8_atGDLcHs=uvE0aT8cPKnt_vNHHM+8Nxg@mail.gmail.com>
 <CABQX2QMR=Nsn23zojFdhemR7tvGUz6_UM8Rgf6WLsxwDqoFtxg@mail.gmail.com>
 <Zy0__5YB9F5d0eZn@google.com> <CABQX2QNxFDhH1frsGpSQjSs3AWSdTibkxPrjq1QC7FGZC8Go-Q@mail.gmail.com>
 <e3f943a7-a40a-45cb-b0d9-e3ed58344d8b@redhat.com> <CADH9ctD1uf_yBA3NXNQu7TJa_TPhLRN=0YZ3j2gGhgmaFRdCFg@mail.gmail.com>
 <c3026876-8061-4ab2-9321-97cc05bad510@redhat.com> <CADH9ctBivnvP1tNcatLKzd8EDz8Oo6X65660j8ccxYzk3aFzCA@mail.gmail.com>
In-Reply-To: <CADH9ctBivnvP1tNcatLKzd8EDz8Oo6X65660j8ccxYzk3aFzCA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 12 Nov 2024 18:44:07 +0100
Message-ID: <CABgObfZEyCQMiq6CKBOE7pAVzUDkWjqT2cgfbwjW-RseH8VkLw@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: x86: Add support for VMware guest specific hypercalls
To: Doug Covelli <doug.covelli@broadcom.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>, Sean Christopherson <seanjc@google.com>, 
	kvm <kvm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Joel Stanley <joel@jms.id.au>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, 
	linux-kselftest <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Il lun 11 nov 2024, 21:55 Doug Covelli <doug.covelli@broadcom.com> ha scritto:
>
> BDOOR_CMD_VCPU_MMIO_HONORS_PAT and BDOOR_CMD_VCPU_LEGACY_X2APIC_OK are not
> actually backdoor calls - they are flags returned by BDOOR_CMD_GET_VCPU_INFO.
>
> BDOOR_CMD_VCPU_MMIO_HONORS_PAT is only ever set to 1 on ESX as it is only
> relevant for PCI passthru which is not supported on Linux/Windows/macOS.  IIRC
> this was added over 10 years ago for some Infiniband device vendor to use in
> their driver although I'm not sure that ever materialized.

Ok. So I guess false is safe.

> BDOOR_CMD_VCPU_LEGACY_X2APIC_OK indicates if it is OK to use x2APIC w/o
> interrupt remapping (e.g a virtual IOMMU).  I'm not sure if KVM supports this
> but I think this one can be set to TRUE unconditionally as we have no plans to
> use KVM_CREATE_IRQCHIP - if anything we would use KVM_CAP_SPLIT_IRQCHIP although
> my preference would be to handle all APIC/IOAPIC/PIC emulation ourselves
> provided we can avoid CR8 exits but that is another discussion.

Split irqchip should be the best tradeoff. Without it, moves from cr8
stay in the kernel, but moves to cr8 always go to userspace with a
KVM_EXIT_SET_TPR exit. You also won't be able to use Intel
flexpriority (in-processor accelerated TPR) because KVM does not know
which bits are set in IRR. So it will be *really* every move to cr8
that goes to userspace.

> For now I think it makes sense to handle BDOOR_CMD_GET_VCPU_INFO at userlevel
> like we do on Windows and macOS.
>
> BDOOR_CMD_GETTIME/BDOOR_CMD_GETTIMEFULL are similar with the former being
> deprecated in favor of the latter.  Both do essentially the same thing which is
> to return the host OS's time - on Linux this is obtained via gettimeofday.  I
> believe this is mainly used by tools to fix up the VM's time when resuming from
> suspend.  I think it is fine to continue handling these at userlevel.

As long as the TSC is not involved it should be okay.

Paolo

> > >> Anyway, one question apart from this: is the API the same for the I/O
> > >> port and hypercall backdoors?
> > >
> > > Yeah the calls and arguments are the same.  The hypercall based
> > > interface is an attempt to modernize the backdoor since as you pointed
> > > out the I/O based interface is kind of hacky as it bypasses the normal
> > > checks for an I/O port access at CPL3.  It would be nice to get rid of
> > > it but unfortunately I don't think that will happen in the foreseeable
> > > future as there are a lot of existing VMs out there with older SW that
> > > still uses this interface.
> >
> > Yeah, but I think it still justifies that the KVM_ENABLE_CAP API can
> > enable the hypercall but not the I/O port.
> >
> > Paolo

