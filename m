Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE6C3033FD
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 20:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781555736; cv=none; b=lwcQkvPT+Hu51oIJHLPw+VNYx65oXdBU0gEEorOUJ0uXK6Qo0WlKGMD8e9wixCvcXhW3/gZ4POAaWaGzaUwjNCURM9xRuRaJiUeltFb+gFSsNEmphhZ96KKuFfGBSYb9VH0UllZTySfS733E4bq5gX0pDP8KikPHBF/W0hSJKPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781555736; c=relaxed/simple;
	bh=Drzz/kl8wqpnOalyeG0tHOz9kyf2y38JBrqmPNjM9DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/lKFC9qEgC6X4xKjyBU8Eu+2HtxVGB56fbNM0aO1xIS/llz6Hrz5mVovSbrhxHTqAe6VcO2cA746Rxt2h61W8nDj6LUtXO6p+zzqUzy3q7W7Ex2jjYyWYFe0QofZgyzphMUF1uj/bL+QX4ki+HV65k5NIp2Hz/XHOJPFnY1qRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Crf148nX; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Crf148nX"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e6b5737bb2so3250363a34.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 13:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781555734; x=1782160534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XJmil57CketSzFiTcNCfca+Lsiyi60LhfLLDJX5+Qv8=;
        b=Crf148nXJEen4XxN/aqt6oZ3cNgnSHN11+6fYoAwM1VUFpiLFHcPLI/XecK/Y3qkm+
         kJ4VbHF0sx8t4LuH4E1FVlx9/3uwY9b84q/TpzuJOIfUdWW0SJK7rfuI36/n/wnePJoF
         qJZb8HEwmMl1QJY3qm1j3kEOiLRHFyQ74uGT+jpAz3sFBl46Gd9neTJuLhhiP+L1qM0l
         2Sp7ri7HtwgUFf2+SeWpAsZd+PhFYj6P1mSLt7gGLPiEpC/JCDdvnkGOP34/euZtBkP1
         meZLbpg4PY3oeqdTPsUGFqN1fpy3ZetKxcBU1VbRbXuy1xpcxVWciU0Xd7NuV0Q4kMnN
         /5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781555734; x=1782160534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJmil57CketSzFiTcNCfca+Lsiyi60LhfLLDJX5+Qv8=;
        b=K2QZ55L+q6tZsFpjZ0ss2+8vT2Ud/20H4IoakDsCMvLmdEinckCPipMJr+XV4Sk12H
         HPcswnPu341yUH47Az0LJKakNmcFYx8tQObfjbejHGduW76cfGx45WjQSI2FhFKE+Cwc
         CWnskNKsmQB4wVeut4e9p5XeATE2swQedjpgUtKqlwLInSNDTfwZOQJPjxs4R8HqlZ3b
         rZKhWQWny0W5EOOEKOVtBGJ2r/8Rh3FlH8wJUExHDHAyAhICbYORQ1Ohb1xp5onAJqkb
         95C9OZCo34FB8bazaYJnBvZQM99NCNJesdbnDOAnHOtUV3FbFUdjKMeYyXTUESudluw8
         OHDA==
X-Forwarded-Encrypted: i=1; AFNElJ8V4W8j+Xn4fvVYZTdDe5aZDfh7HFMt1ZdabQUwmZWdeFH94Dpof21HMWC7vzDUpQOiP7JC3OSah0A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zNrRF2juxLTa072AT3C/jpOfnp4D3IyvfOr3gO8xU80Ngm+f
	lAuaDnST4oVt55IP5kw5QxHBBVX9Er5iZJZ16/mVqyp0JFtJ2QMKL2wgapHhnd/7XQ==
X-Gm-Gg: Acq92OEUZaiOgTtspwpsrm+S8Xg9ZRlDKAAwM7UaaUgkHyR0tlVlKC/xBRztQRaM1c7
	VvuyHV+dbDudL71j4p3e6/ZMPwEWI9BQMLndYxdoTs/lMgyWjTliO5OvqJGn0HR5r2AqzsGP4Su
	074KU4X6vVCUtMZ1TScG1zVojYktKOaUObl6AZETrnwoQ7AjeZwrZp+KEiDf17oZNYqOwX/D7aW
	CRaoHw4/ijvCxtxkeOgDaYXgE4WyyoK87Nid4UdeFdNkx4c0/1e2I5Wqs50LrFaW9g0XlfWPsBy
	fXxSdi+Zm6TOS2WoXQb8F5qzkQqD3GOwQRuQXc2nSy6eVPtsjNixzUJ2BvIsgifIiIfj0snryy7
	U4X4QWPPh+U2khJM4N3gJQpFnNsQm+S9zzTbQJct4UQmczag7nvYdyc+ZE7hlM6iyCh+MVhSj2k
	I+0MH4sUuo2or3F4YXR6IlZvhBmmpTLnPe4HWxSS/WWZgYZn1uaMLZntUmtg==
X-Received: by 2002:a05:6830:82ce:b0:7de:4ebe:e44 with SMTP id 46e09a7af769-7e784663898mr10515153a34.2.1781555733915;
        Mon, 15 Jun 2026 13:35:33 -0700 (PDT)
Received: from google.com (57.221.30.34.bc.googleusercontent.com. [34.30.221.57])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f6de65bsm4870881a34.19.2026.06.15.13.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 13:35:33 -0700 (PDT)
Date: Mon, 15 Jun 2026 20:35:30 +0000
From: Neill Kapron <nkapron@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH 3/3] usb: gadget: f_fs: Introduce rw_proxy file
 descriptors
Message-ID: <ajBiEqs_Nhu6HSL-@google.com>
References: <20260614181006.3648010-1-nkapron@google.com>
 <20260614181006.3648010-4-nkapron@google.com>
 <2026061503-ripening-jokingly-eb4e@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026061503-ripening-jokingly-eb4e@gregkh>

On Mon, Jun 15, 2026 at 04:35:39AM +0200, Greg KH wrote:
> On Sun, Jun 14, 2026 at 06:10:02PM +0000, Neill Kapron wrote:
> > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > index 4c1bafb3eef5..0ccfdcfb1810 100644
> > --- a/drivers/usb/gadget/function/f_fs.c
> > +++ b/drivers/usb/gadget/function/f_fs.c
> > @@ -159,7 +159,9 @@ struct ffs_epfile {
> >  	struct mutex			mutex;
> >  
> >  	struct ffs_data			*ffs;
> > -	struct ffs_ep			*ep;	/* P: ffs->eps_lock */
> > +	struct ffs_ep			*ep;		/* P: ffs->eps_lock */
> > +	struct ffs_epfile		*epfile_in;	/* P: ffs->eps_lock */
> > +	struct ffs_epfile		*epfile_out;	/* P: ffs->eps_lock */
> >  
> >  	/*
> >  	 * Buffer for holding data from partial reads which may happen since
> > @@ -219,17 +221,20 @@ struct ffs_epfile {
> >  	struct ffs_buffer		*read_buffer;
> >  #define READ_BUFFER_DROP ((struct ffs_buffer *)ERR_PTR(-ESHUTDOWN))
> >  
> > -	char				name[5];
> > +	char				name[10];
> 
> Why change the size?  Shouldn't that be a separate patch?

The size change is to handle the new proxy file, in the format of
'epXX_rw' (with a null terminator). The size of 10 is a remnant of an
earlier version of this patch which had a slightly different naming
scheme. I will update v2 with name[8] to which will properly reflect the
necessary size required.

> >  	atomic_t			seqno;
> > +
> > +	int				opened_count; /* P: ffs->eps_lock */
> 
> Attempting to track "is this file open or not" almost always fails
> horribly.  Think about file descriptors that can be dup() and passed
> around, the kernel has no idea what is going on with them, nor does it
> have to.
> 
> Yes, we do track if the file is opened or not already, but I'd argue
> that too is broken and should probably be removed and just use the
> normal file descriptor logic instead.
> 

Ack, responded below.

> 
> > @@ -1378,8 +1393,18 @@ ffs_epfile_release(struct inode *inode, struct file *file)
> >  
> >  	mutex_unlock(&epfile->dmabufs_mutex);
> >  
> > -	__ffs_epfile_read_buffer_free(epfile);
> > -	ffs_data_closed(epfile->ffs);
> > +	spin_lock_irq(&ffs->eps_lock);
> > +	if (epfile->is_rw_proxy) {
> > +		epfile->epfile_in->opened_count--;
> > +		if (--epfile->epfile_out->opened_count == 0)
> > +			__ffs_epfile_read_buffer_free(epfile->epfile_out);
> > +	} else {
> > +		if (--epfile->opened_count == 0)
> > +			__ffs_epfile_read_buffer_free(epfile);
> 
> If you drop the opened_count, shouldn't these buffers just get freed
> when the structure themselves get freed?  You are treating the count as
> a "reference counted structure" in a hand-rolled way that might not
> really be right here as it's kind of hard to prove.
> 
> Either use a real reference count for the whole structure (i.e. kref)
> because you need to, or just tie the lifetime of the buffer to the
> larger structure itself.  Otherwise these fake references are going to
> be a pain to track that all is correct with them...
> 

I was concerned about the implementation of opened_count, and was
pursuing a proper kref approach, but it became a somewhat invasive patch
and I didn't want to pollute this patchset with said change, as I didn't
want to potentially introduce issues for users which did not need this
series.

Changing the buffer lifetime to match the larger structure is
straightforward and clean. I will implement that in v2 of this series,
as it fixes an existing issue.

Thanks for the suggestions,
Neill

