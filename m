Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2097E107
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 12:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014759; cv=none; b=Q5FOT4fnTQylhJTPqrAccAp8z2Rp7zlNvKrZ9IpDXx/kNrJly9lA3tvgqNlFOgaKmNDKIj4vUXeX1/QZelHgA265wvdGDM/kAvxYMe+sS6YBr/46iVl5lJ31bm5yqh3FtcV60jMz4jFze0Em2eeMPA5Ax3E0nlb35L+YHKl1/o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014759; c=relaxed/simple;
	bh=8xlTtxE3X+92aGW/fTfnR+mHT3RpJCPfsTDVXf0ahVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtmKkt9M/COCuhHJR81rYRAm+abF3l4w4cMpndfyxmVENr5iQQtq/YoQT19r057Zi7OEzX3VjWCNxhczlQKKuiyoYrlGF5INA17P9coXmGqeVCuprtjQYloNWJamkHahe8s2Qr01KAP1OJJmZwh2qwtczJmIJWmZFOJcwdNthgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Kpz7Abyt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Kpz7Abyt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DC9C4CEE9;
	Wed, 30 Apr 2025 12:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746014759;
	bh=8xlTtxE3X+92aGW/fTfnR+mHT3RpJCPfsTDVXf0ahVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kpz7AbytcBfqrhSkZRRgvOGrdP63vUgAAWUyyTnMxUD/tm3IfTALDtkTcnmGs4e48
	 wamDFJzYKZPnv5ZLaLdTUBNzrZWpL6t3hJ7DhkXOwiLHKIJgbfN6mtwaJ5FxFLmolC
	 xE5qsVKremRVMdKU+g6nLj9lnu01qQILBsgVP4Mg=
Date: Wed, 30 Apr 2025 09:30:31 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>
Subject: Re: [PATCH] docs: debugfs: do not recommend debugfs_remove_recursive
Message-ID: <2025043059-lustfully-endurable-0efc@gregkh>
References: <20250429173958.3973958-1-ttabi@nvidia.com>
 <2025042900-emblaze-enlarged-47e8@gregkh>
 <758ad68deb989eaf8a22ac2bd96915bed77f0f4a.camel@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <758ad68deb989eaf8a22ac2bd96915bed77f0f4a.camel@nvidia.com>

On Tue, Apr 29, 2025 at 06:24:40PM +0000, Timur Tabi wrote:
> On Tue, 2025-04-29 at 19:47 +0200, Greg Kroah-Hartman wrote:
> > No, the other way around, we should be telling people to use
> > debugfs_remove_recursive() instead please, and getting rid of
> > debugfs_remove() entirely.
> 
> Then why was 
> 
> 	#define debugfs_remove_recursive debugfs_remove
> 
> added back in 2019, and why was that functionality *added* to debugfs_remove?

So we didn't have 2 functions that did the same thing and no one wanted
to sweep the tree and rename everything at that time?  I honestly don't
remember, that was tens of thousands of patches ago :)

> I recently added a patch to Nouveau that used debugfs_remove() to clean up all debugfs entries
> specifically because it operates recursively.

That's great, I'm not objecting to that, just that we need to stick with
one or the other and I'd prefer the "recursive" name as that makes it
blindingly obvious what is happening here while without it, people can
get confused.

thanks,

greg k-h
