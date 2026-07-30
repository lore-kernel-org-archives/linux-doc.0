Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087273290B0
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 18:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435367; cv=pass; b=AZIeyNznuMo4k2a9j3ZmXgcxSVQaxHipNPXW9Op2iexxlXrKmeco4ZnyaF1iyLf3LG5xKBJBAwWWxyjSlIaIJetqF8YcVtb73VjrB8KS6JPW8nnQwMorlbWTawpvT7YeySXf1wqLwHN7J8WhfhrKbFQ6r1O4lJvsYyotQRr9sVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435367; c=relaxed/simple;
	bh=ACnSUSFGOHB+6aR5J0+hOwYkWmGuBgWWNFIJt2FZc6E=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUhyU4fik8TqAiDpaj4aWXwifidB2zVmM9Ju77EmkxSz/xatBT5AQjCEPrg2GOes7CD3x1iIvBXQLYCqmyyTrnTdWyzPY1eCWzoLwwBuR9B2OwDxPOrJQasiu6dxL8uqwMtbsqpQsSGSAQ+T3DLA82vWn5/LPo7NYPrE6GMBMJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uUevmtbg; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uUevmtbg"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso74822a12.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 11:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785435365; cv=none;
        d=google.com; s=arc-20260327;
        b=qkyUnXAP6fdIm5rcyVX4u4cchM/+MTrQOXHaU639wUMmbRRRyiqBbiYHvmk+XBUZix
         2A7FSMVPdVTtGsqf6ks4BlWiWAQafHeV37JBz0+CoK+Kde9GVn2RxiXeZis8Isb4X8SD
         HmEB6Fp5aiFeKSnhUCVZTb9LMmF77FVPa7kAsCZAjkLbkbWZCfsM8GwdUOcegfXAWuRJ
         nAvmTwZVov5IjQ6OEBubN+fGi/uqHNfLQaMMXzVhlyvh5bYDS63WMoNjSJXo+k8uv6BO
         /f5cl2sziTbyen50m+SxyJba0QPAJrE1LN5zdD7ycY9CsQLSFQqAzvjfpaoxIq6gqm11
         hN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=jeT5JD84OLDwdMghWHFJO3a32W5zB/0PvPjAX4B/43g=;
        fh=AJa9jejjEI6Ee2HGpKsyyjdt5De6FmhTYUkNoJ8MPG8=;
        b=C1xmHnlL0MG2vIw/PpE7zQHa90rypn3lxCM70eMmbuk9IMAFgRCvOi0KYvivEQTZap
         6XnIexLygZkY6pmPeCekNQ9nm0DFisyQJ8tCLBX6qvIaxmRp4OZM25ZWcsZrS1sG3XDB
         Zn2X7p3mVHxC7LTxS0TdcDszEta4RgrKESmrPJ199mrnCXWCdxfBpCVZ1TYimu74vpuk
         PU+YJZnfN2Gai6vVrRKIM/XzefhAYN4aiO+jRHoV5ol1B5fNzU6/xPTS1KSPSDiwNqRV
         bdGr8xgM6a/VHIjLrqG8Gli5Imp6H4YhL19UWaI4kk7c8hrIN+Z/hBkVMw7tnqFcYN6J
         wgEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785435365; x=1786040165; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jeT5JD84OLDwdMghWHFJO3a32W5zB/0PvPjAX4B/43g=;
        b=uUevmtbgrq6eb0PEmcfnczE2DsVt2FPLYYzJ6NrvCPQxcRUYMxfi12hjvgEDZ8Z42s
         /Dzi2a6LOW8zOgMaST4PiiSGpn0aP7SUomK4TkBKYyZR3/YRHXYfJns4FFXFnOuqYXYq
         iHxDHCjgAjIzimzymxzjeWT9/rt6t3baHpwqXglQwCJp3lMIMuQZcnUsGC77+NbQQA+N
         6jjaRTvra/0Z/7oJy2Etk+dkG0cYf3rbNlx5QQj3brNkJFXX+XgxO+mD+0bc4ODG21NX
         X4YbqMgGDDYdWevEaeJfBCrPWnsFQ7besi5JdnZFSESUgT7YKHRV13DUcBnEBec8nCFm
         QElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435365; x=1786040165;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeT5JD84OLDwdMghWHFJO3a32W5zB/0PvPjAX4B/43g=;
        b=LjdD88kDCDlPf0Xv0t+k3tS46G41g/1Dov7YROku44iFl1h9B0nNv3E5dA01DEVv+P
         5H15qIrmOfDg/C0DqNim2ThNDiCAisnFRTK575hw4c9YV1r3T+LC5kmhz9h6y8srC7tV
         Hn4RYKMnQE4m7chUe9ylcFQqAPzMJKTa6k1FtuvX0tl/bgfGtxh9yC5aDLibxeX2aNXn
         IBviI4//H+BaEHcodyhf3so6ynaVi4HFV0C8D5eZ43W2/ADbTXwH3PocVTQLWxcIpUyi
         +ZmEa/ty+JzpYNtXe1oqxbSYUdODXGL1tu5BMlq/S65MzWFS5nMJivxbGzCAQCbgAyQl
         Airw==
X-Forwarded-Encrypted: i=1; AHgh+RpxgzSyBm1VLsDrdHkAsbkngibC6SPnTE9ysFdjPplcsa3gifvRbD7poeBWImUAsB7socuXgZNC1fg=@vger.kernel.org
X-Gm-Message-State: AOJu0YylY3xu1BAbzY+nU7aN7ASj8Z8lbmWGO5n+A7fOYAnLkHScuk2H
	vX99SMi5tq+ePqZ31sP6cNoRlp3CqknuCCLn/gspvGZ74XCYq8NjkT0Ob47yfige/FefGrugTk8
	Dv66c+1mr7OpIzDbGMQg0bQVwWKiQT54Qafs4tZgb
X-Gm-Gg: AR+sD12DFQu9k+yA6iZmfvNc6w/maINHtA6Py1HOyslMR4LdvKttupVKPnOcfyqf0c0
	UtWQTKyj2al7t1nSSTH4lIcjV0NvXiQ33+8j3aVxj6El+WIQF/HRvwwUO/vejR0rSGZFdN6L/Nk
	/+84Ng6pAUMYX5qoffvmsr3mzDG9FX1wtxG1I/Uc8X4vNWrqyCKkTof6Rwt+YEK/n3qDS++tcZM
	VMXDZW/6ngsT40pkatvX1qROErStM0JWHz2rcTkdaCRiKpvSI9ks1oCmlNqHFK10M+h1ofpokql
	ZX8govgt0sFTBCxXuEgY9AOQ72hYoCwenFN3uwLlJhCj3q4Y3p/+VB8nNpzUkwXbtSzI7DfY5hP
	PzTqYDJqCsehDhoxaP1FxsHZ7AW1Cfw/dnA==
X-Received: by 2002:a05:6a21:699:b0:3c3:a948:e2dc with SMTP id
 adf61e73a8af0-3c900759828mr3817647637.27.1785435364789; Thu, 30 Jul 2026
 11:16:04 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:16:03 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:16:03 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728121138.1103610-9-tarunsahu@google.com>
References: <20260728121138.1103610-1-tarunsahu@google.com> <20260728121138.1103610-9-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 11:16:03 -0700
X-Gm-Features: AUfX_mwuYQlBmJdhbZSf7MRgmwyNG_KfxbR45Duou2tcQqjIodL3cnnQ31aoSzA
Message-ID: <CAEvNRgGJ0s5Vu8xRvfPmA39p2Bmkr-U7JFFkshM9Dyk9j+t-YA@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] KVM: guest_memfd: Add support for preservation
 via LUO
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

>
> [...snip...]
>
> +static bool kvm_gmem_luo_can_preserve(struct liveupdate_file_handler *handler, struct file *file)
> +{
> +	struct inode *inode = file_inode(file);
> +	struct gmem_file *gmem_file;
> +	struct kvm *kvm;
> +
> +	if (inode->i_sb->s_magic != GUEST_MEMFD_MAGIC)
> +		return false;
> +
> +	gmem_file = file->private_data;
> +	if (!gmem_file)
> +		return false;
> +
> +	/*
> +	 * Only Fully-shared guest_memfd preservation is supported
> +	 */
> +	if (!(GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED))
> +		return false;
> +

The above check can probably be removed. I think the core thing about
this series is "we can preserve any memory that doesn't have any
encryption state that goes along with it", and so the check for
kvm_arch_has_private_mem() below would be sufficient to gate that.

> +	/*
> +	 * It makes sure that no memory can be converted to private
> +	 * even if it was initially fully shared (in-place conversions are
> +	 * prevented).
> +	 */
> +	kvm = gmem_file->kvm;
> +	if (kvm_arch_has_private_mem(kvm))
> +		return false;
> +

For now, has_private_mem == has some encryption state that we can't
preserve yet.

This also gates off KVM_X86_SW_PROTECTED_VM, but I guess that is
intended, since when work is done for preserving encryption state, we
can then test using KVM_X86_SW_PROTECTED_VM, and only then, remove this
check?

> +	if (mapping_large_folio_support(inode->i_mapping))
> +		return false;
> +
> +	return true;
> +}
> +
>
> [...snip...]
>
