Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8569B40242B
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833825; cv=pass; b=JBq7/1Sl+W1Uo9ovIYRdsR9SnHclQhhvjj+VD0fnixrYOUnMtlGDIWkg/qfG6EKuKsK3J+QLcuJKPHYypMSSBjNeYy8ZRy4SLN/mmYW4umkRklqZAHheb0JxcwJ5N6Z2/gc8Q3DUoBk5vIEwmTwBVFTMiMXPUcK2s7KhLBbBfzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833825; c=relaxed/simple;
	bh=wZoWkMX+eskXzZoY5GSBYclpj+6G3yHCYIb+U539EoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCcesf+0MFfr7LDACpkV1P1mK5FJFu9bqfpq8Z29+DQGHmsm66vJHj/HuI7kF5Bh/6wE5rxCYnZKkYC3bRQaN18Gw5b7JSeXbmYGANVcP90yOQkO9beCY3tvAgB9b+Mhv8E/LbuT+DfywkO8VQdfIGFibmOrVzTg+7xVZZLtwZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N5Z2s3wb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kAbEuEGl; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N5Z2s3wb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kAbEuEGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778833822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bl97SG38DqEYm+qLShyfMzefRk/OXd7eX3bX+dxr3ds=;
	b=N5Z2s3wbGD5T2Ur87tk2PSZ7jF5uYSYh5vcEP7+xZ1Y2XhEVw2CrSDg6rxPDb5XxpAOsSk
	hEWj6JV3TPDX1Fr/vrUBvLbNlyFgExNlz5pIXHYjubNnLT7PmGl0N0rHrduz0lhP0Lj+UU
	PvwG9DT8ljWWWqdXTpiP9FSTYHDKmO0=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-7MfyjcrWMCSBv13wuzYpsg-1; Fri, 15 May 2026 04:30:21 -0400
X-MC-Unique: 7MfyjcrWMCSBv13wuzYpsg-1
X-Mimecast-MFC-AGG-ID: 7MfyjcrWMCSBv13wuzYpsg_1778833821
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-65c3132b7e5so20241844d50.2
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 01:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778833821; cv=none;
        d=google.com; s=arc-20240605;
        b=IsfwubuxR4QLDAv9ZpXn0nfY02WAnc0YC4xQYMz+yEJW3PKL68KeXeXNRLLtBmrGvv
         rYLWipzuxazAzuWRcd5OzldfT90bKE8gRmuwUej/1stDV391J5eU+M8rXXCSF6t4fE0u
         eZLu7jI6WJ38DZoZHocfizh2W34P+HFrY6B8I0k2h68mLrVU52CA0cU0keS3dvHgxOaZ
         tqNSxYtzu9sPGXrs8VVRJ7l9dc/hO49LBq6NWbcSNP0WRRCdvtmENp5C+xFVoUwCy0qz
         nbfA+hcZC6LkyGaQd6GxAyGkKg/bBBi0RbqISccR928sn8Y0shdWGLC7+ErtZESd3z+K
         lDMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bl97SG38DqEYm+qLShyfMzefRk/OXd7eX3bX+dxr3ds=;
        fh=a1iKjIX+v+kbGv4y/EsGGBXvmT2YcQbtuKyb7Ol97+c=;
        b=S0kmnkiidACWqjJU0vS7IbWCsI/48bFBOuoFRoWeGjemNnWIIv0P7wSwYCVHCdmSf5
         ymdxJzm7OQYSXkOyQtnzCnLSOWwzb1iua1cqCPo+gE9NcvQgbyYZQKaEn2tghGwVuJoI
         rWo2iIGySHjGBGLyxnruf0M2e6PlYxu4/FVoZZrPqJuvHbUHGWfrptRGDMNJcylhXP1e
         IeRouWLTL0lcd9mbRrCbwVHWBJP51Oxk3iTHjDff5snBIvdAoB7fhbDH4tQfCPA6IsbH
         UFz8vNN8N0RyboWCFsAZR451BBccUzROtyUQIqNA938RnwIqhIg4xM5qBOxfbcHTghQ3
         icvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778833821; x=1779438621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl97SG38DqEYm+qLShyfMzefRk/OXd7eX3bX+dxr3ds=;
        b=kAbEuEGlsQ2HH37n6hwUfilPN+5fmKWuBJQ0PDRIij0rCmsLhvBjLY3LOEE1D53M/k
         6wLco4dBOlxGCGHcJGtPkKwZVApyg5LIYX/iqT88/zX4YqNvUCKA7b2CktNqUfhPcdeq
         jEztmn7IwsWKl5gG/wLnle7Hd1zu2ZyN2FyR+StIouBugdpxErZThHw4M9RyHWXQmauq
         +FKMUyHnASRHhsm3dnVtbDL8jDXqRRgddQkOpgTglzwVzdLI3lNTKF4dxkpbvCZX6pnh
         jyQ2RIiTitWXIFsXiVMpfYvXDKUEfN9DQT+mASqcUDAfqJB4Ss5qMkmEHZTqlpv5ksvT
         /lNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778833821; x=1779438621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bl97SG38DqEYm+qLShyfMzefRk/OXd7eX3bX+dxr3ds=;
        b=ou9Kxgs+v2PJuAYnwawvX1s48BbAVt8bvGXWK8ePa7A2f3xPh21wRfCtrVaJR7D/hW
         +LXrQ7sNygfHZRd3v0LaxGD/TZDXlyNVv1rtygEqDc3HUIPa+Mju1iyCIGIzlbU0dJjF
         nisyPPN3hh0jmkAKqaJlLsKs2WzROfP+DikVC8Clbzg6g5Qta0hOLBLID2uvBxdJVjLT
         vdYtMAKHQF+o5G9oIPH7C9hvFv4QPsPwVP4hi4c9Jt7m01msvYtVC48nzpxeLnt5J7jN
         74Glxscs+w9gyMxnxyDQZQA7srwSrpCbYSfcV7XemwimYfcAP7ivsfTiEzILtk9ajY1U
         7wew==
X-Forwarded-Encrypted: i=1; AFNElJ9CD8cR31Y8+hZG4e/p59WhwurOR2tJLxcJ+pDSDLc3K1PYmPGrcfMBaQ6u/BlMbDHCSuiGv/Co2Xs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0p/DEkr1A3DiiI2xiRmBxtvse28Zsu4np5celLJ811QtcuB7F
	NXCOSBaZHtCre/rtPcWJPMvhj0+DxnIxfKcxRD0RcsjIKoLniWvr0wWemDAIezkV8+Rki0oeoBl
	Lak4rlGLdwFKamrZMNP7NUdCEKSBZDDXoMC2a0xoTIT8H0XDhYBSLM8DY2ErXRluvpcqWMvDoFG
	KyI5kl1WPx2O0MxwMKoTEAjxk9WaeYOczIi/7J
X-Gm-Gg: Acq92OHwefOnLXrTKt8Xulk5ag0Pf1gm76eW5TwIZVZpFmiohhTk6h/GElG9/FyW0iZ
	iY9FkKttQ/tvPK0Mt6W7V0ac4kNZ7E2h3xwiOv+hjtH+trbs5ga+4YVwysodJL09nYjOf3HvjPP
	hBH9ap8p2HTyHJ9JzJveygVVJrXdUUXScTCPf/bJFfLhHs9+Q/zFAGKJEAOiY8LGEHWpoMCG7/R
	BIz4Q==
X-Received: by 2002:a05:690c:d91:b0:7a4:8718:8c73 with SMTP id 00721157ae682-7c959f7eae9mr29527737b3.9.1778833820524;
        Fri, 15 May 2026 01:30:20 -0700 (PDT)
X-Received: by 2002:a05:690c:d91:b0:7a4:8718:8c73 with SMTP id
 00721157ae682-7c959f7eae9mr29527457b3.9.1778833820057; Fri, 15 May 2026
 01:30:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-kunit_add_support-v11-0-b36a530a6d8f@redhat.com> <20260514-kunit_add_support-v11-2-b36a530a6d8f@redhat.com>
In-Reply-To: <20260514-kunit_add_support-v11-2-b36a530a6d8f@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 15 May 2026 10:30:07 +0200
X-Gm-Features: AVHnY4IpbN1L0iL3JJ5V1KLP5rKC5fDaPhQjSTbBKstC7eTK3NlVXbuxOJbgBlw
Message-ID: <CADSE00KxDcyvw5MzRzrY0haZze8=9Npb8W8SwsxR+wjcS0R9pw@mail.gmail.com>
Subject: Re: [PATCH v11 2/4] kunit: Add backtrace suppression self-tests
To: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	peterz@infradead.org, Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Alessandro Carminati <acarmina@redhat.com>, Dan Carpenter <error27@gmail.com>, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 1:07=E2=80=AFPM Albert Esteve <aesteve@redhat.com> =
wrote:
>
> From: Guenter Roeck <linux@roeck-us.net>
>
> Add unit tests to verify that warning backtrace suppression works.
>
> Tests cover both API forms:
> - Scoped: kunit_warning_suppress() with in-block count verification
>   and post-block inactivity check.
> - Direct functions: kunit_start/end_suppress_warning() with
>   sequential independent suppression blocks and per-block counts.
>
> Furthermore, tests verify incremental warning counting, that
> kunit_has_active_suppress_warning() transitions correctly around
> suppression boundaries, and that suppression active in the test
> kthread does not leak to a separate kthread.
>
> If backtrace suppression does _not_ work, the unit tests will likely
> trigger unsuppressed backtraces, which should actually help to get
> the affected architectures / platforms fixed.
>
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> Reviewed-by: David Gow <david@davidgow.net>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  lib/kunit/Makefile                     |   1 +
>  lib/kunit/backtrace-suppression-test.c | 198 +++++++++++++++++++++++++++=
++++++
>  2 files changed, 199 insertions(+)
>
> diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
> index 4592f9d0aa8dd..2e8a6b71a2ab0 100644
> --- a/lib/kunit/Makefile
> +++ b/lib/kunit/Makefile
> @@ -22,6 +22,7 @@ obj-$(if $(CONFIG_KUNIT),y) +=3D                hooks.o
>
>  obj-$(CONFIG_KUNIT_TEST) +=3D            kunit-test.o
>  obj-$(CONFIG_KUNIT_TEST) +=3D            platform-test.o
> +obj-$(CONFIG_KUNIT_TEST) +=3D            backtrace-suppression-test.o
>
>  # string-stream-test compiles built-in only.
>  ifeq ($(CONFIG_KUNIT_TEST),y)
> diff --git a/lib/kunit/backtrace-suppression-test.c b/lib/kunit/backtrace=
-suppression-test.c
> new file mode 100644
> index 0000000000000..7a2a59c6a780d
> --- /dev/null
> +++ b/lib/kunit/backtrace-suppression-test.c
> @@ -0,0 +1,198 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit test for suppressing warning tracebacks.
> + *
> + * Copyright (C) 2024, Guenter Roeck
> + * Author: Guenter Roeck <linux@roeck-us.net>
> + */
> +
> +#include <kunit/test.h>
> +#include <linux/bug.h>
> +#include <linux/completion.h>
> +#include <linux/kthread.h>
> +
> +static void backtrace_suppression_test_warn_direct(struct kunit *test)
> +{
> +       if (!IS_ENABLED(CONFIG_BUG))
> +               kunit_skip(test, "requires CONFIG_BUG");
> +
> +       kunit_warning_suppress(test) {
> +               WARN(1, "This backtrace should be suppressed");
> +               /*
> +                * Count must be checked inside the scope; the handle
> +                * is not accessible after the block exits.
> +                */
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
> +       }
> +       KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
> +}
> +
> +static noinline void trigger_backtrace_warn(void)
> +{
> +       WARN(1, "This backtrace should be suppressed");
> +}
> +
> +static void backtrace_suppression_test_warn_indirect(struct kunit *test)
> +{
> +       if (!IS_ENABLED(CONFIG_BUG))
> +               kunit_skip(test, "requires CONFIG_BUG");
> +
> +       kunit_warning_suppress(test) {
> +               trigger_backtrace_warn();
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
> +       }
> +}
> +
> +static void backtrace_suppression_test_warn_multi(struct kunit *test)
> +{
> +       if (!IS_ENABLED(CONFIG_BUG))
> +               kunit_skip(test, "requires CONFIG_BUG");
> +
> +       kunit_warning_suppress(test) {
> +               WARN(1, "This backtrace should be suppressed");
> +               trigger_backtrace_warn();
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 2);
> +       }
> +}
> +
> +static void backtrace_suppression_test_warn_on_direct(struct kunit *test=
)
> +{
> +       if (!IS_ENABLED(CONFIG_BUG))
> +               kunit_skip(test, "requires CONFIG_BUG");
> +       if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE) && !IS_ENABLED(CONFIG_KA=
LLSYMS))
> +               kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE or CON=
FIG_KALLSYMS");
> +
> +       kunit_warning_suppress(test) {
> +               WARN_ON(1);
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
> +       }
> +}
> +
> +static noinline void trigger_backtrace_warn_on(void)
> +{
> +       WARN_ON(1);
> +}
> +
> +static void backtrace_suppression_test_warn_on_indirect(struct kunit *te=
st)
> +{
> +       if (!IS_ENABLED(CONFIG_BUG))
> +               kunit_skip(test, "requires CONFIG_BUG");
> +       if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE))
> +               kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE");
Sashiko says:
"""
Is there a reason why backtrace_suppression_test_warn_on_direct() falls bac=
k
to checking CONFIG_KALLSYMS while
backtrace_suppression_test_warn_on_indirect() does not?
The core warning suppression logic matches on the task, so it seems like
CONFIG_KALLSYMS should be sufficient for both.
Could this cause tests to be unnecessarily skipped on systems with
CONFIG_KALLSYMS enabled but CONFIG_DEBUG_BUGVERBOSE disabled?
"""
This is interesting. I am not sure why they were different; it was
probably an oversight. But after looking at it, this is probably a
leftover from when suppression occurred at the macros. They do not
seem necessary anymore. So I will remove them.

> +
> +       kunit_warning_suppress(test) {
> +               trigger_backtrace_warn_on();
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
> +       }
> +}
> +
> +static void backtrace_suppression_test_count(struct kunit *test)
> +{
> +       if (!IS_ENABLED(CONFIG_BUG))
> +               kunit_skip(test, "requires CONFIG_BUG");
> +
> +       kunit_warning_suppress(test) {
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 0);
> +
> +               WARN(1, "suppressed");
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
> +
> +               WARN(1, "suppressed again");
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 2);
> +       }
> +}
> +
> +static void backtrace_suppression_test_active_state(struct kunit *test)
> +{
> +       KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
> +
> +       kunit_warning_suppress(test) {
> +               KUNIT_EXPECT_TRUE(test, kunit_has_active_suppress_warning=
());
> +       }
> +
> +       KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
> +
> +       kunit_warning_suppress(test) {
> +               KUNIT_EXPECT_TRUE(test, kunit_has_active_suppress_warning=
());
> +       }
> +
> +       KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
> +}
> +
> +static void backtrace_suppression_test_multi_scope(struct kunit *test)
> +{
> +       struct kunit_suppressed_warning *sw1, *sw2;
> +
> +       if (!IS_ENABLED(CONFIG_BUG))
> +               kunit_skip(test, "requires CONFIG_BUG");
> +       if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE))
> +               kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE");
> +
> +       sw1 =3D kunit_start_suppress_warning(test);
> +       trigger_backtrace_warn_on();
> +       WARN(1, "suppressed by sw1");
> +       kunit_end_suppress_warning(test, sw1);
> +
> +       sw2 =3D kunit_start_suppress_warning(test);
> +       WARN(1, "suppressed by sw2");
> +       kunit_end_suppress_warning(test, sw2);
> +
> +       KUNIT_EXPECT_EQ(test, kunit_suppressed_warning_count(sw1), 2);
> +       KUNIT_EXPECT_EQ(test, kunit_suppressed_warning_count(sw2), 1);
> +}
> +
> +struct cross_kthread_data {
> +       bool was_active;
> +       struct completion done;
> +};
> +
> +static int cross_kthread_fn(void *data)
> +{
> +       struct cross_kthread_data *d =3D data;
> +
> +       d->was_active =3D kunit_has_active_suppress_warning();
> +       complete(&d->done);
> +       while (!kthread_should_stop())
> +               schedule();
> +       return 0;
> +}
> +
> +static void backtrace_suppression_test_cross_kthread(struct kunit *test)
> +{
> +       struct cross_kthread_data data;
> +       struct task_struct *task;
> +
> +       data.was_active =3D false;
> +       init_completion(&data.done);
> +
> +       kunit_warning_suppress(test) {
> +               task =3D kthread_run(cross_kthread_fn, &data, "kunit-cros=
s-test");
> +               KUNIT_ASSERT_FALSE(test, IS_ERR(task));
> +               wait_for_completion(&data.done);
> +               kthread_stop(task);
> +       }
> +
> +       KUNIT_EXPECT_FALSE(test, data.was_active);
> +}
> +
> +static struct kunit_case backtrace_suppression_test_cases[] =3D {
> +       KUNIT_CASE(backtrace_suppression_test_warn_direct),
> +       KUNIT_CASE(backtrace_suppression_test_warn_indirect),
> +       KUNIT_CASE(backtrace_suppression_test_warn_multi),
> +       KUNIT_CASE(backtrace_suppression_test_warn_on_direct),
> +       KUNIT_CASE(backtrace_suppression_test_warn_on_indirect),
> +       KUNIT_CASE(backtrace_suppression_test_count),
> +       KUNIT_CASE(backtrace_suppression_test_active_state),
> +       KUNIT_CASE(backtrace_suppression_test_multi_scope),
> +       KUNIT_CASE(backtrace_suppression_test_cross_kthread),
> +       {}
> +};
> +
> +static struct kunit_suite backtrace_suppression_test_suite =3D {
> +       .name =3D "backtrace-suppression-test",
> +       .test_cases =3D backtrace_suppression_test_cases,
> +};
> +kunit_test_suites(&backtrace_suppression_test_suite);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("KUnit test to verify warning backtrace suppression")=
;
>
> --
> 2.53.0
>

