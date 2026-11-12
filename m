Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442462;
	b=swkXR//gkknp9xBpaNDAWRPLZ0tyEC1dld/3hPn2/VXFR5hUVHi39A6rga9T2PpGID4F
	 fsvMa9OZmUZz6lLfAlbtkV0TFzaFLp9ObLk5+ppXlrlXTMJnUR/0jnIkXRUvBJSX/EvDv
	 xLgdkC7MWk6t1IGAYs+UUwLSvPhFZ6r5Td1syZxUtpTFCc0uYdSDbUm2mHgtyFj5WmvwQ
	 2UEUjpcOz+ubzWHle/q1RdJYLsTbabBQzdzedNhyn8voX03iaJTfNP8HDuOHgpQl+xnbC
	 z6Utoq6l096faqjePDDeceBG7St+EiT/x1HLsdyy9aOU9bOyP40KqLTIygytAHxIm7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=38yqiB2sXmOQNevupAUQiKNneKLB/boGfQXhDS/dCY8=;
	b=r0ZfmtsYOkIv4O1c2HhpyjMqhDzrAVBmiU3p59ISelPR8B7FA8nD1fdPTJ1i/6RnbC4p
	 4gvDTHgHaSaIhbN/UbFYVGb1Qc8YLeIwXFvXi01YVa7ukIX2/hRql/byepebB9yrTD/nG
	 tqAvzkg/Uh1P8j7bmKLeR+jQ+3LL6uj7LAG5KYaRfExxzbcykOHhRVJrDXkS9bzM4fSzB
	 oJt8KKqYjxdvv6yoImeXM+o3AGkAIIyjVQS7gYxE9VFMtz8j29SEXktYLfodaUcLj3kV7
	 IV78Qdtet55HJPiqU278OeMXqRx5J1NbABh1nrnUs8zDse/5ia886h7XT49D39ZLMOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SDyjaxyb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AF8606A321
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9AF8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SDyjaxyb
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so1584a12.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:14:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442460; cv=none;
        d=google.com; s=arc-20260327;
        b=QGqZVtkt08NM+dCTzm93Ep8lBe67gyE7xk/AQx+EBnChrWA+WUwzW7h2sBop+9JsZu
         0Xme7v42pncCk9cTiC4mPCWrKT7EtWJUlksBo6ctAkwVFHM52xQrwH943wc4fJtXUWFo
         1xcRFgS14kJmAPoQTm7+tEUZr3nN8e+wqA6ffSPxMJYlNrC9RZwVX2S5hJVtVRw2FyaH
         R7c8ll36VyjEAh2doFYQdv/yKk7/QdSeI/kPmoEuxs5BHZuhhKltGTuLhTPN3Z4s+S3C
         gD/w8IrtkzltyG65uPR3f2daMArwckDrsHvLICma58Ke9l3Ttlqs+ehq2UJtUS08516v
         dImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=38yqiB2sXmOQNevupAUQiKNneKLB/boGfQXhDS/dCY8=;
        fh=lj6AgJLALnZSy7LUG+VcaPT3DqYZDWhCNWo8ClbmTGM=;
        b=rVuA29YyPKHwls1Cwzqod7Hw4OMsPfCsCQLmqg8eRuzMpZyhwlRG/cuF6nR/u4tigm
         utqjxCCY7rp0tfolLcfskppl/FcZ0bEebb20eAXiARaGRMWkLwWZI/ix1K3vovTstvy0
         a+w5K+L0jG+oayIUGFixZ1y+3lLdINBHpJoVDbbZEFEyHf0gFZZPgHgFgI/CYN+sU3YM
         tjAFow7emlRLvf90gscs6Hvensyn/CXRObUU2nTf3NWuPpN/uXmdwgFnFRqxfaMYCDLo
         rHDgdqJ5HQZoyRWM4hNw/R2QLR9mNqzMd7sWzQjzaCDH+V7aY5Rw0AwkBw7UFkZ0iusq
         pGTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442460; x=1795047260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=38yqiB2sXmOQNevupAUQiKNneKLB/boGfQXhDS/dCY8=;
        b=SDyjaxybfpDZ+GWIRXwXHRgNXxO+19SgUyPxzBxooYLTFpYqLIiTwWA4lKfCpMdefA
         ADzdSU7SYgKFDnyosvW7whHJ6ZFRKXJswAkYa/ScGcEVt0/cAWuqiv3shn7VsTJdDFUH
         Gayd79YDMjQ+hlLvmp7jtusCjGIeemXeOBh+dZChDXwF0xZfsjg1vt8sxm/z1dT37fAG
         uF3sXlwYAzk7LBljJaLhKboJHyc+MrKQQ7jJPuxiBPYP/Kc3RHhWIvNS7kCumAqjAxJp
         kZjJlWqbexuSuxva3sF7tsLWP3si7+ok/PkDEwCBrX0Mr98Trfvvel6FVCg7CdOnTBwX
         dKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442460; x=1795047260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38yqiB2sXmOQNevupAUQiKNneKLB/boGfQXhDS/dCY8=;
        b=1nq5Hb/7Ld58vEwzzKtWGnrBMx6adkq9+aGJ4L36ygiS2NycpUblKvSiJYB6Shw3gp
         Jyyo6uW9/Iwef87YuOfXkV5iO+utoYp2VbFppm+p+NE+5pY5MKjUDlwFNz1ujCvxGI5f
         FITVRMmCm3V4v0IkO3Aq3JdBVrcQJkTcpt80X0rJ4dnob4hEweYqRvgpbFnZYxpAo1km
         A31VvnMTGYzMR0vPKduZDN8qMNGU+0bGVnsSOBPBQ8F+ZPlszalPcSuAynzBczd9bcli
         TL4qu62mNXG328LWiPHGYkab03DFaKGcwI48H4+BMPJbPBHsPM0cOwRKW3yFpNFKXw3B
         JxNg==
X-Forwarded-Encrypted: i=1; AL+hErHD4rUMvDVMpNjqyBvxwMczITv5Ub3MIVZjewrKesWOqX/uNuN/JaXBg8twh8hDpVCvpBOBFwnLj4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DlVL4GyPdOyNHiBtsVt8f2AksnzHtI+yyNG25JDUfN0joV6/f
	GiEbrAcXEeoOnSCCharP9QQYn4/2zMgg7MQKRMFbn3jn2rAfeh+b6o8H78rKVIJKRBMis7X9989
	fZ+KIiYar19MVHpIXi8pc7AbHlf7OtjXanC11Egmn
X-Gm-Gg: AYBFou1wPo7waD/tr89hwepGxNf74oUD2uasu9uZXrq6FJ9d12mqNQ7rQzXB/8ke1Kv
	GKfRS3PV7wcU3U5I5uEZuIc2wSQQrj+j2iWhsQvrVWDy0ejgCAZIvB95Uu/bBImH4HIdQb0RMdc
	M2hgiha4HcBjboElMdLrZfv1JqyoLR4eCRU6UowBDlx+DDisoC0N5BE2owMsZpkMWiPgpBeF/wl
	8Vo+GhIJhRJZE+GdxkI0h7g6tNMLFAeqErqopVZvBeyOQViActClzKHPfYcCNwdGMvr6njuMaKJ
	LoZV8Vh+hp6DUPFVQpl2BG21qvUrkDM2hQCNhMUQqbY3w4juHxG8SivoiwoGxN08Rbs1jfq+9tz
	Th7KmAiGGmbF+zyY1ADIdn2IdiRhG4mkqtBbKRQ/XhIIs5Efpt/5HeZWQkGeCFdTC8ELCsbxa
X-Received: by 2002:a05:6402:911:b0:6a6:8513:7e14 with SMTP id
 4fb4d7f45d1cf-6b7a29d3f71mr25280a12.9.1794442459610; Wed, 11 Nov 2026
 16:14:19 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <07581ff5998d40092c2f171ffe1fb05ac48f9446.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <07581ff5998d40092c2f171ffe1fb05ac48f9446.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:14:07 -0800
X-Gm-Features: AclHuK_DBL8YBFb4m-FcpIKCAISr9plqpjdioafs2WWldumLjrzVfpqUvhMg3BU
Message-ID: <CALMp9eQ8ihM7LKSUHHOf-i=R+Gx=7ETZ3r_83P3SGovBEFX87w@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] KVM: x86: Move VMware backdoor support to
 separate files
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Liran Alon <liran.alon@oracle.com>, Arbel Moshe <arbel.moshe@oracle.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:02=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Move the enable_vmware_backdoor module parameter, the VMware backdoor
> port and pseudo-PMC definitions, and the VMware pseudo-PMC and opcode
> helpers out of x86.c, emulate.c and pmu.{c,h} into new vmware.{c,h}
> files, and add a MAINTAINERS entry for the new files.
>
> KVM's VMware emulation is spread across the emulator, the PMU code and
> x86.c, and both vendor modules read the module parameter directly.  The
> following patches make the VMware interfaces a per-VM setting, add a
> userspace exit for VMware hypercalls and allow compiling the emulation
> out.  Collect the code in one place first, as KVM already does for
> Hyper-V and Xen emulation, so that those changes stay local and the
> code movement can be reviewed on its own.
>
> No functional change intended.
>
> Link: https://lore.kernel.org/r/aIEgVpjXDR0BXgHq@google.com
> Link: https://lore.kernel.org/r/aIEwOToiAkKfQA-4@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
 Reviewed-by: Jim Mattson <jmattson@google.com>
