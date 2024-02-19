Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2178F1F18D
	for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 21:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708376744; cv=none; b=h8PpKo16m5oamfq8pGl7HgRlRpAI9pdOBU2Rl9kKg/Ki3szjPDcm6Fdr5Bm4jtcp8C741EAlzTPxtRYI/PKlk99pjgBAfmK8N5gXLCT75h0wpoYy0VCHpHT3sjqOPaD0JoD3lfXev+Y/CPJbPJatA9C642zux9EuHMDmC+ArbaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708376744; c=relaxed/simple;
	bh=juTCiAWZz0rBmU6VhjN2IBkewdPUNHT/c3bpr/goaFQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HjN9S+paEP34Q2ltg8J/7V662MjWS25Pm6e0JsbD82+Kn1EbA3jFhhTJY1SHROTmfhSZvgzdEgUNzc94hDzeC5O1yBUO48Psa4+NtmBxDZf5C+R+YM219CdjhO2F+HTihFJGfmpMqW5VFuJkpS6lsk88IRcX7EZg2RzOpqqYrJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=J6IKKALy; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="J6IKKALy"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EC3BE47A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1708376742; bh=zondc8MNbUYMxqXL9FqRMlbBxcYIX++sAcPPdndXOBw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J6IKKALynlo5CtkPSlI/3AXe+VgdljOS2tUH8S2lIALiASeWXV0QOYjz+x8a1D/Cb
	 xKzmxipu/v+1MAB0MgmTzFvt7+UsR1X21OD2qM3Qv57NaVdpp0IauX18yp+NcZ1+sO
	 qLG66iGEuzlj7xD5YdP9ZJtuSnlIsx6waqEe/y+BUbMRN+vK7y6yFR317s4Wb2PMdF
	 lV0fKk0v2CtooKCgNnavmPvPJG+DZFPWKwcFrBKLtVoO+oKwwWLgni0bNWayLL+aZg
	 cQJm6hK0vPH9iMqylwMK6tiW8+xObx8WWhzJ9zHof9DYqWNd+rmj9OWzt36z1kkCTu
	 bz/WRsPFQebLw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EC3BE47A99;
	Mon, 19 Feb 2024 21:05:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jani Nikula <jani.nikula@intel.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [RFC] doc headings sweep
In-Reply-To: <e398ebb1-1d42-49ff-b355-b4bc3258fc10@oracle.com>
References: <2024021430-blanching-spotter-c7c8@gregkh>
 <00057b93-b5fc-4536-b13d-cd3b6cead5b1@oracle.com>
 <2024021530-plank-cornmeal-90eb@gregkh>
 <26b25204-9829-44a8-9836-1ce1c8725586@oracle.com>
 <87v86o4xu0.fsf@intel.com> <2024021619-barrack-shack-206c@gregkh>
 <87r0hcv4lj.fsf@meer.lwn.net>
 <e398ebb1-1d42-49ff-b355-b4bc3258fc10@oracle.com>
Date: Mon, 19 Feb 2024 14:05:41 -0700
Message-ID: <87le7gnp0a.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> I have a (very long and ugly) script that can fix these up to a
> consistent style, the attached patch is the result of running it on
> Documentation/process/ only.
>
> I've done builds before and after the patch and diffed the resulting
> HTML files, they show no difference. (HOWEVER, you do need a 'make
> cleandocs' in between, as it seems doing 'make htmldocs; find
> Documentation | xargs touch; make htmldocs' is going to change the
> generated HTML for the sidebar -- another issue to look into at some
> point, I guess; maybe it's specific to the Sphinx version I used here,
> 4.3.2.)
>
> The script will leave alone any file that it doesn't quite understand
> (e.g. for a lot of the translations there are way more underlines than
> characters in the heading and it doesn't match up with the byte count
> either).
>
> Anyway, the question is: Is this worth doing in the first place, or is
> it just churn? I assume just after -rc1 would be the ideal time to
> submit these to avoid conflicts.

So I must confess that I'm not convinced; it seems not that far removed
from the sorts of white-space fixes that drive developers nuts
elsewhere.

"Avoid conflicts" isn't going to happen.  By its nature, docs-next tends
to generate a lot of conflicts against other trees as it is -
*everybody* puts their fingers into Documentation/.  This would surely
create more of them, all of which I'd then get to explain to Linus.  I
think it might be better to encourage people to fix things up gradually
when they're in the files anyway.

But maybe others disagree?

Thanks,

jon
