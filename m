Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849548;
	b=G48uGi6E8jdbkJg4JItZPTWgpJI2T/G9pJMxRh1PbZcLWPZZCEH3UVOUwHJw6NfhP6z5
	 nvzNztgpQYm1kVzB3Lf6bCdLIT7g4jFnaklTV9l6NXNQamYUbI/96eVdody8fo65HFf29
	 fT2WNObjTbohLX8BIhP8621LuGL4iNqeu0MfVuspTOoDMgSJFxDj204lz76Yo9fQkfeCo
	 bjyq3EkeWJX7Oe0zpreuYhmZ9DNgC5L2RDlNGm0mL84H+YRUOLREx9aqdWlzFqcon+41K
	 XaKORULAKmsYB5ElaQuYjVXxwMMH0ahOZVTbvnbPW/VFx9+ChuDBBdnpfwDCvBYR94g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849548;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=OzaqIXPqhSSG4ejd/hB4U1AFDk/wquty1pyzaNNEA1Y=;
	b=Almkvptybs2Kn0lSrjqzR/rS/+5fMY3P0Bez03oYRpKvQW3YaVtMW+kbdqY96hKyOEMH
	 meQk276EzWl4UUW2vocHRUmVQE2UxQ4kj1kjYJeKihsMIQzcDuF6RgCRPBjWVs8b4ftzp
	 Kxbj+1m70Plrn4T+sKSligD9Jdt9fpXGEwNsP6C05hVAAnK9V2SAIXWvpB4YffALFRzYu
	 HQ8SaLPhHptWSbp+PP5aO0XXrknN6nv39BHZph8HG5avJdJAeXppL2znh2JAGfNJpRzJu
	 AbPtz5ZEqGe+a/GNg84ScdO0p3Q3KjZm7Ia8I5OEqOrvwmYg/zj53NjqvmnwfA5ZAgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="QK/AhKM9";
	arc=none smtp.remote-ip=95.215.58.50
Received: from mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFF9606A322
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 17:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CFF9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QK/AhKM9
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PAxYfgYQrRbaE3T1nWWUCpJHJViNiRZaZVomuIz4tHw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794849545; v=1; x=1795454345;
 b=QK/AhKM91ws5Gsj4hKY6JqxLZlKxWxl7OmSHBbkQSyG+grHCaBn8pDBTJn1F5szbi6xiatuQ
 LCB4NOHp67xDJag6dJqMnmZCGb93F+a3FqbfFJ7a6GkyDSAu6dQXcS8FN+XHiseZRZwyt6U3IN8
 GTyGWM7p7lQrxWYWj23bRVfU=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b968dff2e02c7f7d;
	Mon, 16 Nov 2026 17:19:05 +0000
X-Mizu-Trace-ID: b968dff2e02c7f7d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so13571e87.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 09:19:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEx0uhSVh3Hn1L6zHw/eNRCTdR+v9jci2duu8Y+0zao5qUVG4/cvWE5F2OBXvZSMPCaY6hbUyuZpiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+j5rWlsZgHne4TcbuiiHxGzsEolJ99DDlEqCuGgz485aVmcP3t
	4fAjbBVJNmbVx7n+xfbWGbcDObjy3wORb1Tn3tEQI1bGI9wJusP8go/00cUd19B/XcFba/HCE3p
	2B8oDM2wEtimOWhf+wT7W9m8vxHqtYuVVVfO6Q+S6
X-Received: by 2002:a05:6512:110b:b0:5bf:f84f:1d74 with SMTP id
 2adb3069b0e04-5c17e52e81emr262285e87.13.1794849533007; Mon, 16 Nov 2026
 09:18:53 -0800 (PST)
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
 <CA+EHjTyqJfGS+5UajX=RYTAG-qfhZ-vmGi=1SixXydWhwGHLUA@mail.gmail.com> <avs5UD79FB_DG1Vs@seanjc-mac.roam.internal>
In-Reply-To: <avs5UD79FB_DG1Vs@seanjc-mac.roam.internal>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 17:18:16 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwXO_Ym1+ErHT9Si6FwHtDaPDmMRwY+RS8LDNK421rchA@mail.gmail.com>
X-Gm-Features: AclHuK9xW32VPDT60mgyMDdb5wXbr3ChwJoDPUUlo1Wmi2N2JEJM_TMFlrp_0kc
Message-ID: <CA+EHjTwXO_Ym1+ErHT9Si6FwHtDaPDmMRwY+RS8LDNK421rchA@mail.gmail.com>
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

On Mon, 16 Nov 2026 at 17:11, Sean Christopherson <seanjc@google.com> wrote:
>
> On Mon, Nov 16, 2026, Fuad Tabba wrote:
> > Hi Sean,
> >
> > On Tue, 10 Nov 2026 17:18:22 +0000, Fuad Tabba <fuad.tabba@linux.dev> wrote:
> > [...]
> > > > Eh, I vote to just use kvm_dirty_ring_check_request(), I don't see any harm in
> > > > clobbering vcpu->run->exit_reason.
> > >
> > > Will do.
> >
> > After taking a closer look, the clobber is problematic on arm64, where
> > KVM_RUN completes a pending MMIO exit only if run->exit_reason is
> > still KVM_EXIT_MMIO. If a pre-fault stops on a full ring after an MMIO
> > exit, the helper overwrites exit_reason, so the next KVM_RUN doesn't
> > complete the exit and the guest repeats the MMIO access. The ring can
> > be full at that point if the pre-fault dirties pages, or with NV, if
> > the stage-2 walk for the MMIO access does.
>
> Wouldn't that require userspace to do KVM_PRE_FAULT_MEMORY after KVM_RUN with a
> KVM_EXIT_MMIO return?  If so, userspace gets to deal with the fallout of being
> stupid.

Ack, so v2 will be as you suggested.

/fuad
