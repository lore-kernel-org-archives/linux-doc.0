Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD412798EA
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 21:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762894903; cv=none; b=d7U++Rh6CT0g48cKYbs+tS+Q6Rx4UxTGs0gxO3nWwWkvC29VKeeAwppPZL7tpgSTP3sOjN67DhEuJd/yLBOULZePtEM8GkpJ6gVA7TUkX+apLRSem+AZ8J2QjQFMg1UPN2MxebsiLYzxgOjjqIiy7FPkz45JECzariqaWdj0s6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762894903; c=relaxed/simple;
	bh=00mv0TjCUbXDRMs+VKrHJYkUdKXkKT462q4ka73JY3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=th92BYn9zTLK6Q6wAMhSVFJ+8zCFg0hmvPj6kHWzG+TmpgeaP84MNsbMHsW2mDr4cbx19V3IpcWgi/NEX58MvDGOBU7AaaKoj9UVEFbMPRmjStfB9uIvNcvqiEYf8Kmj70Fnc29tjEI89+iTTpT8V+F1L5CDn8Ak9K0ssv9DVqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dDmdMGQ5; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dDmdMGQ5"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so148609a12.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 13:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762894899; x=1763499699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AOtZbxVqz3T0EH1q1J5hisXUupKcXN5oOYovjWYI2BY=;
        b=dDmdMGQ54eC8AihcZoP1DwUwOZ84UMouBumbPJmV7NyCMUXstvKJNRbpr/2i/Y8lAP
         RWc3Y6kUcJd7s41Il2BObfyPZBL7H9XOFTI5xHZhIM1am1rQ3ybdkwUpizbWuW+r4irl
         P06SHJbecjOuAqv2kzWfeK/dtBosGE5qa8DabdYshiD0Yjz6md3dVbL4LP/LTFK8VJ1S
         FhyaoQfZ813cmSsgU+jG5V6hhr33/xOdbcCujRuhfhtOdqRa8W6F+H52EygoTObM09gb
         Su0ABP06YmSP/zcJPGny4F00RnNy+vnvDR8J+mnciacD0gv5KjkbjJiF5R42GQ3pCF25
         pD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762894899; x=1763499699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AOtZbxVqz3T0EH1q1J5hisXUupKcXN5oOYovjWYI2BY=;
        b=MmQvQJMGiSLbGWRjbPn4LbY7dULYT9aI7uUvU+ZSzfz2yHIaNCDTSguUeURQ4XOJFy
         pQ6Id83jTwYcvg9I7UO4eWT2G86i/b93UVi51DXb6akoKlItDKC1u2F8aWSsGXWz0FEt
         f163VBNkn9+LboK/7C8WfMeVQzziSfTuIbPJRvxm799AwMymGv6fOXHvX+W+/iBNSCxE
         f321DAg8wOq/dvhO5BQSeAe23IjMruyfGLwgLO2xXASlgHv8VSlhby99od4L4GYCtvG/
         i2n2vEKqEM8xPdWejUnJzjESf5QguSeBMJGEnj1k9c5dbKCGtAVnMxy+LWLFVPQeYNWs
         x84g==
X-Forwarded-Encrypted: i=1; AJvYcCU9Xyk4qqHuXxaOsL15T/Las2gQhH/BPMWzJ9HmmstcgQwUBKcu7c45xH4KU3auFUuZPSy2MhUlXiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8euQ831hQbk8/p9sjsMHURr2HlDIj9JMDFmeVR4fOj8np3LtX
	Nn9whsgFLl0h0PzLRBKR/DacKuae5ONwRKidvXX7rZcLMuIV0YjcxUYoeOX+tDdhGSk=
X-Gm-Gg: ASbGncvYJqlj4JvQ2MR9fv2S1pArXQoB7NTyL6g+23pjsfLPomVFjZkX/H8ZK+A3bie
	aMcigH2ZvDXBKqvKMq0GzKLsk1sir4SkUwkcEa3c0mFllKH5Goior5bzQubf8rQgEl1GuWi65WV
	QVK6Zf9X8btEcLL1o1yK1wWYjcGs6qbYHWypOR2JBUH1n4GDuqLZFO9puBy/M61ARYcegN9Wjcf
	mvx2WNLZCRcVUkw43hoxsagRXy7HcGdJZh0h42Gpp5qwQUC3YnMix17nmMDcsLSaqnaH/o+Ei34
	j8O0QxtG8rMpluW0uNeK5QIn2Wjo91gzNhWrwI1PPEj8KjYz48mbzO5rAYxl1SQNBnzAjnU25IW
	5T9YDgNfOGBm5rIqTJiFNI/OU5t6khLnFjumlqjomTK6cixQ1fRJjtwqdX7lWSwGZ+aoVTBtBzc
	e8oMEWkBU1srY6OrIWf9eS24e5
X-Google-Smtp-Source: AGHT+IFHxQR5RsZZYuu15UkFc5wCGawdUUh/83F65t7RT/bR8gwY77ILDOKtOxH1D+cIwgNbNyoHRA==
X-Received: by 2002:a05:6402:42cf:b0:640:9d8f:3c73 with SMTP id 4fb4d7f45d1cf-6431a577ae9mr518057a12.32.1762894899315;
        Tue, 11 Nov 2025 13:01:39 -0800 (PST)
Received: from localhost (109-81-31-109.rct.o2.cz. [109.81.31.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f86e12fsm14093400a12.34.2025.11.11.13.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 13:01:38 -0800 (PST)
Date: Tue, 11 Nov 2025 22:01:37 +0100
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
Message-ID: <aROkMU-OFAmYPBgo@tiehlicka>
References: <20251110101948.19277-1-leon.huangfu@shopee.com>
 <9a9a2ede-af6e-413a-97a0-800993072b22@redhat.com>
 <aROS7yxDU6qFAWzp@tiehlicka>
 <061cdd9e-a70b-4d45-909a-6d50f4da8ef3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <061cdd9e-a70b-4d45-909a-6d50f4da8ef3@redhat.com>

On Tue 11-11-25 15:44:07, Waiman Long wrote:
> 
> On 11/11/25 2:47 PM, Michal Hocko wrote:
> > On Tue 11-11-25 14:10:28, Waiman Long wrote:
> > [...]
> > > > +static void memcg_flush_stats(struct mem_cgroup *memcg, bool force)
> > > > +{
> > > > +	if (mem_cgroup_disabled())
> > > > +		return;
> > > > +
> > > > +	memcg = memcg ?: root_mem_cgroup;
> > > > +	__mem_cgroup_flush_stats(memcg, force);
> > > > +}
> > > Shouldn't we impose a limit in term of how frequently this
> > > memcg_flush_stats() function can be called like at most a few times per
> > This effectivelly invalidates the primary purpose of the interface to
> > provide a method to get as-fresh-as-possible value AFAICS.
> > 
> > > second to prevent abuse from user space as stat flushing is expensive? We
> > > should prevent some kind of user space DoS attack by using this new API if
> > > we decide to implement it.
> > What exactly would be an attack vector?
> 
> just repeatedly write a string to the new cgroup file. It will then call
> css_rstat_flush() repeatedly. It is not a real DoS attack, but it can still
> consume a lot of cpu time and slow down other tasks.

How does that differ from writing a limit that would cause a constant
memory reclaim from a worklad that you craft and cause a constant CPU
activity and even worse lock contention?

I guess the answer is that you do not let untrusted entities to create
cgroup hierarchies and allow to modify or generally have a write access
to control files. Or am I missing something?
-- 
Michal Hocko
SUSE Labs
