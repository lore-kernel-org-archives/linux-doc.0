Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C657937BE98
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 18:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706865; cv=none; b=SfZ/TROMiaindF+s0xS/zyy04Y4XHdEZFxmVwEvV5KgRNEZ7DUvZ7vcBzizRdAqCLNUKiZM+5kzwJ7kMg7yv7/uKUJ/GIJko+3lsC/wirGv9In8dpJiUK2lIGaPSO8tLOUAHYFqWnKwBSOaPpuStYhJY6qoUxgmyyXb3OEOXLho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706865; c=relaxed/simple;
	bh=O6OimzKD1xlS6Frl91Eg4/jvdk/NA4Un3exe+7jonxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0hfel6NYrrl55JWCWoSRuyM5q7RbIB4ifZtqYgTbB/oOfyL0cNjnDW5RyRuZOPwiUpT5p1GQoYyxI2EOLWz8d2ogF4cYXEDh/Lewdl250Jmb0m5RJzqtKSZ6nbbT5h8/JLoO0L2saNfkpSRLQ1Lbm4YYbZqdvYpu0/H2sSwy14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+mmqZdc; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+mmqZdc"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc6dd436c6so13124085ad.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 11:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783706847; x=1784311647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vK1yycrFvPnOHneU0oNi6DrjeWKqgXkTtqXMvxDGhZQ=;
        b=G+mmqZdcs0jO8PwuouqUz0af25DOsf8ysUuT6w/JdUZb+86uc/n1BimKSReR18OYbe
         9PkImlmJYekN/rctDqMv722YFQbGc2miKIz//KKcS18x756BAUG+70UV100zLJdYIdPe
         OS19SaJBHmrsHD0pqZdoubdYrky89nXRiGoTmYNmZCejXcRXuOtliw6+NG/7FtsTixdp
         gwRWecJb33MKp3I4QDqGw/46GM9u1GJnbpZ+Umbassa4Y0V+jH+xvonuYtWP4hCR7pOt
         2gU11ttWG8V0k/7ObjIPilGj4NEepzXluwL+HEfOqrzAKOp+iXkZIEXngdF/VkMaNtFM
         s5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783706847; x=1784311647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vK1yycrFvPnOHneU0oNi6DrjeWKqgXkTtqXMvxDGhZQ=;
        b=oBkBoPnzHh4M+ImcZtChmdeWZ4esqEsSSbFB3DQ6awromEydmdeMgah6oSFMXdHMg1
         jB173CF9aXZaMVhbccYx4OfYaL/Po8RUwsFvpk420WGrZrrWT9KYY9WkTl7Ge3PyQeFF
         8bix74yC1e2kJqNNPG7t5WuIyuMtLiqWJIyJS/cN3iJJzlWc2U8zvTxk6uP7XppMGhAW
         e57Hs91KIl42FQaNOwEGqSUMLIRK/4bF+CWu+bQc3RpcNsp4Hv+fqVVGUqXPhyGBQVuL
         Ewxseoc5zPOex6jdNLDJq/UtGny4mku8M24OtCH1JG7WlXR9/S7lJs7VDn6QlsfOkiig
         G9tg==
X-Forwarded-Encrypted: i=1; AHgh+RoKx9122mMHxvs2nwB5mDs7EmMuH19lAImYZOs69Y+ZuQAYnDPYhIh2a6blkoDzG62G4ayeeMBredg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlcFD6kpWGNA0T2T/nqeegt1m9QE69S0hc169TSL3kU5v0h/KN
	tqC44KITaROJcpAkqFg1WpLMS8+n+7N7Wphuxb8MSOLtjn4neYJ+LqRT1FuSfg==
X-Gm-Gg: AfdE7cl3bU8mm5nbe5wxH0B2uLWlOsMu26LSWM/NU6y13cbIYJyhQP0wM6QLCSx1g1c
	beL7cSHWubGNcILQ9PK9cir/xBxnqMz09TXmlttUkQ00Wwu3fNtk6Vjvob+18iH0/EiL12DoYsX
	/TT07cp6Fht+OVdV3tlR5qK6llk2xvp6nyIsHKLmUmyH+Ub9F7TerSAIIk8nMJyfFWt3YhHgYez
	RiAjLtrccufIXjTkF+wBqi2JEEAOVZseD4f0ZRQ8JZYkeSFs6lLj6jhod6IKF8Q9xGuifxUQfRm
	ELM1tN51KDXyOiFuzF4z4zpYYFwazVWZLwVmZQycuKml7PoV9cry+dvusu3CxukdoYNQUvCBFpN
	pLrsMAUgEFf9rcbh9VUZ+lflH7DI9HiZN73NLVuuklNY+wSAuyA0ELfrXda+fqd9gJk/ryvzDED
	kCtQUjxH8cM9ZBnwd8zJ6iJE/egS/Vm26CLd/+tkuyPRfnpi39+DV6z1o=
X-Received: by 2002:a17:903:2a88:b0:2c9:d8c6:1db8 with SMTP id d9443c01a7336-2ce9f284e45mr2337085ad.28.1783706847144;
        Fri, 10 Jul 2026 11:07:27 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm63356135ad.18.2026.07.10.11.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:07:26 -0700 (PDT)
Date: Fri, 10 Jul 2026 11:07:23 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
	corbet@lwn.net, dakr@kernel.org, david@kernel.org,
	decui@microsoft.com, haiyangz@microsoft.com, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <alE028DsCGeUwNh6@skinsburskii>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
 <20260710162749.GP118978@ziepe.ca>
 <20260710164743.GX118978@ziepe.ca>
 <alElv0EKjLQXMNK8@skinsburskii>
 <20260710180312.GD1803712@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710180312.GD1803712@ziepe.ca>

On Fri, Jul 10, 2026 at 03:03:12PM -0300, Jason Gunthorpe wrote:
> On Fri, Jul 10, 2026 at 10:02:55AM -0700, Stanislav Kinsburskii wrote:
> > The main customer for this new feature I have in mind is the MSHV driver
> > which backs VMs memory with HMM, requires userfaultfd support for
> > post-copy live migration and fast restore and it doesn't timeout.
> > 
> > I agree, that this current timeout value used by the other callers might
> > not be enough to repopulate the mappings with userfaultfd, but there
> > drivers would get -EFAULT for uderfaultfd-backed mappings without this
> > change anyway, so getting -EBUSY with the change instead doesn't look
> > like a significant change to the behaviour from my POV.
> 
> It sounds like it won't be reliable either then.
> 
> > > So, maybe the deadline should be resetting after every handled fault?
> > > ie the timeout really is only about the mmu notifier and we don't
> > > count the time spent handling faults or walking?
> >
> > The timeout was inherited from existing HMM users rather than introduced
> > as a new HMM policy. Some GPU drivers use HMM_RANGE_DEFAULT_TIMEOUT as a
> > budget for the whole range population operation, including HMM retries
> > and subsequent driver mapping work.
> 
> Yes, because we always had a timeout around the notifier because that
> scheme can sort of live lock. The timeout was to protect that only, ie
> limit the number of notifier retries.
> 
> Expanding the timeout to be outside what is bounded by the notifier
> retry is not right, and heavy stuff like mapping should be done after
> the hmm side succeeds and the notifiers concluded so they can rely on
> normal locking instead.
> 
> This is why I'm suggesting to reset the deadline as hmm makes forward
> progress, we really only want to bound the notifier retry loop not
> anything else.
> 

Sure, I'll modify accordingly.

Thanks,
Stanislav

> Jason
