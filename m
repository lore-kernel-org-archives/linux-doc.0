Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D4B37F73A
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782223419; cv=none; b=q1Fug+QOGi6XGxXlqzGkxSAtC+0XH0wMH5bMiAsi+cQQvXOsYvjQuf6QDhVwubEaIrH+UcS3MwfVnyWOe9XSvH1nOsWbFDTSCRWwQfBiO53E0QrEBI09oDH4GHiBpZ8kkmPoQC0UKkFlkRP7IcmpCA57SdumsGptJQyKjDKoffc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782223419; c=relaxed/simple;
	bh=Hn8y55bhgcCgZF0i9rw2W2DfMko1tyW8cgX8/rRvBP8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QMFBkRzN0b3NlifkmRJFmS07gDSycHbXW98fC+ukyuP702ldrzVRe7inpNV0e5bOxULPKEB8HSzi9lFEeGCPPideuk5KnRU49ur0txLRvDvNrqoBTUbdFeQuRE/wlEfsO4rime7W6ZHz0bSqql0GQzz0rzmGh8EnOWF+htc5erg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=khAeAjMC; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="khAeAjMC"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-49221de4ed4so37960465e9.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 07:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782223416; x=1782828216; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pndzfg2mCWavHm/LZE4HxmOjSPKqkdyz2Mxcm9023NE=;
        b=khAeAjMCX7kDLlXd7jnEOh2TB3kS1E+KsM2jtelv6ms8Y/gsEPGuvIeIG/gkrqHhWj
         T671/NDTZMCMbLsC+/FdhFMXZgDdqwIASbPBAEMGb+46hKAaGnY/3kQHVDm1wtJ+YfM1
         l7xk7XzWlxXzoufUROr5Olo1lmdhoJl0cy9O6yAjXPIWYIjXAUodM0SBDE4yki52HrHD
         eG/3u5NI+vQu4kpt9wFNoJKYdfddAIrMrE03ZhRdCmwepZAY6j1ghF7SIAc3xr4vElDX
         v6UPDI9vIiWFCt79H++LV9lK65e+6dQQh+Lb/QP4wPGSXvivDroOmmg9SMzWhO5TV+QQ
         wAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782223416; x=1782828216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pndzfg2mCWavHm/LZE4HxmOjSPKqkdyz2Mxcm9023NE=;
        b=S9oaQXrxjWLa1dVF+Ijxjno7xlSXPE8j3bttoKYNA1JGoW9AsBcgyBcXbl6Ndcdq2l
         3WugVzcioz7djk92SA7qlJjfWOOBbz1LXhVHsnH7Kxn/lbkCTUAE1B99KGDX8/9D+hUk
         veu3zDKIl99PSWchPtIdjGd3SC5i8SV7H8rS1Rf/fFRFFwtcWQ3wErGnP8UYesazd/rE
         fYx/rBmc3IqbSgww8E2vRlzAYkev2u5QiG5G3641XxkZrzByaw01kKhqQOsmp9QohstC
         YgFFRF/VjONVK9wmZ3VvFf1TWUr8C80tV3oAjnxa686tyiqibexukBCU4hbbPV36FXkn
         FFyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dUt0lt3PuG3RisyKh+RHWPV4p08chP3lFbcJjoe5kMig19j8DDEntOUnrBa5BUH8cmtrbHF5vKl4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0V/lujk1PszzAX+LhgBx3BelMbdFLgkQjAMfiWF2rkdjLWxQV
	ZhXIgreHYAnKj8RfpFeX072dTqPQ6meen+EmPO5JmrVt3HoLUDCYfU4BsHZ+RHzTx75EVnbgWNK
	i22yWjhHzwp6Tf4Aq9A==
X-Received: from wmo12.prod.google.com ([2002:a05:600c:230c:b0:492:346d:8d96])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f0f:b0:492:3214:cbe6 with SMTP id 5b1f17b1804b1-49240e7f6f2mr330026535e9.23.1782223415994;
 Tue, 23 Jun 2026 07:03:35 -0700 (PDT)
Date: Tue, 23 Jun 2026 14:03:35 +0000
In-Reply-To: <ajnOnzdknfwbuJ9g@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1780676742.git.tarunsahu@google.com> <48777f4749fa43d5648085dbb2037aa99c144a88.1780676742.git.tarunsahu@google.com>
 <CAEvNRgFEHciT3T9y+qEYRvXhDwfrggoU7Rm=f9hT3OrV+wgpNQ@mail.gmail.com> <ajnOnzdknfwbuJ9g@google.com>
Message-ID: <9huzwlvpmk08.fsf@tarunix.c.googlers.com>
Subject: Re: [RFC PATCH v2 06/10] kvm: guest_memfd: Add support for freezing
 and unfreezing mappings
From: tarunsahu@google.com
To: Sean Christopherson <seanjc@google.com>, Ackerley Tng <ackerleytng@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, vannapurve@google.com, fvdl@google.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Shuah Khan <skhan@linuxfoundation.org>, sagis@google.com, 
	aneesh.kumar@kernel.org, skhawaja@google.com, vipinsh@google.com, 
	Pratyush Yadav <pratyush@kernel.org>, david@redhat.com, dmatlack@google.com, 
	mark.rutland@arm.com, Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Alexander Graf <graf@amazon.com>, axelrasmussen@google.com, linux-kselftest@vger.kernel.org, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Mon, Jun 22, 2026, Ackerley Tng wrote:
>> Tarun Sahu <tarunsahu@google.com> writes:
>> 
>> > This patch introduces the freeze on gmem_inode which prevents
>> 
>> Can't find the reference now, but commit messages should take the
>> imperative mood and avoid "this patch" [*]
>
> From Documentation/process/submitting-patches.rst:
>
>   Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
>   instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
>   to do frotz", as if you are giving orders to the codebase to change
>   its behaviour.
>
> Documentation/process/maintainer-tip.rst and Documentation/process/maintainer-kvm-x86.rst
> elaborate more on the preferred style (I do most of the guest_memfd maintenance,
> and so for all intents and purpose it's bound by KVM x86 "rules").


Thanks!. Will take care of that.
