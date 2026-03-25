Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4785828C869
	for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774461075; cv=pass; b=JVuNVQv14z6C4fgLKr2UzqlrrilXnzRzKt3G17IrxrHXLqnFvAXwnXMhOXXhFL/+K3oUosI4W+gbdDpE0/rSmC1ZJSAD2Db8FP4p1Oycs20v1k4QOd2P2BkcJgrrLF6Qfuj40X7JEQwZ3ArSsU9pkx+BqtVz5RuKXU8AiZIZ2Cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774461075; c=relaxed/simple;
	bh=LfOHx404KK+zENd5k0iKvf2df8c1QUv6Mhd4nnrA2k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBwaJLkNYHJV5YEuxevIJXaON4NaAibN8ReSTa8QYqP4PbtGrI+QyZM86x2ztryzd1n5RwI+8VJDXzIpCZDvTXM3wM+BbWtFiQ3WX2LGOXcIUF2JCq5CjCx1gCHJ1kqcNRk+SHDueAQz8ED342ej2mthZLQ2puxR5UysrJ70I7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dfl+pF2P; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dfl+pF2P"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-661ce258878so1278a12.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 10:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774461073; cv=none;
        d=google.com; s=arc-20240605;
        b=NeCi+nz45oOT9y2SVcmCpg6PnRI6z1rowjyfPABXq+jE1iyBDQrKtfJXe+wjaJMPH3
         xQ3lLsS+yX+s6Z5vxXqNHCSkZVQqbIeV0+535naA1e79G4PBfZaPMZVYdxF8jlMnZwCE
         q+H+4vnk7kh/AE+ggoAopZI9ZK2ZqqXHTva849ADBMlDRpH0EGrZUV4xpSdAlO64EcAv
         9tWx6VuWc//GhZ4FAENHh6uc33XvRopHNcrxybx7IQ3TnjIXdYjSEjl3YaoDLflYlHbc
         ykaZXKh30W/GKE3Hqg4fvdb9NF/Pq++KI1y/znPOkEDsHprHUuyMpAQCyYTp1WEBJE24
         svEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lcdS5CNtdEsSElOVQqwojbHt2Qxr4nffxvoalO1pdQk=;
        fh=c/CXBmGE5Nh+e7uJREFWecO+/r83vzy2WHttYxGTZRE=;
        b=U8l+l87+KhyI5g2i/aBQLM/WdjW5lJbe02utar6GZLlVP1H6UOHQvft5QaSxBW/nAS
         InGYyoJtwdaJA73V+w6udSq7qGW3SIEPkcd5SJDTQDaHk2uPfjrtWhBXmPnISlyGq7H7
         ZdjqvNX94T32G1j3xs0Mnv9FFnite9yXCi18m3fw49SMJnpzM6M/eTXtBPAE+IsM0YCG
         RT6SOAbEMT5sUdpMSwUyFE2tRujrbdCxLJlR6uKEdXwQFzzwmDrfPnGGN64phrMaxc+5
         Sf6Q0AuvNpeXjctd4IItzvhV0kVE4PDSaK8iMGNs/+kY/j5yFrS05b6G9yIRIMMGLD4m
         tQjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774461073; x=1775065873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcdS5CNtdEsSElOVQqwojbHt2Qxr4nffxvoalO1pdQk=;
        b=dfl+pF2PhlOSL6iG9cI/eNprk8ZTDAdh7yZPvVJoiii8dnxP4ffSAoPzCHcSK8l8xi
         g0SjFdBtNEhLpHKEoRwNjhffIvM9las8rkTkHvziL3Mxi5e1lewylzMVKDJptAQt9qKF
         yKSbWprn1zK4Ptp3sa6mcVOjhNuayGDqID88GN2qORDF6SlDDTCZlv83St0i0wMlOVtl
         4jd4feuZ0cdJBu2OlnDgnMkCKcM6u7ks/NDFcfkKmvuBTHbQs5uNFwbD5kNqiIHp9ZOR
         Xlv/jMtwtqM8d7p+tAHHgPxCuUIE1rkRhRt07M/Xbaxrew+Hveo7Vc9Is77855Lr6mhN
         JlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774461073; x=1775065873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lcdS5CNtdEsSElOVQqwojbHt2Qxr4nffxvoalO1pdQk=;
        b=rnn6Ng7fPsISCQeG3LpHQvTT/NlLBhlZAmu4bp5wJLAO/tG+GW+Y/6hOvdXUtbXUc4
         7yKII6+HetF8q1unmB4PSWkVL6l6uW5hOnXCANyT5bbvkCKK1RXxmWL6E1iQDhWLznS6
         hOdLOkAketiUDVIQhh3fhymcPk4v/H1yN988L/Ke2072Lm2GziuMocNMuQc3hqoaIiHq
         xhvUO20Go5z9WDFOwYFRkUMgBqNzIhrGCa6qV+tbYgSbpq/8ogMKAOZUE1qZROfViLk6
         iPRlFt+TTETjwaE4/hzvlee9efWT8WQXXmCbZDcGqavC0293gGMJVF29s/1cYH2hiWBe
         rnJA==
X-Forwarded-Encrypted: i=1; AJvYcCVKWyqMaMbfUQTy55UGCjKbr9mlufRYK14YCL96g3F9i+yGtyCWIhMhU37hDYPDd8UJ7cNnIciwqXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDzaKh/Jk1PO21v+Cr0bOqvjXddJKU8O5Z4jl4VBZDfxI0EGVC
	BF6BkboBSfmHz2xcMDOzJUaP+Ulu4uwv2IolcqdF2ogQlspvwtc4O3mSVRVnrg/VuKEPdxSiMnf
	cFEQ1A7weoQpWAqbz5HtqkKroR9I8ky6HAPHl+/AN
X-Gm-Gg: ATEYQzzIJKs8SKjsqU4GUrcueNxDoxgRwZpDfXkVh+O/DmNsxZRyEqx6q7jrdTLoRE3
	540DXiA3WZOMJ/xS1oxkztQIHOTcsBFjJpZDSB7FrGlXKAJ27JPaXyCQ7Wpo3E/WwkaiejJ9r1D
	O6KPklJrIkRLXzJmtnkiOUVz3F38zwho0AtrQPp4fJjeCQnw+SRwVF1ERAmBK2RYGMUg7b0+eme
	cu+iWi/HL40/ZbagOiBv6hstaTSrqNabZSM1Mo/GX1yrGZYMXrgJrXJSxFNEIL3V6vM3PkZ7Qfz
	6IBJ6Fs=
X-Received: by 2002:a05:6402:1451:b0:668:c2b6:9fa2 with SMTP id
 4fb4d7f45d1cf-66ad9575059mr2781a12.7.1774461072029; Wed, 25 Mar 2026 10:51:12
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-vmscape-bhb-v8-0-68bb524b3ab9@linux.intel.com> <20260324-vmscape-bhb-v8-2-68bb524b3ab9@linux.intel.com>
In-Reply-To: <20260324-vmscape-bhb-v8-2-68bb524b3ab9@linux.intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 25 Mar 2026 10:50:58 -0700
X-Gm-Features: AQROBzDwHlJH5nkrozA8k_jCaaxMY2azgH1uzVE_N9olWzdVjI8yDoxoWPHYtxY
Message-ID: <CALMp9eTZRucL+CUSp1yUPG0aSTpyQ=po1EmurZhX9+R+vxgbPA@mail.gmail.com>
Subject: Re: [PATCH v8 02/10] x86/bhi: Make clear_bhb_loop() effective on
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
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 11:19=E2=80=AFAM Pawan Gupta
<pawan.kumar.gupta@linux.intel.com> wrote:
>
> As a mitigation for BHI, clear_bhb_loop() executes branches that overwrit=
es
> the Branch History Buffer (BHB). On Alder Lake and newer parts this
> sequence is not sufficient because it doesn't clear enough entries. This
> was not an issue because these CPUs have a hardware control (BHI_DIS_S)
> that mitigates BHI in kernel.
>
> BHI variant of VMSCAPE requires isolating branch history between guests a=
nd
> userspace. Note that there is no equivalent hardware control for userspac=
e.
> To effectively isolate branch history on newer CPUs, clear_bhb_loop()
> should execute sufficient number of branches to clear a larger BHB.
>
> Dynamically set the loop count of clear_bhb_loop() such that it is
> effective on newer CPUs too. Use the hardware control enumeration
> X86_FEATURE_BHI_CTRL to select the appropriate loop count.
>
> Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
> Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---
>  arch/x86/entry/entry_64.S   | 21 ++++++++++++++++-----
>  arch/x86/net/bpf_jit_comp.c |  7 -------
>  2 files changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
> index 3a180a36ca0e..8128e00ca73f 100644
> --- a/arch/x86/entry/entry_64.S
> +++ b/arch/x86/entry/entry_64.S
> @@ -1535,8 +1535,17 @@ SYM_CODE_END(rewind_stack_and_make_dead)
>  SYM_FUNC_START(clear_bhb_loop)
>         ANNOTATE_NOENDBR
>         push    %rbp
> +       /* BPF caller may require %rax to be preserved */
> +       push    %rax

Shouldn't the "push %rax" come after "mov %rsp, %rbp"?

>         mov     %rsp, %rbp
> -       movl    $5, %ecx
