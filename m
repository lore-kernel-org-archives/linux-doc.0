Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D972EFDA7
	for <linux-doc@vger.kernel.org>; Tue, 17 Jun 2025 20:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750192192; cv=none; b=GWYO3Y477QIQGSmq+tP5JTjFQIsMWoerFKY/foeRUHGCWUTvhBBNgML/GCNw0GPXGnNdiKlGNoHlBhDZ0tiZS2dca51IQthDTZ3Zrz0M9q1rKFDsSkUMUBvfA+cf7QoOwF9KC9oudMNtaqgXdQJktXzhtitiVmmBRJMh1rBWlZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750192192; c=relaxed/simple;
	bh=35CV/gK+btbWVOR2Os5whb1XOoazUu+t9IYFoUKVxgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/0D3qsVdNWhbzlZ8OoirPDJNS0VLFtLYwxVkdTiVpDeybqKD4CM35UUWaY/IRuJS1WRuNWD6J/GnzqdMQNEhBULEmJ4OKpHRHYBhJQ7LzJzl5qFprhjQJJ/6qw0SQYdA2ih+o0FrcWZHpcMZG2H16mTtcQuYZ509FE0eDL/aQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D7f0tZkQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D7f0tZkQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BE9C4CEE3;
	Tue, 17 Jun 2025 20:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750192192;
	bh=35CV/gK+btbWVOR2Os5whb1XOoazUu+t9IYFoUKVxgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D7f0tZkQFrwCqoit+vr5JQbPE4IlqGQ0LbA4MsRymUBVbismSHB15v+2lF8bFo520
	 uLziVY5/hzUQdVCBcXEG32tM9fSuPaQMipp452yyYZcuS2ejYEmBi0LtpwoQG1cBiw
	 4XcX0mIhEUPQHDSQcG/G+r98aFZ313PdZgbeEXW4=
Date: Tue, 17 Jun 2025 16:29:50 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Error at www.kernel.org/doc/html/next/ since next-20250610
Message-ID: <20250617-translucent-crouching-poodle-a826e2@lemur>
References: <de7bae91-3200-481f-9db2-c0dc382c91dd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <de7bae91-3200-481f-9db2-c0dc382c91dd@gmail.com>

On Mon, Jun 16, 2025 at 08:18:22PM +0900, Akira Yokosawa wrote:
> I'm not sure but there might have been some minor incompatibility
> between past versions of dependencies.
> 
> I'd rather upgrade Sphinx to 8.2.3 (latest).
> 
> Konstantin, could you try it?

Looks like 8.2.3 requires python-3.11, which I don't have readily available on
the system that builds the documentation. However, upgrading to 7.4 also fixed
the problem, so the latest next tree is now built and should be propagating
shortly.

Thanks,
-K
