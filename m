Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DRVWl+3D"
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB5AEBE
	for <linux-doc@vger.kernel.org>; Mon, 11 Dec 2023 18:43:51 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2cc2238f597so20224251fa.3
        for <linux-doc@vger.kernel.org>; Mon, 11 Dec 2023 18:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1702349030; x=1702953830; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KaLk4QjiddLthhe61ZtqkCQM4vFUDEU82pA5JUhvoLM=;
        b=DRVWl+3DcoFbLMdABJur0JARjpubyVJztXG7UplaOZueHlUBYlRrNtbOGsm+Vi92PM
         RX02DKtc+MSLwfGDSygaR14iIhkGSg8sHnpyDO5B356e5yHjLJtf1rEQEFUcQFooV8cT
         AK8X5FJBTbLW9aG0e0ZGDKd9UqTPrYx+jY1UHcgNQeHlUA2aHTbUUYFs3c2mOOgm+9Ht
         c8HawJkMZTahh4iiDPWJ+46q8Wtit1zqjxwx1pDk+Mcz8MzPT/Bjz/+gTqqlUbsXmn4X
         G6/8vFCqbHYDzRRUWKDhYcgSsxfBQ0ffCmpd1ZpEZON+q2bg6V3o38WBD7aBLmwt8ah0
         MoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702349030; x=1702953830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaLk4QjiddLthhe61ZtqkCQM4vFUDEU82pA5JUhvoLM=;
        b=qizCurjsOCGY3LcV/E0GMS7WOvDVJbL71BFbP+jbLIOeF/Yz9F4WqbSFCPqRt6OKBt
         g5SSXZDMWsZtNRjQbsBLNRR2YYxrckrnioNk85n/N3wDERZOhK6O0twCMM9AX6kkGT6T
         gzQq6FNynlzmvFDV8NB9u50xbQKhQd0P+97scW3BF6bLCnZYqB/mRzNHwpI9W2h1u3BO
         KvNLZjnLI8RzdMbfqKSHX+CgFwPw8rDvoElNNIa5yOLalSu2PnpVeW8T7Q8tH+xP4tWV
         9k7cuecJwrUJy8ewHrmz3D2NAp79V8os1MA+xZEEG0aAbMj1suANHmvz0PNQYy7pVSou
         AA1g==
X-Gm-Message-State: AOJu0Yx57+KkR0NbSXcfc/6x+iZyQjLGZUKAxNss0QOQJRNY5Ys836R9
	Irgf0M0x8ZMfG0rmze1aQ8b32OxOBDZ/PupUrjEdqA==
X-Google-Smtp-Source: AGHT+IGmTbrr+WPLH70Vp1/LxV2ShJdknyBI+xq5BxcnSB8agx7zdQkVJFzrXE6XAVxuwW4h5JTudbc3boLFVNSEUks=
X-Received: by 2002:a2e:9619:0:b0:2ca:760:bc55 with SMTP id
 v25-20020a2e9619000000b002ca0760bc55mr880262ljh.209.1702349029948; Mon, 11
 Dec 2023 18:43:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207192406.3809579-1-nphamcs@gmail.com> <CAF8kJuPEKWbr_1a-OzqrYKSPmuty==KhC2vbTPAmm9xcJHo4cg@mail.gmail.com>
 <CAKEwX=Oj0Rur8i9Oo7y2Py7svx-g11sEj3GKQfMVL62x=4hvdA@mail.gmail.com>
 <CAF8kJuNpnqTM5x1QmQ7h-FaRWVnHBdNGvGvB3txohSOmZhYA-Q@mail.gmail.com>
 <20231209034229.GA1001962@cmpxchg.org> <ZXeTb_ACou7TEVsa@google.com>
In-Reply-To: <ZXeTb_ACou7TEVsa@google.com>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Tue, 12 Dec 2023 10:43:38 +0800
Message-ID: <CACSyD1NPM-m_KeViGdoDbaoAwKUETkYPe8f6HLEzRtLm8VE+Fg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v6] zswap: memcontrol: implement zswap
 writeback disabling
To: Minchan Kim <minchan@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	akpm@linux-foundation.org, tj@kernel.org, lizefan.x@bytedance.com, 
	cerasuolodomenico@gmail.com, yosryahmed@google.com, sjenning@redhat.com, 
	ddstreet@ieee.org, vitaly.wool@konsulko.com, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeelb@google.com, muchun.song@linux.dev, 
	hughd@google.com, corbet@lwn.net, konrad.wilk@oracle.com, 
	senozhatsky@chromium.org, rppt@kernel.org, linux-mm@kvack.org, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	david@ixit.cz, Kairui Song <kasong@tencent.com>
Content-Type: text/plain; charset="UTF-8"

> Hi Johannes,
>
> I haven't been following the thread closely, but I noticed the discussion
> about potential use cases for zram with memcg.
>
> One interesting idea I have is to implement a swap controller per cgroup.
> This would allow us to tailor the zram swap behavior to the specific needs of
> different groups.

Hi Minchan,

It would be great if this feature could be in place. We are using zram and also
trying to use zswap to offload memory to disk. As kairui mentioned above,
there are many workloads of varying priority and sensitivity on a machine.

>
> For example, Group A, which is sensitive to swap latency, could use zram swap
> with a fast compression setting, even if it sacrifices some compression ratio.
> This would prioritize quick access to swapped data, even if it takes up more space.
>
> On the other hand, Group B, which can tolerate higher swap latency, could benefit
> from a slower compression setting that achieves a higher compression ratio.
> This would maximize memory efficiency at the cost of slightly slower data access.
>
> This approach could provide a more nuanced and flexible way to manage swap usage
> within different cgroups.

Indeed.
