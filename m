Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2382B1FAC34
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736881457; cv=none; b=iPIO6XtHo1bUlR1kKqHy7B29RqKuyR4MZ/KVcSojs4cU+LsJc10T0F3VKDJXBxqepCu0/z6ctMRTi7ZbGwMkcYouUoJ/RobCDhc1cqC7793gpieojL7czw8hVGq+lN4Ac6I7aeMFR2vcEpfTRrSr1qJKkT+I8NBssYMI3Gy2MC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736881457; c=relaxed/simple;
	bh=XwsTLQ4BqMhDFl7aM4WgIj4JpTqpmV0VOoiGhzqe0aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2AJMO7jttxnsC/HsUfxiRzwfErSgaGdaTbOx+RhNIYLPYwk4+wUiUUJzNrj+8KiozBpkG8U41kNAnsLx7liaS6ixOKNQY8gDpRH9tMnd8CiCjUB7xuijkabj6x9WhQmRTwq6h3Mg0jG7RD7sx7KrVwO0q5KJv6wr2SLbMlktzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bwf9RDMP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bwf9RDMP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736881453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bcjB83fntkHNof7KhvDKBGCvExef2sbby+JP+sGMww8=;
	b=Bwf9RDMPserDqkZmnU5OA4P4r9v4FxKMPUQbGD/gppfNcHmdnhFHDgcqkGXJ5f04/Uvdce
	Y2d9UiJq72gkvqGzEeBi909n0UlLYyAGEFWZIy7+mARcNO8cgIlbxnZhLJuO1p+WQA52cT
	De0iHCZEnKLGA64Qv1NmR56RA6JsvSM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-487-JDE851CgOKmxznWHvQdZAA-1; Tue,
 14 Jan 2025 14:04:09 -0500
X-MC-Unique: JDE851CgOKmxznWHvQdZAA-1
X-Mimecast-MFC-AGG-ID: JDE851CgOKmxznWHvQdZAA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 771781956060;
	Tue, 14 Jan 2025 19:04:08 +0000 (UTC)
Received: from pauld.westford.csb (unknown [10.22.65.61])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7D69130001BE;
	Tue, 14 Jan 2025 19:04:07 +0000 (UTC)
Date: Tue, 14 Jan 2025 14:04:04 -0500
From: Phil Auld <pauld@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/sysctl: Add timer_migration to kernel.rst
Message-ID: <20250114190404.GB149002@pauld.westford.csb>
References: <20250114140301.141147-1-pauld@redhat.com>
 <877c6x9vcy.fsf@trenco.lwn.net>
 <20250114174308.GA149002@pauld.westford.csb>
 <871px58cj9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871px58cj9.fsf@trenco.lwn.net>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Tue, Jan 14, 2025 at 11:40:10AM -0700 Jonathan Corbet wrote:
> Phil Auld <pauld@redhat.com> writes:
> 
> > On Tue, Jan 14, 2025 at 10:08:13AM -0700 Jonathan Corbet wrote:
> >> Phil Auld <pauld@redhat.com> writes:
> >> 
> >> > There is no mention of timer_migration in the docs. Add
> >> > a short description.
> >> >
> >> > Signed-off-by: Phil Auld <pauld@redhat.com>
> >> > Cc: Jonathan Corbet <corbet@lwn.net>
> >> > Cc: linux-doc@vger.kernel.org
> >> > ---
> >> >  Documentation/admin-guide/sysctl/kernel.rst | 7 +++++++
> >> >  1 file changed, 7 insertions(+)
> >> >
> >> > diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> >> > index b2b36d0c3094..e03691e2cf4a 100644
> >> > --- a/Documentation/admin-guide/sysctl/kernel.rst
> >> > +++ b/Documentation/admin-guide/sysctl/kernel.rst
> >> > @@ -1544,6 +1544,13 @@ constant ``FUTEX_TID_MASK`` (0x3fffffff).
> >> >  If a value outside of this range is written to ``threads-max`` an
> >> >  ``EINVAL`` error occurs.
> >> >  
> >> > +timer_migration
> >> > +===============
> >> > +
> >> > +When set, attempt to migrate timers away from idle cpus to allow them to remain
> >> > +in low power states longer.
> >> > +
> >> > +Default is set.
> >> 
> >> When set to *what*?  It will always be set to *some* value, right?  So
> >> we should really say what the specific values mean.
> >>
> >
> >
> > Well, it's boolean so set means 1 and unset is 0. I was using the same
> > style as the one below it:
> >
> > "
> > traceoff_on_warning
> > ===================
> >
> > When set, disables tracing (see Documentation/trace/ftrace.rst) when a
> > ``WARN()`` is hit.
> >
> > "
> 
> Just saying it's a boolean would help.  And our existing documentation
> should rarely be taken as an example of what *good* documentation would
> be... :)

Fair enough :)

> 
> > But I can change it to "enabled (1)" or something if you prefer.
> 
> "When set to a non-zero value" or some such would, I think, be a lot
> more clear and make a better example for the next person to come along.
> 
> Get me an updated version and I can still queue it for 6.14.

Shortly.

Thanks,
Phil


> 
> Thanks,
> 
> jon
> 

-- 

