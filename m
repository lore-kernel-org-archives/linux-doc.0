Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4F3298CB2
	for <linux-doc@vger.kernel.org>; Thu,  3 Jul 2025 07:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528992; cv=none; b=FlHiAVAua6ONso/pAizzW4XZKAgIq51u8halvu39QPufgrAzAwrtjOE7kmHs5vG0s4OZemghw7ursQ/33Vt4lL8P5AB+k0Nme9V0hW9RPxPpbdVBK3QcF3khNalHwqHMdLPiChE2MDBQbTT6y+DSbohuEJvIIOEkt9zFUsIeJL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528992; c=relaxed/simple;
	bh=4rdlP0nTwM1j9GZkgPlLuvN9K1I59CDnggPz0pqAh0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfupSitd7WXNYu+hkWmiBFDgygTgJjUWPz03JPKgKbZRLSh3IJ7RRapFXBzWC3tJAVlZ5g8yYDLpOHqRUBqByfD8R3V3XxXFfAzb38CRkmE9bgwRIYfBSY4DHXE0SmITJseBC1xh+il3pTiJNVHdCT4xV1YSObDjHg05nKsxxRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n08t/Lvf; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n08t/Lvf"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22c33677183so67417405ad.2
        for <linux-doc@vger.kernel.org>; Thu, 03 Jul 2025 00:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751528990; x=1752133790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4rdlP0nTwM1j9GZkgPlLuvN9K1I59CDnggPz0pqAh0M=;
        b=n08t/Lvfv2WhR7LxjAJxVsxIyRdG42BvaAiRd4ThuxSPdWQ0ZegHrwuXh0TvsG5nlP
         9JdzLsgCJeUGm6h+VqDqIY9/CEGfXy/JuYUFxdk0jx7EpBT7PkJGzGYwfQf3ZANj4Dgt
         oJhzo87zG6mdzjp92ZqGKWyUSS+f33gnjzluI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751528990; x=1752133790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rdlP0nTwM1j9GZkgPlLuvN9K1I59CDnggPz0pqAh0M=;
        b=VHnOnDkcG/nMPW23Jgb15G9jKFSQqzMqYDugrQawn2DBdF62agH00udPNXE76cZKfL
         IY7oofhk582iE+Eo9Q07HYdx3JLMIBvM23u1CaFzXLetsWNtKPWqZxSqIqLrRIsKyz8t
         cxXWQ/SnDeQlNu8CBq0f7oGTzOiVr8VNqL5j6wxeqlACASpaQV51cvn1uLApLDGPnag0
         BopYIxwNk+/EoJZnL0t4TUO5ZnCZ9Sm1RAeBHMng2FyXlnYOostQ6DiD7VvxHOa65NEu
         i6e8STBFs/0gnSsA9fobOPUcekaNh7mx4c/tII5Yauk/Ogq6GN/NGrzyNViuLhJPLU8E
         DPlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs8DcnczG/2utLGgnq+aB5ovyno9NGkMi6LFE+rB6qEf/Qe08kBzp8uW5xDF15moR2e3BJmMaeoUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoh1Ur3IaQNV2ktVE+OSNW0zXE6UhwFHwhZwCLYRmgVwuD3XBg
	JTqZISZS7qL0BV2oYhPCGnzT8ENPbiQHLebI20DO+HIo8I9g9Hj1+JpnDS1oBjLwjw==
X-Gm-Gg: ASbGncujgkfzRmRrD5/xiFH6Ui9om78b2cqLXoStratHiN/TjOq9NT3KR+CMA1Rzyhc
	+wtqP7eleAQcE4JSE+tDFgCNgVpUF0nihTZ2MR4Kq+Fheuj+BfHQLY+QRB98LR0WH1kFROYaDmf
	r/DXSZMzeM0D5KVAjwkq3IJyYjCCsETvttV2ILmKks8GaqKjUj5OT37oQJqueuuMjVNRfVSzrlU
	1nD5pmEPOiAbOzKDs8sGqjz/cvJN0uYvB1h/Sx+aXZEOtTpR7GxyvfScVxu6LUxUT6aUxuZTMQu
	pylRao19ic9XbP8IDlZn/abbWOyX3n6fkqIl05JD/0CUatyeGsFCEI43Hkm22twkVA==
X-Google-Smtp-Source: AGHT+IEKxYsiAxh8kaPSjnmxQLTx3GgbE7KRESYB7LYtUj4r49YBA8q40hB+RM5u8/Kf7sPDiMHXFw==
X-Received: by 2002:a17:903:1b65:b0:235:f2d7:375e with SMTP id d9443c01a7336-23c79842f5cmr39376735ad.52.1751528990271;
        Thu, 03 Jul 2025 00:49:50 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e3f:7c33:158f:349b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39ba83sm144377755ad.89.2025.07.03.00.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 00:49:49 -0700 (PDT)
Date: Thu, 3 Jul 2025 16:49:37 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: David Hildenbrand <david@redhat.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Minchan Kim <minchan@kernel.org>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v1 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Message-ID: <w2hhkx6nwgtk22bcyqm7drvozddwiumj6glixpyrrub7f4ivvf@3as22jquijyu>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-13-david@redhat.com>
 <zmsay3nrpmjec5n7v44svfa7iwl6vklqan4dgjn4wpvsr5hqt7@cqfwdvhncgrg>
 <757cf6b9-730b-4b12-9a3d-27699e20e3ac@redhat.com>
 <ugm7j66msq2w2hd3jg3thsxd2mv7vudozal3nblnfemclvut64@yp7d6vgesath>
 <11de6ae0-d4ec-43d5-a82e-146d82f17fff@redhat.com>
 <5thkl2h5qan5gm7putqd4o6yn5ht2c5zeei5qbjoni677xr7po@kbfokuekiubj>
 <vscedd6m3cq73c5ggjjz6ndordivgeh4dmvzeok222bnderr5c@dujm4ndthtxb>
 <6a83e3e1-ab1d-409b-8395-df363321cade@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a83e3e1-ab1d-409b-8395-df363321cade@redhat.com>

On (25/07/03 09:45), David Hildenbrand wrote:
> Not sure if there is real value for that; given the review status, I assume
> this series won't take too long to be ready for upstream. Of course, if that
> is not the case we could try pulling them out.

Sounds good to me.
