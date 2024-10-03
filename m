Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0297778281
	for <linux-doc@vger.kernel.org>; Thu,  3 Oct 2024 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727985967; cv=none; b=u9F/GlIB2PCpXNZDdcCB6C0olC2lnehmqbr2LKpLQXvTVuWWECCfRXCHemK9haBaEZzw0QJeZBzVROAN97SGxKviKDA0qnajddBwCY92wi8hKlgQ0OtYH/FKrwna3REj+l420r3pEYR+43xkMRbh5PJdM2cLYLrKovpLdTEZ4Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727985967; c=relaxed/simple;
	bh=hSUWgNV185nneWzES4OzK4vK5Eea03Ph2K2/JhNMW+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CihXPBc2ytfW/S1SsAiY0ZhAf2jciUMNS/TDPuET7/GGCezdNjMLCoeb2DUKGV6P+PZorsIqfc87URlNSL2iruT6DfKRXH1LOtRzMOqsiaN3Ii1GeVH1/xv+Jks0k5LKdrDjuXsAzGpUyacoA0MagFTN8Y+wDjwKXbRWVfw+bFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j7tqYcVV; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j7tqYcVV"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e235a61bcbso16632407b3.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Oct 2024 13:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727985965; x=1728590765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHzI9kibwBGfbX+u9LfgG392Bz0yBO/FrADznXjpfXo=;
        b=j7tqYcVV3x/XlKQt4Jrfe6glfAkoAUeui0hIfdxsK9C6OY1DNRxjcxTIrRHfCmC4HU
         DMFRDFowt6izwr868bjssZK13KpWkILt+iEfCI68S4akc3ZDYG7yrQkKSR8PhBY/GTGp
         PKVP8diE+qMPB/s8L2HKb1w2//jHthg/mI/QHlQKozaziyigN2zH7wf7FnC0cZREX33F
         TjGZauupae3PRbZ+3RR8Xc8QN56z3kIq1L6rjrBnBlJE6sx9TWsLXafk4Yzr2SCyy4yI
         ghTbmYhvlW2KLfsgrvMeco3oPU7SRaDBSWl++MLq/eArkXUYU0sekXLnwKWi0l9xt55R
         kB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727985965; x=1728590765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHzI9kibwBGfbX+u9LfgG392Bz0yBO/FrADznXjpfXo=;
        b=xUTDW/Ig1oHMYD0anCP12f4KSJD51vCJJEuB2Pyil8Vb+8OV+gW7TbJf2KRM5xrY/I
         hqCgHOfilHa8WNJ+fYUyeVtjd8D4SHb9pOhPv1mFwPOLD1dq3RCV9YkxTddyQFeIlTNU
         ScY23Yzi7kUQ1zAZBgADn5rqIkgekxVd0Ik1FMVcEa2kl+PgJ0sSH+FfXTiA2/jHy575
         iidVfloED06mqXubVYBgGPbmF5YraGWe5DIgCU4BDi26W/CCIUfKqPZ1EdluplSzIg0J
         qOMgFIRzBl2uAKT1MiS51SvgtKWfov7d/Fxz6bZtL83Ypy4cqfQnoAQ01rcQKxWIV1LF
         4eTA==
X-Forwarded-Encrypted: i=1; AJvYcCV+jr45zpq8+fqlxMu4h+aurrvlyWK7gUlNwsnbklpRHe0gNuFQLUSUwYIOVpICuTnV2U+7SRqcljM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZv6alYjeiXmdnocIp1P8aXFzZmnIWXZEqptURqssoEaDtdgjg
	1WBCn93QEQdmZ/Ld/h0aUCquWlC4X4zTCBZL7Cp15w6KIiHyiACStBh1BuBmKyCLYYXiSgP2WhL
	5YfYpyMPQn5yC0TY2cCCTxjlxoMbSIhllZq2V
X-Google-Smtp-Source: AGHT+IESiGJnMtl1gZFqJRNktO5r59aOQQF1KKLqhp/PZ7O+Nz98cRWkE2b6UlCPgSskCbDZSVsRWB9LF8R5tSuAhAA=
X-Received: by 2002:a05:690c:60c2:b0:63b:ba95:c8b3 with SMTP id
 00721157ae682-6e2c7c16a00mr3687097b3.6.1727985964764; Thu, 03 Oct 2024
 13:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926013506.860253-1-jthoughton@google.com> <20240926013506.860253-5-jthoughton@google.com>
In-Reply-To: <20240926013506.860253-5-jthoughton@google.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 3 Oct 2024 13:05:28 -0700
Message-ID: <CADrL8HX5WxpRD98rQkBhVQo0asw_c9VOwk79OJDWqzRDmkoX9A@mail.gmail.com>
Subject: Re: [PATCH v7 04/18] KVM: x86/mmu: Relax locking for kvm_test_age_gfn
 and kvm_age_gfn
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Wei Xu <weixugc@google.com>, 
	Yu Zhao <yuzhao@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 6:35=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
> @@ -70,8 +70,6 @@ static inline u64 kvm_tdp_mmu_write_spte(tdp_ptep_t spt=
ep, u64 old_spte,
>  static inline u64 tdp_mmu_clear_spte_bits(tdp_ptep_t sptep, u64 old_spte=
,
>                                           u64 mask, int level)
>  {
> -       atomic64_t *sptep_atomic;
> -
>         if (kvm_tdp_mmu_spte_need_atomic_write(old_spte, level))
>                 return tdp_mmu_clear_spte_bits_atomic(sptep, mask);
>

This delete should have gone in the previous patch. Will be fixed in v8.
