Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81B82116E0
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 16:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742316169; cv=none; b=UYauqHlZvKaXO6ADXBh0+ymAz/W1PbuPbBLKG4OinSsc5BNVNA0jiCLfY0RBpCBu37rbfsgYSVfDjSraY2/7uLw9wifzcbVnctW8tagHYHy4fqyqFlTXpvax8jrgpB9Z0Zn032Rj5Ti7tvT/Nfk5/VQYb1jAIIpFI76ssy6osbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742316169; c=relaxed/simple;
	bh=LxSqXW2r5Vj9SoBZ1X29YQU2mvLmXT+ZtKFl/VWGIbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/MFbLO+Qi298Ak2SkS3MgFlQ/heofZv8jgVRXUyoQyXzoxHKVEcSfEKhy5JZKQ761nbSuYUwQr12xOe6bvkadZEfbYFt8VhZ0pnpMhKS7elMyTdLl1GW9J26LM1/e429b6PLKzQjU8cn8g94IuCNCxgGCGssTrqK+yYn53IJ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=RzSl3JxY; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="RzSl3JxY"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7be8f281714so635581785a.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 09:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1742316165; x=1742920965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eBlIzcdc3Xvtj4gWy5HkVWkPOVhbX//nFVlD6LG7nRg=;
        b=RzSl3JxY9QVCzS2d+7n4EGAjakIaDYpVi325CHm0Z2UgIGd73/a7/XxcfsQOAeskwn
         UpbNObZnObtm0pOeexuRFWlWcdxcVwawZBss7yV9Y7AyVb5S4PFH3ced5nRK3bd+ndtD
         ARqrc9f1U2kqqruCnq1TbYm77hcALiWwZA0aHre9gNmN2e8ZWrsB1SD2JRBK2Zu2AnT0
         8nDyMaEnh5LeTiLKdbvrZH52iVlSCc91CPgRLJbNi509NeTcdTDuF3TpXZtI+qM81/y3
         Tivn8WztPGeLxWVjJTR85Ros+PgJt1Z6CvXTVrlquS6PcH/wOzENI4Qx3ac+C4CsY8SY
         5NXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742316165; x=1742920965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBlIzcdc3Xvtj4gWy5HkVWkPOVhbX//nFVlD6LG7nRg=;
        b=h4BxyPwdaYFahw5Z1t/MYV15nivUOuhLJxKOkTrj2aN/taT4XXeUqFHQc70Odc/cnM
         4vAmOwZVBXkJ32dwqRLV+Dg7tiENEy6MIRryk63zxZrh4snuCek0eF7Bv6bshp/afpDW
         3PAiC+4VOJLshfTtGBAk6pgHLNDntS2cG+1Hqutu08t715Imt+e466pwF4AoBMHx1lcG
         KK2AAzss2XGQukezeQlC4nXMoxhAO9mMLPs8Mj7kRGXsS9mpv2Y65Kwd3+RnZOqJa5Xo
         tIvIcJPR02/etUARdwPnTCF47qbUDl0Od8LrW87K1h2P9mfXy9TtnAX02ZcgJLrFaP7P
         UvIw==
X-Forwarded-Encrypted: i=1; AJvYcCV87cGw/ijFVJo6+TS1FxlYIKnHMcor/tU6QbPkbrgN3urW0Nc8+BulzyQ2mpGkoFpVomB5ymU7n9o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq+99aXjb4X7jsH/RvqTW+aJvTF0yl1HcEn2eRQKHeTch5vhO2
	qUyC78Dd054xuCcPU0xJalhW7b2MOpkf/3NstIU6VsuD3x9k7P1RvmKYRHYtlAc=
X-Gm-Gg: ASbGnctpc83LLLx5AKoOk/6jKucrabWQPChtdBevLHMJoNFbfJXLKsmVD1RfjGbta8T
	lrfr8ix26OVkJh+I78hugOxfCn3dgWHl8tiGKAc9oeVX6ztmI/a/anfJnTCod6Nr4ckLlMKSqr5
	KCq7dscCt3CUSVvSmoYVGVNYCf9fuEdu0Km24AUYQqSs03jPAEoBadYEmX0z7VEf2AJ7rGTgyYl
	fSR/yjrNv84GeL4bjrbTSb7mcVkeYD2+T5v2FiclySSdOpK2Jx3aj2Xr0r3kosDKPAD9VYnbG24
	A5bpUBvuZvDhbL39KFdpV1NRZYLZi908+sOIZwYCz5M=
X-Google-Smtp-Source: AGHT+IHQoOR0qOOsCpgqnzO8d96clCzHf4jUqi9AdgrkMbiVXfp1OVSHWbWSZQV6YMtBF7w2NI4VDw==
X-Received: by 2002:a05:620a:28c2:b0:7c5:5fa0:4617 with SMTP id af79cd13be357-7c57c8c0489mr2647132085a.40.1742316165654;
        Tue, 18 Mar 2025 09:42:45 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c573c4f50fsm739505985a.12.2025.03.18.09.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 09:42:45 -0700 (PDT)
Date: Tue, 18 Mar 2025 12:42:43 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, corbet@lwn.net,
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, mkoutny@suse.com, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH 1/2] mm: vmscan: Split proactive reclaim statistics from
 direct reclaim statistics
Message-ID: <20250318164243.GA1867495@cmpxchg.org>
References: <20250318075833.90615-1-jiahao.kernel@gmail.com>
 <20250318075833.90615-2-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318075833.90615-2-jiahao.kernel@gmail.com>

On Tue, Mar 18, 2025 at 03:58:32PM +0800, Hao Jia wrote:
> From: Hao Jia <jiahao1@lixiang.com>
> 
> In proactive memory reclaim scenarios, it is necessary to
> accurately track proactive reclaim statistics to dynamically
> adjust the frequency and amount of memory being reclaimed
> proactively. Currently, proactive reclaim is included in
> direct reclaim statistics, which can make these
> direct reclaim statistics misleading.
> 
> Therefore, separate proactive reclaim memory from the
> direct reclaim counters by introducing new counters:
> pgsteal_proactive, pgdemote_proactive, and pgscan_proactive,
> to avoid confusion with direct reclaim.
> 
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>

This is indeed quite useful.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
