Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539E232C92D
	for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 21:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765833482; cv=none; b=J5Co/JIlaO+aLt2wUi1l8teJ3uMuv+z5HK2mL/+J86MakY46Qu8iJgEfHl7IvXPD3AaW59SoYeb8gNXAlosJBVSbhHw+kRb8Ho9Qom7iQvsO4Yn1ySAhuuxShzEGm+0mXztqoG+gBsyb9yzZY2KzpSwSDvR7J/w3HZbDnCGu2nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765833482; c=relaxed/simple;
	bh=CKH+FAAjzoon1OSofCyCce54ZroGwUuCKRL8FMDMFd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmG0elMyqQBhQsUa2QpDvUBuhbJMpxtBv7jo4QXDzD0mSiDHizbR0X5a5IWAUjbIPg8aXBqNcRE9M6axdWv8JILhvMmn9uhZGgygmAQJNsD8qoCTUiH6cipkkijywYEI9/X2tPW00Z0RCezU0MRhYv81gnn32wYZ+8vBQxqRYjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=l25U/l6x; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="l25U/l6x"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88888d80590so12082256d6.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 13:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1765833477; x=1766438277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rQYOTwdjJwYgvuX1nPstCicu4NCv26qFYc5XYhTLu6s=;
        b=l25U/l6xkMdk4avz9x8Qm1HZan+6tmYV9fzTGwToDT7VvTcukRzfL3RR3T3ugQxaWN
         UqBDHXZJpUetn5jyw7oVH1PA5z5xQILInTO6UTFpjXkbUecCC0IJNYM1tzrVXYmQZkMT
         UWsPoHaizF3jjNtYR8yQ8N/ktY7TYQI7VuJEnd8do1jutD6/dvB0xFPLAdukgfSAxwlu
         kF5uY/feeddLCy0nSniBEn2szppCC0+9/qde7ugCzERFX9AtJEEaI6C8s2lVPj1aAEK4
         /htm1tx4FT9aNhby7COhA0DZLz/tFTcMv/j0XjBcTvuJu9O95sBHAEMBWVwlbJ6E8IlF
         G4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765833477; x=1766438277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQYOTwdjJwYgvuX1nPstCicu4NCv26qFYc5XYhTLu6s=;
        b=kKE2r7DNtx++xbApADoMLn3rxkYC1wla5HfswemPpX7f9T4KSvN18vXuWe0emcZBeY
         pZK6cgZ43AclTVh7Gi0IUxSUOZpLFr6l3vn7wFssKYXCpaULD0VcF/1OZ8TDCAZ+THBC
         Zg3I7bGFdOQE8R2sdpT6cFS6uwDACvORKbLDFgxv8PgE7kITg5+WBtBUOM3wEjP4fLWD
         /rQTtYYunD9bVIwQrPYOJIMX8/w+rYaITpX/CT3tnENHJm4QySYiH92TWyblaVLEIfPT
         SlREs1MQlw0Ts5JSbAOMNOHn4OSbuQzyqI8mP9Kytg1gpB6ZgjDwkdb5SxhqKzcHjgVC
         3CXw==
X-Forwarded-Encrypted: i=1; AJvYcCVQCjivlHrHbO6PrfjDkuTUkgD5sFcQfciJdUN1j3foCX/7+oFR44vULYHxZt/Glx0yHYjsmpAHm7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjLWVsKI8VI1HTanqi/bGlFUAomwDKBS/8LUN8Y7VKP5JoeZse
	wDM1Vk9Iyv5q9PGxoa8d2noxmhiXLpnTbDK9agSAx1Zhjoj70oPjkhCLjncIEJdopsM=
X-Gm-Gg: AY/fxX7xGx8c96uzHdTXD0IaW5gJ9EBij7IWmdYMVSdWLv3hWarBAVT8HDHXilFZwp1
	jZVootn4qgTBgWPYuUm63a9kmFRApi5ogOy2lgBWdxb9SAWOum1AB0JSrQGEmzl9AwGl7X5xtG2
	eRtYxOTmtLPpDchFq7LXIDkOFv1raChBM4XXLOb5L8p8nXE8TZUQcnjn1iCrjQbUtEvHFGVwjKH
	N6k3nWYaF352rdYUQceDQLHoPZWkNsuU3BSlgyKTDbLxkrKUgWy4lW32JkHbnvXMyyFKu9LYeAl
	LmDbfUPH8AtAsspEJsKr9t1t0NJKUc55l8C8B2mfAfHUUp44ZZOI9veWL/zjjE1+Z+2+vEvu/hL
	hjUhJKBh69WAxVdmfFq84rSy5yiBX9CLurr0NgdK80GzCaQkur/6HrkYA38+Xi+2n/FORizs96B
	Dh7gmafo7x6g==
X-Google-Smtp-Source: AGHT+IExtT3C2ce1bnbMtFFEc4vbTu4xnrtsiKWUFgckjaMMD6DyYbjwCUrjL+1tWyqf3FThMCPBWg==
X-Received: by 2002:a05:622a:4109:b0:4ee:2420:4f7a with SMTP id d75a77b69052e-4f1d047a1aamr167228381cf.2.1765833477067;
        Mon, 15 Dec 2025 13:17:57 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:929a:4aff:fe16:c778])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f345c2e0ecsm2877711cf.19.2025.12.15.13.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 13:17:55 -0800 (PST)
Date: Mon, 15 Dec 2025 16:17:54 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, yuanchu@google.com,
	weixugc@google.com, david@kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, zhengqi.arch@bytedance.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	lujialin4@huawei.com, zhongjinji@honor.com
Subject: Re: [PATCH -next 4/5] mm/mglru: combine shrink_many into
 shrink_node_memcgs
Message-ID: <20251215211754.GG905277@cmpxchg.org>
References: <20251209012557.1949239-1-chenridong@huaweicloud.com>
 <20251209012557.1949239-5-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209012557.1949239-5-chenridong@huaweicloud.com>

On Tue, Dec 09, 2025 at 01:25:56AM +0000, Chen Ridong wrote:
> @@ -5822,6 +5779,12 @@ static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
>  
>  		shrink_one(lruvec, sc);
>  
> +		if (should_abort_scan(lruvec, sc)) {

Can you please rename this and add the jump label check?

		if (lru_gen_enabled() && lru_gen_should_abort_scan())

The majority of the checks in there already happen inside
shrink_node_memcgs() itself. Factoring those out is probably better in
another patch, but no need to burden classic LRU in the meantime.
