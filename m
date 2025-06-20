Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95186236442
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 13:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424746; cv=none; b=kMrtaPMWYFdVP76/xtdA7Y7X6256s/lnQEl2HFfANwrxMIBUQu8KR+8sf5oKxhD5FIMz1e/M3wWqo1Uue5jDQU4XTELMweg9x4YEbhYi3+5RYJAb8EA9S9Wez1UY/NGQv8QLynIK5Jrqvsjd/lgEIK8zPEl/QFO+8Q6H4JxUNDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424746; c=relaxed/simple;
	bh=qmCqg2hFZAcbNw/u9O3xPXu9VQvRIl9eCn09TUpjt/o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bmU9mCy0LZH4BB32rT+0+GG9TchVgWFCLlfz+C1TuB48Cq5BWgIawgR6cL/ihJ1SJCEKtjOjLr7GJ1AXffOWYIRnVhBKpwZkUfUI+qHqSkzvh6tRrTd8YR77CP4i3yDQBpTGgxqPXj5YNAmbxcE+nhVNM3HWxsFtNy7ehJTpg+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSUM9X9p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSUM9X9p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BBD3C4CEE3;
	Fri, 20 Jun 2025 13:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750424746;
	bh=qmCqg2hFZAcbNw/u9O3xPXu9VQvRIl9eCn09TUpjt/o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lSUM9X9pgm+MV5FaPmnOl7qQWeniag8hidvAB+cbZESY6zYvAw4H/e4z9a1sOTa2d
	 VIFOyF5hiaG7O7bbWvwAswlXtgHfSBxuZleruwb2mrXfpNhxzmLQn65q9uK9F3ZnJq
	 Wl/nGG7dJQuhMNj4Q0Yx/eIst6HoQxMsWhIuliJAMxCOpmN6ZDkYZ/dIEWQJ91dYLj
	 ZTG/OQF26T51ix9EJH2yjN3hVHrEvnAKHaXWiczfzv7lLn+7dgvSkUwfjp/nCE4Bff
	 Nm3azososPT0FVbl/BQUUmpqfuPhp0Ul8NDl+O8zAxm0YsfplEW9pURB63tKo523wm
	 YIKSWGpZ5hGPg==
Date: Fri, 20 Jun 2025 15:05:39 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: docs: sphinx: avoid using the deprecated node.set_class()
Message-ID: <20250620150406.3e2291c2@sal.lan>
In-Reply-To: <528f0354-1869-4cfe-b71d-fe169b2bfc76@gmail.com>
References: <87wm97fmn3.fsf@trenco.lwn.net>
	<03285fe4-61f5-429f-9535-5c826536d4b7@gmail.com>
	<20250620094430.212779e5@foz.lan>
	<528f0354-1869-4cfe-b71d-fe169b2bfc76@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 20 Jun 2025 20:14:57 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> Mauro!
> 
> On Fri, 20 Jun 2025 09:44:30 +0200, Mauro Carvalho Chehab wrote:
> > Em Fri, 20 Jun 2025 11:22:48 +0900
> > Akira Yokosawa <akiyks@gmail.com> escreveu:
> >   
> [...]
> 
> > 
> > I didn't test it yet, but yesterday I wrote a script which allows us to test
> > for Sphinx version breakages on multiple versions in one go.
> > 
> > Using it (and again before this patch, but after my parser-yaml series), I 
> > noticed that 6.0.1 with "-jauto" with those packages:  
> 
> Why did you pick 6.0.1, which was in the middle of successive releases in
> early 6.x days. 

I added all major,minor,latest-patch version since 3.4.3 and added to
the script. I didn't check what of those are inside a distro or not.

> No distro Sphinx packagers have picked this version.

The hole idea is to have a script where we can automate build tests
with old versions. Perhaps it makes a sense to add a flag at the table
indicating what major distros have what sphinx version and a command
line parameter to either test all or just the ones shipped on major
distros.
> 
> Just see the release history:
> 
> [2022-10-16]  5.3.0  ### stable ###
> [2022-12-29]  6.0.0
> [2023-01-05]  6.0.1
> [2023-01-05]  6.1.0  6.1.1 
> [2023-01-07]  6.1.2
> [2023-01-10]  6.1.3  ### stable ###
> [2023-04-23]  6.2.0
> 
> The crash you observed is hardly related to this fix.

Almost certainly, the breakage with 6.0.1 is unrelated to this
change.

> I'd ignore this report as a random noise.
> My Tested-by: still stands.
> 
> Regards,
> Akira
> 
