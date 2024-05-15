Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E74715574C
	for <linux-doc@vger.kernel.org>; Wed, 15 May 2024 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715786635; cv=none; b=fN2SiyAaLb764HVhdigu7VR8Pe+PQZBqcHJC5r48314tZar0RupV37+rieKumlYUUXgREFLmvgnxxEN6xsN9+H0BBGciJ/UvZkUEgP4cva51CAuGKao8Bz3LgjvUIvg9M5pNHDqU3xojxc7yTaf7P+RQf0XGo6lGLl4NF9IC514=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715786635; c=relaxed/simple;
	bh=kU5haLDUlfgVHXQJnqJgdAkMMg41tQYnmCEL6k+6oDU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=haBBB5eTOK9t/OIMN7F+K067i7l5KuO/+5OQfCdhgu/ek7GA9ZocFlP3FYVwxSrm/ndns3TaBIpQ0HMILEGFs3kEmZmIDQYxpY61NctVhW2SRCbuhgtst9sZi6mXKVYtJg7ABjKRoFAcI40c2j8QwB8eRf+PSWHVMvUkkR0QFR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tw1B7+sV; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tw1B7+sV"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dee5f035dd6so8957622276.0
        for <linux-doc@vger.kernel.org>; Wed, 15 May 2024 08:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715786633; x=1716391433; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/vj1A9ui2SaRE/HWTW3nQNHcmp/FHeI/IPRLs6zsaMw=;
        b=tw1B7+sVFtLjslTi3HDAnFYd1iIy8cvWIarH4hCGkD6J92zscbjwLbuYGsatzPX5Cj
         KEnvLeIfSFgkSvKV/HiWjOFpFi2a2ELVLN+x2CHivUe0BjRn17aRRVqZhpcWFL8W2dOH
         57hVo9YNpfD4+ecY6Hpd1KsqbLuUezwfptRqO0sBtYHIHW4kt1Rm5bWrpIh4Y5enZHRj
         jrBrr512YcD2J/cKhbaENhvJu5cozKwDZqy6jk3e1vr/LEESnTO9bJg3nN3t/IEvy9v1
         +dabm4c3g/Qgu+DT9rjQrBCLZ2Y9mwgcT8pj9dFyQJzs8pm1I5UO78yQq7XZno5j/13N
         bM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715786633; x=1716391433;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vj1A9ui2SaRE/HWTW3nQNHcmp/FHeI/IPRLs6zsaMw=;
        b=T+um3ysFzX4J9uRuOKRWhL9vQke+X6apY5E/9Cryxv0rjc3adS1Pfro3G6j2WL/7ja
         jaXBTdbl4+xrb2U4Y3gcLo+LLVHSW7Dfb1RvS2yQbArxWWUJwpNxGK1UHc7NYSZ+rfyH
         Ifemj0AdGQ8TDRteRwuY7rWM0Yc6YJ5v/366tZQh9fdsQ7x/qfE8eU4FCR4fs9J1g7l2
         ooMhqJC6pzZ/F5cnf0VmFOFw2vDwMjNoaIWKWvEoQLWmJczfYb+UQMZLrcMQ2tLMfbig
         FctMHFkzBs3BpZ3ICjgGqN2tPVkYKSr7kvmTiXU8SxXTE0Vc2WWuJLHG8o9jAzTZJnBq
         OgjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzMmc+KEZbLJeKGtEmX2anzFaTKjdRytXDJntUkvkgUlT04cr5AnQswtnipnybG6ppo6OYxEUgRRnSRmnKFJUImSaqfiYhHYYr
X-Gm-Message-State: AOJu0Yz9prmT4sKzEv7Sd0sHR3xO2O4ynimb8vFPV+RbJvvI2DBZhs4c
	Ubkt0xOyRBWJ9vPh3HEe4MEBbIJ3RXi5cgeaBLaLFF3paV9mF7q9L8AAQmQdCy9Zv8DZU/syX5b
	XoA==
X-Google-Smtp-Source: AGHT+IHYglKVcDSO/IWQfJ8xI8dVwMGpQ0/ErI/yxeFoh8tCkNXcyH0VPfrlyu4AmFvEBSdW3dgM2ePXTNA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:100f:b0:dee:5d43:a0f3 with SMTP id
 3f1490d57ef6-dee5d43c91fmr3707898276.6.1715786633444; Wed, 15 May 2024
 08:23:53 -0700 (PDT)
Date: Wed, 15 May 2024 08:23:51 -0700
In-Reply-To: <5547dd176122865e6a13b61829aa9c4b6cc21ff3.camel@cyberus-technology.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240508132502.184428-1-julian.stecklina@cyberus-technology.de> <5547dd176122865e6a13b61829aa9c4b6cc21ff3.camel@cyberus-technology.de>
Message-ID: <ZkTGhmfF-FYisKL_@google.com>
Subject: Re: [PATCH] KVM: x86: add KVM_RUN_X86_GUEST_MODE kvm_run flag
From: Sean Christopherson <seanjc@google.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"x86@kernel.org" <x86@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, 
	Thomas Prescher <thomas.prescher@cyberus-technology.de>, 
	"mingo@redhat.com" <mingo@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, May 15, 2024, Julian Stecklina wrote:
> Hey Sean,
> 
> does this this patch go into the right direction?

At a glance, yes.  We're in a "quite period" until 6.10-rc1, so it'll be a few
weeks before I take a closer look at this (or really anything that's destined
for 6.11 or later).
