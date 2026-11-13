Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589843;
	b=qPlu1Es5Z8wSMOG6O1sZ5jdFmPrexDL+2lQN6L0DwILQBo+s2DhN0z5wHea8Pw3JIWuT
	 PoAXkRH+F+LBlYhDuGof3CKtx5vM8NFaMZnBqOYaDarmlGsuvFoLICMTCfomWs7K8cmDG
	 c0UgPzh5aFBT14VoDaOCKw5QnOdYh2l2WlXjg8qlXB4BmXIgD+3xAfTCp4lR5G2WPX5cI
	 9nminV2LCiYWkBx/bWLO2yrzfCauHebahvKr6cCJSS5ZxpDlAwnQHISdNWtnYpnYFkVfx
	 0XgmOK41UGPjrXibqx+GPnGhhZmDL/ayUNltKa1AVoDUoTB8T1CiNYGCGxn/AZRzCmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=E0HYZnvoFY2cqYeGKLL4I6ESGkmMzyISge4rNBKOPnQ=;
	b=4JcaFx1yN4+refU95hWdAG62tdistowe+bjeAl7MiQOCYMMGM81IwcKufHPOv2tdKZpS
	 +shOvbe5TLRLZGpt9P0LsHbFTwweUOV58cXt/E8KQh2OH1r02NAnOsC6F8sRDy9PKWvpV
	 mSGfmaGLQpLD3wW6zUh7cFCpvp6eNbY+wdrQijjPDDOq2fi0/rydoZ7/nWAdxbO/avtvq
	 cCSMNRvHeGzXgH5xsduXMBvQs9t+9vOkbQ6Z2BC+5MNCMsdvLgZPRx3zTj1wxRjT7J4ZN
	 rDEyUnBMwemnQG95wwJEVDjeGJ6Qu+SL6ORZD0gLvKXN1odSax5gJ78xrd00Shq47OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ajpn1FZU;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A792F606A331
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 17:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A792F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ajpn1FZU
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb45b4ed6bso1250139a12.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 09:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794589842; x=1795194642; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0HYZnvoFY2cqYeGKLL4I6ESGkmMzyISge4rNBKOPnQ=;
        b=Ajpn1FZUD6fdphGL4f5vUwF219i7l5zDYRSDn5qpvopjTucfLpwhBi+V32T8AvbkT8
         RWsRiKmQHMtZ0Y4DXyBIIzisa4aOm9Kpqn6zXnFueVRXAfSBqYFfjwXDeU+cneX/ZUV5
         HefkxbOejcUXxKGiEy7KSwSP4IBU4fi/pKYMHUBYcv1mvmdQpwDaw3KHI/5S1lKhvGqr
         Aqh8AaNox3wkrdcHJzrvSIPrPnnwYPqODX7othykMRmXizjKVDeUsrh370Tsh+29iDXB
         +uM/wdIJpMXmJ6KUDCozEHrN42Uj0kEx3LPWxPBB1gb3KlpwfgJe+HUqqMPUhgl2ikGU
         KuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589842; x=1795194642;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0HYZnvoFY2cqYeGKLL4I6ESGkmMzyISge4rNBKOPnQ=;
        b=JHMFAEfzErysW+GeHT7Z6QfRztBdr86/KX4/OwSHkyltDzPrVodEIBYj4LmN6hOq2e
         1XoXdK10+i/8CLic1QLkbxp90bsgplSEi3OPsRTM8QAy3A0OnB+468vD6v2fNW5EcVG6
         xgvh14QCEqPvz6+Fne1dAqbo+Tdga6YPTaml9dnDNyS1tAfzKGd/JRzf9K91xy0KAY4L
         B5R2AFEREhYu0Bm7lPqjWNIJ3MGv84tAcdLqBcyrzbMQKsPGz+Hz1WT9yI1Q4FU6tnwF
         2yi0f2rBu7gRHJ/SD9eOuNuQO79CTRuoYqn78/5ED40vnGfwTIkngP5aJqv099j8T3Zx
         MuxA==
X-Forwarded-Encrypted: i=1; AL+hErGAqQm6mNkXl5gBeabe1SxNI+4YbZ1KCkEI0ZK22/A3AAxgIo36RbdBxW5rvPPGdnwFntbVVaZHu5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yQ8w+kl6jX0Wy92ii6vtUhLIz2r/AOgtVaFzAn53wd+zsSxxM
	OmPSol6SqmHkuACbe+a2Y/Lru/vvIIJUWq9Exc65+EZjyXwE+jt9TJQcj7GXInaOFwEV71diYdG
	pTQwDzg==
X-Received: from pgbda3.prod.google.com ([2002:a05:6a02:2383:b0:cc7:dd4c:a852])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a10:b0:3d3:ae50:97ce
 with SMTP id adf61e73a8af0-3f7a7bc23c1mr3448497637.27.1794589841765; Fri, 13
 Nov 2026 09:10:41 -0800 (PST)
Date: Fri, 13 Nov 2026 09:10:40 -0800
In-Reply-To: <20261113170535.79246-1-dwmw2@infradead.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113170535.79246-1-dwmw2@infradead.org>
Message-ID: <avdEkNbqPWamMErl@google.com>
Subject: Re: [PATCH v2 0/4] KVM: x86: hyper-v: Forward unimplemented
 hypercalls to userspace
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Thara Gopinath <tgopinath@linux.microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Michael Kelley <mhklinux@outlook.com>, Nicolas Saenz Julienne <nsaenz@amazon.com>, 
	Nikolas Wipper <nik.wipper@gmx.de>, Mushahid Hussain <hmushi@amazon.co.uk>, 
	Sriram Nambakam <snambakam@linux.microsoft.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, 
	"Radim =?utf-8?B?S3LEjW3DocWZ?=" <rkrcmar@ventanamicro.com>, Liran Alon <liran.alon@oracle.com>, 
	Arbel Moshe <arbel.moshe@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 13, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> KVM implements a fixed set of Hyper-V hypercalls and fails every other
> code with HV_STATUS_INVALID_HYPERCALL_CODE. A VMM that wants to
> implement more of the TLFS, such as the VSM hypercalls Windows uses for
> Virtualization Based Security, never sees them.
> 
> This series adds KVM_CAP_HYPERV_FORWARD_HCALL. As with KVM_CAP_XEN_HVM
> and KVM_CAP_EXIT_HYPERCALL, KVM_CHECK_EXTENSION returns a bitmask of
> features and KVM_ENABLE_CAP takes the subset to enable, rejecting any
> bit the kernel does not report. The first feature,
> KVM_HYPERV_HCALL_FORWARD_UNKNOWN, sends the hypercalls KVM does not
> implement, and extended hypercalls in fast form, out through the
> existing KVM_EXIT_HYPERV_HCALL exit, whose format does not change at
> all.

I'm not a fan of fowarding unknown hypercalls.  It seems like it would be quite
easy to end up with a mess where it's difficult for KVM to implement "native"
support without breaking userspace.

How much code (and ongoing churn) would it be to add an allowlist of hypercalls
to forward to userspace?  And then obviously require userspace to configure its
forwarding "intercepts".
