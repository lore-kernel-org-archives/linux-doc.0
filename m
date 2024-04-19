Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D645130A7A
	for <linux-doc@vger.kernel.org>; Fri, 19 Apr 2024 16:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713542465; cv=none; b=HuJuS0NlNZZ8z3P41mePXdcDlUuxmlOaOS4GLrRmY/PpwDct8awkU7JgxwxjgwzTtsGg3LGKZOvHXwu8VBm0Vnhy+vl2+LUJdqKqKuaYvRb7sXJ72T2qIpAJ5oWeTs0ckOapokUDfPqdoUm9XQzYZqhKLVzSqUmRJ7u9u7jJREc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713542465; c=relaxed/simple;
	bh=e23FOWubI5VU5i9iHtgcs5Xh6sNhh5JjNy8voR0r/u8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yg7QHJnxeK+N8wiDimpLuasZUzBthbD71wJ1iheiexjg1Bfl5IE1huHsZttu/yqxh+1JJ5gnkyTN3n3fRXWe1aKefJsnET+dUcVbohmfAo+PEGvlqwCRreOz6xJ8p6GBOxc4SfCx6HdY0QgkkcrPZo7zzhPzgHIrwcB6h4w5mDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JYGnh1wf; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JYGnh1wf"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5ca4ee5b97aso1978840a12.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Apr 2024 09:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713542464; x=1714147264; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/8vJG8lgSojzNhQtI7K3ugH96qXtY3LiyZG0TFCwuLE=;
        b=JYGnh1wf8L1ryif5v3dkZiZ5K1Ic8SBLT5FC632alZDCMUlNVb76c65cpWPi5oX9rx
         G8ky+zQZRku9Oa/18G27NnV8Fj2o7BcURP8dmghZvSJ2hH90Se80b7+M8ZoJ6pqLTDE2
         qCVyTJlvlUskRsbsXaHn4Dckt6xLK+p8n4FPbGqBcFqCA39wUzjYmALsqHApl8ipPIgF
         IXKkTJxNc50+wwSmHnyjsnXXyr0m2XQ3+KdlE4ng89SR7PlMb9HTKYVO5uwpe4l1jwgm
         TwUQTnbNNvAVGIiZ1uW2vTFN1s33+92HXyv7x0pOKWw1zJEMU7C69lQhKunQa5JSYWht
         Hkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542464; x=1714147264;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8vJG8lgSojzNhQtI7K3ugH96qXtY3LiyZG0TFCwuLE=;
        b=wbekTgRaZ5IImJXAanfACJq/XW1wcaqV0sk4dqHvKi8HgKQqnKKTJLVrQsNFMkjN2Z
         iUjzEIK3j8xHyRDJLzxmRJho1OIJDO1XgM7aB+4hvcWcXqg12lKhQ9H7Xgft/Xo5cd5E
         uceHzs4L7ot3Qr6a5YdP4OvhGODgo23JNSoFn3Q8FsHuysdM+loGqLyLHZv2T2rekS35
         vAg/9LwCEp6hm2gg2xz4Q1Q3Vyffh76jjNHrVy4qZcsys65hKEKCU6+v+gHKW6QvfSEK
         yUzoEs8MjqxEx7sZZhNteE9KddtR80nZJf7ixVg/4eCB4dscqtZo3Osy7CJ7MyohLEOg
         6glA==
X-Forwarded-Encrypted: i=1; AJvYcCWvp3aIBugthGNZypsNWHyHkWnNxCAFI5j2+frmaL7dRc2cwb2/Tea0QL0iFu+e5572Qxv3L8uawyeNse3Id9Rpa79aQjjMIeii
X-Gm-Message-State: AOJu0Yz6OVoJN+WPhWTZcYwudEq1mhzDXqBxUKipDQgZa7k77+wniQBw
	sP4yvKC4HFFwO3XTngdzgJNvlozkYdwYFTVZcrwgggaNJ24st0KzbOXKBN+m+9ND7fNlqNpm1/9
	2Sg==
X-Google-Smtp-Source: AGHT+IF5+dQb4qDr3/Xd1+TRPxm8QswBlu4ZGfsESn/lZrXPHoIwliRGaj4WinqR7QHFav5A5iYoifgwSuk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ce87:b0:1e5:e61c:35ca with SMTP id
 f7-20020a170902ce8700b001e5e61c35camr215219plg.13.1713542463826; Fri, 19 Apr
 2024 09:01:03 -0700 (PDT)
Date: Fri, 19 Apr 2024 09:01:02 -0700
In-Reply-To: <20240419150033.GBZiKHEUVzwz1LUDS5@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240417001507.2264512-1-seanjc@google.com> <20240417001507.2264512-3-seanjc@google.com>
 <20240419150033.GBZiKHEUVzwz1LUDS5@fat_crate.local>
Message-ID: <ZiKVPoK6qrGRos6M@google.com>
Subject: Re: [PATCH 2/2] cpu: Ignore "mitigations" kernel parameter if CPU_MITIGATIONS=n
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Michael Ellerman <mpe@ellerman.id.au>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 19, 2024, Borislav Petkov wrote:
> On Tue, Apr 16, 2024 at 05:15:07PM -0700, Sean Christopherson wrote:
> > Explicitly disallow enabling mitigations at runtime for kernels that were
> > built with CONFIG_CPU_MITIGATIONS=n, which currently is possible only on
> > x86 (via x86's SPECULATION_MITIGATIONS menuconfig).
> 
> Hm, so the umbrella term is CPU_MITIGATIONS, the x86-one is
> SPECULATION_MITIGATIONS.
> 
> I wanna streamline our namespacing and say, the arch agnostic term
> should be CPU_MITIGATIONS and the x86 one should be then
> X86_CPU_MITIGATIONS, the Arm one would be ARM_CPU_MITIGATIONS and so on.

+1.  That would help avoid goofs like mine.  Maybe.  :-)

> This way we can stick all kinds of special mitigations code - not only
> speculative execution ones - under those config items and have it all
> straight from the get-go.
> 
> And I think we should do it now, before it all propagates down the tree
> and becomes a lot harder to rename.
> 
> Thoughts?
> 
> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
