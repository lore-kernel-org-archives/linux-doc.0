Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbGzPYp2"
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39E8197;
	Tue, 21 Nov 2023 17:19:32 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-7a6774da682so273773139f.3;
        Tue, 21 Nov 2023 17:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700615972; x=1701220772; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cihilcVY5OStqtWe30Okdv2euw2yNNgkn3qMNIzpAgo=;
        b=bbGzPYp26QGA584/5mltjnFsDCneQVIlgsquIf91ol0mxp7Onz0lBhrrLF3cjI+1mg
         NvwS141ssTORi3f2pfYtix993l7nCfm2+B2S1Rl2PHB4Xkmn0C4apG7SvMFh1hZjbBY/
         nKYoilBSwz9cwvXT35roMYZvOaTAosfYQjOQ0IN0a8T0p3QkWSAxPiUgb4h3uUN65CPV
         JMVhPgdJtrthq7LL7i+RJnzhFQqwvijRJszhdVcrPlc0mazwsmO1d94bowelQyV/dN+R
         sIbYBzLPq4KvmPT0+o7c4LCaKi2I2iqzmuvLQ+3a+1KwFg8aW2lSpO+TcNNAtKVhTsij
         oMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700615972; x=1701220772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cihilcVY5OStqtWe30Okdv2euw2yNNgkn3qMNIzpAgo=;
        b=fzN8eUNrUR1y7HKJFOzcfR0Q1uqknZbi76J6kUlizmbf2FY8GMgfbeL3jD9HqIqGTi
         EQijQFkpTxgvV0VdceWkcErIdndxUrVAFVGyscdwtANLpjfpmnf75lPM7eom7pLZj8UD
         AYzDActwDY7Tg3TqM8wLvP3JXRdB9CP+z/78tvf9yPp3gkwcr2Z3ixHjus4vfALT3Gwh
         +NsN6aKZJIEZ40aDPmhFS6CQdFeMf/D+NwBL/CvMTU6VH27FyOAmkQ7iXOAmisSLbh4p
         igdaz825WHMMW4XmHZqV4XV0HpClRJ1ZcNmRBomyzcMFhWSiO/bJn5eHBfidOGxL7M0f
         WcoA==
X-Gm-Message-State: AOJu0YyPi7yS/mhmuTT1B+cqdYyCK1Apbi+um88/e/8mPanJhiM0zGnB
	+lbQrPOolc+oNx63c7UwJxHoVKqgLian3TZfEp0=
X-Google-Smtp-Source: AGHT+IE6W+Qq26H8vhTNqXDl2/rLQcAxjTvAPuQ9FR9DHaFVqUa+5jIx+4GJB/W5WQBTbwRqtf6oMtvFHyqFXFzoNPg=
X-Received: by 2002:a05:6602:3999:b0:7a6:7e4c:1bf0 with SMTP id
 bw25-20020a056602399900b007a67e4c1bf0mr855787iob.16.1700615971940; Tue, 21
 Nov 2023 17:19:31 -0800 (PST)
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
 <CAF8kJuNFQn_e29YEPy-G29FR2RnrPzZNWR07VuadOTNask_Rig@mail.gmail.com>
In-Reply-To: <CAF8kJuNFQn_e29YEPy-G29FR2RnrPzZNWR07VuadOTNask_Rig@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 21 Nov 2023 17:19:19 -0800
Message-ID: <CAKEwX=NpKqjApRKk2Qp9Hp63xSjRwD-DEu9yX4BvbMd86x2b1g@mail.gmail.com>
Subject: Re: [PATCH v5] zswap: memcontrol: implement zswap writeback disabling
To: Chris Li <chrisl@kernel.org>
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

On Tue, Nov 21, 2023 at 11:09=E2=80=AFAM Chris Li <chrisl@kernel.org> wrote=
:
>
> On Tue, Nov 21, 2023 at 10:13=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wr=
ote:
> >
> > Hi Chris!
> >
> > Thanks for the patch. Would you mind if I spend some time staring
> > at the suggestion again and testing it some more?
>
> Of course, by all means. That is just the minimal version to be
> functional compatible with your zswap.writeback.
>
> I might consider a follow up patch to add "no_zswap" and "none" to
> convert the SSD only swapfile, which can't be expressed by
> zswap.writeback.
> That should cover all 4 combinations of zswap and swap files without
> creating a custom swap tiers list.
>
> "all": zswap + swapfile
> "zswap": zswap only
> "no_zswap": swapfile only.
> "none": no swap.
>
> All keyword names are open to suggestions.

SGTM! There might be some functionality duplication between
memory.swap.tiers =3D no_zswap and memory.zswap.max =3D 0, but
otherwise this seems reasonable to me.

no_zswap sounds a bit awkward, but I can't come up with a better
name.

>
> >
> > If everything is good, I'll squash this patch with the original version=
,
> > (keeping you as a co-developer of the final patch of course), and
> > update the documentation before re-sending everything as v6.
>
> Great!
>
> >
> > Anyway, have a nice Thanksgiving break everyone! Thanks for
> > taking the time to review my patch and discuss the API with me!
>
> My pleasure to discuss the swap with you. We should do the online
> "swap meet" and invite other developers who are interested in the swap
> area as well.

I look forward to this meeting! I'd love to discuss more about (z)swap
development (and more generally, multi-tier memory management).

Generic page promoter/demoter that takes into account workload
(cgroup), access recency (LRU + generations)/frequency, and tier
characteristics (latency, bandwidth, etc.) will be awesome to explore!

>
> Chris
