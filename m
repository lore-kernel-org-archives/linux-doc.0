Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u9sYNGK0"
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F034010DF
	for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 08:36:50 -0800 (PST)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6cb9dd2ab9cso1317585b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 08:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701362210; x=1701967010; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6xHzArs6mE8k0gKFW47uVkaYV8e6TD1wE2C7VOPjLb4=;
        b=u9sYNGK0SnoZJi2M4fNto/d3DBHZVx8oGKr+V0DDNmD/sPLR1DHmyO9GnTmhOpt9pf
         mzqK3qLOfftbhQAsBuGkwl+yyh2s6C6QqGjhvZ4d/HlFbH8ByQbqlybrbDslLGK8SNqw
         WIGacyNWus+FgvF2Le50Sxbe84PDmpk9AkKpIRIuK/8W8kfRATWhdqmyNZp4rUmWmnPH
         5O84qWy3Y+o60/+d1qixZQwvQMRaZtpjCSZA3MydjsAc5hOO/wSy7QjGCuTJ04SxyJFu
         +UTls6N6h/ONtyB6I+/TnpyABGeYUS0jXPfWSN2SeQ6wFjf47kaGSl4ibjivXFpgQgm1
         Xf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701362210; x=1701967010;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xHzArs6mE8k0gKFW47uVkaYV8e6TD1wE2C7VOPjLb4=;
        b=Bl2OH1EtgfID5j/u4we5ZjQc7Zny50mBSR9U2aqx5HS/UefkDLR/tL3o4Xqblz3aLm
         thOwW2L43MEnop2nW19M4iq9kwgHfDJH9Az6kb/mmHpjQ0AeCvfVgWDPVUHR3uTQWdHQ
         sfpoo0nVxzW86aVzAH3ZpkUCR7iHUhAakZQr6r7wLXlaOvTb2VgZwhAJdh8p4x0iUjpy
         UkwyiSv9NUOi/fTkChe8jyX3+CakOND4CZel9aOR+rHsn5ftdYZBmz6TSgkUnXGbDKuy
         V8GHmn+FKCuqo8UMMtWV0aHOrZw1Wgq8NqKymVv3f1qETJC9qk/vob4wh/RDaybI6nc/
         PlUA==
X-Gm-Message-State: AOJu0Ywjz4pN7MnNZPatvWcfn1vTaC7n/jzWJg2iZ06G2zY9L6TOlGLx
	uSA8oA6UWsZAmXgVOSWCusGxXkq2VPw=
X-Google-Smtp-Source: AGHT+IFyTJvqgU7+F4LwNMiRyYQZ/KoAM9H6+dTJ2Jev+HII5QR1S3/PLcJ09hSbpz5CFo9DmapM9ZYore8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:c90:b0:6cd:f769:9c09 with SMTP id
 a16-20020a056a000c9000b006cdf7699c09mr114286pfv.0.1701362210472; Thu, 30 Nov
 2023 08:36:50 -0800 (PST)
Date: Thu, 30 Nov 2023 08:36:48 -0800
In-Reply-To: <20231102162128.2353459-1-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231102162128.2353459-1-paul@xen.org>
Message-ID: <ZWi6IKGFtQGpu6oR@google.com>
Subject: Re: [PATCH v5] KVM x86/xen: add an override for PVCLOCK_TSC_STABLE_BIT
From: Sean Christopherson <seanjc@google.com>
To: Paul Durrant <paul@xen.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="us-ascii"

+Andrew

On Thu, Nov 02, 2023, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Unless explicitly told to do so (by passing 'clocksource=tsc' and
> 'tsc=stable:socket', and then jumping through some hoops concerning
> potential CPU hotplug) Xen will never use TSC as its clocksource.
> Hence, by default, a Xen guest will not see PVCLOCK_TSC_STABLE_BIT set
> in either the primary or secondary pvclock memory areas. This has
> led to bugs in some guest kernels which only become evident if
> PVCLOCK_TSC_STABLE_BIT *is* set in the pvclocks. Hence, to support
> such guests, give the VMM a new Xen HVM config flag to tell KVM to
> forcibly clear the bit in the Xen pvclocks.

...

> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 7025b3751027..a9bdd25826d1 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -8374,6 +8374,7 @@ PVHVM guests. Valid flags are::
>    #define KVM_XEN_HVM_CONFIG_EVTCHN_2LEVEL		(1 << 4)
>    #define KVM_XEN_HVM_CONFIG_EVTCHN_SEND		(1 << 5)
>    #define KVM_XEN_HVM_CONFIG_RUNSTATE_UPDATE_FLAG	(1 << 6)
> +  #define KVM_XEN_HVM_CONFIG_PVCLOCK_TSC_UNSTABLE	(1 << 7)

Does Xen actually support PVCLOCK_TSC_STABLE_BIT?  I.e. do we need new uAPI to
fix this, or can/should KVM simply _never_ set PVCLOCK_TSC_STABLE_BIT for Xen
clocks?  At a glance, PVCLOCK_TSC_STABLE_BIT looks like it was added as a purely
Linux/KVM-only thing.
