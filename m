Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4013C5522
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 16:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785948383; cv=none; b=h12GmY4h0VEIad7lf1USBxf5eLpY0EfBJb01mooXY7oxE+AMg/MYOB/vRFTb/TkX5NbB/tSKxvfeRunoQED1h4foDgSyLWTmtXwlhod45dMTWpVEwPZOxs2XFXo8yC/4hrrYw0K9L1fuDc8Lo0igZsj+ZAJJbs2YaEXv45Bvdck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785948383; c=relaxed/simple;
	bh=aRFrqUN+ys2ZYQHocvx1aJBeXMwsKb+9fc+tByK+eQ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=DQP3rtgIZnShgFgMelm1kgwOaP50WbCjFf0PWD+IH/wXJMOSGUZramdKz9eVwQa1JqkObb8vNqJfwN0MPVTBJKIM7K+UmnCXXOIfZJ0EuR/GYUWhK/tZRqFwCWFMqj1ZjGcEOq7qkKslXFYwhwtOGd/+et0au5HYm0ZzvQmvzIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q+/Lu6mO; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q+/Lu6mO"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cacf17c7e0so17227015ad.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Aug 2026 09:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785948382; x=1786553182; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhbfADIsQOFDkBqbOOyKHONLz1IlESISmOlN2gbL2BQ=;
        b=q+/Lu6mOj2iErMJcwjEMJMVhy8TJ1+ZwBGjMu+HbO95o+xnqWpujACVGHOpkYt0LtT
         ZkzfDOn6dX3W3sK0o2HoG5WFXdlOUtJZ5D5/uHrj6B/jGLAeKabgn8PyV2sHdxSlBZBL
         d5iybkWcfMUsQWRxrEvulHRNczHYf+xdHT9QN0sTrKJ2i8mqmPczsC6WUEHyjYJLdJIT
         wkXHLsmaMPmdqE/wcasCwUViuhlmUZl+uCBCHG3NyckHYkXv6volR/Gy7t/ilpbXU+Fr
         O6C/a1OLmyDAtZSzQY5vOTKoAT+snxvgr84FdPTHgGLGNHKDSqL1bSQH27UG++LD9YB7
         DpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785948382; x=1786553182;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QhbfADIsQOFDkBqbOOyKHONLz1IlESISmOlN2gbL2BQ=;
        b=WAUIqtYyY7yWdGQFQVZkwF/0R6DVXytKZEoS80e/dr6KMdo8iG/LHsj4nxxIGKgyUH
         Ryr4uBBqQcZx6RAs7oZwQKRIIUvnQ3kXOvpHEahxxaEM27Iy+3SmpzvEzYiqRkOuYC7g
         /E31vj+6bflp9iP/IoK1o3rWHP3aWQ2K6sA97TvCt7CHjpbygJCXFL+VANL80p6r+cV3
         TQGPbXD//0vBa1yLZTJveAQRu2WMeU6a7qy5leIJmrbSJ9N+FwWKwR7438sfLSiGbQuj
         dxhCDGki2zcQVP8khhSfn/TeqzmmSXdJJZIxx0R5+/rs9seGN+qimU038Y9iQ/qVfC5s
         t48A==
X-Forwarded-Encrypted: i=1; AHgh+Rq9t/czc4umc0TzrBaOUwyY0a1IzX2uijAd7tijvt1u3KpEHAmZIkpSZfiahaaD+kbybvcLYrbrN/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKNN0N89UYA+mDkZOraayBaw3KQwQZbKvaaEBotG2TkIvsSTuF
	Xxt++f5UlJ2YG1vkyipkA9foB/Hn73L6B3TBd4MQwnup/xO0MdF2ONIOVuQ9md6eAbm3IEZn+oW
	i04keFg==
X-Received: from plow7.prod.google.com ([2002:a17:903:1b07:b0:2bf:195a:2b9d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3201:b0:2cc:307c:51fc
 with SMTP id d9443c01a7336-2d0ca98151emr104330445ad.21.1785948381434; Wed, 05
 Aug 2026 09:46:21 -0700 (PDT)
Date: Wed,  5 Aug 2026 09:46:05 -0700
In-Reply-To: <20260708133856.302151-1-twiederh@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260708133856.302151-1-twiederh@redhat.com>
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Message-ID: <178594806751.3634481.2205386521610155422.b4-ty@google.com>
Subject: Re: [PATCH v2 0/2] KVM: x86: Document APIC base memory hole constraint
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Tim Wiederhake <twiederh@redhat.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 08 Jul 2026 15:38:53 +0200, Tim Wiederhake wrote:
> When virtual APIC access acceleration is enabled on x86 (APICv on
> Intel, AVIC on AMD), vcpu creation installs a private memory slot at
> the default APIC base address (0xfee00000).  If user space maps a
> memory region covering that address, vcpu creation fails with -EEXIST.
> This is not documented and very puzzling when it happens.
> 
> This series documents two undocumented constraints:
> 
> [...]

Applied to kvm-x86 generic, thanks!

[1/2] KVM: x86: Document that KVM_CREATE_IRQCHIP must precede vcpu creation
      https://github.com/kvm-x86/linux/commit/d82d77c6430c
[2/2] KVM: x86: Document APIC base address constraint for in-kernel irqchip
      https://github.com/kvm-x86/linux/commit/99607da19b66

--
https://github.com/kvm-x86/linux/tree/next
