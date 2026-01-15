Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3D21D8E10;
	Thu, 15 Jan 2026 10:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472267; cv=none; b=JFXpgLOuWSCrZg5F5esKtYRlOXlTtN4izSMb3SbXJhepH/eTaAeRoubr3SEveHOHSUyqOuiV45Z2ZNPEaFsWGMfM32L+TB8tQ726Q4gm9N7XzwywTJhlGS+/GwQ+pAntmZ0CkfMuoBIh2UC2JTOCN/Ri4AzN2JfN6ziY7Lxbwfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472267; c=relaxed/simple;
	bh=Jj7pFSsdisozqOOIEmCyq5pPihyG1xFbz6CgeX/HYtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVfraQOK9g2JizFouVqNUZAyoGs8577WmLRrpT4EDX8XHsIy1dmuToFAyhagUwplD6r67As6cD4WrC5N8tcHQFLIfM6aNUQUU+W4yaaBDamwSSmn99UNEjVtMEU/PGOK30KGKHfVujL/kUuz1akX7GR3Ntlr94vUDDMEVxKFmkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSGeqijU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSGeqijU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FFDC116D0;
	Thu, 15 Jan 2026 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768472266;
	bh=Jj7pFSsdisozqOOIEmCyq5pPihyG1xFbz6CgeX/HYtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lSGeqijUeEUNx6KS2GHQZjcy9fTaYiRF0zPx53QhY87ulbitKBEKD3C/bq4ozZe8d
	 GTGRro3lkxKyNuKYfA1fPNpBYcyfOG1XKMhZ7zmHSaUIHZOpywYsG5RlCB+YvKfLV1
	 Nqy/v+yGrF5shErvCHVqmI0RZkBBm6+/3FjxDDpeeWkADOm3RXpF+mCXWaeKZPvK3T
	 CbD0+ExLINNpyYoqIikPvgQeVTUd91hgrOSVc4QKRtrJKOaPoHyvZDrv3TEkDY4CHY
	 PoBp3QYn1Ml/+g1Q5na8OTiyW9AOkAsrs5tfAx5MpCrlOZmxtcZ3hPE+JGoXvlNYKd
	 yv3FdxrdLeAMQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vgKQC-00000003rXl-2jfJ;
	Thu, 15 Jan 2026 11:17:44 +0100
Date: Thu, 15 Jan 2026 11:17:44 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 00/13] Add kernel-doc modules to Documentation/tools
Message-ID: <aWi8REEsfMt9AnuA@foz.lan>
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
 <874iooul86.fsf@trenco.lwn.net>
 <20260114212030.28129f38@foz.lan>
 <87v7h3udlk.fsf@trenco.lwn.net>
 <20260115022921.6de58ec8@foz.lan>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260115022921.6de58ec8@foz.lan>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Thu, Jan 15, 2026 at 02:29:21AM +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 14 Jan 2026 13:46:31 -0700
> Jonathan Corbet <corbet@lwn.net> escreveu:
> 
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> > 
> > >> We could certainly rename it to something different.
> > >> But I really dislike having language extensions on files meant to be
> > >> executed as commands; you shouldn't care what language it's written in
> > >> when you run it.  
> > >
> > > I don't like it either, but Python is really picky on some things.
> > >
> > > The problem here is that this is a Python policy violation. To change
> > > that, one needs to write a PEP and convince Python maintainers to merge
> > > it, together with changes on python "import" directive.  

> > There is a reason that "pip" is called "pip"
> > rather than "pip.py" - the Python folks don't keep those extensions on
> > commands either.
> 
> This would be equivalent of having a tools/docs/kernel-doc like this
> (untested):
> 
> 	#!/usr/bin/env python3
> 	from .kdoc.main import main
> 	if __name__ == '__main__':
> 	    sys.exit(main())
> 
> where the actual argparse code would be inside tools/docs/kdoc/main.py

In time, I'm not suggesting doing that at all.

I don't like the idea of splitting main() into a separate file: at least 
in my head, the absolute minimum size of a script should be to be able 
to handle command line arguments by itself, without including a module 
for it.

> 	class docs.kernel_doc.MsgFormatter(fmt=None, datefmt=None, style='%', validate=True, *, defaults=None)
> 
> 	    Bases: Formatter
> 
> 	    Helper class to format warnings in a similar way to kernel-doc.pl.
> 
> 	    format(record)
> 
> 	        Format the specified record as text.
> 
> 	        The record’s attribute dictionary is used as the operand to a 
> 		string formatting operation which yields the returned string. 
> 		Before formatting the dictionary, a couple of preparatory
> 		steps are carried out. The message attribute of the record
> 		is computed using LogRecord.getMessage(). If the formatting
> 		string uses the time (as determined by a call to usesTime(),
> 		formatTime() is called to format the event time. If there is 
> 		exception information, it is formatted using formatException()
> 		and appended to the message.

I also think that we should move MsgFormatter to a separate file. What 
this class does is that it bolds arguments when argparse displays help. 
It has nothing to do with kernel-doc itself, and can be reused on all 
other places where we use argparse. So, placing it under 
tools/lib/python, outside kdoc dir, IMO makes sense.

The same applies to some other stuff currently under kdoc, like 
enrich_formatter.py. Once the series moving kernel-doc to tools/docs 
gets merged, IMHO the next step would be to do some cleanup at 
tools/lib/python, moving things that aren't independent on the actual 
parser to be outside kdoc directory.

Thanks,
Mauro
