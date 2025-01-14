Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5B22080E4
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 19:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736884258; cv=none; b=XRXU8grHqF0ny8YMXlYmzLRXMlSGzE0VoT1HrlscxBDbbds/ScQvQhTNbAtlEm5wXrvgDvp9tBADbTvH04YtGp7qqlRmt/NJ/bqf4DbtXGouKER4QkhnNLrtIRWzAQvZIL64cHfKDUqeZLGZ0zRP1cY1YY+3OyBzG0Bd74B68DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736884258; c=relaxed/simple;
	bh=GWGS80BEP6MtOhNWokCuZ5WsYRtUoN7Wbgf2IuPOJY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHWyAjW8pqYz9dHZMAELriywxvbAAbKl/RGD0SRMnio/+rSso9+lPGIbeh9g+kRkmW03AC5ut8jShQ9e7Jw2RrPqdLEaFlPE2f7yKoQsr7oUfVyCM71BAztWJA0+zkeoY/eORLrrIv2TB8Mt9UhOcOLk5Ss4hAVbz0R852sz8C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KDa2I4JJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KDa2I4JJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736884254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rikR7sBwsQopCF9T1jQxeH1cAZJrBA7YMkBANlhgwJU=;
	b=KDa2I4JJ3Nekg+k0PhlEY8wagvc49qZROaV79kW1jxEULtqTGdkW4N3Wd0a8XOlJcWKd7m
	OwL94KUNLyBcdtls15U85PCCb7l+dJSp+hV4QgiqzSfdckNXgDZRUydkf8ltNMkAoJPpW7
	9KB5SqA8Op4AxXdMiSHbFNo6oBNVMBc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-391-FYPImF-rMBuXCJAwPDZH_Q-1; Tue,
 14 Jan 2025 14:50:51 -0500
X-MC-Unique: FYPImF-rMBuXCJAwPDZH_Q-1
X-Mimecast-MFC-AGG-ID: FYPImF-rMBuXCJAwPDZH_Q
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A4D101955D57;
	Tue, 14 Jan 2025 19:50:50 +0000 (UTC)
Received: from pauld.westford.csb (unknown [10.22.65.61])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D772C19560AD;
	Tue, 14 Jan 2025 19:50:49 +0000 (UTC)
Date: Tue, 14 Jan 2025 14:50:47 -0500
From: Phil Auld <pauld@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/sysctl: Add timer_migration to kernel.rst
Message-ID: <20250114195047.GC149002@pauld.westford.csb>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40


Hi Jon,

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
> 
> > But I can change it to "enabled (1)" or something if you prefer.
> 
> "When set to a non-zero value" or some such would, I think, be a lot
> more clear and make a better example for the next person to come along.
> 
> Get me an updated version and I can still queue it for 6.14.


It's sent but I failed to do it as a reply to this message.
Sorry about that.


Cheers,
Phil


> 
> Thanks,
> 
> jon
> 

-- 

