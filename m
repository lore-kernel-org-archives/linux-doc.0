Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1693CCFCA
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498818; cv=none; b=jGteD9sO92vrjpOlr78P249mD5kUbXEFXPsUB3SwCbr3rbqV7KQAIJtWbbA3LCANG+Mc//DeS/ozGwBi/0Si4qv3gf69ccZfQohnI517O+93cridBa/fkGMp57XBZO/smRpY3d+lDf3hdecGBKF7xn+9NQS2jnAcm1U03bIRuJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498818; c=relaxed/simple;
	bh=7avvJD037Pje5iEie+6YD1lXux4Fq1431pfDto1ugbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlT0zSXye/Xv01H54bD2zw4+rua5JU3Kj6iPKksNfazFxC4IHRlxquJP20y8fza0CJMOIEfPSVORqzDad1rv3enWkN5cRyIwdWmOiyhWlDb3bTXdpRrjTjs2DdoV/7afqJ7k59TToxygIPQyKUP+YdQ61nN3ebtIl9QKNsD5H0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=PGuxVJr/; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="PGuxVJr/"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8ce9df48e1bso36547186d6.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1780498816; x=1781103616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nvMHfiHYUP99FrIyQrPKXSaUDFV16/XdU6uT2nwNWZ0=;
        b=PGuxVJr/46eKO+QVvALARSwS0lriGwrPr/PIJN5wUud9RHcGodbi4ghbxd0y4bQvGS
         9tSQoI+21ICMDzMq/xlg7OxeszPJ60SIqZ79QVBwItPgKOaAGgcdljiQCDKqqcyq3Tdg
         XWwmyW4YczgssYkN3rO1A/c8UYwwGAPz4EiNRMABt6i4/0uqcxYGBOVyRUSt0jfYFesE
         2pEzSVWTDo5c5Ob3AqNfrH029D6vJIJMp+vH0aL6DUAVvkcbPiNbGx/iwQnVu1neFuyq
         dhy0+96a15jLQxDUs3e66JdItmht0olYC2ZpIsu7xBGi2cevs+p/4UH5AxO+E7t1/BNu
         PP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498816; x=1781103616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvMHfiHYUP99FrIyQrPKXSaUDFV16/XdU6uT2nwNWZ0=;
        b=PneULibaKB40jse+8v6PWow2g57uaQldXCRTrWOovAPghKz7huIaoWdpEhLjz/66x7
         ff3ORvE8hdAMVRNifegVd55t55hUCEL4a+QvpVfmKyoLiyvleI4ojjRSj2CKLsVCEKyB
         WBOqxOO6o0an2xwOu+edVUYitbThJgNm/Yz+Ip3HqXVsNCIkTs1tlUGiQn+MqhZFjhUq
         uf9XbN1bNPa80zngwIekDrz5aSe0aL6j91lNWcHqHI/QwbFey1+rqVQyAUkLlahc2VHs
         fyreWqC4zBiB6DWCnqgYnsKHS+KqMoBj4xlaxE/NvrID9WbCz5G10awuSATVgfregFD6
         pFGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VVSkovvi+md/vpap9PJUsnHHTpV5r+BI5n/tPoSD0iwdJ0g9e8xD4g/josBgm4uGNtQNKxbXe1+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPnjjIMICsxwZoktAeyQhIx4+wYuMOuUJVpmnoThn35jLWRy2R
	uvh57UoTnFMClcpu9B9XzeUKwehC4bMqF/GLc4q2ns1AmdWtaxSotTQSKoohMdAaz1o=
X-Gm-Gg: Acq92OF7EPHtWmIjsGM80IkK2KpB0Vbm6YBkMTT/cBwKVQ9Rx74SMpzFoAUAnMUhJpO
	jCU8NyaR2XyypD18ODphdm25NAsMzSJtZQWWqOSkUf0+7E7Tx+zLc7Srw+HjoavmZCvyTis5aCc
	oi1ebLOIfTU1dWGFwe2jbp40YkfHHA2qRoafv4IZPA0zPPJzMLvD3nHHWqruMmnBnzOI99p0ItH
	tNC76oGHfJK58YlVGQTLbiuOKWov7p4ovnGXqE4dC2ZjzJcS5KEy5Lc8cjI73bnZdPhoQf7RfFE
	7ZXWqTWXFH/IewiMeuPCE/XDEvURMK2ftR4RCgY9sJkrz67ItFXD/Nytb0BDGBe+ASouIJqyZQ/
	mxslsxTF/OU1guWKrMqsafbNM171jnctlD7u7+nzMvq1Q58/nxWzCDguClpGqKPURRwLE2JHLhO
	LpZVLKz3vC2krMNCAy2oxJ5YHp9joCk93k3EhAa3MB8fw=
X-Received: by 2002:a0c:ec03:0:b0:8ca:1cee:7c5a with SMTP id 6a1803df08f44-8cecdc329ccmr45124016d6.12.1780498815694;
        Wed, 03 Jun 2026 08:00:15 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecc8222bcsm22979756d6.0.2026.06.03.08.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:00:15 -0700 (PDT)
Date: Wed, 3 Jun 2026 11:00:14 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] mm: move reclaim-internal declarations out of
 swap.h
Message-ID: <aiBBfh_lR2AUHidk@cmpxchg.org>
References: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-0-ce0219e100d9@gmail.com>
 <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-3-ce0219e100d9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-3-ce0219e100d9@gmail.com>

On Wed, Jun 03, 2026 at 09:05:34PM +0800, Jianyue Wu wrote:
> Keep include/linux/swap.h focused on swap-facing interfaces by moving
> MM-internal reclaim and workingset declarations into mm/internal.h.
> 
> Leave the small set of LRU helper declarations that are used outside mm/
> in swap.h so this cleanup does not need a new public header under
> include/linux/.
> 
> Suggested-by: Barry Song <baohua@kernel.org>
> Suggested-by: Baoquan He <bhe@redhat.com>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>

Nice cleanup, LGTM.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
