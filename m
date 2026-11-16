Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845367;
	b=cyeAdeKdyCIypC+U9+g2qnhrEscullqs3VIiQw5dwbLqn9nw8gzjiYMT/lKOnR6SmFTn
	 PJSgZ08r1sMTaJCeZSKrUh+SfFmrZbhHYcJ5URT3pDNJLqZgMDJgDVkQQd3E5vsMsAUvi
	 bF4EEP7RMTm67FnLIqWemzXf4hqvCuvRz1sqNvbew5QaEbr7casz2XMsoEmI9bT/WZMj6
	 +CNM3vT5ugj38svxmoSXENhISIqizjK3PMJrQI2jF6mPBJb41Mvb22KaH/Vyw1/hrm8Wk
	 D1XrXMJ2nB26e1RcNuwcieUhpZxo9XS689uPSTfnscLpAa9mdVyiyW1Ru9WXOx/2U3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845367;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=xuWJrrizIQaSrZTQFgUO3V0HL4ic1BmuoACdN3FzMhU=;
	b=AebG2IUJJSgq7I2GGuGY5Hz8TYG7/yjdnHJobFIvr+SlKUCuyMN9eTtNqaWLvPYmwxX1
	 nzePLsKFJ6pw/fpUySvWOZYVoyFOjXjuSWmQRH0zB8DN1//S+DjJKohWqcTfKVjchqECT
	 aT3ZIE+qZppZr+tUPIXXw3/x64DBn+qJq3qC62kJ2C2nBBdB+FD1WhM/dw64td/JuDr7L
	 vZVTmi3oHw7TONBghJL9JOF/hGzqr+th5UM3YHhqleNEoO2Kp8aTKGiTXM4d6BjvTg3N6
	 O4uukheCQhyExu7aDU4o2xux/l3zXTpxXQ+Oh1S4C3p2Mqd9eYUi4VrBh+ZeYKTTu5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MWgeacYg;
	arc=none smtp.remote-ip=91.218.175.122
Received: from mta0.migadu.com (out-122.mta0.migadu.com [91.218.175.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0EA606A31C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 16:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C0EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MWgeacYg
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xuWJrrizIQaSrZTQFgUO3V0HL4ic1BmuoACdN3FzMhU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794845364; v=1; x=1795450164;
 b=MWgeacYgaru9efJolT6kBToK2hT0DibHV0eF6vuzRodm9xIlji4/ycamOihaLx5Od3ltDDqO
 qAf8pB2Ig0FhTy3sp2sa1NyGXzCVhdBj7/cDdj+NM0s3RQHyR/qBGlmPVfpWudk1vtFC79SDX70
 ZxRiC35IVo0jkYtEHQedtfUo=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4271a455ba8f50c2;
	Mon, 16 Nov 2026 16:09:24 +0000
X-Mizu-Trace-ID: 4271a455ba8f50c2
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so12524e87.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 08:09:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEovbWllJ088nhheR2fuLTXjrMJY0cSMDES2Vp4r3RJGpw/FzUjeuKLl2IwR1/zu7HpcRX1PoArDcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lSWtG/uiR6vb6YGUFPS79pQyTd9VoniJ6y7BB/Qm29WzyKeUb
	QHLgrLJLr0M16+pFZ+cpsJ0KG0TleIN6vSRMMA1181pt8+7sP7q8qUvJONWryLKLsHf/Re4hHA2
	qPXR19m0VR/9dBSuvQxeAIogKqD7FLG4wVGh3gm5Q
X-Received: by 2002:a05:6512:1304:b0:5c1:4cc8:2f22 with SMTP id
 2adb3069b0e04-5c17e4b9f86mr221482e87.8.1794845363481; Mon, 16 Nov 2026
 08:09:23 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110110724.3614412-1-fuad.tabba@linux.dev>
 <20261110110724.3614412-2-fuad.tabba@linux.dev> <avM81YcTBTJ8zCMX@seanjc-mac.roam.internal>
 <CA+EHjTz-Nb-g9YQKX2fKk61hC2BfzXfmUHv=2j+eZ18YuTv2Eg@mail.gmail.com>
In-Reply-To: <CA+EHjTz-Nb-g9YQKX2fKk61hC2BfzXfmUHv=2j+eZ18YuTv2Eg@mail.gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 16:08:47 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyqJfGS+5UajX=RYTAG-qfhZ-vmGi=1SixXydWhwGHLUA@mail.gmail.com>
X-Gm-Features: Aa3M54pa7DZ_uBY7ynCUhZPG35ZaG2vJ1bC6E24f7r2YagR26_2vzli-PPKoWqQ
Message-ID: <CA+EHjTyqJfGS+5UajX=RYTAG-qfhZ-vmGi=1SixXydWhwGHLUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's dirty
 ring is full
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sean,

On Tue, 10 Nov 2026 17:18:22 +0000, Fuad Tabba <fuad.tabba@linux.dev> wrote:
[...]
> > Eh, I vote to just use kvm_dirty_ring_check_request(), I don't see any harm in
> > clobbering vcpu->run->exit_reason.
>
> Will do.

After taking a closer look, the clobber is problematic on arm64, where
KVM_RUN completes a pending MMIO exit only if run->exit_reason is
still KVM_EXIT_MMIO. If a pre-fault stops on a full ring after an MMIO
exit, the helper overwrites exit_reason, so the next KVM_RUN doesn't
complete the exit and the guest repeats the MMIO access. The ring can
be full at that point if the pre-fault dirties pages, or with NV, if
the stage-2 walk for the MMIO access does.

I don't think changing how arm64 completes an MMIO exit should be in a
fix for stable, so should I keep testing kvm_dirty_ring_soft_full()
directly in v2, or do you have another suggestion?

Cheers,
/fuad
