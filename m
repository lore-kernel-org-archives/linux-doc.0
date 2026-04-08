Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D572E7179
	for <linux-doc@vger.kernel.org>; Wed,  8 Apr 2026 00:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775609238; cv=pass; b=dwJl8NK+til2dEtxEEtX/j+JC0a8l5X+FLj9BseiHLfBz1BBBtHaEG1IbJbJGqTxQAnuNwNyT3dc/FC9d2vTNEcDUyrj3CY+3dnjgJNNEXkCPyyDT3hJFM08gBkXe5xYI2cpVO7cMEnBwn143o8mHYzRvB1VmlHY38d/pN9cXq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775609238; c=relaxed/simple;
	bh=DEsI0BgmtgLBAsle4MGY7bLXYBY4CxWUL4evHL89W7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TMjsrrRhLJny+RFoknlN7RrzMMwzCpPqOO2YlWr6pYaiSdZL9nwUPoUtZPrg62Sqj/tfKI5ZZwdwGqu6Z3cgYBszs3zcbVg4PHjGiOqwtbCgfxczahNv/MyjKeky7zPca68braAKHL1VMjLnwUG6PZ6gYaJiWuzIf6t9nbziKB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KKvqJdv1; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KKvqJdv1"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66b0dc690bcso2994a12.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 17:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775609235; cv=none;
        d=google.com; s=arc-20240605;
        b=iPB7UrAtKxLZeLricz6m6X4M/mxrbdYOrGdpYFk8mel1guupEh/Yhhjm8BG8gDdsAE
         z/dPawyeuBYNoC9gd6TjNztqppsMRz59O+5Y8RwAMT0dR7rWnPBZGVFQYJGy4NpPTnN8
         Cg03vGXmJTt9iYTvbLdn3yRrHPctT+uyr6WIMhLiNpkycvJgADcGUPADbg1uju1BMpKq
         ff9YOoPsJSmq4f16ci1jkwx0lw97R/DSYHxDtxsSzjIukWvIMMCbmr9QgJ9Z4tJyY8Yx
         7lJN7bxkfd1XzJAvHz+ZDYIYw3dFID3STfsGP9AXdRkx04aM1xdpA7UmGQlivAJmBPHZ
         8+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VhUSt7ISpVg4Y3MHFKzYjd0CV4ZCvpoOMj+LKGHtSi4=;
        fh=xY1kW9MpuN5u60rt5K8L1WjzBPZtZMLDIcae+UKk/0E=;
        b=RZgZRzz0O7+4GCE3/OTrAxjRQ+MfXnEEhGdRiqSxYrlYsaK/4Z/0VRs58RdLkVcyvL
         wru+pGTTcCU5JixWRWJoL2bN3JduPuh4M4Il5A2o/G3Pzx5SwBmwdF5wh77n794nYAGc
         FqwG9CuCfs2GI9t27Y4AwvXEbDC3WZ1Lk8hjMMV0TfMYHGPjE5ASjTjLCAwbgm1wpXgy
         0NDmUy58Kn+I5j6bXfxDzZKy07/1fDMEvRAir9IjIK70O0Ns28OYeMaRmwsRLcrYpCpT
         2UNmqC1L0FMPKVqufhV0RxtB6jpkB8e/yAQsiZcYWAkiZZPCvgdrwlpf/pgOp9UIhdLr
         pOcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775609235; x=1776214035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhUSt7ISpVg4Y3MHFKzYjd0CV4ZCvpoOMj+LKGHtSi4=;
        b=KKvqJdv1deFk/NCBYGoYx7KsXn37UKrHhWvdfgpGnZNPnPwsPABEoTOuQY10pLF32C
         cmAbsc4sLMEmxWTsLiuvkfwLv4H8ivPdHgM7rOjGyYSSocIogd274WfUUY8MoV7VE/F6
         nLA0DQCUxSrmzkjm3cticRqKQZ1KPnaULPsp2NbMzjnI3cdNb2ts5JPINkdMeqkzTZZ6
         Uus0SyNXXPeT24XTqT2M1mB3K1xyvx0MRVSIA0HxIbZFxn983ieNym8TZKZdc57F5sWU
         vaV6b5wKO2AaeLKNQu1LxURCR0aY+7o4KhcJDzetJru1eL5fbFgyj+W8aGR9EnVctYAT
         GgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775609235; x=1776214035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VhUSt7ISpVg4Y3MHFKzYjd0CV4ZCvpoOMj+LKGHtSi4=;
        b=V/w/cYQ6SlqmvkO8kj3zXW0rAokrFPKM7lVBrJ76EoMBmBRpfNOICpyHRI5kzIPDhJ
         0T7AD9+zd2lOrBK+oUoorT3C2Ym/tTv7Y6WjUxZ8lcxe9fqgfxno244QPz5IKFiT+CX2
         NzYvQPxKTpJ6h17/kEud3V26xOpB3/HAwOIJBh9+EAfi8wOJf3bPvav6wzpdNovHdMJZ
         juuLlt+gJeZVKB/b2iSYdV5j7Lb4GMSszm7tCH+UiJSO0S1UH1lKYzvZhMTac7vuXnlZ
         LkSK8Wqln/nCpuUMH/R7mD12G9qSceGLN1M6QRDkKMsTNmwvnen+mUAvZjYCMoVd2dEO
         Y5SA==
X-Forwarded-Encrypted: i=1; AJvYcCVS4xmAvuNAHLxLUtkVtiDne9b3IdMOX1pe3h7eSLpf4iYUxm2SCPyILqrYsRwf12OYAh27/e4Y958=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGCcnxTb2CueaPFX9DXN1GixmBQmOA4gVdgZp4XuD3FCFGKuPT
	jwCkzh/EXe15aC81IyLlF50rQNHkfvV66aaFbzqbhTwCwRtpAGKfZV5+pYIUWrr3g3axf2qnHHu
	XEebDOGaguHI5HlyBm/7x26yFO4HXbFNo3iVDK0C7
X-Gm-Gg: AeBDievfYkr7H7S8mnLUp6jJ4IbRAu5fg0vRGMLzZhHIEzZZWUac5wV0nbIAQIudGl1
	9HODqEQWMriJtUo48zyI8G8MEwpW9378nqw+SsyDdL5XkpfIw6uQRNqkCsXYWgfZQ8tXBjSIL+z
	Z4uOIDWQfAMDIeZUu/wCIGThs2Vc7sZlBzbtftef6cwgDwOKbBWyoe5RZs/FGhKnAl/CNy8T/ns
	zHDX8nngrgLSQBpu9CnzvnGEdZNruXQ2ing2jPnV6ETbw42xzJlp0+yqTqoMCO25vGsWf2eL7V5
	C+e8b1k=
X-Received: by 2002:a05:6402:400e:b0:66e:e3f9:ebb6 with SMTP id
 4fb4d7f45d1cf-66f9eb0e641mr16529a12.4.1775609235225; Tue, 07 Apr 2026
 17:47:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404002149.wtayv6a64vzuppgp@desk> <CALMp9eSqgL5q-MY1xpjqR5oRn5_cb=mfEhNFWusNneS=Mx8UMg@mail.gmail.com>
 <20260404034954.t7iapenzvhdpagxp@desk> <CALMp9eR70eE2U63gzNzTiic0PqJVGv3CBBuVUOVbi3nqbWKZkQ@mail.gmail.com>
 <20260407163943.y6tkh26z2rfktn3y@desk> <CALMp9eTA3cXxuOT4dq=6y1hx52gPH1ywwTEmPQ5-fA-vz6r3VQ@mail.gmail.com>
 <20260407171151.2gf2idjbmph35ypb@desk> <CALMp9eRNVGFpzk_-ajQTuXadMtoY9H-ndUaz78wTT1zDYbTrPQ@mail.gmail.com>
 <20260407191128.b2hr2ttkdpyunhrr@desk> <CALMp9eTK0o7Z7-oTB8ohvmoh-vy-Y2qjdUvbqD6HaEhOEPZmhw@mail.gmail.com>
 <20260407222738.lrartp6evfp7yhti@desk> <CALMp9eQjSqwnvJz4JVzYpMkkTiucSJtW48zC4Hj9GBiUhOH-Eg@mail.gmail.com>
 <a605fb45-f8e3-45ad-8924-1da43b9a9e05@intel.com>
In-Reply-To: <a605fb45-f8e3-45ad-8924-1da43b9a9e05@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 7 Apr 2026 17:47:03 -0700
X-Gm-Features: AQROBzDwO89X4_V9WtLHsu6z2_UbVoDRV4IxmA1X-n2IZi_rt3P0Mq9B7UxbbGE
Message-ID: <CALMp9eRfNsghM_RnDXOs=SJYObfPa5A1aOVDZno_zJ=XotfmRw@mail.gmail.com>
Subject: Re: [PATCH v9 02/10] x86/bhi: Make clear_bhb_loop() effective on
 newer CPUs
To: Dave Hansen <dave.hansen@intel.com>
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org, 
	Jon Kohler <jon@nutanix.com>, Nikolay Borisov <nik.borisov@suse.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, David Kaplan <david.kaplan@amd.com>, 
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

On Tue, Apr 7, 2026 at 4:41=E2=80=AFPM Dave Hansen <dave.hansen@intel.com> =
wrote:
>
> On 4/7/26 16:27, Jim Mattson wrote:
> > What is your proposed BHI_DIS_S override mechanism, then?
>
> Let me make sure I get this right. The desire is to:
>
> 1. Have hypervisors lie to guests about the CPU they are running on (for
>    the benefit of large/diverse migration pools)
> 2. Have guests be allowed to boot with BHI_DIS_S for performance
> 3. Have apps in those guests that care about security to opt back in to
>    BHI_DIS_S for themselves?

I just want guests on heterogeneous migration pools to properly
protect themselves from native BHI when running on host kernels at
least as far back as Linux v6.6.

To that end, I would be satisfied with using the longer BHB clearing
sequence when HYPERVISOR is true and BHI_CTRL is false.
