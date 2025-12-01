Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012858488;
	Mon,  1 Dec 2025 07:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764573191; cv=none; b=XOlsqtWQ1nGTJPTqlT3UyrZuxVlxWaCWamIPm2ZDqolR9T6tFURwjxtL9wRMmj2C8HbGkJYLGdUD5mCw9u4ansiRt+xBCEeJy/+b6/v8F/IwVLA7sZUQWGt/kCih2t9KxrEdX4Iy/jMSsxAUwmifZoUdNi06ZBXrbf09OFrE0xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764573191; c=relaxed/simple;
	bh=tan7erp1ZTKxUWHxvVMn+iQ7OvsvaEbwO0Ucja+nQPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYBWp7eQQVqviOCI8u1nFM9VPOYiO03Rm+SjPL+X7//MKmjTbsAw9SAlPdYYwR28gV18MyHJEVFHQ/bBtk7y0g+I6DTSEyEMR3N/h+IomrhnzIUZyBaYX904z7dcAmyzqi2PYdnotubqw+JnkGja1/Ec92MQ63miHDBt3fELDss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=tfvNDpWf; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="tfvNDpWf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1764573179; bh=oC5e19IhfsH6xgh10IQb7RxE2pgecoic4DeaK8bg9mo=;
	h=From:Message-ID:From;
	b=tfvNDpWfkoZuZ+9aitx7tOkorJ1aWiNoNtDLmUl/1X5H9GfkVoKPAgJ/ONtkGVuUj
	 xZWqLbZCZ2nOXj1iCZUyG9rzuLtWAFlLSzT0Vb7jR7142c20HlLUrJZOYz2sLo5ipi
	 +gPwRluTsdC4nBCqaConZZ+yznT0G9ZIDn3KxDpk=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 96C4CC0847;
	Mon, 01 Dec 2025 08:12:59 +0100 (CET)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 5B17CxIn023493;
	Mon, 1 Dec 2025 08:12:59 +0100
Date: Mon, 1 Dec 2025 08:12:59 +0100
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Security Officers <security@kernel.org>,
        kees@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: insist on the plain-text requirement for
 security reports
Message-ID: <20251201071259.GA23487@1wt.eu>
References: <20251129141741.19046-1-w@1wt.eu>
 <2025120112-sublet-parasitic-18da@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025120112-sublet-parasitic-18da@gregkh>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Dec 01, 2025 at 07:38:17AM +0100, Greg KH wrote:
> On Sat, Nov 29, 2025 at 03:17:41PM +0100, Willy Tarreau wrote:
> > As the trend of AI-generated reports is growing, the trend of unreadable
> > reports in gimmicky formats is following, and we cannot request that
> > developers rely on online viewers to be able to read a security report
> > full for formatting tags. Let's just insist on the plain text requirement
> > a bit more.
> > 
> > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > ---
> >  Documentation/process/security-bugs.rst | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> Looks good to me!  Given the number of non-plain-text emails with binary
> attachments we still get there, it's obvious not many people seem to
> read this file, but it can't hurt!  :)

At least it gives us a place to point to, saying "look at the rules".

> I'll queue this up if Jon doesn't, after -rc1 is out.  If he wants to
> take it, here's my:
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks! Oh BTW I'm noticing a typo in the commit message above
"full for" instead of "full of". Feel free to adjust it while
applying, though it's really not important (and no, I won't
respin a patch just for this :-)).

Willy
