Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B010534C145
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 17:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761068425; cv=none; b=Is3U61wQZ3qnPjNeLwIG5LbPJQaX2nTMcAvXMpql3USUJ28iHTFCCgMukLcwPwEHlnpMjE9OawZ9SH3/oGlsC7nowVUeUWaStHFkuy53MD9doN5CG/OXp50NP50+BPl+tRu9sFIuxTyQVPV+Z4E3Jrpkt06VIB3Lye+n7ZhQe6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761068425; c=relaxed/simple;
	bh=7JoHInQdApQkdHzAPD8FX7uRju0EXhTGG1SG4slxvvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcQTa11z1yTf12uszfpPmGirkhJ6PETA1q3PKCMsB1IMRNh4ArDPLlut/n2s3FzeW+OSgrzFN49UUdgJjV1yaVYOWqinxsuUL4exEPRwWkbnJf5nV1rl07JIlmThicLf+hcnVtvbuZzoQ0WQQFKvawM+QUkNNXp5y00iXbq0EWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QCIirYTR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QCIirYTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761068422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X6mtgo3pPCytVhVXZFHBeLsifkDHzSLEpkyjN1cf7zc=;
	b=QCIirYTRzvCGGFo2RCA8H+olyxPm3lwQcYZKtYA19oME3yq47w8aAiTtLt+WkDxAETqBmp
	jqGUE/2IbAMxuTba5kobrjEJn/YFxCln9Lrkw26ypOubbwsAihRryd326xElAiA1pxg5Jb
	6gwg634QFzrcwiX6+PQ+ZJFrKQ1Wr1A=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-rWCFZZp6PMWox95_niQHIw-1; Tue, 21 Oct 2025 13:40:21 -0400
X-MC-Unique: rWCFZZp6PMWox95_niQHIw-1
X-Mimecast-MFC-AGG-ID: rWCFZZp6PMWox95_niQHIw_1761068420
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290c9724deeso50010385ad.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 10:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761068420; x=1761673220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6mtgo3pPCytVhVXZFHBeLsifkDHzSLEpkyjN1cf7zc=;
        b=Lu41qixVW96rfMUSN6owAhEY93krFvv9T7LYhtOzifhpKGvbH0yHmx2ABDf+RuPdeb
         S2QSczq3p2zeP2r+mdibJBdcCtIJ2IJfwW4hEq6qFtj0husID7TlpenKSifAvnlOGbCL
         AnoDiWm1BpdhTq7AnQx/1hSdg+luxmpwFfUflV+F+5eQkGpS/KYPg84kl+iT6Wq7XdF+
         UVR2E1ElM/YD6PXf03C2T9MvLPzLWVGy9XJXkaWsoWeRzTMaKUAGT4/IIXi96znznrf4
         6c7/jeP5cZmlVn+8rfbEJ6KWomZxrZJbLWrHUMSRutPOxeSgglWV0hp+kYSilxWaUUrz
         LOdw==
X-Forwarded-Encrypted: i=1; AJvYcCWDLpXISzvng6v/EnJrgzeNoPw8hJ2ajeEGFwnp/TlHQIMHB9OpmRM6l2XdHTia/3Fz24yW9dlv3NE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ibot2lv24YOpSyDq8VSqTeYknfEheCCIXpa0PDSQAkZ5PU6r
	L27H5zVNZuXSjGwtYRKOURqucyplbcIFcFrKYWLyDhPVrqSvh+mloU50BuG2v0ieJ3HC9SkJF8X
	8aXZtBGyH++CvyIiTP5KGW5853S0M8g43wtaczb3orD/xTmmnk3onxWwTKG4jh1prlKQEyFbo4u
	CFctrTrxX2dxnfOZCekwAhoo6MbZlR+2CofuQh
X-Gm-Gg: ASbGncsiyXzpQZ/uDAHn4BT7u/WAU6xp0VGGxwq0+IXZNeO7QzmBUkz9YTZ9YJNEbT/
	jJQLMNHSIXhwubSv20QaK0NnTIJ72FaCifqUgvohbWQ+So+aEG6lL+OJxPoLDk3afvKEN4+dfAu
	pqwTWrflOQzqddN2PgL98j8wobOPNSFKNqBZFQsQyuJsHxv7j3ljEG1Q==
X-Received: by 2002:a17:903:2445:b0:25c:25f1:542d with SMTP id d9443c01a7336-290ca1219e1mr241861765ad.36.1761068419833;
        Tue, 21 Oct 2025 10:40:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNBRXbNnmPSpLYEnXFkENFI/1M+gqvKIYCVJm9fI2lS0fXYAVI+gy+WgMJVWOy3YBjG5e8is9uJ+k/OC1HrY0=
X-Received: by 2002:a17:903:2445:b0:25c:25f1:542d with SMTP id
 d9443c01a7336-290ca1219e1mr241861165ad.36.1761068419241; Tue, 21 Oct 2025
 10:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910170000.6475-1-gpaoloni@redhat.com> <20250910170000.6475-4-gpaoloni@redhat.com>
 <2025102151-distill-operate-a748@gregkh>
In-Reply-To: <2025102151-distill-operate-a748@gregkh>
From: Alessandro Carminati <acarmina@redhat.com>
Date: Tue, 21 Oct 2025 19:40:07 +0200
X-Gm-Features: AS18NWBEOONK7dBiVq2lvIZx05dnm_RrfOSuk8LGx_c67bshALzcxq1srb2jgM8
Message-ID: <CAGegRW7qKAPre7EAh8JLkUuA4Wi0-cKs7q3_qxHAE0nJs6VHEw@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 3/3] selftests/devmem: initial testset
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Gabriele Paoloni <gpaoloni@redhat.com>, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, safety-architecture@lists.elisa.tech, 
	kstewart@linuxfoundation.org, chuckwolber@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, Oct 21, 2025 at 9:41=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Sep 10, 2025 at 07:00:00PM +0200, Gabriele Paoloni wrote:
> > From: Alessandro Carminati <acarmina@redhat.com>
> >
> > This patch introduces a new series of tests for devmem.
> > Test cases are mapped against the tested Function's expectations
> > defined in /drivers/char/mem.c.
>
> Cool, but:
>
> >
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > ---
> >  tools/testing/selftests/Makefile         |   1 +
> >  tools/testing/selftests/devmem/Makefile  |  13 +
> >  tools/testing/selftests/devmem/debug.c   |  25 +
> >  tools/testing/selftests/devmem/debug.h   |  14 +
> >  tools/testing/selftests/devmem/devmem.c  | 200 ++++++++
> >  tools/testing/selftests/devmem/ram_map.c | 250 ++++++++++
> >  tools/testing/selftests/devmem/ram_map.h |  38 ++
> >  tools/testing/selftests/devmem/secret.c  |  46 ++
> >  tools/testing/selftests/devmem/secret.h  |  13 +
> >  tools/testing/selftests/devmem/tests.c   | 569 +++++++++++++++++++++++
> >  tools/testing/selftests/devmem/tests.h   |  45 ++
> >  tools/testing/selftests/devmem/utils.c   | 379 +++++++++++++++
> >  tools/testing/selftests/devmem/utils.h   | 119 +++++
>
> That's a lot of files for a "simple" test.  Doesn't LTP have tests for
> this api already?  Why not use that here instead?
Indeed, at first glance the test may look simple.
However, despite the high-level concept being straightforward, there
are several corner cases and peculiar aspects that needed to be
covered, that=E2=80=99s why the test grew larger than expected.
For this RFC, my intent was mainly to share the full picture of what I
had in mind.
I fully agree that it can be refined and streamlined in the next iterations=
.
When I started working on this, I wasn=E2=80=99t aware of any existing LTP
tests for this interface.
After your comment, I double-checked, but I couldn=E2=80=99t find any relev=
ant coverage.
As far as I can tell, neither LTP nor the upstream kernel selftests
(kselftest or KUnit) currently include tests specifically targeting
/dev/mem.

>
> Also, this is userspace testing, not kunit testing, right, is that
> intentional?  You are documenting internal apis and then writing
> userspace tests for those apis, which feels a bit odd.
Yes, that=E2=80=99s intentional.
The main reason is that all the interactions happen from userspace,
and the internal helper functions aren=E2=80=99t meant to be consumed by ot=
her
kernel components.
So I chose a kselftest-style approach.
That said, this is still an RFC, I=E2=80=99m happy to adapt it based on
community feedback and direction.

>
> Also /dev/mem should not be used on "modern" systems, so how was this
> tested?
That=E2=80=99s indeed one of the nuances I mentioned earlier.
Access to /dev/mem is often restricted for security reasons, so the
test is designed to detect and adapt to the environment, only
performing operations that are actually allowed.
>
> > +// SPDX-License-Identifier: GPL-2.0+
>
> Are you _sure_ you want GPLv2+?  I have to ask, sorry.
Yes, I used GPLv2+ deliberately, but I=E2=80=99m open to changing it if the
consensus is that GPLv2-only is more appropriate here.

>
> > +/*
> > + * devmem test debug.c
> > + *
> > + * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
> > + * Written by Alessandro Carminati (acarmina@redhat.com)
> > + */
> > +
> > +#include <stdio.h>
> > +#include <stdarg.h>
> > +
> > +#define DEBUG_FLAG 0
> > +int pdebug =3D DEBUG_FLAG;
>
> That's a funny define that is never used elsewhere.  I'm guessing this
> was cut/pasted from some other userspace code somewhere?
It wasn=E2=80=99t copied, but I agree it looks unnecessary in its current f=
orm.
I can remove or rework it in the next version.
>
> > +
> > +void deb_printf(const char *fmt, ...)
>
> Who is "deb"?  You have more letters, always use them :)
>
> Also, why debugging for just this one set of tests?  Don't kselftests
> already have debugging logic?  if not, why is this unique to require it?
>
> And am I missing something, or does this new tool not tie into the
> kselftest framework properly?  I see lots of printing to output, but not
> in the proper test framework format, am I just missing that somewhere?
You=E2=80=99re right, this was a small custom debug I left in place, mainly
because I needed a way to include additional information that isn=E2=80=99t
normally part of the standard selftest output, such as references to
specific requirements in the code.
My intent was to make it easier to correlate test results with those
requirements.
That said, I fully agree that the implementation isn=E2=80=99t aligned with
the kselftest framework style, and I=E2=80=99ll look into integrating this
need in a more standardized and consistent way in the next iteration.

>
> thanks,
>
> greg k-h
>
Thanks a lot for the detailed feedback, it=E2=80=99s very helpful.
I=E2=80=99ll revise the test accordingly for the next round.

Best regards,
Alessandro


--
---
172

