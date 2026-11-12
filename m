Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442552;
	b=1MCxpVslidNXvqE6em5hW9D1orawbObp0mLlIm1r8W0TcVGUaWy3h1WFCXuX/wza58Bu
	 Esw462KAg47hKojU7q/VU+O0NkRc0udw42iYYeyV5SPjHx3VPDu8QoBbc8TSDQOk+737y
	 yRGhD0FsNtNv3mzFgUIQg04zm28IVibtbh+m1izMvA7xhh9W2hnC/XZZg4QKDkq6uIoLf
	 I2TiP+Ubni4stO95YxLy9RTWEVgtCmTLwpstzOzjoq58BHthqapZegHn6Ml3gPBP948md
	 3wCevASnq7dg9puSHsDCOoeTQbBNRE5IF25aZsvnAGdtSCyIm3IvBuuaD1Hr1tzkV8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lUkgOmlD1qUG4Wcz7+Mcimn61fdye0spBX22Tw8NSx4=;
	b=aK+YgkJpMXJC3zJ8JtyP2nc2imjWGBI90HaW0ClVERgCMOIygtXXzUeWZp12Fk8qkAPl
	 gJHfhNG5vAi5VangFij/rjteHodhVqb3FaDLtppZK3UmLS/q6U9uLOEzdlOw9EPOX9fQY
	 FoGDk+z9Hus7iazbtkwnqSXjsu7GRTnXswcVLUHVjyX8Eu9X5yqjOG+nlWpk99zg5vZ/C
	 boyAqjmk0yBEQNC9WUjF8rZduhOkvWg+aOCitLvnXXhJYhAU/+RCKhOfgUBY80eKj5HDS
	 S/keVJDtGrEl8qzuZpYtw9CMuow2qb0r518K42aIZHPR8n2YWF8MMwCpWbWVvNS9hTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="e/GCmCMI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83159606A321
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83159606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e/GCmCMI
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso2642a12.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:15:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442550; cv=none;
        d=google.com; s=arc-20260327;
        b=NpkrJx1xty0WYbYTC/3EEe1+OK9KaVn2kxUAblzAPBk6KLPOPWyPKNu7JCvIceME+0
         r3ihLqA0tFvNVVJGNca/PHlql9UrCJoGQopdR2eiKgZfXUXK4nUSwHQb+fNVP4AOot5U
         wz2qI4QlW7v4n0PDMGavjxoz8jbezMteAO7wQuTo18UM426ypEY0GEd4wbrOps8oXNYw
         FfBq/H6wEOQNVm6Z857yOsBaS7GyEfq3/DGwP62q9mTVnT9X9KGV6lKX14sp897CW0al
         GahJcjODt3b9CQqtm1FrcoM3lPmt2EVAIdri1A+jU5nCpZgG/q0OvGrH1aHpL3N3fMZJ
         yeSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lUkgOmlD1qUG4Wcz7+Mcimn61fdye0spBX22Tw8NSx4=;
        fh=Tnq2lEP14nYfb08eWDWJfe0HlnI5CUa7j+/4+JVMKoQ=;
        b=oK4YuATA1PL89H3/RG7xTDCn7VvV3jKY+KSoNeu6nlkpbTaEwUJlCG3b+E7nnXeyAZ
         ICXa/CtTKJKrYQJcjS1lspnS8JDctMc/b4CJs+HoFnmvfB4iqIShdEBy0n7q/02L0SFh
         DOHxcbUy9dtC1akyBcNpewx6U2jC+U3G4xjsT8lf+IwSqLtN7ZrEJRgpSpt3ROovUreA
         GM0Y1sQPBDOelxN+MDZ1kU13pfBpktj+7IjZvHAOHLxMY25zudCy5ndenBCfDA8tp2Fz
         /euWb0w3m9cVZW+u7vdPR1mhm9b4ez0MJ6oJmt7Yo8f0FIfOoMbOOJspAwhkR7gAcbX9
         QYhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442550; x=1795047350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lUkgOmlD1qUG4Wcz7+Mcimn61fdye0spBX22Tw8NSx4=;
        b=e/GCmCMIh4d3cfq8R1z1xxauNFqtbohTNeCEpyA19Yeg8mtFZCVDn/8EpuaaxSQ2xV
         vbBPGzblo68RCg3AECof9kmex4/J+VkyTceo9nXKl6ACTagIa56x3pIFlQdvJ3TNGEKV
         lbW0PupZKpfTcaVvlxLyKn/NapgwIsK/dqB+YbvYIZtvioZ8buwyH3+bLAfsucQXI4mP
         XA1sVxTtDdszEIWtwZdBE6ccZnwWR5v3EHoerhw3iMc3XDdHWQwbBsHwXHbE5yH02AyD
         +XHfAVQ4L0fgwTbvzK7l1u6kW1g2ilWhONad9skjTyXj4xOpTwvt4tcoOFji34EMS49j
         8l8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442550; x=1795047350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUkgOmlD1qUG4Wcz7+Mcimn61fdye0spBX22Tw8NSx4=;
        b=A6fCzdQaVoPeXfSp81Txa9PxIiYupD3p0VbMxwT4/z4TGwPCA8NuifwMUK9RQTVUfr
         QTmp1NHTbwFyc2Cxy6Yv8htALOscvBj2k5YqB8Rv0KXCfOXlvDtSNCEHhP5+7H/Qc7KV
         C3vswH3ElT6igdXJdpaZxCaToNwZQXnu0KJXaOFQFBVCmNZZ10cA/aaXXIu6zJ1oXQFq
         FUISbBGg1cFYlebjqhrVZgWa4icZZwAF/p/R1JORITtd+JIpnlO1AJH3hui4j9l0J+h8
         ybsET/kg7oET8UfBbVdr+xCekk4Dot7GaBpI7GiGqxTnKyprlomFAg/83dr6NXs/xIPK
         ZLew==
X-Forwarded-Encrypted: i=1; AL+hErE6+1T7674l2poce+Q4Q9W+2omPJYXzlwZph6GaJ2dveUcJbCCGpk/3nycM1ZTonsBJWlysFsozBLw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WHPvhJeraFjyyhUoLJTbIhomW5Pqwt+n3YvaThrAhKuwoyfbm
	LceelTnZbbJwSHak3sMTtAqR55R7gxA5nnd9yrk6UCJjqlmrLgCgBZhB229JTYGnUNRP73r2oo6
	pVDRlxu72JicPLxTauZmLrQ39nLWY06sfFUgv4dm2
X-Gm-Gg: AYBFou32c3sDz/meEFok1BlMpmCs02j0R0XUZ9BfV5zkuDQA8pKwaE7o/W+qdhKI8Os
	dkip6V0ZHZw2DhYYaaKRFDfWQIO/iexXtDKYF1L5yTDXkAIdmdpXOB6ZKJJBnGbczjR7xe+3wwA
	sGp/6YGTT1relbDir5ys4+UPnQEqFA5M7q+mpIeoOP5oR6hoGFrAfBmS0CbpyxHom5SjfSg0qXe
	WuRrUAHYUI5lzbA6Cu11oj3YuTO7Lfpb8VtLXkM2YIQyeJVwGJjjq0rFxIHKfryFAwsctdLIbfM
	VA3h20hY+2GKC1c27VbD1BxRVhlqmGEQn5jOGKW5hPrVb4gppPCQ5Gbo48a7rZnNeHmYFjbPvPf
	JYEaLQHbzt3Wbxjc444TH+1FFzr9I6SQJT+5bCNtFG88FE7SKYmt6yf58cV1FQaIEDv/8XXRqaw
	==
X-Received: by 2002:aa7:c242:0:b0:6af:afce:184f with SMTP id
 4fb4d7f45d1cf-6b79f5c8602mr22296a12.3.1794442549332; Wed, 11 Nov 2026
 16:15:49 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <f58eca0b702b6e57d87ca367a7693793e619d3d1.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <f58eca0b702b6e57d87ca367a7693793e619d3d1.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:15:37 -0800
X-Gm-Features: AclHuK8BRDjHRWgUjUQI_bBfAQydWugPH1spbS9sNXXgu0pmOPALjqQkmfs2iVc
Message-ID: <CALMp9eTcUkG6wUaZXHSsGmz9Rm=MwYgrA8DfCuwUV1c1Hp_f=A@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] KVM: x86: Add CONFIG_KVM_VMWARE
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

On Tue, Nov 10, 2026 at 10:07=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Add CONFIG_KVM_VMWARE, defaulting to "y", to control whether KVM's
> VMware emulation is built.  When it is disabled, vmware.o isn't built,
> the VMware predicates are compile-time false, and the
> enable_vmware_backdoor module parameter doesn't exist: a
> kvm.enable_vmware_backdoor setting is ignored, and modprobe warns about
> an unknown parameter.
>
> VMware emulation is only useful to VMware-aware guests and to VMMs that
> offer VMware compatibility.  Let kernels that don't need it, e.g. to
> reduce the attack surface exposed to guests, leave it out, as they can
> already do for Hyper-V and Xen emulation.  Default to "y" so that
> existing configurations keep the backdoor and its module parameter.
>
> Provide __always_inline stubs for the predicates that gate VMware
> behavior, so that callers need no #ifdefs and the compiler drops the
> dead branches.  Leave the operations behind the predicates declared but
> undefined when the option is disabled: a call that isn't guarded by a
> predicate then fails to link instead of silently doing nothing.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Link: https://lore.kernel.org/r/Zy0__5YB9F5d0eZn@google.com
> Link: https://lore.kernel.org/r/e3f943a7-a40a-45cb-b0d9-e3ed58344d8b@redh=
at.com
> Link: https://lore.kernel.org/r/aIEmawm9gLflg8zt@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
 Reviewed-by: Jim Mattson <jmattson@google.com>
