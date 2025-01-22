Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8289215197
	for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564534; cv=none; b=o2x0YixYObFRlOg8RKbcjdR420gjWGewgOXYMNQFM8qPpoNofAd4rPJTb1kpszxst591sQmQDQ+T/I4jzuabLAbV8CGhHFBM7RDJBtDu29Q7fIXwRmiF7JWvP1qVcuJKGnUBXh51aBfANwhr9pNake4wc9Ws26+wXp4YkbXVerM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564534; c=relaxed/simple;
	bh=TlOv+G6qQnDQLzfsWcCJye0ydO7cFjpIuTBx+gohDYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMVuK89Q/wp9rHe4w4UI0D9wY/ZaZ9uIfTXs+6oMAGPHu25emYNH1gReYPJ3f+PvqbXxHxIDAJudL8zbUuR5z8gzZ+3SLdMXm6SujG5H055Z64gchZuig+cpHGhB4+SrONGv3YT9s6MT3v3MHLtMKLuSPa75lzFHAk1MS6MW0sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=QGwyKG5U; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="QGwyKG5U"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-46e28597955so32103391cf.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 08:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1737564531; x=1738169331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kr9/sx5x4FEyt+2JT+grv3uEjQGhYsk9xF3BwrslJ1o=;
        b=QGwyKG5UNuHANPwkZmdr3G9N2yOWxUbUEudFhotz8k0Fc17MOUwA6yEWPYS/onoH+P
         DQCditNTayKnnq8WZ7mF72CQ5eKDORI2Y2Y63mxZzP7V7bBAXA2hRvg86acVo71foMN2
         41uQV7pSZDnNZMSDY//tfOjcKIGlrJ8AaHQEXfx+hFakoTI8JoQQGGVQQ2jTU1fQfr3f
         qFrIAOwxSBPX0npY18YukHgQl0qTUiKkLBUFS5+VRWrzPBUsKGHoDuMSTSAUbxhrTPBR
         U+bYss4lMFtHANBJpxgs/A6HZt+2mP/4qe3waUNES92O5uM+hf6slXIDtL6xzKFSt/+J
         PfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737564531; x=1738169331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr9/sx5x4FEyt+2JT+grv3uEjQGhYsk9xF3BwrslJ1o=;
        b=MGSXmmdafTFfPPdaUjTv/Uu9kkFmuu1km3vofQdR3olpev6nkztU6fSHz8AyszucU5
         Bo70iBZUDFsdcwrbXr6EFarvblvQIH2J+xJQpXm0NBCYjwCGT7Y7gXrqJLHNgqXDZXAe
         /Xtk0KKeX8wCqm0FrG8KEL7zk/HqX+WZ2PYlRVRP73KUCze15fHarGa7MXuB8sajY8ZG
         muMNJDqsJ8bdraUgbmMw7bAaFJETWOKf+s3I714R6d0LaRFG877KJ3t6U+EIlxFlP9wD
         +o8ii65CdVSO1vtknRLnOHUimdfB0pp183OzXB71KPRHuREMJaFT1mfIG7+6ppbKUdFc
         ZdcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHAkAMre3bUNGYbv2g1wk/uMSHHfN9wFqE5Eb1dkHPXoH9ewn/KeEgVnlw32Jv5kz7dFosszDNF/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YznHBDJ23qM1EXMiw3ZUuEAqqvQjxzFHipG5fczndRvyKjC660t
	jqYQpShF/YkMUAmUxD6rgwyFVXCtRb2y0PeZmEb/D+4GO+vAfg5c6LyboShjvQA=
X-Gm-Gg: ASbGncsrrnyUEK/eJxRgaXqrdjV406CVX4bZJh4HzHnnAFf9p3dbhawPblWn6vD6L1q
	nJH6fq8B6KcCIU3o/EQQuU7n3M7daZNyj5loyc7WjHXkmvh32f0iH+GMdZkYRxK2DRVl24FBoVn
	mtsP0q1jPhY16TJ/2+EVfCdApS0BnMKenv/3+yksKHhfvlXM8fXmqQ+GbvCS7ZCGHikAILhA7Z8
	dNgPqv27ZV2Oip4jKVWCtpuXeuaRJLT3Y+/AXv2nQmFMPE3MqqTh5l12giXwV9LABZbl6Uh7WJL
	9Rj/wGRwZNDpZbpXscP3aLw1ufXhCRu5jyLLQ8rlaIo1tjfEWl63
X-Google-Smtp-Source: AGHT+IGqKeucTA+irku665A+Oijwy7MIpYQ7FIXbCblzZZxXg4bmfGemIEdCXsqh+89fkA+t8kqbpg==
X-Received: by 2002:ac8:7d16:0:b0:467:51e6:d861 with SMTP id d75a77b69052e-46e12a9b078mr326867791cf.31.1737564531542;
        Wed, 22 Jan 2025 08:48:51 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afbf3783sm62614876d6.7.2025.01.22.08.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 08:48:50 -0800 (PST)
Date: Wed, 22 Jan 2025 11:48:49 -0500
From: Gregory Price <gourry@gourry.net>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	nehagholkar@meta.com, abhishekd@meta.com, david@redhat.com,
	nphamcs@gmail.com, akpm@linux-foundation.org, hannes@cmpxchg.org,
	kbusch@meta.com, feng.tang@intel.com, donettom@linux.ibm.com
Subject: Re: [RFC v3 PATCH 0/5] Promotion of Unmapped Page Cache Folios.
Message-ID: <Z5EhcQERseKShtGY@gourry-fedora-PF4VCD3F>
References: <20250107000346.1338481-1-gourry@gourry.net>
 <87v7u7gkuk.fsf@DESKTOP-5N7EMDA>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7u7gkuk.fsf@DESKTOP-5N7EMDA>

On Wed, Jan 22, 2025 at 07:16:03PM +0800, Huang, Ying wrote:
> Hi, Gregory,
> > Test process:
> >    In each test, we do a linear read of a 128GB file into a buffer
> >    in a loop.
> 
> IMHO, the linear reading isn't a very good test case for promotion.  You
> cannot test the hot-page selection algorithm.  I think that it's better
> to use something like normal accessing pattern.  IIRC, it is available
> in fio test suite.
>

Oh yes, I don't plan to drop RFC until I can get a real workload and
probably fio running under this.  This patch set is varying priority for
me at the moment so the versions will take some time.  My goal is to
have something a bit more solid by LSF/MM, but not before.

> >    1) file allocated in DRAM with mechanisms off
> >    2) file allocated in DRAM with balancing on but promotion off
> >    3) file allocated in DRAM with balancing and promotion on
> >       (promotion check is negative because all pages are top tier)
> >    4) file allocated in CXL with mechanisms off
> >    5) file allocated in CXL with mechanisms on
> >
> > |     1     |    2     |     3       |    4     |      5         |
> > | DRAM Base | Promo On | TopTier Chk | CXL Base | Post-Promotion |
> > |  7.5804   |  7.7586  |   7.9726    |   9.75   |    7.8941      |
> 
> For 3, we can check whether the folio is in top-tier as the first step.
> Will that introduce measurable overhead?
>

That is basically what 2 vs 3 is doing.

Test 2 shows overhead of TPP on + pagecache promo off
Test 3 shows overhead of TPP+Promo on, but all the memory is on top tier

This shows the check as to whether the folio is in the top tier is
actually somewhat expensive (~5% compared to baseline, ~2.7% compared to
TPP-on Promo-off).

The goal of this linear, simple test is to isolate test behavior from
the overhead - that makes it easy to test each individual variable (TPP,
promo, top tier, etc) and see relative overheads.

This basically gives us a reasonable floor/ceiling of expected overhead.
If we see something wildly different than this during something like FIO
or a real workload, then we'll know we missed something.

> >
> > This could be further limited by limiting the promotion rate via the
> > existing knob, or by implementing a new knob detached from the existing
> > promotion rate.  There are merits to both approach.
> 
> Have you tested with the existing knob?  Whether does it help?
>

Not yet, this fell off my priority list before I could do additional
testing.  I will add that to my backlog.

~Gregory
