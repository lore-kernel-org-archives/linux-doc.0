Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB8F1FF7B4
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 20:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750971012; cv=none; b=bqqhNrl7qgC6Ht1y+qtNYK4TCyd0TalMDDcCLP1RNu6AvNfsGHGCBAp6l4f1yMkFD4MwyEZ+0ufXaInLLRT5s9exV6IjSsROLQFHEZ6glZkfg9jOd1xo7AVU4WWH9c0hRFLZZ2/4u56rm1AKmZoaM0mmnsQYk/LTXLYwLSEtJPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750971012; c=relaxed/simple;
	bh=0B+GG0V9IxayHUjd+GrM2c+j6iCMSNSpCAoduPtwMhI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K+67bEanl5MeDk++kVb/Q33STx6JFSgzskB+Z22IFmEcNPDj7OmaWu9Q7TpdcpDqaREnrG1Zf9QMBbGsi/WQgA53DWR/atKmmgssbI9o9WnLvQZxlqAklEGL+PVmF66/3s5iaJtm1g2lpsdbQiQBapnLGWzFTIxso7+NBqzegX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EqhnfKT+; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EqhnfKT+"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-747ddba7c90so1082218b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 13:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750971011; x=1751575811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7OlW39s6ulMaqljMLUWDij/EiBowAxWTwHoPBioqCw=;
        b=EqhnfKT+hDusE1aTwykpY1/5vhixXbk7JkMhUqvQVSAPYWWc+oTZKOw9q8kOhkz714
         gLoBasHaTRtvuQtV6op9rsKnkXm/KGjtcEyBMCDFBIAPZ5v6tlaL+kD85Fjid0/8EoTr
         96FPF1NFXfZOm3l6s6qUOiZDKmdJVArYteoV7vl0LGgFxIMPENOQvLR8aif1rcfwIRWG
         Uyndrz9RhBzI6B0FJzuIB0jDPP1K8+XuJPPHIOJlAH1NembqL4aI/dozzNde8hS8l4Ip
         qu2h44DxBaVJslUTy4xjYTifS1917TAceRqpolmpkZ5AeLIdO8sTBz7qNbwGwtmnoHzZ
         ST4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750971011; x=1751575811;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C7OlW39s6ulMaqljMLUWDij/EiBowAxWTwHoPBioqCw=;
        b=jyp9fYoG1AUZeQscRT3ggFiFiroRbBsjCjA/GPMh3W9uoxr8WKhrauYBuxwMJ0vJ2J
         +7oPJaoLzk7OGdu9uBZITo3fuqgWhrz07UpWcx+gHUZVfRw5Cm4qGbg3rFbheAKWCiWb
         dG/O5ssTF/wl2Rg2KIjHHhqd33cSo6fItzHjqnCg/dvZL0KUOXuUCVNz6qr+Mhhqef2n
         eSfBd9q/CdTnFR8Py6BcFgzHHc2BAPYjfImQw7R2BbM9Yb9Sw+yCkR46fbfNVq76WLFg
         PT17eZy/Ij6RaqhmwAZWGculQlva4kbvorgIL+PFRohcDd8zhXjlSgMKgt1Mg1moeDq5
         izaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPM0anvqmp43yYrvipkQ5SBjOlqMLcVCHgRXnArFAeRCEbfiVI8ciYC2xhIEJLuOtLdJO2LOJFCKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKxDRetiKRYDCqTWBWcoE6NZUmNH0w8VVkx2tNwf7LGE1qFgjF
	/b1y6ACTkVNaF/AkfWPmqjIofK8qGGnybQ9b2vDK1UwGNDMJcKDK9Lbp9BSY9XEasvv93mMstNh
	hkKYwwQ==
X-Google-Smtp-Source: AGHT+IEvqZwxFHUi+bQpaauJGtY8KGrib3OUPRdkSaQ6XydD6Sn6vov8+Sgs49EQUuL4CN8i3MDM/JPkMv0=
X-Received: from pfbdo6.prod.google.com ([2002:a05:6a00:4a06:b0:749:1d32:aa78])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e1e:b0:748:2eb7:8cc7
 with SMTP id d2e1a72fcca58-74af6f79db6mr649612b3a.21.1750971010693; Thu, 26
 Jun 2025 13:50:10 -0700 (PDT)
Date: Thu, 26 Jun 2025 13:50:09 -0700
In-Reply-To: <003b5de7-502c-47ba-ae46-0905ee467384@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328171205.2029296-1-xin@zytor.com> <20250328171205.2029296-9-xin@zytor.com>
 <aFrR5Nk1Ge3_ApWy@google.com> <858a3c30-08ab-4b9b-b74c-a3917a247841@zytor.com>
 <003b5de7-502c-47ba-ae46-0905ee467384@zytor.com>
Message-ID: <aF2ygVI8MN5IrAcg@google.com>
Subject: Re: [PATCH v4 08/19] KVM: VMX: Add support for FRED context save/restore
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, andrew.cooper3@citrix.com, luto@kernel.org, 
	peterz@infradead.org, chao.gao@intel.com, xin3.li@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025, Xin Li wrote:
> On 6/25/2025 10:18 AM, Xin Li wrote:
> > >=20
> > > Maybe add helpers to deal with the preemption stuff?=C2=A0 Oh, never
> > > mind, FRED
> >=20
> > This is a good idea.
> >=20
> > Do you want to upstream the following patch?
>=20
> As I have almost done addressing your comments in my local repo, just
> sent out the patch.

Saw it, and the LKGS patch.  I'm OOO for a week, so I probably won't get th=
em
applied for a couple weeks.

Thanks!
