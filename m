Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977713806B8
	for <linux-doc@vger.kernel.org>; Mon,  6 Apr 2026 14:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485425; cv=pass; b=Jv6RH/FDULPNKd/qL+az60I1l0p+Sft+ZzEV+s/hqZgjE0m0jhM7UYg2D8OQwREi2jiSTOiWlvhi3JUUqyQXz68sFfMkn86bSythBb+jlNyh72UNy91Kp5WtHrAlg4fPPsy6MUb7v7d4MUJVpWq/4PeQTTt+frxs+xuRjmOe5e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485425; c=relaxed/simple;
	bh=0oshv46xLuQzPLIPdH9A0EvaVpAKTWV20KUKhaXBiSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TEm7Crs8KWtPY9dA00angU+TsGzFBB+9llrTOve4WvFV9Lqsxg0UXTJHHpgP2Cm44kGIQYsM/MARKmHZgLR+G05erADeWI1sAGthPyRlmCAFDHW4oYxlfYg2A1M7/vwHFbxCOEQEKjz7tWr9PMJ2r0o21WjVCOHTTT+WZ2q8+OI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XeoTYTd5; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XeoTYTd5"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66bb7118c96so25020a12.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2026 07:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775485422; cv=none;
        d=google.com; s=arc-20240605;
        b=MwML6C1v1BeDXHMHTl9TasgKTrJ2z8U1BFGvb9WZQoXUz/Q2pPVcl0tDc8E+gFLY39
         appFOCx00EButzQi+5LTnPb3FS7P1W9bZOzKt4h8wXVjLfrPdpQFO7tNxZYD2fwtDnsv
         e/zLbZDZvqxDt/7zbd6dW5r4KY8C+E+p6h3yTJedv78c3HZu1q0GLrifH8zuJmgtfpmp
         843arv0y2MdNSCjvZbTmzNQwp719j/JIlM8A5JWqLF0IQsxX4OsPN3tnyQpnW7BX0mpe
         rQBjWXnYJ8ulR3/+xsvp347G6PgpIEJmF3+TX4uWnWdQ6fX4uixj3vdjAKmdeDApgPIL
         hksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4foAE2z+Q/MQv2J0mPBdcU98fqKB0vyTweCETb8dfag=;
        fh=dShpKZvzCUlNdr6TsTJsPLqHuxBp8SYV9mDgLKR0skg=;
        b=NOOmjXG4ujIKxvNBL9S5vpaXpIIbRMLiVwqsM11XXQpGiYd7IDUehjoGFGWyvT/Pmg
         h9lVCait2m8uxc+CMtemX8NNkxIh63QFNHcfByzwSvsJhKxKvou8ABRQKVc34ONPSvRv
         iIgD3qPw+nzW15OfEZcaCPpVj1QMl0S0SsJ4HxK3GBeR4N51t0/68yePx+TrKFllQcl2
         BDmWHzVM5mcCWtyHRnJGPaeEDw3hN0uH+rpUvxnNa9zry5TtOkI0eZcOD12nT2AHXHx2
         UIXavmx6JgFGJdDpG5PEOtr2xGOjJE0pp6Z2odeUDzMns7aFg3kV89cAsVrw/RFcK51X
         PzfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775485422; x=1776090222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4foAE2z+Q/MQv2J0mPBdcU98fqKB0vyTweCETb8dfag=;
        b=XeoTYTd5wSE48JW8kaM0qv3ycrSE9eyeuCIskQwqlA84Ij2A9Xf6y3+NEG1J8FRvIQ
         t6bHLyFisYQzufw6dVUDCO8+C3SQMB2M3WjdVqRea1tMTT1qZ12ijqURJCW5YdMxgO/U
         0iX1FKr+yUwYvrYESOPuxPlwn8N0qKaPS2HrSIaYdfALRFDkTWB6DFUsYj2vLBsIzzdt
         uxeS2dppQQhcpnblsFY4Z4BNYMbYJ5yQSZk4VljRhDO6MTvR1NaxLYhYgKToGQoccHBJ
         uk0Miz7PmU3O0o3kStbFvFjYl8NPwzt9LvF2y0FdSXBEcd20f/V0vddkkgTmfWnI5ZQF
         agZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775485422; x=1776090222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4foAE2z+Q/MQv2J0mPBdcU98fqKB0vyTweCETb8dfag=;
        b=IT+MqFf0V71Z+5R/JWE3OT1N17Shp+LHx7Kd6b4X4seLLQ0kSPBrf+rseCc+0pRXcT
         QYA7BitHP2vZAxjMalQo0xOZe+cMM+iaL/smaUZI70sCgsaj9KRgQxnWdcqWKwWYON1M
         Kvsbw8owU2L3nHSfrphUs/suJL4uaeolVqIEx0rJNhsSxTt6kYuAc1RbMaVZE83PFpVz
         vWti/hudGu3ErZM9cdC253cbdbR57J9qIO8zSnRsA+tOHgtT5wxu0qxtJU3ioB+NrNvC
         dceoSdhEwTHWswzn3OFy+LBGezR9TfAZoVugqWs2FL32aSzghpDoiHHeokeCbd8/ZGwU
         tW5A==
X-Forwarded-Encrypted: i=1; AJvYcCUDhaRisqyn9o9T9DH7qmRtjvLZP4J7GXMD4rygUJIVeOa7x2BvXnxntYOq0+X4Y7gL4fNZ+2VqOE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhkmApMIlg11trd8LRaLb4sPC1bVCiWJFC4yqHcplTAH54Y+B3
	vt2SNSp5lPrGr9KL9v1EVBdx1SimMu4jfgJyeqMKZ6sg8XxGLsRYTHuj4/NDPX1Ao0KuuR/jU+u
	K+1ONAY3bbLYGhQZ5twp7j1SCvT0Z6TbMM22poZuZ
X-Gm-Gg: AeBDieu4IC5jWR4/pTB2G47nRqj9E0NY4f0QSzJs43Nyu26wKZVf7pzqwKzKTpuSp60
	EkWVUs1FWT4o0cXl2GnFZ3CiOxIO2nL//LTnb031jRezCH1RM4beJP0oKDrcGArmv1eKgLpZ25t
	kKgurvkD9uPNVm17OSbL/9Ri7EBPadDnt4sbNCtAJkj8uqtmOq9aOC9yjuP/si3GK1c+qH7vzKO
	fBkNj/H6VOvGJXdq+GJUpB8QmiREXKPct5LjcFPpu+x9BuKgsKpwlMXzxgZs2Jkx/lbUbF7EQ6Y
	M0NwRV1B1qQ7AXYfUQ==
X-Received: by 2002:aa7:c383:0:b0:66a:7b3d:f43a with SMTP id
 4fb4d7f45d1cf-66e43cdc3d3mr75635a12.1.1775485421479; Mon, 06 Apr 2026
 07:23:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403185236.sjgetnkha3o3a4d3@desk> <CALMp9eSPkMpKQELTnsaj6=gXD+EyE0n2_p93n4maDc93bPFe+w@mail.gmail.com>
 <20260403213445.xzb4rxbfbg5un7li@desk> <CALMp9eSXfJvR=PHtttbqm3q3nH436T1eH4YdpVqxQeP-cxEPsA@mail.gmail.com>
 <20260403231608.zopnhnypdclzqlx7@desk> <CALMp9eT2vJBdLPY2uBYrPgVrhS_aYmfGfdXe6MZXG_gyryLHVA@mail.gmail.com>
 <20260403233329.fb2ppifgwm3um6ny@desk> <CALMp9eTpsenqsWjzmpXLEubn9uNjgZgzgrMwtZ72HDuV_2xgfg@mail.gmail.com>
 <20260404002149.wtayv6a64vzuppgp@desk> <CALMp9eSqgL5q-MY1xpjqR5oRn5_cb=mfEhNFWusNneS=Mx8UMg@mail.gmail.com>
 <20260404034954.t7iapenzvhdpagxp@desk>
In-Reply-To: <20260404034954.t7iapenzvhdpagxp@desk>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 6 Apr 2026 07:23:25 -0700
X-Gm-Features: AQROBzBKIPcP_H1GwuJoXUrRRJVPGk443GCqm_WEh0Cd97H-YqzPVn5MR8nDNUU
Message-ID: <CALMp9eR70eE2U63gzNzTiic0PqJVGv3CBBuVUOVbi3nqbWKZkQ@mail.gmail.com>
Subject: Re: [PATCH v9 02/10] x86/bhi: Make clear_bhb_loop() effective on
 newer CPUs
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, Jon Kohler <jon@nutanix.com>, Nikolay Borisov <nik.borisov@suse.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, David Kaplan <david.kaplan@amd.com>, 
	Sean Christopherson <seanjc@google.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, David Laight <david.laight.linux@gmail.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	David Ahern <dsahern@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Asit Mallick <asit.k.mallick@intel.com>, Tao Zhang <tao1.zhang@intel.com>, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, chao.gao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 8:50=E2=80=AFPM Pawan Gupta
<pawan.kumar.gupta@linux.intel.com> wrote:
>
> On Fri, Apr 03, 2026 at 07:21:02PM -0700, Jim Mattson wrote:
> > On Fri, Apr 3, 2026 at 5:22=E2=80=AFPM Pawan Gupta
> > <pawan.kumar.gupta@linux.intel.com> wrote:
> > >
> > > On Fri, Apr 03, 2026 at 04:39:54PM -0700, Jim Mattson wrote:
> > > > > Since cloud providers have greater control over userspace, the de=
cision to
> > > > > use BHI_DIS_S or not can be left to them. KVM would simply follow=
 what it
> > > > > is asked to do by the userspace.
> > > >
> > > > I feel like we've gone over this before, but if userspace tells KVM
> > > > not to enable BHI_DIS_S, how do we inform Windows that it needs to =
do
> > > > the longer clearing sequence, despite the fact that the virtual CPU=
 is
> > > > masquerading as Ice Lake?
> > >
> > > IMO, if an OS is allergic to a hardware mitigation, and is also aware=
 that
> > > it is virtualized, it should default to a sw mitigation that works ev=
erywhere.
> >
> > Agreed. So, without any information to the contrary, VMs should assume
> > the long BHB clearing sequence is required.
> >
> > Returning to my earlier comment, the test should be:
> >
> > +       if (cpu_feature_enabled(X86_FEATURE_BHI_CTRL) ||
> > cpu_feature_enabled(X86_FEATURE_HYPERVISOR)) {
> > +               bhb_seq_outer_loop =3D 12;
> > +               bhb_seq_inner_loop =3D 7;
> > +       }
>
> To be clear, my comment was for an OS that doesn't want BHI_DIS_S
> under-the-hood with virtual-SPEC_CTRL. Linux doesn't have that problem,
> hardware mitigation on Linux is perfectly okay.

Today, BHI_DIS_S under-the-hood isn't offered. If the hypervisor
doesn't offer the paravirtual mitigation MSRs, the guest must assume
that the hypervisor will not set BHI_DIS_S on its behalf.

> Without virtual-SPEC_CTRL, the problem set is limited to guests that
> migrate accross Alder Lake generation CPUs. As you mentioned the change i=
n
> MAXPHYADDR makes it unlikely.

I have been unable to make a compelling argument for not crossing this
boundary. The only applications I can point to that are broken by the
missing reserved bits are (nested) hypervisors using shadow-paging.
Since both nVMX and nSVM support TDP, the niche cache isn't a concern.
There are compelling business reasons to support seamless migration
from pre-Alder Lake to post-Alder Lake. If you know of any other
applications that will fail with a mis-emulated smaller MAXPHYADDR,
please let me know.

> With virtual-SPEC_CTRL support, guests that fall into the subset that
> migrate inspite of MAXPHYADDR change would also be mitigated. Then, on to=
p
> of hardware mitigation, deploying the long sequence in the guest would
> incur a significant performance penalty for no good reason.

Yes, but the guest needs a way to determine whether the hypervisor
will do what's necessary to make the short sequence effective. And, in
particular, no KVM hypervisor today is prepared to do that.

When running under a hypervisor, without BHI_CTRL and without any
evidence to the contrary, the guest must assume that the longer
sequence is necessary. At the very least, we need a CPUID or MSR bit
that says, "the short BHB clearing sequence is adequate for this
vCPU."
