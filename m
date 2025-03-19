Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3A98F6D
	for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 15:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742399078; cv=none; b=QrfXoO83PKUUHTafSoGuiCYkH169qfpF40ieYpRpxht8PVZFYlLk9fFVE0wuzVt3iiGmNEMr20cKKm8jjmx8ZqkzYH9u4BPCFS5YcJYht0Jziy9FGWxqpvmHCWKuNJAs4AMSm+hEaZihPvUL+rQSrJOn1AOYEaKDnE+gJP1aNvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742399078; c=relaxed/simple;
	bh=ijx4QVA6cu7/bppMn4qjyQgrq7PDRcrE8h4ApLxVMGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ivj4kNLwM5MKVnLYox4J3KA/rRAvP/KGCY/5ShH0geyUVHX4Eqe/0zJaBz8n8leDySuk7fnkAabFs7KDj1SIjvMNc2vXO3K1t1SAMY7z7QFG9mlPwZXDdAD2u10zY2VWn0DJrnOAHSZYbI6MWNXjX/1XbZ6DHPo3wjCcKceiGqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=tS+DbH+/; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="tS+DbH+/"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47686580529so58585101cf.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 08:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1742399074; x=1743003874; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9si6QKET998u7WyNlD/oIsbCSW0xvxa41wWw0Ozqipk=;
        b=tS+DbH+/UZlkS/aF4DyezYHorNb/pFwXbKo/UvY4EVdZSx/jbqOVyIYd+CGgx8rLvo
         1A3YrAzGY0AC0BNb6LYD/99322ufTOIkGMxSXN3xbcKoQuveAh9CvEdKiDKIcRlj58XE
         xNk8BiJFfp3ZI0fZwMAf9AmRGcMc8dnZH1ZiHV4YZg3tkNDvQksIye2al2pAzgrmr2Sg
         nAs/qua4G+YBw+Xp64j39s8orrFOsmFkZnTlQm9Okp91Zm0gf5W/6ealoTKFtGavAbYY
         vA8NTnCI5m+fqKyU5IfgmAhJ6fANAHkHkoTJOUIu7Ka9xYe6t0psukdYy2Xw7cukP+n0
         03Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742399074; x=1743003874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9si6QKET998u7WyNlD/oIsbCSW0xvxa41wWw0Ozqipk=;
        b=ENiQLFMWfd0/nDMh3VSlZw9mELTQEQJPIOOzR5WSXicV0U6Dc12YTK8zS4b2IQZqP5
         Ih3goDnwi/rueKi4jdxWc+vefzfOfvADNT3EFamfCtkAu/b2XXyZGiNoXSYJZAjTZqCA
         AiCJT7GTmm0eKaG3lVnK6VqXm4DCKarYQr2S3A8hWEsz1JEJSaAoeapLg+RAoZIIS8Tb
         GBr97hmXTBwzLlXvd8QGDEryWEn0zyOHqcdjza77nMycoy+ipUun8E/xulmNO9H9huOd
         UlIUnyb7XwfWUN3I45bkjtnW7lg+rWB+hk/DixW7L7PtSVJyaSzN0iQlVjvKZVcAKB00
         M5aA==
X-Forwarded-Encrypted: i=1; AJvYcCUJaBhgF/CPMktlcNbl60z0pMjQPoBpNgKhfC8bxo5RVyiYNMZMVozvfkIk5nuo1yhKTyXomTPB0/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+eNUt7IwZtE1uXey5AfEdltDnyns2na7ewhA4WJfrcF+lzOF0
	RhXjphJ43jgR1/l5sEwRtGanks4K3ICQEN9DG3QhnXcZM+MHDkWJhvPTxG425nM=
X-Gm-Gg: ASbGncvpw0K6oyRKhdq8bhN8qYxfsp2UUknaU+GQzeE9c9o8CQh6wWYZq1vBvPRG1+X
	XJLxNIxkemKD6EZRiVEr2oPePCbHXTrNAE1I+rskae/uJLdJL9/nh9NjxZMTEEIBSTm5wuBApqb
	6I+0uB0RsFnSsIAqkasJK+KH1KPYkWmtE65SBmblKYHMiSjUR2tRKzYGqQH40CcGzJUdOQaDjK1
	RKW1Fs1BiIf0ASpeF6uKW6X0SKM9ozOwprQkncwybTzo8SG0FmdROgIbmz6COZGPidhxy+7/5to
	mOB1SgMI2KsirmO79dN4021yRSccQWC2CfZQscecoc4=
X-Google-Smtp-Source: AGHT+IH2ElysGznDqaVkF9K0dG1j3qwf6OVzHoFCKXB3QMfIF6k7b3yKuQfRi9aAY26/yEo88wfixQ==
X-Received: by 2002:a05:622a:2b4a:b0:476:8296:17e5 with SMTP id d75a77b69052e-477082f00f2mr50488621cf.17.1742399074007;
        Wed, 19 Mar 2025 08:44:34 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-476bb7f3c86sm81158871cf.54.2025.03.19.08.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:44:32 -0700 (PDT)
Date: Wed, 19 Mar 2025 11:44:28 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: Hao Jia <jiahao1@lixiang.com>, Hao Jia <jiahao.kernel@gmail.com>,
	akpm@linux-foundation.org, tj@kernel.org, corbet@lwn.net,
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: vmscan: Split proactive reclaim statistics from
 direct reclaim statistics
Message-ID: <20250319154428.GA1876369@cmpxchg.org>
References: <20250318075833.90615-1-jiahao.kernel@gmail.com>
 <20250318075833.90615-2-jiahao.kernel@gmail.com>
 <qt73bnzu5k7ac4hnom7jwhsd3qsr7otwidu3ptalm66mbnw2kb@2uunju6q2ltn>
 <f62cb0c2-e2a4-e104-e573-97b179e3fd84@gmail.com>
 <unm54ivbukzxasmab7u5r5uyn7evvmsmfzsd7zytrdfrgbt6r3@vasumbhdlyhm>
 <b8c1a314-13ad-e610-31e4-fa931531aea9@gmail.com>
 <hvdw5o6trz5q533lgvqlyjgaskxfc7thc7oicdomovww4pn6fz@esy4zzuvkhf6>
 <3a7a14fb-2eb7-3580-30f8-9a8f1f62aad4@lixiang.com>
 <rxgfvctb5a5plo2o54uegyocmofdcxfxfwwjsn2lrgazdxxbnc@b4xdyfsuplwd>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rxgfvctb5a5plo2o54uegyocmofdcxfxfwwjsn2lrgazdxxbnc@b4xdyfsuplwd>

Hey Michal,

On Wed, Mar 19, 2025 at 11:33:10AM +0100, Michal Koutný wrote:
> On Wed, Mar 19, 2025 at 05:49:15PM +0800, Hao Jia <jiahao1@lixiang.com> wrote:
> > 	root
> >   	`- a `- b`- c
> > 
> > We have a userspace proactive memory reclaim process that writes to 
> > a/memory.reclaim, observes a/memory.stat, then writes to 
> > b/memory.reclaim and observes b/memory.stat. This pattern is the same 
> > for other cgroups as well, so all memory cgroups(a, b, c) have the 
> > **same writer**. So, I need per-cgroup proactive memory reclaim statistics.
> 
> Sorry for unclarity, it got lost among the mails. Originally, I thought
> about each write(2) but in reality it'd be per each FD. Similar to how
> memory.peak allows seeing different values. WDYT?

Can you clarify if you're proposing this as an addition or instead of
the memory.stat items?

The memory.stat items are quite useful to understand what happened to
a cgroup in the past. In Meta prod, memory.stat is recorded over time,
and it's go-to information when the kernel team gets looped into an
investigation around unexpected workload behavior at some date/time X.

The proactive reclaimer data points provide a nice bit of nuance to
this. They can easily be aggregated over many machines etc.

A usecase for per-fd stats would be interesting to hear about, but I
don't think they would be a suitable replacement for memory.stat data.
