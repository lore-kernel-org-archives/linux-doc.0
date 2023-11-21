Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9972220DE4
	for <linux-doc@vger.kernel.org>; Tue, 21 Nov 2023 19:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccc0iYNA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7BCC433C9
	for <linux-doc@vger.kernel.org>; Tue, 21 Nov 2023 19:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700593771;
	bh=wQqDKRQjn6844OW3n/w7wb8sy0SLbW225b2srtOadSo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ccc0iYNA+ruXpCZTeJMcDBc51/1dKabUqQNxc1hQCOJOE0SuqptNQJe1wJv5Q510b
	 q2XMuR7kafI97/r18kF9PbcfVbEEVblgXkOXCFftu56SAtex33D+ruTxY7Qc+pQncP
	 InGXMnq10VNG4SuRP/P9CBrOm7J4gWpOeDKGgZIcDJhilKFxlftzF2I4I4ROwa0FxL
	 djc/+3iPXe6UHcCU8SlbCvB3klXvFSIxt8myvJtJDFKKNSKRLZUlNzjOS+3X5RfqXp
	 LS/dsD8to3j15y9frxouKwUbNVBxG64IXomRxa1+yzO0Nrtp/yzo+Mr/y7125FPS6f
	 VvP252hKUHCgw==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-77896da2118so389892585a.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Nov 2023 11:09:31 -0800 (PST)
X-Gm-Message-State: AOJu0Yw9aNen5PHobIys67kcUieoZ9bQAqYZRAR64vUMSAFWK5Wmyc2I
	kczaFtuC5Edvt1ZB+5JLDg87H091tBDRokuUms6v2Q==
X-Google-Smtp-Source: AGHT+IFj6T6qFwD847PxtZzKZN0ToGw/PjQQlEJhOLHFQIM/P89jcN/ZWDs7l4ENV/joAGnZgLeRSADwaWkhZ9aimOw=
X-Received: by 2002:a17:90b:1d92:b0:27d:5964:4ee6 with SMTP id
 pf18-20020a17090b1d9200b0027d59644ee6mr163589pjb.2.1700593750122; Tue, 21 Nov
 2023 11:09:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115172344.4155593-1-nphamcs@gmail.com> <CAF8kJuN-4UE0skVHvjUzpGefavkLULMonjgkXUZSBVJrcGFXCA@mail.gmail.com>
 <CAJD7tkZ1U+YuvoBAnrXFxQDiQV2hXdbMG-gbzu64R8GLAtNAPA@mail.gmail.com>
 <CAF8kJuPTNwQM413UdeQTkMQ8HkJFyF4OWVrxJSf7uWbege0CXQ@mail.gmail.com>
 <CAKEwX=O5M-vZE5YhYQ5_CbCmXovS1XECO4ROXKWo06K880M1Mg@mail.gmail.com>
 <CAF8kJuOD6zq2VPcVdoZGvkzYX8iXn1akuYhNDJx-LUdS+Sx3GA@mail.gmail.com>
 <CAKEwX=NdFjemcmf27PVpgHpVHWQEo19KfApepWJBRYeyVCWvCw@mail.gmail.com>
 <CAF8kJuOCyd5r0LQ3m8fQp0GtxxNUKSmwURJH6V9aApefvX8xCA@mail.gmail.com>
 <ZVrHXJLxvs4_CUxc@google.com> <CAKEwX=MR6a-u87p=Oqm+zvwB_1zhrsM_n2=xW1kJz0_AoVwkPA@mail.gmail.com>
In-Reply-To: <CAKEwX=MR6a-u87p=Oqm+zvwB_1zhrsM_n2=xW1kJz0_AoVwkPA@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Tue, 21 Nov 2023 11:08:59 -0800
X-Gmail-Original-Message-ID: <CAF8kJuNFQn_e29YEPy-G29FR2RnrPzZNWR07VuadOTNask_Rig@mail.gmail.com>
Message-ID: <CAF8kJuNFQn_e29YEPy-G29FR2RnrPzZNWR07VuadOTNask_Rig@mail.gmail.com>
Subject: Re: [PATCH v5] zswap: memcontrol: implement zswap writeback disabling
To: Nhat Pham <nphamcs@gmail.com>
Cc: Yosry Ahmed <yosryahmed@google.com>, Andrew Morton <akpm@linux-foundation.org>, tj@kernel.org, 
	lizefan.x@bytedance.com, Johannes Weiner <hannes@cmpxchg.org>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, Seth Jennings <sjenning@redhat.com>, 
	Dan Streetman <ddstreet@ieee.org>, Vitaly Wool <vitaly.wool@konsulko.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeelb@google.com>, Muchun Song <muchun.song@linux.dev>, 
	Hugh Dickins <hughd@google.com>, corbet@lwn.net, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm <linux-mm@kvack.org>, kernel-team@meta.com, 
	LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, david@ixit.cz, 
	Minchan Kim <minchan@google.com>, Kairui Song <kasong@tencent.com>, 
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 10:13=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> Hi Chris!
>
> Thanks for the patch. Would you mind if I spend some time staring
> at the suggestion again and testing it some more?

Of course, by all means. That is just the minimal version to be
functional compatible with your zswap.writeback.

I might consider a follow up patch to add "no_zswap" and "none" to
convert the SSD only swapfile, which can't be expressed by
zswap.writeback.
That should cover all 4 combinations of zswap and swap files without
creating a custom swap tiers list.

"all": zswap + swapfile
"zswap": zswap only
"no_zswap": swapfile only.
"none": no swap.

All keyword names are open to suggestions.

>
> If everything is good, I'll squash this patch with the original version,
> (keeping you as a co-developer of the final patch of course), and
> update the documentation before re-sending everything as v6.

Great!

>
> Anyway, have a nice Thanksgiving break everyone! Thanks for
> taking the time to review my patch and discuss the API with me!

My pleasure to discuss the swap with you. We should do the online
"swap meet" and invite other developers who are interested in the swap
area as well.

Chris
