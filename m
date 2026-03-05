Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258949460
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 00:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772671735; cv=none; b=iEJ4fejBcagGOY+GK71+spKJ0S/cybMLTKE24SDujWcNX24U4M9QRavQvVdvqym/5/nzp+Ia7rI/dPmKIQN4i20l1Vg86DOdqkP0Bv1JWzZkj4I1t6jL7Ch5dDrVf3E3VAez4hcy0jHlPLCTyTZwJouYcyB9NF39ERLUkb0VAmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772671735; c=relaxed/simple;
	bh=DOY1pZDTmetMrLvXu23EYLMAO079YK4loEBBox7TB/4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D5VYd8v8C0CvgDbkcwjaBOcig0QL4oTugdRwhuyJqmpxuYJELnvDMbXUb+c7pZMPg2vDVR09tY9jQ4ZL5GYQNcLh6FkL43aauKyTLgzuFmKrQRZ6HSwxpBmPYb7Xj0ZyWsWxXNEYWkFdxel5fAkAalrLS6r/amJu3EuMB+zYkX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4YgFKjOv; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4YgFKjOv"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-35984b91ffeso3789809a91.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 16:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772671733; x=1773276533; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B7R3O9rZNqF+n/MiqgWOMRtZOJH/frvyIvRcmsDt4vs=;
        b=4YgFKjOvfSOFe17k8Zaml2gptgyq8jnsYcGlEK3f0wSa+n3jWel7XjniHHfoJWYSfw
         wZAmnIKfccBDmv/RrADQSh+bC/euos9VLsR94sUDuTujLehL2Y0nqmEkpWHL18RIRtWc
         NmiDoMIHZJCOHjs2PER85a+n7/AvO85srDHQZz1eDvpeV1QErEU/5+F2fIRf4Cy82FO0
         xjCJY9fq809ASH8MBpGvy7ycm+09kRUEtYgeujqPJnIOG12jHWXk1Mkxe7VNKCCLcS+Z
         pdeHPJVjHoNs2+TL8m8Ca7siJZWkwps5hyJVB3/fWbL3S+sG1MSH+t2ums4W4P1/oHdw
         dz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772671733; x=1773276533;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7R3O9rZNqF+n/MiqgWOMRtZOJH/frvyIvRcmsDt4vs=;
        b=BY5JIQCevrvlKzHaHdkwbHfX33/XdZFIK2JiKdlQQjuiHMCS2O+A2IP95Et5LM4WrF
         EhaNCQtSb/P2yBwBonuoMeOenQ4d+l9hIJGrDHLLtC4Jkx2w2fS1lsjejy9+EWhCv9oj
         nNH7URkg+FckQOC8GrdHHKXtL2cZm0XgGkgzkkLpSvR1UU01NasYuj9hDR320TRRsFjc
         NHhA8NcfGurbk/GIjoW+xBq+9wseSgUC7MTFhTL9AV5l2gt++RQgj8hPdHN8QIOy/kTf
         +pmoLJ+/aneekYVygjAVjexklyx64qddLLI19G47wf+6dU4BiE2lnKZrdv9/JqLwJxZf
         GBcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtvRfZmhsCc2tT2QmA6VJ9oqhyvCxtGu6YJwxYJjQCUoDYwPWyDLYAYS3cdvK2mIg6jH5JGoY+Z+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxAjaPg6tenGSVw3YGmDjfaLRQmVz5qlE0dZ0X4pQqEG9VOVU5
	pd/2S4ysQebLSdroYrduBb4qAYaeU2E9xafDSqGQOE7zPzUVAgglXoTpxi2Oj40UrI8V39SOKoK
	8NeBGCA==
X-Received: from pjbin21.prod.google.com ([2002:a17:90b:4395:b0:359:8a48:8814])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:48d1:b0:34a:be93:72ee
 with SMTP id 98e67ed59e1d1-359b1bd000dmr444707a91.8.1772671733379; Wed, 04
 Mar 2026 16:48:53 -0800 (PST)
Date: Wed, 4 Mar 2026 16:48:52 -0800
In-Reply-To: <aRQf1sQZ9Z3CTB8i@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251026201911.505204-1-xin@zytor.com> <20251026201911.505204-9-xin@zytor.com>
 <aRQf1sQZ9Z3CTB8i@intel.com>
Message-ID: <aajS9HFx5HabmCTq@google.com>
Subject: Re: [PATCH v9 08/22] KVM: VMX: Set FRED MSR intercepts
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, andrew.cooper3@citrix.com, hch@infradead.org, 
	sohil.mehta@intel.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 12, 2025, Chao Gao wrote:
> On Sun, Oct 26, 2025 at 01:18:56PM -0700, Xin Li (Intel) wrote:
> >From: Xin Li <xin3.li@intel.com>
> >
> >On a userspace MSR filter change, set FRED MSR intercepts.
> >
> >The eight FRED MSRs, MSR_IA32_FRED_RSP[123], MSR_IA32_FRED_STKLVLS,
> >MSR_IA32_FRED_SSP[123] and MSR_IA32_FRED_CONFIG, are all safe to
> >passthrough, because each has a corresponding host and guest field
> >in VMCS.
> 
> Sean prefers to pass through MSRs only when there is a reason to do that rather
> than just because it is free. My thinking is that RSPs and SSPs are per-task
> and are context-switched frequently, so we need to pass through them. But I am
> not sure if there is a reason for STKLVLS and CONFIG.

There are VMCS fields, at which point intercepting and emulating is probably
more work than just letting the guest access directly. :-/

Ah, and there needs to be VMCS fields because presumably everything needs to be
switch atomically, e.g. an NMI that arrives shortly after VM-Exit presumbably
consumes STKLVLS and CONFIG.
