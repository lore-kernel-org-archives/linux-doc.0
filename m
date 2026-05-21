Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C6B33EF
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 22:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779402626; cv=none; b=NVPSAl0je2IwSPapET6tc4InKZ2EiakgodPq6j0Me8j3dz3+6YQqU2f5G92z6D4qdHVZIuCrXX8+/p3zHG9FzCuDK/EmkOTawZbFsOo3CWTlgTgIlweN6QnSuysxkzjgsJwP5dDQpAvyoWPHH7SSQw+0u9X7rl7Xo37o2zweqB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779402626; c=relaxed/simple;
	bh=rbflla7xle2oiRwHeYhfStYOMc87R2Q835q8UhKjKro=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hx1SN/+0DpU/pKYVWQ8nqSoKb2V9Zi2vEsNETkLQE+Y70FgaO3+LlEFLqNHyRErItE6QFVtfxSJkJVVrHJm4VWIIHphE0Cx7fWab2TVSZekmm+cys+jwUUVFjIrP0ii5itqch1Vqf5rpU5CvYkGrsAo15Ayjn37L2Im4TDvKB6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dsQARqOb; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dsQARqOb"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3662668b825so13113635a91.3
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 15:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779402625; x=1780007425; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+mwj630vVwEqi8mq4SZZW5tTSWOGwfC/65sZINb+5IQ=;
        b=dsQARqObuEFTteBeD8EZZkmR3mR+BaeWTW/5N3ij1iMrPuqwmludgo8bgkkq5SjjaG
         gXYtYxn5OsFs0TWqfUUa4VnM/nT//ipCUv7z6Bj/T9NWxXfshSqhP4Ba+xzPAGJZo6Zm
         Bixb6NOMzNRDOmECGLQEzVOWlE2xyWFnptm26uNZTkbQzAWCRzOYIglo8BkCfWXGdNtl
         I/UdX7C79e9WoMPoJrNDWLSR8PnVWMFFAt+AaRcWz1faZ3Ngb93adR0OhUovagzkwWpv
         b326ZDKtiJ2GoZuWlK144sVkx3z9MyeYh6IkQ3sxq0XjvTTzdg5yc0zu8w+ImcMmDDb0
         ldmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779402625; x=1780007425;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mwj630vVwEqi8mq4SZZW5tTSWOGwfC/65sZINb+5IQ=;
        b=r6U5Q3RFE9Y9QMiu8OgVpcOqr5scmOrsCwCwqxQtQMsNlESGv1TDPuUZ+cafFXagr0
         WkHBFFXyL5wlR24LiOCXlJbA6j75GKaIjZU9mBSbdjbgI0n0PE23gjbxMWvvIK1ftua/
         GFn/ySNVQSKEKxKqtr8LgaaOCtB9vIRqgKah8mJhzrQLDfVE1KeglrNF/PbymSK3TZlG
         165FhQcApGjRGzR+SU1ZR+tPLe4s6knmMnJGJnWn3NV4nzsiG+60zJSlB0aY+5hEANqd
         Ia+tw5vxv8WLl3Ww46u4xNNuAo6cBx1ooMqkHNmdWSuxb5VwrUB+6ndl2pOwOW4uxelP
         jxYw==
X-Forwarded-Encrypted: i=1; AFNElJ8SczI2n3SqY0ouksVMzlOf8rspwNNQg/6Sb0j9PCp/cCJKKxAZHOoSO0gjuAdEpMG+laBAmYC1++8=@vger.kernel.org
X-Gm-Message-State: AOJu0YysGB3zlZa+vBdd01DbnL4IxrbyDxDid+aQnFmEVg5GtFl7UQqr
	JJZzVHZYj97lITxEzxTfAb5SqnO9N09OIIrNA38bNJwPK3Ahrq/d07c8Y0SVvxcq/DRa52pw//o
	l5UQrTw==
X-Received: from pgbfl15.prod.google.com ([2002:a05:6a02:50cf:b0:c80:1541:9dfc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:430e:b0:3a3:a55f:407c
 with SMTP id adf61e73a8af0-3b328cad3aemr900407637.16.1779402624505; Thu, 21
 May 2026 15:30:24 -0700 (PDT)
Date: Thu, 21 May 2026 15:30:23 -0700
In-Reply-To: <3ad6cd109480772ade3c11f23b9c1d7a9855d67e.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260509224824.3264567-1-dwmw2@infradead.org> <20260509224824.3264567-28-dwmw2@infradead.org>
 <3ad6cd109480772ade3c11f23b9c1d7a9855d67e.camel@infradead.org>
Message-ID: <ag-Hf2liLSX9q0rS@google.com>
Subject: Re: [PATCH v4 27/30] KVM: x86: Add KVM_VCPU_TSC_EFFECTIVE_FREQ attribute
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

On Thu, May 21, 2026, David Woodhouse wrote:
> On Sat, 2026-05-09 at 23:46 +0100, David Woodhouse wrote:
> > From: David Woodhouse <dwmw@amazon.co.uk>
> That does leave userspace still needing a way to get the APIC bus
> frequency, to populate CPUID. So maybe I'll just make an attribute
> which returns that as a single value.

Already exists, KVM_CAP_X86_APIC_BUS_CYCLES_NS.  The TDX architecture decided
that unconditionally telling guests the virtual APIC bus runs at 400Mhz was a
brilliant idea.
