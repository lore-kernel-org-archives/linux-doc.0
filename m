Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD463328EA
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 19:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762890490; cv=none; b=oAsIy1DuTA/yWGVpCx+Fr+yi1A6qVQEX5Nsyi47nNWa38nc+AVCUR349E4Q7U2MA53Ys8a/XOU3kPIm2W/hxb2bvLD2sZ3XMPaBq4nDF3UM/ZpQy9kQV3AkC9MSGRDGGhpFE3LGggFajEb6sqZ3i2yjixsKTazIugRRVdnHOg8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762890490; c=relaxed/simple;
	bh=7NdM9un//Qfx73SdLhAZgOos/RHP5qnSPQzhB6KpO0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCjzmVZ5JUeu7k9AIsf2ikbN11LYOSEL+zlAcnzBF8E5Kux4sKNMyvIlmth9Axn3B5IJJZuvHpnIYwyuGBEPprbwXR+AoGKJhfD3AGu5wMWU8J55do9/TInqNDUzL+I9xwy0IRC9f3pCVfgndc2DXtm6DLUOmTiF6pNGoAT5JXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M+HGwQjc; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M+HGwQjc"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b72b495aa81so19092966b.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 11:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762890486; x=1763495286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lKDhxqPky+srato1DuJ5M1fuwPAvG3rezlKsBwQc3xk=;
        b=M+HGwQjcYfUdbj3df22FBRRQUUcEwQVqmaxOs75Z2J8aVsx9lVFnRP+SGNh0qzig4q
         JHTMx0kiC7KoUFCJ92wZzPidu1KZ7RkvZGF8HuCADjIRyuAPkObgQz1FU2+wvZw/D0+d
         frjbwY/Aj1XUs8r2V2hB1XXBGNPwFBcQhUlEcZQ/lp5FVT3hvIeZ/rF0u5l038uKM4VK
         sfuh2BcvOaA1HHSihxT9Ggf7614QBX+CPM6fWS6w9rCcaksnIpCS3sko0m75mJNnWoKl
         5057wFox0GHKQlu+BXvNjMYIMA0IjA/vrHJqePUfdKUbIvo35/1A5b0fNkA8D2j7zrDi
         1O5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762890486; x=1763495286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKDhxqPky+srato1DuJ5M1fuwPAvG3rezlKsBwQc3xk=;
        b=WsWRf0TzujTU/8A5xrl5aMKe/uPB1WsKRrm5jdwIDD+ebdJk8uDj/yUV8B5bHFWrYL
         AgZ1t/S+sGUIOqZ/mjydkWFlyU/IKimmD2tzoa/1eyibfR7l1Ov1HtrfCw3ifF7FAndG
         d4JP6J4dDgGEbEndVDA7EiUkZtQ6kzkKiHle7yt0m9MDi4AKd/WwKdIQl6Dc+vEXLfZk
         +CInY9eb/WVa/2NYYLbQnBQVG1FIbaJjGi5dVyn5p13hqzEA6mR2UdHSud1E81AaWtsB
         RNEbVXnN/r8ZMMGH1Q2NVeQyOLdCfNwSPVukZQ8Efm9J/U1vsw6O9QV6uHlSZ+ByYv7R
         qxaw==
X-Forwarded-Encrypted: i=1; AJvYcCUtktzYscL84lSHnFYsmZ7NuFGQxZoKcijt0mkBg1ghtJMmRX2qYHb58AXHrLwaKcV65JSku8d19/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU+H7glKEeFmoxo13DcfU37J37atdpL+WvKMSIS4Y8GslDTysr
	Jag0nNhC970X7IfX3qNz+aXhoQbb7qVds9KAS7RpykAY4xiFghjZeJo8NwyqVUcSrNo=
X-Gm-Gg: ASbGncuWrlq2aQBDDxnyEV+eDgxcoXl3D0PeO+I7kLgo0Otc8UNn9pTGQB5jp478Wyj
	zf+vDYaCu3ZYJFORElOSIipVU7cqyjZ3uG6jW7lqkbw7AK+U0GrZrCyZ0eAw5rIpw2+NoUgb5g+
	ys4R2Xfv952IFuAENj/M9DkhmOXUnl+tQfzW4xt++Dq+f/5SHqn959zv6YAtLxr0fP4lZqAoeAb
	NPc5s+m5N969haMI4cRd2ullWErK3XpirOpKOZCRcL0NbbynxcMZ14HH7mGpKrqOHNZapIFjvu5
	WJ2t5BdSIpMzbVV2fTIwDXPEqnrrQOHLu8GO9KPmkH8nj3SvvTsjP4zR3tLJWmNl4eLRq6vUw7N
	QngQ6yzNvCoG9TQc/hnlVJD6duaHUPyvQMsNaAyiI0iolTcGqmO9sRIMaBRisxBi4NaJ5fJOp3U
	URwuLvwiEggzAKqKv8Iz3xXcqS
X-Google-Smtp-Source: AGHT+IEelejsUR71Jpq8Ao/NajBuvRLoWEBkOC/8vGvaNmUC/dfrqtprfl//rF6trpCO0nJn8h4ofA==
X-Received: by 2002:a17:907:9812:b0:b73:21db:53a0 with SMTP id a640c23a62f3a-b7331960eb5mr32990666b.8.1762890485668;
        Tue, 11 Nov 2025 11:48:05 -0800 (PST)
Received: from localhost (109-81-31-109.rct.o2.cz. [109.81.31.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bdf15sm1411961966b.62.2025.11.11.11.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 11:48:05 -0800 (PST)
Date: Tue, 11 Nov 2025 20:47:59 +0100
From: Michal Hocko <mhocko@suse.com>
To: Waiman Long <llong@redhat.com>
Cc: Leon Huang Fu <leon.huangfu@shopee.com>, linux-mm@kvack.org,
	tj@kernel.org, mkoutny@suse.com, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, akpm@linux-foundation.org,
	joel.granados@kernel.org, jack@suse.cz, laoar.shao@gmail.com,
	mclapinski@google.com, kyle.meyer@hpe.com, corbet@lwn.net,
	lance.yang@linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [PATCH mm-new v3] mm/memcontrol: Add memory.stat_refresh for
 on-demand stats flushing
Message-ID: <aROS7yxDU6qFAWzp@tiehlicka>
References: <20251110101948.19277-1-leon.huangfu@shopee.com>
 <9a9a2ede-af6e-413a-97a0-800993072b22@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a9a2ede-af6e-413a-97a0-800993072b22@redhat.com>

On Tue 11-11-25 14:10:28, Waiman Long wrote:
[...]
> > +static void memcg_flush_stats(struct mem_cgroup *memcg, bool force)
> > +{
> > +	if (mem_cgroup_disabled())
> > +		return;
> > +
> > +	memcg = memcg ?: root_mem_cgroup;
> > +	__mem_cgroup_flush_stats(memcg, force);
> > +}
> 
> Shouldn't we impose a limit in term of how frequently this
> memcg_flush_stats() function can be called like at most a few times per

This effectivelly invalidates the primary purpose of the interface to
provide a method to get as-fresh-as-possible value AFAICS. 

> second to prevent abuse from user space as stat flushing is expensive? We
> should prevent some kind of user space DoS attack by using this new API if
> we decide to implement it.

What exactly would be an attack vector?
-- 
Michal Hocko
SUSE Labs
