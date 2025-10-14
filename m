Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B4230DEC9
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 07:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426815; cv=none; b=NaW8yFvH/B9ni1jfswHLmBLEVcf//jiYz13eWQRvcUo5Gs4n2cS3pxcoIkAWJLPLB5MBQwxdpHa+H2G0CaH79oYH09txdn8S+7RFVLeXn9dXG0pfiII/RzpzzQkTlztacGRIMWFBYTO94NllP/3eAZiNdehR5J+0TpL1cMrxJmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426815; c=relaxed/simple;
	bh=69j+nJDGYxV0SqldgYPw5p2967aw/hJq9L3JovCxY0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZlf3ODziSLRuxN2hGT56N/COiOZjKMr1kajj+5m8JvsP72ZGkNU0hxZKLA+jhwZVL5wJuB5V2K+beTPDuV+DItBvvrGrhbt66y+5XxglV3EuRW4LSnDCpJQxNc1/RYQvVRe0Ug4KcrzxLjoIkv6S+QSIti6/acx9uIlYm2b1u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RMo/1SDz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RMo/1SDz"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-426edfffc66so353364f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 00:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760426810; x=1761031610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1p4OZlxOY+NxPP/FLfk1SUzbR8cdY55J35+/tdhphko=;
        b=RMo/1SDzLvQCfVz1ubtkj+ohMe7hxvHOkxQK6nAyb6COgPjkD+YNqx9dM03dUwjTkU
         yx28ueUbmimBbnQvk8WrrQlIOA5Xqyyf2+A864An/mwCHN5ZLcSpw5BEbQQi9Czyd5gf
         1Tk3vzIdIswd+R4zM+EWeQnGpw92IXFZs0qgyWF6ypEAJYTTAB8zdOGffBYFEPgKhmvV
         LTlcAM7Mc1IHjS6uwMUd64V6H06feAgvT6mmqdoU9paF++Ue3FGdgZdTPayi9dR7GHrk
         7YJlVSxmDx+MQT7N8UA1ArcoSCqtljlRoEr9WURCfpvb1d0LSmoXdryjqeyNjhrE4nUx
         sxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760426810; x=1761031610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1p4OZlxOY+NxPP/FLfk1SUzbR8cdY55J35+/tdhphko=;
        b=ZC+4ZbffFo0fSV7ZkEa+oEmncj809ESZx8hO25lX8i3Ey240om7O8M6ERVjWEm4CIj
         VOo7/Gho4mGEy2m9a5PeqS7JxMoXj2dQoYbtr2XufRQZxwsLie8JMwuYz37M0XFfVXsx
         Bf0tT1ZsuabHDG1OHVql+sLx9HT/Jnp1IAuOmgXggZr3ZBcvZqR/l8riXMDUJkiesAFm
         ZpJehFDVa9jzAcEw75iTRTWMZla0/bJ8YRtn1Hhyo4qy23spT3FkG5T1/nVM/aoOAzMC
         OhizUE/XxkBppWO7ioK2nnE59ER0uh9AdKgGm04ZoLOKEOyVSXa8IMde7YVwzxgqaQ/b
         g6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm/c+hI0u0+B5hXMjBCucBuBcdkaJEy2OkfWkQez5O2SIlYZ9WSSFwbThLMyQ1C5y33G9iS0TgHKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRv6eFj8kFtIECGEHdHq692u1F/iBjRyPEhmcVFoUiVMjFDrOj
	h1oLG6Ji90EvdzPqaStFWz2Yjxu70uygb0t4eeyQK8/1AM5gdAM1hcoryqrwWnAdWkw=
X-Gm-Gg: ASbGncu6zzP8f/RvmstH/mxTPmALuZzFhvS+iVd5y3jwJNTGXL+CPX+d/IUulXwu8h3
	uKZbozLZ8K/34Lci0r56E4vLrGrREt2avcSQGjvqm+OaG+LAsGT0zdfAEGolvSYjxIAz9ZgwS51
	LdVJBGeyp8WP5TiY74fltc100FcthaYraqw4gTxiSMf3rsvSuunwGtSZMpIFo8KvUQraNc4knfH
	ovkOR/4zaKJ5B3/Bx7e0/bGPQfRNy2o3mNRvVT4Z80AU/7SDX7Vs/4Zml7fSkUQ5bHrOxRzqQPq
	2keEr7wHWWE0zkBhQs4eBQHWW4O1XIPw5BoltiguwcsALojAKQegn43LiZjvBG0Ebb2FCM3C5FZ
	ajRtuQAfHruWlmKrjOggR6R+PDtbQ8njGU0TYEVg66qSBpD83p3DBo6wuN4ImnRt7X0VwtHjWBw
	==
X-Google-Smtp-Source: AGHT+IG56u1B06cKrDgh7gziHnjqzu34szt4cpp5w6eBKrKwAL5+ACYASwYe1mymtdVAayUoB54vVg==
X-Received: by 2002:a05:6000:288f:b0:425:58d0:483a with SMTP id ffacd0b85a97d-425829a5a12mr19773929f8f.3.1760426810474;
        Tue, 14 Oct 2025 00:26:50 -0700 (PDT)
Received: from localhost (109-81-16-57.rct.o2.cz. [109.81.16.57])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb55ac08dsm217399135e9.13.2025.10.14.00.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 00:26:50 -0700 (PDT)
Date: Tue, 14 Oct 2025 09:26:49 +0200
From: Michal Hocko <mhocko@suse.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Barry Song <21cnbao@gmail.com>, netdev@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Yunsheng Lin <linyunsheng@huawei.com>,
	Huacai Zhou <zhouhuacai@oppo.com>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: [RFC PATCH] mm: net: disable kswapd for high-order network
 buffer allocation
Message-ID: <aO37Od0VxOGmWCjm@tiehlicka>
References: <20251013101636.69220-1-21cnbao@gmail.com>
 <927bcdf7-1283-4ddd-bd5e-d2e399b26f7d@suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <927bcdf7-1283-4ddd-bd5e-d2e399b26f7d@suse.cz>

On Mon 13-10-25 20:30:13, Vlastimil Babka wrote:
> On 10/13/25 12:16, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
[...]
> I wonder if we should either:
> 
> 1) sacrifice a new __GFP flag specifically for "!allow_spin" case to
> determine it precisely.

As said in other reply I do not think this is a good fit for this
specific case as it is all or nothing approach. Soon enough we discover
that "no effort to reclaim/compact" hurts other usecases. So I do not
think we need a dedicated flag for this specific case. We need a way to
tell kswapd/kcompactd how much to try instead.
-- 
Michal Hocko
SUSE Labs
