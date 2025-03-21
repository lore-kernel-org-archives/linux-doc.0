Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B616E2253FC
	for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742560212; cv=none; b=NMTXXNe3GhMzp5eEfGlO/YOKR/ru20Ins5DkTN1m0XwwC2EFIbTJGt0WN1MqN23if+fiH8H5U1YEU8Wf2nsWhyLniSxIMMLnRRl3uUKjSXyZvXWuS5NB6RzdvIxn9Do0oURikZJlKUVXUO+UQcaPGvSNyDdppDOdA/iJLFTu6Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742560212; c=relaxed/simple;
	bh=z2h8kmcrvjsG0wHPqWEEDMYXLWs3RQptqRtGchizi+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sznlFqWc3f56f14BfVnDc5M+HnIw0S0Kk7QklgBhbkqNjP4hM6D2xV73+8WrQilCpmhW0lAayMDRpQAvwoiKomT7kwr0lNv10UItNTUYRAulsxffG84ZpeLTO76s6Zg6BcmL0L0W8641Rx6h/sD5MlB0zeHpnnO6y7iI4Ow2t8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YIimjCTy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YIimjCTy"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so959216f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 05:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742560208; x=1743165008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G65UV4/EPEL+kQ65PV9/uamD/u6L+fEtW/r8PlOFSsA=;
        b=YIimjCTyLFFAlPTNbZO3VZsh/7j3Kc15NqeVnhXZBUOSddhkUAbprRzb0/3GMpZXk7
         Yt3GwW/WqwgKlcU50hEPXMGjCpjFqno1EzgV3Hb5vJJrEU93vBWjvdn2abi2loOVwOgQ
         GXNq9gWOTl3dcXxBKIa8U/zHyclZYfs09lgPw8jE1ldQzTkDKFKEwBuIwqpfLRXlT7MR
         ZoFKS+Ry368BOm7oxaUEVR+8YG4bcX9YbOivunjJ/jE1lrokjvj4/rbEAcHj7h/k6y52
         kRjUFB7BDRQzvpI72xL2dTvGrdHvXDnxmzkgvwufKA+n4WQJFLn2JlcR7HiKXtHsHFgA
         FftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560208; x=1743165008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G65UV4/EPEL+kQ65PV9/uamD/u6L+fEtW/r8PlOFSsA=;
        b=pYW+md0GFv1UzcH7WNOPf8bHcFj66CCuz4LXml2BxPaQzx/b32XB9KWrRDB/Ctya3h
         L4aGlLqQOv8n4E1FEmqeNyGiBpu4/by7eW8KBhUOvWj9KNCGF+sel/hvMA0aZ42Tzmiz
         vYrsMDYxV3L0GLnmdmCqrssBnmjNXGeD9NsTY90RUy4qst0/TqeHgFTaOEvXc7FS+GKS
         P6jFR3VWgvpUGgpd40MRjPHfssXcBFDwCy1Zy1oKMMYLWY5fvvHtwZ4WrSlZwBILfDk8
         Yhv1IX+gMVlCmyDvq6FJEhjF1pf3WHLlqKvq8tQ3L7VYVHpgD5Pq1GddyPzv8NlNAm4n
         CorA==
X-Forwarded-Encrypted: i=1; AJvYcCWHkmVE9LZpZJKtE8H38/t8xWhXYob9KBIAZVhHnce6G5wThP6uBU6vtc1eYQHtDP+w4zBtzxBE93w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzevatCVml+cc0UaqumvlSfC5SPJJcdVIrEF1WjBjVmTOUgR6y8
	dqgIMAXrKUmMWRU2OetWnnxuzWwSLVzRsDupiLIKSrt7LH5Vv3wa/drjzuTtzCc=
X-Gm-Gg: ASbGnctNUDLHDDhzZwxnnfC8n4jHn3MvkFlyi9cZT03ixjjMLypJDRBpmO47gfWDUsU
	TD5XhBiubiqtNP9mJpl6qlmOJrA/QxJZSE1r74wZYEAIUpP0TqtjWbSc1BsyZYtz/ozwthdmHK3
	l4le035fELzGd6NRGxUl11TAd3pwiR2RCCzrN2PyQLEPOdIwwakAV60iIrz5bxZ+qs2viKqv7uE
	kqdCGGnyKIQYufdYfq3Qv8qG6LpdNTmAV0P1Hf9Jg1tK4I7NE4Fxi5odjxv59ftpMpXFX+o5Rdy
	ZixCunN6YkOvxmMUJ+FnOUb/bu+FatiSCzSzYAHkULqBYYY=
X-Google-Smtp-Source: AGHT+IExv+tybR5ipnVHMChIozaD9HWg71HI9cTN6Q9laK+gRbql3sVz1wKjQhAcenueVqPKCCAWLw==
X-Received: by 2002:a5d:598c:0:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3997f9595f6mr2940009f8f.52.1742560207835;
        Fri, 21 Mar 2025 05:30:07 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3a10sm2231886f8f.28.2025.03.21.05.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 05:30:07 -0700 (PDT)
Date: Fri, 21 Mar 2025 13:30:05 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Hao Jia <jiahao1@lixiang.com>, Hao Jia <jiahao.kernel@gmail.com>, 
	akpm@linux-foundation.org, tj@kernel.org, corbet@lwn.net, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, muchun.song@linux.dev, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: vmscan: Split proactive reclaim statistics from
 direct reclaim statistics
Message-ID: <isr7mmozkvkj3e4zk55fx2lzkwjxjhl4ac2f45l75qnna3bntp@cfm6v7wkmpyc>
References: <20250318075833.90615-1-jiahao.kernel@gmail.com>
 <20250318075833.90615-2-jiahao.kernel@gmail.com>
 <qt73bnzu5k7ac4hnom7jwhsd3qsr7otwidu3ptalm66mbnw2kb@2uunju6q2ltn>
 <f62cb0c2-e2a4-e104-e573-97b179e3fd84@gmail.com>
 <unm54ivbukzxasmab7u5r5uyn7evvmsmfzsd7zytrdfrgbt6r3@vasumbhdlyhm>
 <b8c1a314-13ad-e610-31e4-fa931531aea9@gmail.com>
 <hvdw5o6trz5q533lgvqlyjgaskxfc7thc7oicdomovww4pn6fz@esy4zzuvkhf6>
 <3a7a14fb-2eb7-3580-30f8-9a8f1f62aad4@lixiang.com>
 <rxgfvctb5a5plo2o54uegyocmofdcxfxfwwjsn2lrgazdxxbnc@b4xdyfsuplwd>
 <20250319154428.GA1876369@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319154428.GA1876369@cmpxchg.org>

On Wed, Mar 19, 2025 at 11:44:28AM -0400, Johannes Weiner <hannes@cmpxchg.org> wrote:
> Can you clarify if you're proposing this as an addition or instead of
> the memory.stat items?

1) more precise info for given reclaim daemon
2) slight saving in the long list of memory stats (sorry, I must
   question new entries :-) to balance flushing[*])

I was originally motivated by 2) to propose the alternative but it is
not strong alone if 1) is unnecessary at the moment (and it seems the
blurring via aggregation is acceptable for the users), so let's consider
that idea a (potential) addition.

Michal

[*] You'd be right to argue that per-writer collection may not be more
    efficient in implementation.



> The proactive reclaimer data points provide a nice bit of nuance to
> this. They can easily be aggregated over many machines etc.

That could be collected from memory.reclaim too.

> A usecase for per-fd stats would be interesting to hear about, but I
> don't think they would be a suitable replacement for memory.stat data.

There could be reclaim daemons running at different levels of hierarchy,
the higher one would see effects of its operations only. Or differently
parametrized reclaimers (swappiness), each interested in their own
impact.
