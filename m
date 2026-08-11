Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0661837BE81
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 16:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786466403; cv=none; b=K2BocD+jHkfet/sSXByM+ZHLvlQzQasvMKRalKQzeRurWlosk2w+opLP/AeeJI04qtzKvYYcpBR30DOa5d+RH+Tj55JC224Oq74mxoVMJNFWNSouM/wRflrMl9rMNB8I7yT/Jt5o6YEpIlcGbgSR/E7BL9RoV3fdKCoZ0cMRYNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786466403; c=relaxed/simple;
	bh=x3WgV96TSRrgaGzvHZOrZd8amq4PmoTOJA0PE5Bc3ro=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tog7UgjFGA2nDqSL0RINjKQrfNJuBAAJlUKjwJ+9JjFwZaef8+5nUn6e2ZJWZB6HGBdHg+S9V+UoHUtRqFipwFarIMz8tX6tDwTNttXWjZn/waoTj+N8rwy5G5Klmf4Mv3aKgwbyiPn004F8SF8f/DeNCaRwcJFOC391BR9N44A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Id7aDxyj; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Id7aDxyj"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484f26852dso63585b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 09:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786466401; x=1787071201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1rxRzhkW3E+GRLBK4lU1PGGkM/l3GS9nXng7CK7oPdQ=;
        b=Id7aDxyjRTKI88j+VwxcbAXr5kXxAAztogV2G7Wej5LcmJ8FJnzmA1omJlXueLMvUb
         vAsiRI7Oxhj60eeT2q08khLtem6MrMvngBonpRzVC5CKQynW3glA4b/jZBePBljfkR3k
         YGSTimCHHsT8139hH3DHyxdJrCg6VC80DF0X+K8b3yPti8f8bS49w/0DJn56q+ej5vSM
         stHXcAcXGG6S5zqc/47oODus7SjiTxlyAfMIY0UrQPAtun+yaL0VZx1skA9e1QAa3zC3
         44jdE2CtvXRSEmjPiQT1/IwFTrTV4gjCV5uwILQTb+StCBsfb7v1/muiLDv2Wni38Ogl
         gBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786466401; x=1787071201;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rxRzhkW3E+GRLBK4lU1PGGkM/l3GS9nXng7CK7oPdQ=;
        b=oqm0+tvzaMRrAYh8/VquNygV6QgDkqHwLqxIrTjYbyYiek6OSHV9QIun2vLwt6K1da
         0evInbC4Uk5hyZmPJZ1VaxZnFh5pMqTf+NNmjT5Y5so4XJt74Pm91slo7aDfLv3FAWXl
         vdPJaxKhP7kBcj+od033irLNkB57bGc4pTZ+IIiC04cO8uYw/d2M53X1yQ0p0O2KPezP
         SlnafoClwKR6PUlWJmm/VvcQgzf14sQtZM6BNZwAre1CA7vypl254TtwRJggX0FYvSFI
         ZhYxGEuY4/MSeHKWl5esUFHYWyx+RerTajPhKDYxb5kQLr2PEnNNHzTdqsby7WQLvhKb
         shRw==
X-Forwarded-Encrypted: i=1; AHgh+Rozmg/2njrNG04eYRL743JeDfPLh1nNrc/as2tWGLQMBMEu7WWbDpiKhIquRhu5ubLWEJSz/IBfra0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGYKbiCSQpkV6jH5jcLBWE1nD5uzJMDWXMaSPBE0b6qtJggd0z
	CucFVpIM4OJpl/2zR1XQQ78bedTf4tbc4YjlGKw1KTKYZ+7vYx0Aj6tS5s1Ph+g9vUf7NByly5j
	pM/gTEg==
X-Received: from pfst18.prod.google.com ([2002:aa7:8f92:0:b0:848:8d8a:9463])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b42:b0:848:30c3:45dd
 with SMTP id d2e1a72fcca58-84fa86e1489mr4667146b3a.11.1786466401012; Tue, 11
 Aug 2026 09:40:01 -0700 (PDT)
Date: Tue, 11 Aug 2026 09:40:00 -0700
In-Reply-To: <e256fa4af96e916ba30019cbba501fa896025fb0.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-18-dwmw2@infradead.org>
 <anoOz2rZ02KFk1l-@google.com> <acd9b32617f75d188c370a464a922af0d650d4f5.camel@infradead.org>
 <ano6-gIZtqMfipiD@google.com> <bb9a12cc663130eb2caa8e839d0f6ca53d722d1c.camel@infradead.org>
 <ansuqrD2KwFuLWbV@google.com> <ansywxh0VX5rtfWc@google.com> <e256fa4af96e916ba30019cbba501fa896025fb0.camel@infradead.org>
Message-ID: <antQYJvRxJxOjtut@google.com>
Subject: Re: [PATCH v7 17/36] KVM: x86: Allow KVM master clock mode when TSCs
 are offset from each other
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026, David Woodhouse wrote:
> On Tue, 2026-08-11 at 07:33 -0700, Sean Christopherson wrote:
> >=20
> > Actually, why are KVM_{G,S}ET_CLOCK_GUEST vCPU-scoped?=C2=A0 Per the do=
cumentation,
> > the API "Sets the KVM clock (for the whole VM) in terms of the vCPU TSC=
".=C2=A0 If
> > the APIs are VM-scoped instead of vCPU-scoped, then KVM can simply save=
/restore
> > what's in the per-VM masterclock state, no?
>=20
> They're vCPU-scoped because they need to be tied to a guest TSC (on
> live migration, neither ka->master_cycle_now nor ka->master_kernel_ns
> are useful =E2=80=94 those are the "per-VM masterclock state").

But master clock is also tied to guest TSC.

> Theoretically, guest TSCs can be different on each vCPU (different
> offset, different *rate* even. Not that we allow KVM_[GS]ET_CLOCK_GUEST
> at different rates, I concede).

Sure, but not masterclock, and if we're saying that KVM_[GS]ET_CLOCK_GUEST =
is
for migrating masterclock state, then as you concede, vCPUs with TSCs at di=
fferent
frequencies is completely out of scope.

> So they operate in the context of a given vCPU, and *its* TSC.

Yes, but KVM_[GS]ET_CLOCK_GUEST aren't saving/restoring vCPU state, they're
saving/restoring masterclock state, which is VM-scoped.  What I don't like =
about
the proposed uAPI is that it implicitly consumes state, from an arbitrary v=
CPU,
that KVM very explicitly tracks in masterclock.  And AFAICT, there's zero r=
eason
to do so.

E.g. as a strawman, I would expect something like this to migrate masterclo=
ck
state (deliberately avoiding "master" in the uAPI, because checkpatch is al=
ready
screaming too much).  I didn't try too hard to get the math right, I just w=
anted
to highlight that all the state needed to restore the masterclock is availa=
ble
in the masterclock (which seems comically obvious when I type it out).

struct kvm_pvclock {
	__u64 tsc_timestamp;
	__u64 tsc_scaling_ratio;
	__u64 tsc_offset;
	__u64 system_time;
	__u32 tsc_to_system_mul;
	__s8  tsc_shift;
	__u8  pad0;
	__u16 pad1;
	__u32 pad2;
};

#define KVM_SET_PVCLOCK		_IOW(KVMIO, 0xd6, struct kvm_pvclock)
#define KVM_GET_PVCLOCK		_IOR(KVMIO, 0xd7, struct kvm_pvclock)

static int kvm_vcpu_ioctl_set_pvclock(struct kvm *kvm, void __user *argp)
{
	struct kvm_pvclock user_hv_clock;
	struct kvm_arch *ka =3D &kvm->arch;
	u64 curr_tsc_hz, user_tsc_hz;
	u64 user_clk_ns;
	u64 guest_tsc;
	int rc =3D 0;

	if (copy_from_user(&user_hv_clock, argp, sizeof(user_hv_clock)))
		return -EFAULT;

	if (user_hv_clock.pad0 || user_hv_clock.pad1 || user_hv_clock.pad2)
		return -EINVAL;

	if (!user_hv_clock.tsc_scaling_ratio || !user_hv_clock.tsc_to_system_mul)
		return -EINVAL;

	if (user_hv_clock.tsc_shift < -31 || user_hv_clock.tsc_shift > 31)
		return -EINVAL;

	user_tsc_hz =3D hvclock_to_hz(user_hv_clock.tsc_to_system_mul,
				    user_hv_clock.tsc_shift);

	kvm_hv_request_tsc_page_update(kvm);

	/*
	 * kvm_start_pvclock_update() takes tsc_write_lock and opens
	 * the pvclock seqcount; kvm_end_pvclock_update() closes both.
	 * All clock state modifications between them are atomic with
	 * respect to readers in kvm_guest_time_update().
	 */
	kvm_start_pvclock_update(kvm);
	pvclock_update_vm_gtod_copy(kvm);

	if (!ka->use_master_clock) {
		rc =3D -ENODATA;
		goto out;
	}

	curr_tsc_hz =3D (u64)get_cpu_tsc_khz() * HZ_PER_KHZ;
	if (unlikely(curr_tsc_hz =3D=3D 0)) {
		rc =3D -EBUSY;
		goto out;
	}

	if (kvm_caps.has_tsc_control)
		curr_tsc_hz =3D kvm_scale_tsc(curr_tsc_hz,
					    user_hv_clock.tsc_scaling_ratio);

	/*
	 * The mul/shift in the provided pvclock structure encode the guest TSC
	 * frequency at which it was generated. Sanity-check that it is
	 * consistent with the existing pvclock information, and by extension
	 * all vCPUs' effective TSC frequenies.  Allow a discrepancy of 1 kHz
	 * either way since independently calibrated hosts will not measure
	 * precisely the same value even for the same nominal frequency.
	 */
	if (user_tsc_hz < curr_tsc_hz - 1000 ||
	    user_tsc_hz > curr_tsc_hz + 1000) {
		rc =3D -ERANGE;
		goto out;
	}

	/*
	 * Calculate the guest TSC at the new reference point, and the
	 * corresponding KVM clock value according to user_hv_clock.
	 * Adjust kvmclock_offset so both definitions agree.
	 */
	guest_tsc =3D user_hv_clock.tsc_offset +
		    kvm_scale_tsc(user_hv_clock.system_time,
				  user_hv_clock.tsc_scaling_ratio);

	if (guest_tsc !=3D user_hv_clock.tsc_timestamp +- ???) {
		rc =3D -EINVAL;
		goto out;
	}

	<fill in masterclock>

out:
	kvm_end_pvclock_update(kvm);
	return rc;
}

> And I think I'm going to defend that 'theoretical they can be
> different', because I *would* like to eliminate the ways that a *guest*
> can force non-masterclock mode, and that does mean allowing the offset-
> TSC case.
>=20
> FWIW in my local tree I've just extended the pvclock_migration_test to
> test precisely the thing you were concerned about: three vCPUs with
> divergent TSC offsets, migrated by setting each vCPU's TSC and then
> invoking KVM_SET_CLOCK_GUEST once, through vCPU0.=20

I wasn't actually concerned about migration, I was concerned about time goi=
ng
backwards from the guest's perspective.
