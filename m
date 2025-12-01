Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB051E47C5;
	Mon,  1 Dec 2025 06:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764571100; cv=none; b=HBPFuqHGB/s7ITxbwKCgvS7qySwYXfQ3O3EsdCEpGSb+V08J8pARcqM2sVVMkVcylgo92FtXAI52EEDVzDkdeofRwXqdUSQMuTpLY/LP2iql/ExIij+KYTaz62xDiWEDOKFCOsOYoLKLnFkRZwpsL76Kr39uAawYiStL7WZw8Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764571100; c=relaxed/simple;
	bh=tc21357+IqlJiB1Y0fjXyP3jGW8IhiDMMCrs/Xc6yBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ycw4b+TeWZz7kBQhSGqMpgaGwDoFGfm7vMc/fNeUbplElvQV8HYNvNpSDK60DojqI/MhFpl4tNDFiRtSYJb6YGv/91h4U+jx5CwXZJy23aVgwAInRc6SZcv2NtonOReOBVOdW+8uhOQnmC50WjdV+v+WjloDE7yBFy4LnhXBgsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uNqA3Qbh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uNqA3Qbh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B023AC4CEF1;
	Mon,  1 Dec 2025 06:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764571100;
	bh=tc21357+IqlJiB1Y0fjXyP3jGW8IhiDMMCrs/Xc6yBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uNqA3Qbhub+NOvdCxPnu+f+33MiBsyWdMkUG/7/vKi617cDmW58EdRuPAb0dvF+Qk
	 N8KoCh+kTjJ4i9WM+pXFxnkSfdXOPhgSgoo9FHu18pAxb+21fTZhN5LKD4oAhdLxao
	 zMeD/PkFXzsp0xpyhka8IvIKhgx14x7dodofxzZg=
Date: Mon, 1 Dec 2025 07:38:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Security Officers <security@kernel.org>, kees@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: insist on the plain-text requirement for
 security reports
Message-ID: <2025120112-sublet-parasitic-18da@gregkh>
References: <20251129141741.19046-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129141741.19046-1-w@1wt.eu>

On Sat, Nov 29, 2025 at 03:17:41PM +0100, Willy Tarreau wrote:
> As the trend of AI-generated reports is growing, the trend of unreadable
> reports in gimmicky formats is following, and we cannot request that
> developers rely on online viewers to be able to read a security report
> full for formatting tags. Let's just insist on the plain text requirement
> a bit more.
> 
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  Documentation/process/security-bugs.rst | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Looks good to me!  Given the number of non-plain-text emails with binary
attachments we still get there, it's obvious not many people seem to
read this file, but it can't hurt!  :)

I'll queue this up if Jon doesn't, after -rc1 is out.  If he wants to
take it, here's my:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
