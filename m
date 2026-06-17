Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8533E47ECDD
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 15:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781710775; cv=pass; b=QGgRarCqYvjBujrM+YlLmnDh11PO0P5NxmgAveU/oHN4kUxyWcXaP36ES9OpXBoUN9V8IWdJhkUIhHCFOC9AEYS0tUhZjktVRPaR2S7dfWdCpE9heDiBgyQQHqPGiMnOT0oVbl1PGWpi/1ycptn/qMmDfsiEy1MYi4/xElkOSZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781710775; c=relaxed/simple;
	bh=TVNwA39PuL7lZTm4ROm6uBXJ1RtMUXuHwyXQbJtrJws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hE7dJaiOGPG5/wBlG3rEK+TCn+XGL+J4VBbI3nY5R8kQVxa8woP19i+4BIOvOdb2VCY5BZjTNvF0DZKei+Ml6H1oj7anDtNVxQqVirvezS/jhqXME+ccRTndNxMsRe42nWLM7jG2xpJsh0TkysVpQWiIxTTH400DfcZaFEIgCi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v1/hqIjt; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v1/hqIjt"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51765531803so332591cf.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 08:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781710756; cv=none;
        d=google.com; s=arc-20240605;
        b=Xo37XSr1MFd48+BxFQNwy6fLet2KCpVChjlH9P9Tb2SeZ/6oIFpYL8iYYlHTpGRLJ9
         EyxUL4jB7lIjvXi5CHiXMb6xrdpSX7zxODVts6+LiahJ6sw5TTLcv7gTExnbb/EVmJDy
         N2pGc+5H5Eu7DWIN0MWyy5UHaze59Bh6G8nojk6vjWY78PSguFIeyzNufcxFFlPK30L3
         tm/f37q3ow+DjkmZ9phLsEtdisVhxetsiY9G8wEIjNa2ZvYvzW0kPUSWre8aQz0zhVOo
         VyqF+ZWXxE18A2psmvOGFZagSphjIRjLHNmX/BKM7lrBiJ0MId/aX8551HU2JOCJDvAP
         ziRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e7O+YFaniyt4mqlxJTogbnmDsFLsPWU7djzJQ4Y9xm8=;
        fh=khPjVltfMRuG4Oia2z6JMqDe8FbWVMKT16g8uHji5iU=;
        b=eDdhDtYP5vZMzPZxwhLCBRn//HUGJ1mXLQ8Hym8afQQTngzCgmv+2RtAHQCp3Z8tVt
         uUMEJzoPwC7ZIFrTwFlpFLCNaGr/DE/Ezh95D9Tk+ptOHBl7V3eYbCiklcIO2Sm2VrL1
         8Hd6CUy1oZt3djryS+yBR04UXj2FFOC7O6aIJ6vSGBoRVePwd9zWKS0cNvAkJDWTh/sA
         QsJ5JDpryw7NWtE4b9MZHh3Xda5+NP79hVzG2/U5ue2EMRpEevII48g7xtoeqt8iFh07
         Lum+3iaP0ytDKP+NxS5M61JUPzKUrbIGU6y0JlvRZUipo3URhaaq7vy8x/I4UdEsr8ep
         hqpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781710756; x=1782315556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e7O+YFaniyt4mqlxJTogbnmDsFLsPWU7djzJQ4Y9xm8=;
        b=v1/hqIjt06jIpqDKLVioP6M1htrivoXFdrc+4pRw8cU139v36QO27tm1L0iXXcFRUD
         E4dgvwqeYcKklAJNCIn9dxDpZ509cfH+mAuugnm3IiT3IKd3cN9zg6j8wp2hs/FclPrP
         bn9jFpnS1Bv/Oz7Ih+9DwPiy8qMG/r+wHxULSzsOsdFOhNS4zOiFZ7td4DNIb/DbO42l
         aKFNk1N6d51cXLFR2p8gVyTeJ9IEkkqrB8a+Dq2GbE2oApegKgVBkmm8wsqk74TvTzsC
         Xey9dKFc3fqYSrs0BPMYwF2RbhLXAlvL4W/96cErqbiom5A+UVd8knO14bM3mxgw2Rm8
         9HIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781710756; x=1782315556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7O+YFaniyt4mqlxJTogbnmDsFLsPWU7djzJQ4Y9xm8=;
        b=oJapZWay9ubA4aWyGf6xdZF2Ye0bbDYZZGXVW0b27SoN+GOzELLw2hZdbQBHT3JIP7
         pVR+XeCzxC9obPK+xHgEDWaWXJgVr73ltiNI+CqxWJYE9rMAqRDmgitDj3Ttqg5NNWbB
         Z6DOyz3MG350uZn7GU724j1Vf/dGl3oGQELKxnaJzOW2rNAY2lhKQSFIYP5l/VglpT6x
         shB9OsCBGOVdymW4Z2T8cKcG8HPdzYVCvAV5YASIUo9+l7ji6RMSLwfYGcgD5pj6VprH
         bZJcA1rVRjziresdi2FIbsH3oNAx9+29uL0q09uBO7Yl1sGxGfOQu9ilmA1d5dWOubQh
         fa2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9UDYPsFr8t0mDZ5vnsClVMTb5tZ+wB3oLePAVEZg3eKIM/QzUQwFrbnCp9hnfkQiAwXcYYNk8q360=@vger.kernel.org
X-Gm-Message-State: AOJu0YylYT8OyYn0fuALHhhNRfozGK8wG/kEoUGz7ygBv8dt0H+WPJHZ
	DUCf2pfz7ncjVIuVI/T/8TeNTLfh9mJeqcX/0WxqdckkKQ0F+7sExFZIkDVNVb3adh+gbkObyKw
	soD/5ADrfwugIPqUy82+nIzAEIaFVSqbT0vYDASEd
X-Gm-Gg: Acq92OEjGxxiXn/+NSq0PELIxacSCKsqAisaLZmYjf3hkjyhlMx53UAti4s9dfSapj8
	5cPwg9yVYFTOj0ePs28BTUv7O5j6A/iZ8LI3faqLM2SsQ+E4aFKZiW3arNNNfMKN3p4SIcWygVI
	9DnB1cW2NU621vNFZXyrEpL9LZsJp5dRmZ+Y7clIsFkni7sN4W6KYLQMLmLd2DuGB0mAewh1aoO
	YNZGGegj2gOjRxSrgpMGj0Y60i9Jsg1mOttkszEHnWD8LPOd6UBQQJKEA+dQGenVgJk1VCxnUZz
	hf6arQUuNJ1sIgNXWsbG0MNfMNg=
X-Received: by 2002:a05:622a:5884:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-519aa962ed6mr11253791cf.10.1781710755155; Wed, 17 Jun 2026
 08:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com>
 <4d9c8dc420e2019e1fce62ecf31ec40933fce3a8.1781564384.git.abhishekbapat@google.com>
 <f5afcb7a-5b38-4c98-ac3e-529631bda4cb@linux.dev> <CAL41Mv7s9iA6a3YKV40E-9vk9WZfCjMEgBbLq_FVOjRS-PdVvA@mail.gmail.com>
In-Reply-To: <CAL41Mv7s9iA6a3YKV40E-9vk9WZfCjMEgBbLq_FVOjRS-PdVvA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 17 Jun 2026 08:39:03 -0700
X-Gm-Features: AVVi8CeNyhEAJn89ckCO6vpBZ60MjcT4wEDr_0XaNZkmvpxfoh4Ep57-FKkkyNM
Message-ID: <CAJuCfpF12rccM5YEXhDicL4-aRifA5fQMUKRGN8M13zMnoWr+Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] kselftest: alloc_tag: add kselftest for ioctl interface
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 9:56=E2=80=AFAM Abhishek Bapat <abhishekbapat@googl=
e.com> wrote:
>
> On Mon, Jun 15, 2026 at 11:01=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
> >
> > Hi Abhishek
> >
> >
> > On 2026/6/16 07:04, Abhishek Bapat wrote:
> > > Introduce a kselftest to verify the new IOCTL-based interface for
> > > /proc/allocinfo. The test covers:
> > >
> > > 1. Validation of the filename filter.
> > > 2. Validation of the function filter.
> > >
> > > The first test validates the functionality of the filename filter. Us=
ing
> > > "mm/memory.c" as the candidate filename filter, it retrieves filtered
> > > entries from both procfs and ioctl and matches the first VEC_MAX_ENTR=
IES
> > > entries.
> > >
> > > The second test validates the functionality of the function filter.
> > > It uses "dup_mm" as the candidate function as we do not expect this
> > > function name to change frequently and hence won't be needing to modi=
fy
> > > this test often.
> > >
> > > Note that both the tests match line no, function name and file name
> > > fields. Bytes allocated and calls are not matched as those values may
> > > change in the time when the data is being read from procfs and ioctl =
and
> > > hence can lead to false negatives.
> > >
> > > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > > ---
> > >   MAINTAINERS                                   |   1 +
> > >   tools/testing/selftests/alloc_tag/Makefile    |   9 +
> > >   .../alloc_tag/allocinfo_ioctl_test.c          | 331 +++++++++++++++=
+++
> > >   3 files changed, 341 insertions(+)
> > >   create mode 100644 tools/testing/selftests/alloc_tag/Makefile
> > >   create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioct=
l_test.c
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 019cc4c285a3..6610dd42e484 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -16715,6 +16715,7 @@ F:    include/linux/alloc_tag.h
> > >   F:  include/linux/pgalloc_tag.h
> > >   F:  include/uapi/linux/alloc_tag.h
> > >   F:  lib/alloc_tag.c
> > > +F:   tools/testing/selftests/alloc_tag/
> > >
> > >   MEMORY CONTROLLER DRIVERS
> > >   M:  Krzysztof Kozlowski <krzk@kernel.org>
> > > diff --git a/tools/testing/selftests/alloc_tag/Makefile b/tools/testi=
ng/selftests/alloc_tag/Makefile
> > > new file mode 100644
> > > index 000000000000..f2b8fc022c3b
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/alloc_tag/Makefile
> > > @@ -0,0 +1,9 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +
> > > +TEST_GEN_PROGS :=3D allocinfo_ioctl_test
> > > +
> > > +CFLAGS +=3D -Wall
> > > +CFLAGS +=3D -I../../../../usr/include
> >
> >
> > I think we should replace -I../../../../usr/include with $(KHDR_INCLUDE=
S).
> >
> >
> > > +
> > > +include ../lib.mk
> > > +
> >
> >
> > We would also introduce an extra field in the parent directory,
> >
> > allowing our alloc_tag target to be built when running make
> >
> > within /home/linux/tools/testing/selftests.
> >
> > like this:
> >
> > --- a/tools/testing/selftests/Makefile
> > +++ b/tools/testing/selftests/Makefile
> > @@ -1,5 +1,6 @@
> >   # SPDX-License-Identifier: GPL-2.0
> >   TARGETS +=3D acct
> > +TARGETS +=3D alloc_tag
> >   TARGETS +=3D alsa
> >   TARGETS +=3D amd-pstate
> >   TARGETS +=3D arm64
> >
> > Below is the relevant build log:
> >
> > [root@localhost selftests]# make -j8
> >    CC       acct_syscall
> >    CC       allocinfo_ioctl_test
> >
> > Below is the log from running make clean:
> >
> > [root@localhost selftests]# make clean
> > rm -f -r /home/linux/tools/testing/selftests/acct/acct_syscall
> > rm -f -r /home/linux/tools/testing/selftests/alloc_tag/allocinfo_ioctl_=
test
> >
> >
> > (Sorry about this inconvenience. I had limited experience with the
> > kselftest framework,
> >
> > so I reached out to my teammates to sort out the relevant build logic.
> >
> > It's my fault for not catching this issue in prior reviews
> >
> > and forcing you to send a revised patch.)
> >
> >
> Before writing this patch, I had discussed this with Suren and he was
> of the opinion that this should be done later in a separate patch. So
> I'll let Suren answer this further.

Hmm. Don't recall exact details of that discussion but it does not
make sense to introduce an issue just to clean it up later. I agree
with Hao and if I said otherwise before, I was wrong.
Thanks,
Suren.

>
> > > diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c=
 b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > > new file mode 100644
> > > index 000000000000..62d5a488a04d
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > > @@ -0,0 +1,331 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +/* kselftest for allocinfo ioctl
> > > + * allocinfo ioctl retrives allocinfo data through ioctl
> > > + * Copyright (C) 2026 Google, Inc.
> > > + */
> > > +
> > > +#include <errno.h>
> >
> >
> > errno.h is unused and may be dropped.
> >
> >
> > > +#include <fcntl.h>
> > > +#include <stdio.h>
> > > +#include <stdlib.h>
> > > +#include <string.h>
> > > +#include <stdbool.h>
> > > +#include <unistd.h>
> > > +#include <sys/ioctl.h>
> > > +#include <linux/types.h>
> > > +#include <linux/alloc_tag.h>
> > > +#include "../kselftest.h"
> > > +
> > > +#define MAX_LINE_LEN         512
> > > +#define ALLOCINFO_PROC               "/proc/allocinfo"
> > > +
> > > +enum ioctl_ret {
> > > +     IOCTL_SUCCESS =3D 0,
> > > +     IOCTL_FAILURE =3D 1,
> > > +     IOCTL_INVALID_DATA =3D 2,
> > > +};
> > > +
> > > +#define VEC_MAX_ENTRIES 32
> > > +
> > > +struct allocinfo_tag_data_vec {
> > > +     struct allocinfo_tag_data tag[VEC_MAX_ENTRIES];
> > > +     __u64 count;
> > > +};
> > > +
> > > +static inline int __allocinfo_get_content_id(int dev_fd, struct allo=
cinfo_content_id *params)
> > > +{
> > > +     return ioctl(dev_fd, ALLOCINFO_IOC_CONTENT_ID, params);
> > > +}
> > > +
> > > +static inline int __allocinfo_get_at(int dev_fd, struct allocinfo_ge=
t_at *params)
> > > +{
> > > +     return ioctl(dev_fd, ALLOCINFO_IOC_GET_AT, params);
> > > +}
> > > +
> > > +static inline int __allocinfo_get_next(int dev_fd, struct allocinfo_=
tag_data *params)
> > > +{
> > > +     return ioctl(dev_fd, ALLOCINFO_IOC_GET_NEXT, params);
> > > +}
> > > +
> > > +static bool match_entry(const struct allocinfo_tag_data *procfs_entr=
y,
> > > +                     const struct allocinfo_tag_data *tag_data,
> > > +                     bool match_bytes, bool match_calls, bool match_=
lineno,
> > > +                     bool match_function, bool match_filename)
> > > +{
> > > +     if (match_bytes && tag_data->counter.bytes !=3D procfs_entry->c=
ounter.bytes) {
> > > +             ksft_print_msg("size retrieved through ioctl does not m=
atch procfs\n");
> > > +             return false;
> > > +     }
> > > +
> > > +     if (match_calls && tag_data->counter.calls !=3D procfs_entry->c=
ounter.calls) {
> > > +             ksft_print_msg("call count retrieved through ioctl does=
 not match procfs\n");
> > > +             return false;
> > > +     }
> > > +
> > > +     if (match_lineno && tag_data->tag.lineno !=3D procfs_entry->tag=
.lineno) {
> > > +             ksft_print_msg("lineno retrieved through ioctl does not=
 match procfs\n");
> > > +             return false;
> > > +     }
> > > +
> > > +     if (match_function &&
> > > +         strncmp(tag_data->tag.function, procfs_entry->tag.function,=
 ALLOCINFO_STR_SIZE)) {
> > > +             ksft_print_msg("function retrieved through ioctl does n=
ot match procfs\n");
> > > +             return false;
> > > +     }
> > > +
> > > +     if (match_filename &&
> > > +         strncmp(tag_data->tag.filename, procfs_entry->tag.filename,=
 ALLOCINFO_STR_SIZE)) {
> > > +             ksft_print_msg("filename retrieved through ioctl does n=
ot match procfs\n");
> > > +             return false;
> > > +     }
> > > +     return true;
> > > +}
> > > +
> > > +static bool match_entries(const struct allocinfo_tag_data_vec *procf=
s_entries,
> > > +                       const struct allocinfo_tag_data_vec *tags,
> > > +                       bool match_bytes, bool match_calls, bool matc=
h_lineno,
> > > +                       bool match_function, bool match_filename)
> > > +{
> > > +     __u64 i;
> > > +
> > > +     if (procfs_entries->count !=3D tags->count) {
> > > +             ksft_print_msg("Entry count mismatch. ioctl entries: %l=
lu, proc entries: %llu\n",
> > > +                            tags->count, procfs_entries->count);
> > > +             return false;
> > > +     }
> > > +     for (i =3D 0; i < procfs_entries->count; i++) {
> > > +             if (!match_entry(&procfs_entries->tag[i], &tags->tag[i]=
,
> > > +                              match_bytes, match_calls, match_lineno=
,
> > > +                              match_function, match_filename)) {
> > > +                     ksft_print_msg("%lluth entry does not match.\n"=
, i);
> > > +                     return false;
> > > +             }
> > > +     }
> > > +     return true;
> > > +}
> > > +
> > > +static const char *allocinfo_str(const char *str)
> > > +{
> > > +     size_t len =3D strlen(str);
> > > +
> > > +     if (len >=3D ALLOCINFO_STR_SIZE)
> > > +             str +=3D (len - ALLOCINFO_STR_SIZE) + 1;
> > > +     return str;
> > > +}
> > > +
> > > +static void allocinfo_copy_str(char *dest, const char *src)
> > > +{
> > > +     strncpy(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE - 1);
> > > +     dest[ALLOCINFO_STR_SIZE - 1] =3D '\0';
> > > +}
> > > +
> > > +static int get_filtered_procfs_entries(struct allocinfo_tag_data_vec=
 *procfs_entries,
> > > +                                    const struct allocinfo_filter *f=
ilter)
> > > +{
> > > +     FILE *fp =3D fopen(ALLOCINFO_PROC, "r");
> > > +     char line[MAX_LINE_LEN];
> > > +     int matches;
> > > +     struct allocinfo_tag_data procfs_entry;
> > > +
> > > +     if (!fp) {
> > > +             ksft_print_msg("Failed to open " ALLOCINFO_PROC " for r=
eading\n");
> > > +             return 1;
> > > +     }
> > > +     memset(procfs_entries, 0, sizeof(*procfs_entries));
> > > +     while (fgets(line, sizeof(line), fp) && procfs_entries->count <=
 VEC_MAX_ENTRIES) {
> > > +             char filename[MAX_LINE_LEN];
> > > +             char function[MAX_LINE_LEN];
> > > +
> > > +             memset(&procfs_entry, 0, sizeof(procfs_entry));
> > > +             matches =3D sscanf(line, "%llu %llu %[^:]:%llu func:%s"=
,
> > > +                              &procfs_entry.counter.bytes,
> > > +                              &procfs_entry.counter.calls,
> > > +                              filename,
> > > +                              &procfs_entry.tag.lineno,
> > > +                              function);
> > > +
> > > +             if (matches !=3D 5)
> > > +                     continue;
> > > +
> > > +             allocinfo_copy_str(procfs_entry.tag.filename, filename)=
;
> > > +             allocinfo_copy_str(procfs_entry.tag.function, function)=
;
> > > +
> > > +             if (filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) {
> > > +                     if (strncmp(procfs_entry.tag.filename,
> > > +                                 filter->fields.filename, ALLOCINFO_=
STR_SIZE))
> > > +                             continue;
> > > +             }
> > > +             if (filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) {
> > > +                     if (strncmp(procfs_entry.tag.function,
> > > +                                 filter->fields.function, ALLOCINFO_=
STR_SIZE))
> > > +                             continue;
> > > +             }
> > > +             if (filter->mask & ALLOCINFO_FILTER_MASK_LINENO) {
> > > +                     if (procfs_entry.tag.lineno !=3D filter->fields=
.lineno)
> > > +                             continue;
> > > +             }
> > > +             if (filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) {
> > > +                     if (procfs_entry.counter.bytes < filter->min_si=
ze)
> > > +                             continue;
> > > +             }
> > > +             if (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) {
> > > +                     if (procfs_entry.counter.bytes > filter->max_si=
ze)
> > > +                             continue;
> > > +             }
> > > +
> > > +             memcpy(&procfs_entries->tag[procfs_entries->count++], &=
procfs_entry,
> > > +                    sizeof(procfs_entry));
> > > +     }
> > > +     fclose(fp);
> > > +     return 0;
> > > +}
> > > +
> > > +static enum ioctl_ret get_filtered_ioctl_entries(struct allocinfo_ta=
g_data_vec *tags,
> > > +                                              const struct allocinfo=
_filter *filter,
> > > +                                              __u64 start_pos)
> > > +{
> > > +     int fd =3D open(ALLOCINFO_PROC, O_RDONLY);
> > > +
> > > +     if (fd < 0) {
> > > +             ksft_print_msg("Failed to open " ALLOCINFO_PROC " for I=
OCTL\n");
> > > +             return IOCTL_FAILURE;
> > > +     }
> > > +     struct allocinfo_content_id start_cont_id, end_cont_id;
> > > +     struct allocinfo_get_at get_at_params;
> > > +     const int max_retries =3D 10;
> > > +     int retry_count =3D 0;
> > > +     int status;
> > > +
> > > +     /*
> > > +      * __allocinfo_get_content_id may return different values if a =
kernel module was loaded
> > > +      * between the two calls. If that happens, the data gathered ca=
nnot be considered consistent
> > > +      * and hence needs to be fetched again to avoid flakiness.
> > > +      */
> > > +     do {
> > > +             if (__allocinfo_get_content_id(fd, &start_cont_id)) {
> > > +                     ksft_print_msg("allocinfo_get_content_id failed=
\n");
> > > +                     return IOCTL_FAILURE;
> >
> > Sashiko pointed out the fd leak in get_filtered_ioctl_entries().
> >
> > Since we already need to update the patch to fix the missing
> >
> > TARGETS entry in the top-level Makefile, we might as well fix
> >
> > this at the same time.
> >
> >
> > Thanks
> >
> > Best Regards
> >
> > Hao
> >
>
> Ahh I missed this code path interestingly. Ack, I'll remove these
> return statements here.
>
> > > +             }
> > > +
> > > +             memset(tags, 0, sizeof(*tags));
> > > +             memset(&get_at_params, 0, sizeof(get_at_params));
> > > +             memcpy(&get_at_params.filter, filter, sizeof(*filter));
> > > +             get_at_params.pos =3D start_pos;
> > > +             if (__allocinfo_get_at(fd, &get_at_params)) {
> > > +                     ksft_print_msg("allocinfo_get_at failed\n");
> > > +                     return IOCTL_FAILURE;
> > > +             }
> > > +             memcpy(&tags->tag[tags->count++], &get_at_params.data, =
sizeof(get_at_params.data));
> > > +
> > > +             while (tags->count < VEC_MAX_ENTRIES &&
> > > +                    __allocinfo_get_next(fd, &tags->tag[tags->count]=
) =3D=3D 0)
> > > +                     tags->count++;
> > > +
> > > +             if (__allocinfo_get_content_id(fd, &end_cont_id)) {
> > > +                     ksft_print_msg("allocinfo_get_content_id failed=
\n");
> > > +                     return IOCTL_FAILURE;
> > > +             }
> > > +
> > > +             if (start_cont_id.id =3D=3D end_cont_id.id) {
> > > +                     status =3D IOCTL_SUCCESS;
> > > +             } else {
> > > +                     ksft_print_msg("allocinfo_get_content_id mismat=
ch, retrying...\n");
> > > +                     status =3D IOCTL_INVALID_DATA;
> > > +             }
> > > +     } while (status =3D=3D IOCTL_INVALID_DATA && retry_count++ < ma=
x_retries);
> > > +
> > > +     close(fd);
> > > +     return status;
> > > +}
> > > +
> > > +static int run_filter_test(const struct allocinfo_filter *filter)
> > > +{
> > > +     struct allocinfo_tag_data_vec *tags =3D malloc(sizeof(*tags));
> > > +     struct allocinfo_tag_data_vec *procfs_entries =3D malloc(sizeof=
(*procfs_entries));
> > > +     int ioctl_status;
> > > +     int ret =3D KSFT_PASS;
> > > +
> > > +     if (!tags || !procfs_entries) {
> > > +             ksft_print_msg("Memory allocation failed.\n");
> > > +             ret =3D KSFT_FAIL;
> > > +             goto exit;
> > > +     }
> > > +
> > > +     if (get_filtered_procfs_entries(procfs_entries, filter)) {
> > > +             ksft_print_msg("Error retrieving entries from " ALLOCIN=
FO_PROC "\n");
> > > +             ret =3D KSFT_SKIP;
> > > +             goto exit;
> > > +     }
> > > +
> > > +     if (procfs_entries->count =3D=3D 0) {
> > > +             ksft_print_msg("No entries found in " ALLOCINFO_PROC ",=
 skipping test\n");
> > > +             ret =3D KSFT_SKIP;
> > > +             goto exit;
> > > +     }
> > > +
> > > +     ioctl_status =3D get_filtered_ioctl_entries(tags, filter, 0);
> > > +     if (ioctl_status =3D=3D IOCTL_INVALID_DATA) {
> > > +             ksft_print_msg("Trouble retrieving valid IOCTL entries,=
 skipping.\n");
> > > +             ret =3D KSFT_SKIP;
> > > +             goto exit;
> > > +     }
> > > +     if (ioctl_status =3D=3D IOCTL_FAILURE) {
> > > +             ksft_print_msg("Error retrieving IOCTL entries.\n");
> > > +             ret =3D KSFT_FAIL;
> > > +             goto exit;
> > > +     }
> > > +
> > > +     if (!match_entries(procfs_entries, tags, false, false, true, tr=
ue, true))
> > > +             ret =3D KSFT_FAIL;
> > > +
> > > +exit:
> > > +     free(tags);
> > > +     free(procfs_entries);
> > > +     return ret;
> > > +}
> > > +
> > > +static int test_filename_filter(void)
> > > +{
> > > +     struct allocinfo_filter filter;
> > > +     const char *target_filename =3D "mm/memory.c";
> > > +
> > > +     memset(&filter, 0, sizeof(filter));
> > > +     filter.mask |=3D ALLOCINFO_FILTER_MASK_FILENAME;
> > > +     strncpy(filter.fields.filename, target_filename, ALLOCINFO_STR_=
SIZE);
> > > +
> > > +     return run_filter_test(&filter);
> > > +}
> > > +
> > > +static int test_function_filter(void)
> > > +{
> > > +     struct allocinfo_filter filter;
> > > +     const char *target_function =3D "dup_mm";
> > > +
> > > +     memset(&filter, 0, sizeof(filter));
> > > +     filter.mask |=3D ALLOCINFO_FILTER_MASK_FUNCTION;
> > > +     strncpy(filter.fields.function, target_function, ALLOCINFO_STR_=
SIZE);
> > > +
> > > +     return run_filter_test(&filter);
> > > +}
> > > +
> > > +int main(int argc, char *argv[])
> > > +{
> > > +     int ret;
> > > +
> > > +     ksft_set_plan(2);
> > > +
> > > +     ret =3D test_filename_filter();
> > > +     if (ret =3D=3D KSFT_SKIP)
> > > +             ksft_test_result_skip("Skipping test_filename_filter\n"=
);
> > > +     else
> > > +             ksft_test_result(ret =3D=3D KSFT_PASS, "test_filename_f=
ilter\n");
> > > +
> > > +     ret =3D test_function_filter();
> > > +     if (ret =3D=3D KSFT_SKIP)
> > > +             ksft_test_result_skip("Skipping test_function_filter\n"=
);
> > > +     else
> > > +             ksft_test_result(ret =3D=3D KSFT_PASS, "test_function_f=
ilter\n");
> > > +
> > > +     ksft_finished();
> > > +}
