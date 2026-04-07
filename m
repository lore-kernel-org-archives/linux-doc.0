Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7F7376BEC
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 03:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534344; cv=pass; b=gLaz8+lnpYny0ZjtGHJ34VSG1SDbkNNcEovN8zV/izLl1wIsuPg/awR4mOAE/i1uvpIo0MMwmPbhl+KP6+cuo4K8hoU6cDEzIMon8huhk3MCVvLDtFjn4XAT03kIbacySwM1eZ5cPTxYXf27z8/wZRu8ohwOCEEc4ytrvl2rEdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534344; c=relaxed/simple;
	bh=mfzKgLqLZzYMsvQGYLY63k3H3j/n9cAOhMKsXc5Hl9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=As1yJrcNIh9b6Q7Z/x5rqcxHmESLQ5liufU8fo6WRajQWIv8OsniEwooIE3jaiKqph5W0mM0nm16quMY8qsGsGd9yG3xTGwNp/KtwztBIK4En3soD0UcmHxe3wl/zBy301jKDjWGvZaqAJWbbus/2D9VFCsDmg5QuqdOiOdDhkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oQk6jNYX; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oQk6jNYX"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66ba6d3dab3so32372a12.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2026 20:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775534341; cv=none;
        d=google.com; s=arc-20240605;
        b=c9gXuEEeDPu11nc02gCGAbfuKVdCGij48MJj5Nx74K5nXT4te4gJZyfWNNaJqGIN2Z
         TfUMGL3PCNizGXQM77hCRIjneX5VqIMt+r/rAIasLAU1fTUJpfn704WfowbweRrxIzzm
         XSBRbRE6qBkVlB/kJCbjU1vaHeBdjOmFehVKVdQ5/DY6sAGfZM4uF0IiIKDNxvJI4/lY
         G6cYHf4QtgdFhrSswqyp/ATWUACXFTdx7mR1l+79O7k9TUkB/jhZKyTtz6HJMs2BClP9
         AUXoImLDlI/t9jt6L0CWllpVVtM+2ZDmi5VQP7r+1yaxX5VAB2kwtAF25Tqf1zReMsVH
         Kdsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Gp8YbEZRFqhe15YerLSFU9IKBLIqcpI1UPog9hHvAQ=;
        fh=j4wpNvh1BzskAa+iLOrVCgzeXZJaMLahV9jtUR9mw6g=;
        b=RBPXn/oYYd9kRN9PGj0dEhEfdKZ9CMMgt/9YwQqa7KbPAGAyTZN30n3bxUa2cX47DR
         7N5ye7St63tcXxvwBeUF9eaFApE570fPJp87Zz6SX6MS8gjWBDTCrnNtarzmKqHHYRTG
         wnm3pRGDacwim3CkPaKqyOKw1PpibfZ2W6w4Zq3j1C/J8nYk0L6EFLaOhqF3e1hngqzK
         XVhZHZFU4fmz35XViKSM0aLuvtru5rpIE21wXYgy8WiQmXTchVYpPCTlhABKNi4Snog5
         pcEij8hhLr4/9CzR/D+rB0ChDYRpoZe5JSu09y2ysgYoBI3KCkv0AVUuhEG67xy1wsVW
         M5yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775534341; x=1776139141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Gp8YbEZRFqhe15YerLSFU9IKBLIqcpI1UPog9hHvAQ=;
        b=oQk6jNYXCO/9sgZMwolqIwFskFhI0re5l4iu3mfkBjsOWwyb3F9fB3EcFsBEaJeMt+
         KTEt2eYasLLbpMRT9QbBw09p3YDMolAngiBxjRB1KGto30kefxBY7kBnRKavaG4M8q5F
         hymvWa4Yj8ABYF2k4QQ9bm6tjG3tE91BMNxoN7hj5cfzyTGNHa2th4JPOqRPdEQg/Mlx
         QwI0RvvrZi5b9smemZbgVB4Jd5q/8N43XoeNjkj6iYC4KbbSa4Dl77f48/AyOUduj7fF
         MZZOb8AGbZS5gLinDbusd6546LHN9WqSh1SLt2a/WVt1RRg3HzBzsBN9e12voUXIdGCB
         hqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775534341; x=1776139141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Gp8YbEZRFqhe15YerLSFU9IKBLIqcpI1UPog9hHvAQ=;
        b=KPA2Clybym1xDLFlRNobX/HGoUgwXoEiUNQRevPhlY6WtpkwOsGrT97zcVVScKhczt
         jScD9Kv/SXyHi1aiiXhq/GlqTyLKS5cbiC4UL+Vc4NbohcFOVB0yZQFeCSTUUSXfAP+a
         uH9cxDS9VWkMqbS3zFjhh6Um4+fzCxTFDh1UifXyS3lawsE4WfI8Zxv1NMKMUpyELmtB
         QtAkVlq/YLN0gH4l8SC8jAGUu2D/PhXBcFCcmYeQ6YOfHkwIAjW8U3tDtE8vtfycbG3p
         xk4OdNNDcprXRknlKUMJJjPYr0UdMRGXtU5ntkgPWKnuPokhUh/jSKoRJ6lts7zpBaqT
         PbCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1nbuEpSxQa78qiIZGUYkyqImueLoED/JTrO4Y8eYWZiYNrUdrZ+CMXgy6kLANdEobw4REKynLTiM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj/vkeCYYJIUs66eTicGmV9uUMsF4T6ohOU70aeRRoWVV0zZm1
	LrHMe8cQXp7/r96zgouFidqSO/Vl8HOYwe/YBqHg2oSlMpdetcQn4x67lzGkR8hpSuJr+SdF8/v
	gSfhiMBmaXKx8VML+r9mAqGBygVIPa4hdmgvIxPQZ
X-Gm-Gg: AeBDiesrhyLLq8MYc5qp3vigsAMVG1NZ7sYq87u0i+AaXMpXTiCOJOCxc+UuRLm6dYA
	qZ/d4C3DOWfpzupKXkg0BnNtQatcxkdbGV9VTt0CncszU9/Xo5v0JUQY1/p7XYhf65vKKTfLePa
	8D4tgjUXj3VXzzd07UX2LLk+U9VdgI+7ZyshTgfVsazejSYm6TXkOwDIAYEKKULFklJG+ZN7cH7
	XDWmY2zEpLcDRvZYgnFmh8R/4sJUGz5VczkdISYbuYWdP/kr93w9hhVbXo1dGds4kzFMcjO3BZ0
	31+VX4A=
X-Received: by 2002:a05:6402:a215:20b0:66b:b6d8:c0f7 with SMTP id
 4fb4d7f45d1cf-66e40ae6f4emr91714a12.0.1775534340995; Mon, 06 Apr 2026
 20:59:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234023.2659476-1-jmattson@google.com> <20260327234023.2659476-10-jmattson@google.com>
 <adRK0dyF9QAsZyVz@google.com>
In-Reply-To: <adRK0dyF9QAsZyVz@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 6 Apr 2026 20:58:47 -0700
X-Gm-Features: AQROBzAR4L9hartxNauJf5yfV8dXpfTn1DNBr0PmrsEV2bOZT00NXIY1ANXG8VU
Message-ID: <CALMp9eT_+dAS-4Qz9cRGx5n+f7M=svOGpcSk_Kv7QyQw9nVWTA@mail.gmail.com>
Subject: Re: [PATCH v7 9/9] KVM: selftests: nSVM: Add svm_nested_pat test
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 5:07=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Fri, Mar 27, 2026, Jim Mattson wrote:
> > When KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled, verify that KVM
> > correctly virtualizes the host PAT MSR and the guest PAT register for
> > nested SVM guests.
> >
> > With nested NPT disabled:
> >  * L1 and L2 share the same PAT
> >  * The vmcb12.g_pat is ignored
> >
> > With nested NPT enabled:
> >  * An invalid g_pat in vmcb12 causes VMEXIT_INVALID
> >  * RDMSR(IA32_PAT) from L2 returns the value of the guest PAT register
> >  * WRMSR(IA32_PAT) from L2 is reflected in vmcb12's g_pat on VMEXIT
> >  * RDMSR(IA32_PAT) from L1 returns the value of the host PAT MSR
> >  * Save/restore with the vCPU in guest mode preserves both hPAT and gPA=
T
> >
> > Signed-off-by: Jim Mattson <jmattson@google.com>
> > ---
> >  tools/arch/x86/include/uapi/asm/kvm.h         |   2 +
>
> Don't update uAPI headers in tools/, they're not used by KVM selftests (p=
erf
> folks will sync them as needed).
>
> > +#define PAT_DEFAULT          0x0007040600070406ULL
> > +#define L1_PAT_VALUE         0x0007040600070404ULL  /* Change PA0 to W=
T */
> > +#define L2_VMCB12_PAT                0x0606060606060606ULL  /* All WB =
*/
> > +#define L2_PAT_MODIFIED              0x0606060606060604ULL  /* Change =
PA0 to WT */
> > +#define INVALID_PAT_VALUE    0x0808080808080808ULL  /* 8 is reserved *=
/
> > +
> > +/*
> > + * Shared state between L1 and L2 for verification.
> > + */
> > +struct pat_test_data {
> > +     uint64_t l2_pat_read;
> > +     uint64_t l2_pat_after_write;
> > +     uint64_t l1_pat_after_vmexit;
> > +     uint64_t vmcb12_gpat_after_exit;
> > +     bool l2_done;
> > +};
> > +
> > +static struct pat_test_data *pat_data;
>
> This is ridiculous.  Whatever AI you're using is reinventing sync_global_=
to_guest()
> in a very obfuscated way.  Drop the indirection along with the params and=
 the
> full page allocation, and just sync the damn struct.
>
> Actually, this is even dumber than that.  The "data" is only ever accesse=
d from
> within the guest; it's used to pass info between L1 and L2.  Drop the str=
uct
> entirely and just write global variables.
>
> In general, please clean this test up before submitting v8.  All of the L=
2 code
> is basically copy+paste of itself.  This is the second vibe coded selftes=
t (AFAIK)
> you've posted, and it has many of the same flaws as the first one[*].   W=
hile I'm
> not opposed to using fancy tools, and the bar is generally lower for self=
tests,
> the code still needs to be readable and maintainable.  This ain't.
>
> [*] https://lore.kernel.org/all/aXJal3srw2-3J5Dm@google.com

I contend that the kvm selftests infrastructure already fails to meet
that bar, but I will toss this in the bit bucket and write a selftest
by hand for the next version.
