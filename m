Received: from mail-oo1-f74.google.com (mail-oo1-f74.google.com [209.85.161.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5533E9F87
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 17:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772041509; cv=none; b=RJhzLxcXYd1zkR0g1MMwJrs7ycsOyKUoTX3Eh5Hy568B661bvks6onnQZp4RmRIv3jL70yCGjs5UlX6U9J+ePUEoZ5s+UfYb0Bq1iCu5nf/ZHZL/0ie+5Xs2QKM+ZPn+JtlLqCVa3r5+KBavxBVFxw6jnwJQJVelsDRnsBACdTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772041509; c=relaxed/simple;
	bh=P/hBoEMiXYtzSJAai3x+/Zjn0NP0IL/2TZ2kRQnBAyM=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=lWC3sD0ln2gYKnBzvOwxOAq/xzQvdtAbK7OJ+mFTdWw+RHr988RwWBnQ7jtyhZAQkjMizfUKuvEqtQCh+KBzXW+c3Zeu/nlMTU7qkvevBcq+GCUR+oNaTAE/RO3t4pjUpJtLiNlWSY169SWkIektocjE1pJvPvgXn7Pcm/47ZnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tnsk8RNq; arc=none smtp.client-ip=209.85.161.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tnsk8RNq"
Received: by mail-oo1-f74.google.com with SMTP id 006d021491bc7-679c5ed0942so538936eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 09:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772041507; x=1772646307; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P/hBoEMiXYtzSJAai3x+/Zjn0NP0IL/2TZ2kRQnBAyM=;
        b=Tnsk8RNqXvrlURO+79j6rF/IGLZCfEuUzOW/l9ObO7BYIMHuN+2+1ZBZOsq/GFkKY7
         cC3DH8/VfTSsrr+mnpD+rmyzz+qghMIbbudXX+ILgf2yvu6XOgSr583TwOPDFiQ28l3G
         s4b8uBB12KRjdukTBU3l5aiuEjCsw8tR+ZxQNaT5etDSIotFLgWXPuP8fOweNGwEKyC1
         n/Z9rLMkZwWi7fhEt2u4v4A/OH7ZwE74MZTo4E0c1+UBa/tAK/z+jRKs9j8EQIiBqx3/
         3s11m+bKzy88u02gt+7+ESYdDYyRIB+0SEJBfRGaBnd05QuFfD2/mFSCm60cO/noRbYV
         fDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772041507; x=1772646307;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P/hBoEMiXYtzSJAai3x+/Zjn0NP0IL/2TZ2kRQnBAyM=;
        b=IgPYQzk/4eEsf+51UUlP9/NCid/i4jVw+m/P3MPlHIo1Mms903TPNnSXHwW5eP4AUx
         fqsWT7MOg+kIbUIkc5J74sGWvzk+OsjeXJX3BQOewsZP6/edh1n8uYRFTkafKodhN/Js
         7Ic3cyTNqHon9dsHKmWoUdUd/z1cf2hvE1rduHpvu62me9RUTV8d4SFrFLwUVhdqqp0w
         6DP/AUAFqpGOibPMgc9A4KedGI912Aa1xwM0QnG+4dOSbRdFm1KpIGVYQ0M0doJNx8tx
         Cua+8ZlzplfmYnUMPjUSihngruNNb+zwM8W8wwjGc9tFXQ2j7cpJSTgeFEu9SX3XZLcB
         XlAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCpy5WJuh6eTIkGA/4SGzzO1Wyv1rhk/K7u+SKSKh6JwzWEo/Lsh38431fNQUD6i8G0XfVfIOC0rY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJG3xWW9hHylLABJXq9OhxxzBKsMnLEh3IAvWio44njAkt/3Su
	ftzelt1XD71tQiceb693eR4o552hXBjDXK3LT6MdvnqxjMdfyRsSW6b7r8u5wMMEjnYupWeeNIE
	bEL7xGmYkmqTM1htpwsecLuV4UA==
X-Received: from iobjf28.prod.google.com ([2002:a05:6602:649c:b0:957:6d3d:c3bf])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2d01:b0:679:a4cc:e04f with SMTP id 006d021491bc7-679c4618dbbmr8769461eaf.51.1772041506836;
 Wed, 25 Feb 2026 09:45:06 -0800 (PST)
Date: Wed, 25 Feb 2026 17:45:06 +0000
In-Reply-To: <86ldgyba96.wl-maz@kernel.org> (message from Marc Zyngier on Thu,
 12 Feb 2026 09:07:33 +0000)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntv7fkogyl.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v6 09/19] KVM: arm64: Write fast path PMU register handlers
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Marc Zyngier <maz@kernel.org> writes:

> On Mon, 09 Feb 2026 22:14:04 +0000,
> Colton Lewis <coltonlewis@google.com> wrote:

>> We may want a partitioned PMU but not have FEAT_FGT to untrap the
>> specific registers that would normally be untrapped. Add a handler for
>> those registers in the fast path so we can still get a performance
>> boost from partitioning.

>> The idea is to handle traps for all the PMU registers quickly by
>> writing directly to the hardware when possible instead of hooking into
>> the emulated vPMU as the standard handlers in sys_regs.c do.

> This seems extremely premature. My assumption is that PMU traps are
> rare, and that doing a full exit should be acceptable. Until you
> demonstrate the contrary, I don't want this sort of massive bloat in
> the most performance-critical path.

After some consideration I agree. I will try a full exit and see if that
is sufficient.
