Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AF22030A
	for <linux-doc@vger.kernel.org>; Wed, 27 Nov 2024 17:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732729662; cv=none; b=jIpsTFAE/7qh7vSv6C2JHuiACJDWQ25s6B2FSCuWE1mRgBCPMNlhBj6O4zIIokhp4VmbqYd1CoeB1ejvflsVQBXwzqjsDz0poo0lT2jls/Fukx0s2J2uyZqgg5ITo/OGrAcqUJi2XczK73qnxRJQgQMTRoA5YMxskjk/y9g8vmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732729662; c=relaxed/simple;
	bh=3cPCxD7H2a8Lh6owvh2XlsPsMo9YKelKbnsLwpIFa20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AyFpaB7go8yBUv0Peq+IGpNBe4UPyZNYDzORLtJ7KN5pF3vRWYYUYjz2ctzhMlOwzwQnjtBWkyleVDZD+GbjZeM5gv2VTJgcbinQOumJXXRvjzMLt3HkT+Lw2xqAMYZH4ArVu/jgNdLmSPwidPI8FHrSyXpyYvuwnaMXQFvELfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DWfIWleJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DWfIWleJ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-211eb2be4a8so196495ad.1
        for <linux-doc@vger.kernel.org>; Wed, 27 Nov 2024 09:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732729659; x=1733334459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C10ZEuRraCO6elndBS5q/kKi7+M/Tzch8Tv1uSjbGZM=;
        b=DWfIWleJP2zsc7O3IabOlmZGs+0jZZ7zMVyHjK+VHNa2BB5GXORRo/zoKnP8HMu08E
         WMYTjzPAeuqPQzuElMlhdYmKeokHcnA0X/hsTjqLK+N5cV3WB+BlCPdkA07w7ARBjLjM
         IoaXUiLI1b4Kj10leMzrbHYBFBXst/5FM1u/cWAesu49qCZKp4ko4sj+/8gMpmaz+NIi
         ZPfgpTZioMmUZFSxNMcZsCr7EegXDZnqt/Kib2ApMIlTd3FwNugl3lvnLCwu2a7Ea5vI
         Mf1YLtl6Tn30wuV5NTn1U78+hjDE4xze/9d7OmUFM+jx7/EUntqxwNYpFTycePkLnu5A
         gbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732729659; x=1733334459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C10ZEuRraCO6elndBS5q/kKi7+M/Tzch8Tv1uSjbGZM=;
        b=NESlHzs59B6ULZoY5sRxGA/QX7vN+LN5sYF/+xNj6PA2iEjsbvGFreYuac/L2rkLnn
         uBtbhcn15OiVvGHRdV07pPrQGLJgHanEMShKoPdghV1e1lJIE34fc9rMaed/w9TbUpwW
         gthnPidwh5LCeC5c1BX/v0Bj6GFhiJoWGe+/S6JR1YWc8iCH8oxf/djO4Q48jM+dmKAS
         Wto6NmoFSph1YjhUwn9Sa0FZ9BclQmDUP3fV1qIRXnFtIlYU659lonTMcMOfdVM2d70o
         TkeBWrD6WoDT4tKeGbyPLyUjE4vNaHdRXg9NveNFS0H0iRcifHJBI+BatZRY5fuxVQsd
         2RyA==
X-Forwarded-Encrypted: i=1; AJvYcCVdCPUd2ve3vMVUTK+yBgXpXDkWCgCSPO/vXsZCan4DkRlEfg5PHfLdQAiHKw4iqHyTKZOvWjcgZLI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe+y/VN91ByVyB6Gzj/qxqLTiza7UTJREjbhCg4jlZBZf1dIAN
	Z74oFKMYDQh8eOK4E54W0TzJr4Y9/P6VU5SIK3mwvuCl/FSnSJEQ5Gen1oRv8jMJC1H7wJxCQac
	jo/xpRYE0hX/6H6JKwb0RtRMHcbDmV414bXim
X-Gm-Gg: ASbGncsH5HzI53sSC+lyXiLfZJNWMYxowmWYxHCp9MWBi+Hp2LOMdzLVN1908pqAVRu
	CnqpyXwyby2fg7f5CIjtuTJkJAd3HTbQ+KWyPUd9eO8yCP+7cxRhcSuPcbHjYGKQqsg==
X-Google-Smtp-Source: AGHT+IEWj4m7+heIVmeyDopSriS2JGtzJfSKycg033XDM9P61gMKjT+xPWPfu26TGwPqoI2Oh8nkmAXZluulyXqzu48=
X-Received: by 2002:a17:903:440d:b0:20c:8a97:1fd with SMTP id
 d9443c01a7336-2150640abb9mr2258805ad.19.1732729659360; Wed, 27 Nov 2024
 09:47:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127025728.3689245-1-yuanchu@google.com> <20241127025728.3689245-2-yuanchu@google.com>
 <Z0aeXrpY-deSfO8v@casper.infradead.org>
In-Reply-To: <Z0aeXrpY-deSfO8v@casper.infradead.org>
From: Yuanchu Xie <yuanchu@google.com>
Date: Wed, 27 Nov 2024 09:47:22 -0800
Message-ID: <CAJj2-QEq5xj7JHNS_QaxWXq0e2KDMX2OSw5rGfYeGC4+X9gx8w@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] mm: aggregate workingset information into histograms
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Khalid Aziz <khalid.aziz@oracle.com>, 
	Henry Huang <henry.hj@antgroup.com>, Yu Zhao <yuzhao@google.com>, 
	Dan Williams <dan.j.williams@intel.com>, Gregory Price <gregory.price@memverge.com>, 
	Huang Ying <ying.huang@intel.com>, Lance Yang <ioworker0@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Daniel Watson <ozzloy@each.do>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 8:22=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Tue, Nov 26, 2024 at 06:57:20PM -0800, Yuanchu Xie wrote:
> > diff --git a/mm/internal.h b/mm/internal.h
> > index 64c2eb0b160e..bbd3c1501bac 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -470,9 +470,14 @@ extern unsigned long highest_memmap_pfn;
> >  /*
> >   * in mm/vmscan.c:
> >   */
> > +struct scan_control;
> > +bool isolate_lru_page(struct page *page);
>
> Is this a mismerge?  It doesn't exist any more.
Yes this is a mismerge. I'll fix it in the next version.
