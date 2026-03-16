Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9644017BED0
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 07:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646356; cv=none; b=IxuSgwe40S1P5MdUWFqx6svNj0gmAZSQTt13YtxMbOf/a1uu1FymJmc78mCZaasu7ASBpEMYymE0wi3qSJ74fDVr9vsB5i23yxUyCouvUKXBXFtwZK4l15pnymBr57dLUtVjQgUsV+cN52HDj5MKujV2vChbsijuFJ2wEIBfBy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646356; c=relaxed/simple;
	bh=f8lj3c7fBmdXVgYTfwB+HRNHOV1JBMUdSewKi/iQReY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nf4lsYGCSxzJAwbFYUO5BjIdgvuTZg+nUdquQDgIZ+F3wJ+YFMzfpah8bYdR7hfqehc1Tv+uOHO9kXKypEKloHIkQ4G0n3yvUx1Pvrc46NH4zD2qpYA0vxJ/Gf6ZerY2Svt3w3RI1jzzj07rxqJIPUGclQkQhnLexV3hgOPrge8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Lkug7IJg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Lkug7IJg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4853aec185aso34458095e9.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 00:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773646353; x=1774251153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1v/dlypJeTwP5cfRx6n8+4g3859w68KLT19UYG1+6r4=;
        b=Lkug7IJgUvLiqmQFU/Sncbw94mAC7N2c/SXNoMMM9geNKyUcdxB45UswKDLK5I/Ivj
         xxkkmKiVgKnfz/CujkXOUI9MPXTiR1YhyGLx6lwGpXP+tH1zibvXXrGGB+OPkXLAj07c
         PFjTWy4/WnhUd2AMtGyIMkSxL91H3U97PFIEAWBy8bffjelvH9dqsjtBkwCKalWi5sK4
         iux3O9VPXtQNza6UKu2VO3w9slQgPCXkIqcZoVhh16V/ufHv/8PPKYXu1m7OhgsXHtaN
         /jSn/V8wEf011Ypr6xd+5Uzf95/t4DywSlH3uF65oL9H8Rn9lBa7H1+KR+1BmSql1Bkf
         6Arg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773646353; x=1774251153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1v/dlypJeTwP5cfRx6n8+4g3859w68KLT19UYG1+6r4=;
        b=B0tKAM/gcKPiL1skACov/7jWfMdO7CWSwHZpC1DqIv3SOdvXbQJDMBrmXEqdy5LVdL
         W683HRquik8ob72bFKicRc9kCtFeiU+FU2qXHNb7zHBk1QxwPfhXUqah5itLkTnUzBT4
         wHj5wLWe+hOU+kX8f7fYpK98YH7+KEu79ODaZzkG0QiYDmnv07LDd7iu3Oxz97OiZRKb
         kZHPesMPDyJP4KeOreHvECqFXeltdFlpbNxfjnlu4D5iYMa0Wa3R4VqzjxB1O4dA68DB
         NlvG2lEAIIeTHOiWEy/CpQlIqqQKThJ90XzDg2XdkNCgvbH5FWKpzkcz7BQjqtmmWLMD
         Xp1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWfArSSEq3RJfGAhpmqCz8Sdm7f/yb9AHm3jz0OpeBUxh37mVjSdtM7FOJYAmq8Ubhj5hihB3AmGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP9ytY1BLqPxPXTpUifgmD9cWDz3ROZ7gcBb8CbnZqrbzT49ca
	aPgDoTcOsIuL9kNcIyW4sQfZPWprFzSuRmz7VwAqU8ZMGkLziE0QsKVE/+f47khMWj/Yhiu9Au1
	h66VC
X-Gm-Gg: ATEYQzy/cwtlkRAmoREOit7zqq0SBxWTuOkKjmkixW1sGZa2VwAfr3A1IvPPbsfiIYQ
	qZWvtCMUdY5YH/dw8dT7pGpPk7WpRHcMkfME3Y0jrFKhgAlNAcfRmkNcz5ECog4xdAaeyaTEygP
	0ntRxWmNMYLjItwu+hDDHNJFwJ2GBtAK9h3DLCMkvH2cOKSfvyKbO4V97bewfd/9Gq3GZfdiU5K
	B8TTQkaFzqNFFgisxYykhlHbgeIW7n4IuSdbMrGaTRP9KY57pQGY3mkxOxpONvZnjGXoZ39rfHP
	VkGDBF1nzR0OIwMq8GrhAz7lBC4r47D0I8rAmdgQPvG3fyzt+h+h/ufQFYxcymmgOTzgUvYhc5+
	hzFBv4GwysTtUU8h1Px5RmY+2AempJZko7GzjRq2NHO16IaZ9NQQauX7Zzo3FeTGJhrzOgRZFFq
	5xSUZen8Mkk5RwzrHC1fvtobhCkacTQlMHBgrw
X-Received: by 2002:a05:600c:5251:b0:485:3ff1:d5c5 with SMTP id 5b1f17b1804b1-485566cdc17mr194418895e9.7.1773646352820;
        Mon, 16 Mar 2026 00:32:32 -0700 (PDT)
Received: from localhost (109-81-21-195.rct.o2.cz. [109.81.21.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b6070acsm353694535e9.8.2026.03.16.00.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:32:32 -0700 (PDT)
Date: Mon, 16 Mar 2026 08:32:31 +0100
From: Michal Hocko <mhocko@suse.com>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Kit Dallege <xaum.io@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, corbet@lwn.net, linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs/mm: document the OOM killer
Message-ID: <abeyD1ZngYhkAx6g@tiehlicka>
References: <20260314152518.100194-1-xaum.io@gmail.com>
 <fbee0ca1-4de6-4182-865b-a33d9ed32ee4@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbee0ca1-4de6-4182-865b-a33d9ed32ee4@lucifer.local>

On Sun 15-03-26 20:48:22, Lorenzo Stoakes (Oracle) wrote:
> NAK for being AI slop again, obviously.
> 
> Again, +cc the OOM maintainer you failed to bother to look up.

Thanks!

> Reasons, as the rest:
> - Worthless documentation
> - Everything about patch screams 'zero effort, Claude did it all'
> - Bad etiquette
> 
> As with all the rest it'd need to be totally rewritten and it's not worth the
> maintainer time.
> 
> On Sat, Mar 14, 2026 at 04:25:18PM +0100, Kit Dallege wrote:
> > Fill in the oom.rst stub that was created in commit 481cc97349d6
> > ("mm,doc: Add new documentation structure") as part of the structured
> > memory management documentation following Mel Gorman's book outline.
> 
> I mean the more I see it the more annoying it is.
> 
> >
> > Cover the scoring heuristic, allocation constraints, OOM reaper,
> > process_mrelease syscall, and sysctl knobs.
> 
> This sentence contains almost as much content as the patch.

The real question is who is the expected audience of this documentation?
Administrators, kernel developers? 
Reading through this proposal this doesn't really seem to fit neither
well. For kernel developers who try to wrap their heads around the code
it is barely scratches the surface. For admins it doesn't really explain
more than an existing documentation for tunables.

So if there is a serious interest to make this useful kernel developers
oriented documentation I am more than willing to help. The code is not
really easy to follow as it is scattered. There are many subtle
expectations spread out and it is quite easy to break a delicate balance
tuned for through years. So there is a big documentatin gap I never got
around to fill up.

-- 
Michal Hocko
SUSE Labs
