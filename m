Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C6D1482E8
	for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2024 23:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718406972; cv=none; b=LJBBMMqdskEYXTZAfjvl4HIuvgRHuLLnWkcAZjEcQ6PjlbVE4Otl5AHy/iFlfm5AOxZF4dbOLIf+81hTgBrI1PrfS88ZW3A/4TXVq4uH/TxM2H0o/wFFq1YKRd5PLFv42Unl9zAubRIx9Q4TBGb/+sQCLMJbSi9MEEIbDdsExT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718406972; c=relaxed/simple;
	bh=1PXiu3XyrGn6eioRMQi+2p0r/15GuzVsN093zgKL+z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRak18Ofc2rigaWnCxgeho+2+5Yqb9SzovV8BmlFF1kOPgOQFmeWQ2lcxi8KdaCaUPUrEk9ILRYzhfIWCg+XZdhDkTcZn1mQHQD/E8ddLLu3heUkvOEAxCLSJxqtBCIUc9G11/nJZ7ethrMNWFIgygpEIq+4yVZ1BsmrnnxeBIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WEIlC0cb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WEIlC0cb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-35f0d6255bdso2398486f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2024 16:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718406969; x=1719011769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LahH6YvliG7eYlUbvikNbUEjbap7UqWjJYCEVPQs1io=;
        b=WEIlC0cbjlsU29zG3suUH6LAoVVZBEU9a+RoHqxwLlF9WMXTCvBWjj1O+m4cr+MgF3
         NSR+KXgyc8tId+UVSbfEIa9SxnD37TvpMnLBEGjDioXbj014iJ6P97MiaV51zK3EE3gi
         mW4zpXDK3IVxEi7JhHUS8gCaqWE4hcrLMc2Q9sYOonHEgYT01uvld8OA0wIFpokNwGEm
         lZBuJmyS2RAGZpBRRngt5hMaONIkjxYiyrViMmnv7j/b2rCD4qfyyJHEZFZM2qCp7BHd
         fXv4ZhJ1cn/uE26Le/5pQG4vfkxEh4lRI2RXkYeihAMRDLHKp5pLVU7EdiGS4UkeNO8m
         W2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718406969; x=1719011769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LahH6YvliG7eYlUbvikNbUEjbap7UqWjJYCEVPQs1io=;
        b=st+t2gzOprOIcF7KmYTXyEXhwdMaj4c/GuOPh+SZSdxbtCgmounTbCFFZn4AR6gCaO
         UMQX2+mS/cRluZrMiBQxhVWVD3TB+nl54i2ZSy+Pxfxb6Ds58XBBXGHgBBGi4EXURFB/
         oeu2l5PotipQgfT56sEAFY2CBRdbSxR2l1BE7cU9QtZUNqs1bROiTicaT45F+s6M5uaZ
         7DFkSjRhvx/pB9SD1ZMCwlR8G+qYfcxl+4MhA8vlJx1SWN7XRTN+tZwqFACF5RdIZK/j
         aQjuZLQ78N0bAAeP7s5dyeDGDUozVBHiYhcBfEUQHtahSm6ZsJ66mb/7Vbw0xPeB5yCT
         uvDw==
X-Forwarded-Encrypted: i=1; AJvYcCWH7HhxqSFCQxu2uo/32Ib6cHL5fgZf2wyIn4LtHDJs6m3cKe5peVsj9OgJFvSyo3mMS1tOx8d8g+4cpZsp5zaHNvbTmk1rD+H/
X-Gm-Message-State: AOJu0YxiBCJN/VzALkc9g0h5lnnAq6wvI8m+AxU4i9gKgXEdnrdMBxqp
	WHJ6YExi4+uxVdMOqzMLF2eFoDId3OVZEjHxguRjUR7k+Ug9/OxcBw4MUTCoYW//o0gGEUMKZpI
	6XwW/Dsa6R7MpfeZ/qi+swTXIpv2myLutyQ2H
X-Google-Smtp-Source: AGHT+IGSGeWdWrHeyLBhi8ahJUOIBOV4p81XB0K8UtbxXZp0W1Hbsh5/A+lYxE2gXbWBKN4sXqq0XRi16MlYhpjbjow=
X-Received: by 2002:a05:6000:4583:b0:360:8768:8dda with SMTP id
 ffacd0b85a97d-36087688e20mr695294f8f.7.1718406968805; Fri, 14 Jun 2024
 16:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611215544.2105970-1-jiaqiyan@google.com> <20240611215544.2105970-4-jiaqiyan@google.com>
 <9461874d-e2d6-25fc-813c-9c9bb0ad1aec@google.com>
In-Reply-To: <9461874d-e2d6-25fc-813c-9c9bb0ad1aec@google.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Fri, 14 Jun 2024 16:15:56 -0700
Message-ID: <CACw3F525-4w9N5wSVrbTnSz=g=4SxvXD=dWL9nsf1iQuaYj8OQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs: mm: add enable_soft_offline sysctl
To: David Rientjes <rientjes@google.com>
Cc: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com, 
	muchun.song@linux.dev, akpm@linux-foundation.org, shuah@kernel.org, 
	corbet@lwn.net, osalvador@suse.de, duenwen@google.com, fvdl@google.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Lance Yang <ioworker0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your questions, David!

On Tue, Jun 11, 2024 at 5:25=E2=80=AFPM David Rientjes <rientjes@google.com=
> wrote:
>
> On Tue, 11 Jun 2024, Jiaqi Yan wrote:
>
> > @@ -267,6 +268,20 @@ used::
> >  These are informational only.  They do not mean that anything is wrong
> >  with your system.  To disable them, echo 4 (bit 2) into drop_caches.
> >
> > +enable_soft_offline
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Control whether to soft offline memory pages that have (excessive) cor=
rectable
> > +memory errors.  It is your call to choose between reliability (stay aw=
ay from
> > +fragile physical memory) vs performance (brought by HugeTLB or transpa=
rent
> > +hugepages).
> > +
>
> Could you expand upon the relevance of HugeTLB or THP in this
> documentation?  I understand the need in some cases to soft offline memor=
y
> after a number of correctable memory errors, but it's not clear how the
> performance implications plays into this.  The paragraph below goes into =
a

To be accurate, I should say soft offlining transparent hugepage
impacts performance, and soft offlining hugetlb hugepage impacts
capacity. It may be clearer to first explain soft-offline's behaviors
and implications, so that user knows what is the cost of soft-offline,
then talks about the behavior of enable_soft_offline:

  Correctable memory errors are very common on servers. Soft-offline is ker=
nel's
  handling for memory pages having (excessive) corrected memory errors.

  For different types of page, soft-offline has different behaviors / costs=
.
  - For a raw error page, soft-offline migrates the in-use page's content t=
o
    a new raw page.
  - For a page that is part of a transparent hugepage, soft-offline splits =
the
    transparent hugepage into raw pages, then migrates only the raw error p=
age.
    As a result, user is transparently backed by 1 less hugepage, impacting
    memory access performance.
  - For a page that is part of a HugeTLB hugepage, soft-offline first migra=
tes
    the entire HugeTLB hugepage, during which a free hugepage will be consu=
med
    as migration target. Then the original hugepage is dissolved into raw
    pages without compensation, reducing the capacity of the HugeTLB pool b=
y 1.

  It is user's call to choose between reliability (staying away from fragil=
e
  physical memory) vs performance / capacity implications in transparent an=
d
  HugeTLB cases.

> difference in the splitting behavior, are hugepage users the only ones
> that should be concerned with this?

If the cost of migrating a raw page is negligible, then yes, only
hugepage users should be concerned and think about should they disable
soft offline.

>
> > +When setting to 1, kernel attempts to soft offline the page when it th=
inks
> > +needed.  For in-use page, page content will be migrated to a new page.=
  If
> > +the oringinal hugepage is a HugeTLB hugepage, regardless of in-use or =
free,
>
> s/oringinal/original/

To fix in v3.

>
> > +it will be dissolved into raw pages, and the capacity of the HugeTLB p=
ool
> > +will reduce by 1.  If the original hugepage is a transparent hugepage,=
 it
> > +will be split into raw pages.  When setting to 0, kernel won't attempt=
 to
> > +soft offline the page.  Its default value is 1.
> >
>
> This behavior is the same for all architectures?
>

Yes, enable_soft_offline has the same behavior for all architectures,
and default=3D1.

It may be worth mentioning that setting enable_soft_offline to 0 means:
- If RAS Correctable Errors Collector is running, its request to soft
offline pages will be ignored.
- On ARM, the request to soft offline pages from GHES driver will be ignore=
d.
- On PARISC, the request to soft offline pages from Page Deallocation
Table will be ignored.

I can add these clarifications in v3 if they are valuable.
