Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442653;
	b=RHjU9UDLCCjlEtBov/H7f6wlgsJQ4DX19EZAO1Ceq1d4QhpjmSXp3EC5agzAen7NHlgk
	 kHQVdDcnwJuB6CugJx4S4osay68ViftN7PGyX0q6RXW6/yaUox0zwUl0/hSvMksJnUjbs
	 ueTsFhhpIoQPWiQfgzxerXgVbKSwPUesyIKk5O7qcPYgM+IvJqI64RoEwzK6XGabpm/gr
	 9RQ0D4OnRiCn+GLCwpRdh8vvS5yP75mSTq1C2qZm6unok6qxImgzJQTwePeap2kcYkrsG
	 6rLfWcihRU5NCBZ2Lf5aBdLAP+dskP5EpAAL2c4lOc5tRg7pzhDAgscChB2qRe6Binw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gmUxuFr1Scrtzy9jq6/XBAc+K/Jb1cYhpFQ7OvuHQow=;
	b=xWA2BhEQoLzt/V1zXqzzQvYCaCTH4t866LPZd7XGX3cR1fRa3F24FVRI5CA3lcRDdW+V
	 VbPB5hJI/OjZ28b9ShEqdee0wwxzeg9QaN+IE6XTFKDRCxufbYEyNLLfZVJ2AZuyVhlYh
	 91XlzOl2qT4UK54qLvwGypppsp24aUUePojfdD4F6r7rj0Ezt45A3Gw/QymqqpawNdyt3
	 aT9qvIDY8VlTiD/ZNpJq/eQ+a0SH96pCvjIkUOHqjR1aD7GeVRPHnISXPwOG73UtnRkBN
	 DHys0sJupxh9xzncgGppwqZGZwiWRIyZITo8DUCS35vay7dEopnNQSA4HTGxcEKa7lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QY+9H4KB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB1A606A32A
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB1A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QY+9H4KB
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso1715a12.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:17:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442651; cv=none;
        d=google.com; s=arc-20260327;
        b=T+8+mS0Tr7pB6M7E5oO7A0ENy1Ru2aJAxBetp5rGn+MgkNGIxcILBMPJHaz6jitBYC
         lQ6GKHKoj+j36Pv6vVTAdbjDQhPaz2ferBrazj6oKbFnNAebJnJs5H37YD/OHjXh0UIN
         JLx/q/8kTySWhhyublmVJJSLvs/i2zeVZFc/qy4eHuUvglf2GIDphB29sV/rkWcFF2Ce
         jwmvAc7HpmISBwDmV8D+8fvYC1KGuHUlGWZ01o059DIDCxJx0BMhmg3XH2IsTboRH4OP
         5KUUSruuS2xoXHuCxv3XhR+Q1oBhf+cYqiAvchiS9MCcaGeAbOHY5uruTSBMPRO3W85o
         ptmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gmUxuFr1Scrtzy9jq6/XBAc+K/Jb1cYhpFQ7OvuHQow=;
        fh=kIQwK+TX0YLCtBI+QtPU+4uqSCWd5pdcwLhoA3tpPoU=;
        b=aZK+P8HIPUbGO9Jsh3/t9CDR0nSlr+sskTblwds4rhQAHmERDiEg0VIQiassZewFhL
         hhOh7xtjSBhlKw4rnyf3hn7BVjfAJHfLJA8ITKf3nlD6PBsVoI8nLQM4Vhfg7F7xUJVk
         HwSxG6ncXRs4i993kMZ1RlyHD/PVw5M/JVshP70zArsGbDZnb9FzxEnkOllJztinsqpO
         PvUcHh7XS2rxbESNKN8PBBpI3GLsYb4JVuMMZwZgXoY1sv8faZYORM3AN5jfa1Hz1jP5
         X/O66VHRcweg2ycFVDBFbcXBL66wCbVImZDnkwFj+yCOLLErqIe7vt1oaDyC9/PxA3vZ
         o2Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442651; x=1795047451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gmUxuFr1Scrtzy9jq6/XBAc+K/Jb1cYhpFQ7OvuHQow=;
        b=QY+9H4KBVMuRH6WseMYE10z/E6oHDTOxh8WTDUyV9c1OJB/L2GOFHpJ8jTAfTPyNx4
         fnThIGMHJGQSj6hOU/X43MCGlvQdkiO64U45kfZ9SUWdV/nIBHN2yM8WjPL3ie/cE5CL
         KfH81hSPqG3FwvK/mbyH0AKy8wh/batRMthVd52IT8+bfnWhQT7GUqM9nWa5zuL3ThA2
         vyuaQMrfbHHFgxJvYpIprSsfvOxsGEFsy1XtwHw+8+fLUvC75LYsDziB7kDmd1lIZhDM
         bd44g2vlfdilYjpd0y6qdWk/rMix5Y9GFOEv1PHFlj/tkpTWdZ1OlzmijfV4pNIibtQj
         5FwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442651; x=1795047451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmUxuFr1Scrtzy9jq6/XBAc+K/Jb1cYhpFQ7OvuHQow=;
        b=yUe+8qFYe5bKJzKdMXGiFy3LMM/aAO/Kl2fzZSCmjT/JYVvFopGR4SctWd1akqtOwC
         cZhy6fySv2hvbct/Rc0REpYcXlqS+C8kXwZCeXrA5ytaxPVm4WuzxTK4B3TmmmzVqjIS
         0cqLlSEBtWccZksXWufj9R8tMZqOSX4nY6+ZefoLbK8jPphGXD2cecLnkco262mMBzRJ
         R3OhrgQ4ymaBcHe10x9lyArukaGnbwfvVDooVdso/keISJ7fZqL2hDCGingnbmgncZ/A
         dDPhhxc3ln23h4AqnziM2NdG/I+s2HnA6xUzTXV6u4nMpcUAOUwl1EdeplrQPHC0VmwM
         jEKA==
X-Forwarded-Encrypted: i=1; AL+hErH52mFRacmjYd7JzE/Aq/vYRUX4XTxFNIu2iMeDc+61l26zauXB9Ztd2qGQXYn5BX2NlH5ENJOYbIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FBV/1rVa92TQR6uEN1i6931o/FhUYHlwsaQMjcjOdqw9rdhBW
	E1e3yWlB88sMTd+h4B3h5cixaZnHyO8LojF+LgXf5fa/DPaUjj7U4cFaTe+B/m92h8wDxjDhAxm
	UN+SfGquz2P3nBrEiRDwJJFBjQ+pEOjeGPNdNeuYm
X-Gm-Gg: AYBFou3694qdSskQ6WMmsyCOTmi6bUcYXdCLwjH+JdzNI5MNbcmFtAYMPLqThw3QaIq
	knSYk8B4BailqGe2U+1N6Rwd6TDE64wItXB1b4crKC4z5o5gz50EutHDAvEYQGqilYQlZdy25mN
	aUqYPLw4vyGjeTyrG/BmC9wcbBEa79+d+h8wG763ExRyAyl+JdVZI/Bc9aY5zU6kdqHdWCJ5Joi
	RIPPs6BLFglP/Hn5WNnlzLHv93+K+8C0GgtwIpmW/mN+TNL4uuhkmPVcxYcRTOZKOGy76RRIuPF
	7qoZkXPSUB+uPI8GKEkjMEtDhrbl7HD1bcPs5KS4C559pJSRidSPI6X2A+BW5sNRscyPAn5Xfzy
	0B4/DcvHv3unPmXzfrYyy+2DRejpt42wRaXITGxyxoU+Z2E5dDVu8pO2S+O/IELEGQAlHf4ZB
X-Received: by 2002:a05:6402:327:b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6b7a2a18aa4mr17979a12.12.1794442650687; Wed, 11 Nov 2026
 16:17:30 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <80b2f51ddabc3824b83da48fc0def984cf808965.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <80b2f51ddabc3824b83da48fc0def984cf808965.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:17:17 -0800
X-Gm-Features: AclHuK_V43cL9OcDFeVKDhORDjmYSlCIZPO3f49bHRt-Tpt3bJyQNBhejjxGgLw
Message-ID: <CALMp9eQvP6hdxJ2-X5bhZHfaM5JCsvVJe07OkzTnnQhq73mW4w@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] KVM: x86: Add a unified VMware capability
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:05=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Add KVM_CAP_X86_VMWARE, a VM capability that takes a mask of VMware
> interfaces to enable, with KVM_VMWARE_ENABLE_BACKDOOR enabling the
> I/O-port and pseudo-PMC backdoor.  KVM_CHECK_EXTENSION returns the
> supported flags.  Track the flags per VM, and keep
> enable_vmware_backdoor as the initial value of the backdoor flag.
>
> The module parameter enables the backdoor for every VM on the host,
> whichever VMM created it.  A per-VM flag lets VMMs enable it only where
> it is wanted, and the module parameter keeps existing VMMs working.
>
> Use one capability, so that the hypercall and nested-backdoor flags
> added next share its validation and rules.  Accept flags only before
> the first vCPU is created, because vCPU setup configures #GP and RDPMC
> interception from them, and don't allow clearing them.  Limit the flags
> to bits 0-30, as KVM_CHECK_EXTENSION returns an int.
>
> Enabling the backdoor for an SEV guest still doesn't bypass the guest's
> I/O permissions: KVM doesn't intercept #GP for SEV guests.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Link: https://lore.kernel.org/r/c60b32a3-e699-4a8c-8d52-09b34c4d5269@redh=
at.com
> Link: https://lore.kernel.org/r/aAjrOgsooR4RYIJr@google.com
> Link: https://lore.kernel.org/r/aAkgV3ja9NbDsrju@google.com
> Link: https://lore.kernel.org/r/aIEkrc7Mdf2ia1Mm@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
 Reviewed-by: Jim Mattson <jmattson@google.com>
