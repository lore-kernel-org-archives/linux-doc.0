Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CB32517A8
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745950816; cv=none; b=QWXX/9YT+MFJN7+L/wlAFt7JrbPiwkignZpWNOu62lKzNV5gaWTetBmPZP0EVnBad2s13TBVqgey+P+KfkRd/k74nOblDQky+w63/ZLeBF8d7TaqstnJaKsM3nbd2RW3ZCSbcw1WKJImG0htwEPRmjeJNaVrfHKDaOVQsWy3xXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745950816; c=relaxed/simple;
	bh=/pU9ywNW6XmDQbd6J0DJ04nL3DIaDK3lyKNWIPkv4sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwpEInnC7wdkSS2CxMepAjNydP3hheFDLcE+S8iWTD/wSWm5IJxiMG77w6o8+BAxWJ9IwK680V8769OhRgz0ZQzV85m3EulepWV88VNi4p6fC/h7AMcKb0StKZvFHR1C4QZ6KGfN1XKE/hjXVk46Vq1tgGV4rYitb9YKvfEJgCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yxjE8Npj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yxjE8Npj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E75C4CEE3;
	Tue, 29 Apr 2025 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745950816;
	bh=/pU9ywNW6XmDQbd6J0DJ04nL3DIaDK3lyKNWIPkv4sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yxjE8NpjcdKxbfeHVvvC+ii7X96bw/6qem+mKj2+gU+xRwHCb2dbQJRJIuFHd0fmP
	 gX2WH6hwS47LMaT+Ny1AZHavkayvqIf81lr2XjhMSX8hT6Ada8ATP/tyhscCWVbERf
	 wmwbbrNt/ll/rTbFadsp5O0gWBh8WuaEqX303Nio=
Date: Tue, 29 Apr 2025 19:47:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] docs: debugfs: do not recommend debugfs_remove_recursive
Message-ID: <2025042900-emblaze-enlarged-47e8@gregkh>
References: <20250429173958.3973958-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429173958.3973958-1-ttabi@nvidia.com>

On Tue, Apr 29, 2025 at 12:39:58PM -0500, Timur Tabi wrote:
> Update the debugfs documentation to indicate that debugfs_remove()
> should be used to clean up debugfs entries.
> 
> In commit a3d1e7eb5abe ("simple_recursive_removal(): kernel-side rm -rf
> for ramfs-style filesystems"), function debugfs_remove_recursive()
> was made into an alias for debugfs_remove():
> 
>     #define debugfs_remove_recursive debugfs_remove
> 
> Therefore, drivers should just use debugfs_remove() going forward.

No, the other way around, we should be telling people to use
debugfs_remove_recursive() instead please, and getting rid of
debugfs_remove() entirely.

thanks,

greg k-h
