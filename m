Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DA735837E
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760894; cv=pass; b=n46pIGqrxHq451RI7qdhVKOxK1f69AM1HUofPyaAnhlwf/6XmrqYLCsOReB6bxOd5ulVevRsl7yqM9l5dkx3ggqz0lkxtVlE1L9eudkTyuA8D02HcRuodN+wKli1RRN6xc2JmkexpKT2vJACKKuZO4cYWPihIpkUcjFiPEUFQk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760894; c=relaxed/simple;
	bh=5gWD0q/49ZLsDRQhbUstsKZVTNK2YxdD0Bag7lPiTKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFnbubM9jf/D3BgHa5kmI9T35qCPu0Aa29M/SnZOxGJVQDWGEMxd26Z8hoV4r5aewF4wpi/JfuiNRupSBKvpM0SxQp4kX8H2/jnl8QIdvpRSrCqIKypVPfFFbH+NykYqInBVMCAce+3vkd5zAPwbnnMaTW1k6uQ+8iUUjlRpJps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AbL8eMy+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iAIv2fog; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AbL8eMy+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iAIv2fog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776760891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mC05YTc5SmuhQF/mCBd5RraHNHqhmq97LDEIrPY8QyQ=;
	b=AbL8eMy+FJQQ8Vx0AitvijyiKUsKAJqy4Yc2G69FD3lAU1f4hmXO2LHkK7uiV1BqzoVn+f
	sJ2dR9Yix/+oTLi01P3EiSkQVI5bppQIsEbD0X73yfJ2Rk5HcwiU80LUsDdDgBEXCL02NO
	kFTn1IrXuAdzl5p785kBLOQJmtvTzPA=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-4qW_cGDvOWyYUnjajYVtsw-1; Tue, 21 Apr 2026 04:41:30 -0400
X-MC-Unique: 4qW_cGDvOWyYUnjajYVtsw-1
X-Mimecast-MFC-AGG-ID: 4qW_cGDvOWyYUnjajYVtsw_1776760890
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7a3715e9e69so145849987b3.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 01:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776760890; cv=none;
        d=google.com; s=arc-20240605;
        b=R1M5R64egazpwiQzJDC9FexfL4OiaUEiF/+vuaWSgXFCb2VZk+OhfpFAo0Iv+osWtP
         nXwnAHbGta1K8QFau/gVH8lI9Er+3BNGrARJQ+zJexblQ+1lvmBcOZtLS9GM8d5UqMG8
         t/LYxB086/8ZlnaNJg4pVJyUG+8kCmTSLyheSYCY9EXZrZxyVEJm3YEU6kSc4jHbl+Tu
         Bhkqv4AOr6Vym70/uqTn+gXiNdBU5Vmp8ctP0zh+H8O+5SUWKQfMv1UCdqCYbGMJsEHX
         G3sBJh2oJf6hNu/SUota01Qst7DjK/jzXnl3bY44jqWe6MBK6FsFzJg5RBmClyJbLao/
         U1mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mC05YTc5SmuhQF/mCBd5RraHNHqhmq97LDEIrPY8QyQ=;
        fh=PgmxfnRI330FHWoX7i2VgW9R5Wc1qwo7tPcw8lutuV0=;
        b=JDkAzxNS+cTOKPDGG99LnI1tCnCcg6yACq1YTLKGqJ9Fv57u1FJvve8VIc8KF/axsK
         Sg7QQ9lXhntggwQCLvCJeojELPgBGE8bUWcyFHeJ1mzC8fV6QMmynxnIBFtKdgLLciAD
         cHDODqemoslok9XYUPbaIekCsv/RYRMV6HsF859QXOJd6y2IjJuxglJNAL4RNcE0GDN+
         NIOjrdyCrnE04GaJwqm3jOXIhAtyhVZHo7cuZDevdNPhFMNufC3GOcCw6McjHWnwbywQ
         zXB/LdXKvxMA+vb80bextaS1hh1GmrAd0hjxYcVkIzGZ+aknGpdDU7fv4UelMkChqyyV
         /u9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776760890; x=1777365690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mC05YTc5SmuhQF/mCBd5RraHNHqhmq97LDEIrPY8QyQ=;
        b=iAIv2fognnDFBz+mNdugdGnUbXefvJBduQfbB/StpfDAFbrJ+4c29TQ3BW/klObKrl
         rcNZsCtPNxCh70Oo+KR8DqZw+mFIsISGvHGjBwayoB2aVhqUGfXC3MKEoBM/7D/LNCPf
         xZXK6hxAmRRixV0RnxWnggCrkwF77r10hXYYOy/NPVxTYFLIeXjaJKchF4Wwy3ZfavcH
         MZWRVgzDWxJjyFXlsh5S7D7HebXhloBHXGhFOFtWzdctc2RRBYJYpjJ8+0YDArqBzTMH
         bMpgZHxH21MyNRfniphyeV9OfwxNODNPLmv7poigeGb4xGS6uR5j1cplGx8Z54RoofaL
         tmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760890; x=1777365690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mC05YTc5SmuhQF/mCBd5RraHNHqhmq97LDEIrPY8QyQ=;
        b=rr64iXxpNue8KP9Uba/uPXP8OM3tKSeRuSv2kfJ4W7+zU4BXTSTuOmkYdopqBCLEHB
         3h1I1p1I59xOHBtrIrkqDTGk9ZOaFASAacxI8czpzwXn9ASzTtl3odRaLi1rr/wSYUzR
         50T7x6QYryInTXn4J8pQV6/dxEzQYFPgQThoSHEksaff8wXPaS/HwHh1W3g3RQ2bUSfE
         W+LXIiDIsHi1kImIpXms883EeIVJDpuHZq+Pc5MVhIIwEYX9Z0ZNvZd0Or2ui+s5HShB
         EQVbN8e+tDVWzSDArHmO/77Coooyns8g9qUYGs1JhYsZvlnK5PLf7n/GUUJJPTqd2a69
         RPYg==
X-Forwarded-Encrypted: i=1; AFNElJ+6ZLS1RCeAbyUJMoCLgkdO68tHpEIrIFPI7cau/9BWnMj9RwzKCA2kqqrLkHC730EGe0LMn+iqv8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+oSQeKDLILcUhP9ljkXY70x3clme10wDJQvW1J8MAQ4QKzok
	CG7vFiD+20RByChvp69GE5G53sE1M1DQTerj/2FEf1jqLd3TuRGuk2Pon55WMLF65I54z7MDafZ
	d8snezGjF1A+3muXHHpGl9uZaEQdOviQB4fs1NYyMbx//UTLy13PequaQFAN9sRyet+wU4faDV+
	D2B6d6Dg/CKsJ93AZlIIF542uSbEwzP8EZCOU4
X-Gm-Gg: AeBDiesLVkAVNM2Ss1knNCSYfq0yDQHPoVVLKFJAeEU53RRdpN41wlmpY9y6NASceuX
	GNucoFVv4LKrR4Gf0aZw3ojUhpREzg9P9mTyStf/6NnoS2suJ7cuzgzH+LTVWbsV6x6LWaNNQWV
	SkisuazP7iMg+918ziNv6uXYbHkGZCH0RAAgBRQ0/+ufz0Lin//328oiQqXP9z3kC4m3SLpIrud
	mRvcuOZ6hWOX3g7
X-Received: by 2002:a05:690c:6e85:b0:7ba:f0ed:c5cd with SMTP id 00721157ae682-7baf0edf46bmr49084277b3.33.1776760889729;
        Tue, 21 Apr 2026 01:41:29 -0700 (PDT)
X-Received: by 2002:a05:690c:6e85:b0:7ba:f0ed:c5cd with SMTP id
 00721157ae682-7baf0edf46bmr49084027b3.33.1776760889332; Tue, 21 Apr 2026
 01:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-2-e8bc6e0f70de@redhat.com> <20260420144453.GK3102624@noisy.programming.kicks-ass.net>
In-Reply-To: <20260420144453.GK3102624@noisy.programming.kicks-ass.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 21 Apr 2026 10:41:18 +0200
X-Gm-Features: AQROBzCV0B5mGT_w3fyNoIOcvbOSxwzeCNrVj_GyXS8H3Qz0Owy2xkfDx8OhQQ8
Message-ID: <CADSE00LrkRcuWw_uhbRbjvDhoHX4Ogouu038-9kQEQ_3BxPG5g@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] bug/kunit: Reduce runtime impact of warning
 backtrace suppression
To: Peter Zijlstra <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Alessandro Carminati <acarmina@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 4:45=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Apr 20, 2026 at 02:28:04PM +0200, Albert Esteve wrote:
> > From: Alessandro Carminati <acarmina@redhat.com>
> >
> > KUnit support is not consistently present across distributions, some
> > include it in their stock kernels, while others do not.
> > While both KUNIT and KUNIT_SUPPRESS_BACKTRACE can be considered debug
> > features, the fact that some distros ship with KUnit enabled means it's
> > important to minimize the runtime impact of this patch.
> >
> > To that end, this patch adds an atomic counter that tracks the number
> > of active suppressions. __kunit_is_suppressed_warning() checks this
> > counter first and returns immediately when no suppressions are active,
> > avoiding RCU-protected list traversal in the common case.
> >
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  lib/kunit/bug.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
> > index 356c8a5928828..a7a88f0670d44 100644
> > --- a/lib/kunit/bug.c
> > +++ b/lib/kunit/bug.c
> > @@ -8,6 +8,7 @@
> >
> >  #include <kunit/bug.h>
> >  #include <kunit/resource.h>
> > +#include <linux/atomic.h>
> >  #include <linux/export.h>
> >  #include <linux/rculist.h>
> >  #include <linux/sched.h>
> > @@ -15,11 +16,13 @@
> >  #ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> >
> >  static LIST_HEAD(suppressed_warnings);
> > +static atomic_t suppressed_warnings_cnt =3D ATOMIC_INIT(0);
> >
> >  static void __kunit_suppress_warning_remove(struct __suppressed_warnin=
g *warning)
> >  {
> >       list_del_rcu(&warning->node);
> >       synchronize_rcu(); /* Wait for readers to finish */
> > +     atomic_dec(&suppressed_warnings_cnt);
> >  }
> >
> >  KUNIT_DEFINE_ACTION_WRAPPER(__kunit_suppress_warning_cleanup,
> > @@ -37,6 +40,7 @@ __kunit_start_suppress_warning(struct kunit *test)
> >               return NULL;
> >
> >       warning->task =3D current;
> > +     atomic_inc(&suppressed_warnings_cnt);
> >       list_add_rcu(&warning->node, &suppressed_warnings);
> >
> >       ret =3D kunit_add_action_or_reset(test,
> > @@ -68,6 +72,9 @@ bool __kunit_is_suppressed_warning(void)
> >  {
> >       struct __suppressed_warning *warning;
> >
> > +     if (!atomic_read(&suppressed_warnings_cnt))
> > +             return false;
> > +
> >       rcu_read_lock();
> >       list_for_each_entry_rcu(warning, &suppressed_warnings, node) {
> >               if (warning->task =3D=3D current) {
> >
>
> So the thing you're skipping is:
>
>   rcu_read_lock();
>   list_for_each_entry_rcu() {
>   }
>   rcu_read_unlock();
>
> Which is really cheap. Did you actually have performance numbers for
> this?

No, I do not have performance numbers. I kept the counter and the
separate patch for consistency with the previous version of the
series. But you have a good point, the skipped part is really cheap.

>
> A possibly better option is to add a static_branch() that could elide
> any and all memory access.
>

Previous version had static_branch and I removed it because I
understood from the discussion that the gains would not be significant
as performance gains are irrelevant in warn slowpath. But I think it
would make sense for a disabled feature. I will rework this for the
next version, remove the counter and use static_branch as suggested.

