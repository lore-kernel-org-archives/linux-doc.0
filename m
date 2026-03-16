Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5615E302146
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672787; cv=none; b=UO+M1Vz6Ukec1Z6AwFAvkuAbHbU+DeKzKAMKGZokc4UCIeJjwLuYRRMX3cpGwErRD4yGwKPaj6ejife7+7y3jpKe6z+T7o4sZntE1xM29uHX+SHJ3VheB78BLhoDp57i+F7+6EX2M/tAwAQNkKx+Ort8gsybeU5omrJv8FfR6tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672787; c=relaxed/simple;
	bh=8GSEDSXaBFZQPp9nB5Uq9bC0LKepyUSrWIfxhKxFNcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9JxhaX7dCgk63bfR9ems7t2MIj6wFQhZHHjgc3rxwny31ATPoF87X+PJ4qpxaUs5owdtWhUzsU9pXzQHNVZzpMPiQVmhC2/jIHIB2lIVogyuOsmuf9SEoT+7+4/15YaHR5Tg6oOxa7CTqWQ7LhkrEX3R4hSCWxrk4KBS7V27tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IfgYz627; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IfgYz627"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439d8df7620so3406186f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 07:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773672785; x=1774277585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lOX/jhdoMMqrcOy5q3SKEFg2QJEUGhIi2FMLl0bou3c=;
        b=IfgYz627WjIIQxP36QU6/EI74MJ8ckoA3G9v9FwEabSE/owAuuydr5FUpuGznJu4aS
         96VjftAxnyFQYWToW5PkmNSdPR+nqf3iLt/gqWaldRZaqZmB09ztVwif2WLVPeAcXbew
         v9s+iDtJiPnNWzo/rgVYh1oQelIjHVzfZGYxxAv1VVxq98go/AxjIute14d6WI2+6chj
         8HzWUsYvjzMYqBtfQ7Yt5KuUC0h4WDCzos1eXcRZwnEl4Id5Ez/tFYjn1UhNRMCqTA58
         dO1DL4NkzeS4e7iUKnlJlaZt+Dkl+GmAi2/wa4e5j2r78mbEulvr/s1h7I5eagKcgic7
         2xMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773672785; x=1774277585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOX/jhdoMMqrcOy5q3SKEFg2QJEUGhIi2FMLl0bou3c=;
        b=b40XPWXvCmuTuE2rzmp0NcRtn+lpJir7updThKfPwRAkakj9QLg3W7NOXiXAyZ8YI3
         bk27pyeVbBDj3SOQaJ1lsq1bGnBe7ndiuQ/emfy5mrF2Quik/MfVWIT+Fm/hOogSuiAu
         8xn0Zq3Y4iv3JWEcPadSdWU7Fxn+1+hgfTmAOaTWfVvFUJTqs2vFIZBfZIRI00rrqn69
         /AwF/jk+L8/++717h8+FnotdVaIiiMpIlXjl+0NqubGeidcs/uQAgYbuDNXgeyakR614
         yKXnsbu9cVvVssYAHIFeTOdXvlK7+wSbCssOSscNbYcH7Ng3cv8tPJfcHN5ogGtsQDUu
         O6aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuWWHnD2qzyyB9kM+dLgLMSKepXSkeDLOZsBH8eK7thPTz4Fd5jvkwE6efM4ZPFCbRivxxMUIysVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA7SA9pUP9DdPAUvHGYG+iV7xfh16VoUrShRdYJn59xcQrYVaD
	/iS2ZuH4KtYOZBRo/lvQqmWI0CqnUJIU0Z2XMhlhuKt3VOKefjpI7CUbHLeC3lDsWJc=
X-Gm-Gg: ATEYQzwFxlQZJ/J/La1Swe/oyRop8WmPcDypcmy0orIhJsWhYal/CDss5qDsxdBmq4C
	SSmCOjaAajE0awt5x3y6Fo9jzaOMcowg17X8soUnRToqx5S47INEPXhs9DkO3kE9g+ArZ4euvBH
	GfqbKqUCnS6m8JPEfosnWjMzk5ensVeztEa4NpWuVGkChhyB51YJZ2Xxw6P4TKoPHbkmYiVoZNS
	sYtQpfbjo1GgwAZvxBMwqEXoVrMz/PjljujGOJACzfFAh4xrYj0Ms066PIMAE7NEGhmaXJ0WcnQ
	8i9X6nAwu/7noJZxJcp68VVYVlS9NOZjlh8Sb/CggkIsmM8CeWob5n+oa3vRmWWRXkLyaXC8uTr
	Xry/hrnb6l+MMqlfo9YcZbji2hY/AFrIAx2abV6+Bq3CpjIY97+zGUd6egdV15QE0dWrpun+af6
	ZZsfdwdZKem4VbcznEpNpCNQv7LAZmE30WOtfz
X-Received: by 2002:a05:6000:4025:b0:439:bcdb:95a8 with SMTP id ffacd0b85a97d-43a04d1dc13mr22986896f8f.0.1773672784615;
        Mon, 16 Mar 2026 07:53:04 -0700 (PDT)
Received: from localhost (109-81-21-195.rct.o2.cz. [109.81.21.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b457cfa07sm6632244f8f.6.2026.03.16.07.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:53:04 -0700 (PDT)
Date: Mon, 16 Mar 2026 15:53:03 +0100
From: Michal Hocko <mhocko@suse.com>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Kit Dallege <xaum.io@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, corbet@lwn.net, linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs/mm: document the OOM killer
Message-ID: <abgZTxYM9UcQ9Na3@tiehlicka>
References: <20260314152518.100194-1-xaum.io@gmail.com>
 <fbee0ca1-4de6-4182-865b-a33d9ed32ee4@lucifer.local>
 <abeyD1ZngYhkAx6g@tiehlicka>
 <31744315-bf9e-4d9a-9c25-63eef0bd2f01@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31744315-bf9e-4d9a-9c25-63eef0bd2f01@lucifer.local>

On Mon 16-03-26 14:16:19, Lorenzo Stoakes (Oracle) wrote:
> On Mon, Mar 16, 2026 at 08:32:31AM +0100, Michal Hocko wrote:
> > On Sun 15-03-26 20:48:22, Lorenzo Stoakes (Oracle) wrote:
> > > NAK for being AI slop again, obviously.
> > >
> > > Again, +cc the OOM maintainer you failed to bother to look up.
> >
> > Thanks!
> 
> No problem!
> 
> >
> > > Reasons, as the rest:
> > > - Worthless documentation
> > > - Everything about patch screams 'zero effort, Claude did it all'
> > > - Bad etiquette
> > >
> > > As with all the rest it'd need to be totally rewritten and it's not worth the
> > > maintainer time.
> > >
> > > On Sat, Mar 14, 2026 at 04:25:18PM +0100, Kit Dallege wrote:
> > > > Fill in the oom.rst stub that was created in commit 481cc97349d6
> > > > ("mm,doc: Add new documentation structure") as part of the structured
> > > > memory management documentation following Mel Gorman's book outline.
> > >
> > > I mean the more I see it the more annoying it is.
> > >
> > > >
> > > > Cover the scoring heuristic, allocation constraints, OOM reaper,
> > > > process_mrelease syscall, and sysctl knobs.
> > >
> > > This sentence contains almost as much content as the patch.
> >
> > The real question is who is the expected audience of this documentation?
> > Administrators, kernel developers?
> > Reading through this proposal this doesn't really seem to fit neither
> > well. For kernel developers who try to wrap their heads around the code
> > it is barely scratches the surface. For admins it doesn't really explain
> > more than an existing documentation for tunables.
> >
> > So if there is a serious interest to make this useful kernel developers
> > oriented documentation I am more than willing to help. The code is not
> > really easy to follow as it is scattered. There are many subtle
> > expectations spread out and it is quite easy to break a delicate balance
> > tuned for through years. So there is a big documentatin gap I never got
> > around to fill up.
> 
> I mean, we definitely could do with better documentation :) Obviously I
> somewhat document it from a 'learning the code in depth' perspective in my
> book, but that's tied to v6.0, effectively paywalled (sorry!) and not the
> same as the kind of documentation we'd ideally like the kernel to expose,
> which would be less specific I thik but also up-to-date with newer kernels.
> 
> The point WRT this patch however is that really, it needs to come from
> somebody who has some experience/understanding, and generating it via an
> LLM is just not useful - any kernel developer with understanding could do
> so.

I think we are struggling with capacity here. I am willing to help shape
an existing text but will be struggling to find time to cook up that
text myself. I do mind involving LLMs are long as the content is
properly reviewed and factually correct. 

Wrt OOM, most people/developers struggle to understand these areas from
my experience
- what is the purpose of the oom killer and its limitations
- different contexts oom handles
- when is the oom killer triggered
- oom killer in progress handling and locking
- forward progress guarantee (oom_reaper)
- coordination with task exit path
- memory reserves for oom victims

I bet there is some more but these are the most prominent ones.
-- 
Michal Hocko
SUSE Labs
