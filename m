Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EDD211463
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 16:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742316195; cv=none; b=ETo2zNvva5TvpPjfHLJfTvHnqGShA4kuxilLxoMP3oCaoTeOzsFkqR3nLS7eYXdnw7c6ot66tkIDZK1lVU4Dj0VmVkoSubTnzHjsrv77BEbGzy2X4tiAkzzdgZoNqeGK+nhhYP774F4bi5JbChrE4r7tmrmu9Y6zvdtF0GqGu9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742316195; c=relaxed/simple;
	bh=EsbgIYtjbfNeElRzR6OisnRntRlhSoTM036q0hXfBZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/gUe0TKCoy42kLkUyF/BXtPvlOXdEur2IKxkMTAwK63msHhmWRY3Ekv1Lj0DqBecjb86gKqNWZ/vD+gYd6o0au426lmIf88MCzLA4039iX6do8VfjhdlAkPhDaQ/hoza/1RNqZN6PNJBQNU1V03Aj1VJDkX4W2nYogZ2fmSdio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=gowYnnJz; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="gowYnnJz"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476964b2c1dso38650731cf.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 09:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1742316192; x=1742920992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9CLAy0aRkMC+3t0gCpzgmh226XJDIlR7r1Y/Y+7ry4=;
        b=gowYnnJzXSONBI2Ig6zTHQe4j6yag4HBZr+QmqtGUtdQTGNtFMqajMKPAWMejUc8LW
         4OSH48gkxrc04bsnf1MOTenuMQgzYSAVKv+QliIwYxWfx4PLftuNlpMXWkh9Sn7jXJJ3
         orZEnhTVgDVCdah6u7KMUbMk3MKKGiMYRW+t1Dj8aQuaVRE7kJIWDpt56kIpLz369fLm
         JrUhWW4SNMC6t6wkL1RheLmN4A+DkO+8ubJVRWppTE0ArrN0JLUIfNQWKT+bnBTjC6h2
         xM/gjQveoeFS4KNHD+gkGID2tmtlH/RMY1UAQYTXkw9+ZWQ9X7vYe7Ie9M6Lft5bD9nA
         cGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742316192; x=1742920992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9CLAy0aRkMC+3t0gCpzgmh226XJDIlR7r1Y/Y+7ry4=;
        b=k1flo1iySFaGxJbaLZie9QoLGmCD+l9nNU/O+c/YZ33mOaQcyR65gVbVEEqDsa7KGu
         fZS55PT7GyV5JBngIExxSxGtBdDmYU+xqoVyDz1M8n2K97D1IWnujfS4GW5+JdvGLK5Z
         KV0poSFGazYOg4f0lTPpxUVD0rf8DAD9r2kO8TaZn3Owe1DxW7maSVzVaWJqH93ASwuQ
         d43D72pGllpkvn+TjCwH/d88Oau7tfWwTSKcUX5TLVjIupg92hAvDNHhvGu+/7ZfKMmK
         J9VdIYkbJh2Zf8vcBmmW8SPl1K3idZpUc4mlt8g/oNnjuTYE35FvUnWClmaVC/q4VnBQ
         P1fw==
X-Forwarded-Encrypted: i=1; AJvYcCVr9zQTuWlLmvc2uOQIbisMhEpx7Pgul84FHW3nS7uVVGiDtzak0tOnNSX/rORugQDqa8BzVdZfGTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkmTUMov/PYMobZBNnekMHVem3lnvrDhlXGwGXOb6yDGzyECBl
	aVM2ssa4utQe9iEbd33GuRmQ1w/I2CzMnnHLs8B2Qw3uzYPrN645SkFeAs5zfaw=
X-Gm-Gg: ASbGnctp6340ej5Lw3MQlt2Y9uocPeVkeNAcpt/bfMEnnt8HN9Xm3scYfnvIVqTZCpX
	HIqxiObZ5F+b9ftrjd27Il5OgRdCOvRD59ektihbfgOrbv/teeEW97yf8GUx7h1H2oPz5x2JgWV
	GgtGvyF4MMHRLHLEbLxR+RBBXxIPmSe2PiyvXUzeBYYlZMjLhiCIV6KQhtIXPGb6q3t7ebRd3Rf
	S++BsIupjrrWmJZY8aNKebNGROCoe8wkr7Y5YZh10OnIKhXykgWWa8xkyWXwrZlvlFXSww47mUf
	sqTiqFeN0gXGfdSUdmE7X6TEZ7PfBOAr49MhOYZ51kM=
X-Google-Smtp-Source: AGHT+IEzTYUQvFIqJGczT4BQNneYiwp+YHih+8M1aGN1FxBK+xc18mlXInT5tBAGDIgXKIv4Q5neOA==
X-Received: by 2002:ac8:5955:0:b0:476:7199:4da1 with SMTP id d75a77b69052e-476c81d94b1mr252892281cf.46.1742316192210;
        Tue, 18 Mar 2025 09:43:12 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-476bb7f3d0fsm69107731cf.59.2025.03.18.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 09:43:11 -0700 (PDT)
Date: Tue, 18 Mar 2025 12:43:10 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, corbet@lwn.net,
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, mkoutny@suse.com, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH 2/2] cgroup: docs: Add pswpin and pswpout items in cgroup
 v2 doc
Message-ID: <20250318164310.GB1867495@cmpxchg.org>
References: <20250318075833.90615-1-jiahao.kernel@gmail.com>
 <20250318075833.90615-3-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318075833.90615-3-jiahao.kernel@gmail.com>

On Tue, Mar 18, 2025 at 03:58:33PM +0800, Hao Jia wrote:
> From: Hao Jia <jiahao1@lixiang.com>
> 
> The commit 15ff4d409e1a ("mm/memcontrol: add per-memcg pgpgin/pswpin
> counter") introduced the pswpin and pswpout items in the memory.stat
> of cgroup v2. Therefore, update them accordingly in the cgroup-v2
> documentation.
> 
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
