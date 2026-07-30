Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D42B394461
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 06:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394369; cv=none; b=ZVd1m0QO6F2BHsl/BrAGVSgcPKNkAi7AQK0ZaOXk3grdNjmEIj5EV2ZJVjWXLdn0kPfY6tqOA8UP5WfVcwOArc3L+wEZHa187auMblSPHiI5aSdjo0a1I0zU7DK5jCpbn10qNp9UQvdVhDaVY80AmAXy4XIncPoAbZ1+w9wJwcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394369; c=relaxed/simple;
	bh=Pbj0P+gU8va8jJCrhk4MN1M1pVJoePTsLFgY9CKEP0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VpBEKon2wHT/dX3azkPTuTN+i1M/ydcL3lJ21q/i1JKXtzGgqLxX1nFdWf+fN/gtOncjRXWXMatvkMZsFQhKpV5vcmOv3bD63YhOJoH7HKSWv5ECDcKZNXCLz8qdLbfyeRPpsA4jhUKgVp14tKrIwP4St6/M8hTlrNWohRyA4X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tmMQTaBg; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tmMQTaBg"
X-Forwarded-Encrypted: i=1; AHgh+RrVdOgx7iy9Rb9H2wZ2jKVCBSFtVUXcjFDcXYJ7S0hjXXQtZDU2f/3Jfns/sqKu4Mgscme4eX58D7o=@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785394363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pbj0P+gU8va8jJCrhk4MN1M1pVJoePTsLFgY9CKEP0E=;
	b=tmMQTaBgxUYKj/64iZQZQ+jyZrJW33BTuuukdzBlifi48aXiC+xMzUaVOXGIkAKsRTEZM3
	LuPfYvj4zsQ5RUA0GkHs+vZKPz88amb/EjsMEwaayFHZp5GjEmqFlDkCBL7h2rzBMvoCKZ
	TapGPEKnBPV43Tqj2psujjNfeAgSfwU=
X-Gm-Message-State: AOJu0YyC0oBLGNki9+SOTy+3z24AhoVG8rNebeWWwInFuCOg06/MyCDw
	6zjsZtJMjMEiIjdPWHBzhjkvgWpCyyImXU7d6ZLQM9WP/5JwzzsOHdzQzQCO6WEEN3XHAMQk/Y6
	9eG5iS3A6CVPbq9qTQ4eayuctlSmsV00OAHJf6gjq
X-Received: by 2002:a05:622a:1f18:b0:528:38d6:71b4 with SMTP id
 d75a77b69052e-52b39484e98mr9124391cf.11.1785394358893; Wed, 29 Jul 2026
 23:52:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
 <20260720-hybrid-v9-14-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
 <CA+EHjTx0zNQ_yPCz38vGYpBssshE4b3KWaoUxjzuerGgzB=JSQ@mail.gmail.com> <e023d791-38c3-47b4-9b09-3420fe78d9ea@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <e023d791-38c3-47b4-9b09-3420fe78d9ea@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 30 Jul 2026 07:52:01 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxAH-eW4soxjbSJi8DwbH-yRXE-jJ9s02nEZ7kVXxxWMQ@mail.gmail.com>
X-Gm-Features: AUfX_my8ZWlfDB9plrXG5PWElkl5pTmNLk-LtsIhDb0mp2MLaqYsxid4gcfDy1k
Message-ID: <CA+EHjTxAH-eW4soxjbSJi8DwbH-yRXE-jJ9s02nEZ7kVXxxWMQ@mail.gmail.com>
Subject: Re: [PATCH v9 14/16] KVM: arm64: PMU: Implement fixed-counters-only emulation
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steffen Eiden <seiden@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT

Hi Akihiko,

On Thu, 30 Jul 2026 at 07:36, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
...
> > Sashiko flagged that this can leave the perf event out of sync with
> > the sysreg, which looks plausible: on a pCPU with no registered pPMU
> > this returns without recreating the event, so a guest event-type
> > change there updates the sysreg but not the event, and after migrating
> > back to a pCPU the original pPMU covers, kvm_pmc_enable_perf_event()
> > re-enables the stale event instead of recreating it.
> >
> > I know you treat the no-pPMU case as out of spec, but the dropped
> > update lands once the vCPU is back on a normal pCPU. Is this intended?
>
> "[PATCH v9 06/16] KVM: arm64: PMU: Recreate events after MDCR_EL2
> changes" calls kvm_pmu_stop_counter() in kvm_vcpu_reload_pmu(), so it
> does not matter whether this function calls kvm_pmu_stop_counter().
>
> The other changes that require recreating the event are currently not
> handled at all as Sashiko complains [1]. I'll fix that as done in
> MDCR_EL2 setters in the next version.
>
> That said, I do not intend to add any extra complexity to provide any
> guarantee for a system with unsupported PMU variation except that the
> user can notice and react to that (i.e., the taint is reported and no
> oops happens due to NULL dereference). The patch message is somewhat
> misleading in this aspect so I'm going to fix that in the next version.

I see, yes, fixing the changelog would help.

Thanks,
/fuad

>
> [1]
> https://sashiko.dev/#/patchset/20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp?part=6
>
> Regards,
> Akihiko Odaki
