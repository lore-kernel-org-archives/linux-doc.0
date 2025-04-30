Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D191A315A
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025075; cv=none; b=RjMmQPF4QWL0bLhM7+tWrod266trDLUFlUQVb0CCajNDo3X8xOnCt+0B1kkktOpPdDQHT/KNvt69yvAVeXO17lIeIaGzWQr8yo3JzOua/I9QvWFLqzK9qmWnbe3mxiJJepB+V0vdhvwA9i37xH5bZSH0VQu13vzfRb21aacU56k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025075; c=relaxed/simple;
	bh=gr0KJqnKYxgabyiFi6/7g0GTHgvNFnjRy0hBmL8VjVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vyu7Mt0qJDlgyfWvml7BrlGe4K9auUP9dIsncIzOhogk1vGEWbGaoomXtQFTKloljcLbIfvQE8XLWYzBsnlgG63a5Z4mo4cM8lfN7veAuQUO5SAzxdHBNMoZQOO/nN/NyiSuLysojZRVYE/Xdhb3RAsAkdx/P0bp/UZ51WVa7pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lM4JK2s5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lM4JK2s5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30F2C4CEE7;
	Wed, 30 Apr 2025 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746025074;
	bh=gr0KJqnKYxgabyiFi6/7g0GTHgvNFnjRy0hBmL8VjVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lM4JK2s5EWthTICh8pIPEID2OrBw9dnFcIaatkc3VNVEdZW050VeMmlJE6nsRZ6RY
	 t1oJQrujEN6wyz+hbX6Fvy9YcWCXo4Iy/Wi4MiCdKzQYqnzRk/3Udg+Ch+XEkeP8gs
	 NpM8OPms4hX/JzZSpITYdu4ZFj9FocDPsE85XlQg=
Date: Wed, 30 Apr 2025 16:57:51 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>
Subject: Re: [PATCH] docs: debugfs: do not recommend debugfs_remove_recursive
Message-ID: <2025043009-grueling-pretzel-086c@gregkh>
References: <20250429173958.3973958-1-ttabi@nvidia.com>
 <2025042900-emblaze-enlarged-47e8@gregkh>
 <758ad68deb989eaf8a22ac2bd96915bed77f0f4a.camel@nvidia.com>
 <2025043059-lustfully-endurable-0efc@gregkh>
 <49df4b2db57f1a431ee18f319325306ac5d13f32.camel@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49df4b2db57f1a431ee18f319325306ac5d13f32.camel@nvidia.com>

On Wed, Apr 30, 2025 at 02:27:18PM +0000, Timur Tabi wrote:
> On Wed, 2025-04-30 at 09:30 +0200, gregkh@linuxfoundation.org wrote:
> > > added back in 2019, and why was that functionality *added* to
> > > debugfs_remove?
> > 
> > So we didn't have 2 functions that did the same thing and no one wanted
> > to sweep the tree and rename everything at that time?  I honestly don't
> > remember, that was tens of thousands of patches ago :)
> 
> I get that, but it seems pretty clear that at the time, the intent was to
> replace debugfs_remove_recursive() with debugfs_remove().  The C function is
> named debugfs_remove() and the macro is called debugfs_remove_recursive().
> 
> What you're saying now is that the C function should be renamed to
> debugfs_remove_recursive() and the macro should be swapped.  I don't think
> that's a good idea.

I don't really remember what we were talking about in 2019 for this, but
look at how many of each there are in the tree:
	402	debugfs_remove
	627	debugfs_remove_recursive

so we need to pick one and just stick to it.  Majority wins?  Shortest
function name wins?  Most descriptive winse?

Naming is hard.

> > > I recently added a patch to Nouveau that used debugfs_remove() to clean up
> > > all debugfs entries
> > > specifically because it operates recursively.
> > 
> > That's great, I'm not objecting to that, just that we need to stick with
> > one or the other and I'd prefer the "recursive" name as that makes it
> > blindingly obvious what is happening here while without it, people can
> > get confused.
> 
> Well, wouldn't you think it's confusing to call a function named
> debugfs_remove_recursive() in order to remove a single file?

As debugfs doesn't really care about files vs. directories it just
doesn't matter.

> If you want, I can change the documentation to say, "please use
> debugfs_remove_recursive() to remove directories, and debugfs_remove() to
> remove files".  

Let's just pick one and be done with it please.  Especially now that we
are reviewing the rust bindings for it, let's not end up duplicating
that mess there.

> We could also modify debugfs_remove_recursive() to issue a WARN if it is
> called on a file.

Never call WARN().  If you do, you just rebooted the box because a few
billion Linux machined have panic-on-warn enabled.

So I'll defer to you, which one do you want?  You originally said
debugfs_remove(), which is fine, but you get to send a patch touching
all of those files :)

thanks,

greg k-h
