Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4A7370D43
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 19:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412660; cv=pass; b=oZ628+BMfvWuLysxUeVBPKYGc5ieOxbENGvxvV4NzrgYKTr0Gjag9uRPk6EFwICmf00YXbY3RXN6rv9LP65WarnehYSlVOjLs5bAuolmQGxDcQ6VhI4hqRC+r4tdLksUdNQcr3KyJGkdsoy4FsBhJX1HxAWy+SCttFEpx13C0q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412660; c=relaxed/simple;
	bh=aTBPcv6Dkvt33DiB7XT4nK3JRy2GUpNHwW7ZRA7gmNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J24Wd1SF1pxwKuSmU6EX/ZdeeobJOtSyGmVB99KD+BIe8c6YIMK+/BZApt3OmKO1IBmNp0JMChoPzmY4DVmYOw/UUwarMNX+0bEDsUDlqVKepU2vullrDSgi9IHqgHbVcj3KOVp38Ytc/Z1IZZVV20U9gJu4ENMSICf2GVBZ8Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ERWW5aN7; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ERWW5aN7"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so4648289a12.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 12:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789412653; cv=none;
        d=google.com; s=arc-20260327;
        b=XhBNeJSwzRm2D5+kwA5S6GKZnRYomAHXu5RGYM7lj0oZLQfgc9ktA4zeMJM65oolwj
         eELC/nWfKLZaYslWqmroQb42FJUgKGsEA+qIdncp/6syIWfcaBtXcToliYfXUWI0cO2m
         QTmwQCoEE0gcCkSrHn74kJjkrLk50dyeMO7Z59a0GiB08ZjfIYFS9wejaRI9xLQxHVun
         pJLZMhWDxvdQVtAVE0B8p82cThkVZ7tl9RjLvdJlEr/k13DuPDACd21CQ1yEiLlXnG6Y
         tRm83EmK75NUeVNGYhVZAF94H9FYn/cfCqaKf3DhtYkpK3NBOkHKs8rTH+USpexHQtcE
         jkAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gk8XD7mC27/atdnmgwYfSpXmmY1UfdWq597q70KYjTQ=;
        fh=dKZM0YTZU13zM5bcyzA4jpvD5ug7RxCsaiRBJtrg9zM=;
        b=HdMETuk90bMfmHVlYAy/XS1iq99njQsgFMasWMnadzN3opX7382VNYoC4mGYdN+SlV
         F1QhxXZfGoyshAGbu0JlTnq1Lgk7r1kl24ijs268lyO1Es7bgjZpoZ2epSIpaBwt9O2c
         NIi7vlaNwvCqGmATjWR67wk8w/ZnOmLghLOq8sNUGSJnGIBOWNo6h+3pwhcB0GsYwG5o
         fgFdJd5wO7g/pbTEGLc6rzdT1CgM2lq0Zp2xiwQT1glF2L3qhALI1evUIART5hJ5pCQW
         SpfutFtIBxZ2jCkpibE5fezgtOOGF+16kqWakBII3b4o390d9cQjQ+xjDz38W/QK7eUQ
         3BBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789412653; x=1790017453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gk8XD7mC27/atdnmgwYfSpXmmY1UfdWq597q70KYjTQ=;
        b=ERWW5aN7rw6dy/+W3YPZDAa+39UJ6kcxxttCrnshQtPqV9+fm8GKWaWVVhizplkc9s
         JDoCEPa6KEJWKw9735C4xC4hCNGrehcdk4JZ4qyBjw76YHJ1HqTiQWMQY7PMim07SBUK
         tNygkZKBR0bF7pmtPLJNuFyi5/YiCHPRhLvPvD1WSc2sKc57XUQ7bxLHz9K2FJzizNPB
         rHVy8jVb8F2ahdBjWH7uh8hlFxJsssvxVHwfwmWlxHV58vt356w2Stwh6zYdmZdXE8+Y
         Rgo1wR601qmokZwZdZrSJ84Ohw+glaeoLvljcmDtV9OQ6tZfGKd7dox9VGt28GC6fuaG
         PWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789412653; x=1790017453;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gk8XD7mC27/atdnmgwYfSpXmmY1UfdWq597q70KYjTQ=;
        b=KA6atdEc3hmfiyjs8BSzQ+0AaYuet20mObYo7sX71jFc/SWOa6PS36sUV2gM4Xukgv
         Ikg/lubHGw23UzpH67jd3hxvFJnCd9IVd3xqe5SSDxSdmLr2zodnqWnnEKOKH6rVRIPv
         IC3PhhShLm7pIHv8eqHfx7wutDndcAlCxAT7Vfp6BYX4Wyky5OzTsGmiHB3gd/X+GXf8
         PKSbTBw+x/HqoWoXZkzTvFlL1HZQH23PDn6gQbXwSi81KVf8gno4CUvYGk50YADMvrKh
         WPUaZNBlxyjg3UNEH+VvCq6qKeAeDuWaQ/2Z3qCrz1/jSJ5DQsR87EN0aqMMpUn/4Y63
         YBFw==
X-Forwarded-Encrypted: i=1; AKwUvBzYfYqJ8p8bi29ksBZOlgqabwSlX2Wu+pSfnbTSc+MNKx2f/NVFB9wbnkW4wp5PJ/swn3RQU/gwvEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++niH+qzBmCRdgMgM1tiyl6GEBFD+ww+qTf3QhQO0Iyka95giE3n
	NISHVDeaibrd/ckR4+0tHm7zNmoiiQKBjL488TCupaAJt93zr48lyPrKy8ck+LJtznOzLIdBFmI
	QEl1mWvXebZmzY1wUnkNP7xxiwAJUexi9HrC3oaK1
X-Gm-Gg: AYBFou3hvMlvY4kwbC8EMUX1soz3aX7hvAGH3Y2tOjVLXnrLjY4eF+dRrERmLKRmeWH
	1K6idoXsUOyXOzQcinAe9Lg8uo9/x6uDhRvh/FCppwVwiHAWffI0RYDVTKhloUmJ2QN4T1LSGMe
	BuAICbulhEyy9LcqV8npZQBci/fs9cNo960lqOn5AlqY3p6u0lG84ZFrOQ8XEnOYmgtKP8hs4dO
	NMC9LuARzfqPK2QF6qgDrD7QEOsXY9lvEyWOc9TW4Owb4PFNn5OVfSqn1x9gA9o3DjmZsfWECfv
	xi8z+RpNdIChla2u6G1aT1JfkoHUQAriOR1WxHAE2F8sgBESKjefSb1QkezxM7plsmLGrraACyZ
	4L6vYnQN7YtWahmM3I1VG7/7lOIdkgtilDAYxYHtuLDE0u1hfnVwLvX6oyyeDcM6fZ2EiILR7tj
	BlvRVs/Q3r+Xoqmwbm7DTsUKZQ
X-Received: by 2002:a05:6402:52cf:b0:6a3:ff14:ebc9 with SMTP id
 4fb4d7f45d1cf-6a9f625e963mr5489056a12.11.1789412652348; Mon, 14 Sep 2026
 12:04:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914175912.3338133-1-jmattson@google.com>
In-Reply-To: <20260914175912.3338133-1-jmattson@google.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 14 Sep 2026 12:03:34 -0700
X-Gm-Features: AcwNN1UTzfwAILDgSHTXXHPKsjPhnwPSlyCHFd_RMgW7gPpHII0xLX8NbvSLaaU
Message-ID: <CADrL8HWeu+MH5YZmKBJbStsqUSi30ydncKM=bHt-pRJji3Xi_A@mail.gmail.com>
Subject: Re: [PATCH] Documentation: KVM: x86: document KVM_GET_*/KVM_SET_* ordering
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:11=E2=80=AFAM Jim Mattson <jmattson@google.com> =
wrote:
>
> KVM does not define a total order for the ioctls that save and restore
> guest state, but the ioctls are not fully independent either.  On the
> save path, some getters perturb state that another getter reports.  On
> the restore path, some setters validate their input against state that
> another setter installs, and some setters overwrite state that another
> setter has already written.  One pair of restore constraints is a
> cycle, which forces userspace to issue KVM_SET_MSRS twice.
>
> Replace the TBD in the x86 section of "Known KVM API problems" with the
> partial order that is known to matter, and with the reason for each
> constraint.  Note that a misordered getter fails silently, while a
> misordered setter usually fails with -EINVAL.

THANK YOU!!! I'm getting kind of fed up with save/restore ordering
issues, as I am sure you are as well. :)

I wonder if Vanadium (Google's VMM) or QEMU 100% abide by the
restrictions listed here. A statement in the changelog confirming that
QEMU abides by these constraints would put me at ease.

Some suggestions/questions below.

>
> Assisted-by: LLM
> Signed-off-by: Jim Mattson <jmattson@google.com>
> ---
>  Documentation/virt/kvm/api.rst | 179 ++++++++++++++++++++++++++++++++-
>  1 file changed, 178 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.=
rst
> index e0430cc750c9..9181dfcd7251 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -9659,4 +9659,181 @@ available.
>  Ordering of KVM_GET_*/KVM_SET_* ioctls
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> -TBD
> +KVM does not define a total order for the ioctls that save and restore
> +guest state, and most pairs of them really are independent.  A few are
> +not.  When saving, some getters modify state that another getter
> +reports.  When restoring, some setters validate their input against
> +state that another setter installs, and some setters overwrite state
> +that another setter has already written.
> +
> +The constraints below are the ones that are known to matter on x86.
> +They form a partial order, so any topological sort of them will do.
> +One pair of restore constraints points in both directions, and forces
> +userspace to issue ``KVM_SET_MSRS`` twice.
> +
> +Note the difference in failure mode.  A getter that runs too late
> +silently returns perturbed state, and the damage is only visible in the
> +restored guest.  A setter that runs too early usually fails outright
> +with ``-EINVAL``.
> +
> +Saving state
> +~~~~~~~~~~~~
> +
> +* **Get the MP state before any other vCPU state.**
> +  ``KVM_GET_MP_STATE`` calls ``kvm_apic_accept_events()``, which latches
> +  a pending INIT or SIPI.  Completing an INIT resets the vCPU, and
> +  completing a SIPI sets CS and RIP.  Either can also trigger a nested
> +  VM-exit, which overwrites most of the vCPU state.  On Intel, both an
> +  INIT and a SIPI can exit, and the VM-exit MSR-store list also writes
> +  guest memory.  On AMD, only an INIT can exit.  Every other vCPU
> +  getter must therefore run after ``KVM_GET_MP_STATE``.
> +
> +* **Get the irqchip state before the local APIC state.**
> +  ``KVM_GET_IRQCHIP`` clears from the reported I/O APIC IRR every
> +  edge-triggered IRQ that KVM has already delivered to a local APIC, on
> +  the assumption that ``KVM_GET_LAPIC`` will pick it up.  If the local
> +  APIC is read first, an IRQ delivered between the two reads appears in
> +  neither snapshot and is lost.  The opposite order can at worst
> +  duplicate such an IRQ, which is the safer failure.  The constraint
> +  applies only to a full in-kernel irqchip, because ``KVM_GET_IRQCHIP``
> +  returns ``-ENXIO`` in split-irqchip mode.
> +
> +* **Get the local APIC state last among the vCPU getters.**
> +  On Intel, ``KVM_GET_LAPIC`` drains the posted-interrupt requests into
> +  the IRR, so it reports the most complete view of pending interrupts.
> +  Any source of interrupts that is still live when it runs can add to
> +  the IRR afterwards, and that addition is not saved.
> +
> +* **Get all vCPU state before the final pass over guest memory.**

This assumes the presence pre-copy live migration; this is not
necessarily the case. I think something more general should be
written, like:

   Getting some vCPU state may modify guest memory.

> +  On Intel, a nested VM-exit out of ``KVM_GET_MP_STATE`` writes guest
> +  memory through the VM-exit MSR-store list.  A guest page copied
> +  before that write is stale.
> +
> +Two constraints that older userspace still carries no longer apply:
> +
> +* ``KVM_GET_MSRS`` no longer has to precede ``KVM_GET_LAPIC``.  Before
> +  commit e800decd9c0a ("KVM: x86: Only reset TSC Deadline Timer in
> +  apic_timer_expired on KVM_RUN"), a ``vcpu_load()`` on a vCPU with
> +  APICv and the VMX preemption timer could restart the hv timer, find
> +  the deadline expired, inject the interrupt, and zero
> +  ``MSR_IA32_TSCDEADLINE``.  A ``vcpu_load()`` between the two getters
> +  therefore lost the interrupt and the deadline together.
> +
> +* ``KVM_GET_VCPU_EVENTS`` no longer has to precede ``KVM_GET_SREGS``,
> +  ``KVM_GET_SREGS2`` or ``KVM_GET_DEBUGREGS``.  When
> +  ``KVM_CAP_EXCEPTION_PAYLOAD`` is disabled, KVM delivers the payload of
> +  a pending #PF or #DB into CR2 or DR6 before it reports the exception,
> +  because userspace might not preserve the payload across a migration.
> +  Before commit d0ad1b05bbe6 ("KVM: x86: Defer non-architectural deliver
> +  of exception payload to userspace read"), only ``KVM_GET_VCPU_EVENTS``
> +  delivered it, so a CR2 or DR6 read first was stale.  All four getters
> +  now deliver it, and therefore agree in any order.
> +
> +Userspace that runs on older kernels should keep both orders.  Enabling
> +``KVM_CAP_EXCEPTION_PAYLOAD`` is worthwhile in any case, because it
> +stops KVM from delivering the payload early at all.
> +
> +One more hazard is not an ordering constraint, because it depends on
> +elapsed time rather than on sequence.  ``KVM_GET_CLOCK`` and a read of
> +``MSR_IA32_TSC`` describe the same instant only if little time passes
> +between them.  Userspace that needs a time-invariant value should
> +prefer the ``KVM_VCPU_TSC_OFFSET`` attribute of ``KVM_VCPU_TSC_CTRL``
> +over ``MSR_IA32_TSC``.
> +
> +Restoring state
> +~~~~~~~~~~~~~~~
> +
> +* **Set CPUID and the feature MSRs first.**  KVM freezes the virtual CPU
> +  model once the vCPU has run or once it is in guest mode.  After that,
> +  ``KVM_SET_CPUID2`` and writes to the immutable feature MSRs, which
> +  include the ``MSR_IA32_VMX_*`` MSRs, only succeed if they do not
> +  change anything.  Because ``KVM_SET_NESTED_STATE`` can put the vCPU
> +  into guest mode, userspace that writes the VMX capability MSRs after
> +  restoring nested state will fail to restore an L2 guest.  CPUID also
> +  gates the validation performed by ``KVM_SET_SREGS``,
> +  ``KVM_SET_XCRS``, ``KVM_SET_NESTED_STATE`` and the ``MSR_IA32_APICBASE=
``
> +  and ``MSR_IA32_XFD`` writes.
> +
> +* **Set the TSC frequency before the TSC.**  A host write of
> +  ``MSR_IA32_TSC`` computes a TSC offset, and a scaling ratio if TSC
> +  scaling is in use, from the current guest TSC frequency.
> +
> +* **Set MSR_IA32_FEATURE_CONTROL before the rest of the vCPU state.**  A
> +  host write of zero to this MSR forces the vCPU out of VMX operation.
> +  That discards the nested state, and replaces the register state with
> +  the L1 host state if the vCPU was running L2.  Only a write of zero
> +  has this effect; clearing individual bits, including the VMXON bits,
> +  does not.  The hazard therefore belongs to userspace that resets a
> +  vCPU before it restores one.

This paragraph kind of confuses me because it's saying that this
ordering should be explicit, but the explanation why requires
userspace to do something odd: restore zero into
MSR_IA32_FEATURE_CONTROL *after* restoring other state into the vCPU.
(This is strange, right?) Maybe there should just be a paragraph about
generally avoiding resetting/zeroing some vCPU state after restoring
some other non-trivial vCPU state.

Then I *think* this paragraph/constraint can be removed. Does
MSR_IA32_FEATURE_CONTROL need to be restored first for any other
reason?

> +
> +* **Set the special registers before the nested state.**  This
> +  constraint is specific to SVM, where the live register state is the L2
> +  state.  ``KVM_SET_NESTED_STATE`` rejects a saved guest mode unless
> +  EFER.SVME is already set, it validates the live CR0, and it reloads
> +  the CR3 that ``KVM_SET_SREGS`` installed.  On VMX the L2 control
> +  registers come from the VMCS12 instead.
> +
> +* **Set the APIC base and the special registers before the local APIC
> +  state.**  Changing the APIC enable or x2APIC bit resets the APIC ID,
> +  which would clobber the ID restored by ``KVM_SET_LAPIC``.  Separately,
> +  the CR8 field of ``KVM_SET_SREGS`` carries only bits 7:4 of the task
> +  priority register, so a CR8 write after ``KVM_SET_LAPIC`` clears TPR
> +  bits 3:0.
> +
> +* **Set the irqchip state before the local APIC state.**
> +  ``KVM_SET_IRQCHIP`` re-injects the restored I/O APIC IRR into the
> +  local APICs.  ``KVM_SET_LAPIC`` must run afterwards so that it
> +  overwrites the IRR wholesale; otherwise those interrupts are
> +  delivered twice.
> +
> +* **Set the XSAVE state before MSR_IA32_XFD.**  ``KVM_SET_XSAVE`` clears
> +  from the incoming header every state component that the current XFD
> +  value disables.  Writing XFD first therefore discards the state of
> +  those components.
> +
> +* **Set the special registers before the MP state.**  ``KVM_SET_SREGS``
> +  forces a boot-strap processor whose incoming state looks like a reset
> +  state back to ``KVM_MP_STATE_RUNNABLE``.
> +
> +* **Set the clock last.**  ``KVM_SET_CLOCK`` establishes the kvmclock
> +  epoch, and should run as close as possible to the moment the vCPUs
> +  resume.  The per-vCPU ``MSR_KVM_SYSTEM_TIME`` and
> +  ``MSR_KVM_WALL_CLOCK`` writes only record the guest page address, so
> +  they must precede it.
> +
> +* **Place KVM_SET_VCPU_EVENTS on the correct side of the nested
> +  state.**  For a vCPU in guest mode it has to run afterwards, on both
> +  vendors, because it writes the interrupt shadow and the NMI mask into
> +  the VMCS or the VMCB that is currently loaded, and the nested one
> +  becomes current only once ``KVM_SET_NESTED_STATE`` has entered guest
> +  mode.

The grammar here seems a little broken; reading more carefully leaves
me more confused (might just be me).

> A vCPU in SMM needs the opposite order, but on Intel only:
> +  ``KVM_SET_NESTED_STATE`` rejects the saved ``smm.flags`` unless the
> +  vCPU is already in SMM, and only ``KVM_SET_VCPU_EVENTS`` puts it
> +  there.  The AMD nested state has no equivalent field, because SMM
> +  saves and restores the nested state through SMRAM instead.  The two
> +  cases never coincide, because SMM temporarily disables VMX operation,
> +  so a single call always suffices.

Putting my QEMU/Vanadium hat on, I'm struggling to interpret this
constraint. What exactly does this constraint mean for how the code
must be written?

I'm also kind of confused why this constraint is written after the one
that is to be done last (KVM_SET_CLOCK).

> +
> +The vendors disagree about the registers.  On SVM the live register
> +state *is* the L2 state, so ``KVM_SET_REGS`` and ``KVM_SET_SREGS`` have
> +to run before ``KVM_SET_NESTED_STATE``.  On VMX the L2 RIP and RSP come
> +from the VMCS12, which ``KVM_SET_NESTED_STATE`` reloads, so
> +``KVM_SET_REGS`` is better issued afterwards.  Portable userspace can
> +write the registers on both sides of ``KVM_SET_NESTED_STATE``.
> +
> +KVM_SET_MSRS has to be issued twice
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +``KVM_SET_LAPIC`` sits between two MSR writes that cannot be combined
> +into one call.
> +
> +``MSR_IA32_APICBASE`` has to precede it.  Changing the APIC enable bit
> +or the x2APIC bit resets the APIC ID, which would discard the ID that
> +``KVM_SET_LAPIC`` restored.
> +
> +``MSR_IA32_TSCDEADLINE`` has to follow it.  A write to that MSR is
> +dropped unless the LVT timer is already in TSC-deadline mode, and only
> +``KVM_SET_LAPIC`` establishes the mode.  In the other direction,
> +``KVM_SET_LAPIC`` cancels the timer and zeroes any deadline that is
> +already armed.

"In the other direction" -> "In the reserve, incorrect order"

> The deadline is an absolute guest TSC value, so
> +``MSR_IA32_TSC`` has to be restored before it as well.
>
> base-commit: 827751b699b79a6e569983359c02dce67f81b94c
> --
> 2.55.0.1032.g73a4cd73de-goog
>
>
