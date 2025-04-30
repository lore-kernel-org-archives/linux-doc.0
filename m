Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40744190676
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 17:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746033038; cv=none; b=T2IvTHntr9ra6bJa9pPNPUmsR4LuXB2oAaC7T9IP575tVkBFOVR5W7Itv4RUESwJO2buN/VO6F/QDT1cwKCmBTCl38csEUljQJ44GjyaGgMSbIXHqMxXAyeOjES5AuzUfoXaOh4xvAVCawDAGWeUt0fYMJxtpoqnLYu75oS2tCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746033038; c=relaxed/simple;
	bh=Z2hzfsT74QXsWSyPYQ2MP+sIRww4wlUbZcFCxsjcv0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2KoQ8wGRV8jRiSd/dU1fFNB9zHR74DSv5b0L2Ok7NUpk/3WHK1r5hhknXJcPwt3dQJFCtOh0vFIz9NJ8XDnsK66qxSAGZAxuSmf4C7Db3HTtAGa6VmEN2KHSNK9wpGOEWIiXKysvKkiISck74dJuIQBZsQ5yzi2PSYeT+M54ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OwtN4bpV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OwtN4bpV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C91DC4CEE7;
	Wed, 30 Apr 2025 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746033037;
	bh=Z2hzfsT74QXsWSyPYQ2MP+sIRww4wlUbZcFCxsjcv0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OwtN4bpVpijMluVUGo4oNN8duJHvlQ+x7jJ7QLpGuej3uX2RRB1dTmZFo73ivVJuZ
	 kXrSbgNccSF+3XnPKjoa0RmrU6kkne1Nc7js4DTOIZ7PtkG4NKJwTf5uXDswCDEThM
	 rbUfUVLJ0esrRZnP8wPMgDyBxJcz/aAZ2PC/0kWk=
Date: Wed, 30 Apr 2025 19:10:34 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>
Subject: Re: [PATCH] docs: debugfs: do not recommend debugfs_remove_recursive
Message-ID: <2025043011-spring-tabloid-7e48@gregkh>
References: <20250429173958.3973958-1-ttabi@nvidia.com>
 <2025042900-emblaze-enlarged-47e8@gregkh>
 <758ad68deb989eaf8a22ac2bd96915bed77f0f4a.camel@nvidia.com>
 <2025043059-lustfully-endurable-0efc@gregkh>
 <49df4b2db57f1a431ee18f319325306ac5d13f32.camel@nvidia.com>
 <2025043009-grueling-pretzel-086c@gregkh>
 <2835cafd300c0dfcd6d1c9d941f3253b08805055.camel@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2835cafd300c0dfcd6d1c9d941f3253b08805055.camel@nvidia.com>

On Wed, Apr 30, 2025 at 04:36:04PM +0000, Timur Tabi wrote:
> On Wed, 2025-04-30 at 16:57 +0200, gregkh@linuxfoundation.org wrote:
> > I don't really remember what we were talking about in 2019 for this, but
> > look at how many of each there are in the tree:
> > 	402	debugfs_remove
> > 	627	debugfs_remove_recursive
> > 
> > so we need to pick one and just stick to it.  Majority wins?  Shortest
> > function name wins?  Most descriptive winse?
> 
> How about "intent of the original patch wins"?  I'm pretty sure that if my patch had been merged in
> 2019, these numbers would be swapped.

5.4.0 came out in 2019, and the numbers there are:
	402	debugfs_remove
	461	debugfs_remove_recursive
So not quite.


But we are both ignoring debugfs_lookup_and_remove(), which I do
recommend people using over _both_ of those as there's no need to keep
anything around in the driver at all.

So that proves that you are right, and I'm wrong, as there is no
debugfs_lookup_and_remove_recursive()

> > So I'll defer to you, which one do you want?  You originally said
> > debugfs_remove(), which is fine, but you get to send a patch touching
> > all of those files :)
> 
> If you really want me to send out a patch modifying 600+ calls, I will, but I think that will cause
> more harm than good, and I'll just make more enemies than friends.  

A sed script for Linus at -rc1 is usually a good way to do this, but I
can throw some interns at it as well.  Or I can script it on my side and
just do a big push in one of my trees.

> All I was trying to do with my patch was have the documentation align with the code.  This would be
> a low-impact first step to replacing debugfs_remove_recursive with debugfs_remove everywhere.

Ok, fair enough, I'm now convinced, I'll go take your patch now, sorry
for the noise, but thanks for the discussion.

greg k-h
