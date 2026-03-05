Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93A7225791
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 00:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772672297; cv=none; b=sIHawsK6Etc1sH6LbZ42a46dN5jd+kfH9+P8FGF/jKeWOHfIH5yaZdjZwFFih5lyn1PWXCNiANPJrjz2Ia2XJOPezf3Ey6xxaqYri8XqYYdRFcC+RHbk05vvScvAdlFedjs4cEJnr2uTAOafmynT1LJ5/sgNy4NrH6UpyCY9BZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772672297; c=relaxed/simple;
	bh=WSamV3bJGwVCKYfsWBc2fcUJ8VRYquFsGqzA2SVkL6c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kQcujKDv1VVk+Jd0JVF56oYjOzMaqwaX/BiPN0IPN6wcls+80h2iVoRDf/Hs3NioRtn2l1nKWCTrzB81CPFJ03C+izKuBa9YoS5jNSKIuzHIrnxuzT/OkpXev0j5/p42Oe+wXABnSyumPctfnXk1HeTQal5yXATF1bK8rSajOLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=trzRVrao; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="trzRVrao"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ae415b68b1so46506985ad.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 16:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772672296; x=1773277096; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KSIZnrQN4PY6Sd3rSuJIjuMIxqVFieEA+dujL5XM0o8=;
        b=trzRVraoBaAt/POa/JCb+sRz6mY0MNWsPRpE3Vkoq6+hNPyYdTbmxDbiykx2K9EP/m
         NpLknlyQbFaqq05Wyn8HL0C+Ajcld9194QUmXJ2JSY3hyuA9iZmx+k7pEH16pK7Zx7Wo
         4wp3y/JWzGbqD3Pl6bGn2b2w6H1p09//gsiS22y8RRxhKWExlfRsqPaQs7O32Fn3cU2q
         xZ7FJMebg9X8nOJz6pkxcWAc/cFlnDMacPxwjW+oKx4xiPwA8ziVloW1LQ2D89MNJjJo
         8XbWyfw3XuP4OsNmwx2a+D9sHocITjQ+IVe0BGV7AtzU+yHbybcdrSUxfH0U87WNVkE+
         O4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772672296; x=1773277096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSIZnrQN4PY6Sd3rSuJIjuMIxqVFieEA+dujL5XM0o8=;
        b=Ckhkh0i6ExspBSQIDkoWXX4+hhIyyAWcbReqXmLI/UMW9832+1qf2rlWDOIWI1J6DD
         Qz4ayGLqRpErz7CiPU9Kszcl5PUMf5ZN1JyQmRbM4vA6P1gORIsY4T51Qv7g34OtwQep
         7VEdW9lJnBcKgM59ecfymoC9ODBrPhY6wqUx8vYQviRJN2UN+W6QdseysKO8rGwcGuHb
         yt920nFwUpaxWFoXnWk/uCkx98nMD/zi+cMT2LIXa7wsJyOmXGEKLwvXy6zmxrrzd1Mf
         md2zpDsPHNmNxKZfrpZmYFLLqdtqr3wo6XPtAtSDt/uYnnb62/Vzmync2jlA36Iw4Yg5
         KEBA==
X-Forwarded-Encrypted: i=1; AJvYcCVYiLPuPhKAqjNEGFdDgy/tIlzHb1N08LuKn8lAl8EFMz60B7zOgqsLu1yWIQBGuKosK/1E8Tm+KDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxwpPOfb3bQn+DbLaMxapRbYBk2YCxc1QnEHhlyqGc3H2A8B0K
	+eFjsQNmfTZ77Eh3hbKlBI41siiWTNGq0DLYTxAZ3P0tYshUEW4kjX/AOT9UhZ9Sd/jvhf3QdcC
	gu3VjXQ==
X-Received: from pgcv18.prod.google.com ([2002:a05:6a02:5312:b0:c63:4cb4:6aa1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:ae2f:b0:394:f73b:734e
 with SMTP id adf61e73a8af0-3982df0703fmr3642488637.26.1772672295877; Wed, 04
 Mar 2026 16:58:15 -0800 (PST)
Date: Wed, 4 Mar 2026 16:58:14 -0800
In-Reply-To: <aR1xNLrhqEWu+rmE@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251026201911.505204-1-xin@zytor.com> <20251026201911.505204-16-xin@zytor.com>
 <aR1xNLrhqEWu+rmE@intel.com>
Message-ID: <aajVJlU2Zg4Djqqz@google.com>
Subject: Re: [PATCH v9 15/22] KVM: x86: Mark CR4.FRED as not reserved
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, andrew.cooper3@citrix.com, hch@infradead.org, 
	sohil.mehta@intel.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 19, 2025, Chao Gao wrote:
> On Sun, Oct 26, 2025 at 01:19:03PM -0700, Xin Li (Intel) wrote:
> >From: Xin Li <xin3.li@intel.com>
> >
> >The CR4.FRED bit, i.e., CR4[32], is no longer a reserved bit when
> >guest cpu cap has FRED, i.e.,
> >  1) All of FRED KVM support is in place.
> >  2) Guest enumerates FRED.
> >
> >Otherwise it is still a reserved bit.
> >
> >Signed-off-by: Xin Li <xin3.li@intel.com>
> >Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> >Tested-by: Shan Kang <shan.kang@intel.com>
> >Tested-by: Xuelian Guo <xuelian.guo@intel.com>
> 
> I am not sure about two things regarding CR4.FRED and emulator code:
> 
> 1. Should kvm_set_cr4() reject setting CR4.FRED when the vCPU isn't in long
>    mode? The concern is that emulator code may call kvm_set_cr4(). This could
>    cause VM-entry failure if CR4.FRED is set in other modes.

This has nothing to do with the emulator, KVM will intercept and emulate all
CR4 writes that toggle CR4.FRED.  KVM also needs to enforce leaving 64-bit mode
with CR4.FRED=1.

> 2. mk_cr_64() drops the high 32 bits of the new CR4 value. So, CR4.FRED is always
>    dropped. This may need an update.

Ugh, I didn't realize FRED broke into bits 63:32.  Yeah, that needs to be updated,
and _that_ one is unique to the emulator.

Unless Chao and I can't read code and are missing magic, KVM's virtualization of
FRED is quite lacking.

More importantly, I don't see *any* tests.  At a bare minimum, KVM's msrs_test
needs to be updated too get coverage for userspace vs. guest accesses, save/restore
needs to be covered (maybe nothing additional required?), and there need to be
negative tests for things like leaving 64-bit mode with FRED=1.  We can probably
get enough confidence in the "happy" paths just by running VMs, but even then I
would ideally like to see tests for edge cases that are relatively rare when just
running a VM.

I'm straight up not going to look at new versions if there aren't tests.  Like
CET before it, both Intel and AMD are pushing FRED and want to get it merged,
yet no one is providing tests.  That's not going to fly this time, as I don't
have the bandwidth to help write the number of testcases FRED warrants.
