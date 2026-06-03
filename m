Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609C8383C65
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 14:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498561; cv=none; b=cDty/tSemdm3nRqlv7IljPuRmuefBoW2Y7JAyEZdTEj3t+i+JPVCLCmIS5L5x4vWbNSwGgTzIYZ4QAHJzn4MEik47cvny8ykchY+QDGSFdhJmx2061qldq2YMIkxPQgOCy/R9gQvStYTJCau8oKnZdMlodslFU4cRvIw6y1pkpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498561; c=relaxed/simple;
	bh=ltM7pnum/igCM5uUZt64GOi7slHu/TZArC1BZKPoiLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxUkEOd/4LQ6T7xm4kSEUy6m8Mvpaprbv6jnJcyY179F6Y12yVZa8H/7OjiCQ9xSndjd+IQ952S5D0WEKDtg3/2BDyXjTv0WvnvjwgebswkwHu9ZybfER0uZiCbsMAn4Ze2hzhStHkCZsG9g5tNTA9v5TajyITqn8QzKMFINY58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=FdAkUI95; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="FdAkUI95"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-96393ce9a8aso3931113241.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 07:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1780498557; x=1781103357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tHFJL4Vv9YiBmui2bXAlE3Jf5dI3wvXhQmEI6tHCSqU=;
        b=FdAkUI95DhhH7vBg+7hAnFK59oMoY7ru62U6nlTahspdxgzrOG61TXdYKhn/XfbX0F
         vvDJFOyCODn5AhArOl+/2BmyoDjuDwCgo3oh27Tlgi0CmeqG0VL0kzJGvtfEbEpjdzJL
         xcNqCd3jIOBxVeyaCqqgEkLGc76Q34c8jJm+5zOXVfiLEmGFoxyuHMDNsh1L1zlk83pL
         IkmB7HPUyZPWz6X8uB8PM0YCRtXjLxWa3/EWAOQcsjhvCaO6LPfzXLPXBnLWy3EELoAl
         7LxiAS9AY5oXc/JPyOuKtB0wKShATbmVS9+5v5uLhRWnf01mDx2uaXUaMHbq1LQt/QtV
         XAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498557; x=1781103357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHFJL4Vv9YiBmui2bXAlE3Jf5dI3wvXhQmEI6tHCSqU=;
        b=Og/6y1sJ3QXLV0e+FzcSyV6kBKG+8lSrveBJ42Dxn9Sw0sxhSoOem8x0/QUNpX860+
         SNUXS/LZZNJt1mcB1WP18JoAmfz947oCSpCT78FIpSiEXV8u7YAUn5fDtYHvfP229Q09
         UVzdMnowZFwCKLhncafsXYTWWHUBJmUjD6Q5ZaP/e3V3eViM/YRk8szfWghnA8fDl0vK
         opDSlsWsOr0f+m75o7Q6Qd9le0J5bfUEoa3JStXgpYpTSTM7YC4s2wfIM/GpJDfPjpQ6
         omLy5gXIpMhsayk4tle6BRAkRXoCJdIBzRJX9BG/Zd8dkkgJ+qHPJpvc+zh6vRG6GzF7
         XHcw==
X-Forwarded-Encrypted: i=1; AFNElJ+csrbhKOmlZ6tao4eUABmqV6X+xhKZmUf51wdDeqeIkIDuT+63Z0i8HTncTn1ZC8H9TP67Iah+1pE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKPyFiSopcMJ0wtVPWaI1PDfMWyGjcjPTXl+aPiVxuuo0Dwu4f
	rMHoR1RZ1FdwZ13Jvp3eu3Y1fzIY+0YrIxGFB30WnJmGi1Ls16SQ0viKpxZWvJOJtiw=
X-Gm-Gg: Acq92OGIaZOR+zH5EMq4hCLqPL0TXFJA0Xa79vqKSxi4rXusoZBe1S8sma70HnycPbW
	HOoiaxIPW3VpZj+bRsI3/6lRUzvHN512lEBFAjQS9f55QwNjrrUY28Zq3J8IO0seF5BVHuabwdZ
	6aO8iyNQbOR4QXaq2w6wcLN+X5Ztjmz+1QKkxASFHQA45Vq3nVqdEUT6Sltj360araxkT4VUd50
	BW+HT9n+S8tMyieLqFPCgeFNbFLxonUC7KZID+qvihELKZNm964JaMDJYqXRIOGjOlhvw6NJzaY
	SWXAGEVlmzxGReLjaZ+vfiB48ajPBvekQESL57OL5Tl/yFAaMUQnt8W1VPamhO6cf2w2XGpCcbl
	1ilkySTMJcNPmYQ0EfcJvYdi12V9CcwzD8c9ZSrvJ6ffG23Yig6100nrwO0+nrhf4i07ozYcMww
	x0AkJw221QNILKn/LNhW43zG9w1iDgN1CR
X-Received: by 2002:a05:6102:c06:b0:650:967f:fb32 with SMTP id ada2fe7eead31-6ec2978d496mr2278212137.3.1780498557198;
        Wed, 03 Jun 2026 07:55:57 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd06b231sm22007136d6.33.2026.06.03.07.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:55:56 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:55:55 -0400
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
Subject: Re: [PATCH v4 1/3] mm/swap: colocate page-cluster sysctl with swap
 readahead
Message-ID: <aiBAe1WQWnuGzniz@cmpxchg.org>
References: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-0-ce0219e100d9@gmail.com>
 <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-1-ce0219e100d9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-1-ce0219e100d9@gmail.com>

On Wed, Jun 03, 2026 at 09:05:32PM +0800, Jianyue Wu wrote:
> page_cluster and the vm.page-cluster sysctl are only used by swap-in
> readahead in swap_state.c. Move them out of swap.c together with
> swap_readahead_setup(), and make page_cluster static to that file.
> 
> Rename swap_setup() while moving it as well. The helper is internal to
> MM and now only sets up swap readahead defaults and its sysctl hook, so
> the more specific name matches its reduced scope.
> 
> swap_setup() previously lived in mm/swap.c, which is built
> unconditionally, so the vm.page-cluster sysctl was registered also on
> CONFIG_SWAP=n kernels. swap_readahead_setup() is now a no-op stub when
> CONFIG_SWAP is disabled, so vm.page-cluster is no longer registered
> there. The knob only tunes swap-in readahead and had no effect without
> swap.
> 
> Suggested-by: Baoquan He <bhe@redhat.com>
> Suggested-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>

Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
