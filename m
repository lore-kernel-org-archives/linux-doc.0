Received: from mta0.migadu.com (out-103.mta0.migadu.com [91.218.175.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2174746B1
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313410; cv=none; b=Vru3PaCbY+Z4jJ4gnB0g+cCDMEE4xywPP/o2GAPGAAAEGGFIjbqp3D2P8b/kEYKT2hL2fk5SJxM6xo1L02mwFHqXkQaYpxnVA8+0FipYUrFhRWoeCOEm6ZZygQAahB79D5lu4ynKOUbLdVw0jcx6mi9vd2rPcW7qNl7wfuTPerI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313410; c=relaxed/simple;
	bh=94FzTG0viXjv60CCNqhbLqzH/WNHQbiGMZY2VeSDqnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UONeboxdwE1fT5MkXcx5QUr8E8tjT0UuBHGl8XCQL26ujBGC949yCIOsybjc2LV95+2kCk1AnNqtkRfCDMcHoO+baA4qGH751G6M3gLrBetcQp4OoFDNCZlqkruLBcCyMoaIKrPI3Huu3zIk+phRDiledfBdiB3l03WpVBoSsV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Gt3nfGZD; arc=none smtp.client-ip=91.218.175.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Gt3nfGZD"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=94FzTG0viXjv60CCNqhbLqzH/WNHQbiGMZY2VeSDqnM=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787313405; v=1; x=1787918205;
 b=Gt3nfGZDAo/H1XqlXaEcExKA7RTJG/4uiENCIvKh+iWH0bb3dglKMvpt5atKQSX2IB1W+O/z
 c26gSRy+nuscgsLDhJrgLO2weVLPtNaxl3X0o9SbIfOWLUxSWXmy7gh+gI4L4YpJuxxYh2IVI2Q
 5hOLtjXUTYEj7yV+iGoaOmfd1iGM4p2AYcvAFJZ9x4BWRh4wERDDGSPanEriZMqTK1DF1ELLGsB
 qysHNJ+4taT3Hz0yMLmn/yGTgXMOR1RhI8YXzq+qxebcA757Z4MEupc75OfUw2TeccPI9acNaiz
 XVEjhT5FjQ7CLds+3xKqFaw6/vS4AWtBUgIVPQmxdVCZQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 47e24377b16a1084;
	Fri, 21 Aug 2026 11:56:35 +0000
X-Mizu-Trace-ID: 47e24377b16a1084
X-Migadu-Flow: FLOW_OUT
Date: Fri, 21 Aug 2026 19:56:29 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Update maintainer-pgp-guide.rst Chinese translation
Message-ID: <aog87UzDIz20XzU_@wyuan.org>
References: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
 <5b107aad-2826-4bf6-97aa-14592131b6a8@hust.edu.cn>
 <aof8rCuuwzHUNtka@wyuan.org>
 <7232a999-0bb8-45fa-8d33-a11efc661012@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7232a999-0bb8-45fa-8d33-a11efc661012@hust.edu.cn>

On Fri, Aug 21, 2026 at 07:18:56PM +0800, Dongliang Mu wrote:
> > [...]
> > Thanks for emphasizing this. While I do remember I used "make cleandocs
> > && make htmldocs", and checked among those long lines of red warning
> > output to find anything caused by my commit, I indeed didn't notice this
> > warning appearing at the early stage of the compilation.
> > 
> > It seems that I need to have my eyes checked soon. ;-)
> > 
> > Apologize for my recklessness.
> > 
> > Even so, do we have any way to distinguish these long-standing warnings
> > from the new warnings that appear during compilation? In fact, every
> > time I was worried that I might not have noticed the newly appeared
> > warning. Unfortunately, this time it really happened. (For example,
> > setting a new color? for new warnings?) Do you have a better idea or
> > tips for this?
> 
> My suggestion is to keep the log in each file, and you can easily observe
> the diff. Otherwise, even I can ignore some warnings.

Ah, makes sense! I was actually wondering earlier why we need to put
this log in the directory instead of just keeping it in the CLI.

(I definitely won´t admit that the log file annoyed me a few times
because I accidentally included it with 'git add .' and then had to 'git
commit --amend' right after) ;-)

Very useful, thanks!

> And many contributors are coming together to fix those warnings. If they are
> done, all new warnings are easily captured. Let us do more contribution to
> help this.

Yeah, eliminating these warnings at their root is the straightforward
solution.

And that's exactly what Jon expects:

Kernel Recipes 2019 - Kernel documentation: past, present, and future
#Build warnings

https://youtu.be/1LuAIUKqKDk?t=876&si=XgHhHtukyjyDdtzF

It'd certainly be worth spending some time with folks from those
subsystems to get these warnings fixed once and for all.

> > Btw I've been trying to know more about Sphinx and kernel-docs, hope my
> > mistake won't happen again.
> 
> That change can fix problem. The underlying problem is RST syntax. Maybe you
> can have a look at this or query it in the LLM.

Absolutely. I did have relatively little experience writing rst before.
But that's definitely no excuse - I'll try to pick it up quickly.

Thanks!
