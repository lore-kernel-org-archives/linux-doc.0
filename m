Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047946;
	b=s3xwZYc24JJKnYBrQRY9RMxKNJT53Yzr+tEqEuyeWqUsAFtGcvpe+H5AuYYqbA7m5/ba
	 vSEknuFZ1rgeDR+Rp3MNjp2UOHbJ9VnxWq3cqreWRGgf95inuJfO9byD8HrLKcCJB0J/D
	 XVRWR4N3D2i52BKyiU5zEAHCA3mFBr3ZE43Q1au9HrrQNqbSS+RaQb2GtZQUqXavKGuFa
	 CF+KQJKTYGNqUL/M7O2KTffjcNd+5Xxe15E+tjeoJNqwEcXOl7DTNUfFVWFxP/j8XAt2+
	 twnSmeRJlUmXPJb9OH8Pf4Mb2H3nxHhKRYVFUQ0coIixKYmGC9QH+NJBilc5ivu382Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=yb3RT/dSHycHHUvHrQYfX0MzmZ7Zlc0xT6PVwRVG2IA=;
	b=myHrjoPUdcW/kS+rpHJ3s6FtODWu4AGoy+fJBJq1wtok5Zunqnn0nYoyMHsapiO48Q4Y
	 zcOhhJGdKxCEwus8kaiRLpSv4B1q1H2Cr9DEpeob6TA6iM70xCGqZgxPflN0FwQUZS0Dj
	 lukd0fjuMHz36VBKqxjykrdKNCfN/vZK/4+bLUZ6yUUyDqvaqbfB7wghwkAlb6TiZrTsA
	 sui7Egu19RIQopJXDWj0xUjGVCtxIH5127C6/IR0ZFGTjHPKrnXNvzHjlel92J9P9EzdW
	 XwWptxqmifC0IjrQn6oLqEVIPjTWnwJ8O+W45bpjzR5FAp4kdTxZWgZiLii9zwZ1BkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VUzzRT1P;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2759C606A332
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 00:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2759C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VUzzRT1P
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab4f652f9bso1158903b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 16:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795047944; x=1795652744; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yb3RT/dSHycHHUvHrQYfX0MzmZ7Zlc0xT6PVwRVG2IA=;
        b=VUzzRT1PmPN3kH/c5HD5qxg23YbKceVpVl7CPJfi+KdLeS+giLCoHmbo8TeKtLKScO
         4M+h/q27Mc1BJm+qXrZzLChZ7Jay16UY0fuOIPg0LSSY01/l6RPxGRyiO5Cf022TUr4f
         NqNygd6qVz76Q1ennc949Z/jfRVOM+uQc4kDStu6gb1KA1ibwjKEf5D6Xr9kxDP9hqM+
         84jm9VV38N9kQ5om6sreRHX4BiEQfYGGyUW8pxu/mj57il7NS2aTWOHjJo9YIv4yLiLi
         8ruKnViQKijKVdHUpz2Wp/g7k5CYbNIwKI93rKmrhMayqMFvwaNsAnxv9xRwBunbZQFZ
         aNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047944; x=1795652744;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yb3RT/dSHycHHUvHrQYfX0MzmZ7Zlc0xT6PVwRVG2IA=;
        b=ZMwdjTihR4cAkiZmAoT5CIii0Q3OoFWhq7c2H70pAjkpbjnhBRY5bCtONA5rZkwlcp
         Jcb6X7h0xS5VWQmlVBjdRpNOt4TknJiqgZ6ijN3abjwhR/PdNG/Ut9zR6+UDS8pde9Pr
         HhmFxrMwL67cypuT/4mi0fIwOF3d6jP6k85xZLg8fLepyWAAOVkn2i5rCcrHsgx7uc9B
         TfJv7CGX+Vk8TbYJY4umb1c92hJCcTe14BWrMchXnOTNwjhDjNpTltlup+3CoETmFVHb
         TPptFfIfZu2ZoBigam3GAXFLRCSG2W6QAOCQR/P+gHG1/CXVDfITs5mQovy2V01jt8/+
         ftZg==
X-Forwarded-Encrypted: i=1; AL+hErE2ryabulav7g1RRvVK6o//GI5WmlgYt4s8soG2UHvTlUY5NUliL+lr1mLKW87QETQbCwgoijAnVXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8K3kpkO5GmhRCTtRpL2zJD+ilQ2mHqnmp8EQ6ff8DtHaZTW/Q/
	qAnp+DAiaOtF0mCbU+ys6KNPoOyVDgwEwMXIs7w2g8b2fHomejhM5LtdSgSs/TUUd6wZ2G7xcRE
	916h2zQ==
X-Received: from ioru16.prod.google.com ([2002:a5d:83d0:0:b0:9e2:9e82:a2e1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:250c:b0:53a:8c5:d7de
 with SMTP id 5614622812f47-5773db2428bmr4568078b6e.1.1795047943693; Wed, 18
 Nov 2026 16:25:43 -0800 (PST)
Date: Wed, 18 Nov 2026 16:25:42 -0800
In-Reply-To: <CA+EHjTzUrDxLSMEo6X66XhKtQ-=ew3zZhMdFWR6U9Ga17WLWkw@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117074428.7544-1-fuad.tabba@linux.dev> <20261117074428.7544-2-fuad.tabba@linux.dev>
 <avxfgWNePsGPK9mm@gremlin> <CA+EHjTzUrDxLSMEo6X66XhKtQ-=ew3zZhMdFWR6U9Ga17WLWkw@mail.gmail.com>
Message-ID: <av5CBjbeidUUWiLq@seanjc-mac.roam.internal>
Subject: Re: [PATCH v2 1/2] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's
 dirty ring is full
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 17, 2026, Fuad Tabba wrote:
> > But the overflow bug only applies to x86 (see below), so is this something
> > we should worry about at all?
> 
> The ring overflows on arm64 too (below). As for exit_reason, I asked
> Sean about the arm64 MMIO case on v1, and his answer was that a VMM
> that pre-faults between a KVM_EXIT_MMIO return and the next KVM_RUN
> "gets to deal with the fallout" [1]. I think the same goes for riscv's
> exits.
> 
> [...]
> > > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> [...]
> > >  The dirty ring can get full.  When it happens, the KVM_RUN of the
> > > -vcpu will return with exit reason KVM_EXIT_DIRTY_RING_FULL.
> > > +vcpu will return with exit reason KVM_EXIT_DIRTY_RING_FULL, and
> > > +KVM_PRE_FAULT_MEMORY on the vcpu will process no more pages until the
> > > +ring has been harvested and reset.
> >
> > Maybe worth mentioning the exit_reason thing if we keep this arch-generic?
> 
> Sure, I'll document that userspace should complete a pending exit with
> KVM_RUN before it pre-faults on that vCPU.

If we're going to do a documentation update, I vote to keep it vague and scary,
otherwise readers might think the exception proves the rule.  I.e. if we say
that KVM_PRE_FAULT_MEMORY isn't supported, then userspace might think all other
ioctls are safe, which is most definitely not the case.  E.g. something like

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e95c9cda085d..45dc1e3c0b03 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6971,10 +6971,13 @@ to the byte array.

       The pending state of the operation is not preserved in state which is
       visible to userspace, thus userspace should ensure that the operation is
-      completed before performing a live migration.  Userspace can re-enter the
-      guest with an unmasked signal pending or with the immediate_exit field set
-      to complete pending operations without allowing any further instructions
-      to be executed.
+      completed before performing a live migration.  In general, userspace should
+      exercise extreme caution when invoking ioctls other than KVM_RUN prior to
+      completing the original operation.
+
+      Userspace can re-enter the guest with an unmasked signal pending or with
+      the immediate_exit field set to complete pending operations without
+      allowing any further instructions to be executed.

 ::
