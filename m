Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9902C3033CB
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517664; cv=none; b=EfiIqZ6TQEeKMdz34V1t7j0yeEIYAMsSewy2jLWd+rKZEmvnZEZQYGzqtmrqgdb+OnHuHCVB4z8ZaeY6PL1ZoB9lvk/3oC0TXRX0kS3y0GltALmEM8Nq64bC2AVkTsiYfOQr5h4/9qZ3EeUKxKoTNoQ9yIxk4N4t+s37fGpt0g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517664; c=relaxed/simple;
	bh=agvT6dldUAVHGkvdHJr9GDkFukAf7X5C//m3Sv3mbM0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pdZb+RW1USNKNZO3E4Djlh7TUFhFm/1VMcu3Y+T7NexeTmf/kM04LskLtQPaRxThmCsvuG0fo2mJlSv4anpOZDQJ62L6MBDKsjsE9AbfK2r6a9EUrbsidNJJ6Qjv6s2380Iy6zByqLEZnQF7UaYgmdJKCxA0P6E/BZW+ofqVI+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D5lmLxNW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nJBNMuhi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D5lmLxNW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nJBNMuhi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783517661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=agvT6dldUAVHGkvdHJr9GDkFukAf7X5C//m3Sv3mbM0=;
	b=D5lmLxNWPVYHx5/Vw4if8wRI3B+8qfDfGcrAhIvFLeSVVEHoUWQChrmtG5wgYsDq15R2Zi
	fqCMYzKH1fOcHPD91y4BysQnDu6vWv3nD4g3qW4LAWh/5AkPpgFg+3A/WyN69cLldmrFs8
	p45BZfMqQhdV+qd9MjwgI/kMmC63s4M=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-cECM2TdKM3eAo0_0B8K-hA-1; Wed, 08 Jul 2026 09:34:20 -0400
X-MC-Unique: cECM2TdKM3eAo0_0B8K-hA-1
X-Mimecast-MFC-AGG-ID: cECM2TdKM3eAo0_0B8K-hA_1783517659
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c15b8701fe4so58166966b.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 06:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783517659; x=1784122459; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=agvT6dldUAVHGkvdHJr9GDkFukAf7X5C//m3Sv3mbM0=;
        b=nJBNMuhi8ApwLQW1V3HfDCyZT1EXfuhrdgynf67y8vGIENvnIr72HurDPqVLVLfrEA
         5SRjrjZYN8fGAwGKkFZxccEIknMVehg29vq+gJLcTqyXAcNvJlpenfCCIGd/Jw0qXnBf
         xBbWNAPa4E5VhzPlc/E6ox6uHfEISlw2abMfCtPYooWu6GConhA27nlLf2/UQaIX9KHk
         ahe8HQ2zGiklhT2a4BvCkKjI9Q9wnFFuXT1bD8Sr8hlpoJfJISA/c3YGWirVnJKBuIaw
         3YsLDuIOD7xqeZz3jb4jc4POIayv3a8W6YN3ciF5SrQXE9V20Q6qLl/kNlBYiHUKhItJ
         g/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517659; x=1784122459;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=agvT6dldUAVHGkvdHJr9GDkFukAf7X5C//m3Sv3mbM0=;
        b=ZRZQAQWxUwmA5aoXPRfh46BIIVMOJ9CYXyNSeAs+cYS153A287qks5ay9GeJ0dqV8X
         8jNM2pJS7kDGynFH6DJRJ/gGeI61iiVjInEBkLk/z+1fNQLUtnORqNxFyP7pP3OGbDsm
         QymQ/lxsRms7huRl1FwjcJ+WL6/8pcVaseQSJst7oXazgR4DyWy9B3bIUaW759+fPvoX
         EgtKs+PlZzfBlvPme8+EwLvocN+85dXon5xgekINhnO/eQQE7b9R8lI4rfngbxP5OeMM
         NZbK1CA/juMUowblK85DkUtxYtvVcsiMt0rtIwNTqINJ1c+XHgjwM8MceC1XqfbwHfgh
         mIAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeUDllNycSj8JeH6rLRSzA2s8cNkf8D/Wxz7wmtbfjJM7AqKiWkZvnI/krCR1RzJQy8WQdLfQ2MZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQul56YFMRWKYH2r1kaPGi3fAtreDr0Xv/urLPS6GHsr7kXHH7
	oEAVUwN0qghWJ+E8x3AACsTfy4QnKY6gZ0vlG3elQq+la+mwedsISU9z319MbvpSV7oKQquFlX/
	qN2/OyEFFxHuHiraTaD2a6KgHBAtexTECr1D8Hw2a1xpx+sGkQVz/MQ9NwHSffw==
X-Gm-Gg: AfdE7cm0FxKA9TXlvzyKSaEFghmQsMcIWcjlUnoVtmAQHMKmZKOQ+yNxB5Bzfw6vUeK
	zfJ7q+ntkG7NI9l5DWlA6ednHunjRa44xqIKcLatuM7VwEKOSHXtj+XGWnbR+bb3gvHdwSyDgJx
	ifFbwQC+f1zfhNlcHCbguAnyPr6pN5L9Dsr0oFxH+u1ns7XMvKqnfz3ePVP91lWKRxkrvyxDDcg
	JyIiEIQ2pE4YnXxGScq6RQVKW7u6FNt9YwP588UrwX+phInGrMcVAjw6CTk2HPfXHGJXVDKkNbt
	9R99AI2MQu+VgVsw9x/13t1PiptO8SnGpTgpDxMT73jw/EO5q+D+D/hyzZUqRPdgy2B2C8MYQx5
	9yle7tQY9dnWF5rAlwKyq+1IUCPFD8ocnSl89eRweGjrmrRo+ewXKdW0AD2LJjLM=
X-Received: by 2002:a17:907:a286:b0:c12:2acc:fce2 with SMTP id a640c23a62f3a-c15ce128c8dmr130689166b.53.1783517659324;
        Wed, 08 Jul 2026 06:34:19 -0700 (PDT)
X-Received: by 2002:a17:907:a286:b0:c12:2acc:fce2 with SMTP id a640c23a62f3a-c15ce128c8dmr130687466b.53.1783517658811;
        Wed, 08 Jul 2026 06:34:18 -0700 (PDT)
Received: from ?IPv6:2a01:41e1:62a8:c300:7322:3fab:8db6:d28c? ([2a01:41e1:62a8:c300:7322:3fab:8db6:d28c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad84483csm333878666b.17.2026.07.08.06.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:34:18 -0700 (PDT)
Message-ID: <bceedaf195adf713db70a1dba743055fe4f20bc0.camel@redhat.com>
Subject: Re: [PATCH 0/4] KVM: x86: Document and enforce APIC base memory hole
From: Tim Wiederhake <twiederh@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>,  "H. Peter Anvin"	 <hpa@zytor.com>, Ingo
 Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,  Paolo Bonzini <pbonzini@redhat.com>, Shuah
 Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	x86@kernel.org
Date: Wed, 08 Jul 2026 15:34:17 +0200
In-Reply-To: <akwrncCjosItvAeO@google.com>
References: <20260706092021.3625908-2-twiederh@redhat.com>
	 <akwrncCjosItvAeO@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-07-06 at 15:26 -0700, Sean Christopherson wrote:
> On Mon, Jul 06, 2026, Tim Wiederhake wrote:
> > When an in-kernel irqchip is enabled on x86, KVM installs a private
> > memory slot at the default APIC base address (0xfee00000) during
> > vcpu
> > creation.=C2=A0 If user space has already mapped a memory region
> > covering
> > that address, vcpu creation fails with -EEXIST.=C2=A0 The same happens
> > in
> > reverse: mapping memory over the APIC base after vcpu creation also
> > fails with -EEXIST.
> >=20
> > None of this is documented, and the error is reported far from
> > where
> > the actual conflict is introduced.=C2=A0 A VMM developer hitting this
> > has
> > to trace through KVM internals to understand what went wrong.
> >=20
> > This series documents the two undocumented constraints (irqchip
> > before
> > vcpu, APIC base memory hole) and adds early checks so the error is
> > reported at the ioctl that actually violates the constraint.
> >=20
> > Patches 1-2 are documentation only.=C2=A0 Patches 3-4 add early
> > validation
> > that turns a confusing -EEXIST at vcpu creation into an explicit
> > error
> > at the point where the conflict is introduced.
>=20
> I'm 100% in favor of documenting the behavior, but I'm not exactly
> excited about
> the enforcement.=C2=A0 It's not needed for KVM's safety, and while I
> appreciate that
> such a goof would be somewhat annoying to debug, I have a hard time
> believing it's
> a common failure.=C2=A0 I.e. I'm not convinced carrying the code is worth
> the marginal
> benefits it provides.

FWIW, I did run into this exact issue myself and debugging it was
indeed quite a ride. The EEXIST from vcpu creation led me completely
astray and I was very close to just giving up. If I had, I wouldn't
have written this patch, and the failure would be perceived as even
less common.

I don't mind dropping patches 3 and 4 (the actual "enforcement"
patches) for v2, the documentation is more important in my opinion.
Still, if there is interest, I'd be more than happy to rework these
patches for eventual inclusion.

Thanks for the review,
Tim

