Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A13F1D5CC6
	for <linux-doc@vger.kernel.org>; Sat,  4 Apr 2026 02:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775269278; cv=pass; b=c2ug0YgyYq1Z7XXEvGxoFuaioKO0j9jU6ottp9N9VoRtTJby4DKIirU15lU07G8rxUbYJ4a6bsxaLFCFvQk2oJyNhMwziV5ByCWGTdwH8sH0SmQGFVwSbKwy+nBSINxO0DjVj3b12RnAd8gCrXarFidEqY/u0W3uPhT5R2ufUVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775269278; c=relaxed/simple;
	bh=QKK3vfyE3OByfcbnSQwgv55pP7KZYyyoT/ZClNEydVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ISmBQfNNinRElbkC6qnVt8b8zSAFoz9LpZWkGEgWW1zhLi/mCJ9NnXOIqh/roceBEuA9rqClTx6esFKfibAwpihp3MsU0IgVQTCpID+lC9q3HtorGMhxUdK9P0LGuQENhQCIB3BGPPPHyS1BrrFE6juni5A5FWQP+SSoFfc+vu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mFZ5CNRz; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mFZ5CNRz"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66b0dc690bcso12902a12.1
        for <linux-doc@vger.kernel.org>; Fri, 03 Apr 2026 19:21:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775269275; cv=none;
        d=google.com; s=arc-20240605;
        b=R9hAXUvjFvEIAoVIqHABH7v86jcFWnPew/jHIcCtoOjakbNn5pEPc6aLSaAD7n+O1I
         9PPxu4LzpyIkPFpeHkuwVMSB1ESWUOi1FDC/OEIzPxbe/lZvIUvWKeJiVMl4NWJZQC53
         4sn8xZI2S4XUh4isSqEGLig++viO9nvXR8tfuGhbNiKjg5Sfa+3tsC7mY5KoUp7+vn5V
         E8A4vOCG3I1xgK9Jj11yBYnq2RrLMNyYs/1yskW965gD85flDDH41aJVCXSJZt6jbjzv
         65rnkSrGet334x7HIqgUJh2c0DmvAchFjm1l24C9uSQwJDo10o0/hTEdo/bxhoE/gl3g
         rcww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BxC/1pvEk7t6X+wjHIJcWrBYzvtuyxfvAHewlXa9Reg=;
        fh=BS/xVIv+JaB6u7KYem/w4BdRyaEB95KEesyowFULFYE=;
        b=OT02rthE1fbQuGdE7QwRLMH4VBm3rBXfpeQH3zujzdjor//aOhbFFzGptyovC95QQa
         tgjvyNofNVx3FFvcEbEEWYT6VlvOzqDD9SDqAE2Ns5HsxNsC4n1xtOsd0AXyH+gXrij/
         Vwp8Hx8pniqgVnAb4SIawghe5pmzPO7przXqJPNBnRaTeFAzwokQ3BR3Rpb+5ifQpRVt
         m9G+VpUVQw+wsPgZv3t2uedS+Nk4RbQVSoTDtPadjMgJhp0LdbV8tLhKMGuUl96hS4Hh
         G/qHLq6zADYsidv/uZ4VtFM34Gm/BBVTEuC47tnsTe3VoC5DX2B5VaVJFxib+VXxdZFY
         2m3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775269275; x=1775874075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxC/1pvEk7t6X+wjHIJcWrBYzvtuyxfvAHewlXa9Reg=;
        b=mFZ5CNRzhSAbWxV9qEwfLjfxOOP7DEerPOJ44lwZkjp5L0uoXrsRQWWpXvSSDN4Cwo
         k3qLye3m7czPV1KRG1YwJLNmVknn90IHrEFd+SEYT83REKPPEDEF27RQJWOaYm8vr5Mc
         ARt2SMt9qNbsDFnF1i/h13uotWnRYenua3pnrUqy5O1F/7zThm1qfGM5Fc55s75pWyY0
         q4FZWGS8Xs928aEmrZOHOfrCI6S7QgmhPn0SlpxVv8Cq7JNHWWU4jT8KhFsVsqaifCqU
         8LTPEk17nAIKfFlYGH/o2e/+7vrvBzxwJc9f4mXHfqtkt9b3pw64CSnJbIhLfgpHkhBS
         4zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775269275; x=1775874075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BxC/1pvEk7t6X+wjHIJcWrBYzvtuyxfvAHewlXa9Reg=;
        b=iPRuqFN40ebxYys/jd/QGCDdTEwu+EijmFBsO9FYNUgMYTm53oAWBfwcpqO9oBturO
         4Bf2m/cXEpkLLqgPmPEX3nfQPuZ/4pI1C4dAsDd2khlh8hJe2gyjKjNI0oXEaO7CBI7G
         EktRzmEb7zmJ2yzPUumDOoIe9PPnSROahaHo0DfsM41bV1ivqJU7S6I8nWyCv0tKNQQh
         ItApX2PQbywhERt4y6DYPofOdEEFLHvFMfhO2QPWt7gCUvmcL82SkZT7UHLpl6mOKL7P
         Q0iPeFMlM3YTDlh1JA0kzVlaGmS6emL3nrGNiSni+X3jv58oKX8WqyZ+OMhCkrkcWY+v
         BWTw==
X-Forwarded-Encrypted: i=1; AJvYcCWoqd7X+XtSJS02Q+SIMJgBv8wd2gPBxBSXHX76sU5j4YWR2MShvWfduEQmwotpf50Y7Ld6SEvrQUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YztckEY+9/BbbzZTx2wwP9zBjndArVuN2jxTuGqM61OC+t8bbb8
	I+PqEJgTz3A5ft4drHlGMSzuGKJf5IEHsexfRBJJyXEFelQOuLq0/xJDEn8HUM6N5cd5RcTHlLY
	H6M2UB/sGn1u/CWwT97WOdeUS1EvVtUEUw53UKIfE
X-Gm-Gg: AeBDievYDL+bueYpqM3Yc8XPzhIZHQ5yJ5YqX2jW3A7vJuS3J0gKG0Gjj71LCtq4Dtc
	8Iw2K0It0/E/+LaS33cjgAWNFmHeoRopGlLpbdX71LyOvURJYmTaWCJ8DByNKZu84OZ/l86VLfK
	nTOuZsDJJ6O0TpTUx8gdGpribefRM4YpBXPp48jD4KXLDAAwho0EEM8aKE7lYfW1Yw5HBZ9NjL6
	LCuBH4eL3Z2w5uTk5Y63NpSOqPf3CJBu00d8OyyxfrqS2Oj/DAcw/bvIk2j1TXZIhRsBvsYRxDX
	jT5NZ6eGibnhjvIO6w==
X-Received: by 2002:a05:6402:1804:b0:66b:ed69:a85c with SMTP id
 4fb4d7f45d1cf-66e43f22b75mr45332a12.7.1775269275001; Fri, 03 Apr 2026
 19:21:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-vmscape-bhb-v9-2-94d16bc29774@linux.intel.com>
 <CALMp9eSLVvr00mJ0J2f2_SPeCW-VS58kxMcxHgUW6etML+_+QA@mail.gmail.com>
 <20260403185236.sjgetnkha3o3a4d3@desk> <CALMp9eSPkMpKQELTnsaj6=gXD+EyE0n2_p93n4maDc93bPFe+w@mail.gmail.com>
 <20260403213445.xzb4rxbfbg5un7li@desk> <CALMp9eSXfJvR=PHtttbqm3q3nH436T1eH4YdpVqxQeP-cxEPsA@mail.gmail.com>
 <20260403231608.zopnhnypdclzqlx7@desk> <CALMp9eT2vJBdLPY2uBYrPgVrhS_aYmfGfdXe6MZXG_gyryLHVA@mail.gmail.com>
 <20260403233329.fb2ppifgwm3um6ny@desk> <CALMp9eTpsenqsWjzmpXLEubn9uNjgZgzgrMwtZ72HDuV_2xgfg@mail.gmail.com>
 <20260404002149.wtayv6a64vzuppgp@desk>
In-Reply-To: <20260404002149.wtayv6a64vzuppgp@desk>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 3 Apr 2026 19:21:02 -0700
X-Gm-Features: AQROBzBosyujpEg2ULZMen-BYMNgkEIJxtpk1WSLwb-MqoCqV3Cx2KzliC39bhw
Message-ID: <CALMp9eSqgL5q-MY1xpjqR5oRn5_cb=mfEhNFWusNneS=Mx8UMg@mail.gmail.com>
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

On Fri, Apr 3, 2026 at 5:22=E2=80=AFPM Pawan Gupta
<pawan.kumar.gupta@linux.intel.com> wrote:
>
> On Fri, Apr 03, 2026 at 04:39:54PM -0700, Jim Mattson wrote:
> > > Since cloud providers have greater control over userspace, the decisi=
on to
> > > use BHI_DIS_S or not can be left to them. KVM would simply follow wha=
t it
> > > is asked to do by the userspace.
> >
> > I feel like we've gone over this before, but if userspace tells KVM
> > not to enable BHI_DIS_S, how do we inform Windows that it needs to do
> > the longer clearing sequence, despite the fact that the virtual CPU is
> > masquerading as Ice Lake?
>
> IMO, if an OS is allergic to a hardware mitigation, and is also aware tha=
t
> it is virtualized, it should default to a sw mitigation that works everyw=
here.

Agreed. So, without any information to the contrary, VMs should assume
the long BHB clearing sequence is required.

Returning to my earlier comment, the test should be:

+       if (cpu_feature_enabled(X86_FEATURE_BHI_CTRL) ||
cpu_feature_enabled(X86_FEATURE_HYPERVISOR)) {
+               bhb_seq_outer_loop =3D 12;
+               bhb_seq_inner_loop =3D 7;
+       }
