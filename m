Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794508643;
	b=ozqb91f6kWoBEtLh+Vn37LlAJA+sXAO8ieKPASexSkWGNLtj9YWgoQXYaM5C0oCkFkPh
	 sbQlbt1fLueEtRrhNNR+1qJH0NHK/QpeW6Up6D0euwsjB0bmBv7p9ngZylGirRUbnFiCr
	 43CraVdJyDOWyN/19jeygQtAkmQ1ANWZvOI1cfyfMdAhKHN4mJPvQxnz1y/ofjC9rQqNu
	 COnjqDjUfBv/BSnaEr5D0aMh9CsjQ55gfkeqfyU77z7UJmxrJ9ZC1DX0mhJmwwZ1fADeN
	 dbur+6XY7vmTxKOxEDs5Wub4TssxdHFaycUyKGdykiWjno4M8NPC/XP5VI+U6ox/yQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QwsnVdAdvSGrDGgG3+S9CYGhPqY+OBHsYH8Jxiu3UE4=;
	b=ZTP8NoAbZ6sWoBlGYZt890vMstIIxf80QE3dm7FMLwnp7w0N7mcHUjj3hBvgP1hXSpIt
	 6iRcZZqO/nAiBwB67fh4AdM+mpM3noSOd1nla36QPh5nrsTKPExkA7JI82wSLRAMgt+2n
	 O19OhYOs3cnvMX4Y8qKutJFn6Q0/uQalFtsi0FOhKt/KYnYfeBZEYXKAuthN71GSpA3eH
	 ay3x9cjyey5Q00KduwF58tILNsvM3hdGpvrYpIQJchAKL9YDBupriwO7m2B+2jZREN2zF
	 kg8QSdlEPTnJMyshSy6eaGuJjFvJvjVm23sTZ2qz/POjEz0TtaekUXec68XVzDZBgpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MBtDrcY7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D18606A321
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 18:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6D18606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MBtDrcY7
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so724a12.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 10:37:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794508641; cv=none;
        d=google.com; s=arc-20260327;
        b=QemEwVX1/0MoAZgzzdRedYSMvQSRQmncL3vGt14uoGBXlP54Y41QBLxMdQrlNEFkWT
         93saP1vlmEOTY//xWkjMf4793O1zFKSy/4rMMeqwGhbDxDCGSK/oxQCTswFzTyTgLnDY
         /sUIj70GAd59Hi6ODPwMNOTOnQ/Vb17MW4yle9fk8EH7LG985a86Pg6iJLEkTp1OkVaG
         OuZyaP9J1roId3yJ89vpcKjhSLocv8LxF0nuP+fttrXga+dt3O/O80wFpsNkfU29S1hw
         3u0SKVUIrA9ucbjU6lqBD8F10/Bnr3q2nu95ZBAQxSNOo2/OLjmtipJAw/Wm8YUozREO
         Ed3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QwsnVdAdvSGrDGgG3+S9CYGhPqY+OBHsYH8Jxiu3UE4=;
        fh=FKK/uQha1RBfFI+0l/hHM47kj/SQSkSLi61DQofyBVU=;
        b=dC7+HyuWXzbCRZ8jvX8QaQKptz6Knyz71HEKcYRc7e4QtXWY3o9+AEY3QNYdvEpfxx
         CMduhhlITdAUWQQnWFqF4LeNwbbhkAIur9b369xhFbsPB0915SNclgL5ECnH9Pc4ZmTW
         +D0gq7MM/IzutV/FjZkMl3EfLuhfIU5MHpIrNfp68TOe++PywYyOOvGLg+/DBNOMhEMP
         50sFT1pJVVB2lKYjq1hQo0VnWXdzmuFcUMirgXDY/wFxwgIocdFafa9OHZ+7jMlFFmdQ
         CpKoKQ0ue/FZQsYe19KQF07Yn4Paws7V3EKwgT0cc9JLog0zMmPZ8YwqCsANor4r2xLZ
         gklQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794508641; x=1795113441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QwsnVdAdvSGrDGgG3+S9CYGhPqY+OBHsYH8Jxiu3UE4=;
        b=MBtDrcY7TM5Lsu/J6REkxt65M1Fw6Cx5EL4HvmADWTfAD3kWMAMMTD0/d67Qf1Qdo4
         D6VSCm9Ov2CnBSKVmOzhGARvYHtp4m91V672U6eE/CfPR8n5Z7WJouPHTMyuxnSBkpap
         nVSBM/736raRtMBssEV+HlSgNdHBXbSQm17XXPjHDsZGIOqKIO9QORg6kJFarDcQIpug
         VFs0LZOa+uueOitE9BFrPR5mouyzHfv/STtxb9Qy5AO2esUrxDUx2Yyc6l0pLt7r7Ci4
         X8uKbNK3hm+zydsZLghi8H9Fs/bKeOtaqpOsX1xByFpZaQefIcyOh9kvFglsCvKZiwu/
         X6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508641; x=1795113441;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QwsnVdAdvSGrDGgG3+S9CYGhPqY+OBHsYH8Jxiu3UE4=;
        b=yiXj9dLo/ghz0QKKyJocKD8cd0h48yMgdXyGSMxKUXvuI/v6yzQOmIbijTgmy4TTOK
         msI05c5U37La63zqmLTa6lKiZyHAuUphFss7sBZUILKoc53PjJ3NGMXVN8sHFp4Oonsk
         1k9FSjbn5OlFq3pjLZ8sjpeF71Hi91PdR3QNPOkCsUHgoqZ1bLDtMRCrI7T/dG++0OeH
         ly3Ow2ybe5Htfhj+pU5F5bktWLSOVnkC1xCVNN+8eN5nez/pkjqNcXsR1Gdr/Lygmt4i
         DIMoItJiiqYGUbf4IUQJCA2Iu5a/2OZIOWQ+1sOEPJd16gcSYrucTJtrqXPHMH2z+JBT
         doQA==
X-Forwarded-Encrypted: i=1; AL+hErFx64myAvboc3FMnaeU398qalJIKddwKdbSdmvrI6V6oEDOezk0gwCWcjZTAxg9T0JJROI0tzIChWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SGk6AIk4R6Ed3eTnn4GuWRE6U8qXrVOk2m6s4+hdqT+fStV73
	YONinuIDl5CMfg1K3enEjDomDDgpYB/AztScuyFrB+z3yjriy2xAV8zPW+naA4g9fa4PHYS3u9p
	lRCJ2exJWFqolxGXoGnNfhnY9WmC5StF9/nhemE9U
X-Gm-Gg: AYBFou28Rwfi8hhh/iMrkEdaDLCrCA6ouleBYyODZsqbQT17Tkql7Pg6CwqXYibmEOx
	DiihHC+2yr2pzoPZf1bnjpd+OK3SFgOEPEH7qlGRWqQcicjlqw84LcOz8MP15zV9x53BYZKshM7
	l1T6XtNv48/vjeg2g0FGpU5ZSWZsC911OnReGNVBQLsGH1o3Qp8Te8OySSZwdcpXqlUEWe4lFs9
	mdsib0CxoxV7PtXFE5/BmnKbMiJZs5nZXV1tV4WHCG4s2MZZ/izkEFciLMFFLJUmIRLLEmWO4O8
	EQ05BuOkBmdPRpaJxPPLHrGuim0+l7bgNPvuBv1qEw/89c8AbaL9/Vz5XhKL9f9g683pQbIl8xq
	8WlE3M3JBWc4szZPQlCIRznEMF13DJ26lL/Ol6FfZQ3JTh+IFkC6hlaPEu7PCEwwro7A+tlEu5j
	j9ePPPQrFNsDNYjbhIOQ==
X-Received: by 2002:a05:6402:327:b0:6b1:a517:5bce with SMTP id
 4fb4d7f45d1cf-6b7a2ab087cmr87795a12.16.1794508627091; Thu, 12 Nov 2026
 10:37:07 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <4dca09deb85d2d5db157888ae4a2de7cbf6421d2.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <4dca09deb85d2d5db157888ae4a2de7cbf6421d2.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 12 Nov 2026 10:36:54 -0800
X-Gm-Features: AclHuK8rt1aN38OOO-5Oe9cWGgilUSsg7YZ6I-VfVfdCTw37NLQGQcQLM8ki98w
Message-ID: <CALMp9eSARNY=K-bXSoV6sBBaWoKQGHtym1VrjnHtBQhFvsb2gQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] KVM: selftests: Port VMware backdoor coverage
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

On Tue, Nov 10, 2026 at 10:08=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Add vmware_backdoor_test, adapted from KVM-unit-tests' vmware_backdoors
> test.  From CPL3, with CR4.PCE clear and no I/O permission bitmap in
> the TSS, read the VMware pseudo-PMCs with RDPMC and issue backdoor
> commands on the backdoor port with IN.  Verify that the pseudo-PMC
> reads succeed and the port accesses exit to userspace only when the
> backdoor is enabled and raise #GP otherwise, and that other PMC indices
> and ports always raise #GP.  Repeat the pseudo-PMC checks at CPL3 with
> CR4.PCE set and at CPL0, where RDPMC doesn't fault before KVM handles
> it.  Skip the pseudo-PMC checks if KVM doesn't virtualize a PMU, as KVM
> then injects #GP for every RDPMC.
>
> Run the checks for a VM that relies on the enable_vmware_backdoor
> default and for a VM that enables KVM_VMWARE_ENABLE_BACKDOOR, and
> verify that KVM_CAP_X86_VMWARE rejects every flag it doesn't report.
> KVM-unit-tests can only cover the module parameter, which applies to
> every VM, while the selftest also covers the per-VM capability.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Link: https://lore.kernel.org/r/aIEoNpe-LFoH6LBm@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---

[ ... ]

> +static struct insn_result guest_inl(u16 port, u32 command)
> +{
> +       struct insn_result result;
> +       unsigned long rax =3D VMPORT_DEFAULT_RETVAL;

Shouldn't %rax be VMWARE_MAGIC?


> +       unsigned long rbx =3D VMPORT_DEFAULT_RETVAL;
> +       unsigned long rcx =3D command;
> +       unsigned long rdx =3D port;
> +       u64 error_code;
> +
> +       asm volatile(KVM_ASM_SAFE("inl %%dx, %%eax")
> +                    : "+a"(rax), "+b"(rbx), "+c"(rcx), "+d"(rdx),
> +                      KVM_ASM_SAFE_OUTPUTS(result.vector, error_code)
> +                    :
> +                    : KVM_ASM_SAFE_CLOBBERS);
> +       result.value =3D rbx;
> +       return result;
> +}
> +
