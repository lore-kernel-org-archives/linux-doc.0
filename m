Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795696423;
	b=fOX8qrWUToePMsIbPRxaYtDpZDvTqSexlBrW53U4JbQJEUnUxCaM/BNTbRoHm6zbW3qX
	 SmAyA7MeAUbQjn5IxAhgw5hs2j/8MsB6evCBvIK27m4uKHmjC/8r5uUPTP4ysmiJgkFff
	 RKebIAHiZCMxmHu+/qshSI/X+EzOEMHFgSh4Lu4sfCDrJJyd+BDE8PHoCC5yJTB0sqmiP
	 xctQe6QA6B+fYx498auTg3uJiP5auijwYGcDrot+Z17zggryGoulSlh8AV1yUUjQQe8zI
	 ejkNgGvpV8AYKuI5fTDQTmTnFj82heGfx84zmTZNCivnJamtFyyKuhT4IMmhV21p2gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tor6BMmTaQWF6TGXVzl/EwsOtV0f7uA7HinakoZ/EMY=;
	b=g4cZ1z8Tvo+bcH0RV5BoM15izd8YsTgpEUxKU+yMvalbK42EBl4PXpPuvTMW+Ul0Edxr
	 +t9wjSuYpjjeqIjqZ5PXg01QEr+MpiWbN0cJFwcy81ZCYHtVOZm9BPd9XGzfeyBNPjgmI
	 iEauMvh+TWlcaU/4pPMpNV1mjUIpj9MVvJnINbz0Vk9xTGrZ1LGyKYea8lOJZaaq8PG3O
	 PYA6nKWLRh72T3N16DMIOCHyPD1GV2Q8mSRhQ560KA/aLT+Ueo66keUoImymCoshizXFc
	 NMMl7mzmEU9oGyrhf3fVXFMyM/bbtoum3eFd2Jnm0A2t92KJEFQRKEroALEbFFpCWgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=g0LgNJ0b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AD7606A321
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 12:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06AD7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=g0LgNJ0b
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-862b3a39d0dso3360105a34.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 04:33:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795696422; cv=none;
        d=google.com; s=arc-20260327;
        b=YwE4TiSN8kDSKGAYeZYe+W4X/wMLOygBB0MDhgxkShQY0+hj/48epaM3KoFoQYkNRr
         LINV2hBPo5A1z7Iq5agGFSzFcLhyRAGdy5a/ZRnC2ffSuSD+V+NriHT56hRgzCogu9Qp
         /zR9tDQy/Nh1NFpqTAf2MAHPM58D4eBxtZbjXEeAySajGmGF8KFAnadUK1zJvXs0wfmS
         tUt644ha5C5Hx2ZGIoPoP0mYPZiJvd8D1/c5BBgfJPaEssasVkjSfjJE/JH3H+mjeP61
         OUk9GzaJo6o3Sf0YD+QXfZoRWtFQkSv00QhhF93aKR4pbaZImeDlqrqCJ6y6H69E3oRc
         ycZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tor6BMmTaQWF6TGXVzl/EwsOtV0f7uA7HinakoZ/EMY=;
        fh=XwlN0Of2sHhK6xB0oZhUnZLG8mVBtrqmRI/LazlWQP4=;
        b=l8Z4SRcrihx6bRVnMoEtXjK12QNG6MvISOoR9T48kcly1EuwR6FBp0MFlUwHu/Naz1
         PfqWnnh4AD8VUV3VLgIeqzmXFyWzLdHBuUEK8ughoDGUpyHZ1pQO3eBClVNelZV+jN4B
         YY9hModTzmEcyIyxdy8AzJHucWpa0bxxpzuuVQtDpu2sE8EJr+tPI92X4H+4Rn1/KFnl
         muqpzO1UWbZVv9+x3n7UqzZVzagochPWTG99LWO+by/K75BZiXf35+bdY+YARUVOf3Ea
         4vHrfIOANcgsnpW2ojnT64KGbt2eLMx572QZE8t380f9GNrkWzybhizdGFO60i2Cx0Sd
         8ZIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795696422; x=1796301222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tor6BMmTaQWF6TGXVzl/EwsOtV0f7uA7HinakoZ/EMY=;
        b=g0LgNJ0b6WDvVnhz7n24J/J2fA4qGARWdspDpNH+fYgJBIca/2tivUe4+vNUurQ5/D
         MDNojFR3E3stY5ZCPkCCuIbddEBFtiWRL3SOgxchFvvEexusoLSH+sczvBBAB/JlLzhw
         12radlUJ5RrcI/8iSs7+j2Kfsz/zfFFqOatN7C9/9SSvbtZzkp4Pze37Aooq4cHW1WNo
         uBHeYOKYMJcTGkMg+9pzbh73h0TnyfVviSPIk8dp8mx01u3DUEkrUsVWjFecCmtgBP2E
         rQD1xBjbmYBwXY9HVgyvvsajY2T9Aei2UKjjjUpfIYQEi/aWe+6puQanuIR073Ya3Qnq
         SNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696422; x=1796301222;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tor6BMmTaQWF6TGXVzl/EwsOtV0f7uA7HinakoZ/EMY=;
        b=XckWBd4crhCFqgDs8Sq72/0fYErGEJ9Hv1wLYBSQzpsbiOKiEWtYxupm1uHgW72ohA
         gAFMWw5szuIHjQmbn6SG4UKVIeVezbBiOfuTax/ujA5meKfGn2LRHYnvOwpccgybj7X6
         awdiSyavy93/bYalAsXhXEJvxSGJFm8WRuVMyDvkGmend3R3WHmKSTGtpE+B43Sv8Las
         wBAG6ZTJJoK20StVUeutXP+NdwichrCx19rhSPJzSiPv79AC3B/Um2vxv6dzRf98aG5m
         OtOWP4VVyEELfkKuwnkMBmXvoKoxJ5Nw0jTknmKHRdWFuXxPZi0iCh03NeJythm2MjDX
         vlLA==
X-Forwarded-Encrypted: i=1; AL+hErFvQqJ+GSHUI1DF1V3EWeRNSKzuRy98CyzF5kpnVGEs22tbVQZXPjged6aOBdWYjTFa5DzlbC5ziK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bvx6r0R/uEEtcM7EoUKIzHEQZMp1568Z4KtaNwkQun27QDgs+
	kqBxh5iNW7hhvXarKSIy3WB2AF+k36x+3UtkJo2raSqH0WnMRBuqVkx0ascQKHklQ0/D+o/xmJ/
	/BH65fXK3pLNr0l+hEEWACXTMlwaaCE3wjP/5YPEzKA==
X-Gm-Gg: AZFdTZepseD8oWbZK62rDXmBvURCxCupUCMLVYbn3MfX6QLGjqmDHyjys4w+a97ImHu
	UgrYgA1mXRXS0reSVpc9rh+dhPNf9L95aWLQu/dootbSubicpvcTHF4OcpoSj7Xq4YBmr/O8xX+
	LrgsPnSb9lYfslPvA/rP7H2N6Fawa2NOO3utvM1MtmX7MMl1JdsBuME+u25PBrXNDbhtz2alhP5
	cNaIhTHCeuSTNMzxkjDSfWcpsqyWcBUiM88QfCZM91pxI2uyBaamUsd+kNyp0y4kqf+Z8weN9hI
	mYijohdMZY3wHDda/xFG4vZ9q3fc9/l11oPU3XoS4Fhm17/SDg/OhUztnl0r7SgpsvXKlGt/VVA
	x3uIjr5TRC80Gects3VDroxmc7Y9tCidFzqT+MBlzbO4=
X-Received: by 2002:a05:6830:44a2:b0:7fa:5c49:523e with SMTP id
 46e09a7af769-86315a29c1cmr22980637a34.23.1795696421647; Thu, 26 Nov 2026
 04:33:41 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794437052.git.babu.moger@amd.com>
In-Reply-To: <cover.1794437052.git.babu.moger@amd.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 26 Nov 2026 20:33:30 +0800
X-Gm-Features: Aa3M54peXYmxX6ArtX42QrtMffJl781Xgy48ENTn2QvaGzQFnSXZRCeVFI7Ryww
Message-ID: <CAEEQ3wn8n6R8CTxp4Z0ZWL+PZtgThCE4wbEbx6+M4vDqV3+6fg@mail.gmail.com>
Subject: Re: [External] [PATCH v7 00/19] x86,fs/resctrl: Add kernel-mode
 (e.g., PLZA) support to the resctrl subsystem
To: Babu Moger <babu.moger@amd.com>
Cc: tony.luck@intel.com, reinette.chatre@intel.com, ben.horgan@arm.com, 
	Dave.Martin@arm.com, james.morse@arm.com, bp@alien8.de, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, x86@kernel.org, 
	fustini@kernel.org, tglx@kernel.org, mingo@redhat.com, 
	dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com, 
	rppt@kernel.org, arnd@arndb.de, kmehltretter@gmail.com, 
	dapeng1.mi@linux.intel.com, elver@google.com, enelsonmoore@gmail.com, 
	jlayton@kernel.org, seanjc@google.com, ewanhai-oc@zhaoxin.com, 
	binbin.wu@linux.intel.com, nikunj@amd.com, ashish.kalra@amd.com, 
	peterz@infradead.org, superm1@kernel.org, thomas.lendacky@amd.com, 
	prathyushi.nangia@amd.com, kim.phillips@amd.com, 
	ricardo.neri-calderon@linux.intel.com, darwi@linutronix.de, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Thu, Nov 12, 2026 at 6:56=E2=80=AFAM Babu Moger <babu.moger@amd.com> wro=
te:
>
>
> Hi All,
>
> This series adds support for AMD's Privilege-Level Zero Association (PLZA=
),
> which allows the CPU to use a different CLOSID and/or RMID association
> while executing in kernel mode than it does in user mode.
>
> The implementation is integrated through a generic kernel mode ("kmode")
> framework in fs/resctrl, enabling future architectures to support similar
> functionality without requiring changes to the core resctrl code. The
> intent is to provide a common infrastructure that architecture-specific
> implementations can hook into, minimizing future resctrl core
> modifications.
>
> The features are documented in:
>
>    AMD64 Zen6 Platform Quality of Service (PQOS) Extensions,
>    Publication # 69193 Revision 1.00, Issue Date March 2026
>
> available at https://bugzilla.kernel.org/show_bug.cgi?id=3D206537
>
> The patches are based on top of commit (tip/master):
>
>   c6279551a44c Merge branch into tip/master: 'x86/sev'
>
> Any feedback is appreciated.
>
> Background
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> When memory bandwidth associated with a CLOSID is aggressively throttled,
> and a task with that CLOSID moves into kernel mode, the kernel operations
> are also aggressively throttled. This can stall forward progress and
> eventually degrade overall system performance.
>
> Privilege-Level Zero Association (PLZA) allows the user to specify a CLOS=
ID
> and/or RMID for execution at Privilege Level Zero. When PLZA is enabled o=
n
> a CPU, kernel work at PL0 uses the CLOSID and/or RMID from MSR
> PQR_PLZA_ASSOC; otherwise, the CPU uses the CLOSID and RMID from PQR_ASSO=
C.

Could you please share any available performance data on the benefits
of enabling PLZA on your platform?

Thanks,
Yunhui

>
> Design
> =3D=3D=3D=3D=3D=3D
>
> A new sysfs file, info/kernel_mode, selects the kernel mode for resource
> allocation and monitoring of kernel work and, when the mode needs one, th=
e
> resource group that backs it. Reads list the supported modes, with the
> active mode in square brackets. Writes use the same line without the
> brackets. Look at the thread below for design discussion.
> https://lore.kernel.org/lkml/14a8ad0a-e842-4268-871a-0762f1169e03@intel.c=
om/
> https://lore.kernel.org/lkml/e4c95002-ae8a-48d0-bedd-772db58b937e@intel.c=
om/
>
> Two kernel modes are exposed:
>
> - inherit_user: kernel work uses the allocation and monitoring
>   associations of the user task on whose behalf it runs. It takes no
>   parameters.
>
> - global_enable_per_cpu: kernel work uses the allocation and/or
>   monitoring association of a backing CTRL_MON or MON group. ctrl=3D and
>   mon=3D select assign or inherit for each. group=3D names the group and
>   must be the last parameter, because a group name may contain ';'.
>
>   When mon=3Dassign, a CTRL_MON group is shown as <CTRL_MON>// and a MON
>   group as <CTRL_MON>/<MON>/. When mon=3Dinherit, or monitoring is
>   unsupported, a CTRL_MON group is shown as <CTRL_MON>/.
>
>   An omitted ctrl=3D, mon=3D, or group=3D selects the default: assign whe=
re
>   the platform supports it, and the default CTRL_MON group. A partial
>   write therefore restores the omitted fields and programs every online
>   CPU. ctrl=3Dinherit together with mon=3Dinherit is rejected. A monitor
>   group requires mon=3Dassign. A failed write leaves the current
>   association in place.
>
> Per-rdtgroup files kmode_cpus and kmode_cpus_list scope the association
> to a subset of online CPUs. They are visible only on the group that
> backs the active association. A write enables the association on CPUs
> added to the mask and disables it on CPUs removed from the mask. An
> empty mask disables the association on every currently online CPU. A
> new global_enable_per_cpu association sets the mask to every online
> CPU. A CPU that comes online later joins the association, including
> after a narrowed or empty mask. A CPU that goes offline leaves it only
> when that CPU is in the mask.
>
> A group that backs the association, or a control group whose monitor
> group does, cannot change mode, including entering pseudo-lock setup.
> Reparenting a backing monitor group is rejected. The backing group
> cannot be renamed until the association is cleared.
>
> The arch hook, resctrl_arch_configure_kmode_global(), keeps the
> fs/resctrl layer arch-neutral. enable=3Dfalse disables the mode on the
> given CPUs and still writes the same CLOSID, RMID, and per-ID enables,
> which is what the PLZA domain rule requires. It does not by itself
> switch the active mode back to inherit_user.
>
> resctrl_set_kmode_support() lets architecture code register each extra
> mode during resctrl initialization. inherit_user is registered by
> default. On AMD, PLZA registers global_enable_per_cpu when the feature
> is available and the platform can allocate or monitor.
>
> Only AMD PLZA is wired up here; Intel and ARM can add their own support
> later by implementing the hooks.
>
> Examples
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> (See Documentation/filesystems/resctrl.rst, "kernel_mode", "kmode_cpus",
> and "Examples on working with kernel_mode", for the full UAPI.)
>
>   # Mount resctrl
>   # mount -t resctrl resctrl /sys/fs/resctrl
>   # cd /sys/fs/resctrl
>
>   # Read the supported modes.  The active mode is bracketed for display
>   # only; do not include brackets when writing.
>   # cat info/kernel_mode
>   [inherit_user]
>   global_enable_per_cpu:ctrl=3Dassign;mon=3Dassign;group=3D//
>
>   # Create a CTRL_MON group and back kernel-mode allocation with it.
>   # mon=3Dinherit, so the group is shown as <CTRL_MON>/.
>   # mkdir ctrl1
>   # echo "global_enable_per_cpu:ctrl=3Dassign;mon=3Dinherit;group=3Dctrl1=
/" \
>           > info/kernel_mode
>   # cat info/kernel_mode
>   inherit_user
>   [global_enable_per_cpu:ctrl=3Dassign;mon=3Dinherit;group=3Dctrl1/]
>
>   # kmode_cpus and kmode_cpus_list are visible only on the backing group.
>   # ls ctrl1/kmode_cpus*
>   ctrl1/kmode_cpus  ctrl1/kmode_cpus_list
>
>   # Restrict the association to a CPU subset. The association is enabled
>   # on CPUs added to the mask and disabled on CPUs removed from it.
>   # echo 0-3 > ctrl1/kmode_cpus_list
>   # cat ctrl1/kmode_cpus
>   f
>   # cat ctrl1/kmode_cpus_list
>   0-3
>
>   # Return to inherit_user. The inactive global_enable_per_cpu line
>   # shows the defaults again.
>   # echo "inherit_user" > info/kernel_mode
>   # cat info/kernel_mode
>   [inherit_user]
>   global_enable_per_cpu:ctrl=3Dassign;mon=3Dassign;group=3D//
>
> Tested on AMD with PLZA; builds on x86 without PLZA and does not expose
> global_enable_per_cpu unless the feature is available.
>
> Layout
> =3D=3D=3D=3D=3D=3D
>
>   01-03  x86: PLZA CPU feature, command-line option, and MSR definitions.
>   04-07  fs/resctrl: kernel mode enum, arch hook, kmode state, and
>          resctrl_set_kmode_support().
>   08     x86/resctrl: register global_enable_per_cpu when PLZA is
>          available.
>   09     fs/resctrl: document last_cmd_status under a top-level info
>          section.
>   10     fs/resctrl: info/kernel_mode read interface.
>   11     fs/resctrl: hidden rdtgroup files.
>   12     fs/resctrl: per-rdtgroup kmode_cpus/kmode_cpus_list.
>   13     x86,fs/resctrl: CPU hotplug for the active association, and
>          clear PLZA across kexec.
>   14     fs/resctrl: deactivate the association when a group is removed.
>   15     fs/resctrl: info/kernel_mode write interface.
>   16     fs/resctrl: reject mode changes and reparenting while a group
>          backs the association.
>   17     fs/resctrl: show or hide kmode_cpus on the backing group.
>   18     fs/resctrl: kmode_cpus/kmode_cpus_list writes.
>   19     fs/resctrl: documentation and examples.
>
>
> Changelog
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> v7:
>   - Used "CLOSID and/or RMID association" throughout the series because
>     feature operates on the MSR_IA32_PQR_PLZA_ASSOC association register.
>     The association concept is already known in the resctrl subsystem.
>     Please let me know if you see a better alternative.
>   - Rebase onto tip/master c6279551a44c ("Merge branch into tip/master:
>     'x86/sev'").
>   - Document last_cmd_status in a new "Top level files" section of the
>     info directory, before kernel_mode.
>   - info/kernel_mode includes the monitor component of group=3D only when
>     mon=3Dassign. A CTRL_MON group then reads as <CTRL_MON>//. When
>     mon=3Dinherit, or monitoring is unsupported, it reads as <CTRL_MON>/.
>   - An omitted ctrl=3D, mon=3D, or group=3D selects the defaults (assign
>     where the platform supports it, and the default CTRL_MON group).
>     A partial write restores the omitted fields and programs every
>     online CPU.
>   - Reject ctrl=3Dinherit together with mon=3Dinherit. With both enables
>     clear, CPL0 keeps the user task's IDs, which is inherit_user.
>   - group=3D is the last parameter, so a group name may contain ';'.
>   - Drop resctrl_kmode_switch(). Deactivation restores inherit_user
>     and the default ctrl and mon values.
>   - Move kmode_cpus visibility to after activation and deactivation,
>     and move the mode-change and reparent checks to after the
>     kernel_mode write interface.
>   - Clear MSR_IA32_PQR_PLZA_ASSOC from clear_closid_rmid() so a kexec
>     boot does not keep a previous kernel's PLZA state.
>
> v6:
>   - Addressed all the comments as discussed in v5. Anything missing
>     is not intentional. Please feel free to comment on any mistake.
>   - Rename assign_global_enable_per_cpu to global_enable_per_cpu and
>     describe the interface as a kernel mode rather than a policy.
>   - Flatten kernel mode state into resctrl_kmode. The arch hook is
>     resctrl_arch_configure_kmode_global().
>   - An omitted ctrl=3D, mon=3D, or group=3D keeps the value shown by read=
ing
>     info/kernel_mode. inherit_user takes no parameters.
>     ctrl=3Dinherit;mon=3Dinherit remains global_enable_per_cpu.
>   - Selecting a new global_enable_per_cpu association sets that group's
>     kmode_cpus to every online CPU. A CPU that comes online later joins
>     the association even if user space had removed it from the mask.
>   - kmode_cpus files are created hidden and shown only while the group
>     backs the active association.
>   - A monitor group requires mon=3Dassign. Removing a control group
>     detaches a child that backs the association before the parent's
>     CLOSID is freed.
>   - Reject a mode change when the group or one of its monitor groups
>     backs the association.
>   - Split kmode_cpus visibility and the mode-change rejection into
>     their own patches.
>   - Use the parsing similar to ctrlmondata.c:parse_line(),
>     ctrlmondata.c:resctrl_io_alloc_parse_line(),
>     monitor.c:resctrl_parse_mbm_assignment().
>   - Re-wrote the changelog as a feature and not as a bug-fix.
>   - Remove implementation details in function headers.
>
> v5:
>   - Collapse the two v4 global-assign modes into a single
>     assign_global_enable_per_cpu policy with ctrl=3D and mon=3D options.
>   - Use "association" terminology consistently in code, errors, and
>     documentation.
>   - Register assign_global_enable_per_cpu once during x86 resource
>     discovery when PLZA is available.
>   - Reject mon=3Dinherit when group=3D selects a monitor group.
>   - Split hidden-file support, deactivation-on-teardown, and PLZA mode
>     registration into separate patches for easier review.
>   - Fix msr_pqr_plza_assoc truncation on 32-bit systems by using u64.
>   - Refresh documentation and add a readable end-to-end example walkthrou=
gh.
>   - Block pseudo-lock setup on kernel-mode-associated groups.
>   - Reject mode changes and rename while a group backs the active
>     association.
>
> v4:
>   - Reorder and split the series into 15 patches: separate read-only
>     info/kernel_mode display from the write path; add hotplug support
>     when a CPU comes online; add an end-to-end documentation/examples
>     patch.
>   - Introduced resctrl_set_kmode_support() so architecture code can
>     register supported kernel-mode policies during resctrl initialization=
.
>   - info/kernel_mode write: validate group type; run fail paths before
>     tearing down the active association so errors retain the old state.
>   - kmode_cpus / kmode_cpus_list: writable with incremental enable/disabl=
e
>     deltas; empty masks allowed; offline CPUs rejected.
>   - Hotplug: newly online CPUs are added to the associated group's
>     kmode_cpu_mask and programmed when assign_global_enable_per_cpu is
>     active.
>
> v3:
>   - Generalise the layer beyond AMD: rename "PLZA mode" to "kernel mode"
>     (kmode) in code, sysfs, and Documentation.
>   - Reset the association when the associated rdtgroup is removed,
>     instead of leaving stale state.
>
> v2:
>   - Similar to RFC with a new proposal; interface names were not final.
>   - Separated Global Bandwidth Enforcement (GLBE) from PLZA; this series
>     only adds PLZA support.
>   - Used "kmode" instead of "PLZA" in the generic layer.
>
> Previous versions:
> v6: https://lore.kernel.org/lkml/cover.1790867441.git.babu.moger@amd.com/
> v5: https://lore.kernel.org/lkml/cover.1787772750.git.babu.moger@amd.com/
> v4: https://lore.kernel.org/lkml/cover.1783461016.git.babu.moger@amd.com/
> v3: https://lore.kernel.org/lkml/cover.1777591496.git.babu.moger@amd.com/
> v2: https://lore.kernel.org/lkml/cover.1773347820.git.babu.moger@amd.com/
> v1: https://lore.kernel.org/lkml/cover.1769029977.git.babu.moger@amd.com/
>
> Babu Moger (19):
>   x86/cpufeatures: Support Privilege Level Zero Association (PLZA)
>   x86/resctrl: Add PLZA support to command-line options
>   x86/resctrl: Add PLZA MSR definition and field layout
>   fs/resctrl: Introduce kernel mode enum
>   arm,x86,fs/resctrl: Introduce arch hook to program global per-CPU
>     kernel mode
>   fs/resctrl: Introduce data structures for kernel mode configuration
>   fs/resctrl: Introduce resctrl_set_kmode_support() to register
>     supported modes
>   x86/resctrl: Register RESCTRL_GLOBAL_ENABLE_PER_CPU when PLZA is
>     available
>   fs/resctrl: Rearrange top-level files in info directory
>   fs/resctrl: Add interface to display kernel mode status
>   fs/resctrl: Add support for hidden resource group files
>   fs/resctrl: Introduce kmode_cpus/kmode_cpus_list per rdtgroup
>   x86,fs/resctrl: Add CPU hotplug support for kernel mode
>   fs/resctrl: Deactivate kernel mode when the group is removed
>   fs/resctrl: Extend info/kernel_mode to configure the kernel mode
>   fs/resctrl: Reject mode changes for groups backing kernel mode
>   fs/resctrl: Control visibility of global per-CPU kernel mode group
>     files
>   fs/resctrl: Allow userspace to write kmode_cpus/kmode_cpus_list
>   fs/resctrl: Add kernel mode documentation and examples
>
>  .../admin-guide/kernel-parameters.txt         |   2 +-
>  Documentation/filesystems/resctrl.rst         | 255 ++++++-
>  arch/x86/include/asm/cpufeatures.h            |   1 +
>  arch/x86/include/asm/msr-index.h              |   1 +
>  arch/x86/kernel/cpu/resctrl/core.c            |   9 +
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  38 +
>  arch/x86/kernel/cpu/resctrl/internal.h        |  49 ++
>  arch/x86/kernel/cpu/scattered.c               |   1 +
>  drivers/resctrl/mpam_resctrl.c                |   7 +
>  fs/resctrl/internal.h                         |  32 +
>  fs/resctrl/rdtgroup.c                         | 693 ++++++++++++++++++
>  include/linux/resctrl.h                       |  65 ++
>  12 files changed, 1141 insertions(+), 12 deletions(-)
>
> --
> 2.43.0
>
>
