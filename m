Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D321CD2B
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 13:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729256628; cv=none; b=ZTQVSnYTz4n7fKjnScobdDXO527WMFVVJl6GiRLyAtVzKsUk37B0solM+jHwPJAvTIwJnE8bjjCjDrrme3IycbT09GNxkHF1BFiyaRe7imCmMNwDdQBVZ5yGtmPaioWFgvMH4LeoTP7Y8t6CXmtiatoquX7Qp/N//IiXNqFF5Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729256628; c=relaxed/simple;
	bh=DOTTWquBNd8l+IUT7seOntP4YwH3dQlJJjlVuG2vkoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0vGSOaJqduthcJQ6cgPiAu94Y5/aam+mOZo6MgAJ6k2PlJ+tVEeakJurLEhIWLItfTCaCQK2gXi/PfQlFgYcSXNnJPJaBhdAo8i+Tkowbp2jNY9i/jS295sT9HfWUpot+1J5nO/m+nRcr6eeS0iJtbfKuIE9F2Gje/ufCK90yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MLe0m+Yw; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MLe0m+Yw"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f2b95775so2662893e87.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729256624; x=1729861424; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sODVftRiJEB/0R5ZKHQ3MqkxJS24ttUXB9G8dSmRS9Y=;
        b=MLe0m+YwOZw5T3i7E7vshUSIdYq8vzl5BWKB/pMavPMbzsJWkMBxEpkmwpbXT1lBLv
         VOCe7bKuVRTE5yHfs2YWM94kfljeKj8aIhGKYVjNZ29yVmuXEsIKDKuigpVZ3P2gqxPa
         wRn42l6M5hdxnJjHueVdKGalKaZv+X6qJ9qAcvJOPSyQ2Do/yeySv/4CPMG2yDjxMLZf
         E7rlIpzXxv0bPKzBdZMDUSH7gewESdQz06HVMX+LH7MrL9RPOyIjfeNFj/38l1vhg89q
         /usswJaZrsnk8GZaoqElSM+EynFrXnlLaPdhE+RdA436HsudnqKUGNvvFu5xEi0CNQFU
         SyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729256625; x=1729861425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sODVftRiJEB/0R5ZKHQ3MqkxJS24ttUXB9G8dSmRS9Y=;
        b=MAF2H1mqiaKQ0hfMJlkVVxpUrHS6cPViaX0DTeCXnLMuKaBUOPrFo9eULtU38nsV6v
         ag0xq0IEruaxsyWCsYdSRkv76OgTP/e4PYeZv2tbdOyvit3UV5PrFu/N3DP7TIKkQz04
         iuiDnbpYGlgn9QZvyW4hGR6NokEAFfXb/0TcE/IQEvSI7fbfrfLdNN9NCFxCmaPYJ1Kf
         qeUyrdja3loBUsyfRAdczC4yqPFJ16+JFMIKTU/AIxLs6gLKuJnDovxNq4ahrtHhk120
         xu1yBXU/nebdFSuhGkWZ+xAvNlYdBhghfcm+gmB+SKZ6JySB/RzPP35GR1JRmijmntIz
         n3Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWGfVeLp+8cQBaYkxWkxD0YQdnj9PydNA+in5aqVDuyijWnAcmxH+urKu1MOwj+DKYytHZPKpq3WK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK6qJ/AbQC5m7I/3e9DutsPofpW4sbS4MxcunDyeWAGqXTRB5Y
	nXAzEsyGsC8hLL10ayrpv1R1XmIFvkn2nPUZZf/oAOtfSjV15C6N4zyBkFsDO6Y=
X-Google-Smtp-Source: AGHT+IEkARo88tz9Es4BK+YT+IflxGdlBCDgKhTnNhRNnTwvn1zSXl9sNOjA8rduKHJn/2Ffh9OhwA==
X-Received: by 2002:a05:6512:3d24:b0:539:89a8:600f with SMTP id 2adb3069b0e04-53a15452b7dmr2496478e87.23.1729256624502;
        Fri, 18 Oct 2024 06:03:44 -0700 (PDT)
Received: from localhost (109-81-89-238.rct.o2.cz. [109.81.89.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c27893sm93408266b.195.2024.10.18.06.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:03:43 -0700 (PDT)
Date: Fri, 18 Oct 2024 15:03:43 +0200
From: Michal Hocko <mhocko@suse.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: David Hildenbrand <david@redhat.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Yosry Ahmed <yosryahmed@google.com>, akpm@linux-foundation.org,
	kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de,
	mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org,
	thuth@redhat.com, tglx@linutronix.de, bp@alien8.de,
	xiongwei.song@windriver.com, ardb@kernel.org, vbabka@suse.cz,
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com,
	pasha.tatashin@soleen.com, souravpanda@google.com,
	keescook@chromium.org, dennis@kernel.org, yuzhao@google.com,
	vvvvvv@google.com, rostedt@goodmis.org, iamjoonsoo.kim@lge.com,
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v3 5/5] alloc_tag: config to store page allocation tag
 refs in page flags
Message-ID: <ZxJcryjDUk_LzOuj@tiehlicka>
References: <20241014203646.1952505-1-surenb@google.com>
 <20241014203646.1952505-6-surenb@google.com>
 <CAJD7tkY0zzwX1BCbayKSXSxwKEGiEJzzKggP8dJccdajsr_bKw@mail.gmail.com>
 <cd848c5f-50cd-4834-a6dc-dff16c586e49@nvidia.com>
 <6a2a84f5-8474-432f-b97e-18552a9d993c@redhat.com>
 <CAJuCfpGkuaCh+PxKbzMbu-81oeEdzcfjFThoRk+-Cezf0oJWZg@mail.gmail.com>
 <9c81a8bb-18e5-4851-9925-769bf8535e46@redhat.com>
 <CAJuCfpH-YqwEi1aqUAF3rCZGByFpvKVSfDckATtCFm=J_4+QOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpH-YqwEi1aqUAF3rCZGByFpvKVSfDckATtCFm=J_4+QOw@mail.gmail.com>

On Tue 15-10-24 08:58:59, Suren Baghdasaryan wrote:
> On Tue, Oct 15, 2024 at 8:42 AM David Hildenbrand <david@redhat.com> wrote:
[...]
> > Right, I think what John is concerned about (and me as well) is that
> > once a new feature really needs a page flag, there will be objection
> > like "no you can't, we need them for allocation tags otherwise that
> > feature will be degraded".
> 
> I do understand your concern but IMHO the possibility of degrading a
> feature should not be a reason to always operate at degraded capacity
> (which is what we have today). If one is really concerned about
> possible future regression they can set
> CONFIG_PGALLOC_TAG_USE_PAGEFLAGS=n and keep what we have today. That's
> why I'm strongly advocating that we do need
> CONFIG_PGALLOC_TAG_USE_PAGEFLAGS so that the user has control over how
> this scarce resource is used.

I really do not think users will know how/why to setup this and I wouldn't
even bother them thinking about that at all TBH. 

This is an implementation detail. It is fine to reuse unused flags space
as a storage as a performance optimization but why do you want users to
bother with that? Why would they ever want to say N here?
-- 
Michal Hocko
SUSE Labs
