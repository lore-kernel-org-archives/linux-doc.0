Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06C38BFF
	for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 00:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737420983; cv=none; b=bu71PqTzqt/XUq0TgzFG1o/tx+V4PKKh9oqYYANd97ki0P1h/B6zrIwOMFT4Ki6PvpRMXtGerfvSLB4S+iNwtYx56DHerZW4C1h0S/sXlGP5leVHta+a/mMImU6EPW6ryR/7yY9NsKTrq+o+QneFroZdavG5Qxi8udZWQ5UFYSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737420983; c=relaxed/simple;
	bh=Xfmaq6cagEVfDNV3kKp346BuPXIGhEvrTyMYA7kMCG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=urlu15S2cWwbHXJnvqfwyvEhQ39OkdXL9zeGDu5OSAdM39Q2UqJ99tJKfy6W9Akxp+MvSQzfc8xTqQysqIPdruuhjhDcGuox+D62DJpVzGtWVcsySRuX12YSizmBMV8AByVof+rOYU5wQIDpAgoR17H1m+NrpeYaLRmzO4j0b/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CVA0ATSE; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CVA0ATSE"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250121005612epoutp0457ba39fcbb5521ec3eccb7d5e367f3b0~cjyttJMlJ0125201252epoutp04X
	for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 00:56:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250121005612epoutp0457ba39fcbb5521ec3eccb7d5e367f3b0~cjyttJMlJ0125201252epoutp04X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1737420972;
	bh=T3FJLsTnpKvKuV3f28huVnQSKvVZSaEFGX8fAg7Y/Cc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CVA0ATSEf/wpC9p8POfU81DpC5SMlwXPp9tL84UIV6kwh9+7pj03suUxsjhvr9btR
	 y6avz4eJPWZiIxZ0KjxBUMeT9nbVci5mKAHPEQn2ul4k5j+FyAchymJp9HgLLjMPyp
	 aHvC3Efc1j5TIw2bOQg/p4z2F+5rmnZl/Tqqxdo8=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20250121005612epcas2p2a9b1c18e9152babfa1745360b573ed71~cjys-kt6E2212922129epcas2p2h;
	Tue, 21 Jan 2025 00:56:12 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4YcTKl3Rfbz4x9QN; Tue, 21 Jan
	2025 00:56:11 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	E0.8B.22094.BA0FE876; Tue, 21 Jan 2025 09:56:11 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250121005610epcas2p403c258212557f8660fe5f8a8221399c1~cjyrYUOGl2420824208epcas2p4V;
	Tue, 21 Jan 2025 00:56:10 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250121005610epsmtrp2f01daa645291984f97ea5b2374378dd0~cjyrWWIN31625416254epsmtrp2_;
	Tue, 21 Jan 2025 00:56:10 +0000 (GMT)
X-AuditID: b6c32a46-484397000000564e-95-678ef0ab2bb9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	C7.64.18949.AA0FE876; Tue, 21 Jan 2025 09:56:10 +0900 (KST)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250121005610epsmtip23d8b7caab7f6a5209eab12d02e4883da~cjyrK1TUT1764517645epsmtip2Z;
	Tue, 21 Jan 2025 00:56:10 +0000 (GMT)
Date: Tue, 21 Jan 2025 09:54:52 +0900
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc: janghyuck.kim@samsung.com, Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Christoph Lameter <cl@linux.com>, Pekka
	Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo
	Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>, Roman
	Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: slub: Panic if the object corruption is checked.
Message-ID: <20250121005452.GB610565@tiffany>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAB=+i9R-9LQWJFGSJJ5dUqwkoFQK8VDxEwi-4Sb73pTP+xw+wQ@mail.gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMJsWRmVeSWpSXmKPExsWy7bCmhe7qD33pBp8WilhM7DGwmLN+DZvF
	9W9vGC2eHGhntFjZ3cxmsXlOscXCtiUsFpd3zWGzuLfmP6tF2+d/QGLJRiaLiWtELWY39jE6
	8HrsnHWX3WPBplKPTas62Tw2fZrE7tH19gqTx4kZv1k8nlyZzuSxsGEqs8fivsmsHn1bVjF6
	nFlwhN3j8ya5AJ6obJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUX
	nwBdt8wcoB+UFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmp
	JVaGBgZGpkCFCdkZizumMBYcNKrYu/ICYwPjS5UuRk4OCQETiT+HtjGC2EICOxglbq9i7mLk
	ArI/MUrM2TcHyvnGKPH380FGmI5JDV+hOvYySnR1OUAUPWWUOP7sNViCRUBVYvO8acwgNpuA
	usSJLcvA4iJA9pLbc1lBGpgF5jNLzDy7lh0kISzgKbHq/QqgBAcHr4CuREs7G0iYV0BQ4uTM
	JywgNqdAoMS/g5uYQHolBG5wSGzp62GCuMhF4umzF1DXCUu8Or6FHcKWkvj8bi8bhF0ssW3x
	YajmBkaJzR33mSESxhKznrWDNTMLZEo8uv+aCeQICQFliSO3WCDCfBIdh/+yQ4R5JTrahCA6
	lSX2L5vHAmFLSjxa284KYXtIvJ71hQUSKNcZJTbM62CawCg3C8k/s5BsmwU0lllAU2L9Ln2I
	sLxE89bZzBBhaYnl/ziQVCxgZFvFKJZaUJybnlpsVGAEj+vk/NxNjODUreW2g3HK2w96hxiZ
	OBgPMUpwMCuJ8Ip+6EkX4k1JrKxKLcqPLyrNSS0+xGgKjKeJzFKiyfnA7JFXEm9oYmlgYmZm
	aG5kamCuJM5bvaMlXUggPbEkNTs1tSC1CKaPiYNTqoHJ4cfXojfpzy9pvjPVa6mxmrpfL8tO
	U202J4tZ0uzT/QXXZugUPLpaUPB+hW95UK6Zm/F55Wdr9FrndNhn2T7jEOWZYbX3pfqHX81W
	ZnvX7Glwqbs3kTFdfe6aBTNa8o4e/mZzpNLzS5qeja72LO13if03vhxP/yZ4qz8u97WG5Zm+
	6voWtx+qxW53a+5V8TDUBpjue+Hxz6MlW3zmn0dPHqV0T1A+stfpeLt3wBSFj+/bV9enHOne
	ZjwxKfj91pQVYTui5i9syb83ydBfTl5+dWnmJv7kzn0Wu7jWX+q8nzNf2uqj6rZje0y3eny3
	zK8wiBJ/etyt8qHlq9t3lVclXOdQeck382fOT8GwqNVKLMUZiYZazEXFiQDn9ZCjZgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSvO6qD33pBn37RSwm9hhYzFm/hs3i
	+rc3jBZPDrQzWqzsbmaz2Dyn2GJh2xIWi8u75rBZ3Fvzn9Wi7fM/ILFkI5PFxDWiFrMb+xgd
	eD12zrrL7rFgU6nHplWdbB6bPk1i9+h6e4XJ48SM3yweT65MZ/JY2DCV2WNx32RWj74tqxg9
	ziw4wu7xeZNcAE8Ul01Kak5mWWqRvl0CV8aL5gfMBQ/0K55uX8LUwLhEqYuRk0NCwERiUsNX
	RhBbSGA3o8TnI3oQcUmJWZ9PMkHYwhL3W46wdjFyAdU8ZpSY8uA+G0iCRUBVYvO8acwgNpuA
	usSJLcvABokA2UtuzwVrYBZYzCzRtX47O0hCWMBTYtX7FUAJDg5eAV2JlnY2iKHXGSWu33jK
	ClLDKyAocXLmExYQmxlo0J95l5hB6pkFpCWW/+OACMtLNG+dDbaXUyBQ4t/BTUwTGAVnIeme
	haR7FkL3LCTdCxhZVjFKphYU56bnFhsWGOWllusVJ+YWl+al6yXn525iBEelltYOxj2rPugd
	YmTiYDzEKMHBrCTCK/qhJ12INyWxsiq1KD++qDQntfgQozQHi5I477fXvSlCAumJJanZqakF
	qUUwWSYOTqkGJpu93/c3xnRcTHl8V9dT7hHjDbMbXJ3l7bdqRBo3nK9JFxEWurXhXeKmg2sc
	vsnfSt/E/3rVlZn8Cunu+nu9w5y4Lv7gUHjJrrfXuFC0Skfo+lrmMibrFxwCD2c//rSZP2uD
	9gWZaZVuO9oWvDUxYbnnGLntiEbn3nmvAlcLWYdMeL+z8ZuzkvujHJNOzoPP2/+p6N0suaFQ
	anuvc2+Dr5pN1aXvW2N8mGfyGkXnbV0Xt/C9j2r9bo3vGw1Lzz9JYpnxrqFsWgYPQxNvs/xm
	Fc8D1X9tl3TdMLnNJ+ioEau86/V1YekvOrPXby27ef67vcNh1+28rQ339v09mnSQ/dqj6xG6
	jotFPkYeu7U6X4mlOCPRUIu5qDgRACWT+rs5AwAA
X-CMS-MailID: 20250121005610epcas2p403c258212557f8660fe5f8a8221399c1
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----towzVgSuTVdusMkY7C8F0FOQR20F6gGzFb5zsZ2iSfPj18ga=_2a5a57_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250120083041epcas2p30d61ee801c1db5a7ebdf26fdc642883f
References: <CGME20250120083041epcas2p30d61ee801c1db5a7ebdf26fdc642883f@epcas2p3.samsung.com>
	<20250120082908.4162780-1-hyesoo.yu@samsung.com>
	<CAB=+i9R-9LQWJFGSJJ5dUqwkoFQK8VDxEwi-4Sb73pTP+xw+wQ@mail.gmail.com>

------towzVgSuTVdusMkY7C8F0FOQR20F6gGzFb5zsZ2iSfPj18ga=_2a5a57_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Tue, Jan 21, 2025 at 12:41:01AM +0900, Hyeonggon Yoo wrote:
> On Mon, Jan 20, 2025 at 5:30 PM Hyesoo Yu <hyesoo.yu@samsung.com> wrote:
> >
> > If a slab object is corrupted or an error occurs in its internal
> > value, continuing after restoration may cause other side effects.
> > At this point, it is difficult to debug because the problem occurred
> > in the past. A flag has been added that can cause a panic when there
> > is a problem with the object.
> 
> Hi Hyesoo,
> 
> I'm concerned about this because it goes against the effort to avoid
> introducing new BUG() calls [1].
> 
> And I think it would be more appropriate to use existing panic_on_warn
> functionality [2] which causes
> a panic on WARN(), rather than introducing a SLUB-specific knob to do
> the same thing.
> 
> However SLUB does not call WARN() and uses pr_err() instead when
> reporting an error.
> Vlastimil and I talked about changing it to use WARN() a while ago
> [3], but neither of us
> have done that yet.
> 
> Probably you may want to look at it, as it also aligns with your purpose?
> FYI, if you would like to work on it, please make sure that it WARN()
> is suppressed during kunit test.
> 
> [1] https://docs.kernel.org/process/deprecated.html#bug-and-bug-on
> [2] https://www.kernel.org/doc/html/v6.9/admin-guide/sysctl/kernel.html#panic-on-warn
> [3] https://lore.kernel.org/linux-mm/d4219cd9-32d3-4697-93b9-6a44bf77d50c@suse.cz
> 
> Best,
> Hyeonggon

Thanks for response.

Using warn() instead of panic, is a great idea.
Thanks for pointing out what I missed.

The next patch will be changed to use warn().

Thanks.

> 
> > Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> > Change-Id: I4e7e5e0ec3421a7f6c84d591db052f79d3775493
> > ---
> >  Documentation/mm/slub.rst |  2 ++
> >  include/linux/slab.h      |  4 ++++
> >  mm/slub.c                 | 14 ++++++++++++++
> >  3 files changed, 20 insertions(+)
> >
> > diff --git a/Documentation/mm/slub.rst b/Documentation/mm/slub.rst
> > index 84ca1dc94e5e..ce58525db93d 100644
> > --- a/Documentation/mm/slub.rst
> > +++ b/Documentation/mm/slub.rst
> > @@ -53,6 +53,7 @@ Possible debug options are::
> >         U               User tracking (free and alloc)
> >         T               Trace (please only use on single slabs)
> >         A               Enable failslab filter mark for the cache
> > +       C               Panic if object corruption is checked.
> >         O               Switch debugging off for caches that would have
> >                         caused higher minimum slab orders
> >         -               Switch all debugging off (useful if the kernel is
> > @@ -113,6 +114,7 @@ options from the ``slab_debug`` parameter translate to the following files::
> >         U       store_user
> >         T       trace
> >         A       failslab
> > +       C       corruption_panic
> >
> >  failslab file is writable, so writing 1 or 0 will enable or disable
> >  the option at runtime. Write returns -EINVAL if cache is an alias.
> > diff --git a/include/linux/slab.h b/include/linux/slab.h
> > index 10a971c2bde3..4391c30564d6 100644
> > --- a/include/linux/slab.h
> > +++ b/include/linux/slab.h
> > @@ -31,6 +31,7 @@ enum _slab_flag_bits {
> >         _SLAB_CACHE_DMA32,
> >         _SLAB_STORE_USER,
> >         _SLAB_PANIC,
> > +       _SLAB_CORRUPTION_PANIC,
> >         _SLAB_TYPESAFE_BY_RCU,
> >         _SLAB_TRACE,
> >  #ifdef CONFIG_DEBUG_OBJECTS
> > @@ -97,6 +98,9 @@ enum _slab_flag_bits {
> >  #define SLAB_STORE_USER                __SLAB_FLAG_BIT(_SLAB_STORE_USER)
> >  /* Panic if kmem_cache_create() fails */
> >  #define SLAB_PANIC             __SLAB_FLAG_BIT(_SLAB_PANIC)
> > +/* Panic if object corruption is checked */
> > +#define SLAB_CORRUPTION_PANIC  __SLAB_FLAG_BIT(_SLAB_CORRUPTION_PANIC)
> > +
> >  /**
> >   * define SLAB_TYPESAFE_BY_RCU - **WARNING** READ THIS!
> >   *
> > diff --git a/mm/slub.c b/mm/slub.c
> > index 48cefc969480..36a8dabf1349 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -1306,6 +1306,8 @@ slab_pad_check(struct kmem_cache *s, struct slab *slab)
> >                         fault, end - 1, fault - start);
> >         print_section(KERN_ERR, "Padding ", pad, remainder);
> >
> > +       BUG_ON(s->flags & SLAB_CORRUPTION_PANIC);
> > +
> >         restore_bytes(s, "slab padding", POISON_INUSE, fault, end);
> >  }
> >
> > @@ -1389,6 +1391,8 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
> >         if (!ret && !slab_in_kunit_test()) {
> >                 print_trailer(s, slab, object);
> >                 add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
> > +
> > +               BUG_ON(s->flags & SLAB_CORRUPTION_PANIC);
> >         }
> >
> >         return ret;
> > @@ -1689,6 +1693,9 @@ parse_slub_debug_flags(char *str, slab_flags_t *flags, char **slabs, bool init)
> >                 case 'a':
> >                         *flags |= SLAB_FAILSLAB;
> >                         break;
> > +               case 'c':
> > +                       *flags |= SLAB_CORRUPTION_PANIC;
> > +                       break;
> >                 case 'o':
> >                         /*
> >                          * Avoid enabling debugging on caches if its minimum
> > @@ -6874,6 +6881,12 @@ static ssize_t store_user_show(struct kmem_cache *s, char *buf)
> >
> >  SLAB_ATTR_RO(store_user);
> >
> > +static ssize_t corruption_panic_show(struct kmem_cache *s, char *buf)
> > +{
> > +       return sysfs_emit(buf, "%d\n", !!(s->flags & SLAB_CORRUPTION_PANIC));
> > +}
> > +SLAB_ATTR_RO(corruption_panic);
> > +
> >  static ssize_t validate_show(struct kmem_cache *s, char *buf)
> >  {
> >         return 0;
> > @@ -7092,6 +7105,7 @@ static struct attribute *slab_attrs[] = {
> >         &red_zone_attr.attr,
> >         &poison_attr.attr,
> >         &store_user_attr.attr,
> > +       &corruption_panic_attr.attr,
> >         &validate_attr.attr,
> >  #endif
> >  #ifdef CONFIG_ZONE_DMA
> > --
> > 2.48.0
> >
> 

------towzVgSuTVdusMkY7C8F0FOQR20F6gGzFb5zsZ2iSfPj18ga=_2a5a57_
Content-Type: text/plain; charset="utf-8"


------towzVgSuTVdusMkY7C8F0FOQR20F6gGzFb5zsZ2iSfPj18ga=_2a5a57_--
