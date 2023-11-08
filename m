Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A90D537
	for <linux-doc@vger.kernel.org>; Wed,  8 Nov 2023 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gcATRfuZ"
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8A7AF
	for <linux-doc@vger.kernel.org>; Wed,  8 Nov 2023 00:01:20 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53e08e439c7so11266238a12.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Nov 2023 00:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699430479; x=1700035279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNi4fClCOjk3xdFXZ5yiVbLFHsXzEYt3ZKrZiBMxjyw=;
        b=gcATRfuZwPQuaMDXVN2zDuOrndRmF2UiI+D7rRbBhUXsxpmla4rBOKmW9ptzlL+lhm
         79Jkv8o7dWQyn6g4osleydpNdMRyHBQer3YuWS28GXp/LvcQu1vSrgPyru6MrltpsRGZ
         ZdwFsKiAZiQA6u90NCjLLnTSVa2Y4qV+LRzveJ0KKyowkR6qK4L2K3T/rNymhBL0C5+h
         NoQKsDr73A//t+hTx0O/77sCl081ZGSDOR1R+uEtNLpGssPZn54gorRJpelNFDzKevex
         gA7TAhYg24TK0p2+FfQIsk+ek3tKti2gmaoMsGiUovoUH9U6Oz/zFPVxSz7EbninUnE8
         Dw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699430479; x=1700035279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNi4fClCOjk3xdFXZ5yiVbLFHsXzEYt3ZKrZiBMxjyw=;
        b=eTHdZ8KO6I2n5PMcmSPm7lcZymZD1tYR7QW//aIQPnipZwY3I2qnk8KqOC/pBgrST3
         G1RnVLM96xsChI134DCJAQ4U9ZcIWvrtK3MDjyhgTDPvy19mAZs76Nuu1UB80exCkR7c
         f3AQeGiHUjFpfaXDgd/YtPTLLxcHM4icmlyNAWT3NMhI8USPnhL8KP0ZQeP+B1EE7Y4p
         Km034G7WvmJ4u2C0YDe+PWkCoOy466fIlKRDrQbiMhFTSmeXNTE6wbMnwk3yL0X76GOn
         JvbxUXKeHy7nXZk0kdXVZIF+IbwyVmNTQHQJDr9tcDIxGVMkwAFi14j1ZT872IXoj4pH
         szdw==
X-Gm-Message-State: AOJu0YwtFg324FehhJ5ZuzFscMbHfDowWe/T16FPUPeXHr1TQd93Im27
	VUBJWPPgi07FYEPOPk8U5sZeEQjsRn43ZaTCAT7Lhw==
X-Google-Smtp-Source: AGHT+IF9zLVkQKgYnQFEJtbLFMGxGUHm/ggdeeQ390qH4xEE1KzKzMRdaKCiHY6k9DQcMexREYD80V4ZtE1hNp9Thbc=
X-Received: by 2002:a17:907:60d4:b0:9ad:e298:a5d with SMTP id
 hv20-20020a17090760d400b009ade2980a5dmr789580ejc.19.1699430478750; Wed, 08
 Nov 2023 00:01:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231108065818.19932-1-link@vivo.com>
In-Reply-To: <20231108065818.19932-1-link@vivo.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 8 Nov 2023 00:00:39 -0800
Message-ID: <CAJD7tkYVtaX=W5XWhn-Y+d==mbHs5AZG-7sAaYmo7FDONpoQ7g@mail.gmail.com>
Subject: Re: [RFC 0/4] Introduce unbalance proactive reclaim
To: Huan Yang <link@vivo.com>, Wei Xu <weixugc@google.com>, 
	David Rientjes <rientjes@google.com>
Cc: Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeelb@google.com>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, 
	Huang Ying <ying.huang@intel.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Peter Xu <peterx@redhat.com>, "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, 
	Liu Shixin <liushixin2@huawei.com>, Hugh Dickins <hughd@google.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Wei Xu +David Rientjes

On Tue, Nov 7, 2023 at 10:59=E2=80=AFPM Huan Yang <link@vivo.com> wrote:
>
> In some cases, we need to selectively reclaim file pages or anonymous
> pages in an unbalanced manner.
>
> For example, when an application is pushed to the background and frozen,
> it may not be opened for a long time, and we can safely reclaim the
> application's anonymous pages, but we do not want to touch the file pages=
.
>
> This patchset extends the proactive reclaim interface to achieve
> unbalanced reclamation. Users can control the reclamation tendency by
> inputting swappiness under the original interface. Specifically, users
> can input special values to extremely reclaim specific pages.

I proposed this a while back:

https://lore.kernel.org/linux-mm/CAJD7tkbDpyoODveCsnaqBBMZEkDvshXJmNdbk51yK=
SNgD7aGdg@mail.gmail.com/

The takeaway from the discussion was that swappiness is not the right
way to do this. We can add separate arguments to specify types of
memory to reclaim, as Roman suggested in that thread. I had some
patches lying around to do that at some point, I can dig them up if
that's helpful, but they are probably based on a very old kernel now,
and before MGLRU landed. IIRC it wasn't very difficult, I think I
added anon/file/shrinkers bits to struct scan_control and then plumbed
them through to memory.reclaim.

>
> Example:
>         echo "1G" 200 > memory.reclaim (only reclaim anon)
>           echo "1G" 0  > memory.reclaim (only reclaim file)
>           echo "1G" 1  > memory.reclaim (only reclaim file)

The type of interface here is nested-keyed, so if we add arguments
they need to be in key=3Dvalue format. Example:

echo 1G swappiness=3D200 > memory.reclaim

As I mentioned above though, I don't think swappiness is the right way
of doing this. Also, without swappiness, I don't think there's a v1 vs
v2 dilemma here. memory.reclaim can work as-is in cgroup v1, it just
needs to be exposed there.
