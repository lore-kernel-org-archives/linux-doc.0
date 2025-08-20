Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1F2322A1F
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705392; cv=none; b=u1rnn0MB3pDtzJnTRDwHFhatnRPEGM5jQ8uEH49mp9e8rlrKNCV07DnwrACgJaAupdzKZ0np5Mh6AUulv5f5apnL7t0RoXyX6PXMWPR5L+QMk12MOfjOlz4gjGpfm04rOhlMSuriMyf/EA5sPchgi8E87zR/uPVy8Zg6POLw0Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705392; c=relaxed/simple;
	bh=R+Ptmzm6SrCTWJS8/j0R6UkbUGMTtTE9b9TRKD7b9iA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJeCgPp8AXOlW7xrKwmYe/562BJSdqKTizmiT7LAdCdcwm/tLCOth2xcKRMtkbAVOZg8a8Lgq9vgD9lYgoTgkFdcTx9jGRNqV2+w7Bqt3Qgm1n8TxDWNl0axKxkLzr3GMEXZ7VTkNmwkujIrFFvX3ro33ilqWYXUZYACglfGiXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jr8kR2vB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jr8kR2vB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755705389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Er23qODQtG4idaztLuSjwC5wmfZWAF3dygpF7gAo74Q=;
	b=Jr8kR2vBtkk4kjC+WWecZDE61nmX+6qOd//LxIfBNxxOZvAQUzgZQp11f4TIS9zwuAcV3m
	SwtLkJvj8WF8CKie8eg8Sgo0dN+up5wywpHHaGpSc3enPQHA8Yfuo8O25qH0F+XUCF8qYh
	lYwBC0dX/MMOvUUxhnIXRx3dXCie7tc=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-91_swXnSM3m-Bs-EDQFYGg-1; Wed, 20 Aug 2025 11:56:23 -0400
X-MC-Unique: 91_swXnSM3m-Bs-EDQFYGg-1
X-Mimecast-MFC-AGG-ID: 91_swXnSM3m-Bs-EDQFYGg_1755705383
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-71d4cc7fa4fso18541897b3.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 08:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755705383; x=1756310183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Er23qODQtG4idaztLuSjwC5wmfZWAF3dygpF7gAo74Q=;
        b=FrJGMLOP0TqI+kRBqwCfKpj5aPaFBk7iDxz933lS6rEmxHtDt27ouKsQjIDkgJEhHy
         LjVk8sFhTa7V83dBbyeD3LGUCJIq7IFQqQWj4I9arV0mXL17TCCFoB9wazFKKvwWiJos
         psZVIgzwmptu0cHpQTnf9KeZYy43hr+kJ3jIhnyzP5f3uDW3M89NmugSexRpd2uQf6FT
         okJKaLnJycraXZadYX1Qc8Jh5uJso7lZr8xJ5RhEkGiR7GHXMBU2wOgzw4xIlh6t7HrM
         7CpYmWvflM1EmwZYlmgdWfIq1GN4owc6IjH2VsYh0c+fw9z+HOrFz3xNJjjYFYPTCVs4
         bk6A==
X-Forwarded-Encrypted: i=1; AJvYcCWTav7Z5nt8OWzkNbEFSvjljFeryXicYFucj834IrbqvcqXJKQB5KXAzJ9aAKvt3PVfubyLY47UWNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEq9YU+U4UAcuic0EjprYfaipEoDlpvTp2n7MssNKPKwx9Jy84
	pQJyZybXlAG6cw6wPskg9h0YfOY9TCbKt5PKbHsXSZ3qEoPbYooAxXOO42u0AVDfKm6uqAa+G71
	mGgqZ+gmLvkGL6MEAdkIo/WMImjS/GKH2JML7uUZ0UrNawboJp4/jghgZHQ94LiGPWDGzKaJFeU
	yJZUbmf5/uBJUTGWPIqcQ4bOqXUXXAJWLi+vCt
X-Gm-Gg: ASbGncuM65gwOvE8u3COKPhAgKx9M7j32+BInp4F9E7BuLaoy6yD0jOzdolsHS4aas/
	J6/kTWkj6dmwUr2COmok1QeBj+3Y20I4WEjA9JDMZa7nKEdeZ4QtlQbEQniNsjstHYeondvqTmB
	yQPQ8b0RnzqOSoU/+JIS4nKxM=
X-Received: by 2002:a05:6902:2b85:b0:e94:fc8c:e1f6 with SMTP id 3f1490d57ef6-e950485820fmr101983276.5.1755705382668;
        Wed, 20 Aug 2025 08:56:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS+QnZtdkkS1vjc4OhO99gWxx/B53oOwhGsZXtA1ANwD9WwiLwFVxw4OYIIrLt4QKiuxs/inUSPFs93SI8/Kk=
X-Received: by 2002:a05:6902:2b85:b0:e94:fc8c:e1f6 with SMTP id
 3f1490d57ef6-e950485820fmr101964276.5.1755705382248; Wed, 20 Aug 2025
 08:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819134205.622806-1-npache@redhat.com> <20250819145530.243e02184b743eb9ec506856@linux-foundation.org>
In-Reply-To: <20250819145530.243e02184b743eb9ec506856@linux-foundation.org>
From: Nico Pache <npache@redhat.com>
Date: Wed, 20 Aug 2025 09:55:56 -0600
X-Gm-Features: Ac12FXzgXuKDwPVbATQMmVh6NLWeMMDQC0r_rrDLYa5BGBJGyBVrKKAptFCfllU
Message-ID: <CAA1CXcDpRywoWKXyoJPBgs0TCbENooQsj+hDzYVhP4eYsiiFJw@mail.gmail.com>
Subject: Re: [PATCH v10 00/13] khugepaged: mTHP support
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, baohua@kernel.org, willy@infradead.org, 
	peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com, 
	sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, hughd@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 3:55=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Tue, 19 Aug 2025 07:41:52 -0600 Nico Pache <npache@redhat.com> wrote:
>
> > The following series provides khugepaged with the capability to collaps=
e
> > anonymous memory regions to mTHPs.
> >
> > ...
> >
> > - I created a test script that I used to push khugepaged to its limits
> >    while monitoring a number of stats and tracepoints. The code is
> >    available here[1] (Run in legacy mode for these changes and set mthp
> >    sizes to inherit)
>
> Could this be turned into something in tools/testing/selftests/mm/?
Yep! I was actually working on some selftests for this before I hit a
weird bug during some of my testing, which took precedence over that.

I was planning on sending a separate series for the testing. One of
the pain points was that selftests helpers were set up for PMDs, but I
think Baolin just cleaned that up in his khugepaged mTHP shmem series
(still need to review). So it should be a lot easier to implement now.
>
> > V10 Changes:
>
> I'll add this to mm-new, thanks.  I'll suppress the usual emails.
Thank you :)
-- Nico
>

