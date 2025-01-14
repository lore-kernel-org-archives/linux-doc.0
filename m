Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651DE1FA256
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 17:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736876601; cv=none; b=u+UmexKEFdv5VchKCGa860pzUa+paJeSMm+M7miutmVv/DGv8iLASy/PLDFTO9jMQuiVVIz/2SNJrI07NNpNUFzxq64vO/WkYhG34XoOa9cIRSc/TdXbUVWLPujBKYgItPujQOMdfefL5qpQmOyEn8lHkj5ACDs53mdYaS6aqk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736876601; c=relaxed/simple;
	bh=G407rDkyQ8XroGQWY11iBpacytcWXOtd3LB022tw+Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFR0Idd0WjOywnkkuDOQuAmT5vN2uz9mU4Ea7jFGzk8UqP25j5OmTvPbrdfvd+NwY3EvSqNfQMzYDxWtZlY1u7cyrteHc2sck2giZaH/j/cx2NpCGdAz0j4hUV0VeL41qrb85wwB/KNYUKay19ahsWgieXhrctMxHkoiR55cbbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B5jALm6Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B5jALm6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736876598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4d3NJES/Mj9gadjaoCI2vjbpnqy34+HasgLprL3oW6A=;
	b=B5jALm6YlUdWxulFlPGGT+Tq2dQC2TjtPqDv4zyxjt845HIhVtXK1vFdONKhNAnhJ+NeXq
	ZpJYTfc+MBubfTWk8WD71KLeYxlykwgilrTTtBzAktbbJBIxk3AcWvSGp969kds60V9RV5
	xgQGxHtl182puB3biXI8zHPmgMOp4HE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-122-t87Hg_OENXqPrDFOJAFuxg-1; Tue,
 14 Jan 2025 12:43:12 -0500
X-MC-Unique: t87Hg_OENXqPrDFOJAFuxg-1
X-Mimecast-MFC-AGG-ID: t87Hg_OENXqPrDFOJAFuxg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CA7DA1955DC9;
	Tue, 14 Jan 2025 17:43:11 +0000 (UTC)
Received: from pauld.westford.csb (unknown [10.22.65.61])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D4FE219560A3;
	Tue, 14 Jan 2025 17:43:10 +0000 (UTC)
Date: Tue, 14 Jan 2025 12:43:08 -0500
From: Phil Auld <pauld@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/sysctl: Add timer_migration to kernel.rst
Message-ID: <20250114174308.GA149002@pauld.westford.csb>
References: <20250114140301.141147-1-pauld@redhat.com>
 <877c6x9vcy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c6x9vcy.fsf@trenco.lwn.net>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Tue, Jan 14, 2025 at 10:08:13AM -0700 Jonathan Corbet wrote:
> Phil Auld <pauld@redhat.com> writes:
> 
> > There is no mention of timer_migration in the docs. Add
> > a short description.
> >
> > Signed-off-by: Phil Auld <pauld@redhat.com>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: linux-doc@vger.kernel.org
> > ---
> >  Documentation/admin-guide/sysctl/kernel.rst | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> > index b2b36d0c3094..e03691e2cf4a 100644
> > --- a/Documentation/admin-guide/sysctl/kernel.rst
> > +++ b/Documentation/admin-guide/sysctl/kernel.rst
> > @@ -1544,6 +1544,13 @@ constant ``FUTEX_TID_MASK`` (0x3fffffff).
> >  If a value outside of this range is written to ``threads-max`` an
> >  ``EINVAL`` error occurs.
> >  
> > +timer_migration
> > +===============
> > +
> > +When set, attempt to migrate timers away from idle cpus to allow them to remain
> > +in low power states longer.
> > +
> > +Default is set.
> 
> When set to *what*?  It will always be set to *some* value, right?  So
> we should really say what the specific values mean.
>


Well, it's boolean so set means 1 and unset is 0. I was using the same
style as the one below it:

"
traceoff_on_warning
===================

When set, disables tracing (see Documentation/trace/ftrace.rst) when a
``WARN()`` is hit.

"


But I can change it to "enabled (1)" or something if you prefer.


Cheers,
Phil


> Thanks,
> 
> jon
> 

-- 

