Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452E4348895
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 15:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772638769; cv=none; b=C7kyLh7dMcYhVlNEb4Bi+8bjjYgTMgt0l2TlrJq2tsRj4J5f6iBvcZYL2ip0QZEOctjktqLedZ+TABr0WC5bGt/z9smq1F00zkCcG5rT6R+i6PYXLPNPX36/aBzaqHNPXSywYRy3ARmT+6rLKl5fcJMmW9Pe5bkFDyh224oWgQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772638769; c=relaxed/simple;
	bh=AwQySQ6RU/E0+QND+fYEQvAaI0LFcEIbgSecZ8phsbg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QJ8J4BgieiAbFmn1AsVBSE6Pa25FIp1WOlFy6zKYQSaOKW44f6LrVS+U6QofwyPPQc8YRdB94a/qf7Sg8MqtQmdtH7d3bYjue0k+U42eiSgV6tjezJEgHuHonXgUxIUvSxjExozrkeY2V49OzgEV+I65j6Aj8/JjK5IAJWMLNYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gDq38F3r; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gDq38F3r"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b6097ca315bso31695756a12.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 07:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772638767; x=1773243567; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4obgg0pL0Jwl8Tcok03QPH04x1vAD8j3dmd1EmRfQ2U=;
        b=gDq38F3rsuckH0rPx7rhpJFYxvQ6WBwP0N6fJCqdVi26RQZxk4I7JoW5g9SceqoUR9
         5iihYF5ntaRW9pamVgpgtiso38tLeDHyYRnGntMqTjWGN35G5Kx3SFRMXmyvUUiu1T7B
         yCYrZCyo1PdH8TpFTcDELiwsuT8IfxB1CgoXxdHSuIDPfHrReqlLG5ipwlL71L48QYaJ
         e4gETHY5c2rbmvkikHZFOmIAAoHLuqVIKJBgHtUWk7oL/z6OhCxHp4rJ62pxOhggnIfU
         iqQIm5xa31TQNRyEjb7iBH4eXrfn363JYDAKXF5d4/gvEQgnq1KZ+h/yBtDrIdEfwIgN
         Cfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772638767; x=1773243567;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4obgg0pL0Jwl8Tcok03QPH04x1vAD8j3dmd1EmRfQ2U=;
        b=X7EYM2RwNyNINjzZ8tpuAbVJ/YHKTT9ly+MSYPxgAyxzFJv1y+3nI2nc/dT335C+Zw
         Q6qGOp3voILasbwkMVNgRJKj24Ks0XCxArHuRfUe1W7jTW9DvhENp4poME4wYPKGGFjx
         JdmEAKdbyep+8lkeJ5r2FB/zJyxeqawjAqGaFX5aVm/kNLvAn2COgOvPLSg6Er/rTWQq
         MBA2oInXAkj9W0LE4nhPxi/ftAJIGvGF7uPwZNZ/3PgveaZvIv9oKifcwS/WH2nkbjnz
         ueVDYAkWQT22uZ/76zYWTR2n3HaPIKj3tDQSb1EJ9v7WEYfUxmP3QVf8nGHkeaVOEzBr
         x6oA==
X-Forwarded-Encrypted: i=1; AJvYcCVHvVXDq0/fWimfRoaV7Q9diyeEBkBotA99tX+gZigmJqYVekad9Kuzv9vx4xswZAmt0nAA9W3nTBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyyhtPc2Cf/8KVfbbsqrheiZLVVLS8JLfnob0jTAnjw5ATx680
	rZR/lwHOPO6/NDAEeq2mUyFUwAEj8LHxLLUuOUqSG0eHpu7CgJaIxAnrx/AKEUMGZEHhSO/kWYT
	ufgpZfQ==
X-Received: from pgbcs14.prod.google.com ([2002:a05:6a02:418e:b0:c63:5306:c11d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a124:b0:366:5d1a:c737
 with SMTP id adf61e73a8af0-3982deccfb6mr2418979637.16.1772638766352; Wed, 04
 Mar 2026 07:39:26 -0800 (PST)
Date: Wed, 4 Mar 2026 07:39:24 -0800
In-Reply-To: <20250806215133.43475-2-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250806215133.43475-1-jthoughton@google.com> <20250806215133.43475-2-jthoughton@google.com>
Message-ID: <aahSLC2-KNA9zC_F@google.com>
Subject: Re: [PATCH 1/2] KVM: Add fault injection for some MMU operations
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Akinobu Mita <akinobu.mita@gmail.com>, 
	David Matlack <dmatlack@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 06, 2025, James Houghton wrote:
> Provide fault injection hooks for three operations:
> 1. For all architectures, retries due to invalidation notifiers.
> 2. For x86, TDP MMU cmpxchg updates for SPTEs.
> 3. For x86, TDP MMU SPTE iteration rescheduling.
> 
> For all of these, fault injection can induce the uncommon cases: (1)
> that an invalidation occurred, (2) a cmpxchg failed, and (3) that the
> MMU lock is contended.

...

> @@ -689,7 +691,8 @@ static inline int __must_check __tdp_mmu_set_spte_atomic(struct kvm *kvm,
>  		 * operates on fresh data, e.g. if it retries
>  		 * tdp_mmu_set_spte_atomic()
>  		 */
> -		if (!try_cmpxchg64(sptep, &iter->old_spte, new_spte))
> +		if (tdp_mmu_cmpxchg_should_fail() ||
> +		    !try_cmpxchg64(sptep, &iter->old_spte, new_spte))

As discovered internally, this can cause the WARN_ON_ONCE() at the end of
kvm_tdp_mmu_zap_possible_nx_huge_page() to fire, because the flow *guarantees*
success.

Thinking about this all a bit more, while I *really* like the idea of triggering
uncommon paths in theory, I'm having strong reservations about enabling this in
upstream, as I'm worried the signal:noise ratio could be abysmal.

For many configurations and setups, mmu_notifier invalidations and MMU lock
contention is actually quite common, i.e. in the aggregate, KVM actually gets
good coverage of those paths.  Giving userspace a way to deliberate induce retry
for those cases doesn't seem like it will add much value, while at the same time
it could lead to a rash of "bugs" due to e.g. syzkaller setting extreme retry
percentages and manufacturing scenarios like stuck tasks that can't happen in
practice.

The CMPXCHG thing definitely has value, but as above even that is error prone to
some degree.

So if we want to take this forward, I think we should limit it to CMPXCHG, figure
out a clean way for callers to prevent failure injection, and set a fairly high
bar for extending failure injection to other areas.  E.g. as was the case with
the CMPXCHG injection, a real KVM bug that is extremely rare in practice, but
relatively easy to trigger with artificial failure.
