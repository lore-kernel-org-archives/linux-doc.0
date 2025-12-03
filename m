Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56F21AA7A6;
	Wed,  3 Dec 2025 07:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764746213; cv=none; b=mQLg6QcGBwAilMWXi6WOmjjAoKgvQvLXMaogair2rvT6ul1c0l19SZp2e2A9XWTBnnKHQswYIOiUto3P842uqtDtj/hcDaPsTXLb1Yt4kYyvbw4vbZUi6AUJSKOOexO0f4ToNUi4L8klQdABWQMrSsIGPtpc49+sxccQVCo1ieM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764746213; c=relaxed/simple;
	bh=/4MOXI/zcW0lZ3+oLzjtMEP/PAo0fuq+1CWLScVA7E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HO2o/cej3Xq8PoXHfzFDzw70PfHnbnMgS0kFdf63YXXlJQkAcO+T5UwCdRBehG3epFAlUTrE+lbhPKlxcEMqswPB1QPHZLhgW84Vrledg3Ei9H6tzFl98cwuGkW0QBQWcHJ3iJj6gMg1PeS7R/O2CPx8hZ8K7ye/5kCWsBZaUg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=cBn5BkKP; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="cBn5BkKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1764746200; bh=95QaMTdvMk5I2DH3fpi9yj4HemewCOTHa2Mm6BxaoFY=;
	h=From:Message-ID:From;
	b=cBn5BkKP33l4AFoIweSB/bYL1SzUXdHZPKOC2sOtv9dEFhoBc/QMUsFBFQ2v+IDRT
	 KbjKoezT8ND+rMhw5m8NrnnrynkQit3aQbjqsv5v2Td2XCNYX712/Wg5zsTXhWAFcc
	 bgGHQ+qrwAvawskwP7NDoZ3QWgL8LCCxhzkx/lxM=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 549E8C0699;
	Wed, 03 Dec 2025 08:16:40 +0100 (CET)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 5B37Geug011927;
	Wed, 3 Dec 2025 08:16:40 +0100
Date: Wed, 3 Dec 2025 08:16:40 +0100
From: Willy Tarreau <w@1wt.eu>
To: Ingo Molnar <mingo@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Security Officers <security@kernel.org>,
        gregkh@linuxfoundation.org, kees@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: insist on the plain-text requirement for
 security reports
Message-ID: <20251203071640.GA11908@1wt.eu>
References: <20251129141741.19046-1-w@1wt.eu>
 <aS3-xTM5NvYLNEM9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS3-xTM5NvYLNEM9@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Ingo,

On Mon, Dec 01, 2025 at 09:47:01PM +0100, Ingo Molnar wrote:
> 
> * Willy Tarreau <w@1wt.eu> wrote:
> 
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
> > 
> > diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
> > index 84657e7d2e5b..c0cf93e11565 100644
> > --- a/Documentation/process/security-bugs.rst
> > +++ b/Documentation/process/security-bugs.rst
> > @@ -33,12 +33,16 @@ that can speed up the process considerably.  It is possible that the
> >  security team will bring in extra help from area maintainers to
> >  understand and fix the security vulnerability.
> >  
> > -Please send plain text emails without attachments where possible.
> > +Please send **plain text** emails without attachments where possible.
> 
> So maybe part of the confusion is that this sentence 
> can be read permissively, depending how the 'where 
> possible' qualifier is interpreted:
> 
>     Please send plain text emails without attachments, 
>     where possible.
> 
> Note how "it's not possible because my report is in 
> PDF" seems to allow for that in the permissive reading.
> 
> What that sentence should really say is something like:
> 
>    Please send plain text emails only. Please do not 
>    include any attachments, where possible.
> 
> This makes it clear that only plain text emails are 
> acceptable.

Well, honestly I don't think it *really* makes a difference.
Either the message is read, understood, and compatible with
the rules in place, or it is not. As you know, we're getting
regular reports as a password-protected ZIP and stuff like
this, and it's not changing because people follow the rules
in place. However those who quickly glance at the text above
might have been believing that markdown and HTML were plain
text. With the extra addition it clarifies this specific
point, and since most returning submitters try to improve on
their second submission after our feedback I think it will
help us deliver this "feedback" prior to their first message.

> Ie. something like the patch below?

I have nothing against it but I'm not convinced at all that
it brings any extra benefit over the first one. I'm fine with
both in fact.

Thanks,
Willy
