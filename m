Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FBB20010A
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 22:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759875149; cv=none; b=opbPLOgUqdCbT1KOVIv3FqIR1vw2OtYRJL2S/MOEYX9q3EXDZo/JQ8QV6wXdGXB5gIw3wf5c/Jo8j3ixTkev2PKqiGQeEVyPTF0oOs6wryMDyor0BZdtz37t217nELgfM28/37+BEfglSqBbbBK7t7YHFN3DDsKGH5VHcZn+hUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759875149; c=relaxed/simple;
	bh=zD1LPuYYLGObk59ZgrEWtOUqBncuVzaO6DVP1YPJmJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOe6pd8bNfyVrI1dVcvMdoT7FMMd9C2M/uHPuNdxm4sOVQriEBy0KqzufJd/0q3cNGRH/XR5Yb2EMUEhXZZwtOL9HeTkXyz7z3+AL7fx3td/WED60CygGOpkJs2ZGUfW8/TZ43YKdxpI0uZ13jt5CFP7as7HJq5foPIjDNtrPfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=FSKLUm87; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="FSKLUm87"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-863fa984ef5so822328185a.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 15:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1759875146; x=1760479946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ebBRD6yGmAnfNTiFyWqKhtyfR494yORKNRgWYunUcoo=;
        b=FSKLUm87KeHKzPQFzh+osGnLQFEZ2H2Kwbk38JbJOPQW4g9kYOZeY7ueeok4d4AnJf
         2xogaYsMXojBL9ljYuEiVz9lC2xf5lInZUEgVn5HdDpig3KpEpZppxXZmJZtu2Wg+Gw9
         CjJ68lhvCMD56sdCC4eEM4KkiNNg20K3BOFSAcb/9BTXmgUomXBN578QAjVK0PIUv/Mq
         Q2plWJB2UvfyefI8gmbdoNr5Lcmbyykg0pBYXEXBNQHTKU4f6zPvKfC19Mpj7sR6BIN9
         vkxMd/d2nZK++RJ0fBlG8PQyanLOKi21WfQZC5YonSmo6bPNE1Ng0MNFBYy8SJMtpevA
         NxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875146; x=1760479946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebBRD6yGmAnfNTiFyWqKhtyfR494yORKNRgWYunUcoo=;
        b=UZjW7mdqKDhqGJJpwwxBAZdt5Qa/RyJ5M1Uma1lAbecjoVGBUACuVFZP6QQAhAOxGa
         zEnaDoYOSbJUduDJBxsXOXl+z9XYsFCE8ELnV2Lq4arCKaROoxbfuDBavDUlUYlY4wHf
         M4ogdaELcQWxgaUOxT5ZTZAj7IIpuDaZAedd76icKAO6mZQsrMN3TPXeXQk/ODLn/fA8
         iTfbbHwu1aDCySuKYXEW5N6aD4U+RRxsZz/p8oQmXISQNyMbSZIy/p6E1ptURybWUMff
         PlAFGXn7H5OaiUXSS0+v+iC38blduTj0wfn0QKHFKPZ1oNZF2Fi7Cvp8BWndUTfeJ/qm
         N7Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWaqPXPaUK0WhCg3GZLJpE8nF7nOLNYunRlOOR86IT6pLyR0eE9uhsG3iAm/gR56DtdGjyMFG5K+SU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4r8POGg56eZM5wbimcXeXV27tRs4wgoOOEJdHEdytED1bFVOU
	VL7nb1N9S+g73ol6wnG7EXVqFkrv5p2wcmWkP9O5eT/DoZhxDRWh2pcAIa5xVmnTuxE=
X-Gm-Gg: ASbGnct31RjRBVfL724PHujfEm5gTnpdoV1sUJKNlCKZCx1lzXODNnHkaidUzSvCIb9
	Ki0nZCMk+nDFzcaDRWpwGxzVzviKGmJjDjq6mcKLK5J6ch8qTcQ7ujQ1SD6286uyzTqUJjPaEfy
	493hjjyxxrYHkz/HXctg2MxWEo/f9wmqWP1GstZUyF4MLK+4cSmj9fyF060l8uYRh9dkXIBRRgb
	izMNP8lwL/YY0Z3D88f3uPqVuH0BBfK8Z/jS01gv9WLFMndrxnbA3AZETbkjySigSVU7lPbD26z
	bFKFOR7+fXQHLujNU3KvSb3fejxPhAWTitjVlkC/O+Nz4NaQp+jGkVtppxg663L/xtbhTJoytKp
	3eKBmpyZ2J7FNZDvMeKj+hLzNvZ+bNquxtQrB2u3KKcnEEZsRK+1Z9jxz1fP0bxLjdh/Eui5szs
	tz7xJYHoQWZ9ZLdnFWE/eZjeZQBJ6UIg==
X-Google-Smtp-Source: AGHT+IGCq+eGhr6gIxsGpM2pRbfwzcvGwatmmJT+/kgQa0cOOL2MOn7JsQF2sMQyvLhQx3NeVxG6xw==
X-Received: by 2002:a05:620a:c4d:b0:855:24d7:5525 with SMTP id af79cd13be357-8834eff4d01mr214767985a.0.1759875146022;
        Tue, 07 Oct 2025 15:12:26 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-87779799145sm1548566585a.56.2025.10.07.15.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 15:12:25 -0700 (PDT)
Date: Tue, 7 Oct 2025 18:12:23 -0400
From: Gregory Price <gourry@gourry.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, corbet@lwn.net, muchun.song@linux.dev,
	osalvador@suse.de, david@redhat.com, hannes@cmpxchg.org,
	laoar.shao@gmail.com, brauner@kernel.org, mclapinski@google.com,
	joel.granados@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] Revert "mm, hugetlb: remove hugepages_treat_as_movable
 sysctl"
Message-ID: <aOWQR9H2i4J8dZZR@gourry-fedora-PF4VCD3F>
References: <20251007214412.3832340-1-gourry@gourry.net>
 <20251007145955.31dba3afad6200e885e906a5@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007145955.31dba3afad6200e885e906a5@linux-foundation.org>

On Tue, Oct 07, 2025 at 02:59:55PM -0700, Andrew Morton wrote:
> On Tue,  7 Oct 2025 17:44:12 -0400 Gregory Price <gourry@gourry.net> wrote:
> 
> > This reverts commit d6cb41cc44c63492702281b1d329955ca767d399.
> 
> It's been seven years.  Perhaps "reintroduce hugepages_treat_as_movable
> sysctl" would be a better way of presenting this.  Not very important.
>

But a blink of an eye! Will fix it up if feedback is positive.

> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -55,6 +55,8 @@
> >  #include "hugetlb_cma.h"
> >  #include <linux/page-isolation.h>
> >  
> > +int hugepages_treat_as_movable;
> > +
> >  int hugetlb_max_hstate __read_mostly;
> >  unsigned int default_hstate_idx;
> >  struct hstate hstates[HUGE_MAX_HSTATE];
> 
> Could sprinkle some more __read_mostlys around here?
> 

Makes sense, will take a look while I'm poking around.

Thanks Andrew!
~Gregory
