Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8653C2775
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 18:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435145; cv=pass; b=adk8z5F4h4Peme6fDz3jbi3Hi0HstMzvf1jRxnVfgjmlAKI5KqGx2O2HzG2vMMhgA5Wyecwve9O5i8NZsyYVTdMgoZN9yEmbF/ssY0REYpdXw+70b096O6WW0564s/Vo2NhNSO+4DD7y9DSCE4HzOzj0j637ifVM/48xTsop118=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435145; c=relaxed/simple;
	bh=TfIMwScvckB1Fib5Y+wsX3mqgKnQULjNLMCYcEOof2g=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JORhcPSYmqm1LrcI2zIdK66BWXsuApjlOflUHbSZn2sKXCaclgBsuRo//VCoL8cMUJmYsw6GOIgvJl/pqJukSbX2uchYlN2ExtUIKAfElzzMMmI8N/N705yihn0E+Tj+qESOEsGvfADFIb4Pr8TsgzTibyyEgtVL6CqTuqCj8jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uF91zuAN; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uF91zuAN"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so182649b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 11:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785435134; cv=none;
        d=google.com; s=arc-20260327;
        b=M1UfFQIHcLggXKMKnrMxWKHcV88l1n2WrnETjKiDxm+IFaCZkV9yutP3Fq0nxYYjOM
         XV34+I+59LEf1wsOzNRcoRm8wTT98mflfxFY+/A3fo1+o2jkgvKxdTFkCJnJ2BXqaSkO
         71zmmBwxP0JJ7t8AXaQ0sZ7xYjE0rEZpE9GkjCrEaUgRyprW5mYQoDE+U39XSeRt2pCu
         hrS+MJm+phmVe5z/K8rB4leINn/mKgcnMW3B6BnfvBXL0WKirX+zhYVvF7YzcnFait7R
         LBXCSX4213ywXTLJh6eR2oEw1KCZfe8oBq14rLikJu9u0fA2ihe4smU9pnwP9UCq0dS/
         Q1CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=gPvFSTghJ28Kixi5Kvwbbt6p3THpZRrypXj1JQIqIto=;
        fh=QD4APlscYLNtg8J1lN3WVMMS2gkAdfI/f6rn783lq/k=;
        b=WLshdGGPRhoRHw4aPTcIOrEKz7s4uKp0F/tMUTneXt/PMHkmEPG0akz436idn890VM
         w+wz2AtvKBkN47t7oMXRXRpkOrGRtQfjq2njX3RADVpM5zGHEOWJDvOhZZNWSHbA63nm
         kp9ENlqZbwZb/is9bByymvcwbe39W99puEVlS3rzMT+rVfgjn5HWKLRl8Sb5xSPULi3+
         aAVpjx8Cxr6/RxIlDszlszwO2l4Beloemf9WFQo9y08kxq9qhlgAXuCBVTPEao55ETBY
         1RPl8cJ8jOLyeOypCUInesbm7TtOLCXf/BLAs1SoF5JyxCyU3DERarXVsFalJHU59wmQ
         g4nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785435134; x=1786039934; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPvFSTghJ28Kixi5Kvwbbt6p3THpZRrypXj1JQIqIto=;
        b=uF91zuAN4E52hdv7rh5ePXW5IbE21BmQyOaLbedFouQNsSbV9KuoJ0tX4AkVWtRDjb
         JbMNO6qgTtJXtJwUXcYMpGigwjyCKv/8ASC9KiKkp4WywqK+muw7YUGcf+zcD3nAB1Kw
         Sh33C1d4YCur1zwK5LwbeboW5N+kIptKOXnJdzasF6sL44NEwIg5WF8wjcc6Lblzs/XC
         6BibsrvKm6LZ6+p/cUor07EBzr8p8eNO2VGQaHi3e96wuG/tw5hC+CEYRP7OwqxiVweh
         1BwVmnHf9ZlKmp/mymp6a8k2fXq5xA7Sjg2QtEn6pLrPUU0R7DCFrEZdD1tuxMyeDkkp
         ZOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435134; x=1786039934;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPvFSTghJ28Kixi5Kvwbbt6p3THpZRrypXj1JQIqIto=;
        b=iH4kzpHNAvmWF6WTlr5VY5qyiq8AC649eTPi3btdDtYi4CzSzGmaXoDZJxB7XFxcmF
         Lqm5bRVtlF237bf5KqGQ8qvamA75xyUqydnZRbj7u5Wor60V9f6U4P/0xFVoC0WIwRIL
         CbYyHMGF9w+sYDlf0HqSicFSOlKBWOX7tNvK9/JD4/KOyV6/9UECjqMbHXOoOg6jMi8D
         6OFFzvu+/3j7hH/wmwNovZHrvTfWgQqjwnC3DiaLHuGplXigCtvsJYyOeKxpmISx60BZ
         8JOGjYdx7JuYYYucpw3tN1AKOx8Pl9LJHBllM8RW9PbHERL+Nc9RaOEca2GejZ3y/6yB
         7z0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp2SI/mPxgqEgEw9jluYXQjDbIMAWXu7RtDmDrZpN3zEL2iXxPf+UD7jSuQADkfBJxaFpjzZhu0zUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrvjFYUQ1gjXINgoRMIJLnwFh5bb2J4yprq5EFInfk2SUUSfnd
	1r6Tp6Ac2A0sadCj5L9eggeQ1+XCJfrsWCb4I1rbWc0+3Mjw5tJFWrOpWprZbPvZpCrzHWXXpH+
	J+LC6DsSRSFjDSKe4ui3u/UU324JZH7/CylVSd3Bu
X-Gm-Gg: AR+sD1123H6LFvcGcx7fJ5SFsMJENddZi6CbC+bvB/XBodD5N5HMWDX1IIshF+E79Qe
	cLC+QAqip3q2RMBK08zhQxOqLmA9dyXmHLs2wA0klfF1ZGW2vXs8VFl01bJbD2ENUuFt27qABb0
	uG8wuQZ2hfPWp4leLvsdtyLPhB5zeUD9deXRnyCW8S/MuPjuDN7O8f0iJPTg4dC5VR8ia84YRlT
	PaStGKkrR9Fd0lA9JutpPMCJc/hiicpQHwBXAN6AvB7CBvzC9NV+py1t+Qh0qpVeQLX9jVR9ebA
	1S6gxG0Z3FujRHVvedLjMzriCezDL37kYrqsjrLzQRBov8fBEuJSWSuGSI0wmCbovxb7ME74dmf
	QaLqpIYEUeODEVFi2PzQolVzRG/cywAX8WQ==
X-Received: by 2002:a05:6a20:7f95:b0:3bf:9b61:f7ae with SMTP id
 adf61e73a8af0-3c90046cff3mr3701207637.14.1785435133085; Thu, 30 Jul 2026
 11:12:13 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:12:12 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:12:11 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728121138.1103610-8-tarunsahu@google.com>
References: <20260728121138.1103610-1-tarunsahu@google.com> <20260728121138.1103610-8-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 11:12:11 -0700
X-Gm-Features: AUfX_mx2gL8KIE-6PLoUtXVMOZbkrQaxrGgfvvgdayE505KQfySpbra5kxUa-V4
Message-ID: <CAEvNRgHW0P78eL0ip799XF+2geKwz7MQrjSFTgvCdUAuh9oykg@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] KVM: guest_memfd: Add support for freezing mappings
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
> @@ -273,16 +284,30 @@ static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
>  static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
>  			       loff_t len)
>  {
> +	struct inode *inode = file_inode(file);
>  	int ret;
> +	int idx;
>
> -	if (!(mode & FALLOC_FL_KEEP_SIZE))
> -		return -EOPNOTSUPP;
> +	idx = srcu_read_lock(&kvm_gmem_freeze_srcu);
> +	if (kvm_gmem_is_frozen(inode)) {
> +		srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
> +		return -EPERM;
> +	}
>
> -	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE))
> -		return -EOPNOTSUPP;
> +	if (!(mode & FALLOC_FL_KEEP_SIZE)) {
> +		ret = -EOPNOTSUPP;
> +		goto out;
> +	}
>
> -	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> -		return -EINVAL;
> +	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE)) {
> +		ret = -EOPNOTSUPP;
> +		goto out;
> +	}
> +
> +	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len)) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
>

Continuing from [1], this guard is actually meant for PUNCH_HOLE... I
wonder if there could be a deeper refactoring to check when actually
punching a hole, basically the equivalent place as kvm_gmem_get_folio()
in the flow of fallocating.

Will srcu_read_lock() be taken in a nested way for the fallocate case?
It can be taken in a nested way with some intricacies, but maybe if the
freeze check can be done just as the folio is about to be removed (as
described in the above paragraph), it would avoid this nested locking
here.

[1] https://lore.kernel.org/all/2vxzzf0kl3dt.fsf@kernel.org/

>  	if (mode & FALLOC_FL_PUNCH_HOLE)
>  		ret = kvm_gmem_punch_hole(file_inode(file), offset, len);
> @@ -291,6 +316,9 @@ static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
>
>  	if (!ret)
>  		file_modified(file);
> +
> +out:
> +	srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
>  	return ret;
>  }
>
>
> [...snip...]
>
