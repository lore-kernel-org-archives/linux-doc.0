Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443346;
	b=MsTdLZUJ6I8lUZ3JjHrVALJTk1Vyw5XkInGyyvIEUEvO8/wjgesqVgV3J1XZE9Fdp2fH
	 dbtZKp5+ph0rSNY/COrrd1XoBZdcnhvp/bVgxHWr/3PiaBMVRX2sye1Opyz1AMAlC57Q3
	 0a7zcJRRjXE6E+e2UlFdKPJCnvwPuie6XRN60fCF3cITpBV/JbXsMjQKQbHGysvsC4gB8
	 YGbUw63SS+8vcLu/R+24W/BnUCgBy6DLvOAHROvkIvgOl5k9hXkOdo9TKGotrShm1f+IY
	 3oVBJYk5BJ0hHpZm2A9dHl7KaIHMa5D8NvEdgXD5VW9l7cEewt6IVe25xwLpuKvIQBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GO/HzhqW9y47Gumkhuy8EImU/3z+JleZsJUrX3HvkHk=;
	b=pvA9CiBVCf71QES8j5cgEf/zLHdaXjCTBafT5mhD0JGtIBD1s6sUcQ2oFgDSkAQjIRJ5
	 ILa7JfrMG3QPmrPz6+eLB+9aQyzScZYS39WMtIAlWeus0MOQ2VzZXRTyXxntRvwaSyJWV
	 6kqG0JjdcSCWnB5X8JnLphrHk8BqMLAhMkEwQfVlHB1LpKA4JazIRya0LRX74crqUumSz
	 P6/EgQXnFypGfGoI5PsGPPpakY/l8lN+NKJnM9sLp1oPRlW5M96wikIlC/R2ls94PiR1I
	 7Qsa+SL85HMrpKSwF9XWV3L1szwAcdmEWH2uLZQmQ0HHVlfkhW2imKgsKhTrd6ZIMag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dWqQT3ss;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A475606A334
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A475606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dWqQT3ss
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso1779a12.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:29:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794443345; cv=none;
        d=google.com; s=arc-20260327;
        b=aSfvwNNTsXzUm1936CJlXGw1UvWxVfUV0UZcEqCRkp23geV8IW23f8FXCWf5AGGzsu
         EtfP0XOEMis4FpjtBzhxDXYKRFW7hA88Iclk0j8LSghq/4+pTMz5pf2tdBBOrFetfHqx
         SRX9G7VCwKhCE6WFu1c5xBXxUhePBNWpg1suS/tBaFYiDykqFCBIRMdxhPvjzcOeNFDe
         xj2T4S/U8Cs4i+bpygNld9DrP/pdF0zgzhEm3IhFTPFokMLZa49qTVKiM75KE0HZ7W0o
         RQIsgRY9GfGac0z8a0ZGRD67QIfAzbGXTy6/L8zLjTUIFaZVBmxQhIOD3f/labBz0bEH
         VkvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GO/HzhqW9y47Gumkhuy8EImU/3z+JleZsJUrX3HvkHk=;
        fh=ofTOuSCq4XyrBJ7c1GkEQyHLZ2z1WIu3i79aJ7Bkdas=;
        b=ilkFLUVCdDBo3lMoGOjMIR1lO/hl85CHDRMfU7naFCBsuj1M/cI0plMRHrEpwrJR7B
         vDmIObKMqAEWMB1Wcm+DZPKE4SY9Tzdtw8ncMkqiq7ckJr0WVzG1preGL1Puf0Jp060+
         kokEoyOR7QG9orkaw00NpqONE4ce8eX1LJS2FnO5fVhZyLahuLCfx69UIROsj9uL+Gpo
         Bt8gurkjh89gxU27MFU8Pv+rkUTnHnaYUfGFSmiEK87A0myuA2LhzjWSxxkz/5VdCuJd
         QKtxUA2t4YHXDN9HptzexAK16M8X3W2UQpO4M3HgjIYaYb8eojd7tOhexVF7fEzKA/0L
         ke5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794443345; x=1795048145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GO/HzhqW9y47Gumkhuy8EImU/3z+JleZsJUrX3HvkHk=;
        b=dWqQT3ssiqROBYD0HYMwG3O5nPjjOo5IjwINBmN5oc7CzXL85oVF14ngDDeicTy27d
         2Es7j4TbUyeAsRFZ5LMNnbcN6tngmqEe37zn6zQam7R70nrWKaO/Io0i8c3OltCnsjrW
         p6kxiLytSyLd/PDkEK8KyflKBQgFd5eZ+7Vk3JxF7KDwCDXijnylYtGY7rHNOWZiqOcp
         g1mevQ9evlsKf2tijEuVEGuTdiNRZH72IvJodG8cb1HsC1pBtbwAHx8rVIB42/gu/2Ui
         o/UP7aEJoLE4r5bEJX62xrTK6lyiZm7IFZ4+kqgjV9sNylagHLcMQXlzr13PdXPhKm0w
         LkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794443345; x=1795048145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GO/HzhqW9y47Gumkhuy8EImU/3z+JleZsJUrX3HvkHk=;
        b=xQkJOw8kYEc8wl7m7cqJphjqkcpiArD9QpI/E6JwPVc4o7Dt+90TGUMHYnUby+I3+f
         WqIq/XoSjTQWrzmAB/V7nz5eqMZ2x1j1T0Nfo3AlIpyXCAM1ln3Jnv1+iI00WlGqbDYF
         imlrhb5sB5hvsQtUl+aZVDu+3uprr00eKaot+NLIawscZW5ilSTyRMW3oqh5tGgoxnPq
         3vGKO1olhMXCPzYMYrFYfRxbvBotfjLn129E29bcY3KU/D7w6LmRaJH3iMn+nnvD1VJ4
         39Hzlwv/AuPKWT8i5xFBGF/XrMXrKur/2KUdk0J2ZQk8W8qlp6MjA5hE5/dtxP8GU6nu
         lfJQ==
X-Forwarded-Encrypted: i=1; AL+hErFNpIH7s+WlPkkixkXIeU+mbBgkcNaBDQIYxmNUZz+rLWDTvcpB23X1qqqGLocX58ywIWD98wXL6Hg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WClQ84ni0N6MbG2csxsz8A7nSCb3DuKNYtilAIW11EK3tvg8h
	0Mx8utgmx6jtvlbZ1h6+eVMGOwGAd4OqQgfwtiICptMvUhA6/tSdY2F/xP3DbSEmuMS8FZpAfEW
	f4gPmOW/JbK/jfRI4gos8tgqCdDr8BdMv8dxMIsZo
X-Gm-Gg: AYBFou0yK8VhkaYnroRxMxltAmzHAuILzdpRwqCDg19jT6tHJ8PIzukPkV3A93P9vfk
	r+cf7SGHcXTxXWHsCbwx3iCjYQyBifChzi34c3yV1CP7S9g6puQJknC5eLLJjnnp2nGnIatKPu5
	iz+ON2ACYnNVs++ceCo78+iiqYl0TydIijjlK6sXi50Kz/1peK0OYGnSPlfG4RQCxiQmAtAbWNn
	y/kQIGdZVNfSW1Ragu0QCrwuzzFa5FQukOhQ4ahyZqaUAzf8hLUI9RTl7taujKSAoB2wpHFfLK9
	DwPtSCBaXb0zpf4SssrVQul+ly2DDktnKhe2xGhIHm9Yq0r0duG7+djGCa2Vh1Ux0xGzIzgMrRC
	ShQGqPTtrQO85VKVhnr66aZ87i4jM530lXvISf6r1OdXLVrmP43lmYqhbx5HsfGucaU2bB4bY
X-Received: by 2002:a05:6402:4022:b0:6b3:f12d:7405 with SMTP id
 4fb4d7f45d1cf-6b7a2a2458amr26083a12.14.1794443344422; Wed, 11 Nov 2026
 16:29:04 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <90467782be23b83fd3e9a6afe2f1d2149eaf9db9.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <90467782be23b83fd3e9a6afe2f1d2149eaf9db9.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:28:52 -0800
X-Gm-Features: AclHuK9Fp7q_BxQtLzb7tD29UbrmuAxqzi1HMzLWvRd49RzuQMFPjipCoyh1bWA
Message-ID: <CALMp9eR2tm=RkNk_cYsYj0SZmcUBTfxpYiqtLbtCE4TJ4H6jzg@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] KVM: x86: Forward VMware hypercalls to userspace
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

On Tue, Nov 10, 2026 at 10:05=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Add KVM_VMWARE_ENABLE_HYPERCALL.  When it is enabled, exit to userspace
> with KVM_EXIT_VMWARE when an L1 vCPU executes VMCALL or VMMCALL with
> VMware's magic value in EAX, and let userspace complete the call by
> updating the guest's registers or by having KVM inject #UD, #GP or #PF.
>
> VMware guests reach the hypervisor through the "backdoor": either the
> I/O-port interface that KVM already emulates or, on newer guests,
> VMCALL or VMMCALL, with the same commands and register conventions.
> VMware's userspace implements the roughly one hundred commands, and
> reviewing the command list on the mailing list found none that needs
> to be handled in KVM (see the Links), so leave them in userspace.
>
> Only claim calls that carry the magic value, so that the same VM can
> still use Xen, Hyper-V or KVM hypercalls.  Never claim a call from L2:
> the only L2 hypercall that L0 handles itself is Hyper-V's L2 TLB flush,
> which doesn't use RAX as an input.
>
> Pass operands and results through KVM_SYNC_X86_REGS instead of defining
> a second register ABI; KVM_EXIT_HYPERCALL returns a single value in
> RAX, while backdoor commands use RAX through RBP.  Report the CPL and
> leave the privilege policy to userspace, as VMware Tools call the
> backdoor from user mode.  Instead of completing the call, userspace can
> have KVM inject a validated #UD, #GP or #PF at the hypercall, and may
> update the registers as well to keep the partial progress of a
> high-bandwidth transfer.
>
> Don't forward hypercalls of vCPUs whose state is protected, as KVM
> can't access their registers: reject the flag for VMs with protected
> state, omit it from their VM-scoped KVM_CHECK_EXTENSION result, and
> ignore it once a vCPU of a VM set up with the legacy KVM_SEV_ES_INIT
> becomes protected.
>
> Link: https://lore.kernel.org/r/c60b32a3-e699-4a8c-8d52-09b34c4d5269@redh=
at.com
> Link: https://lore.kernel.org/r/CADH9ctD1uf_yBA3NXNQu7TJa_TPhLRN=3D0YZ3j2=
gGhgmaFRdCFg@mail.gmail.com
> Link: https://lore.kernel.org/r/CADH9ctBivnvP1tNcatLKzd8EDz8Oo6X65660j8cc=
xYzk3aFzCA@mail.gmail.com
> Link: https://lore.kernel.org/r/aIEmawm9gLflg8zt@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---

[ ... ]

> +static int complete_vmware_hypercall_exit(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_vmware_exit *vmware =3D &vcpu->run->vmware;
> +       u32 pad1 =3D READ_ONCE(vmware->pad1);
> +       u32 inject =3D READ_ONCE(vmware->hcall.exception.inject);
> +       u32 pad2 =3D READ_ONCE(vmware->hcall.exception.pad2);
> +       u32 vector =3D READ_ONCE(vmware->hcall.exception.vector);
> +       u32 error_code =3D READ_ONCE(vmware->hcall.exception.error_code);
> +       u64 address =3D READ_ONCE(vmware->hcall.exception.address);
> +
> +       if (pad1 || pad2 || inject > 1)
> +               return -EINVAL;
> +

Should this check kvm_is_linear_rip(vcpu, vcpu->arch.cui_linear_rip),
like the fast PIO completions do?
