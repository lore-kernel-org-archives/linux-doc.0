Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CB53E49CF
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 21:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785880749; cv=none; b=qZgfAnEf+5Eaa9PAQZ2CCHIUzOWDSJGILG12ImaDF0RZ8WIHcccjtxOU7NVbMwNNqS3LcgwrnWAo0wQGqpo5heqn/zWN+3Rcj/jH3e1IZudilvQ/hjtoyRdSUheTGZgJ1+29xZpazQEDwx/j2XAHhA2uLMGZQ+9S2uw0Z390ck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785880749; c=relaxed/simple;
	bh=rzsm1Og1+Pro9WxLmsneo1BIFN8FVoLBc08QmBOsYPI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RVA6qcQpSV32VMiVTjKQb3VROYo/lHpIFE2WhRNUkO+jQtUT5hDZ6RKq4IBf7la8A8cRKzuGUEXnB3rq04Kw3Digz9v9CiedFfNoRhcfCQQoqoKamYqO9tHx5FHzGqCsT3FHVw2Sz8lGbDuXUKODKKEtN+Xl0iSzsNg/p0elAAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gbPwu/WJ; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gbPwu/WJ"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb835525b10so276307a12.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2026 14:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785880748; x=1786485548; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dhc7N1hQKet78fMxmoZ11biZ2HS+JiXgm3DEUzu8sT0=;
        b=gbPwu/WJroncOlA3k3yb7rFCo0IB81pMTChBk94ikKSzfNLRYpvdqORBT3Fu6YoCny
         bkRY+fONrNwQF1K9Wis0vUczIdxyMimg02i8Rt6gK43xMHM4O6lDo+WASlDrdOM510FB
         hgFOEFkFHCEfhu+lFBgeanXSDDErkfdoYsUe6T0K8YDP6910hTWB+U0iYO/PwLOptNFe
         2w2gjqRo1xpvawWsX1KoEr2OyILMpvMwW4Anh9m0eYUgZ2MEOWMNTrkU/STbVPg1sDEE
         W5ddEiOU9BquHurXkx4Gc0SDTUv8NUKd/lkbCRmI0b00J4A38PKCG7fiUG1GKc1/bbrJ
         r2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785880748; x=1786485548;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dhc7N1hQKet78fMxmoZ11biZ2HS+JiXgm3DEUzu8sT0=;
        b=PQB3WY612hnaR3Tm6WW2Uu/ej3wC+3RkLupEs86ywuHEs3xaInCTtxP5p5W/liIldP
         Gb5F73rBsacTdZdVPYpCcELPBzAcvSNv5Xwlr207KD6NA03asc4p3pTUi3QCpXtk4qZS
         20czeV18uF6/+NbdtHaayxVnvbK18EaOdE0uAzgF/DhDEufBLFdjdb1SqcfJ6MUiuqrN
         LBxaePTGRHX2zGivemfsL+iGXHgK51/hGYKshwrGKPsJHOjKjgNHNSugLDj0bu019DT2
         ufnbNgidJ/Mh+DR3gLYqQdcOsTkxJp9LSLVmtoLkxXuK0Ntcwo7tRcJVOkmkrBuxpZ91
         nBpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTS+MAxNPBVrsCWtfLzwOqPl00Oc1V+NUbH1peXfEnJdvws9l7jUpQxvX7dBHrIqyOmm5lpq51qS8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp/v30XXVjQReZ9geHPu/JRVdRaAizUocSkQvZtvgl4E++bSt/
	c72LCT0YFiR00tvLd0ymce+uV403xw6OPT2MYVrgGYj//5il56wvx9YLzPi2qthyD71gKUOcQct
	mqZYrJg==
X-Received: from pgbdv13.prod.google.com ([2002:a05:6a02:446d:b0:c9a:3646:2398])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:998c:b0:3ba:cd5b:3dc8
 with SMTP id adf61e73a8af0-3cb8603af30mr1757125637.31.1785880747446; Tue, 04
 Aug 2026 14:59:07 -0700 (PDT)
Date: Tue, 4 Aug 2026 14:59:06 -0700
In-Reply-To: <anE4GtMa33nz7qdK@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <178552799129.2700794.10181439022561913222.b4-ty@google.com>
 <8b90851f38ef5b10cdcdc70e7543bd6b0b5e2773.camel@infradead.org> <anE4GtMa33nz7qdK@google.com>
Message-ID: <anJgqpOJGPjLAqYe@google.com>
Subject: Re: [PATCH v6 00/36] Cleaning up the KVM clock mess
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
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 03, 2026, Sean Christopherson wrote:
> On Sat, Aug 01, 2026, David Woodhouse wrote:
> > On Fri, 2026-07-31 at 13:09 -0700, Sean Christopherson wrote:
> > > Applied patch 1 to kvm-x86 clocks.
> > >
> > > [01/36] KVM: x86/xen: Do not corrupt KVM clock in kvm_xen_shared_info_init()
> > >         https://github.com/kvm-x86/linux/commit/3d4b20b5a7df
> > 
> > Thanks. Could the clocks branch be based on something that includes the
> > timekeeping work from the timers-ptp-2026-06-13 merge (in v7.2-rc1)?
> 
> Yeah, I can rebase onto a 7.2-rcN.  Y'all are likely the only people that care
> about the above commit, so a late rebase isn't a big deal.
> 
> There's basically zero chance I'll get the entire series applied for 7.3, but
> "Use ktime_get_snapshot_id() for master clock" is at least in striking distance,
> so there's no reason not to allow for the possibility.

New hash:

[1/1] KVM: x86/xen: Do not corrupt KVM clock in kvm_xen_shared_info_init()
      https://github.com/kvm-x86/linux/commit/633d7652f80f
