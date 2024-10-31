Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877591531C0
	for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 08:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730362372; cv=none; b=W235bZW4i/iC1ZAhvAXLMXn1KKRqm/YZGFBrCgxgQcGKlQRKy7KvVXQvlRPTndPESGMnw3AhHeW338bQyB4VqInBdCmP6cUa1D16kzWCvYZvN7e2CdBf4mwHv2ngaaBEjalIJJJrYRlkhc8r9QNHy84CIJAQSbL2bChomlDt89w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730362372; c=relaxed/simple;
	bh=dklUTvxcoZQ19Ejb/he4j0SPUhxKOWxWCHjH3frzbvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlXTDyiZB8i+j/d7rQwpw/fY3OVFjgLrRi9sksW4TIbLdqdXDjZ7N0Jpj+/C8mrGjCj5oV7xLaqK8y9VmD8r+oT/+ZYL8MtENHmYs9k94oN1iIcsGIzqB+cw6+eRFAPbID8BFI8+A6TVwRDwAlcyWZTlA+gaPKnNByVkOr7pEnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MOqUzrqV; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MOqUzrqV"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9a0f198d38so96385166b.1
        for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 01:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730362368; x=1730967168; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1NsFGdhFHt7vNHkeF4Op7bN0bdu6mqlOlf3mw5K16Yo=;
        b=MOqUzrqVELO0B1aiEWK4CwehXQYZyGKsf+b3Rl3n/boLMSvyuxYSoy2DC0PtZArDyH
         cALtfqIFfgEnzIdv3FNmNDYkpucv8Q7gGit8+SKvpoG+Kc2jntn1jlDGjqCzEitrsyS5
         jEgg+WjarVmoP8ph0KcA9Eu0dJ5J0BpYVz4sRESr0+MkdTWCYDgSzsXEgJfCfx5/Icix
         BTe0CJVPvMj7qeOwgwSN+Gujn4zWNUCrnSZYv3QEPBv9CI5mgGRr7AkHA2gQ17mcDK0Z
         BUGmIqUGWeAzBRp/ZsshlngqFOdIdGeyd8wkZrOR9Uu6lX/55OWq273rgm6BC79FnQoy
         Pj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730362368; x=1730967168;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1NsFGdhFHt7vNHkeF4Op7bN0bdu6mqlOlf3mw5K16Yo=;
        b=i48lKkRCSryp1Nuql5FOYQrsWvhjKF9L24k1CDieGR30M/3f/j1AtbqWjSCCJDLWin
         nGoHOregYM2iDP27Pu/v8aBCGtOTYATzZGsqT0oAIj3xS2YlMoc/I94nkLKn/Q0BiLdL
         2YMqn9Ro8+g6sElgT7DPRHfJiwh7foZ0yawiTOh0/NyfEF+LmYCzR8R1Eb0IAzpLMBWu
         fkkWUTb56FKAO8fR0krpepIc7PBpLQ+J7GXl2TqkhitML4+sdVuzoer4Q589RZW4CM7Y
         Xw4Qbtu3/yJHyl+Io0c9RqYa2YS/aHxXXQBaEzBRjtxRej4lqfWDjNKHKuk2GW/mhxpG
         5rmA==
X-Forwarded-Encrypted: i=1; AJvYcCXBjivawFMZDV6DBNOX3FONYDBelIfulZHWXwa4oNsDipd284PeTcwghHweX6JaOcIT8EsfF+jEu8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGSu+0QKQaCxD9PrSzW6+QYiOwNfjxF50ljfzZPUKdos1KED6J
	DkgAG9EcSvk9WeYItVDmNYX2xJkyYy53q2DSd4yfRWszRsZQu7/Yzm23k3AjROw=
X-Google-Smtp-Source: AGHT+IErqAcDPZr221CAovWq14T0+yAWNPysXadW1rVCxC28+QsDk01at4oQ+oc4iW1WxHhAWm19ug==
X-Received: by 2002:a17:907:94c1:b0:a99:4ca4:4ff4 with SMTP id a640c23a62f3a-a9de5d98002mr1492014866b.23.1730362367461;
        Thu, 31 Oct 2024 01:12:47 -0700 (PDT)
Received: from localhost (109-81-81-105.rct.o2.cz. [109.81.81.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c55ffsm39587566b.59.2024.10.31.01.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 01:12:47 -0700 (PDT)
Date: Thu, 31 Oct 2024 09:12:46 +0100
From: Michal Hocko <mhocko@suse.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, nphamcs@gmail.com,
	shakeel.butt@linux.dev, roman.gushchin@linux.dev,
	muchun.song@linux.dev, tj@kernel.org, lizefan.x@bytedance.com,
	mkoutny@suse.com, corbet@lwn.net, lnyng@meta.com,
	akpm@linux-foundation.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 1/1] memcg/hugetlb: Adding hugeTLB counters to memcg
Message-ID: <ZyM7_i1HFnFfUmIR@tiehlicka>
References: <20241028210505.1950884-1-joshua.hahnjy@gmail.com>
 <ZyIZ_Sq9D_v5v43l@tiehlicka>
 <20241030150102.GA706616@cmpxchg.org>
 <ZyJQaXAZSMKkFVQ2@tiehlicka>
 <20241030183044.GA706387@cmpxchg.org>
 <CAN+CAwM1FJCaGrdBMarD2YthX8jcBEKx9Sd07yj-ZcpDxinURQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN+CAwM1FJCaGrdBMarD2YthX8jcBEKx9Sd07yj-ZcpDxinURQ@mail.gmail.com>

On Wed 30-10-24 16:43:42, Joshua Hahn wrote:
> On Wed, Oct 30, 2024 at 2:30 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > Joshua, can you please include something like this at the end:
> >
> > lruvec_stat_mod_folio() keys off of folio->memcg linkage, which is
> > only set up if CGRP_ROOT_MEMORY_HUGETLB_ACCOUNTING is switched
> > on. This ensures that memory.stat::hugetlb is in sync with the hugetlb
> > share of memory.current.
> 
> Hello Andrew,
> 
> I saw that it was merged into mm-unstable earlier yesterday. Would it
> be possible
> to add this block of text to the patch description right before the footnotes?
> 
> 3. Implementation Details:
> In the alloc / free hugetlb functions, we call lruvec_stat_mod_folio
> regardless of whether memcg accounts hugetlb. lruvec_stat_mod_folio
> keys off of folio->memcg which is only set up if the
> CGRP_ROOT_MEMORY_HUGETLB_ACCOUTING cgroup mount option is used, so
> it will not try to accumulate hugetlb unless the flag is set.

Thanks for the update and sorry for being pitbull here but this is
is a bit confusing. Let me try to reformulate as per my understanding

In the alloc / free hugetlb functions, we call lruvec_stat_mod_folio
regardless of whether memcg accounts hugetlb.  mem_cgroup_commit_charge
called from alloc_hugetlb_folio will set memcg for folio only if
CGRP_ROOT_MEMORY_HUGETLB_ACCOUTING is enabled so lruvec_stat_mod_folio
accounts per memcg hugetlb counter only if the feature is enabled.
Regardless of the memcg accounting, though, the newly added global
counter is updated and shown in /proc/vmstat.

I would also add the following

The global counter is added because vmstats is the preferred framework
for cgroup stats. It makes stat items consistent between global and
cgroup. It provides a per-node breakdown as well which is useful. It
avoids proliferating cgroup-specific hooks in generic MM code.

I will leave up to you whether to add above paragraphs but I believe
they clarify the intention and the implementation.

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!
-- 
Michal Hocko
SUSE Labs
