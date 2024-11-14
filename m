Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62CE18BC1D
	for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2024 23:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731626233; cv=none; b=giH6D27K6bPh9QBieUYV1XWbPgrHQNszGjavNMrtm5kQFG8iqefb5JREdqUvwbhXJYd1fYZYG2E+9mONprBWP5kGUejKMjQ5eigOvVUQF9S0WaR0fXYuWqFK/QhYJFp5Nb46fRKTfYhC+FlFGz3kPh5n6dK/3FzLwuamfGNIZjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731626233; c=relaxed/simple;
	bh=CI1r12nNHRwypDsUYC8xY9fzjewA2c/mrZsbdnAEyB8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OjoBTo+OKji9y0R+WvVjJmXLSKNlj2nRvl0bHXKbfqwe+ZQTg5Idgg04X7KWF3TYbTEAxbGyCGga4PapPKJ/3IoaDVcwZci76Sc34GYSH/5QIQ0+PudIUhSA2I1uDE99Iq9/3WFLnge6auFVQfNuOoKk2Q96WvC5Rc/Od0Kolbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cie8v75h; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cie8v75h"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e380f7bcfbdso2064087276.2
        for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2024 15:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731626231; x=1732231031; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vwAzg/sQCaKfbfUxYjkIW4dK4mXFdPygldw0DR81bXI=;
        b=cie8v75h4JigBi3C9ayjkHTv1bcGaPALHy4DUS9KhfM+MJgpMavda4mB3jLzUDkXv7
         qRdyOWKgMc24sTK1gH/GWzmL3SSUHe/TEQlUhb42EUe///VOIW3hXvylnaMkwn8BB8tl
         37W0ePhSDYbJHX8NBCgX9BVK7XYxY2czsMMwe7TIjbHMMJKqOvLf+1kfD3uY0w1fvZDG
         0Mss+KFHOKqueFy9yoP/p/TGwjoxC5VXQf7yDYNcGXRfsRMc1KXOqfcOFKFojeAm/byJ
         phzV+1IrrGVIhVZylYua8kEF7pc11Qjl7ub/3DNRE1D/h4dseATKp0JAdbgKest74s5z
         7v7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731626231; x=1732231031;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwAzg/sQCaKfbfUxYjkIW4dK4mXFdPygldw0DR81bXI=;
        b=jpiXim23QHWI870hO5osWZqRl7JGgNzq/wzPAfxrB3jMNb0ngcxsT5DGuwWEEfeeiz
         ILuaWE3oZ54rpDgREL6mFdYaCs5ORNkxOBX9QUxstCJziVFlhq7SiJvDwMsqvNJog4ou
         krIGDoClY5uJvRFo0IBHq4gCQGlKAy38CJU5qFnWWg4ZZw3jRpSsQ2ihA55MdivIClSa
         rGo0hFWUYKANeJhSkuDHoBV53Rn70AtmYNgon2cAIiT9gzxlvJhTC7HE8E87FI8prfIN
         2ezpqIgFlE1w7ygZG0ufmDOjTCg2fCpbPZ+XM+YnaR6CA6Awl0Ec6uOfL7dJJY1oigf3
         uXuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiwmTSeDCHfwNrbbJWWyympUufHB5OS9FZntXA6VuE804zqRgTRIMg6pT56i8y4zrDOs+Sp3PKzt8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1LSM1DK/uCH36nRwqdIOzVmOwGzQAbGRxECN0Z3Uq5d4xXgEq
	uGQ9T/eKMU0mUcFoQisLitA1j7ZZYYsYVuxe+6/GD2HYjcRT7cDKRt/0HpxliFn2hpXRvb/Ha0J
	Mdg==
X-Google-Smtp-Source: AGHT+IGFlgWX0KKA/ZGZ5IsWUoPGyuuB/g3OCmrsFVhtApZPgZzMWdFLLtgmd2LXV8EXavHvLHIIovN59Bs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:9e0a:0:b0:e38:e8d:2c02 with SMTP id
 3f1490d57ef6-e38263a8b74mr588276.5.1731626230833; Thu, 14 Nov 2024 15:17:10
 -0800 (PST)
Date: Thu, 14 Nov 2024 15:17:09 -0800
In-Reply-To: <20241114223738.290924-3-gianf.trad@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241114223738.290924-3-gianf.trad@gmail.com>
Message-ID: <ZzaE9dYmSqg3U33y@google.com>
Subject: Re: [PATCH] Documentation: kvm: fix tipo in api.rst
From: Sean Christopherson <seanjc@google.com>
To: Gianfranco Trad <gianf.trad@gmail.com>
Cc: corbet@lwn.net, pbonzini@redhat.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

I must know.  Is the "tipo" in the shortlog intentional? :-)

On Thu, Nov 14, 2024, Gianfranco Trad wrote:
> Fix minor typo in api.rst where the word physical was misspelled
> as physcial.
> 
> Signed-off-by: Gianfranco Trad <gianf.trad@gmail.com>
> ---
>  Documentation/virt/kvm/api.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index edc070c6e19b..4ed8f222478a 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -5574,7 +5574,7 @@ KVM_XEN_ATTR_TYPE_SHARED_INFO_HVA
>    in guest physical address space. This attribute should be used in
>    preference to KVM_XEN_ATTR_TYPE_SHARED_INFO as it avoids
>    unnecessary invalidation of an internal cache when the page is
> -  re-mapped in guest physcial address space.
> +  re-mapped in guest physical address space.
>  
>    Setting the hva to zero will disable the shared_info page.
>  
> -- 
> 2.43.0
> 
