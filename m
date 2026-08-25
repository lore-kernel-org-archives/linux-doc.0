Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6659E3D3D0E
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643624; cv=none; b=Q3Wr71gJz7+i4uCEC3yyCw02z3oGNrW5G9omKjQgRNRbHn/JSpzYx7XdP7m7rAq7JZxsOIdOEA+ra0VxnSKQ8fNjNtLJM9c4G8z9fOpDPvUo2op3bUzbnI2IJPMiywKM+OuwPA7YtHWmgezyM4A+Taab+HAO3o1jhOMsXkGl5QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643624; c=relaxed/simple;
	bh=tZJHSLhita37GZE4qEiliq716XxjbQZxZLfaHUeBxsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4NEiuJi0qbMS9rak5uiAUOcKJL6W19oiwzTEJNfjzZ1XSjGpzlIDdrXctq46liFLbKpX/dJH6JCHdfCOnXC4Zmxpa1wh/9rlU3PnyrCifzVrwYTKmn7gWoMdHxo/VBBFsgDwFKD4blVwGcSVoAB4A7FLMy8ciRR9dM4bP56Q/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EUYlOulW; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EUYlOulW"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so4818502a12.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 00:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787643620; x=1788248420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HvIHRFnGldbLfSeUQWu0/lotI0W1auWfZBfJjbwacgc=;
        b=EUYlOulWc6m7/itZjtlAZdJVn+dL8xlUxJTLw7r3HYQtKBe/qoCwuVfzCUfAJJyYE+
         QoTK0OVCeHeepfYwKBYhoskukutgnL6jEf5+VvYjHWwIlt/7yx01uowAws5OH0iOmg2Z
         FHZdUBD5LqCZ9uYnZEdTRz57vIURCexBIk+mGyZfJlKwl2OnlJ+xbWZX8K5ST/Q73Gk1
         p57rt4BKJ663n/nykOGUC1QDRI+eouMZF0JljR6ZrATFfJ/UaE//8TMayDqtyx4/wJCf
         Z3L5o21Ap+4XkltYyBKmVDS6AlqfGSEXSUpPwYJJDyYHnY6qzp7sVvlQjs0tE992lzqf
         XbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787643620; x=1788248420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvIHRFnGldbLfSeUQWu0/lotI0W1auWfZBfJjbwacgc=;
        b=DQs8UDld6gljAh7sfdOhdYSjYZqHEGVUHP17633VDFiEeBhnCYct7yflhDwzB9Aeon
         KeBH7JHiNoXB12FMPHKychWEJp1aFG3Z9xyQDgwJcUgJdME1l2PAJx4lK2fAwTa/hIA1
         TT+alwooXFfV0B5fqnB/GQtN5nqE66SIvP6vBH8mGyPAWhn9AkBcvHelV5kehZZjrxGP
         7jcFabq0Wv/ef8D9/9mojcFfNNT7ZOqhDBO+k2I+1yaMHOPjFaYGuefKQJkO+4eeuinD
         n+1dGDMynnCHIPMxrtP+weMFWl2EKWecGZ1S7lBf0NkD9cplEv952MhxJW0GtI0ZZJEY
         eczw==
X-Forwarded-Encrypted: i=1; AHgh+RpOW3fXAUuNPukdnNvOYCmfU8jWYfgBABOeMUleMEN5ng8p1/qIpdIwymnTTJ7Be/N7HXoEWkhpfg0=@vger.kernel.org
X-Gm-Message-State: AFuF++lUXrPQGSbzryJj+exHUrCIXjNZ4ElF5ouMLE1hG3FGoI9YflLL
	+PxnXNYB2EfU7cqjEGwsoMMvClOeHTLrR+Oq3jfOLYIaBUX30FMkdHQX4NPlCZ+V3cU=
X-Gm-Gg: AR+sD13pcaXa1idQ/PtLlUXkjb2tB6pxexfEIB+4W4BO0yx/fcWqqWpDvcx5cR0KUcb
	9mSSBiuF0XvmRJ/ESAGMu+J35iWpdxi69cjvJ7ast4JaV3F9Rypzlw00lsV5oGv4ftwezTrppq8
	F/VGdkpJCEyruo2i2f5t+igv9Xh5nDKHbzW8BGJvpJPw7C1stdeeWuMSmotphkxRrlwWUYLoSGK
	9Sbh5SSWgXDMde9lDcveRqqCbkRJT3DGP5q3e44lJ2OWyN2LegwzTkNjEpNzSyrJddGjDz4Z0+E
	peTVY5WuJbUuKE5w7FUBbMznwHOC9XWNakSf/zaBZqmm3kv0E6nmZ7jfCT14uViuWwueMUxCToE
	XtmQvzztfNGkoc/P8DNgK/Grvtio5FNfT+iiP/0b/tW53QE8QUAsYMH4rarH0GIpgpFwcGVcWMA
	BO7JvZ6Tkcvdqsws04DQ8rQ0WGrpFdWmaWILnuy/7o4rfBRK5BIgRYePQori6u40HsVVvsPlPLl
	g==
X-Received: by 2002:a17:906:9f8e:b0:c24:b11a:46fc with SMTP id a640c23a62f3a-c24e5be5ae6mr443422266b.22.1787643619483;
        Tue, 25 Aug 2026 00:40:19 -0700 (PDT)
Received: from localhost (109-81-81-112.rct.o2.cz. [109.81.81.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f6b48sm1685768466b.33.2026.08.25.00.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 00:40:18 -0700 (PDT)
Date: Tue, 25 Aug 2026 09:40:17 +0200
From: Michal Hocko <mhocko@suse.com>
To: Eric Chanudet <echanude@redhat.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>,
	Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 00/11] mm/cma: charge cma allocation to memcg using per
 area counters
Message-ID: <ao1G4V-MhsjL5Bms@tiehlicka>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <aoqbCyX-32doBJwd@kernel.org>
 <aoy88hVQcA6Gkfuk@echanude-thinkpadx1carbongen13.rmtusma.csb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoy88hVQcA6Gkfuk@echanude-thinkpadx1carbongen13.rmtusma.csb>

On Mon 24-08-26 17:58:49, Eric Chanudet wrote:
> On Sun, Aug 23, 2026 at 10:02:35AM +0300, Mike Rapoport wrote:
[...]
> > CI found issues:
> >  
> > https://github.com/linux-mm/linux-mm/actions/runs/32519133924
> 
> Indeed my apologies, I messed up CMA=n it needed a forward declaration
> and gating for mm/cma.h content included in mm/memcontrol.c.
> 
> I queued this up for a v2, with the other issues reported by Sashiko.

Let's focus on the highlevel design and usecase disussion first before
you start chasing specific implementation details.

-- 
Michal Hocko
SUSE Labs
