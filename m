Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C365321B8F2
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 20:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278802; cv=none; b=ijw7NagBDS3W1mTiO7SUhZhK6khmb4m3eDk/BYVGDxEZxXKZhHceYlJzzdAxJtED8EfTp0w12loK88Q8UiJMNfWnahwR/geR+IQSrtYK7ZG7Rq9K+GAPYRLvH06lIr5FzLuZn4Svqkalsd7S+FD2ARKshNbKoWGJCIrIVk0K81w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278802; c=relaxed/simple;
	bh=WigYENNcjq7/m8IhfXdsszpaOXxacvRR6pnDnWZxlMc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ey8hYoJ081QxaNidCgawpMYxTSoXZ0eGrgzgo3BueXaHWhBKrtbgrxGS4jq6B1skFeq++wHFDbjQd+kof+4d93ctEcpGGUSkpQ2cMZAmzxmZ7OBM54M7CQyPdie0WfRDjOUOmaissZJ6eFwmRFWW0tG6fK25iF7b2P9MTMkxLlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R2kex5pa; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R2kex5pa"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-748865aa38fso53031b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750278799; x=1750883599; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=42sjWHF9K9fXhUOTdWTuqVb5UO4E3+WdeqqnFDGgg5g=;
        b=R2kex5payZNZMB1u3qqSivZHkirK8hsSlyRzOZQZi1gu7c30I+jMFJVMwv0zlcNCfp
         iXIzRiAK7b55HRGTAc0s/3SO3bFTIBAlLU7uK+nm5Ee/Cm/zfW3Ci3cJL3ag3a/+8uio
         yEk2yuhQgqSS7YyQmgulY+L6sNb9BwCNfLNau4hBz3iaJuMYhSaa/mv+Kx40++jqjEmT
         6Llb88xpGsXfEnAGG84FJR1zMF4HrBac16RZC6WONtdNqKWOVtYYdTRxN4joFsLdKjoU
         7bCz8aGYViYZfVfZDZsgEMQXu/SvJSXEegwJOl+qstOZz+RJYT+iAAt0YakZQc026UfY
         DlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278799; x=1750883599;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42sjWHF9K9fXhUOTdWTuqVb5UO4E3+WdeqqnFDGgg5g=;
        b=hT9m3HEIh1K7YSa1Q8JErmR9Df/IuXbzaUZmfz1Sr31xQ+LVe03ZSOqPhjFyiJXiFR
         1Ec8dSKwRi4RhFRIB85j6+8rdaCoF8Bce511sCERyY8ylwq6xNFigQ+67UeoFAMlaY6w
         +ARoXd+9Kd3lL53+c6CNcHeRbDIM+hseNzb6kVQZ+FFuDeEv4bCFtKUth+WEQn2+n1/8
         8jYZKAOF5FOv0k1tYdaoQVVxC/qVR7Oxo3RlDAvHYIz3K8nrYgbdPOoxEVEXYcWiuBBZ
         Thtb/x0ftnnLDL3VgKAN/aHTE5DWsjQJIR9XYAeyo1BubwV+hnSs23Q7odXIv9xNnvnT
         liig==
X-Forwarded-Encrypted: i=1; AJvYcCW/8IbmqB2aJ75qkDtFMRy3LDxq+uNjXZtnGeq9/oQE3NDpfYhJYXO9TQNiRD4IqLuZ0udY64I/ry0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUZpIdV1lPdYcqb/yqimP1hJwVV2H3f5vDWIWY9qb1lJVZQEs3
	IGINcoo8kIgJbc67opBgxbywrxslYkg9ajTGGZhv4sIE9z83gm7wIollCGmzerRs06JR2aqCa+E
	ConW3sA==
X-Google-Smtp-Source: AGHT+IEnBs/fyXDZxBhLtmzxgsodc8isEpYWLiF7lsMkgK4GDRL+j/j0sf7eKoTQsS9Mi2OcofOzygboUp4=
X-Received: from pgkk127.prod.google.com ([2002:a63:2485:0:b0:b2e:c3bd:cf90])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:69b:b0:215:dfee:bb70
 with SMTP id adf61e73a8af0-21fbd57ac35mr30705672637.29.1750278799173; Wed, 18
 Jun 2025 13:33:19 -0700 (PDT)
Date: Wed, 18 Jun 2025 13:33:17 -0700
In-Reply-To: <aFMWQ5_zMXGTCE98@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-5-jthoughton@google.com> <aFMWQ5_zMXGTCE98@linux.dev>
Message-ID: <aFMh51vXbTNCf9mv@google.com>
Subject: Re: [PATCH v3 04/15] KVM: Add common infrastructure for KVM Userfaults
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: James Houghton <jthoughton@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 18, 2025, Oliver Upton wrote:
> > Signed-off-by: Sean Christopherson <seanjc@google.com>

No need for my SoB.

> > +#ifdef CONFIG_KVM_GENERIC_PAGE_FAULT
> > +bool kvm_do_userfault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> 
> The polarity of the return here feels weird. If we want a value of 0 to
> indicate success then int is a better return type.

The boolean is my fault/suggestion.  My thinking is that it would make the callers
more intuitive, e.g. so that this reads "if do userfault, then exit to userspace
with -EFAULT".

	if (kvm_do_userfault(vcpu, fault))
		return -EFAULT;


> > +{
> > +	struct kvm_memory_slot *slot = fault->slot;
> > +	unsigned long __user *user_chunk;
> > +	unsigned long chunk;
> > +	gfn_t offset;
> > +
> > +	if (!kvm_is_userfault_memslot(slot))
> > +		return false;
> > +
> > +	offset = fault->gfn - slot->base_gfn;
> > +	user_chunk = slot->userfault_bitmap + (offset / BITS_PER_LONG);
> > +
> > +	if (__get_user(chunk, user_chunk))
> > +		return true;

And this path is other motiviation for returning a boolean.  To me, return "success"
when a uaccess fails looks all kinds of wrong:

	if (__get_user(chunk, user_chunk))
		return 0;

That said, I don't have a super strong preference; normally I'm fanatical about
not returning booleans.  :-D
