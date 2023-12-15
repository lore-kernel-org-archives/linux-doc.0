Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB7918C09
	for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 09:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eyDQMh3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702633839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2jUFk+kWF85SdiIX9/ky14z9K9zUyz1416eEiXRguD8=;
	b=eyDQMh3tTlh7mwCLF54iInnRk5FZ+BjFsHqJDMs/JIYkPLRDFnqiOR6RZf6Qyb4PlvWyFf
	W3chRLBhq6ycN2RZgjc3gjNnKsG2cEmS9MeAQsG11NOhzbVe6vOc5aPSgAttEWLred90L2
	vLF1sCuYOA6r87S0ovY2nrYsM5UJ/SY=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-Vm36C3nwNjSQ-2lQ6nrb4g-1; Fri, 15 Dec 2023 04:50:37 -0500
X-MC-Unique: Vm36C3nwNjSQ-2lQ6nrb4g-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-5e3c4d70f71so4733877b3.2
        for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 01:50:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702633837; x=1703238637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jUFk+kWF85SdiIX9/ky14z9K9zUyz1416eEiXRguD8=;
        b=Vj+tACFJXn1Q6n90eAPmGxzkAz2rmgEYC0rXQdlsvL6mAXqxcGPPlvRQ827XF7arqk
         qAwglnR1e6c6Ye86E+xGW+HkoXWgPC4iGn6haN0B1ATGRNh/yLfTnT/QWAftIGUjjfrC
         q+12nwHYOCN9Mq1a3AIJPgzHGjfST8e8hfunl7xDub9ymuHRRIpVBFU1jZwoL5lqxodo
         ZjsN+lmrXPRuujEG2tOVTg+hKh6fwFaon03mZPp9J5UrL6XHzFxAUcK8HGuhWRRguF1P
         HMwYAauVeBYzFTXnWjCOrQdbLW3pYvnW7q9sUGl4QifKduL3n2t86qOXnhTuqYJg3cdp
         Qc9Q==
X-Gm-Message-State: AOJu0YygrLpuflxk7qcp/dRNfDOPuEMs2wRcK+c3iYx9Zdwb1RHk4DTJ
	R+ajulcefDSESUFa2w43pc5pEIKiM+R9OSyHXJp0jNw46NY9Cj8ZTIW26D+7GqYE792c65yGe9l
	+S6YqEpyY9NfiStJC5MU6Gy61IaBn4zqPpXod
X-Received: by 2002:a0d:f842:0:b0:5d7:1940:b377 with SMTP id i63-20020a0df842000000b005d71940b377mr9389526ywf.67.1702633837020;
        Fri, 15 Dec 2023 01:50:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEj0WCc7h2W06gwb0544zgPnIeghTyp6d8BMs+Gqvk9Yl1q2nTxcxfziVYO7Ty/itdzxF+rd+Jc9exaxn2+BMo=
X-Received: by 2002:a0d:f842:0:b0:5d7:1940:b377 with SMTP id
 i63-20020a0df842000000b005d71940b377mr9389520ywf.67.1702633836737; Fri, 15
 Dec 2023 01:50:36 -0800 (PST)
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
 <20231214171137.GA261942@cmpxchg.org> <CAOUHufbvafDiURT9qBjKPpRSNwc60S-bDg2yMH_m4bNSWQcV4g@mail.gmail.com>
 <CA+PVUaR9EtUMke-K8mM0gmJXdOm9equ1JHqBjZ0T5V0tiHVc8Q@mail.gmail.com>
 <CAF8kJuMLDOaP6-Xyz-+hzLbDuYW7gfG9jA06j6t5v7XX2rPOdw@mail.gmail.com>
 <CA+PVUaRxXdndKCodgPKFcsCUQwO-8mGtU65OkkudoR-8rB=KaA@mail.gmail.com> <CAF8kJuMKCu=Bf4K6RryFdGGgC+RhyanwaXc-ZGtURk7Wbckq6Q@mail.gmail.com>
In-Reply-To: <CAF8kJuMKCu=Bf4K6RryFdGGgC+RhyanwaXc-ZGtURk7Wbckq6Q@mail.gmail.com>
From: Fabian Deutsch <fdeutsch@redhat.com>
Date: Fri, 15 Dec 2023 10:50:16 +0100
Message-ID: <CA+PVUaRnd0vjTNQqdFG-pLYVqaquP46+YOOYWtMpJkNtkF+S6Q@mail.gmail.com>
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling
To: Chris Li <chrisl@kernel.org>
Cc: Yu Zhao <yuzhao@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Minchan Kim <minchan@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "tj@kernel.org" <tj@kernel.org>, 
	"lizefan.x@bytedance.com" <lizefan.x@bytedance.com>, 
	"cerasuolodomenico@gmail.com" <cerasuolodomenico@gmail.com>, 
	"yosryahmed@google.com" <yosryahmed@google.com>, "sjenning@redhat.com" <sjenning@redhat.com>, 
	"ddstreet@ieee.org" <ddstreet@ieee.org>, "vitaly.wool@konsulko.com" <vitaly.wool@konsulko.com>, 
	"mhocko@kernel.org" <mhocko@kernel.org>, "roman.gushchin@linux.dev" <roman.gushchin@linux.dev>, 
	"shakeelb@google.com" <shakeelb@google.com>, "muchun.song@linux.dev" <muchun.song@linux.dev>, 
	"hughd@google.com" <hughd@google.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, "rppt@kernel.org" <rppt@kernel.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "kernel-team@meta.com" <kernel-team@meta.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "david@ixit.cz" <david@ixit.cz>, 
	Kairui Song <kasong@tencent.com>, Zhongkun He <hezhongkun.hzk@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 10:40=E2=80=AFAM Chris Li <chrisl@kernel.org> wrote=
:
>
> On Thu, Dec 14, 2023 at 11:42=E2=80=AFPM Fabian Deutsch <fdeutsch@redhat.=
com> wrote:.
> > >
> > > Just to clarify, the "node" you mean the "node" in kubernetes sense,
> > > which is the whole machine. In the Linux kernel MM context, the node
> > > often refers to the NUMA memory node, that is not what you mean here,
> > > right?
> >
> > Correct, I was referring to a kubernetes node, not numa node.
> >
> > >
> > >> - With todays node level swap, and setting memory.swap.max=3D0 for a=
ll cgroups allows you toachieve a similar behavior (only opt-in cgroups wil=
l get swap).
> > >> - the above approach however will still have a shared swap backend f=
or all cgroups.
> > >
> > > Yes, the "memory.swap.tires" idea is trying to allow cgroups to selec=
t
> > > a subset of the swap backend in a specific order. It is still in the
> > > early stage of discussion. If you have any suggestion or feedback in
> > > that direction, I am looking forward to hearing that.
> >
> > Interesting. There have been concerns to leak confidential data acciden=
tally when it's getting written to a swap device.
>
> One common solution is to encrypt the data written to the device. If
> someone gets hold of the swapped outed device without the key, they
> can't get to the memory data without the key.


Yes - I guess like writing it onto a dmcrypt device with some random key.
Nevertheless, this was one of the topics.

>
>
> > The other less discussed item was QoS for swap io traffic.
> >
> > At a first glance it seems like tires could help with the second use-ca=
se.
>
> The idea is that you can select the swap tiers list for each cgroup.
> That way  you can assign different swap QoS to different cgroup.


Yes, it sounds like a fit.
What use-cases did you have in mind for the tiers feature?

