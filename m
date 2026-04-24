Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B33331202
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019156; cv=pass; b=ZTvSF2kBsRMj97y1COy2u5FrtXwo7TYfcOjgIpQIUU+JPpy/wDTbEdP4MlHFrN3Teel92vIvMut0Jik6a1aJsqoXqZYdYJl0BJBuTcE5cv8m/4PVP4kGbzLL+qHuty9+IF8+LzEAYAuydh3acA3sXhEs69j7XR7p6R/P/xkpTJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019156; c=relaxed/simple;
	bh=ziZKgHefNOY3Gp3E8pQl4CZg9AJ+Uc27sgzHHIO//Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sz7oRKgc2sbp8znWpyMTyQw4snP5vDYk8V0rhKt/MP1YT9Ac2bNubmM8QiM2RnjUxFnCKDxTJhfrXfbAHRPeldLNGlkYWwQcYvJqTwDilj7eGmL0KELtGNRruHcXNiv+LZQHYPjwLdh95F23vHJAohnTccqEAKO3TFQkl7VmQRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DVTBgyrw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=deBWnpGx; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DVTBgyrw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="deBWnpGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777019153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iddsQLueoQEOIJwe4Gfj6if9K+aRVWtEbx6BS4m334s=;
	b=DVTBgyrw7pQgqSZpv9HUdKzUyNSZ9orJAatGuNeHDpsOygK5A6kXJUnNij/YWewEjRVWDP
	t01K/sRnaE+HLMB5bmNtGZtkqEthoZK1k6lcIDx8SDNiJsvqLo4UsXQ9E1OYJWMP3lsNki
	0YZMk5b5jxoM3yTdld1s5RIh4U97+kI=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-8YTMlciiMDqo2YaZZyHpPQ-1; Fri, 24 Apr 2026 04:25:47 -0400
X-MC-Unique: 8YTMlciiMDqo2YaZZyHpPQ-1
X-Mimecast-MFC-AGG-ID: 8YTMlciiMDqo2YaZZyHpPQ_1777019147
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7982c466ee1so171991537b3.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 01:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777019147; cv=none;
        d=google.com; s=arc-20240605;
        b=MapTwiCiAPbLQ0fByiVjzQtxPm4HXW/hRs2p2XYACme9M7NyrAzqZer/oqwFxhp6su
         P8Ld4l5FYkR0NouEc2lKJNdmUkkk7+4Xc+8Q+w+K+o+DfOnurLuin9dXXW8B85jz55wE
         n2vY9etaD92bT2iLXqk2jBPKIih4U+PmfMC3nVdvOHwd66U/7QePyboQiVJ6jp16fgIe
         AI+7f1SNXoEj96hjHfbcGJhbnWMunQt48jKyMJZb3sDuWG07ogkqIwVMuxEWVjFRfV4q
         WW6k86qDOuOVOrOIaQ4baTf0IVsOw5b3ycLvSjOTO/ehyqhY3xF7nLwfOdgrgJ8FKBWt
         uw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iddsQLueoQEOIJwe4Gfj6if9K+aRVWtEbx6BS4m334s=;
        fh=bFWn3hMQWjoJ7F80IebNtF/ES5nO93bapoGUwO0+ALY=;
        b=XrHF9XlzgrSTA22tl8rmXoAndIbOWDbn1EZtdtiDMtYx8jZ0LYzcpQ4YHR8pNpo9xr
         Lu6ywJcwtngqtWVqvjlRJqhLsWuQqa6JmoU51LDshFMHLysSeJbqSff0e4B3xOzAH61+
         MZlhrDDVw9FHNQ/dv9I4ht+L7AmxE56Yo/IaTrJ1MpcQl3Tk4LT+irvTremuRgATUdEm
         T9tQj/FCnDgLUBzIPGqol4Zk6Bx9Hj3OdEO29fXLjtSOyZBgcJAUNvNyrpv5yQX0uU10
         +WDKhOkL+J4PExm+tCm6C8TeXq9n+MGreVKBAPTq1M6+6eI7GZ1mkPc3//Kr+30JiN11
         e5nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777019147; x=1777623947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iddsQLueoQEOIJwe4Gfj6if9K+aRVWtEbx6BS4m334s=;
        b=deBWnpGx0TzWfxlS8DSa91QH8S002DvmPYTP0iJYDiNByDbx7SN1KA7NCE8TtUiJuQ
         jWa/njAZ6Cua/1VNAH+/mo5bzRF2aKtjwR00HqMvys81byY7UpI2i7KPN0RivXyMVjuG
         sOpvDj8tpT/Ji2qd/mIWBq2OnPhf1T/OBciNk7rTVO0r3dWluVColRAmYl3JtWS9SZkg
         V5va8JYh6qhsB6ohCv99Amo+iQxrbEZdBM9U2zngncnDNEHlTqwOpd6CBOzqun9wiULT
         jMqc+gf+wtIRRjKRluwRPZYvjZT0zvnt67t30aM8p6C0SCukoein+tby1bnr/s41JB2K
         qxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019147; x=1777623947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iddsQLueoQEOIJwe4Gfj6if9K+aRVWtEbx6BS4m334s=;
        b=jfjE7fyvJ5opfP4OQZ/ejK1b4xg/r+qobDucfwyCHugd/zmk2XxmOms9tm962gOhG0
         cJZ/giirk0Hm6CwAxVAWdRi/AJFFdHCjiXHM4izWEll9396eC5GaX8f6aNiVooCE+wbG
         GsdHMmltbp6HD+/E9lgY7diIufw67b4Hhu2xFoN+gMntT1EMboZIatsesgS8+9Wsya1J
         MOXWDe5Yn2yHEpvWfs84heA889eu1u8SMWb+BOdJesAl4mBsV5ET8gj+EepoJd7+U4hC
         8IhTUg55KXhx2oOlLdfrL5YujpyS30+RjGCu4cfSlwNYWZXkBywMNT2+tSlMYaWzttAR
         x9Hg==
X-Forwarded-Encrypted: i=1; AFNElJ/PRZMGwnjctf0sWQ3UQftDm1mEABlDOzbR9XXrERpXQIi1EATNfHAXqC5cAXP2Hm/aUMOOF7yxhUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFzYXEmVjccWs4aPrvPr3wHQvOnZ2wOt8daqHlszysdPe4nwif
	shqXKJMZEGynO5KRjmf7ZIk6ONEDY3si/0fVYzH05nO0bCo5Qh5m3sSxEPLyn6/YKV0Saqxb2kt
	4XlgCLqKeG2QflTlQY4IahN79qPjgsCRZwGal/XP3MgjNWy6ufwjDvJkuFG+HTp9jN4cwsfTmxB
	chOFP5h/jbYV8IZVnztd1DUjI4x+/JMAeC48EA
X-Gm-Gg: AeBDieu5Z5S4D/PvAZvhjXqcVAbV6SJxaXZy6r3WwQJwC3dcMZ8RrdhWWQ1UtZk3amk
	4OEucgaMt//0c1WivuH8n0lW5hK5t0adkkhJiFVD30//GeUYGlV79JZURDy2MwAPH7t6CDaqSZi
	eJHGN5ezWpyBhHdvvfGPBio165dFh2dJcIFihugPEtEGqzp3RhEvgfrbc8kz2PjaXCok/9w4CEE
	mc1QoJhKqepAivy
X-Received: by 2002:a05:690c:9:b0:7bb:712:a74f with SMTP id 00721157ae682-7bb0712abfdmr142445537b3.17.1777019147053;
        Fri, 24 Apr 2026 01:25:47 -0700 (PDT)
X-Received: by 2002:a05:690c:9:b0:7bb:712:a74f with SMTP id
 00721157ae682-7bb0712abfdmr142445227b3.17.1777019146632; Fri, 24 Apr 2026
 01:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-3-e8bc6e0f70de@redhat.com> <6209f24e-750d-4a7d-ad63-1695f5fd1caa@davidgow.net>
In-Reply-To: <6209f24e-750d-4a7d-ad63-1695f5fd1caa@davidgow.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 24 Apr 2026 10:25:35 +0200
X-Gm-Features: AQROBzC8_2POWCOFYR1L1LoP_YwcAOa38lshWUv2qs6X6k9mWiut3V_iTEcCLAA
Message-ID: <CADSE00+Ch2QtfsjOcKRNXY9Au8sv5E7Jdd8Rhb2dA6ODu+EDOw@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] kunit: Add backtrace suppression self-tests
To: David Gow <david@davidgow.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, peterz@infradead.org, 
	Guenter Roeck <linux@roeck-us.net>, Linux Kernel Functional Testing <lkft@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Alessandro Carminati <acarmina@redhat.com>, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 2:22=E2=80=AFPM David Gow <david@davidgow.net> wrot=
e:
>
> Le 20/04/2026 =C3=A0 8:28 PM, Albert Esteve a =C3=A9crit :
> > From: Guenter Roeck <linux@roeck-us.net>
> >
> > Add unit tests to verify that warning backtrace suppression works,
> > covering WARN() and WARN_ON() with direct calls, indirect calls
> > through helper functions, and multiple warnings in a single window.
> >
> > If backtrace suppression does _not_ work, the unit tests will likely
> > trigger unsuppressed backtraces, which should actually help to get
> > the affected architectures / platforms fixed.
> >
> > Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
>
> Thanks very much for including tests!
>
> Maybe it'd be nice to test that the suppression is disabled after
> KUNIT_END_SUPPRESSED_WARNING(). Of course, then triggering an actual
> stacktrace would be a pain, but maybe we could check that
> __kunit_is_suppressed_warning() returns false? If you wanted to be
> really fancy, you could test that it returns false on another kthread
> even while the suppression is active, too, but I won't hold you to it.
> Equally, you could try setting up a fake test context and ensuring the
> cleanup is called correctly, but I think that's mostly covered by the
> existing KUnit resource tests.

 Good suggestions. I'll add a test for __kunit_is_suppressed_warning()
returning false after END. The cross-kthread test is a nice idea too.
I'll see if I can fit it in without overcomplicating things.

>
> Otherwise, looking good. A couple of other minor suggestions below,
> which may require some reworking of the __kunit_suppress scope, but all
> optional suggestions.
>
> Reviewed-by: David Gow <david@davidgow.net>

Thanks for the review!

>
> >   lib/kunit/Makefile                     |  3 ++
> >   lib/kunit/backtrace-suppression-test.c | 90 +++++++++++++++++++++++++=
+++++++++
> >   2 files changed, 93 insertions(+)
> >
> > diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
> > index fe177ff3ebdef..b2f2b8ada7b71 100644
> > --- a/lib/kunit/Makefile
> > +++ b/lib/kunit/Makefile
> > @@ -23,6 +23,9 @@ obj-$(if $(CONFIG_KUNIT),y) +=3D              hooks.o=
 \
> >
> >   obj-$(CONFIG_KUNIT_TEST) +=3D         kunit-test.o
> >   obj-$(CONFIG_KUNIT_TEST) +=3D         platform-test.o
> > +ifeq ($(CONFIG_KUNIT_SUPPRESS_BACKTRACE),y)
> > +obj-$(CONFIG_KUNIT_TEST) +=3D          backtrace-suppression-test.o
> > +endif
> >
> >   # string-stream-test compiles built-in only.
> >   ifeq ($(CONFIG_KUNIT_TEST),y)
> > diff --git a/lib/kunit/backtrace-suppression-test.c b/lib/kunit/backtra=
ce-suppression-test.c
> > new file mode 100644
> > index 0000000000000..2ba5dcb5fef35
> > --- /dev/null
> > +++ b/lib/kunit/backtrace-suppression-test.c
> > @@ -0,0 +1,90 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * KUnit test for suppressing warning tracebacks.
> > + *
> > + * Copyright (C) 2024, Guenter Roeck
> > + * Author: Guenter Roeck <linux@roeck-us.net>
> > + */
> > +
> > +#include <kunit/test.h>
> > +#include <linux/bug.h>
> > +
> > +static void backtrace_suppression_test_warn_direct(struct kunit *test)
> > +{
> > +     KUNIT_START_SUPPRESSED_WARNING(test);
> > +     WARN(1, "This backtrace should be suppressed");
> > +     KUNIT_END_SUPPRESSED_WARNING(test);
> > +
> > +     KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(), 1);
> > +}
> > +
> > +static void trigger_backtrace_warn(void)
> > +{
> > +     WARN(1, "This backtrace should be suppressed");
> > +}
> > +
> > +static void backtrace_suppression_test_warn_indirect(struct kunit *tes=
t)
> > +{
> > +     KUNIT_START_SUPPRESSED_WARNING(test);
> > +     trigger_backtrace_warn();
> > +     KUNIT_END_SUPPRESSED_WARNING(test);
> > +
> > +     KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(), 1);
> > +}
> > +
> > +static void backtrace_suppression_test_warn_multi(struct kunit *test)
> > +{
> > +     KUNIT_START_SUPPRESSED_WARNING(test);
> > +     WARN(1, "This backtrace should be suppressed");
> > +     trigger_backtrace_warn();
> > +     KUNIT_END_SUPPRESSED_WARNING(test);
> > +
> > +     KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(), 2);
>
> Would it make sense to test KUNIT_SUPPRESSED_WARNING_COUNT() more
> thoroughly here by checking that it's 0 before any warnings, and
> checking that it's 1 in-between the two warnings?
>
> Of course, the first case doesn't work due to __kunit_suppress not being
> defined, but if the implementation changes to support this, let's add it
> to the test, too.

I thought this was a test gap when you commented the limitation in
patch #1, so I agree to add more granular COUNT checks once the API
supports it (which it should after the rework to expose the pointer).
Thanks!

>
> > +}
> > +
> > +static void backtrace_suppression_test_warn_on_direct(struct kunit *te=
st)
> > +{
> > +     if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE) && !IS_ENABLED(CONFIG_KA=
LLSYMS))
> > +             kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE or CON=
FIG_KALLSYMS");
> > +
> > +     KUNIT_START_SUPPRESSED_WARNING(test);
> > +     WARN_ON(1);
> > +     KUNIT_END_SUPPRESSED_WARNING(test);
> > +
> > +     KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(), 1);
> > +}
> > +
> > +static void trigger_backtrace_warn_on(void)
> > +{
> > +     WARN_ON(1);
> > +}
> > +
> > +static void backtrace_suppression_test_warn_on_indirect(struct kunit *=
test)
> > +{
> > +     if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE))
> > +             kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE");
> > +
> > +     KUNIT_START_SUPPRESSED_WARNING(test);
> > +     trigger_backtrace_warn_on();
> > +     KUNIT_END_SUPPRESSED_WARNING(test);
> > +
> > +     KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(), 1);
> > +}
> > +
> > +static struct kunit_case backtrace_suppression_test_cases[] =3D {
> > +     KUNIT_CASE(backtrace_suppression_test_warn_direct),
> > +     KUNIT_CASE(backtrace_suppression_test_warn_indirect),
> > +     KUNIT_CASE(backtrace_suppression_test_warn_multi),
> > +     KUNIT_CASE(backtrace_suppression_test_warn_on_direct),
> > +     KUNIT_CASE(backtrace_suppression_test_warn_on_indirect),
> > +     {}
> > +};
> > +
> > +static struct kunit_suite backtrace_suppression_test_suite =3D {
> > +     .name =3D "backtrace-suppression-test",
> > +     .test_cases =3D backtrace_suppression_test_cases,
> > +};
> > +kunit_test_suites(&backtrace_suppression_test_suite);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("KUnit test to verify warning backtrace suppression=
");
> >
>

