Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F44259498
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 18:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435529; cv=pass; b=j2yhdpCLIL3Sc8CWB2+93bYKM1ooNef+dsO7NBn6V2gEouYByVComvNM1UOWOBCIroKGQjH4crGeL2wdq6N62z0Q6Cl4DQTlPTo6HQfZM9evpZliPabv6yTBDm2snwdeNmZ2an5guCfd2FqG5A+aP5rDUBpVpzwiHvbYNdvqSBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435529; c=relaxed/simple;
	bh=gJHV3b2Sc8xEI8IKQeSL3rSLGGFn/d5inPeMCN2Ei2g=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kD4YzbyPsDSczPdtsKVvITNUC1nXwCetasP5RzutI+1a5+1Uirx/uaT6vB8ihdJWMeCrhaEEhWo50dsB+7REha5FbS2U0yUhN11ZqUHcJhqT7z71IMU2biffjGUNnbGlcVtDApDRqThtMY5A8aty3DtmoDdLVmPLzIKbdbDW/7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GBYHkGsk; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GBYHkGsk"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38f620399a0so174619a91.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 11:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785435527; cv=none;
        d=google.com; s=arc-20260327;
        b=cVFuSkCauPk0lTSTeaW38RhdLbyTcLOMcp2f3Mr7BRHntb9vhju0op39tRqEoXAN3x
         wcb/VQts/crWLyUma5baAjcL6sr5zT+AKJUiJrnlXQSUvbn6HyoBzW1ZRKomENJhYa1a
         KF8m26FALpp2wpWR+7Q3qUGDmiAI9oquV10nj6BZqwyBCtOqLfJFyMFE23qGjICcOAIK
         S4qNCrFm/Ksfu3FWVizlSy99pfnVzyyJZ9O4ItWXh9hvN9VPI8YaM0KsZU7lYfs7cwtO
         mz/OJklS9MPrO8ngkrwOotxzNbyN0VWLw4H77AtCvF09IXzGFmZuVhyzojPON5WQ07ro
         wWRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=BcSk1/y4fhEYP1oDWtEyRtQmE44YyXI71BVE0scYBk4=;
        fh=2WVdEKzSTqlNu7d18gewvo3drSMoNPG7KcJCdoptzqI=;
        b=cbxVZwDUUk/1KAd8TQpufH0CTqjS2H9cjOfWH+YbHzsN2exoVgxU9JcQT4786z7cVD
         fQoHwmYb0f2rfMnvHurgVfSDIj3kfNcNliVZM42Bnu4sfooRSgj7YbA3Kr0J4G+3Sr3N
         ceolnzmbFf+yaNMV9WvYhCmxQqr6BM3+c/PTuRCZkszs+kGmMaTK+N0OH13DjA+hsgQi
         7cZczMeBM3r5QmA+NwdqmGhOMDRYOvIqTr0+FfTyMU70RE7FxkHdMOi1Z5rs9S3t2tyc
         FRB0jsW3RhaxSwjd9NgtEpx82sdoz2XafgOPfbVO94DHxU/CgBwtYLPzUWAQavG+dZbb
         K1EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785435527; x=1786040327; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BcSk1/y4fhEYP1oDWtEyRtQmE44YyXI71BVE0scYBk4=;
        b=GBYHkGskC3W/60mVgxyZuq99MzKq6IwMmllpmiuyP8fW71ofh312bKprI4rBFRkvmn
         RsrziMBdwyHcnbvEkVt0XvwqT/wekwoMY/FxanxEMuPFZSbQ3eCBBfcQ8U9ga2zRwXZm
         T8gmVfC/AYMjk+PEYSrqZnt19/ePl98DZOBJ3f1pJ7jWAz/D/rzkWrhWLVnLxUe9M1oF
         8u/4XmZplHV0yq72RRTP3gNS3Bl3eTHE0oxlVLtz2r4zLH2ZzxA4UUnH5UB/1OcVrLFC
         hCc3Pv6tkQkM7VhysQnVzUL4Jx4ED+mK1iuvB/lq7oTFBZ1v/X66ElNlbfhPXA2gj0tM
         HoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435527; x=1786040327;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcSk1/y4fhEYP1oDWtEyRtQmE44YyXI71BVE0scYBk4=;
        b=NRdcEZWVFsqqd7PMMNC/TYb1R3AmKliMECjZb8OXK6GhMyfYX2CM9fHP24sSeO3xue
         nbC5QwawfpB5bPAcspk/E5Wh1//xibxd2HQeB6fHLXCcdyxvAKFDYaQpj6MlrI12zmpt
         1YttVsNUUZOV1GhhSRIimzlgmMal5qlzg9dNoLSK/ACukGbexQoq9LbyZZ6JG7Y2J5KB
         /HVUE5Iz1a5LCMyt/AAohuoapPTp2iFDqXe7I/e5h4XRMJ3URfW2F+524eVpXho185hw
         H5MIhzrdTt40OdDkVOExC6SWv8S5soXkFBRd4lJV0Uek6yP6o4315Q7/MtwgSUndXIj7
         sCpg==
X-Forwarded-Encrypted: i=1; AHgh+RrgAvx0RsaUxs27lfZUIdm9UkpAVMYABTAUJOeQrrbIINp29JPpNGZ4+N8IPvd2Btd1p/OUMjvx4xY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsb9Un9YVXEcmGIH4zS8ofN3VIbnHfT48nhpL1AHkI5yz1ZKxN
	nuS3ivzC+5FoIAU/DKevMubUzEth9NdRYuhMbrmsGqzPr8khoXP+oNvuUW9E0YyHyU8mfBIqJ0P
	7nIWSTWaAI+xn29raisgdG6QvxgiJ3IBoX82k1+6e
X-Gm-Gg: AR+sD12+Giph5W8y/lvWHVQQEUPtJuS8xrVNn22Shnq8GQc74TbNDXCTsGp+YAJSgds
	a1Z0wQp35jY218VW5E+BreA03bapE4S02qditjzHEnPbF8PwpqcfSjbT08zYREHuvAzIbN9tFdT
	pU9Yo/g4voSadBfG+nmiTjcR2QUsOxkbSZBzDxUSkiw3MBnAudRU6eXd9XoyQPcgyoagZdPHWc+
	i8h5knZ3sRofr4ckVWpqsDTt4lTNX8P8FC3UJbLBm4YBXXoej0jLoX6ZruV0ZZdJ2BjsRyHZeXO
	vF2Onws1xnXMVqHPLhfXkL6mxOduBoVgsuyA7LS6deETWyFhFiG06/+eAbhS98syK788BiPd/HF
	s/2hm0Gyc3m15gWGQ45D6oDqGLJSzS6Ty8g==
X-Received: by 2002:a17:90a:d007:b0:37c:6130:7a5b with SMTP id
 98e67ed59e1d1-38fa7dcb036mr912482a91.8.1785435525974; Thu, 30 Jul 2026
 11:18:45 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:18:45 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:18:44 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728121138.1103610-12-tarunsahu@google.com>
References: <20260728121138.1103610-1-tarunsahu@google.com> <20260728121138.1103610-12-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 11:18:44 -0700
X-Gm-Features: AUfX_mzurojFzFl7kQ4jInKyqzMda986c-EWBvJn_4YyREdNQpyHfl__fqR3AfU
Message-ID: <CAEvNRgEbS06snhyHznPSqxnUrdudVEKUuOpPwnU+AJATWFBRBA@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] KVM: selftests: Add guest_memfd_preservation_test
To: Tarun Sahu <tarunsahu@google.com>, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, seanjc@google.com, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: linux-kselftest@vger.kernel.org, andre.przywara@arm.com, 
	michael.roth@amd.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	will@kernel.org, vannapurve@google.com, maz@kernel.org, fvdl@google.com, 
	kvm@vger.kernel.org, oliver.upton@linux.dev, kvmarm@lists.linux.dev, 
	alexandru.elisei@arm.com, skhawaja@google.com, aneesh.kumar@kernel.org, 
	linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, 
	kexec@lists.infradead.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Tarun Sahu <tarunsahu@google.com> writes:

> Add guest_memfd_preservation_test to verify that KVM VM state and guest
> memory backed by guest_memfd are preserved across a kexec reboot via Live
> Update Orchestrator (LUO).
>
> This test includes multiple tests
> - (A) Test to preserve non-guest_memfd, non-memfd which must fail (/dev/null)
> - (B) Test to preserve guest_memfd with no INIT_SHARED flag which must fail
> - (C) Test to allocate the guest_memfd memory after preservation because
>   preservation makes the guest_memfd frozen. Which must fail as well.
> - (D) Test to verify guest_memfd with INIT_SHARED flag preservation across
>   kexec: Below is the details of stages in this test.
>

I think we should split this into multiple patches, where each patch
introduces 1 test.

>
> [...snip...]
>
> +++ b/tools/testing/selftests/kvm/guest_memfd_preservation_test.c
> @@ -0,0 +1,357 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026, Google LLC.
> + *
> + * Author: Tarun Sahu <tarunsahu@google.com>
> + *
> + * Test for VM and guest_memfd preservation across kexec (Live Update) via LUO.
> + *
> + * NOTE: This is a MANUAL test and is excluded from automated CI/testing
> + * frameworks because Stage 1 daemonizes into the background to pin resources
> + * and requires a human operator to manually trigger kexec before Stage 2
> + * is executed. Running Stage 1 automatically would leak the background daemon
> + * and cause CI runners to falsely interpret it as a passed test.
> + *

Usually there aren't many printfs in tests, but since this is a MANUAL
test, maybe that's ok?

Would like to know what Sean thinks of this, and printfs in general.

>
> [...snip...]
>
