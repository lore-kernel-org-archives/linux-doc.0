Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811C6339719
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 14:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498759; cv=none; b=TJbGoDrcVvbno4bFpNGfpvzFWD8Z4q4xxNGkf4P1M34KlxXKO8tNSOCk4k2Y0ErDXn4xXhFIi9sRLVM4U3MqvYIAKH2LeqLPoRLhQ5YmdDEVQVIma21MpSQFg3OQcqm2AwIFXtWGJP+BxLJYwbdi40U8RL8TQddts9fQUNKrc0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498759; c=relaxed/simple;
	bh=nBnLoop9a9FofYc3NDCMzbtD0+UGW1YBKEfXXrYohLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CONz75zjB8Zie7o1yAl0GAXFs5EX0Q70CU6qT+gZKlCL7thkrx0SXWG0qLTOqVWHNaSvFcmiqVO/okrYl8kIvjNNIFLZpuNtRGH3AHjB1jCGXcLIsBZ+zhp3QRQBNSGznk/7tJHBtn66ljnjfSNNjWfhMqQADdPa+PINHE0vN5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=cX6Qzvu6; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="cX6Qzvu6"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-96395a59ff6so1987076241.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 07:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1780498756; x=1781103556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8SQNydbT+nEO5+Q1vmeflzQPE43wUdjeoQe0VdYFo68=;
        b=cX6Qzvu6RA4EYISXv6yGUeLSQTuaU6zj3fX9QgL6uziw/sSGFgForkvMR5DI2UBO7I
         9ieiPCipW6c6nufSTiXBbW95nNW5N7cW8vmuV3LbX7rjuGQlRNtsbLhQRrJSlMxDk86C
         K7B5PkhuJChQ2xF19cpa7i/hWF+Zh3CbicaXGvLp0Mtv8CfexBo1NRev2BneodRI1CSM
         cigghCJ0mo70rKLOp8NmKTuNLxE2+sNka6nOKIAr74vXoYoFJxdV5AhiJUcWvqtx2Cfs
         IbQzs8NJwnmPtvmHQXACxcIgOlGQMYdojsDBo39RpFnbab5Fyten6tYduc/bQ4su/aZo
         8rEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498756; x=1781103556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SQNydbT+nEO5+Q1vmeflzQPE43wUdjeoQe0VdYFo68=;
        b=pPVmnVAKIZRJZUckjqLXYUgeQTWob70+3yCllf0oDsv6Y1d9NSHzYu+vwoAEJj1Zpi
         UKgpflH3xGel6ExrvzmuMbPvKamwqtxrzfL+Iqmi+4LUanzEiF2FQDDUYzdy4uuKp1st
         V3cxpYilpiVe27IAZZ8fPkQA+ioPv2Qsqm0UUcVYH0Uhy4CT77Z4W6KE5BYDxfa19ATm
         awCiI3Cz8DkdAXVV9mQZYBr8QbIPJ9MRrfRJ7r+I+y3JE9N7eM5ZqpQBYGjvuGoBGQ17
         2XzpQ0TfgPvQZNApCbH4I1g6tOKEJ+X8p8YuIVvlkiNINkEgA/YZNZfKVCbW3Jwtu6Ls
         0Qrg==
X-Forwarded-Encrypted: i=1; AFNElJ950YC5zx5p5YhfUGJYJUZojc3BJLUNgic0MEOMA88t99GktdSrJREVR6O7lg0WsK25d7suAHPqatc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZBi9vssK0bDx9aJmOixXX+Xot7rudsI1gHsegX3B/N0Q9YGZK
	1QKUexqcUag9yVrJBPv4+uZ2SgrAwPWnD8Saw8i5AxXlri6H+kB8T3/eGBzyG47kQ7Y=
X-Gm-Gg: Acq92OFlOzP5glJIJzMDC51M/s9wevMWHZxnXqTbaCkVLSSt7d2UAdaBZSET6PPT2pR
	MuL2XnMEH5SjYrvQgZpIWhfY8r7kRvRg9+E5yvQTfyIp4n3YZcOTU2j6YCOHjo7wX8hS2YgYTAX
	t3X4DBUe0jA7OCJhcXjXy5mJt2Mzxx/PgtiwiewdaiZVz6kc2718/zQOdPjH4GkOLIvdBfu746B
	N4tySpjl5QqQPPNniLXVMmTmyMm7GiRmFKj1ryYmfmcMM6I8i7Tc/7hm2k8VlF85/H5SiCYxH9Z
	xI8KyOD/1OJIlAjvsNzDZFRXZHI5IY63yUOh80pc0bigF6bceSOoZCCv5oxDUQw3KYoYCFX8cCC
	YIAR1yW53cDH+Pdds97h9ebc94sKwDKv7b48XDnfGNa6YMzr9rRRuexxNO747xv6/XemEbj9Ymg
	tgyUYcCmx4VZIDjEjxGR9V4Ja3dsofCZwF
X-Received: by 2002:a05:6102:8027:b0:633:75d3:3545 with SMTP id ada2fe7eead31-6ec4c6a8669mr2031336137.30.1780498756426;
        Wed, 03 Jun 2026 07:59:16 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd277070sm21553296d6.48.2026.06.03.07.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:59:15 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:59:15 -0400
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
Subject: Re: [PATCH v4 2/3] mm: rename swap.c to folio_lru.c
Message-ID: <aiBBQwwbzBxlGelY@cmpxchg.org>
References: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-0-ce0219e100d9@gmail.com>
 <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-2-ce0219e100d9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-2-ce0219e100d9@gmail.com>

On Wed, Jun 03, 2026 at 09:05:33PM +0800, Jianyue Wu wrote:
> Rename mm/swap.c to mm/folio_lru.c so the filename better matches
> the code's main responsibility.
> 
> This keeps the implementation split from swap-specific code without
> changing the published LRU helper interfaces.
> 
> Update MAINTAINERS and the remaining mm/swap.c documentation references
> after the rename.
> 
> Suggested-by: Baoquan He <bhe@redhat.com>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
