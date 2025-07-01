Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EC21C84C5
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 21:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751405080; cv=none; b=sqA8Gq7sz91bCgeVr+2+XrP5hf18ndyKBtgCQJqAYrD9LgmQrkL05wj37blBuV47615eAdD0ww2TAbMtsgUR0gdVcp3zpnI9AXwhqQGSCphhLwNUj+P8MeIJZxf1mzrhVlU0cGHICB1qkkSA2crgKWi79E+07SfxTXeE4f7L9nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751405080; c=relaxed/simple;
	bh=dYTK5OAposMrwMJTrGnRMN9nlw5pDKEwSrvLOySNbQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnIeldsE/M1X4FkzX5VYkytPTfhq1hKoAepBAv+JEkbLgUnrQohauKjuPMeH8Z/J2TBulkKtwrllDKRPt7UcZXLSJIy1MWHsroNERL0hnuHr3gOd2emQQTJ/rREqB9XtFmggAQJGAC3+yM1yn3zYdIzZ7ayZIwwe1DDtQWurBoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-108-26-156-121.bstnma.fios.verizon.net [108.26.156.121])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 561LOHm7009077
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 17:24:19 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 85C1E2E00D5; Tue, 01 Jul 2025 17:24:17 -0400 (EDT)
Date: Tue, 1 Jul 2025 17:24:17 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux ext4 <linux-ext4@vger.kernel.org>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        "Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [PATCH 0/5] ext4 docs toctree reorganization
Message-ID: <20250701212417.GD495283@mit.edu>
References: <20250620105643.25141-2-bagasdotme@gmail.com>
 <87y0t7rajm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0t7rajm.fsf@trenco.lwn.net>

On Tue, Jul 01, 2025 at 01:11:25PM -0600, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> 
> > Hi Jon, hi Ted,
> >
> > While discussing on my previous ext4 docs reorganization attempt
> > by merging contents [1], Jon suggested that considering current docs
> > file structure, a proper toctree would be ideal [2]. So, here's
> > the patchset that does exactly that.
> >
> > Actual conversion to toctree structure is in [1/5], while the rest
> > is cleanups to make the resulting toctree nicer.
> >
> > This patchset is based on docs-next tree.
> 
> So to me this seems like an improvement.  I'm happy to take it, though
> would prefer an ack from ext4land if possible.

Acked-by: Theodore Ts'o <tytso@mit.edu>

						- Ted
