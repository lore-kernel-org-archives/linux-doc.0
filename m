Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA97DDA2
	for <linux-doc@vger.kernel.org>; Wed,  8 Nov 2023 08:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aNbrAE1y"
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0231171B
	for <linux-doc@vger.kernel.org>; Wed,  8 Nov 2023 00:59:43 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9dbb3d12aefso983405566b.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Nov 2023 00:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699433982; x=1700038782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tor/EJdIpY1mQ+T8Qhv4C03xA4q/rVwv1DfBop2f0Do=;
        b=aNbrAE1yKFuBCJcFtCPknM0so7xM+RsD4m7nVZNzkZdpNJ+0oXH5OWhjcthKbfmfB9
         L0Bzxe+oNszY9pkU2lUgvfUpEDO0vwkRgXV1Xo4eU24afFdalnzg61OSKdqybd7x7q5e
         A9WG2rW7wh1IjZaNUtyHNIHgNvPP2tOD9DVL1TWKhyzNStPNy1zbb4u0dBd9xRX7vAyV
         vwRTW6S+ro8x+Mq1EAEG3B+vjlWNVkOEhKn8Z0y15LBilQQeDBMUxQ0zO+UdBiqkbxmH
         xQxqKW0BScknWn+grt9msHa9qOLKizqJGFtucxNaCwljc31BDi58JtkaYagTM21FSKLK
         m4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699433982; x=1700038782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tor/EJdIpY1mQ+T8Qhv4C03xA4q/rVwv1DfBop2f0Do=;
        b=fZKHB4nPuL79LPBX40gDp6CENuSb0rxh18pVoJDKt4WZaPlo/0E9kmbiXIQBPcdcmj
         3HYK1zIN7fm3SiT9VylaJCv6WT2GvU20xxwlxwpunpW5bOBKF58aqNmzt9cz74KuMp6N
         AZA2xYYRfR2/zvd9SItouw7EquO+qpF8Ma8iHjvLyuWOrxVXGnP2yJQyXR9JPXbCSx0G
         QnEiKHTjnNUT96YX8M9F81eCvixn2IuJvUp/PwbRzfPDn10HqtngCjIVCnD6PuXH00Io
         O76jY0PWcoQ9ZeySEXO+IpZ861F47ILjILj3JwkTB5q3SLEue4I+nubPRDPmywkpp5W4
         vKHw==
X-Gm-Message-State: AOJu0YzE2F7810dFE3tJMJeqPVQc2g52L2HhqPXTaBcueLRyaVIciDnH
	56fDnxv0cUeqxQGd8LDMRGZSV1rDGHsR4Lk9aOLm9w==
X-Google-Smtp-Source: AGHT+IGn6eGFsclyYzD50WFiPGxzCz+3fCLF0s6JgmmAuiqTby0HByPXoOE0rEbXVr+CVfr+KMHxOfjP0b/dgUSvGvM=
X-Received: by 2002:a17:906:c103:b0:9c0:2897:1588 with SMTP id
 do3-20020a170906c10300b009c028971588mr790461ejc.17.1699433982110; Wed, 08 Nov
 2023 00:59:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231108065818.19932-1-link@vivo.com> <CAJD7tkYVtaX=W5XWhn-Y+d==mbHs5AZG-7sAaYmo7FDONpoQ7g@mail.gmail.com>
 <4c7db101-a34f-47ff-ba64-952516cc193a@vivo.com>
In-Reply-To: <4c7db101-a34f-47ff-ba64-952516cc193a@vivo.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 8 Nov 2023 00:59:02 -0800
Message-ID: <CAJD7tkZ2cnp6tSr6jb2Xpt4J-5oeTmAq1KNw6f7KBWPfjca8gA@mail.gmail.com>
Subject: Re: [RFC 0/4] Introduce unbalance proactive reclaim
To: Huan Yang <link@vivo.com>
Cc: Wei Xu <weixugc@google.com>, David Rientjes <rientjes@google.com>, Tejun Heo <tj@kernel.org>, 
	Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Michal Hocko <mhocko@kernel.org>, 
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

On Wed, Nov 8, 2023 at 12:26=E2=80=AFAM Huan Yang <link@vivo.com> wrote:
>
>
> =E5=9C=A8 2023/11/8 16:00, Yosry Ahmed =E5=86=99=E9=81=93:
> > +Wei Xu +David Rientjes
> >
> > On Tue, Nov 7, 2023 at 10:59=E2=80=AFPM Huan Yang <link@vivo.com> wrote=
:
> >> In some cases, we need to selectively reclaim file pages or anonymous
> >> pages in an unbalanced manner.
> >>
> >> For example, when an application is pushed to the background and froze=
n,
> >> it may not be opened for a long time, and we can safely reclaim the
> >> application's anonymous pages, but we do not want to touch the file pa=
ges.
> >>
> >> This patchset extends the proactive reclaim interface to achieve
> >> unbalanced reclamation. Users can control the reclamation tendency by
> >> inputting swappiness under the original interface. Specifically, users
> >> can input special values to extremely reclaim specific pages.
> > I proposed this a while back:
> >
> > https://lore.kernel.org/linux-mm/CAJD7tkbDpyoODveCsnaqBBMZEkDvshXJmNdbk=
51yKSNgD7aGdg@mail.gmail.com/
> Well to know this, proactive reclaim single type is usefull in our
> production too.
> >
> > The takeaway from the discussion was that swappiness is not the right
> > way to do this. We can add separate arguments to specify types of
> > memory to reclaim, as Roman suggested in that thread. I had some
> > patches lying around to do that at some point, I can dig them up if
> > that's helpful, but they are probably based on a very old kernel now,
> > and before MGLRU landed. IIRC it wasn't very difficult, I think I
> > added anon/file/shrinkers bits to struct scan_control and then plumbed
> > them through to memory.reclaim.
> >
> >> Example:
> >>          echo "1G" 200 > memory.reclaim (only reclaim anon)
> >>            echo "1G" 0  > memory.reclaim (only reclaim file)
> >>            echo "1G" 1  > memory.reclaim (only reclaim file)
> > The type of interface here is nested-keyed, so if we add arguments
> > they need to be in key=3Dvalue format. Example:
> >
> > echo 1G swappiness=3D200 > memory.reclaim
> Yes, this is better.
> >
> > As I mentioned above though, I don't think swappiness is the right way
> > of doing this. Also, without swappiness, I don't think there's a v1 vs
> > v2 dilemma here. memory.reclaim can work as-is in cgroup v1, it just
> > needs to be exposed there.
> Cgroupv1 can't use memory.reclaim, so, how to exposed it? Reclaim this by
> pass memcg's ID?

That was mainly about the idea that cgroup v2 does not have per-memcg
swappiness, so this proposal seems to be inclined towards v1, at least
conceptually. Either way, we need to add memory.reclaim to the v1
files to get it to work on v1. Whether this is acceptable or not is up
to the maintainers. I personally don't think it's a problem, it should
work as-is for v1.
