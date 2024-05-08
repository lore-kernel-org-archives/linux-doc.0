Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820AA85C65;
	Wed,  8 May 2024 13:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715175987; cv=none; b=RkXIBdqGA4ePAX/CA3ZGq0Tn1vtjbUWydljU6YJqfdGQyoP9af9WI+KUsuRRRdewaEUkm+UgvaJmtyZMFY+sM8Jlg2JXmZHBBdc2IWgWdoWf83xzltcnBs6yrA3Ik4n+LfTHoikTrX+V8VEQzWcIMTclZppKDQ9nLKyUqnKzxS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715175987; c=relaxed/simple;
	bh=dAjGqRoaT9PCBPBPK6TW3YXQQulBAMg9zPoOL/ZOKq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qZyJ6mU8z2x9jWcZAx7V9s3G2tfLZcxFwmyLkR1o0CA+XTqlrt8XB9Cz074Mv4/04hG5ZQzTh43nF0btrZmkvSicsItYMNpOvsCY5KSBwzRlDkNwHxNjl/ZwEGm/Ho0RLOyq2/ABhlYqGNL2DwUOe1/gzXzcGoLqLF+w5mS1k7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZGdT5t9dz4x33;
	Wed,  8 May 2024 23:46:21 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230411061446.26324-1-joel@jms.id.au>
References: <20230411061446.26324-1-joel@jms.id.au>
Subject: Re: [PATCH] KVM: PPC: Fix documentation for ppc mmu caps
Message-Id: <171517595458.167543.4513284574842934696.b4-ty@ellerman.id.au>
Date: Wed, 08 May 2024 23:45:54 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tue, 11 Apr 2023 15:44:46 +0930, Joel Stanley wrote:
> The documentation mentions KVM_CAP_PPC_RADIX_MMU, but the defines in the
> kvm headers spell it KVM_CAP_PPC_MMU_RADIX. Similarly with
> KVM_CAP_PPC_MMU_HASH_V3.
> 
> 

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: Fix documentation for ppc mmu caps
      https://git.kernel.org/powerpc/c/651d61bc8b7d8bb622cfc24be2ee92eebb4ed3cc

cheers
