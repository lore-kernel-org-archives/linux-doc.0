Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A753A89D5
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 21:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768427987; cv=none; b=DFFx3eQjEqly2x6eSJWPS3YfiiyL1VkCmyVx/QG9KofZIWbrLeemK0QVxblHAK/j7/SMq1Ibu/QePXWrKYDvf3e7hmwMeiyhmov37Qms9DqJjsUjrZLh1R24/gu2Xt+b6eSyon02HhbnVsw23PJNjvG32tHla4XI2zLT75Z/pHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768427987; c=relaxed/simple;
	bh=tO0znVmDXAymHNCdzPnVwtYP7QD1kxrOykARoYLTeBE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tsuJpg3qfmIXgUMi7k0yyMKAp95O1/btra1hg4tTUtqsXLjohpqmnOPTof13xHVphrU/jsduDpZDgFIHGDvMlofhitbj9MIJJFJajo7IwuRbKkxgMxJ/GniDMHHEES2keSXbKY6fDd9IaDUreA2Up5bvMEGsKBRQLVPt7BRS+qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hSW5Vy+S; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hSW5Vy+S"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c52743b781eso156204a12.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 13:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768427965; x=1769032765; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wc5IYW1fIu5cyAHFpaj29f0bgcaP13LBp3YapifQT5w=;
        b=hSW5Vy+SGhQcYxbEd5IwbQss4zcbV4g2hELRx9Isus+w4SC0+K55AFsf5LThNPaD0z
         iX0qvcGmeRXiOJHpd0TW7z1fwfq5SfuIRL6IAQGWkzrkXFg++BDcf65CDgRNUQ13HqO/
         Ucr/ZIMFRzYZwT+qn1DZpZAekxqBeeV/NLKibGnhHihyKDKUNxvs2+2pSTVoI6e3Oxuu
         HJVB2ASDVT69USBw4+bEkh1ThVcyILL8IXhEyzD1tgkNsx2EZQC4qtjS1fk+LMe/3e7R
         /OIouO1efH52uxgwQxriWCIRsWnwj+8vUwGNZdL5tNVyvn4y5ATbVkpFPmKnxpDZToX2
         xQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768427965; x=1769032765;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wc5IYW1fIu5cyAHFpaj29f0bgcaP13LBp3YapifQT5w=;
        b=CYPiOSjyWLoX/qljipHJrZKWU08uO6cBqndysRRyML495CpbxRMDsuTMenfUSqgUpJ
         paw0Z+rupW4uvBzPU1yUufhoXEpuPg7tZGybGJGjnnvoBS912HdsQIJ+p5JyA2F2kmUK
         e5TaHAO/Bt1tlgN1dSR2LRB0xjWwtQGZVKQCoYLKco+wFxuag/OQwtcr8U2qtbYFSsZ3
         AUsgGIWU6tBVxkSBJD4vHxFPhHA61566+0JZ8K2bpNhHz4it7sdkSv4IMY/FinjR/JgU
         QIf4QXidZRXPimUjFgLbsunT2QHA87ab/MKC6B5IIHe+UXgl/GMojK6YCMSzC+k6WWnj
         va7A==
X-Forwarded-Encrypted: i=1; AJvYcCV0ozQE8AMwFo0VIREjZB2696FbBAUKWfWKYkexcHt8w1L0wuZjJ5OYVp4HKq5FQGecuxMN24tBXWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV83gASSzxORMNmyNOnneOpsDdmTt8i7N99MgNdh+5lYhw9XKC
	objGjr0DbJ9HC73+BR7lU5PTBnsxTnjBziOehooPYh00L7juwN/OHs0TqPTv5Qc7q2b0qeEmdkv
	yypkmLQ==
X-Received: from pjbga22.prod.google.com ([2002:a17:90b:396:b0:34c:9f0b:fd7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:6d0:b0:341:6164:c27d
 with SMTP id 98e67ed59e1d1-35109091a6cmr3714526a91.3.1768427965337; Wed, 14
 Jan 2026 13:59:25 -0800 (PST)
Date: Wed, 14 Jan 2026 13:59:24 -0800
In-Reply-To: <jf2zfqo6jrrcdkdatztiijmf7tgkho7bks4q4oaegiqpeflrkj@7blq6f5ck2hf>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250901051656.209083-1-manali.shukla@amd.com>
 <20250901052146.209158-1-manali.shukla@amd.com> <jf2zfqo6jrrcdkdatztiijmf7tgkho7bks4q4oaegiqpeflrkj@7blq6f5ck2hf>
Message-ID: <aWgRvCdPsAFHRwcU@google.com>
Subject: Re: [PATCH v2 03/12] KVM: Add KVM_GET_EXT_LAPIC and KVM_SET_EXT_LAPIC
 for extapic
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: Manali Shukla <manali.shukla@amd.com>, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
	pbonzini@redhat.com, nikunj@amd.com, bp@alien8.de, peterz@infradead.org, 
	mingo@redhat.com, mizhang@google.com, thomas.lendacky@amd.com, 
	ravi.bangoria@amd.com, Sandipan.Das@amd.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Dec 16, 2025, Naveen N Rao wrote:
> On Mon, Sep 01, 2025 at 10:51:46AM +0530, Manali Shukla wrote:
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index 6aa40ee05a4a..0653718a4f04 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -2048,6 +2048,18 @@ error.
> >  Reads the Local APIC registers and copies them into the input argument.  The
> >  data format and layout are the same as documented in the architecture manual.
> >  
> > +::
> > +
> > +  #define KVM_APIC_EXT_REG_SIZE 0x540

As discussed in PUCK, just go the full 0x1000 bytes, and do:

#define KVM_GET_LAPIC2            _IOR(KVMIO,  0x8e, struct kvm_lapic_state2)
#define KVM_SET_LAPIC2            _IOW(KVMIO,  0x8f, struct kvm_lapic_state2)

> > +  struct kvm_ext_lapic_state {
> > +	__DECLARE_FLEX_ARRAY(__u8, regs);
> > +  };
> > +
> > +Applications should use KVM_GET_EXT_LAPIC ioctl if extended APIC is
> > +enabled. KVM_GET_EXT_LAPIC reads Local APIC registers with extended
> > +APIC register space located at offsets 400h-530h and copies them into input
> > +argument.
> 
> I suppose the reason for using a flex array was for addressing review 
> comments on the previous version -- to make the new APIs extensible so 
> that they can accommodate any future changes to the extended APIC 
> register space.
> 
> I wonder if it would be better to introduce a KVM extension, say 
> KVM_CAP_EXT_LAPIC (along the lines of KVM_CAP_PMU_CAPABILITY).

Please figure out a different name than "ext_lapic".  Verbatim from the SDM
(minus a closing parenthesis)

  the xAPIC architecture) is an extension of the APIC architecture

and

  EXTENDED XAPIC (X2APIC)
  The x2APIC architecture extends the xAPIC architecture

There's zero chance I'm going to remember which "extended" we're talking about. 

KVM_CAP_X2APIC_API further muddies the waters, so maybe something absurd and
arbitrary like KVM_CAP_LAPIC2?  The capability doesn't have to strictly follow
the naming of the underlying feature(s) it supports.
