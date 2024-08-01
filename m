Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA4614A4E0
	for <linux-doc@vger.kernel.org>; Thu,  1 Aug 2024 22:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722550981; cv=none; b=X4JOwzbOy8itqpLVF2MXPIvB8ZjXYv8nWq3RQl22Q1pf+tapYd4chjk3phy1UYqOIICSjq7dbjZYiJ1QYjLKtOo/vooQ8OEsb5YeA4X0akvjaUx2di3XIEuDqWQzXxKwFtY6755E3SDKvSUofjWogwdkYce79K3/EE0KoOx/XuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722550981; c=relaxed/simple;
	bh=83y5jcISbGVgHhdSye9Ayo9+ylHkjQBs4zkhSX1JibY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIjXf9WDcPNSfUEJE3eRey9LrLG2/LescfgbYtWUpiZLDAOmR7kWfcF34HcKaVu9tRrx/JkJsTfDOiMTK9Xfqe78007TF/JDHI8q9Wt75HhW3ON6JYpsMGYSS+PwnSaszpAPpfMmXt6wFnAdhWH1+1GEJ0I4FD0t8PUqHcK34a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jBNp0j8y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jBNp0j8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722550978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=acXEWndKlCVnwDNwF3qRu8zmTJbIkY9TPABZaKHwjrc=;
	b=jBNp0j8y5noDVbgiaWc2bLPDJcmP6l1cUrMV6YCLxKBebPg64/1h4zQ9sXwMAXvdadi5al
	uSIBlL7MIwixl+XNUAIO5mVjfBJjaL8yjKjJWCWSM9StIn/lMCHqR/vGxUP282TuuD8Mgv
	wm25khkU+jiAqAZXawQtjBV8jX7YC3Q=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-MQP20fzqNJGm4SZIfT70pQ-1; Thu, 01 Aug 2024 18:22:56 -0400
X-MC-Unique: MQP20fzqNJGm4SZIfT70pQ-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7a1d3392009so52672385a.3
        for <linux-doc@vger.kernel.org>; Thu, 01 Aug 2024 15:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722550975; x=1723155775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acXEWndKlCVnwDNwF3qRu8zmTJbIkY9TPABZaKHwjrc=;
        b=RcxXVKVI6iOXIMWsI0BZKMyTKB4QqsMo1FHcVUyWZ++3zt7vxfvQ2EDM052GRBU7/+
         52Z3f+I+RD3t392J4IGizpxHGvDiGCsmEND24Viv6p2JOoA1cGSsyu/glkPwLsibOPFT
         uajNTjWwR9/6ocvj8IV/3T5pBY8g5l/9GTO4e1PX/PoT4Fo2fWFQOKTQ35lOVUkJTLnN
         BWV6SsrMRsB85lkjv+CM+Vnzxvj22RMehTBH8+O5mRHJAud4AZTV1q1ntwCo4hptjpaA
         KS602iulYqb2o7XRMxfsVmITaDj1TvHCOMcX6ia/XJIxtzIR70IZ9eDKrqn4w0+FmwGq
         U4PA==
X-Forwarded-Encrypted: i=1; AJvYcCVjWb853rsHQtM6LyKlJC1TrOEHoL5b1Qfh0OxaAJEeO3Z8+EmWpNhaz7NfTPOxHtVRYOe3pn+kI5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX2hqQKr0KrrIjxAj/X9f1Qy75qyVhOlzSeUiIMqK4bM9dLWKM
	BZS1GvzuL3wfX0jf5tv3iVqpBo5OjjB88qZhBMynh7hSeN/9WXVNTvKhgetuTGjF/vfeZYdPfZw
	xHUhV6w9IwcNhcdQ4ABIf0JIXmZYPdAF1AcotXJ5P3PjiF4Yie9FGdJmAxQ==
X-Received: by 2002:a05:620a:3902:b0:79f:78a:f7d6 with SMTP id af79cd13be357-7a34ef0f061mr104412985a.1.1722550975310;
        Thu, 01 Aug 2024 15:22:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEepfEQvZgBRjF0n6c40OJFUnxDJginkdVQ49bHtnVFZ0KbqFVRZ0T0eM1Jvx3otgOTXKNadw==
X-Received: by 2002:a05:620a:3902:b0:79f:78a:f7d6 with SMTP id af79cd13be357-7a34ef0f061mr104411785a.1.1722550974882;
        Thu, 01 Aug 2024 15:22:54 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f787aa6sm31839085a.103.2024.08.01.15.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 15:22:54 -0700 (PDT)
Date: Thu, 1 Aug 2024 18:22:51 -0400
From: Peter Xu <peterx@redhat.com>
To: James Houghton <jthoughton@google.com>
Cc: kalyazin@amazon.com, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	David Matlack <dmatlack@google.com>, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	roypat@amazon.co.uk, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 14/18] KVM: Add asynchronous userfaults,
 KVM_READ_USERFAULT
Message-ID: <ZqwKuzfAs7pvdHAN@x1n>
References: <20240710234222.2333120-1-jthoughton@google.com>
 <20240710234222.2333120-15-jthoughton@google.com>
 <4e5c2904-f628-4391-853e-37b7f0e132e8@amazon.com>
 <CADrL8HUn-A+k-+A8WvreKtvxW-b9zZvgAGMkkaR7gCLsPr3XPg@mail.gmail.com>
 <4cd16922-2373-4894-b888-83a6bb3978e7@amazon.com>
 <CADrL8HVuvBAMcuoifhjuSBpVOA3Av+_k4e=waD81ajKX4gXPHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADrL8HVuvBAMcuoifhjuSBpVOA3Av+_k4e=waD81ajKX4gXPHw@mail.gmail.com>

On Mon, Jul 29, 2024 at 02:09:16PM -0700, James Houghton wrote:
> > A more general question is, it looks like Userfaultfd's main purpose was
> > to support the postcopy use case [2], yet it fails to do that
> > efficiently for large VMs. Would it be ideologically better to try to
> > improve Userfaultfd's performance (similar to how it was attempted in
> > [3]) or is that something you have already looked into and reached a
> > dead end as a part of [4]?
> 
> My end goal with [4] was to take contention out of the vCPU +
> userfault path completely (so, if we are taking a lock exclusively, we
> are the only one taking it). I came to the conclusion that the way to
> do this that made the most sense was Anish's memory fault exits idea.
> I think it's possible to make userfaults scale better themselves, but
> it's much more challenging than the memory fault exits approach for
> KVM (and I don't have a good way to do it in mind).
> 
> > [1] https://lore.kernel.org/lkml/4AEFB823.4040607@redhat.com/T/
> > [2] https://lwn.net/Articles/636226/
> > [3] https://lore.kernel.org/lkml/20230905214235.320571-1-peterx@redhat.com/
> > [4]
> > https://lore.kernel.org/linux-mm/CADrL8HVDB3u2EOhXHCrAgJNLwHkj2Lka1B_kkNb0dNwiWiAN_Q@mail.gmail.com/

Thanks for the link here on [3].  Just to mention I still remember I have
more thoughts on userfault-generic optimizations on top of this one at that
time, like >1 queues rather than one.  Maybe that could also help, maybe
not.

Even with that I think it'll be less-scalable than vcpu exits for
sure.. but still, I am always not yet convinced those "speed" are extremely
necessary, because postcopy overhead should be page movements, IMHO.  Maybe
there's scalability on the locks with userfault right now, but maybe that's
fixable?

I'm not sure whether I'm right, but IMHO the perf here isn't the critical
part.  Now IMHO it's about guest_memfd is not aligned to how userfault is
defined (with a mapping first, if without fd-extension), I think it indeed
can make sense, or say, have choice on implementing that in KVM if that's
easier.  So maybe other things besides the perf point here matters more.

Thanks,

-- 
Peter Xu

