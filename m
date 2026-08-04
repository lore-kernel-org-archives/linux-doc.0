Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ED03AE18C
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 23:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785886700; cv=none; b=ED5RPvqh9Z06ALHxRr9pCcYvwIuVSp78CXHin9LWbvfUmaVZ8oA2CWuqmWv51GioFm3If7iuf3hsifRKqiNOQj4sveDgmCRw21MjN1W3cr+zNrvrIbhBlCgXxRngLskdy+mcYYvMQ5IQCR9s7D5D85ycO2cmiIfD0Mp1RW6arwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785886700; c=relaxed/simple;
	bh=7nykWB6HWQWBtzXDzLlBfOGF8GccFcz3uG03qRHgn6o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NvJU2osb9CJ5kmDS8jDYoJrM6BKRmnKgRUEVl3FKxgOA3xP5YTK8pyHXJI7WXhFLvBnnHQn2VI2X4f+k6FEj8RbyIy8v6qVlMq8/o1pVEZU/mC++K/mx8ybHMT4RaDM9wJzYW2mqMA+WxHeHfuH+3LFTAYNdkm8uKEKAVcXVCnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tWRJ/czV; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tWRJ/czV"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e048a801dso448130b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2026 16:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785886698; x=1786491498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MCQeULnuxyizouUVujp9ZRZMwHTWkFpcMFYeBXRE7J4=;
        b=tWRJ/czVIciPcCnKqFPzTC2zDIy7WTK03oJtlTjFhoiOqM5WI30VD/kecpcTM8u4f8
         V8ACH55V+Ou+T7MzlXw9ZJ9zbdZbLzhlo4XRs0EOIgzsKnAIK4gFsPVHMwY5RLR4kDM4
         vr2/rg9NtBqTTCByHQUAY3qWiwop5cjT12oKQVAsvql11/kQp0lRFmZfxLOPG7sdFpSB
         o7JNa5ADEq7AoiSp5k50CUD/GcE3aG1CsALrXs9mc5uoRX9R2g1JtLOQqHGhTvQwVeL/
         SCmtUIq5hqLGzO9y5nk4n3C3/xXPkX5l2r5GWdqRAANnCXUHTk4GftatoOGU8+AJltHK
         EbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785886698; x=1786491498;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCQeULnuxyizouUVujp9ZRZMwHTWkFpcMFYeBXRE7J4=;
        b=c4FzDCKgaHvQMMwJKOzrlHLPeT2EJIemJ3CGGWbI8tHWDWVCrc8oIBULnGYqhvN2vw
         x/usdX0MGIMwn04fXERctb64z8N0h/kmG4Gh3McaQTg8IxAPLpm5bxLUWd6RHV2r+ut1
         VY9+8QAwkcJf4YYdWDEgV4B0F9+1yPxWm/eXf3Ax00O0h/poSWEew2a6mq3xCbhE1Fgq
         aoCWJLVbrpGxig2MMUoiXGD/zHuzTwkGQfE7hWecI6rRoVMKuGTdXkd7Uu1bf82okz7+
         RC8FBqMMh8iBXwb0Psnyi2grU6YzM6KmcorU+60x3LdwxDO0QBDXkwzAbdDU4QGQ3iTs
         b7Aw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3S4eOWLax/xj/JE1EqqqP71ctEEPzXMmlxsPdxcwtk2+kaoKmvmUwjIrguuz6FaLyY3S1XtpPx1c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyobu2wUflomaKei0Qvl5O5lKiOZEhBooxbJFkqisNGS6Ho0qC7
	Cud1yzKWSDJIymM7pPRJpRKGNyo2xcx2rrYwzKzeOEqCFN8K9n8/Cr2L1VD56iSD00YH/JEPPXK
	mAZIDUQ==
X-Received: from pgig16.prod.google.com ([2002:a63:f410:0:b0:c92:11a5:bbce])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3a15:b0:84a:60a4:2651
 with SMTP id d2e1a72fcca58-84f2dfc53efmr1961102b3a.6.1785886697620; Tue, 04
 Aug 2026 16:38:17 -0700 (PDT)
Date: Tue, 4 Aug 2026 16:38:17 -0700
In-Reply-To: <d2d98dd31718eb925ae44b0eceb325538a8174ae.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-32-dwmw2@infradead.org>
 <am0upFND1r93HPxq@google.com> <d2d98dd31718eb925ae44b0eceb325538a8174ae.camel@infradead.org>
Message-ID: <anJ36SBzN7HL4A2D@google.com>
Subject: Re: [PATCH v7 31/36] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
 accurate KVM clock migration
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 01, 2026, David Woodhouse wrote:
> On Fri, 2026-07-31 at 16:24 -0700, Sean Christopherson wrote:
> >=20
> > > +	/*
> > > +	 * Allow for a discrepancy of 1 kHz either way between the TSC
> > > +	 * frequency used to generate the user's pvclock and the current
> > > +	 * host's measured frequency, since they may not precisely match.
> > > +	 */
> > > +	if (user_tsc_hz < curr_tsc_hz - 1000 ||
> > > +	=C2=A0=C2=A0=C2=A0 user_tsc_hz > curr_tsc_hz + 1000) {
> >=20
> > I don't follow, why is KVM restricting what frequency userspace can set=
?
>=20
> Userspace actually sets the frequency with KVM_SET_TSC_KHZ. What KVM is
> insisting upon here is that the input to KVM_SET_CLOCK_GUEST is
> *consistent* with the guest's TSC frequency (within a little slop
> caused by different host TSCs).

Why does KVM care though?  I know some people hate that KVM's uAPI is permi=
ssive
to a fault, but trying to "help" userspace often ends badly for everyone.  =
E.g.
what happens if userspace does KVM_SET_TSC_KHZ after KVM_SET_CLOCK_GUEST?
