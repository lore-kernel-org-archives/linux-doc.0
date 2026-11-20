Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198286;
	b=QEKeIJgJ4+nOBRlfmv3hIDPfFKIJho0FNgN9Xdbr92bx7QUv1JX4t0fD4ncOEVz6+8hm
	 iGEjXZSAM/WxwXcl/dUCeh3dYf8EVK/Mo37JyC00adxOdkPJo92NwyPg7nWOTvsiNL5B2
	 SkwIYXmTRJDQZKf3tN6XYibEHuP59JoxRmHeZLBn0GExRCVfEJ9ByhMZJv5qtbeHSSYg0
	 5GK/QrArM3AsrL8AJarbD2kSOwqFe9QTUEcbhiVZgadbwKNiq16QZfOYkQ3epfANQm5DT
	 5Z5+YY0WUVrpfQN2Ri+vdZEG/BO0tCD4+nF/hbQj+xpOm747L8PgxBPqnike5UzOKLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=JDzbhiCoFBsB1LUGSE+FNJ8fs+B+4L9p62TVlpx0yJ4=;
	b=2xR+uIcS9+OvMSEDo5F9LG5VtrdzADaG2Gl14l3v3bxG3u3bqM7PL5yi6q8WjqQZHWGN
	 Ua/+ANNNYvuKEGAHy2ok2NF1sj+kP1F6DltHgWdRTzYNrF7SMSwlxbXD69+9bmF96IKUx
	 BxbrTE/7/68uqdNlVY3wDdHatfObP/PHz/EO0tXLC+paZTIWWM1ZzvQsA0/Bwo3thRryS
	 dYB4vQut6swgUdDl5YuWLBw26ctfX2DGGAnYLrOVDFX593SXIVTQ65NO4l5G+jVj5F4c4
	 6gfaHZw0l5oADunOijlvnIgquI0462Bjs5sZyIAvLY7SAui0F5hOJjsrHqu1+tUymmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PVGHrCoa;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66FE607A0DC
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 18:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D66FE607A0DC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PVGHrCoa
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdd48746a49so785253a12.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 10:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795198285; x=1795803085; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDzbhiCoFBsB1LUGSE+FNJ8fs+B+4L9p62TVlpx0yJ4=;
        b=PVGHrCoaAP/5w1paicQ+hrt9379ckz/YstH15fDT/2OfPNc3NuS+VgVBK31Y4KWR1c
         6PEILfGm8mXVSYnE+ShXHiGg2+cjwadNYr6CVRAtBkojKCy3wAzMBHiN/hgp9Fr8I0rw
         pVTVrnraiWylu9/TACtXKP/yfxDi0m6zABmX4xVo2kPJHlkl/y54aRsSc9U/9fMEB2PJ
         esMW2rw0ckWd4dJpkMIpx7R4IXIDSCQJYl5yEpK1fzu07+gEa1XoH+hwVcUZ/VsnRp4j
         ChOPqNE4+HHfBFewHGbf5rwxwTNCY+3Zt+DtgYKz0OqIEnlWRHpodKCpTGesETGHl6Vc
         6OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198285; x=1795803085;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDzbhiCoFBsB1LUGSE+FNJ8fs+B+4L9p62TVlpx0yJ4=;
        b=kqf8Pr3m31BjMDJGJz5tHz5zkCWhvPO0uo44B6Ag+hmCEvOD97ReLfOytZ8RdFm75g
         KfvISsXmTedXC4PecqP/uSi60m13aCW95Vf1d8EkW7FH6/7qtzd002Uli+tcX6VC4i+W
         jyHFSFgJp8XjOrtI+BU4sS2QkycMunt1QPkFh64oGTOzVaxGE2pnl2GZN7Rci5hJFY0L
         GpdaTUM9GHrpRCBLFM4E/oRks6/U5tpLD0W0oMwTOMkox8FeUtvj1+XHkIbXVc/KZ3RA
         sEcf6F8YYSLAMI+GkZXW4so8d47d7aV4uUJ6OAZ0ez+UYiw2bqNj36KOEjS8VCBDYJqb
         V3pw==
X-Forwarded-Encrypted: i=1; AL+hErF66NQSsdsbM79Fyh0LzxKwFQKdDYUDy1R64RpvbWqqR5xiQ7qtZlv5p9hAtTJqdPrM3jSKpks9Epw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z+JF1PbVKhFOd4ExHZ1KpHNBAfqysuEJMODt8AHqm/KA4eXo8
	oVJZ+o0cEIC7vKUvRkpC8xRuOC4Zb8VD1Inr0wITVessVwrHq5ABkaldZf2mTcKHR3xw0PUhT7Y
	1a2m76A==
X-Received: from plup11.prod.google.com ([2002:a17:903:4b2b:b0:2ed:e056:7a80])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf08:b0:2f0:59dd:4d07
 with SMTP id d9443c01a7336-2f059dd50f7mr8708795ad.38.1795198285056; Fri, 20
 Nov 2026 10:11:25 -0800 (PST)
Date: Fri, 20 Nov 2026 10:11:24 -0800
In-Reply-To: <5F8F490B-BC93-41EA-B77E-9EC108C09DBE@infradead.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113170535.79246-1-dwmw2@infradead.org> <avdEkNbqPWamMErl@google.com>
 <5F8F490B-BC93-41EA-B77E-9EC108C09DBE@infradead.org>
Message-ID: <awCNTITOOiS1JEod@seanjc-mac.roam.internal>
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
> On 13 November 2026 10:10:40 GMT-07:00, Sean Christopherson <seanjc@google.com> wrote:
> >On Fri, Nov 13, 2026, David Woodhouse wrote:
> >> From: David Woodhouse <dwmw@amazon.co.uk>
> >> 
> >> KVM implements a fixed set of Hyper-V hypercalls and fails every other
> >> code with HV_STATUS_INVALID_HYPERCALL_CODE. A VMM that wants to
> >> implement more of the TLFS, such as the VSM hypercalls Windows uses for
> >> Virtualization Based Security, never sees them.
> >> 
> >> This series adds KVM_CAP_HYPERV_FORWARD_HCALL. As with KVM_CAP_XEN_HVM
> >> and KVM_CAP_EXIT_HYPERCALL, KVM_CHECK_EXTENSION returns a bitmask of
> >> features and KVM_ENABLE_CAP takes the subset to enable, rejecting any
> >> bit the kernel does not report. The first feature,
> >> KVM_HYPERV_HCALL_FORWARD_UNKNOWN, sends the hypercalls KVM does not
> >> implement, and extended hypercalls in fast form, out through the
> >> existing KVM_EXIT_HYPERV_HCALL exit, whose format does not change at
> >> all.
> >
> >I'm not a fan of fowarding unknown hypercalls.  It seems like it would be quite
> >easy to end up with a mess where it's difficult for KVM to implement "native"
> >support without breaking userspace.
> >
> >How much code (and ongoing churn) would it be to add an allowlist of hypercalls
> >to forward to userspace?  And then obviously require userspace to configure its
> >forwarding "intercepts".
> 
> I'm following the model we used for Xen support, where the default assumption
> is that we do everything in userspace, then accelerate only what's absolutely
> necessary in the kernel.

Oh, right.  I was worried about people getting clever and abusing the Hyper-V
handling to implement bespoke, out-of-tree hypercalls, but that ship has sailed.

> Userspace can opt *in* to having the kernel support certain hypercalls, and
> later patches waiting in the wings already add the in-kernel VTL switching
> enabled via a bitmask when enabling the capability. 

Oh yeah, duh.  We need a capability either way.
