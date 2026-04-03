Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768EA3D0918
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234652; cv=pass; b=lbwyGxjCxTmVMPjz/wnlrB6y+Yzin9U72rD2t8J+xKde6WYPK5m7fuLkedyqD8re5ouAhthJT0QgyyD6DsBSfRxtzLDyn0wnyunp0uFogoGtfhcVA+HOX5ASAQB81GT3rMkbkIANixaniJet4t8Via+XFajGrACIDGw7XU4mnO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234652; c=relaxed/simple;
	bh=IIj5pHGditpsY64K6tW+lU8m3bJowEdlPOwcGkNUW1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPybNveb+okd55NVM27rZRPP8Sz3EF0THWBEYZKSdvnY7sx/JQlUazHMhaNTYjpKNacdnq2LM+hde303I2JKIF64ueL2TFtY4d3uhd30RdWhmGsLZXMgnTpJ5FX89tOuPPKUL9AA73IiQI3/cYP1BYYnVs/dnhPzT4YP3Momgm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=qyp1EHKh; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="qyp1EHKh"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-682baaa9f1aso167561eaf.3
        for <linux-doc@vger.kernel.org>; Fri, 03 Apr 2026 09:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775234649; cv=none;
        d=google.com; s=arc-20240605;
        b=WYNm2pz8qNSgABTrBw57xmFsrsAtreuXOhtEJfALr0Uu8/Hn/N/UAWFaa2YdYfQCx1
         8rKTUetgrPUmpp7Gskglc6Nv3HMsS5WxDtT+LYjdHez03WC74qMeG1hmIozgivqY4uHo
         Ap5LnI20qVpx7fkIUjzZT3Gxvg5I/AoXC2w3lsaiLo3SeBGlRgg3tscxsQ1B3YU1cKFt
         UhgJb4CNniz3ap/Zjs0qOo+imVg8JEnpz8jdr0fQya4OmaP9SB8+HugkZMJc6IrEThBg
         t4Zo85HkcuaoLq3FpeRZHLxnKANGOUacSO6pKzLKZL7Ilv6GvjAEU9YZuciw4tveRdp8
         EyWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vrFTwfPigxbz2O9GmqMaSTkCzHO8oMgBfOsFDsbGC0M=;
        fh=OtTGTIe8YivekDDnln3daELJ1m/ya1BGcEQOwDO6WHk=;
        b=hhm2YVFFlbamqf29H7LbcUthqtxf0HaswRaZEGxi0r63i21TA57K0foEGKlKf2TMoQ
         GLMbUNWWKmT/LjKsscPyPGl0taI+Qveu8WF9Yss4ZUGD/30x7MpHnKHHv2DtNd332mnU
         Xgyr8DzGSJtfbuHTOvQlqrEQF3HJ7cxmm5JBRi8AcQFwbKvVIGRXAVkX/J7GMyCLLbo6
         6mm4a0aZ2QYcw5ilrDeVM7Hhy5ZPlyjUX9+QaB9+b4Sg10Ttnmm8iFrYs3GPtOfIIyzA
         yWmF7bNJ1cU0W9ARdViTyAscaSXzle/wEb+Ssx4WXyqpbHRHL32TSNPdam0EoNGwpXOy
         SA8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775234649; x=1775839449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrFTwfPigxbz2O9GmqMaSTkCzHO8oMgBfOsFDsbGC0M=;
        b=qyp1EHKhqE6LKL5hu4dsX1ShbWSq9bdTHcn3zZYjXz5jXhCK4oCciz57tik0rKCPwj
         ZtG7hFEGiOdQgNpmmVHX9JRq5+LJ6KXEVwDJHXrNKcEmdkhgqcOSad0/YUvZYyPJunDB
         7/FShmNqiDeHAFZTHlbXMH/80RlVlBRV2U3bMONv+xrPHoq1NwhNJNAKaLGp+IXlWWiT
         tabPgPcUVy9uLRYlYJkQo3AjGDolNuUwMJiRfj0p2IbAZZ+p1iSan8SO12iVbjs9cH3i
         GOaP/VjfgcZ4QYvTY2TVXOJS+IyseH8wwWUi51Awj2tBPpYWY/DPpCOc+PlPIlDl/Udv
         Ga3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234649; x=1775839449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vrFTwfPigxbz2O9GmqMaSTkCzHO8oMgBfOsFDsbGC0M=;
        b=OuePtVAVcsBFqtZnGh1a2oToAGMz9H7QUhNhbOsZMjGXE5RhaPrl1KDubB46ae5+No
         S6Ih6C9T5fkAWp46EtmSwbNC1ocs1LfovSV45zl9VOewT2QR1Kn35OqHAj1hmSxQqBbY
         ckbUFiotFqOQRMc1lPMdJfLlcydN8Yj2kSi9xGyVBjQ/M83S/oEchhOYrSdEf+JS6J6J
         xak4IJaVyQRTNdE6mrVg5EHAXVdOkNMZQpJVHxyYk557wX0pBSm5l5Ls9miXFaAYH/7o
         UhAJ0I7jY+XS1KchnEQxGYYVdz+QgMuglrLHnNfZu1hAn8Qhom95cHMC5giRxpdRw4DP
         B81A==
X-Forwarded-Encrypted: i=1; AJvYcCXONGlAVAeNa6x6AdzZCJw8kzEJQBXywJ2+AKnd7qUeNexK4/5v5CrWMXmGUhr23jnocyxLMAxIFPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsJdF2BJdLbdU852ugyCpeMrlI6VqzlAfSGclQCl8+Mp0EjIPq
	PsJ+5eoLho8lu7SP0GCElcc0nhoZjBbBNnR1XTGvybYIEpgjR1FllWU1jIazlKYU0KNM6D/KQQW
	EeQJxKWK1+lh+0/8add5JiocnhByjFKLo9aXETKWwFg==
X-Gm-Gg: ATEYQzyx0GQ35F/1vC4E5plFtxn7p5nhaJh9avV1satIFPhtDjyhSa5YzbAD1W+4T5T
	Uj6+a3Tl9ghx9/EEwxUbylKMbRe+Aq4x3X6czDSorp5/qkQI0wsbrmQZatK/khirIh5YDWy6uk/
	CEJTx6anbFjkKdkPuLwQ3TbHXc2DQSN/gVcpvrOkvSOLhPTmr/WNk+E4IUKQNNYDCwhEui+6kDq
	BYenLa9ADqQlDhMDyszjrmDaCvAWmUOxSmg4yxZ4dmy+4z032Wh9m4eeVsT6MXX5zJECa4JaP55
	HcphQt1T0fAwBakopBYvS20jFwBF1B7pdF45xdxviD1L8yqA7O7EpnSEcfdQf4BpCdofIr8EOTp
	VZfa9jJaY9ICaAIhiyfCmn/l5gQ==
X-Received: by 2002:a05:6820:81c3:b0:67f:c458:2b7d with SMTP id
 006d021491bc7-68221529e11mr1810015eaf.47.1775234649157; Fri, 03 Apr 2026
 09:44:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403153019.9916-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260403153019.9916-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 22:13:57 +0530
X-Gm-Features: AQROBzCaf8PzOUDM_iKq7XQvuf1-ZWCZZHG4AUTGxCQXiafdpkeYzci0INwbejE
Message-ID: <CAAhSdy0W7vrxHeMF+taZ0EBawsqis-ygwu=0HDV2WQYVerbZ9A@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] Support runtime configuration for per-VM's HGATP mode
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	skhan@linuxfoundation.org, guoren@kernel.org, radim.krcmar@oss.qualcomm.com, 
	andrew.jones@oss.qualcomm.com, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 9:00=E2=80=AFPM <fangyu.yu@linux.alibaba.com> wrote:
>
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Currently, RISC-V KVM hardcodes the G-stage page table format (HGATP mode=
)
> to the maximum mode detected at boot time (e.g., SV57x4 if supported). bu=
t
> often such a wide GPA is unnecessary, just as a host sometimes doesn't ne=
ed
> sv57.
>
> This patch reuse KVM_CAP_VM_GPA_BITS to select HGATP.MODE. User-space can
> now explicitly request a specific HGATP mode (SV39x4, SV48x4, SV57x4 or
> SV32x4) during VM creation.
>
> ---
> Changes in v8:
>     - Reuse KVM_CAP_VM_GPA_BITS to advertise and select the effective GPA=
 width
>       for a VM (Anup's suggestion).
>     - Handle the kvm =3D=3D NULL case and task kvm->lock and kvm->slots_l=
ock to serialize
>       against concurrent vCPU creation and memslot updates (Radim's sugge=
stion).
>     - Link to v7:
>       https://lore.kernel.org/linux-riscv/20260402132303.6252-1-fangyu.yu=
@linux.alibaba.com/
> ---
> Changes in v7 (Anup's suggestions):
>     - Keep the original HGATP mode probing logic.
>     - Link to v6:
>       https://lore.kernel.org/linux-riscv/20260330122601.22140-1-fangyu.y=
u@linux.alibaba.com/
> ---
> Changes in v6 (Anup's suggestions):
>     - Reworked kvm_riscv_gstage_gpa_bits() and kvm_riscv_gstage_gpa_size(=
) to
>       take "unsigned long pgd_levels" instead of "struct kvm_arch *".
>     - Moved kvm_riscv_gstage_mode() helper from kvm_host.h to kvm_gstage.=
h.
>     - Renamed kvm->arch.kvm_riscv_gstage_pgd_levels to kvm->arch.pgd_leve=
ls.
>     - Added pgd_levels to struct kvm_gstage to avoid repeated
>       gstage->kvm->arch pointer chasing.
>     - Link to v5:
>       https://lore.kernel.org/linux-riscv/20260204134507.33912-1-fangyu.y=
u@linux.alibaba.com/
> ---
> Changes in v5:
>     - Use architectural HGATP.MODE encodings as the bit index for the sup=
ported-mode
>       bitmap and for the VM-mode selection UAPI; no new UAPI mode/bit def=
ines are
>       introduced(per Radim).
>     - Allow KVM_CAP_RISCV_SET_HGATP_MODE on RV32 as well(per Drew).
>     - Link to v4:
>       https://lore.kernel.org/linux-riscv/20260202140716.34323-1-fangyu.y=
u@linux.alibaba.com/
> ---
> Changes in v4:
>     - Extend kvm_riscv_gstage_mode_detect() to probe all HGATP.MODE value=
s
>       supported by the host and record them in a bitmask.
>     - Treat unexpected pgd_levels in kvm_riscv_gstage_mode() as an intern=
al error
>       (e.g. WARN_ON_ONCE())(per Radim).
>     - Move kvm_riscv_gstage_gpa_bits() and kvm_riscv_gstage_gpa_size() to=
 header
>       as static inline helpers(per Radim).
>     - Drop gstage_mode_user_initialized and Remove the kvm_debug() messag=
e from
>       KVM_CAP_RISCV_SET_HGATP_MODE(per Radim).
>     - Link to v3:
>       https://lore.kernel.org/linux-riscv/20260125150450.27068-1-fangyu.y=
u@linux.alibaba.com/
> ---
> Changes in v3:
>     - Reworked the patch formatting (per Drew).
>     - Dropped kvm->arch.kvm_riscv_gstage_mode and derive HGATP.MODE from
>       kvm_riscv_gstage_pgd_levels via a helper, avoiding redundant per-VM=
 state(per Drew).
>     - Removed kvm_riscv_gstage_max_mode and keep only kvm_riscv_gstage_ma=
x_pgd_levels
>       for host capability detection(per Drew).
>     - Other initialization and return value issues(per Drew).
>     - Enforce that KVM_CAP_RISCV_SET_HGATP_MODE can only be enabled befor=
e any vCPUs
>       are created by rejecting the ioctl once kvm->created_vcpus is non-z=
ero(per Radim).
>     - Add a memslot safety check and reject the capability unless
>       kvm_are_all_memslots_empty(kvm) is true, ensuring the G-stage forma=
t is not
>       changed after any memslots have been installed(per Radim).
>     - Link to v2:
>       https://lore.kernel.org/linux-riscv/20260105143232.76715-1-fangyu.y=
u@linux.alibaba.com/
>
> Fangyu Yu (3):
>   RISC-V: KVM: Support runtime configuration for per-VM's HGATP mode
>   RISC-V: KVM: Cache gstage pgd_levels in struct kvm_gstage
>   RISC-V: KVM: Reuse KVM_CAP_VM_GPA_BITS to select HGATP.MODE
>
>  arch/riscv/include/asm/kvm_gstage.h | 47 ++++++++++++++++---
>  arch/riscv/include/asm/kvm_host.h   |  1 +
>  arch/riscv/kvm/gstage.c             | 65 +++++++++++++--------------
>  arch/riscv/kvm/main.c               | 12 ++---
>  arch/riscv/kvm/mmu.c                | 70 +++++++++--------------------
>  arch/riscv/kvm/vm.c                 | 49 ++++++++++++++++++--
>  arch/riscv/kvm/vmid.c               |  3 +-
>  7 files changed, 148 insertions(+), 99 deletions(-)
>
> --
> 2.50.1
>

This series is in good shape now. I will wait one more day to see
if there are any comments and after that I will merge for Linux-7.1

Thanks,
Anup
