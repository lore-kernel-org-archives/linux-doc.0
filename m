Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927262EF667;
	Tue, 18 Nov 2025 19:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493369; cv=none; b=c0f6TTWAOpHQ8Pxi/BpwkqFC97Wm2WLCGdCoKYisF9tzMDJw+VwvGUkVK0yqDMZw7ZAKIUf5/79K+ZmzoEHf0GblhUEe6eqdCkMJc4s9wXqmcCtBVUd+hC3HHF/wyCwNBNhN0o2beSfLSUu795NWgmZ9RuK5RFvGjFaVLaqaVp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493369; c=relaxed/simple;
	bh=qgDfFFbvWBywjejLV1tJ2ROGNGEZubzW4zLzGzwShgk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lnaABe31r0Mn7Ne8/+3PLCU/wiHzgKOlohqP1cb/cA8VJMBY8wJwThWHzVMlmVE2xc+kDLll0UzSq0eAV8jEeOefkG7zh/MCIVOzRPwz8Mv8k3D++BHPG8yWXDgMujzrbqteHs7IO4ekAJlkmFCZ8hPVbOT0dSzK5upZtH/rXTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fj6QEjs9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fj6QEjs9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F14BC2BCB0;
	Tue, 18 Nov 2025 19:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763493369;
	bh=qgDfFFbvWBywjejLV1tJ2ROGNGEZubzW4zLzGzwShgk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Fj6QEjs9vokPNYsoTBIFeKgRUU9wPJaPlZFHrI+/w/YpWHmkHmUCO8lYhP6QWNYY1
	 kDsfGB4qB245GP+0Vd9wHLvOI+gflXcf0+id71006YulDAdwqwHmM2gAvsv5X6Si3M
	 pkTESOXnPBYI0nLQIuHWBSIIcqjlV7Iy6FoKGVb4Q3Q2WXNrsmgXUdQj1VTl+SYTPY
	 bzMxZkynUyQo/R6u4xezkKdZDMxb70lmXM0CH5vczs+dceg2Pl+uhOGPHGn30UXPtg
	 8PiTJR7HSvv+FM8IbFwVXJBAm58Pzosu2b7sgveEguRs4aMyCgutMuj+qkKNX9pnJA
	 IY4cQKwGApBbA==
Date: Tue, 18 Nov 2025 20:16:03 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 0/2] Move Python modules to tools/lib/python
Message-ID: <20251118201603.19164113@foz.lan>
In-Reply-To: <875xb75msm.fsf@trenco.lwn.net>
References: <20251110220430.726665-1-corbet@lwn.net>
	<875xb75msm.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 18 Nov 2025 09:27:05 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Jonathan Corbet <corbet@lwn.net> writes:
> 
> > scripts/lib was always a bit of an awkward place for Python libraries; give
> > them a proper home under tools/lib/python.  Put the modules from
> > tools/docs/lib there for good measure.
> >
> > The second patch ties them into a single package namespace.  It would be
> > more aesthetically pleasing to add a kernel layer, so we could say:
> >
> >   from kernel.kdoc import kdoc_parser
> >
> > ...and have the kernel-specific stuff clearly marked, but that means adding
> > an empty directory in the hierarchy, which isn't as pleasing.
> >
> > There are some other "Python library" directories hidden in the kernel
> > tree; we may eventually want to encourage them to move as well.
> >
> > Jonathan Corbet (2):
> >   docs: Move the python libraries to tools/lib/python
> >   docs: bring some order to our Python module hierarchy  
> 
> In the absence of complaints, I have applied these.

Sorry, I ended missing it. Looking at the changes, looks good to 
to me.

I also tested building it and everything seems fine.

Thanks,
Mauro
