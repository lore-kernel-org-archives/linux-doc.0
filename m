Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349907DA9C
	for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 02:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750301143; cv=none; b=aj+I3/2rJ/4DiRcSu+XnfJ38+rSEot940aIUmkcpiz6BAWrEGdma4sb4DUkjDo99zgOngfinIPB2EmfodYpboa9Gs3kl0VmD1muqj+A7PXJSZ/CH5uwq5cbnEv0AATkPhfxv07HxqH0IBP4wQHmk9uMvOtNAjUO0Azhml17y2sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750301143; c=relaxed/simple;
	bh=yN5IRTf2bp0DFPhQIni3wnaPsQ3d+S++8/d0mRCJUJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAHtDrT/BAxLxuethEf6FZ+Vw/kEQFm+fEQ6oKV2XR7TWVFb7nL5wBqwf9xnbQRTwgpnEPg4GnsklAZvaXZ0c8pFyQ4PIvOgzyskefEMZM0GmTYZN9FlozQNtQkL/xBl/5HZT8YqNGy7nNMexQHD5rmI/o+HNBfu8NPFm9LTyjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Su0j/k3L; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Su0j/k3L"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b31cd61b2a9so235512a12.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 19:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750301141; x=1750905941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qVwsh/DCfF7Xz7iwx0RMWfoA+1QEfSvNmteXgwq8Uto=;
        b=Su0j/k3LLmd1VlxZSHNKn5kSjdNSMFD8W1+TZtg+83M9lKwHCnkh1uVSLjdOlGEp4g
         i2VD4Ii0o3P3JPMXvIGuTc3T5nrRyd9JvRFiXYtDxbhJeTcHdcbTJiCXW/vjlIgnuM2t
         +MwFI3iKpLApzgx6qcqdaWFCR1/eAPPKqBVUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750301141; x=1750905941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVwsh/DCfF7Xz7iwx0RMWfoA+1QEfSvNmteXgwq8Uto=;
        b=GXoHC9IctKRPq7UYIlKpyHjD4n4V2TYL+P/qTJEBkHQUMqm39OeQ2h3fxShp8xAifu
         nkAb8XcYpA1E3uaU4Bj4Tbn5ldULdgeokn8KPpSY0E7AXQpk3HRxZIRtX77zwFX54znY
         XlTr5lDlaj1SwhPxZK9u72t62OxS7JttasHwgKlexxp6yziOkX6uQlP84sXsU+e5O3q7
         SmAOD4g9gVvDHntkmNL9oFepQY7lWjbc+Pip96FpiQ663UiuB8nrLPiQrjV9HnQeM0m0
         zK12B9w2IHyn9wiIZFY1ADWH9C9LIowAIJWxF68Fy9thiLJJWOlQVMK7GtN152vZkbQz
         rs/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVaO9OaR2mcUdWdX4qTRqpLh24vw/pdjADHkaBKIq04dtXFpK9lZlh5IPSTi0krNYvXPeyo5DcBFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFpA1IN/av7j+m78jcFAM/9pE1hVL2rQqF3Y1IpQlc2Ca70JH0
	Ik+aj3HnEh5ym3YnS3evou1rJtDwXatgvGzFJRYvqbf5sfeJGAcExnvxHkEcr+ZrFA==
X-Gm-Gg: ASbGnctzc+h+TN+166e9DyrAB+S8DyIpS44Mv+Xxu0Se5EX2NBVlduK5/rhzapy0T83
	L7uaKxP8sMq0fOK2nuHYqHP7Dn3Iah6k+45MbAzYRTyL45qONXjBcmPbEIMUebmUs341zEy3g6C
	SW3yJWd/O870DthaTrP9wo+8yfW7Gy86FpHK1aEVT4a5OMSVAMKZZs74pj+x6BKcREKjkrm7/g8
	2As4pgY4EW05epp1lm+iLLswWi9hahfflO8GgWDeWsTV8vAoLPLCzce+346VoObul6mf13iBBnx
	0SKnxcI67ASxerpyZ2iwIbyldGO89+ytm7GJ2xRlnfpHD4C3ze3L8XGuutmg5cdXUw==
X-Google-Smtp-Source: AGHT+IEIhSKyAh/a5UXDnIfIZx40q+8DWj3yxUrqA8zj6603W5pJSAuRQjAc6FIffxONFpmzBXMSlQ==
X-Received: by 2002:a17:902:e747:b0:234:d292:be8f with SMTP id d9443c01a7336-2366b32e55bmr310856115ad.1.1750301141373;
        Wed, 18 Jun 2025 19:45:41 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:7cb6:ce70:9b77:ed3b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a226ddcsm876010a91.1.2025.06.18.19.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 19:45:41 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:45:29 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH RFC 06/29] mm/zsmalloc: make PageZsmalloc() sticky
Message-ID: <5qkfuuar3csonfv3a6nj5ikl3ghebqassnnfw24xj7rjwx77fg@cglr2plhwvfs>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-7-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618174014.1168640-7-david@redhat.com>

On (25/06/18 19:39), David Hildenbrand wrote:
> Let the buddy handle clearing the type.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

FWIW,
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
