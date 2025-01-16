Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF552419F3
	for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 23:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737070284; cv=none; b=PTgvZdY0XmD8NImyRih9z84sFHe6l2YDtaSNvC3fJvHMvnUA4iOQ/cz7y9pTJdAf8+hUNHLNd6fIz4V6W3iZuXaBUKZ0Pn9ZzWFhD7RSdKIWz460aaFz4hqttgoMVI4MHZe7KRg9AR65P7FfcGZue6fTeT6YlvoJXrhMNxvgP4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737070284; c=relaxed/simple;
	bh=hEX2DsNI7E8IBqdPG0miIQfwwOlcMkiPPsnqKDxhtIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDs2Y6RlPU0Cu8fLqjOBlgDRc4am874h/OseR8Hq6lbNsZ02k9+P/6Y1MZLVDR6U2UDh5EtJDSPwft2hrCDjTHHp+fLyPqBESF5jZHy0xLUOMUh+Mwt77l2nDZXXyA3LSmYADHuzeZyi9LePIz/6n0u4iyf1Cjnbu07qsn53Cuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g9/vuNgT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g9/vuNgT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737070281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+aljsYXNR3zz+hPgKhn1NefTJFgn2NwxVBvLmGXKHY=;
	b=g9/vuNgTgIc4ZfVYRhzW8JSZUWRi/ipIcSeKnoLISsFpty2+1bMmrzVnkzJ6vrNJpIQxPM
	a3W/CcWtCtEkGKhollTpCuv7qa2qi1Akl5CGOCYI0KaGF5E+3VecRP8kkliR2AP9iERZ4O
	pDQ595LY20lr0Wr91bNxf+FNGwf6u+8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-uTzLY2FCNmyPeKUTYgKkvg-1; Thu, 16 Jan 2025 18:31:20 -0500
X-MC-Unique: uTzLY2FCNmyPeKUTYgKkvg-1
X-Mimecast-MFC-AGG-ID: uTzLY2FCNmyPeKUTYgKkvg
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46dd46d759eso27633401cf.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 15:31:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737070280; x=1737675080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+aljsYXNR3zz+hPgKhn1NefTJFgn2NwxVBvLmGXKHY=;
        b=EA5YQuVIU9reb3dFxK1oTErrgUHTCCgTlF7plC3fst4ZxafJ0W9BE+AysR+zm5vrRs
         ycjp0vBNfO/f8DdQevZHnqo4B3nO+4uEYFwIMDcQmNyY1neNqluJs+ZSf/0YjqJqsoz0
         EXb+qkkb4K6arq0LrI7iSSEzXY+14IM3CNdrQHabwwbm+J2JZ42YJkGB+jF0LSx1Fxgj
         ZrOFFqdPwCD46r+ph2w56T6MQobPCH3OjRkpruKA1dqRj8dLptjw/6WKOLEGhfRlg6YM
         kUqoaonlLBl0jQjnsYjhc0rbJTr7zUAU6vF3UubvrBlXyuJfkKZ4owN4lEx58oY7XVaz
         o+oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg7tUXHOTvvz1wsE69k4KfQgzhJjKFDqaQWLGI6/59wCfnVNVEdEkxRtQ7H1iixatw0AXcGal4kQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZx8fjGJs7739Flmwh5dS6JE12EA+o7sZUrv3jGzjDWfBnM8CY
	lqcyK3fb3/Erb06jgrVrjmURS+rBvNCTHsYMXPu20txRGfy34vWN0MG3dMDGV9M7u6kvpxvytUe
	eZVNE5VzCaYs3PRM05xRPabASF5OL0lqR2o97DKGxZC/MCFMcUS99mkO5Pw==
X-Gm-Gg: ASbGncvQqY5fvPytTfNDFNIyHEpbQyWm6j8BeUlBrkCmgVsf+cTs7xGR2XsJqix3hVz
	bvokpR8NF7cKyYGqtoldIQBB0ZeqT320jC0U91i/oZ1MMCqhAVJSk6Rq8MZnp5V55RKEoDsWjBs
	Lwvk976hYt1H8xzdYktTysvpdKWeIXcUmlHPh9AHszw2lhM16uAsG5f/moIzIaPOUs63TI6Wb8e
	4AXePciqxb1lmrSKZO6ZX8grJwUFfsn+fu04np4kuVqzvJzavR8nAvZiIw2WAtZQIIKei8gaIyc
	U/8/EZ+EX7tcq6jlIQ==
X-Received: by 2002:ac8:5914:0:b0:467:7270:bc35 with SMTP id d75a77b69052e-46e12a3fadamr10765351cf.14.1737070280058;
        Thu, 16 Jan 2025 15:31:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDbPH5giaBGe/SQwST9bz+Qh0GVUALDsJUk5gRXMEShRz7wGoChR/Lc1daUotDAD4y7F9d0A==
X-Received: by 2002:ac8:5914:0:b0:467:7270:bc35 with SMTP id d75a77b69052e-46e12a3fadamr10765061cf.14.1737070279738;
        Thu, 16 Jan 2025 15:31:19 -0800 (PST)
Received: from x1n (pool-99-254-114-190.cpe.net.cable.rogers.com. [99.254.114.190])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e104027d5sm5078961cf.58.2025.01.16.15.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 15:31:19 -0800 (PST)
Date: Thu, 16 Jan 2025 18:31:15 -0500
From: Peter Xu <peterx@redhat.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Anish Moorthy <amoorthy@google.com>,
	Peter Gonda <pgonda@google.com>,
	David Matlack <dmatlack@google.com>, Wei W <wei.w.wang@intel.com>,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v1 00/13] KVM: Introduce KVM Userfault
Message-ID: <Z4mWw8NXCoV-pONI@x1n>
References: <20241204191349.1730936-1-jthoughton@google.com>
 <Z2simHWeYbww90OZ@x1n>
 <CADrL8HUkP2ti1yWwp=1LwTX2Koit5Pk6LFcOyTpN2b+B3MfKuw@mail.gmail.com>
 <Z4lp5QzdOX0oYGOk@x1n>
 <Z4lsxgFSdiqpNtdG@x1n>
 <CADrL8HWRavCoZ_NtXJvcLOvjOiGDCor6ucWeEqkecA3VDY-adg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADrL8HWRavCoZ_NtXJvcLOvjOiGDCor6ucWeEqkecA3VDY-adg@mail.gmail.com>

On Thu, Jan 16, 2025 at 02:51:11PM -0800, James Houghton wrote:
> I guess this might not work if QEMU *needs* to use HugeTLB for
> whatever reason, but Google's hypervisor just needs 1G pages; it
> doesn't matter where they come from really.

I see now.  Yes I suppose it works for QEMU too.

[...]

> > In that case, looks like userfaultfd can support CoCo on device emulations
> > by sticking with virtual-address traps like before, at least from that
> > specific POV.
> 
> Yeah, I don't think the userfaultfd API needs to change to support
> gmem, because it's going to be using the VMAs / user mappings of gmem.

There's other things I am still thinking on how the notification could
happen when CoCo is enabled, that especially when there's no vcpu context.

The first thing is any PV interfaces, and what's currently in my mind is
kvmclock.  I suppose that could work like untrusted dmas, so that when the
hypervisor wants to read/update the clock struct, it'll access a shared
page and then the guest can move it from/to to a private page.  Or I'm not
sure whether such information is proven to be not sensitive data, so the
guest can directly use a permanent shared page for such purpose (in which
case should still be part of guest memory, hence access to it can be
trapped just like other shared pages via userfaultfd).

The other thing is after I read the SEV-TIO then I found it could be easy
to implement page faults for trusted devices now.  For example, the white
paper said the host IOMMU will be responsible to translating trusted
devices' DMA into GPA/GVA, I think it means KVM would somehow share the
secondary pgtable to the IOMMU, and probably when DMA sees a missing page
it can now easily generate a page fault to the secondary page table.
However the question is this is a DMA op and it definitely also doesn't
have a vcpu context.  So the question is how to trap it.

So.. maybe (fd, offset) support might still be needed at some point, which
can be more future proof.  But I don't think I have a solid mind yet.

-- 
Peter Xu

