Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC85D1DE4CD;
	Tue,  3 Feb 2026 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135847; cv=none; b=LzTEe1Li66PIt6cbjlPczv7HV9dP0dnHfaL+Jkh0LIyWRORlf8KlBO+AFpgYIdusXUz9h2rCZ38qhnyV5aPdaVcY3/5W/pGTFTWMuoPHNmsliI/pIlGRQhAfKz6jMssKd9CVJMbyjNrnuCDfax6L5TwIkLGWkrdz5kyzY+EZmb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135847; c=relaxed/simple;
	bh=fiyVSFhX7GFRK2AOu3Y+y6KzJRa4zqUdhZBSYQX4TbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQAGJUQ8/Dax2cmdC7c4nhQG8tnLNzpNkTndZz7Ev1X5RPz5FAJ0MWXOm4lGqPrSr3CZzzTUbGMpoFngjr7C1tfcmhald07dnaxWlRocPE7XK71OaVrGbXzqDatl3P1hhDH5bbsnfz4kkxXXsmQga60KTcfeWVIzThWin68cBjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubD46i5v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubD46i5v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675E0C116D0;
	Tue,  3 Feb 2026 16:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770135846;
	bh=fiyVSFhX7GFRK2AOu3Y+y6KzJRa4zqUdhZBSYQX4TbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubD46i5vhN8CrARAYM86VQrB7cYk1nZr5KGvOhoTc/LWgN7PaHka9HaJQ9cKl4jVz
	 RJg8nPQ74mj6c0buEkEXu59UVcJUyyVWsRHevluJqjxt/PvOU17qGBnS68FkYXU9j6
	 C0iIzlPvQyhhoeFSgspgGbVse3SqIPTrWRfZkucz3eaFv4BO6xWU9z6yylThjV5P8X
	 d77tEY1lFgHyK9hrOVUT4AufuWFZpzQuCVD844ZoNuKHzkuWeNzXDoj5FqVsvJqCaA
	 TgF0HEptWtbRfc+xcwvXkq+UfS3su2otL9uwzPh9gqG6nmVCG5V/c682G8VqwJySkX
	 PctB23sDD7p3g==
Date: Tue, 3 Feb 2026 11:24:05 -0500
From: Sasha Levin <sashal@kernel.org>
To: Alexander Graf <graf@amazon.com>
Cc: Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	nh-open-source@amazon.com,
	Nicolas Saenz Julienne <nsaenz@amazon.es>,
	Hendrik Borghorst <hborghor@amazon.de>,
	Filippo Sironi <sironi@amazon.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Jan =?iso-8859-1?Q?Sch=F6nherr?= <jschoenh@amazon.de>,
	ricardo.neri-calderon@linux.intel.com
Subject: Re: [PATCH 2/2] hpet: Add HPET-based NMI watchdog support
Message-ID: <aYIhJWiBtiCF4UCr@laps>
References: <20260202174803.66640-1-graf@amazon.com>
 <20260202174803.66640-3-graf@amazon.com>
 <87jywu3yov.ffs@tglx>
 <1e13c61d-8581-4ece-b31c-7aa771ba7bc2@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1e13c61d-8581-4ece-b31c-7aa771ba7bc2@amazon.com>

On Tue, Feb 03, 2026 at 01:36:30PM +0100, Alexander Graf wrote:
>
>On 03.02.26 11:32, Thomas Gleixner wrote:
>>On Mon, Feb 02 2026 at 17:48, Alexander Graf wrote:
>>>(Disclaimer: Some of this code was written with the help of Kiro, an AI
>>>coding assistant)
>>You could have sent your change log through AI too so it conforms with
>>the change log rules ...
>
>
>Maybe we should introduce an AGENTS.md file in Linux that tells the AI 
>tool to do that automatically? These tools usually don't read README 
>files. :)
>
>Looks like - similar to the HPET watchdog - that never concluded though:
>
>https://lore.kernel.org/lkml/20250813203647.06e49600@gandalf.local.home/
>
>Sasha, are you going to resend your @README commit with a single 
>AGENTS.md? FWIW that is pretty much what everything standardized on by 
>now.

Out of curiosity, can you test your coding assistant on a tree with
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/Documentation?id=78d979db6cef557c171d6059cbce06c3db89c7ee
applied on top?

 From my previous testing, the coding assistants I tried it with went to the
README and DTRT. If that's not the case I'm happy to respin the AGENTS.md idea,
even if it just explicitly points to the README.

-- 
Thanks,
Sasha
