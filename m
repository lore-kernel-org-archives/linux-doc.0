Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64D718B463
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 17:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736269812; cv=none; b=SD5tMpl7MZqIiWD3cOuOjvurEKB3lPiSIWOJQMk8swRpSgMby2hmrml90ciOVmF0cd8sv1WeW5XiL/V3FJHsmbLhWc5x+fUalbgrjph8+NoWHQiVMA8AxBmV5GkhKW99MICm7dzEsvvKpb17rqsC3OTVMlYYsllvtFcaSt221vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736269812; c=relaxed/simple;
	bh=k6MVnlt34ZD0SBO9MSU8T78C7vNtxZTkYcttZnmsriY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dp0LAZcp8NcFEWJjejoymEAMyk9KJcK0dtcufF6x9gSk7TRd3FRYI7qFG6VP+QmqR9fU3gRHcP7WA/6G30tQMwbYYmp1yviWgd9oNm5FxIeJe1uwMkg924QIcUwqU3Nzxiwe4FVECeDBB2+g/fXVkJXC1mpPHOtVaT3pv0pnmgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bPzaJbXT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bPzaJbXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736269809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gwQkyTcOMsZ2EjZrTGgt+ipO0/RY4nS6QVm5/aGbi9U=;
	b=bPzaJbXTMKIgBehAZAuY3DUQ1y7QjzjeNZkLOr18UulevSdGk9bA0kB56hOmYQrWFKRJtc
	oWA5fxFMypngeZEW0/OUYJkPTDu3dk3VpTM5FoDZklWQAqF8Z7v5FfM3FN2FP1/sPklOIP
	4XsznVAH0GRoMKqITN9EA5FoBgp9WLY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-agcZ5HKRN16L2Wqw1at0ww-1; Tue, 07 Jan 2025 12:10:08 -0500
X-MC-Unique: agcZ5HKRN16L2Wqw1at0ww-1
X-Mimecast-MFC-AGG-ID: agcZ5HKRN16L2Wqw1at0ww
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-436248d1240so76772415e9.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 09:10:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736269807; x=1736874607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwQkyTcOMsZ2EjZrTGgt+ipO0/RY4nS6QVm5/aGbi9U=;
        b=YqhivnHRsQBEdvvBKYRFHfqnIW/NzSYuqaNE3lEW2/L2LGh9D0DcR42onWDjJUj4CK
         UQ/e9ULNjilN+5/e3tMD0xzXB2FuoKx0EGtMszDi+tKFzEgW0QiM1bBX8wR0vkQNMsEy
         khp6PwIf6B5OuO/7TcYMoC+vz2GlXtmSSWNVrUbLI/m95tfFdrQmpakQuWw6j7fZXZ1o
         1ZMLjUWrbcRC4pPIxVNI00pHKD2uwnAqoRClvVkVOnkiUxQD5o1gt0UrfP+5tOReZUqG
         Ge263bAKTS+5pfh4Dovo66d4qCObYio++8O/Ak8uuk4JBAisx//tGMYYciQT/H9BMo4S
         KKAg==
X-Forwarded-Encrypted: i=1; AJvYcCUwD0iieDobEW9RW4b0O38n+CBgbIkQhh210qy878lQgzZAx7FvzEYvsnrjidnJUjUs0j0IqvWfGhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVBG+yaPVvA/108CQSGJPbwsknwYZPSzT4FLjA34VQEK9EnURP
	N5ikgnke7jYBYPmaD7kcv0g7ORbxpqGTfEV/7BxbF5dd8hTpJ5SFv+XO9v88d8RydOquEWQchTs
	hEMsr8bMl/vvgiu2hKsFbG0L1FbcoZG+h87IY/cnqcvVwt9p8qKLOHOTgxgc90KGoY/ZwHO8pUv
	L04FLeCcGTORQSnVLs5dABhGfilTI2ccYu
X-Gm-Gg: ASbGncujoKf4SkhYxHeTqoCpFxhILYlC0aX/Gp8cKfIN2FxYxdad3tfAgwdEB8Ot43/
	ZkaqySs2q3rtKYRx1uwdHopVoD09qWOtmvpYAxw==
X-Received: by 2002:a05:600c:1d21:b0:434:a4a6:51f8 with SMTP id 5b1f17b1804b1-4366790e3fdmr593069285e9.0.1736269806970;
        Tue, 07 Jan 2025 09:10:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSvogatKxKxqA2wBw/+7sDsL67SJLzCtKQockD6aGfvTv8LM12x53+vGigfD/GcR6BSKn5UMxxRiIg0aVgOFw=
X-Received: by 2002:a05:600c:1d21:b0:434:a4a6:51f8 with SMTP id
 5b1f17b1804b1-4366790e3fdmr593068955e9.0.1736269806643; Tue, 07 Jan 2025
 09:10:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADH9ctD1uf_yBA3NXNQu7TJa_TPhLRN=0YZ3j2gGhgmaFRdCFg@mail.gmail.com>
 <c3026876-8061-4ab2-9321-97cc05bad510@redhat.com> <CADH9ctBivnvP1tNcatLKzd8EDz8Oo6X65660j8ccxYzk3aFzCA@mail.gmail.com>
 <CABgObfZEyCQMiq6CKBOE7pAVzUDkWjqT2cgfbwjW-RseH8VkLw@mail.gmail.com>
 <CADH9ctA_C1dAOus1K+wOH_SOKTb=-X1sVawt5R=dkH1iGt8QUg@mail.gmail.com>
 <CABgObfZrTyft-3vqMz5w0ZiAhp-v6c32brgftynZGJO8OafrdA@mail.gmail.com>
 <CADH9ctBYp-LMbW4hm3+QwNoXvAc5ryVeB0L1jLY0uDWSe3vbag@mail.gmail.com>
 <b1ddb439-9e28-4a58-ba86-0395bfc081e0@redhat.com> <CADH9ctCFYtNfhn3SSp2jp0fzxu6s_X1A+wBNnzvHZVb8qXPk=g@mail.gmail.com>
 <CADH9ctB0YSYqC_Vj2nP20vMO_gN--KsqOBOu8sfHDrkZJV6pmw@mail.gmail.com> <Z2IXvsM0olS5GvbR@google.com>
In-Reply-To: <Z2IXvsM0olS5GvbR@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 7 Jan 2025 18:09:54 +0100
X-Gm-Features: AbW1kvYbICc679MeQNzE1ow2NFvGxOmTuZ13zzWBDAwtldHBRVtXoFV8OfA0EJs
Message-ID: <CABgObfadZZ5sXYB0xR5OcLDw_eVUmXTOTFSWkVpkgiCJmNnFRQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: x86: Add support for VMware guest specific hypercalls
To: Sean Christopherson <seanjc@google.com>
Cc: Doug Covelli <doug.covelli@broadcom.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	kvm <kvm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Joel Stanley <joel@jms.id.au>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 4:44=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
> > Changing our legacy BIOS is not an option so in order to support Window=
s VMs
> > with the legacy BIOS with decent performance we would either need to ad=
d support
> > for remote reads of the APIC ID register to KVM or support CR8 accesses=
 w/o
> > exiting w/o the in-kernel APIC in order.  Do you have a preference?
>
> I didn't quite follow the CR8 access thing.  If the choice is between emu=
lating
> Remote Read IPIs and using a userspace local APIC, then I vote with both =
hands
> for emulating Remote Reads, especially if we can do a half-assed version =
that
> provides only what your crazy BIOS needs :-)

Absolutely.  Not quite userspace local APIC - VMware only needs
userspace traps on CR8 access but yeah, it would not be great to have
that. Remote read support is totally acceptable and hopefully win-win
for VMware too.

> The biggest wrinkle I can think of is that KVM uses the Remote Read IPI e=
ncoding
> for a paravirt vCPU kick feature, but I doubt that's used by Windows gues=
ts and
> so can be sacrificed on the Altar of Ancient BIOS.

That's easy, the existing code can be wrapped with

                if (guest_pv_has(vcpu, KVM_FEATURE_PV_UNHALT))

The remote-read hack is not even supposed to be used by the guest
(it's used internally by kvm_pv_kick_cpu_op).

Paolo

