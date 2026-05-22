Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3316F36309B
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 17:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470507; cv=none; b=SGMdPCjgY7p1tglhkxAYNK+GPOfdnAGpcVwcU5SVE2N4heSAnm2Ms0nAMTNS1uWHlxsSKidPu6Fy4+ms0mhsDJuaYpcxTrFi3rrVX+q4Lbl7zjlVnh/YQ7/SRve299RJ3/aX7gJdlPJu0yGSg8GIWvQ+veKWQAeG4n4uYBCoQHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470507; c=relaxed/simple;
	bh=j7PDgeJ1DRC6yA0ExvIeovoOboeWG72MkykGKDF6slU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QZx20ZTcklOhDRjajHJDcBh1zmWnDakh7VRk4Oww2uqImEFzz5AjLeyByBqJd3XcFDHgKmBzy2eRMidui1FfR1GqjECGFK0mhyYfBhtft3IYdUNnYwanNYFuksEpGfcMJ1LlwsTc0QUR5mDvn7q8elpcXZnl5bq/GsIysWOY/Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=igQXJCZ3; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="igQXJCZ3"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso11630958b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 10:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779470505; x=1780075305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7PDgeJ1DRC6yA0ExvIeovoOboeWG72MkykGKDF6slU=;
        b=igQXJCZ3YJUI4iSSIhRCJM0sMY+cWU5UYkF4BNgxvodbRKLaFA6OwxplN7tgB4tc74
         +i94hsgy1QlCivZkQyO4YxEHadn9NE3swyDdw/LzbnyoT+FVZvnc4HgvOiK3gRLRKHXj
         Ff2Q72l2s59FkT10tOVpkSarlebHS1iJC8z+i1BjeGVgjex/SPuJENzvRZhH6d/zu6oN
         YrpZsoTAjOE2sW2w92gjJaiWDHy9hBNmnH6KOWs7h+stASJqaFxbBbhN9Q13W4lMF5L6
         PKGsBIlpZCfYjDcPaGj0gN0E3AB8nGnQP7fGng2Td48Sv5gwDurWECiGAD5+ZAVo/d1n
         dt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470505; x=1780075305;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j7PDgeJ1DRC6yA0ExvIeovoOboeWG72MkykGKDF6slU=;
        b=qYoGBAjcgdaAh9zoQ7vPD8wrYeHoAK2g3g67hH914O3DQ+19j0VQP2e/GegXRYiuA1
         A1xKekRm4fCsc/UHze5HW1nDwBumxRcl3LJ3xNIGlEHo8we+RX8iFrfPJsLyarsA0D7Z
         Pi5+PMdpf3zxprqJEi5DlbzlN29yn9f3I+wrVRulZljY5uyZTnY9WO1FEm7SE0r+jAfw
         RmmIEQ1e22RUzlkUSdAWm/xqegN+gDtITSro5QPmxVNno9pU8yW8vP8HXGpMpP/dBCWH
         L8YTccBxkwO9++r6awvWJAgKQUmbFEaQvP2deZHPO21aTCWmj/xELpH+efumtToVNL/7
         K3Qg==
X-Forwarded-Encrypted: i=1; AFNElJ/F8czycTv81BJvhy0qX1hyfGL0c/8BkkbVvo+4Hhv0C6ZMgfD/yPTnpSCgsyj+kgywU/R8+Td4ub8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWvGZ3Liwje4JXQY7UB0hE8vr0i4miizf9IF/lJ/lsrsgLac0t
	v1xHokyumf4qpIsLjDj+cZ/H8ycZoGvBbOnE0LiaGIniC/NI+MguWbHyZJIeWv7kUAz2u3fp8n0
	ck3/s1g==
X-Received: from pfbgv6.prod.google.com ([2002:a05:6a00:4e86:b0:82f:86c3:55ba])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3004:b0:82f:721f:10ea
 with SMTP id d2e1a72fcca58-8415f17de74mr4765703b3a.18.1779470505093; Fri, 22
 May 2026 10:21:45 -0700 (PDT)
Date: Fri, 22 May 2026 10:21:26 -0700
In-Reply-To: <c4b498c401287477402ddd60a0120b0c5a9bf8d3.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260509224824.3264567-1-dwmw2@infradead.org> <20260509224824.3264567-28-dwmw2@infradead.org>
 <3ad6cd109480772ade3c11f23b9c1d7a9855d67e.camel@infradead.org>
 <ag-Hf2liLSX9q0rS@google.com> <ab84153e33fbe7c25667f595c56b310d4d5a93ef.camel@infradead.org>
 <ahBQ7mXNaTtouT3C@google.com> <c4b498c401287477402ddd60a0120b0c5a9bf8d3.camel@infradead.org>
Message-ID: <ahCQluJj59uWlDAF@google.com>
Subject: Re: [PATCH v4 27/30] KVM: x86: Add KVM_VCPU_TSC_EFFECTIVE_FREQ attribute
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

On Fri, May 22, 2026, David Woodhouse wrote:
> On Fri, 2026-05-22 at 05:49 -0700, Sean Christopherson wrote:
> >=20
> > Oh, that's just an oversight, definitely not intentional.=C2=A0 Easy en=
ough to fix:
>=20
> Want me to roll that into the series? As you eloquently put it the
> other day, what's one more patch...?

I'll send a standalone patch, along with a selftest tweak to verify the fix=
.
It's technically a fix and won't generate any conflicts, no reason to delay=
 it.
