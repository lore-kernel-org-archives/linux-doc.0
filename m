Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686133218C4
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 14:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701892; cv=none; b=iDljR9Abb8EhzSS8hdXzV6ZD11VsqU9hjcEZGhV0ltPMULiu5+X8Wzy0yRa8jlq2drmn2RF2xUux27f4id797QggWnvFHAkoXZsnIt+BXmpzSLg+U+LA/0OmvE9CVwsbUBj40tbyd+5DuItPcyR41dSLCAK/yaC2KclAMZLhqGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701892; c=relaxed/simple;
	bh=CspbNBhuYsQ7du6/xNp1Y5AUWYuRxxmyICpjtfMmmAw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AGnCjgo2me+yTetHnOVkbTY1nUkzFzy7X3+L7r9Azo2lhaZyZpyDeFWzL7R8yUxnqNSRFmmkUrQU1GQ0tdV2LKJFOrt5CN+iA/BllWs71DyZ4jstcWXcZJCXGeGmHJwH9cy29rov9Y/ocm/7w1Ck6A5GgM/fz1KbvyZqkEmM43w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N3TasCgT; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N3TasCgT"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32326e09c5fso8396a91.2
        for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 07:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755701891; x=1756306691; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oiMay2IdSLHxdRMiaPmIEcwuoM6FhIvI0i1OVkS60Rg=;
        b=N3TasCgTNbvuetFtQeemUwHi6Utkf++dvXGKCVbhi49ZlEiPdrGz9upLgPjtGYJsZo
         yrmJqePwoG4aA6GmUzBs2/MlQbBLGnUhhOELQwsrMQNAHtN6hsNqN25RKjYC+rcr7j03
         Kb3OWzsex1jw73sQlwh3r40KwchxY48aWdJR1eUctk7XnH+0N+k/Wl7CttYBLPi1x7Dx
         BH4ar1Q57N/kJUv7j0EJh9DxEezpe9z2N3oJfeh2aBt8csOcJLv/08d+MkqNNi+BFhQz
         sndZyNygZSXk40SodWKsUHA850QzyNMj0b8JFqjs7ELryXU0bJLnGZ6R+0lKCooIbRiX
         iYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701891; x=1756306691;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oiMay2IdSLHxdRMiaPmIEcwuoM6FhIvI0i1OVkS60Rg=;
        b=eIPFOC5uKxnUf4I1tu2CIW/9wXixMOV6aX/SEWg73la8Z/xUOYoztSQ3NxjNomRfMH
         zex49w5KGJnYm/VDI3h3BlDSZyU/npEspbD5UQcDxg82hdLDDGvXCwK2fDM6v4vDcYuX
         snmTjoeB5z67mTdg30aWkfztY9PpZDvMBgfOhoesqwUUGYrUEcsIbglvVTj7uOLt6owo
         4S362pPkbGMmDEA773f2zrzvhEju/+xNXkyDJrloMTeQcBPEOgbJShtvUeNbKAKBAknt
         LK3coyV8Tx60atYpeXTKC44CICy3hYPCRCejpP+N2bW6Inykgcu50q1TiajSoxB5gx1T
         vKrw==
X-Forwarded-Encrypted: i=1; AJvYcCV66a5x0GK7FWYI18U32TekfwZ0i5M0CMu9/CCwv3BC7eYG9x9zVscuRh4liNzzVFcS/TOu8AxG6eM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXEwkbTKhRSQdHrctkNrviMnzAZ4skV7rvj00mCpj23KFKN25a
	CCHpFI3nMwlmUvm9XNRtrDApPKK9DINpb2lriFP09B45haUhi1/3oTjpY4DeYX8vN/roAXPkG4N
	0hG+5Sw==
X-Google-Smtp-Source: AGHT+IFF9tOLd+O+PeK/bjekdXgGVAp7JWSfLy4Z7Tuw7Z3CghxjcwedFydLMuTopL5E8f51XtOU2SaFr6M=
X-Received: from pjbqo7.prod.google.com ([2002:a17:90b:3dc7:b0:31f:232:1fae])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d85:b0:321:8258:f297
 with SMTP id 98e67ed59e1d1-324e1420be4mr4203585a91.18.1755701890615; Wed, 20
 Aug 2025 07:58:10 -0700 (PDT)
Date: Wed, 20 Aug 2025 07:58:09 -0700
In-Reply-To: <bd3268e4c7a300db33a2cce373741f0e875474a6.1755700627.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1755700627.git.ashish.kalra@amd.com> <bd3268e4c7a300db33a2cce373741f0e875474a6.1755700627.git.ashish.kalra@amd.com>
Message-ID: <aKXigZHIe91Fficj@google.com>
Subject: Re: [PATCH v8 2/2] KVM: SEV: Add SEV-SNP CipherTextHiding support
From: Sean Christopherson <seanjc@google.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: corbet@lwn.net, pbonzini@redhat.com, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	thomas.lendacky@amd.com, herbert@gondor.apana.org, akpm@linux-foundation.org, 
	rostedt@goodmis.org, paulmck@kernel.org, michael.roth@amd.com, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 20, 2025, Ashish Kalra wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> Ciphertext hiding prevents host accesses from reading the ciphertext of
> SNP guest private memory. Instead of reading ciphertext, the host reads
> will see constant default values (0xff).
> 
> The SEV ASID space is split into SEV and SEV-ES/SEV-SNP ASID ranges.
> Enabling ciphertext hiding further splits the SEV-ES/SEV-SNP ASID space
> into separate ASID ranges for SEV-ES and SEV-SNP guests.
> 
> Add new module parameter to the KVM module to enable ciphertext hiding
> support and a user configurable system-wide maximum SNP ASID value. If
> the module parameter value is '-1' then the complete SEV-ES/SEV-SNP
> ASID space is allocated to SEV-SNP guests.
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---

*sigh*

Give people a chance to follow-up to the existing conversation before spamming
a new version.  Sending new versions as quickly as possible doesn't help your
code land faster, it just makes people grumpy.

I'm ignoring this and responding to v7.
