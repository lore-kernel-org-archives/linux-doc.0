Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3603DB333
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 19:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956675; cv=none; b=lGahw9xIavX2s6NdaQeTGevkvqDszBK6MLyJzbuDEIxyGxFSLkfm07AzluCoOvVe5+dj4zCotQEsrpoWBUyxDGlVzauV/anbU+b01fF5zd7S8oQJ9LzGCZ6IISWacS92rlbO5oR9eQpClLyLr7J/Vujh3UJ4n9os3fLgjBjCYx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956675; c=relaxed/simple;
	bh=cHTJQT/RBVKmLBGY8jEZzpAPKstx7GoblZ2qvVZvaPk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=b/ikMTW2IRcXF6LWvSbKHzgh1sMmQU08jKPWYxTE0kt6K99RDj94iCmm+NdqF+4lg87mz+JvBK0zqRZRXpvN6nBkIrFrv8cmlkEsjs4seQVfoCl5ledwxX920sDykdnldBpx+Xu5sQ8kZ7Okp7icDQv5elcP0TqvDZo1DHR7U8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoCQUYah; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoCQUYah"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso1033581a12.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Aug 2026 12:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956669; x=1786561469; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=V5Nj3gKC4yEN6e3D1EtvSjC4Has3vClSVMr6RcOyF2w=;
        b=CoCQUYahxJaR1S7hhSRrAFui2LryVSJqbPV+GSjVS0HCJl/B60TxQ4kKasB3XckfH1
         CzSeHKIWy+1LS9p+JPflidlb7iG/yX3f392aSX2Fa+qQED00IdUzxKXwGaqr8W1t2I9h
         0SfrhS1LCptm/4IdK9I6bd5XWlXhPCWMOeUd/GLYL7Lq+8W4XGY+suweD1YfRx613lq6
         4jKJ2YKKUJduNnK07kGOovESYfagvbLXQL15l/75akhpBd1CUjsjAXXj0ftMqVqoPvpZ
         mnK2AcjkfgDyZ12cpada6aM9OH2GRpjCrum2mT+8UFcbRfQbe04xbBaO9EQz1wDJyalr
         mfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956669; x=1786561469;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5Nj3gKC4yEN6e3D1EtvSjC4Has3vClSVMr6RcOyF2w=;
        b=JDrMlN3yY95TiuvL8u0RjoFqoZOgRkkowAQiyKfGtOOM1eEpO0Ds93ltrMM8L+WseT
         LEEhvDJnL/2g7jAA2w0uCapTTDaSQa5mm1WrLY9dFq5q0/wKpTjQiSB3ABSs1AlpNjv/
         XIaH+zfHHh06Xr2VdN66NtTQXmtDvyiY+91vcqMdfQ6fDIL0nS+ZeM/7QP2TlXrmgnEa
         /SM5rJgWQd8vXT4kNam/fXDwhKYe9Hc3jkrSuCmX9/1pPjMB40LX/ZOQcEQEOkGpD5sa
         HghM8aIExM+NXR35XhBFjv+2Wnjg+BKt8F8QveatJmxbs974ayM+QNK3oyeuf6UyUuP8
         sgOw==
X-Forwarded-Encrypted: i=1; AHgh+Rp178BOQI3V5paZv8dPm3ywQPCJCYAGvkHGUwgTclE33hAYtwdl5mH+0J6+DPgtqNr3H9qNdc1IFG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzATzp6JpLBK3z41CrpKB1O+kAKoebBJzCZsVNIWDW5ajw2oY/c
	Gguh9PN1KnV3jktogOlrWOjI2/txEd5NQsHj+mVx2n9ZdKi5Nmu16DhPnPTxMw==
X-Gm-Gg: AR+sD11M4uB9K/XpmooJZSrcYcjAvJWlvxCQJhmIbqg2ibTXbpXyApjrobzorpv4jGG
	QyCk+cZJIY0JaDhkK/2MwUL7bgl4RHm6e1ouzTfOmhAYu0azPO/nY0VSXYM6ZqbkAjSsShatyfz
	cW75KzAT9Y3DF2eLHx2A6fu70EL7ZcDixW41F2KDbAU2xSLMubMxNbskyrv5d+fIPBtp+B2h/OA
	sfCEAJ6UFfLOjUmksiw1SI7r93j6xs/mUDyamMbCObAHBU3jX7Vc12aVlTceYmorbdGhlTELnQn
	Zn+YmNnqSLEhCvhYXkQB5lOPzqh5Kw1t36Bhpsg4RZTSDpgy8kt3oSH81MafPZtupNTrioTbKVy
	G7iKZ7ekeCC8dIuU+ltQSMDs1V/z9UG0bX/uvveQilSDR7UZfdPv3885gmQ45eK1b/27kbnX0za
	ZqhAusxHOcETS78p6cdMNNwe3Kd1t08dL8TomWbDoloGY2f6r/gWZZUNVYzrs=
X-Received: by 2002:a05:6a20:918e:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3cb85e2acc2mr8616548637.9.1785956669049;
        Wed, 05 Aug 2026 12:04:29 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm31787485eec.25.2026.08.05.12.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:04:28 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Amit Machhiwal <amachhiw@linux.ibm.com>, Anushree Mathur <anushree.mathur@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 0/4] KVM: PPC: Expose CPU compatibility modes for nested guests
In-Reply-To: <20260804180705.59160-1-amachhiw@linux.ibm.com>
Date: Thu, 06 Aug 2026 00:09:43 +0530
Message-ID: <tsp8l8cw.ritesh.list@gmail.com>
References: <20260804180705.59160-1-amachhiw@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>


Hi Amit,

Amit Machhiwal <amachhiw@linux.ibm.com> writes:

> On POWER systems, newer processor generations can operate in compatibility
> modes corresponding to earlier generations (e.g., a Power11 system running
> in Power10 compatibility mode). In such cases, the effective CPU level
> exposed to guests differs from the physical processor generation.
>
> This creates a problem for nested virtualization. When booting a nested KVM
> guest (L2) inside a host KVM guest (L1) running in a compatibility mode,
> userspace (e.g., QEMU) may derive the CPU model from the raw hardware PVR
> and attempt to configure the nested guest accordingly. However, the L1
> partition is constrained by the compatibility level negotiated with the
> hypervisor (L0), and requests exceeding that level are rejected, leading to
> guest boot failures such as:
>
>   KVM-NESTEDv2: couldn't set guest wide elements
>
> This series provides a mechanism for userspace to query the effective CPU
> compatibility modes supported by the host, so it can select an appropriate
> CPU model for nested guests.
>
> To achieve this, the series introduces a new KVM capability and ioctl
> (KVM_CAP_PPC_COMPAT_CAPS / KVM_PPC_GET_COMPAT_CAPS) that expose the
> compatibility modes supported by the host.
>

Sorry, but I am somehow not convinced on whether we need all of this
machinary just to get these 3 bits of information, which we are
returning today.

Since KVM_CHECK_EXTENSION can already return an int, so why can't we use
KVM_CAP_PPC_COMPAT_CAPS itself and return the bitmap of supported compat
modes to the user?
Say if the cap is not supported, we can return 0, otherwise we can
return the bitmap of supported compat modes. This will easily allow us
to use 31-bits which as I see would be hardly a problem in the near
future. In the future if it grows - we can always use KVM_CAP_PPC_COMPAT_CAPS2.

This should reduce the code complexity both in the kernel and
userspace and we don't even need a new ioctl then.

Thoughts?

-ritesh

