Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B941A267;
	Fri, 19 Dec 2025 06:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766126778; cv=none; b=S8hetBEr5JFj38uLNq0gJRU0elzjmWMAD079HXOFIHaqrtwssD+gHAqb/+HxI8JLYmH9jdE30A9KgEwrqb1HyzAcm8K/cZ++gI51AKWhQIBMv9Av0VZk0TdAnfwZWRxcizSP5W+4JrHZoNlHC4BVmlxnRkv2NXjGTtiPlZ2nWDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766126778; c=relaxed/simple;
	bh=GCtvC7JQ0sW45JFNIzTHFaQFaunZxr+uykDzvh97kGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1qN4ANajgFKcBartl3yX6RoYXZaJ/P1nVdP8KRpg32+EPfHTX+gehwuGD+QOrqLJhG2r30DjZ+cg8b3jVZMcrUlAIPimDoXFAajhYUD5DYQR4QvQ4DTB1gUQrBYJAI3UGYQfcQZILEOjxzeg7LyS7pOWnaGtuSyxx/UVhCRX34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsMVxo1i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsMVxo1i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDD3C4CEF1;
	Fri, 19 Dec 2025 06:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766126777;
	bh=GCtvC7JQ0sW45JFNIzTHFaQFaunZxr+uykDzvh97kGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jsMVxo1i4HZyEIFV7s7muMvbrYA1u4urWTJy/arP8omdTOVw3SZtZR/hvldWPHBiP
	 R5R4AF2JueetEmMspogbZDMmog1r/MkpmXAQ4GLsbORnw79EhcW5kDAEU1JtB0oTCX
	 XKS2Xy2mjBrRLpEfgrKfic5rLst27vfBT0VXefL+CZp/v2nJlWXg9++3xKgFNIpRPe
	 zROYBcO2ZdINdHza/Sk9mBS3+87JXsUEHCWPlANrDPA/r6mjQJHsgs+NlQKso53RKU
	 hr2MM0mHvhZLSCbQ1UAhGfBf7HxhpASl6j9gujFMYZ+F7GD98AGh30Ekb4OTLIdrs4
	 HLKHh29bGv8mw==
Date: Fri, 19 Dec 2025 08:46:08 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, pratyush@kernel.org,
	dmatlack@google.com, skhawaja@google.com, rientjes@google.com,
	corbet@lwn.net, kees@kernel.org, davidgow@google.com,
	pmladek@suse.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	nicolas.frattaroli@collabora.com, linux-doc@vger.kernel.org,
	tamird@gmail.com, raemoar63@gmail.com, graf@amazon.com
Subject: Re: [PATCH v2 0/5] list private v2 & luo flb v9
Message-ID: <aUT0sJsDWZHGT-Q9@kernel.org>
References: <20251218155752.3045808-1-pasha.tatashin@soleen.com>
 <20251218130725.1b93a521c039ce121de62472@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218130725.1b93a521c039ce121de62472@linux-foundation.org>

On Thu, Dec 18, 2025 at 01:07:25PM -0800, Andrew Morton wrote:
> On Thu, 18 Dec 2025 10:57:47 -0500 Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> 
> > This series includes two separate workstreams. This is because FLB
> > should be applied on top of list_private, as it uses some of its
> > interfaces.
> > 
> > 1. List private v2 (first 3 patches) Previous version:
> > https://lore.kernel.org/all/20251126185725.4164769-1-pasha.tatashin@soleen.com
> > For details, please read the cover letter from the previous submission.
> > 
> > v2 Changelog:
> > - Added a Reviewed-by from David Gow.
> > 
> > 2. LUO FLB v9 (last 2 patches) Previous version:
> > https://lore.kernel.org/all/20251125225006.3722394-2-pasha.tatashin@soleen.com
> 
> Please, no.
> 
> This patch series is intended for the Linux kernel.  Your grandchildren
> will read the above wondering "what did granddad do".  It's just lazy
> for us to expect readers to have to chase down links to earlier
> versions and then to figure out what changed and why we changed it,
> etc, etc.
> 
> Let's give our audience a nice, self-contained and complete description
> of the proposed changes which doesn't refer them to the minute details
> of the ongoing development process.  A process which is utterly
> uninteresting three years from now.
> 
> IOW, can we please have a complete and standalone description of *this
> patchset* which doesn't refer to earlier obsolete stuff?

And I would even say this should be two patchsets, one with private list
and the other one with FLB.
 
> Thanks.

-- 
Sincerely yours,
Mike.
