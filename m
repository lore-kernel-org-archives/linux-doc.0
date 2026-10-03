Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4835838AC7E
	for <linux-doc@vger.kernel.org>; Sat,  3 Oct 2026 04:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791002516; cv=pass; b=TrShcCktiOWZhnU7SaB2/ao4LPw8B5Fwvsk3zUnD4CzwF56vVVPnJmS+iQtRex2mDMp00d9R2ukdgmJaFxoeGHTXyknor9LbXCoTYhDgspN41UBWtSdIpBZQIuBI9VMQtLMXeQaWtam5PzG/JYTxVH5i77Z+7PLWryZTv+9/LJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791002516; c=relaxed/simple;
	bh=9HV8ivjSIVJPXUEW8t/GvnA+QnJCmpwHY5r/HcMLJz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIUqKYddRq2PKwK+m5PJNvnxB2ROb7ej+HZRUkVfPQEnjevtnKXOX1GVkIxMUi8CJkWrm4IN8Oo6Tw0amKvKZOFcFt8QAMG1/EZlDgCyndLjvLdoMYtnWzZDqI5fsOnC1qRAGJtdJiT+zDGmqqB5u8dq/OEFHb6nRIMZNorhW7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=tm05Ode4; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="tm05Ode4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so2359685e9.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 21:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791002512; cv=none;
        d=google.com; s=arc-20260327;
        b=ni/ScJ6FtQYZqt527xglWQfrlMqCxuTP4XIwQvaVzi8+sRCEGlOZfg8sU4QRxgVxhK
         XifN26WhuTQYEZwS+DGv1mKCXX9t2OZFYV1l2PwCayS9uR8rBw9ywvVXbsr957Z0PJUO
         m9/AUbJpFB+4pko6suQAIuqXlrwEed7dxMJ6e19g7+9ybu598VzDbUsJ+N+IacACrbz/
         oEl4wJqTXmxAU+6Bfy6U6YBYSdF1C6UZjv5eS2oU913AR165P7N+sObdWQSZca44ZAzb
         6L2/bYx/R11n68XjcRPmhwx415bBQ/Wtc34ihnk5pAWJl1oxxke8pQqcG+mMeiaikR1q
         fAbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7TeWG7eBfwN9fqcBz2YTPOJ+uEK88CVw5+xe0Jks6Y0=;
        fh=bfmHBQoTLjSVKj8jk9sFknWGooRZ+BxqU38E6Y7ufC4=;
        b=pQsh28xd65WyVtRGkBd+CGiTTJcXPFr/1dvR/buVN0WVi4qcqtagYru84zMqSXClHg
         RZGeuoRBXsrQwGVaJtoLFr53yNTuBUIGbv6Oj1HHd2mgTDHpRZb/hhv1/HfVC41qi6os
         zvsUBWzWVBBTSfE7Ioy5CPOyQfMeDFhVACRpQZvc4vYZ2WAyG7ptdQigJjIzBuAi3QWe
         4FIjrSg+Z8zzHUPo3UBPCwL3cmO0qZ1keHToxnR2n8ptODLwsJVxvbkbXPzRqS4Ak/eV
         QQjuPvW6dngNOoxJL/zyUxGvLEZXokK/2RdoB8gpSPXGMukOjpo2u4s7wy6wFRNdvhKr
         E5xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791002512; x=1791607312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7TeWG7eBfwN9fqcBz2YTPOJ+uEK88CVw5+xe0Jks6Y0=;
        b=tm05Ode4HkcpKQiaASruBNYU+sAAxqRfUTEaaWZ9K9EPfiN142WSBgt/mBWYnsE6Of
         KQl+U8iEysAIIyTNDONth/Sn91mYSna3m6SdYDIAeN6YlmH0Q4SYSGz8UrOS65Ko4AbT
         DjkL+O53nRd/ft9k25C6D9yBOwvYjiQTf6pq4nMnXnHjKcJ3QL7zuWaoUH6EebuvDFtq
         oqmrkAb6h0vvasSA/DUFhuB6/LmQLi1+5/VzcMEoJqa/gsrKTnshbn7okPDaUYiYWHXd
         gBReHrpM9lSPNl7uaqwHKB9DCaX526xM6dxrcGqn6PhnoUzn0uMPUp4h+7odKidrjzSp
         ulUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791002512; x=1791607312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TeWG7eBfwN9fqcBz2YTPOJ+uEK88CVw5+xe0Jks6Y0=;
        b=MvC3Wc4I5FmGYYInLigEvB0/rw30ukcNxch2svCb4eXUvc/i7whj37ngxHyozArUrK
         JtYGBORf5LxA1pjvC0Kb0Een1Bic5oA0ZowfdIy+NxSPnKBvs5pRE06RBs0qc/TGufKC
         9tnAWxJxmuE7lLveRxlWaVZUja5i82DySQeN2m3FTy8qmvePnYKnuW04UWv2qvGRLsnW
         OmUogrrVUt1QgrKmMcyLVY+wSyJMZAII+tp9Jxg17XKrPdTcJ3lQV7ppOoJuz7ofQbMp
         Q7YUAuouk9dF2KXieM+5ePUL3ewMD43HkFeiZtUTe9Wel0f1E9rab5+H6R4uvvHaolmK
         6wpA==
X-Forwarded-Encrypted: i=1; AKwUvBxDbj7Y5j933hICjIGf77sIv6jh+gJdbP0STXFigASfMF1On+D+n28yt33D1Zfl6sA5K8uFnZg1W84=@vger.kernel.org
X-Gm-Message-State: AFuF++lXnfYioVih2O2o//rCDJIBujJzED4ae4cWsYvhyzRu32bqhOyn
	ZOp3h9Z59edMwaYyMkNdYz/d7tKsgelnpqk3ulNlqu8fh2Nz1ntY/ZkESg1L4Hy9Xzgpcuys01O
	AL2Du73oSpkp3j1Z8TziFtvYnPlL9w9XSQwnTrcGpuQ==
X-Gm-Gg: AYBFou1F+pm4EwrPcpmGU0DJsmEhh5U06Wbx/dvWwU45ulsrgrnTjWFGlqB5UJDE764
	sLIwmIY0BKssMaIkF8M2USP5pvxtIZFu0kWNOgU6t6pjuwsRAH7EgK3ExNEsG4hEyumTF90dUT5
	Hy8UKTXTbg59HYmTqiAjeQVkv6yOt+7DrIBtrso/mfwfen4Dik4zddp6I9b5PnzHANQJT6I6ydH
	MgeCT27NzEL7BP9+1Zgl6YfL4qOMnrGU81SJrLExQ6Pr3D/QgaqZ3a2xVRgO5sOm5RxZ/56Es/O
	S9T1MCAthwfEqdUNQi9eybh4ZUhUs6vm3O91zS8fr/I3DOiBka95lbRPCoXyOHciMjNrw/g21ZZ
	88vDrp2JLSLadF5BmnWuu7moiD2nspahQKw3rmBFXT7XUftTI9ZHVFF8z3flSe5EnLC6ervMUwL
	0=
X-Received: by 2002:a05:600c:3510:b0:499:9240:9a1c with SMTP id
 5b1f17b1804b1-4a027559c6fmr81635275e9.15.1791002512235; Fri, 02 Oct 2026
 21:41:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805065132.3210346-1-yhchen312@gmail.com>
In-Reply-To: <20260805065132.3210346-1-yhchen312@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 3 Oct 2026 10:11:40 +0530
X-Gm-Features: AclHuK_IXoPpwMtGcEHrcY1efUXEIKHZ22esp61Xf_4MLGY4isIRd8O8F7q5fHw
Message-ID: <CAAhSdy2v1zL2e3o4m5ofkvby1N6hWLLVUirmz1_kY5+uoj=oWw@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control
 VS-mode WFI trapping
To: "Yuhang.Chen" <yhchen312@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Quan Zhou <zhouquan@iscas.ac.cn>, kernel test robot <lkp@intel.com>, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 12:22=E2=80=AFPM Yuhang.Chen <yhchen312@gmail.com> w=
rote:
>
> Add a kernel command-line option, kvm-riscv.wfi_trap_policy=3Dtrap|auto,
> that controls whether a WFI executed by a VS-mode guest traps into KVM
> (HS-mode) or executes natively.
>
> HSTATUS.VTW governs VS-mode WFI: when set, the WFI traps into KVM, which
> blocks the vCPU through kvm_vcpu_halt() and releases the CPU to other
> runnable tasks; when clear, the guest runs WFI natively. Because RISC-V
> WFI is only a hint (it may be a no-op on some implementations), the
> policy is re-evaluated before each guest entry rather than fixed once
> at reset.
>
>   trap  : always trap VS-mode WFI into KVM (HSTATUS.VTW=3D1). This is the
>           default and preserves the previous unconditional behavior.
>
>   auto  : clear HSTATUS.VTW so the guest runs WFI natively only when the
>           vCPU is the sole runnable task on the current CPU; otherwise
>           keep trapping. When the vCPU is alone, skipping the
>           virtual-instruction exit cannot starve another task, and on
>           hardware that honors WFI the hart blocks until a VS-mode
>           interrupt. The policy is re-evaluated before every guest entry,
>           so when another task becomes runnable the next entry traps
>           again and KVM blocks the vCPU through kvm_vcpu_halt(), yielding
>           the CPU. The vCPU therefore never monopolizes the CPU the way
>           an unconditional native WFI would: it either blocks through
>           kvm_vcpu_halt(), or runs WFI natively only when no other task
>           needs the CPU.
>
> Measured on QEMU TCG (-smp 1, -cpu max): wfi_exit_stat delta and guest
> wake count over a 3 s window. "busy" adds a CPU-bound competitor that
> shares the vCPU's CPU so that single_task_running() reports false:
>
>   policy  busy  exits  wakes   cpu%  note
>   ------  ----  -----  -----   ----  ------------------------
>   trap    off    286    285    6.5   default; no regression
>   trap    on     291    290  101.0   trap is unconditional
>   auto    off      4    287    5.0   sole task: native WFI
>   auto    on     285    284  101.5   competitor -> traps
>
> With "auto", WFI exits drop to ~0 when the vCPU is the only runnable
> task, and rise back to the trap level as soon as a competitor appears,
> which is the desired dynamic behavior. Host CPU stays low in the
> sole-task case; the ~101% in the busy cases is the forked competitor,
> not the vCPU.
>
> Assisted-by: YuanSheng:deepseek-v4-pro
> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Yuhang.Chen <yhchen312@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202608051354.KYOXP5po-lkp@i=
ntel.com/
>
> ---
> Changes in v3:
>
> - Guard the early_param() parser with #ifndef MODULE. RISC-V KVM is
>   tristate and may be built as a module (CONFIG_KVM=3Dm), but
>   early_param() is only defined for built-in code, so v2 failed to
>   compile as a module. With CONFIG_KVM=3Dm the policy now keeps its
>   default (trap) value, which is safe and regression-free; the rest of
>   the policy logic is unaffected. The kernel-parameters.txt entry now
>   documents that the option is only honored when KVM is built in.
>
> - Re-evaluate the WFI trap policy before each guest entry instead of
>   only in kvm_arch_vcpu_load(). In v2 the policy was checked once when
>   the vCPU was loaded, so between two kvm_arch_vcpu_load() calls
>   HSTATUS.VTW could go stale: if a task of lower or equal priority woke
>   on the vCPU's CPU while the guest was running, the run loop would
>   re-enter the guest without re-checking and without preempting, and a
>   native WFI could then halt the hart and delay the woken task until the
>   next timer tick. Checking before every entry closes this window,
>   because a wakeup arrives through a host interrupt that forces a VM
>   exit, and the next entry re-evaluates and traps.
>
> Changes in v2:
>
> - Drop the "notrap" mode, which cleared HSTATUS.VTW unconditionally and
>   so never trapped: the vCPU never reached kvm_vcpu_halt() and could
>   stay busy even while idle.
> - Add the "auto" mode, which clears HSTATUS.VTW only when the vCPU is
>   the sole runnable task (single_task_running()) and otherwise traps.
>   The policy is applied dynamically from kvm_arch_vcpu_load() instead of
>   once at reset, so a vCPU that stops being the sole runnable task
>   switches back to trapping.
> - Update the kernel-parameters.txt entry for trap/auto.
>
> v1: https://lore.kernel.org/all/20260709115610.287420-1-yhchen312@gmail.c=
om/
> v2: https://lore.kernel.org/all/20260804024707.2400404-1-yhchen312@gmail.=
com/
> ---
>  .../admin-guide/kernel-parameters.txt         | 20 ++++++
>  arch/riscv/kvm/vcpu.c                         | 72 +++++++++++++++++++
>  2 files changed, 92 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index b5493a7f8f22..2ab9eb335e60 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3254,6 +3254,26 @@ Kernel parameters
>
>                         notrap: clear WFI instruction trap
>
> +       kvm-riscv.wfi_trap_policy=3D
> +                       [KVM,RISCV] Control when to set the WFI instructi=
on
> +                       trap (HSTATUS.VTW) for KVM VMs. The policy is
> +                       re-evaluated before each guest entry, not only at
> +                       reset, since RISC-V WFI is only a hint.
> +
> +                       trap: always trap VS-mode WFI into KVM (HSTATUS.V=
TW=3D1)
> +
> +                       auto: trap unless the vCPU is the only runnable t=
ask on
> +                               the current CPU, in which case clear the =
trap
> +                               (HSTATUS.VTW=3D0) and let the guest execu=
te WFI
> +                               natively
> +
> +                       Defaults to trap, preserving the previous uncondi=
tional
> +                       behavior.
> +
> +                       Only honored when KVM is built into the kernel
> +                       (CONFIG_KVM=3Dy); as a module (CONFIG_KVM=3Dm) th=
e policy
> +                       stays at its default (trap).
> +
>         kvm_cma_resv_ratio=3Dn [PPC,EARLY]
>                         Reserves given percentage from system memory area=
 for
>                         contiguous memory allocation for KVM hash pagetab=
le
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index cf6e231e76e2..8efeb74699cc 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -12,8 +12,10 @@
>  #include <linux/kdebug.h>
>  #include <linux/module.h>
>  #include <linux/percpu.h>
> +#include <linux/string.h>
>  #include <linux/vmalloc.h>
>  #include <linux/sched/signal.h>
> +#include <linux/sched/stat.h>
>  #include <linux/fs.h>
>  #include <linux/kvm_host.h>
>  #include <asm/cacheflush.h>
> @@ -26,6 +28,67 @@
>
>  static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_former_vcpu);
>
> +/*
> + * WFI trap policy for VS-mode guests, controllable through the
> + * kvm-riscv.wfi_trap_policy=3D kernel command-line option.
> + */
> +enum kvm_riscv_wfi_trap_policy {
> +       KVM_RISCV_WFI_TRAP,     /* Always trap VS-mode WFI into KVM */
> +       KVM_RISCV_WFI_AUTO,     /* Trap unless the vCPU is the only runna=
ble task */
> +};
> +
> +static enum kvm_riscv_wfi_trap_policy kvm_riscv_wfi_trap_policy __read_m=
ostly =3D
> +       KVM_RISCV_WFI_TRAP;
> +
> +/*
> + * RISC-V KVM is tristate and may be built as a module, but early_param(=
) is
> + * only defined for built-in code (see <linux/init.h>). Guard the comman=
d-line
> + * parser accordingly: when CONFIG_KVM=3Dm the policy simply keeps its d=
efault
> + * (trap) value, which is the safe, regression-free behavior.
> + */
> +#ifndef MODULE
> +static int __init early_kvm_riscv_wfi_trap_policy_cfg(char *arg)
> +{
> +       if (!arg)
> +               return -EINVAL;
> +
> +       if (strcmp(arg, "trap") =3D=3D 0) {
> +               kvm_riscv_wfi_trap_policy =3D KVM_RISCV_WFI_TRAP;
> +               return 0;
> +       }
> +
> +       if (strcmp(arg, "auto") =3D=3D 0) {
> +               kvm_riscv_wfi_trap_policy =3D KVM_RISCV_WFI_AUTO;
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +early_param("kvm-riscv.wfi_trap_policy", early_kvm_riscv_wfi_trap_policy=
_cfg);

FYI, module parameters can also be passed as kernel parameter when the
module is built-in. There is no reason why WFI trap-policy will not work as=
 when
KVM RISC-V is a plugabble module.

Convert this to module_param.

> +#endif
> +
> +static bool kvm_riscv_vcpu_wfi_should_trap(struct kvm_vcpu *vcpu)
> +{
> +       switch (kvm_riscv_wfi_trap_policy) {
> +       case KVM_RISCV_WFI_AUTO:
> +               /* Native WFI only when the vCPU is the sole runnable tas=
k. */
> +               return !single_task_running();
> +       case KVM_RISCV_WFI_TRAP:
> +       default:
> +               return true;
> +       }
> +}
> +
> +static void kvm_riscv_vcpu_update_wfi_trap(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_cpu_context *cntx =3D &vcpu->arch.guest_context;
> +
> +       if (kvm_riscv_vcpu_wfi_should_trap(vcpu))
> +               cntx->hstatus |=3D HSTATUS_VTW;
> +       else
> +               cntx->hstatus &=3D ~HSTATUS_VTW;
> +}
> +
>  const struct kvm_stats_desc kvm_vcpu_stats_desc[] =3D {
>         KVM_GENERIC_VCPU_STATS(),
>         STATS_DESC_COUNTER(VCPU, ecall_exit_stat),
> @@ -73,6 +136,7 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vc=
pu *vcpu,
>         /* Setup reset state of shadow SSTATUS and HSTATUS CSRs */
>         cntx->sstatus =3D SR_SPP | SR_SPIE;
>
> +       /* Trap VS-mode WFI by default; the run loop reapplies the policy=
 before each entry. */
>         cntx->hstatus |=3D HSTATUS_VTW;
>         cntx->hstatus |=3D HSTATUS_SPVP;
>         cntx->hstatus |=3D HSTATUS_SPV;
> @@ -936,6 +1000,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                  */
>                 kvm_riscv_local_tlb_sanitize(vcpu);
>
> +               /*
> +                * Re-evaluate the WFI trap policy for this entry so that
> +                * HSTATUS.VTW tracks the current runnable-task count and
> +                * cannot go stale across guest entries (which would let =
a
> +                * native WFI halt the CPU while another task is runnable=
).
> +                */
> +               kvm_riscv_vcpu_update_wfi_trap(vcpu);
> +
>                 trace_kvm_entry(vcpu);
>
>                 guest_timing_enter_irqoff();
> --
> 2.34.1
>

Regards,
Anup
