Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18B02D063E
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 13:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224570; cv=pass; b=K71eVpR93b4eokf2ks/Wdmqyi0/o/diRykxwI1yEKxqL9co+w8oidDX3uRWtna7eb58VcUaAPEEcBlgtkcui3rgh8WyK2mtJ6ALN9NmaJcxkeppRrwKf0KXILxqrO4/H62ptvur8LbDdD5eYcCf28UCfkAaXmf4EQ9Xci1De8+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224570; c=relaxed/simple;
	bh=nNsvMblRGGki6ohemJFCJRABNbnFZNgKUtyaxPDO2cs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KdxouPsoCy5JFsQoQ3lKlRfYOM5ZB4Yg9wMCNcxl7UmW9zHjKBAzFrmDbkZLCHqduYXduxmHjgdjO8wUoTdaLTy6Rxti7lNKymQ96exRHJtbmIPyGR0Z2SS/tLvYOEa65bjS15uNWVshavSKpwcVeOpMPmD3l7s9OEX3AMWX9hU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XhnzU/Oa; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XhnzU/Oa"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ee147baf7bso825091cf.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 05:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768224568; cv=none;
        d=google.com; s=arc-20240605;
        b=WLTbp4sKK2qFpcrltBujsY2F/44uYLex1irvWPumWlrEGdJVZxX+uRaGc9UhL2Hx2S
         v7/CRI7M8LPAUBUgGGOg1E/iGf7yPFkdcxEVfUGkd1+SyLu6NPDJ/sOnZB/cvD5qa1H4
         voLCDWbdETc9Ixsptj5f6wpwUJ0Bo6I8lbkY+FqAUqyKEJHudqyoP5np9ZYOG0eUJUgq
         J3saMGhbdHd+fEDrc6yyP7z/lWwiEaxkFyspQDZa0k4m51VKuTLp/3vIVned+uR3pMTp
         Jm9yEmsgDXvPhbfrd1BfUdtPshc1T2JnVBWqdf1rqBJ3EsCOX4J1PcSTJjG8RpG6yd25
         P/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jaGuPXqFXeyZwxS5wActQiEFDVDRQPMhfrfAWEZUdIY=;
        fh=LkCwsIkY0A9/W/bJ8XwjBhzTchMhZawVggho0hVqlkc=;
        b=RwGjnMP7DFTWK5+oipTOnl5cxK7tFq+MscaMEjdroNn3mRJ4DeT1fapnCKnBKSwydB
         8BAMhULyG7IWxBacn6Q2N7x6eBrU11VY+wSVfqjQOlaQezvrebx1moPUCmqzXCUwaejS
         XOkLHEmtIx8W3RfHx/l78sk6pzTTPjwHTLuJe2LZ71XRVevP37zzF1L9bHMECzQj8r45
         xpkDrAQsfNO0vDtOQin3FI+Iw2h1egLYtWo4/6M60nFPSKQkI77xE7WAaN06UqtLPPYB
         Wuxb/7kLyXtqi2yu9pZ55fr8UNEaYhUljGUy04ZchnqCIwu7Cn9V0DNIqfO4J/DPEaRg
         1kMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768224568; x=1768829368; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jaGuPXqFXeyZwxS5wActQiEFDVDRQPMhfrfAWEZUdIY=;
        b=XhnzU/OazUV0/DISFr0GHJ+waTpgosZSjtk093b+5BKr+7lBd+gd2X1kwkAI7+2uEK
         4ZOI8KqpXTaomRaQ0nXCk8d1EnNL1rKWEl7n9jC733FniDOhDprgoxq7AFs+08/x96Tl
         WlfFcRGgnrZN6z2Q1t5hyYHbMT40TuYrK8i2M0CSSHcWyVrjPUa6adfG19fPvesxNojy
         y9MiuOMv4mIqdmgn1cUgn2eiOhRZTDyNXXU2Ao/qwOSVh2suz3vCb22qoiIEaGfVMtp6
         61CQ2PfyQNXvFtXjsSDzWVQNPLnn1TiQDzzm4CdYPZL1pk2S+UtxjxRWZa/MwcGc6E3D
         QyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768224568; x=1768829368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaGuPXqFXeyZwxS5wActQiEFDVDRQPMhfrfAWEZUdIY=;
        b=JQh6/QiAW32+gkChhVXWZksamCUlfg1Q+NLRDtCKFAuhRGs8GrSxKxmADXJHMOQ5Sh
         Sx7/fCT4BVxVC2w3SDOrntOACbjvFwkuQS7n5gAZKTS2IfHJXlpYxV2mdDqerMmAa6Cm
         53FSuxdhcbQplf1N2/BptK0zGoWJxP11lqNmAVudpafLx+Tzd3tHH6OpQwqRytKC1xjX
         I+GWaX0HOvX65dp0JAHEIrxhmBjfyfm6oETkblQl1Ommqz6vaVwB65b3oTrHX3IvBATf
         txNmclpaMXw7O5eOu3aXVXnfEWJmVFNX+c/qp4O4h0kmtC9mzKq19gaGOHCosyguNq/w
         tzfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbS+6zqP3b6/qYGCIOh/e5rLy+D1/8Ftd1aV0aPmBGA0aYyHOIYbdeTYw+PWjrYM5Ia5SeMqgqdYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRXrPrhiyyVRYswQI40Xxp+0i5/Tye3u2DqXnqaXTfxN0bsJwU
	X81H5t2KqYs8BmA6smzu4ST98g2ifUmll3we1E8PwYZMpEFdWTGsgznyyD/6YA1i+D5iueYbMoC
	w0RAZeHNjEYcbQZbJbTFEc16EGxHv12v4IdQpoe+9
X-Gm-Gg: AY/fxX6+41sIWVTA2mbAwpdCjVRpBwjhMDygAOqdQ/Hn4OfA9VTv0zkVA6mj4AFTgyh
	boJ8KWS0rJnDcLdz973AHL6JoP8fyFGmGHvYQ96zi41g8SxIwWg4P+W/k0beppjbxfB9bRZPGbN
	LKLCQ1u7YDtTw3A7EVaZW3G5OZGvxCCtUIp3DIFOJzPuDZPHiHfeqNl/4ttl2GmZt0Qe5Zi2OU5
	9NT3seFPVbqNz6NuOxlMl73HUzDRRxrCNhIzx64kMxsULZk31ksEWfgJT0JRN+Vua7ls7EO
X-Received: by 2002:ac8:5891:0:b0:4ff:bfdd:3f46 with SMTP id
 d75a77b69052e-5011979b086mr18062621cf.15.1768224567393; Mon, 12 Jan 2026
 05:29:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-14-8be3867cb883@kernel.org> <CA+EHjTw-6-BFcr60+tgDzOE-OfcetD7yQtbNMkqr7BgiMXfeJA@mail.gmail.com>
 <96efc90e-bf1f-4b87-ab7b-0e24970eb967@sirena.org.uk>
In-Reply-To: <96efc90e-bf1f-4b87-ab7b-0e24970eb967@sirena.org.uk>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 12 Jan 2026 13:28:51 +0000
X-Gm-Features: AZwV_Qhr0cnxEyY0NvApe2jyI_fTASUjPe1TmX1ATOL61XV_IRaHe4gUVPwKxys
Message-ID: <CA+EHjTxQUADWmCbSgUiFcXz_BxDPLE+THHnF6Mwx73hnhc7OJw@mail.gmail.com>
Subject: Re: [PATCH v9 14/30] KVM: arm64: Implement SME vector length configuration
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Jan 2026 at 13:27, Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Jan 09, 2026 at 03:59:00PM +0000, Fuad Tabba wrote:
> > On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> > > +
> > > +#define vcpu_cur_sve_vl(vcpu) (vcpu_in_streaming_mode(vcpu) ? \
> > > +                              vcpu_sme_max_vl(vcpu) : vcpu_sve_max_vl(vcpu))
>
> > nit: This isn't really the current VL, but the current max VL. That
> > said, I don't think 'cur_max` is a better name. Maybe a comment or
> > something?
>
> It is the current VL for the hypervisor and what we present to
> userspace, EL1 can reduce the VL that it sees to something lower if the
> hardware supports that but as far as the hypervisor is concerned the VL
> is always whatever is configured at EL2.  We can obviously infer what
> the guest is doing internally but we never really interact with it.  The
> existing code doesn't really have a concept of current VL since with SVE
> only the hypervisor set VL is always the SVE VL, it often refers to the
> maximum VL when it means the VL the hypervisor works with.
>
> > > +       if (WARN_ON(vcpu->arch.sve_state || vcpu->arch.sme_state))
> > > +               return -EINVAL;
> > > +
>
> > Can this ever happen? kvm_arm_vcpu_vec_finalized() is checked above,
> > and vcpu->arch.{sve,sme}_state are only assigned in
> > kvm_vcpu_finalize_vec() immediately before setting the finalized flag.
>
> I don't expect it to, hence why it's a WARN_ON.

I understand. My point is, by code inspection we can demonstrate that
this isn't needed.

Cheers,
/fuad
