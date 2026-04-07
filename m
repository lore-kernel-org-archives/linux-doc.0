Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ABC3CFF5D
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 16:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580383; cv=pass; b=OPivJOzTOgB9+LVeG/0RJOEm/qWAGzFtiGh2dwnmq2mKxy/nPpFsXMy3TrJlvnRYnnS6Q80IRQ23RNCtjdJRNo70jCkPCyks4Mm8gk5DE/tgm2XDtU30l4b3qeTzRfOhqySv1Jlj9cwhjx+xr1lKz5j0UxptQ/ilJa1xWnxR0KQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580383; c=relaxed/simple;
	bh=7agD+s2GVFy+3GJ+9lu9MNOej8X0LlPEbU6wsUyTSxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BANBRUfNj/rZ32reNSbEr8VB2Ju+VIqdP4Bw+gA+3v/PxiOed/S4E2t3yEIn5tr4oY0aCcrNbDixLm4WWO+v/fKigsu2KVEAXzZIClt9Pm2myzhiRoEaMo02FxVMu3OZz7syqZJagvRlB1vglTmvqrn41Alj1q5kMw0QUlbRkb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k1iwIll7; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k1iwIll7"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66b0dc690bcso128a12.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 09:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775580380; cv=none;
        d=google.com; s=arc-20240605;
        b=F3xxqK87VS8gm+K6tWRsXWprwyMEYPMFAJO3X8yVA4x3mJC8ML5b2THrqZFI2bm4Kc
         j1/V/j5HuEJ3t+S+m+L4mupdxtv7VpKxB57ttaeXc0QXjVwJvbQ0ZfTWaGVHPzKgFIIU
         jrla6Gi9dQjS0STdX/pDKjAwB8GXjrlxuonxp/iFggXRXft+AbBamNfalavTNAoBj8u5
         VpeTBaqEeDMDqgd4WV6mljoad/NTzjMsdKYoaNriNPq9DpTEb+B58ZdbEgQtLHSK59Se
         Q/WcJ+xeXeiIMQepBSFZOfDx4KYMMNk6qhoXifVTPIKu7SDvKsj6OXuFn2O+kLgriXGI
         7Y6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7agD+s2GVFy+3GJ+9lu9MNOej8X0LlPEbU6wsUyTSxI=;
        fh=Ce8pjRL24+sVIG0rs48NKiJOJq4GiwGXol4C1b1tcaA=;
        b=Y2Uk5f5tZK6eJmwZk2QinzNtlH1WXuK6Ofh27qcimgdyhLVU3WLy9C7ZnAESP3wAdp
         maViLnrcpXU59ZCoP9R14LqbUEuMX4wieIIoBOgNZGzD4ZRDpsNk3tPBJEC24BW3vQnM
         kBz8jTyc07eQ62svCQuqI8UBdjLnoIm2xgcQvjmozENFj9ozBy4ma0BABYHoc1ofM+Vy
         iIuo3ASxkcY2/nAjh3ysN5fvsAkQpujjNfuNfjVoQgXmwIZk+xAPkJhjWUd6AsTZUctE
         qrzb4mAAwXLncgD95f0hca6LQNbIsSIL0ExrrkYrcfHqM0+Uoj/zXv9uj+qnNstZR1f+
         2VHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775580380; x=1776185180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7agD+s2GVFy+3GJ+9lu9MNOej8X0LlPEbU6wsUyTSxI=;
        b=k1iwIll7s7MWVnBwB6US1VssQV1y+kSgffte48gmfDi5eZeYqjvlrktIkZzFmn4vW1
         0POU5UEc79j/+z1pTIa04fFcsvezE+kq+DpUhlpWqMqB6LTAkRUhRufM0HVNtNi/qMLN
         ZV6YXLnGTxGgGUw6MwnGgcQLVoWJA7Hc4VyOpaY5nA4XIw0O8R4A6KgAnsgpBB0IcPTZ
         nbyc6z+qfNORRG2MIUH4MSKNWyFdcOFQ1wMQpRpq5LouT+5MONKcisR7ErOeRaoDzFCX
         5IaXTu5B+OrQBK8TsGfZPUKIozyrnK8HEp97ZrUs9AP5TXbYajcDf3t23Jfjmva+61qM
         zZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775580380; x=1776185180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7agD+s2GVFy+3GJ+9lu9MNOej8X0LlPEbU6wsUyTSxI=;
        b=i1aZ+8dH2d001+BC6p5m7t9qpmRNs5bx2w1gT2qnT6Hu6rUG7yO6F7MVxnZgKRxYlW
         RgNR0DBysSdaFGyxy2weJelx9FgGUz8aBi2yQk8zqdORVl9aHljUAjT9mTSIuTeF0Mu1
         rA5bK7cxehBS8WQODfWSr8jXA82SPZl4FjVvjaPPhJum/BzzA/RvNZw6hfksA0O+UO5t
         wxYbvTSuPnXsRK/Vx27vsv6fODHKaxMBDbU1Hbh7l1wTgJXAB9I/9bXbPYMa5U+WYp/c
         lnctQc6wVDggGSTj/Ylpj0wvxlhmgRiHCQkhOn8lqs8ijfmRGy1HLkmTL/OeaoUYupsB
         6wng==
X-Forwarded-Encrypted: i=1; AJvYcCXZ7TwtVJs7SqJrtgV6zSf/YaJ+T3QZdZWXLLU1+BpRO7NtTSyqeRyqKwP8fiQ2dyPD595AYoQWWIY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy793evpgB7SoPKC6FPCqNSHcJ1bTrHJMkbPUlHcqisl88Rr6Hu
	UcpHhN1WZ/DaTNFrbse55ryyuX1qsRBPtVKHk/WxiLIo0dtavoC/Zeyo5tRP5eYnOhK3usHX9sV
	hE5N8YiiTLipap+XCNYTY1OYf+oSWDkqth3tPRkBA
X-Gm-Gg: AeBDietNBHbx9vu27DJOO6pqqiNeqOWoMjPhVbkcwSx5LvYpMSXA0fdvfgztjAjcGjV
	5g61bBrWG3MDp6b4YWgU74vR99PlnTrt9UnzUiDwTj+pw8GFXmqRVSusGoMMF8Xdr9cXRgGXsUV
	Ik2P3KK6TABclSNcPlNVutMLnOBFPi6UATUHDSEaUrRl66sXxPlPB+lP+7xfDoaHoO5FIKJev0R
	ybVul4LKBSjeUKR1xucmxv6weJtwjtr6kONe8DFKZGwu9e1rynhPo7QO6CWN+Ph1QzpzLRDiIBu
	LnsTJaE=
X-Received: by 2002:a50:fa85:0:b0:66b:b4da:a8b0 with SMTP id
 4fb4d7f45d1cf-66e4136b3b3mr175238a12.8.1775580380060; Tue, 07 Apr 2026
 09:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403213445.xzb4rxbfbg5un7li@desk> <CALMp9eSXfJvR=PHtttbqm3q3nH436T1eH4YdpVqxQeP-cxEPsA@mail.gmail.com>
 <20260403231608.zopnhnypdclzqlx7@desk> <CALMp9eT2vJBdLPY2uBYrPgVrhS_aYmfGfdXe6MZXG_gyryLHVA@mail.gmail.com>
 <20260403233329.fb2ppifgwm3um6ny@desk> <CALMp9eTpsenqsWjzmpXLEubn9uNjgZgzgrMwtZ72HDuV_2xgfg@mail.gmail.com>
 <20260404002149.wtayv6a64vzuppgp@desk> <CALMp9eSqgL5q-MY1xpjqR5oRn5_cb=mfEhNFWusNneS=Mx8UMg@mail.gmail.com>
 <20260404034954.t7iapenzvhdpagxp@desk> <CALMp9eR70eE2U63gzNzTiic0PqJVGv3CBBuVUOVbi3nqbWKZkQ@mail.gmail.com>
 <20260407163943.y6tkh26z2rfktn3y@desk>
In-Reply-To: <20260407163943.y6tkh26z2rfktn3y@desk>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 7 Apr 2026 09:46:07 -0700
X-Gm-Features: AQROBzDrMOkL8K_5s_beeAF8mzcDjUMut0mXG4FWeqy0pjkeXMr6K1KiSjqSI94
Message-ID: <CALMp9eTA3cXxuOT4dq=6y1hx52gPH1ywwTEmPQ5-fA-vz6r3VQ@mail.gmail.com>
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

On Tue, Apr 7, 2026 at 9:40=E2=80=AFAM Pawan Gupta
<pawan.kumar.gupta@linux.intel.com> wrote:
>
> On Mon, Apr 06, 2026 at 07:23:25AM -0700, Jim Mattson wrote:
> > Yes, but the guest needs a way to determine whether the hypervisor
> > will do what's necessary to make the short sequence effective. And, in
> > particular, no KVM hypervisor today is prepared to do that.
> >
> > When running under a hypervisor, without BHI_CTRL and without any
> > evidence to the contrary, the guest must assume that the longer
> > sequence is necessary. At the very least, we need a CPUID or MSR bit
> > that says, "the short BHB clearing sequence is adequate for this
> > vCPU."
>
> After discussing this internally, the consensus is that the best path
> forward is to add virtual SPEC_CTRL support to KVM, which also aligns wit=
h
> Intel's guidance. In the long term, virtual SPEC_CTRL can benefit future
> mitigations as well. As with many other mitigations (e.g. microcode), the
> guest would rely on the host to enforce the appropriate protections.

I don't think it's reasonable for the guest to rely on a future
implementation to enforce the appropriate protections.

This is already a problem today. If a guest sees that BHI_CTRL is
unavailable, it will deploy the short BHB clearing sequence and
declare that the vulnerability is mitigated. That isn't true if the
guest is running on Alder Lake or newer.
