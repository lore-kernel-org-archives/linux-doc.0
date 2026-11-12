Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794509591;
	b=Y2+STwPmDrqzRRz+1VtivyDCTkvq+3G1/Yb14S8nucZrdc9BWjV+CMqxhTQe+xo6Y8cv
	 4bV1w3Qp3DLFYANrkZ9ZfxgmWpPGKuWCuPZFt7y6nv2PPQu6rvM9N8NvdX5uqp+GMLRBI
	 w6QECJF+/k8C6qWUKwIjsNlxMQpl/hQkL9F8nazNjMjG45s9ZMe6ICTgLhEzRmo0kVosU
	 4mYBbp8VOlvFWr0IV0YBIBlu+0+vaa1TcIFiQlmSoOZ6ocQpw0bB+NnSZ3FjiDsAdeaJp
	 Ri+J57zTzOb5T+8APN+tBL4lWQZbJcX0AX+JSfqiBqqR9ftE1V9mHjbz2ZOI6KGPTOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F3Tw9p9m98nVDXDhiISUHwXl/bWsyTWQBoH+O8XaA5U=;
	b=dQntlB6dYdWfYZ1otiE8CaTkIkKov6Q0LMOWxOKtTfoFTt6ciYH9hnlMeFrhE8J//Tw/
	 q1mFnn5tSmPZK1uLi4WD1Xt1squjUlY5bcnwMCSsXSEMBfbmvQEPHx+7kCT/3FnsZ+vEy
	 uzKSh0j17OSu27ZullFvMUr6mrddGal4nqpkKXA9vH8lSOp0fYP2YELklOjNcfpw1aVSN
	 ezA0eichstMcQ/GE87UOfCleWda+wDFoUP9JKCA17soaih9lR5r1L/RjUIoPBl0cKxdf7
	 IEqOLgCcqbH3jDsZrQ4x2u0OUV8sL4nbql/kEu1NBQI7y9gmJV3I4sikKTmEihRrVtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZrXABmQC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA06606A88B
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 18:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FA06606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZrXABmQC
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso718a12.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 10:53:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794509590; cv=none;
        d=google.com; s=arc-20260327;
        b=SmbFPWFcMb41VDNeRV7NHXGw95XnyOSBbBy05ZXQzfpCu1If8cRUp/Ptcf1pYwFMlR
         qh9fulFKPG0t/Yyv0N/EDj0l3b0rGPrzSC54UiaohKvScvRIbUxQFqUoQkAHOq7OXeMK
         YrzAvWxFbJ6Wv+nkmixv2cBGAIQG2SNmDYMH6t8Jh1z/C5trd9iWkrs3Vi+FQjZzALQT
         9ySoUolGZ/ua3CznzXUU5ZwquyZ0uivSClyP5jAFbmJbFl5IkSFs4ROvw6J5sF266hMJ
         1eiZL+IgwK12LpocO31p46IvZEqFQM9pwgom1ti3yg1uGyFCGcTZJmzp2lhCIjhyGt99
         XquA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F3Tw9p9m98nVDXDhiISUHwXl/bWsyTWQBoH+O8XaA5U=;
        fh=R7Z0fCf74L1sgAOvnqSnmBe/OXbuNI4wrlB3KIPTfqA=;
        b=IsvHuoHeQZY6EDLrXenH7HIXObsOI5mO6Kai+TkfCyMy+zheQQnFvQZpHkr5JPgfxs
         X3EtnKr5aqDDqZGxsjSbK0ZsRSx7Z/ePfxM8VE52KGw3tifqmC6I0Ok3gCFAuO9bqGYv
         okug7K5ksb+5CTa+uMLU5M00rP15nW19TlKmXL92sDJEv3FYXCmjatOwBwwgBjB9sVtm
         +czYELODHdeZ4PA1ZYkT2ZsCdwTfA+yq71k6tCHX4UolzsY77oB1sU1jFs055aL7KG0J
         vJIz0l1Wmy/9pZJrP3zatgwG862V7NXsvmzbbx2D05idXjiZAgUFr4WK9MNgoiCb42d2
         uNSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794509590; x=1795114390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F3Tw9p9m98nVDXDhiISUHwXl/bWsyTWQBoH+O8XaA5U=;
        b=ZrXABmQCJ3w7fpvZ4karrFrjqd/K0rpSVTywmX4rQzivW0jGhC03EBEcz4x1rZkt8Q
         xZcs/BuI8zU80KvjKJSKuYtuGN5mjG+fjxgyYY1zzVeneVge+I4spJNx2yu2QvsTT+3z
         TvPQqMAGvHx2vUpd9qW4OU+W5Fry9rR5vNkLu1Dh44916sm5TAsfKFS63IqtWkHs77h7
         R3bLVHvSuDoXdeOb4Sqv80Gbk7hHPfx1g7wqwZXqG6wIyCH+p+vTXKO0uHUqslp9hEqy
         9SA57J0VwZZvrWjkKS5FzZu1G0+tHoMzzkIWcR9t7JMe3BPtICsD7vMYb+uUx9TrZQEC
         uAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509590; x=1795114390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3Tw9p9m98nVDXDhiISUHwXl/bWsyTWQBoH+O8XaA5U=;
        b=kYo0/wJP3E7MKTtX9TlHBaHBSQ30DrmASJ7TsKpOoHleM5MAJk9NeOUo+wqsYKH7Vs
         O7lP7HUhxHFGrsb3FbxYy8fmdSjDxjLZsuK66FPH/L7+b9ddBXlefq62Dq0eGDys1YUk
         ftFmcn6NvVsMQXaJwPjoVd0fAyrDgN6RdJhhyFX/PdfVZGMR8tYagrkzWpS2z0Ubg6Lm
         7K8m6g0V7GaCk/4Ecf3L4waLTDzeL+6vcJh6MdA5/2wKwkLc0sfvpAijUjuKyGl4UKJL
         IqyAiix/saPc65OFeOOTEURiwShr1UxbcY4o/e5ReFS3ozmM+hr3+mTdI0MjHMW7NVfO
         8E3Q==
X-Forwarded-Encrypted: i=1; AL+hErETHu5x5uc3YjWxQioSqbYP9k3IggPxQc5yD2kgCz6XcSeQVs3gB8zp44Qusxfj+oMek7mXEPj0GX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kWoHAKt+D9j08JJoD98SCRTPEIbSx+6pYQbYUDF64ikdP5Gzr
	nSZrzjtsm4p3V1cFGGPIHH7auLVOvrd//Dem6UF9hjOHyHdiuOgYIYdRBaUgSZpET1PJ+XEEBK/
	TBggAfVwTdMsZ4oVwEns4R3/figmVp+g6+JQbaVNr
X-Gm-Gg: AYBFou1DI8UrBUKuODoJEOgnTiu9sk8OUBh6P8HnNIhE8PDLxjq1g1vGP9C+6f7Y8gu
	ol+juBMS4ehTPT2kTD13+/OUGTLGkuul1YswimVoDnWQkssSz+4SeoZTeB5VqiHdoHNrcz0MlhY
	8aj+nIR/XjqtytpyVCENvD7qCtZ3kHrxnsqYghcPMNAAVLQV5wigWmt4O+kydN5TKAV+doxMslV
	ciRDcZTMOebhNJ9lIylcxBHjcWhiMeoYG/MsVSHxLwehYXYkyhHP4K0mroU6TeJ576R4jfelSEg
	Iz5lNe/7DHbGqjE8CoWrySZt9bhJ4g6Z5L20uqoExVvehdnCxmQhSIbq3c8c3mlIVyLpKu+asSr
	GabD5e95Zd9wtEqEnQ5mDQ5cEVwXAbo0Qc0/K2pKTOEORJA9Nod+FQE+MkRGvzz+ylfNIqaVR
X-Received: by 2002:aa7:d85a:0:b0:6b5:66cf:eaa4 with SMTP id
 4fb4d7f45d1cf-6b7c278a457mr7058a12.0.1794509588955; Thu, 12 Nov 2026 10:53:08
 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <90467782be23b83fd3e9a6afe2f1d2149eaf9db9.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <90467782be23b83fd3e9a6afe2f1d2149eaf9db9.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 12 Nov 2026 10:52:56 -0800
X-Gm-Features: AclHuK_9mvODzBgQFtLS_Gtq_h9EB7DHS-Em7YexSsSAbzFwFzuvZxGvVdZTuHU
Message-ID: <CALMp9eTF3WtzGGaV=sCYLqm=8oHNbqg2pYUr_qtcXJaAKjc9bQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] KVM: x86: Forward VMware hypercalls to userspace
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:05=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Add KVM_VMWARE_ENABLE_HYPERCALL.  When it is enabled, exit to userspace
> with KVM_EXIT_VMWARE when an L1 vCPU executes VMCALL or VMMCALL with
> VMware's magic value in EAX, and let userspace complete the call by
> updating the guest's registers or by having KVM inject #UD, #GP or #PF.

It's not clear to me if this paragraph implies that VMCALL and VMMCALL
are supported cross-vendor. If so, it may not be true.

In arch/x86/kvm/emulate.c, group7_rm0[1] (VMCALL) has the Priv flag
set. When an AMD guest executes VMCALL at CPL > 0, x86_emulate_insn()
sees Priv && cpl > 0 and injects #GP(0) before ever reaching
em_hypercall(). The other direction should be fine, since
group7_rm3[3] (VMMCALL) does not have the Priv flag set.

In any case, if cross-vendor hypercall instructions are supposed to be
supported, you should add them to the selftests.
