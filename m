Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E2F219EA0
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 19:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739820687; cv=none; b=UV+iSky8ApkQGc81a2qZxzoc2QrYbuj8Z+Lz7lBf7jy2Qcsa7TgtH9uoWU+nGsKy80iOfQxetX3plZCUdOeycvVpo2XmIjknGm8L0uQWdUbbSEcrZJ/NR012PNB7X5FLUYYxznnKl6UU/9TLErMtkXD8bchWN3yCu8+5zvuj/Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739820687; c=relaxed/simple;
	bh=x6hERZPuvEmfCqwjlTvlO6TY6uNufA0NZpWRreTwNxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXtxJvZIAH5qbJoZ99D0TA09/f4nlyilU5sQEXttZR3E0GB0pF5bV6CUsL9SwBS6/RtmtJFZAzJtSqee/CWpH99KvQOunTiM+CPx+auWO4B+JYIKq6DEnsceWqZsQFMdrTUEG/aHCRIjH/d9Ivhqo+NBVFIGKC8JYjF30GXhTHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M49zP0zO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M49zP0zO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739820684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NX4hyJJY5LUfgHjXwSqyXtyBfsL13pYnI0Mr0EfX7HY=;
	b=M49zP0zOWk3dtgtj4eUXA14lzo49TnurH6xGZHg347btF4lhhaAkrfY0zd74qaP7OzLrfU
	fSoRv3N8nIfc6BSBaI5zfKOX88bq07tvIwkj9LvAt+MXdvXBmWjNPvm9KSrLhIc2ufcLBL
	eV9NoAciUmTi72chvHlPsemjlSCsZWc=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-WBWYyIOaOyCv6Wo3e1Xilw-1; Mon, 17 Feb 2025 14:31:22 -0500
X-MC-Unique: WBWYyIOaOyCv6Wo3e1Xilw-1
X-Mimecast-MFC-AGG-ID: WBWYyIOaOyCv6Wo3e1Xilw_1739820682
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-6fb64251262so24054087b3.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 11:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739820682; x=1740425482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NX4hyJJY5LUfgHjXwSqyXtyBfsL13pYnI0Mr0EfX7HY=;
        b=byphYYZbVdjq5YlVbGHGzXemgtELWNUiWzZ63YjdQbqiJaLz6zLSitd5nwEYKMeBNU
         clCl0S+AUaJ+PDs3SSZseBervy3CqfqYeDh7PL0iXv0uq69bRNJNSw+/kw7IgnFI6LkY
         QbETrBQ9tbA7VhcO9oKnNmEjSHvKLK+jzOp3w5+3iBoWmpuF7OTWtj0NqgVIlRwhgn7N
         Lh6pMR0VOLB4SGTnUqvhntkJNq+bEirAhEEfHgWz4k0nc/DZmj3giRrZO+7zarDkje94
         Ro/0fdHkuXPJbfPih2n7L2JMGnJsjoHuujJKuZAbYBkcOQLtpiNb/LDQvnmYDDPOuzYr
         xV+w==
X-Forwarded-Encrypted: i=1; AJvYcCVqigDLug+idQs3YrLKIL2acWJN3UWjU4LS0hsG8sUzmuMLWmQZTquiK1R9lubwU/uX9IsQYXXVdN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjrHRfctlWLL4vfbWc+sbO1B/N4N/cyLvEA85KuHy5IK9uSt3N
	UuLSCOkldf5t3HhTlewj+M04ueusQsS7VaOhR1VeaqEEaUGr8DfV3L7sgKjDZ+zHEQHmTBNSXB2
	0Fkx/pdjwskhN2BKU45ucPtIYcc/PPxH0QaKzwp3257MGJiKfZIOsFDOGxYaA6OSNpAFRmZ1N0Y
	lym3uUU3RWrGfeDqI6ESK6AwcL+qovucX4
X-Gm-Gg: ASbGncunXXg9lXb6FbVj00VCEy6i+/b/HD73pnpgiI/xTNwMcbM2/Nk9kebSnmwWvPQ
	DZoyU0ykgLDdaNM66zFpCTgyaKA6YuKJFS64MOix90/uWx08fF2WniAQ1T6eAsKd9LNoAxIK/h0
	E=
X-Received: by 2002:a05:6902:3486:b0:e5a:e6eb:d44f with SMTP id 3f1490d57ef6-e5dc900e998mr8015118276.6.1739820682088;
        Mon, 17 Feb 2025 11:31:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcDB0O4ITkNRkvRI81tFyLe3JFpMxEjsoT5YAFRkQrsXxl/3FtA6FECS+cW2MojiNPdBeyZA0rbetrrR9AAYw=
X-Received: by 2002:a05:6902:3486:b0:e5a:e6eb:d44f with SMTP id
 3f1490d57ef6-e5dc900e998mr8015078276.6.1739820681801; Mon, 17 Feb 2025
 11:31:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211004054.222931-1-npache@redhat.com> <20250211004054.222931-3-npache@redhat.com>
 <c408c854-134b-4758-931f-e6e3b7a58213@gmail.com>
In-Reply-To: <c408c854-134b-4758-931f-e6e3b7a58213@gmail.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 17 Feb 2025 12:30:56 -0700
X-Gm-Features: AWEUYZkouadz-BzwdaTEV-k94b6IIL2-QD_uUEVTO5Cso96xfXhx8WXXPjrCpeI
Message-ID: <CAA1CXcDVdmVEQ+NMC6JZNCVqtkUKLs=L3aQaYtKMSP9N3HAM3w@mail.gmail.com>
Subject: Re: [RFC v2 2/5] mm: document transparent_hugepage=defer usage
To: Usama Arif <usamaarif642@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, cl@gentwo.org, 
	vbabka@suse.cz, mhocko@suse.com, apopple@nvidia.com, 
	dave.hansen@linux.intel.com, will@kernel.org, baohua@kernel.org, jack@suse.cz, 
	srivatsa@csail.mit.edu, haowenchao22@gmail.com, hughd@google.com, 
	aneesh.kumar@kernel.org, yang@os.amperecomputing.com, peterx@redhat.com, 
	ioworker0@gmail.com, wangkefeng.wang@huawei.com, ziy@nvidia.com, 
	jglisse@google.com, surenb@google.com, vishal.moola@gmail.com, 
	zokeefe@google.com, zhengqi.arch@bytedance.com, jhubbard@nvidia.com, 
	21cnbao@gmail.com, willy@infradead.org, kirill.shutemov@linux.intel.com, 
	david@redhat.com, aarcange@redhat.com, raquini@redhat.com, dev.jain@arm.com, 
	sunnanyong@huawei.com, audra@redhat.com, akpm@linux-foundation.org, 
	rostedt@goodmis.org, mathieu.desnoyers@efficios.com, tiwai@suse.de, 
	baolin.wang@linux.alibaba.com, corbet@lwn.net, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 8:04=E2=80=AFAM Usama Arif <usamaarif642@gmail.com>=
 wrote:
>
>
>
> On 11/02/2025 00:40, Nico Pache wrote:
> > The new transparent_hugepage=3Ddefer option allows for a more conservat=
ive
> > approach to THPs. Document its usage in the transhuge admin-guide.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  Documentation/admin-guide/mm/transhuge.rst | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation=
/admin-guide/mm/transhuge.rst
> > index dff8d5985f0f..b3b18573bbb4 100644
> > --- a/Documentation/admin-guide/mm/transhuge.rst
> > +++ b/Documentation/admin-guide/mm/transhuge.rst
> > @@ -88,8 +88,9 @@ In certain cases when hugepages are enabled system wi=
de, application
> >  may end up allocating more memory resources. An application may mmap a
> >  large region but only touch 1 byte of it, in that case a 2M page might
> >  be allocated instead of a 4k page for no good. This is why it's
> > -possible to disable hugepages system-wide and to only have them inside
> > -MADV_HUGEPAGE madvise regions.
> > +possible to disable hugepages system-wide, only have them inside
> > +MADV_HUGEPAGE madvise regions, or defer them away from the page fault
> > +handler to khugepaged.
> >
> >  Embedded systems should enable hugepages only inside madvise regions
> >  to eliminate any risk of wasting any precious byte of memory and to
> > @@ -99,6 +100,15 @@ Applications that gets a lot of benefit from hugepa=
ges and that don't
> >  risk to lose memory by using hugepages, should use
> >  madvise(MADV_HUGEPAGE) on their critical mmapped regions.
> >
> > +Applications that would like to benefit from THPs but would still like=
 a
> > +more memory conservative approach can choose 'defer'. This avoids
> > +inserting THPs at the page fault handler unless they are MADV_HUGEPAGE=
.
> > +Khugepaged will then scan the mappings for potential collapses into PM=
D
> > +sized pages. Admins using this the 'defer' setting should consider
> > +tweaking khugepaged/max_ptes_none. The current default of 511 may
> > +aggressively collapse your PTEs into PMDs. Lower this value to conserv=
e
> > +more memory (ie. max_ptes_none=3D64).
> > +
>
> maybe remove the "(ie. max_ptes_none=3D64)", its appearing as a recommend=
ation for
> the value, but it might not be optimal for different workloads.
>
> >  .. _thp_sysfs:
> >
> >  sysfs
> > @@ -136,6 +146,7 @@ The top-level setting (for use with "inherit") can =
be set by issuing
> >  one of the following commands::
> >
> >       echo always >/sys/kernel/mm/transparent_hugepage/enabled
> > +     echo defer >/sys/kernel/mm/transparent_hugepage/enabled
> >       echo madvise >/sys/kernel/mm/transparent_hugepage/enabled
> >       echo never >/sys/kernel/mm/transparent_hugepage/enabled
> >
> > @@ -274,7 +285,8 @@ of small pages into one large page::
> >  A higher value leads to use additional memory for programs.
> >  A lower value leads to gain less thp performance. Value of
> >  max_ptes_none can waste cpu time very little, you can
> > -ignore it.
> > +ignore it. Consider lowering this value when using
> > +``transparent_hugepage=3Ddefer``
>
> lowering this value even with thp=3Dalways makes sense, as there might be=
 cases
> when pf might not give a THP, but a VMA becomes eligable to scan via khug=
epaged
> later? I would remove this line.

Perhaps I should be more clear or create a different section for it.
The point was that defer was created to prevent internal fragmentation
and leave khugepaged to determine when a THP was "useful" (less
wasteful). But to achieve this less waste we should also not be using
the default.

Ideally I would want to change "always" to ignore max_ptes_none (acts
as max_ptes_none=3D511), and change the max_ptes_none default to 64 or
128. But that's a separate discussion that I didn't want detracting
from these postings.

>
> >
> >  ``max_ptes_swap`` specifies how many pages can be brought in from
> >  swap when collapsing a group of pages into a transparent huge page::
> > @@ -299,8 +311,8 @@ Boot parameters
> >
> >  You can change the sysfs boot time default for the top-level "enabled"
> >  control by passing the parameter ``transparent_hugepage=3Dalways`` or
> > -``transparent_hugepage=3Dmadvise`` or ``transparent_hugepage=3Dnever``=
 to the
> > -kernel command line.
> > +``transparent_hugepage=3Dmadvise`` or ``transparent_hugepage=3Ddefer``=
 or
> > +``transparent_hugepage=3Dnever`` to the kernel command line.
> >
> >  Alternatively, each supported anonymous THP size can be controlled by
> >  passing ``thp_anon=3D<size>[KMG],<size>[KMG]:<state>;<size>[KMG]-<size=
>[KMG]:<state>``,
>

