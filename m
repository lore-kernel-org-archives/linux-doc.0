Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCE0242261
	for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 23:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737069437; cv=none; b=JdwNHzBaOBxqJ6JDvZ9q2RO3yJ8Y9uieSDl+twH+QY77YLOGU+edMjC5vdjGVtJOTjuDeriyWUO7ZbaIcSHKyfDkWwxLi3U/zwanjyAk9vP7/tzxcnN+G2ALUJPAJjw6UwbOSZBIPCn6Ovf3ORH86eLjkKjErw/DiTuhuN84s08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737069437; c=relaxed/simple;
	bh=NAgy0kIELSGaQocfEuwF6FntFvcyDi+VegFHY0B4Zj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBywViHwx2roTFd3vo6QEsAFSA1yFrQZuqBiA1MWPol11D9SEwc+MCW8gGALdUOG4QpB2rGi5BRklGAWz+IzRaQ7Q8DUECPkF1k2Hwi4UMGqD5Wqiq4QqxPB7/iy7Lsv3zw6wsgC3m2t1k3DEvxsWiBrMH0w7SxBlJjeXA9cMuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G17lDhqQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G17lDhqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737069434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EB89eWBtAEhmm8FUKfpQuGCPQOllZPpE/wyoIM85JbY=;
	b=G17lDhqQhMLvA0daQJIg8nNrFhnXJd+FU1/WHXHUFgBqlVQhjIzHe3nghYScxNCn63z2AN
	nvkNxq2wcr18pBoGn1CXlJgzoGKb2QcXOG8XTTXlHddDYJ0Qv/tBArSzM00v9mnchUCfnM
	WwBvYbW6v/4ok0iajQr4zyEY89RU0lM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-TBXkYADiMmKfwWNjJEBP3g-1; Thu, 16 Jan 2025 18:17:13 -0500
X-MC-Unique: TBXkYADiMmKfwWNjJEBP3g-1
X-Mimecast-MFC-AGG-ID: TBXkYADiMmKfwWNjJEBP3g
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e19e09cc20so30217716d6.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 15:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737069433; x=1737674233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EB89eWBtAEhmm8FUKfpQuGCPQOllZPpE/wyoIM85JbY=;
        b=OQWfvt9Nb12xnifoAcTgnFjvXeyq68/pIa7290ZT54aC/8DBgs9UakyjXCaqS/d6r9
         STW6Sfp9mmhL0HLLHWE0hNbwY1BK5AmZREr8lO3za5znI6wmCTsYPFphJH/2o/PhN755
         UqzrkkotrVfp1hE23jrJ7fAA+qNG1LQ931thrAtVtSbISeetJOteJUywiQUKrb0jhpzw
         pI+cCycJe9FTmEGhk8Ld/CfTctRj3s4ihwTYYHecp0VMJhLm40U3cAg+CISZrfqHMwbO
         twHBxptJ1lhd+LRnSfoh/909cuaDNLry03EZNi6Zh9hEUQJU7nOpmhdUtaPKiFJCJDgw
         JM6w==
X-Forwarded-Encrypted: i=1; AJvYcCVDkpYFBJ7O1kStT4ndcBjE3/fRCQPdytH8ZMzB56Ar7gsDGJOW+0vw3EI0/YW/qycYnEDR/IpqWlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYZGPHXzgFE7m57jl9wPF/2P1Zwt3qGhtX0TLnr/OQ8ehNDLpk
	V2gMlrHTKKHLkFHF/A+UeDOksRX61s+Plabr4FU6t9ZYChNwm1/oV/f54zspkjHRrq/PKvaog5W
	RaoFWQPfYpev4Gy3Hl06QrrgoaRibcOUvRD9C5nVyChGYVGc/HsEC1NkoQg==
X-Gm-Gg: ASbGncsVFQyQdpYeCej0VAD9GKIrLcDhg86rL3vNE1n8K1sHjCztp1fbE+EIhGE0QZQ
	iVDOryrbPw8V56tMbWd5Zeswklz2+9S8TQHLb+kfnHk73e4emlfsGC8EminLqMEhimbdtNY9MMO
	fvzR/sxr+R1uOBeEhDp+Gj6+I7s85/SdlG3K8AoGAtovUjS/mGYFfNW2Fdm1m1RHt9WZlNomRrw
	HVMACg9hrci9m2WJOlLGntCjEe9YG7xXd7ld+gtkyUDBkhM4wlW7hJ3g2EgH8AMUFERnuQzmE6e
	GLvCr2YJC4FMxapfOg==
X-Received: by 2002:a05:6214:23cd:b0:6cb:d4ed:aa59 with SMTP id 6a1803df08f44-6e1b216fee7mr12477456d6.4.1737069432816;
        Thu, 16 Jan 2025 15:17:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8korhN4Q9bg606UN+KlTOIfjhzGaV+azhKrqtWHtZLTeSAl38XfGALdtMDYi+K8qFwH+Sew==
X-Received: by 2002:a05:6214:23cd:b0:6cb:d4ed:aa59 with SMTP id 6a1803df08f44-6e1b216fee7mr12477126d6.4.1737069432480;
        Thu, 16 Jan 2025 15:17:12 -0800 (PST)
Received: from x1n (pool-99-254-114-190.cpe.net.cable.rogers.com. [99.254.114.190])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e1042ecd1sm4941611cf.67.2025.01.16.15.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 15:17:11 -0800 (PST)
Date: Thu, 16 Jan 2025 18:17:08 -0500
From: Peter Xu <peterx@redhat.com>
To: James Houghton <jthoughton@google.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
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
Message-ID: <Z4mTdOc35hF26PeY@x1n>
References: <20241204191349.1730936-1-jthoughton@google.com>
 <Z2simHWeYbww90OZ@x1n>
 <CADrL8HUkP2ti1yWwp=1LwTX2Koit5Pk6LFcOyTpN2b+B3MfKuw@mail.gmail.com>
 <Z4lp5QzdOX0oYGOk@x1n>
 <Z4lsxgFSdiqpNtdG@x1n>
 <Z4mFL8wfHjvz6F1Y@google.com>
 <CADrL8HW_hgKZBX98Z17eNqC3iJruwLJcFv=pswgT8hKayMYbzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADrL8HW_hgKZBX98Z17eNqC3iJruwLJcFv=pswgT8hKayMYbzw@mail.gmail.com>

On Thu, Jan 16, 2025 at 03:04:45PM -0800, James Houghton wrote:
> On Thu, Jan 16, 2025 at 2:16 PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Thu, Jan 16, 2025, Peter Xu wrote:
> > > On Thu, Jan 16, 2025 at 03:19:49PM -0500, Peter Xu wrote:
> > > > > For the gmem case, userfaultfd cannot be used, so KVM Userfault isn't
> > > > > replacing it. And as of right now anyway, KVM Userfault *does* provide
> > > > > a complete post-copy system for gmem.
> > > > >
> > > > > When gmem pages can be mapped into userspace, for post-copy to remain
> > > > > functional, userspace-mapped gmem will need userfaultfd integration.
> > > > > Keep in mind that even after this integration happens, userfaultfd
> > > > > alone will *not* be a complete post-copy solution, as vCPU faults
> > > > > won't be resolved via the userspace page tables.
> > > >
> > > > Do you know in context of CoCo, whether a private page can be accessed at
> > > > all outside of KVM?
> > > >
> > > > I think I'm pretty sure now a private page can never be mapped to
> > > > userspace.  However, can another module like vhost-kernel access it during
> > > > postcopy?  My impression of that is still a yes, but then how about
> > > > vhost-user?
> > > >
> > > > Here, the "vhost-kernel" part represents a question on whether private
> > > > pages can be accessed at all outside KVM.  While "vhost-user" part
> > > > represents a question on whether, if the previous vhost-kernel question
> > > > answers as "yes it can", such access attempt can happen in another
> > > > process/task (hence, not only does it lack KVM context, but also not
> > > > sharing the same task context).
> > >
> > > Right after I sent it, I just recalled whenever a device needs to access
> > > the page, it needs to be converted to shared pages first..
> >
> > FWIW, once Trusted I/O comes along, "trusted" devices will be able to access guest
> > private memory.  The basic gist is that the IOMMU will enforce access to private
> > memory, e.g. on AMD the IOMMU will check the RMP[*], and I believe the plan for
> > TDX is to have the IOMMU share the Secure-EPT tables that are used by the CPU.
> >
> > [*] https://www.amd.com/content/dam/amd/en/documents/developer/sev-tio-whitepaper.pdf

Thanks, Sean.  This is interesting to know..

> 
> Hi Sean,
> 
> Do you know what API the IOMMU driver would use to get the private
> pages to map? Normally it'd use GUP, but GUP would/should fail for
> guest-private pages, right?

James,

I'm still reading the link Sean shared, looks like there's answer in the
white paper on this on assigned devices:

        TDIs access memory via either guest virtual address (GVA) space or
        guest physical address (GPA) space.  The I/O Memory Management Unit
        (IOMMU) in the host hardware is responsible for translating the
        provided GVAs or GPAs into system physical addresses
        (SPAs). Because SEV-SNP enforces access control at the time of
        translation, the IOMMU performs RMP entry lookups on translation

So I suppose after the device is attested and trusted, it can directly map
everything if wanted, and DMA directly to the encrypted pages.

OTOH, for my specific question (on vhost-kernel, or vhost-user), I suppose
they cannot be attested but still be part of host software.. so I'm
guessing they'll need to still stick with shared pages, and use a bounce
buffer to do DMAs..

-- 
Peter Xu

