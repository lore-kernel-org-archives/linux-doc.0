Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823101;
	b=wxI3TfBisegKWLpBssZ45QwlzOJW1VdWJ/7yDkpqBFjSHmeRGUOX0876LfVS0lso97Vs
	 iu6LvWkcF9jhM7FGy7RYqM4Uj5RS5CYOqqBoNYNGsW21ImHDv6tNvGWcvbe+dyC3FREuN
	 XTmMZvSFlY1EetN64NISzjIAVCPivMzLWimHSS30Ht99v4gqAuu+knRNDjKCa7Y55W9ZZ
	 Imax74xXKiaE+bCkDAG+uzMTw552+TaDKsFbGqywum1rDZzes5hy4kf6Sk4rV9BKWvnIE
	 ADetoS9NBSL0Oj4ikuTjS6V7YarbbxjUoMCQHIbNYltBBiN3JmIWMM+vYqod78IxpeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823101;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Q0MVmf4IpYCilnXIvfcMMwMLhYICnhyuqiHiEkoOO1o=;
	b=kk3ux/ZtMe/LSYpZf4+V7hVvzDK1DBE9p/Hzyss/ANyhc19/xIPOJsJkwUBdqROwQ73I
	 s+UXVWwd7ks22E1i3ryOsHIqeIlC7YwCaYfQNyn6sFMyibfv7eB/l2pIOJtycSZslfpDN
	 sYyqLj2xgQpEa9F26nBrjPiM38igvp/uX6TdK4hgBRn8VFYFayfBTd5uXjvp56gIFNEP5
	 np6e9ZpAkEt6s+ycJb5NSJkkqQyM/9L3NpXB41GfkxAtSo42BU1wYE8SaP807fQV53Htf
	 uAy5OPLXyyw+Dfl9E1orDSMggh2v94ag5Zfrb8pd2UlPuTOACDlnEmKXD7op0tI/vYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hXP89nTT;
	arc=none smtp.remote-ip=91.218.175.82
Received: from mta0.migadu.com (out-82.mta0.migadu.com [91.218.175.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F339606A336
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 09:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F339606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hXP89nTT
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mvr8JUoj4s8hurTRT0oqyf6HkIMals3cteGiU9PnGfg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794823098; v=1; x=1795427898;
 b=hXP89nTTzhOg8UObObvNrmfd+1GUnSZjQkq2cE7h+OMIS4CXKIsqfEhJ8d/1a0/E1HRoy4ni
 kN5r1SS47OoOoGF0FRiGz5ixLtl60T9nFyUf2cu16nspYS+U1s99rjN6kwn3B3toA0VMn8SpJ+a
 PmNk++XZmusEk01W0F2dpaPw=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1abbe9f12d63f71d;
	Mon, 16 Nov 2026 09:58:18 +0000
X-Mizu-Trace-ID: 1abbe9f12d63f71d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so7997e87.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 01:58:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHf5KK0CnINBvS3Y+D861Gy1YCwUOy9hVNdncZH/KN5/n7//A7p8SqvDevvGLRCNhfx8Vsi0hSS8s0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TQCAJS7Sr7DnYjTrfOkpxrOtQhgbNQ1hZ1UK7k+qTieeDNhYz
	pid2jK7E6qv54OceVQsjQvb0Ub38wdtk7gunj0aOd4svmXFr0OGzRGrEiHi9ChffqzN1am9ojsf
	ioi8F6u+CntF33iISbWZOMk6sGexTX4NxBp9AeR6w
X-Received: by 2002:ac2:4e05:0:b0:5bf:a911:7ee3 with SMTP id
 2adb3069b0e04-5c17d90d3b4mr171778e87.3.1794823093196; Mon, 16 Nov 2026
 01:58:13 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111085448.1130701-1-fuad.tabba@linux.dev>
 <20261111085448.1130701-8-fuad.tabba@linux.dev> <b5927ae8-edef-4042-bf64-da873eff0117@infradead.org>
In-Reply-To: <b5927ae8-edef-4042-bf64-da873eff0117@infradead.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 09:57:36 +0000
X-Gmail-Original-Message-ID: <CA+EHjTx=SMYSs6Qwmd0BrhbeftsBFs_hzg0T6qE2ZTSYbxW1cw@mail.gmail.com>
X-Gm-Features: AclHuK_nHTjmC_GW6HrL1qkYjVqq18uEdOE3VTq_9PAn58E74FUTCJeR_dnGLlo
Message-ID: <CA+EHjTx=SMYSs6Qwmd0BrhbeftsBFs_hzg0T6qE2ZTSYbxW1cw@mail.gmail.com>
Subject: Re: [PATCH 7/7] KVM: Fix typos in comments
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-mips@vger.kernel.org, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 17:05, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 11/11/26 12:54 AM, Fuad Tabba wrote:
> > @@ -2526,7 +2526,7 @@ static inline int kvm_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu)
> >
> >  /*
> >   * If more than one page is being (un)accounted, @virt must be the address of
> > - * the first page of a block of pages what were allocated together (i.e
> > + * the first page of a block of pages that were allocated together (i.e
>
>                                                                        i.e.
> >   * accounted together).

Will fix that in v2.

>
> Anyway, these changes look good.
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Thanks.

Thanks for the reviews and acks.

Cheers,
/fuad
