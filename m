Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EB84657FD
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781628994; cv=pass; b=o1N/z/ivLAfaD8xogPyLbb8PoLFZru0BJQMOAk3WTE0ajufFCg8VyqUBTQdtlqrmOAYJZE8SXAHPh8fYXxUD5f72NVy5fcaJaDzgWhNUkezk9OXvxdDz7na+ztzlGnklLb0FJ21SwPXHjfC9vvEpHXm2inHh8etPIKN9B0FK03U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781628994; c=relaxed/simple;
	bh=Vj6USDK42V4JefWxyeMKuuV6HmWo4rxEUBdfyevhogo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjEZldQsnJ/FlgleyONPM15MSJzNvpWwBgK28obMIqM811S1ICIgzl6OPC9Cqcb6BBfU2blVtAuIWqXmmqE8s/1DfDdd+dVhWyAIIHsoJ7wtd4FvWEQ/89lbYeJVmkbcyBOi/1TlXMg+tGf0YhzEbzx7CBlY+pueH0PjiZYtnSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TmDx3mgS; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TmDx3mgS"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c69fa0b1f8so2825ad.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 09:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781628992; cv=none;
        d=google.com; s=arc-20240605;
        b=i0p1yil0yVIfwOiidoqzpdzv44JMZMXLkP4eN2IHNa15VBIgjoRqwx61GrN0n28ScO
         MRyU+uBqBPpk88+I1vbG4s58rwArC4TERQwGeqob1+itw0TJVgLb2bvisx5OpGzjgXd5
         drkJrShw2aU7ZiRyDYK1KIrQPcnK2TBq3oLNWsEvKvPx3KXDEKTd0G6uJezhdQb/nkjB
         yEpDWcnaFw6D6DJm3af1OREUR1DG7yeUMRdTKmW+rG3U5dDnFYGStpIYjt9oZZtbN+nw
         7pZWs0FlwTvPL3mB+W2tDNjlAQ/3/k/mrBhTmXa/Y/yWy9BkfA8VEq+hKdttbwtR/FlE
         jJPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FBBwjXqSRUTYQPXVAPGWlWCY+4f06L2zkzkryOWNY24=;
        fh=AD8xCoPbRmRgm2ZmS6sTZn+67IYnjkvIpA9bX5AIU/g=;
        b=AFW6X3C+k57jvZh0rJsSg8JUb3KOSWEyruuZnFUmIyC6x1ADX1RBny83SoNxF8BXgh
         pYSKBbxlZNx4h8l2gU3aFYhFx5R1y8Y6GdNWri5NW/9eTkBbfzyvzsLZ55X/I1sD0cgn
         Xp4MjlzYCtMYo+N/lvpFqkkrEt3clsNmT26hSzfINcS8qNU6Ftzabc8nB0MPuPxAZ6ag
         VmFlCbvf9DNmKCeZZ+WsCo2DpFjiQ+EU8vhPXMx/qpMH7mWc91xTvZg4MzouZLCK/QjU
         NQdASF6Sy+1bJsKtBoV+YYl2nerfIaRSO3GgRANap/OK/IFOrggBGV1gDZo9aWp7sxrP
         rvXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781628992; x=1782233792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBBwjXqSRUTYQPXVAPGWlWCY+4f06L2zkzkryOWNY24=;
        b=TmDx3mgSxlDjmGlbYjjGkrf+Nye+XC+cmf18nw6td2KKTIHa7G4pTSC4eBz6o7LbFl
         G7k4uXwnEzSuI0z46RW9j96iwk4MyM6xT1Cc7+DHdD1Ozl1HH2ivqKIGFeOeGFFOTTfu
         aFfrJLHiT7Jl+n9znrdJHYHhBRroFhUR4iZxPpTjpaASm4oLasld0AvPYqbFTaFgb2wu
         eb2bMSMgC6WNHE1X6LEevqecDJH+Yib01Z6Q93RdQvl5c1vLdc7TwW4OeLk64UcqT1Rp
         hXZ0Jq9ikY8BF7EV+x8CHjQ8hQR8+ybk7rksX1/Q02qA0QkLx0r9IupObJaK19320bUM
         +Mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781628992; x=1782233792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FBBwjXqSRUTYQPXVAPGWlWCY+4f06L2zkzkryOWNY24=;
        b=hdbHcBmDSWoOLJlte/+9h16rwGIClgawsKjebbW3phs3bXOfrm+5JjbQlK+RE7ue6Z
         W/Wgskxl3e0dd1B9nyyewENQ457hBhW+1yl+nhhgZTkaMBhIyLiWeMlcuxV8+YVm4q4V
         lzKgUwMBeH7T6uPhzicckOutDpn0fcn5wZVGm2VfCGb6zmKNjddq04cwLPiW0oXswwnc
         hjzb8eOVJ2d0C5UlSdxuFCoo8FOZB451Eya5nVAM7Q2xXiRTXA8Sy3kAj+s9Ez5Bbesc
         OtE4RwtY7PRrrkR7Nst4fH2eCNG5Rj3YEqL3Bin04CLUr1wCFF8XCJwo19l873URH84R
         lIDA==
X-Forwarded-Encrypted: i=1; AFNElJ8z+G5CZditn5I8P9u4h3RM08fuhi8yMHiA9Jwbzs8Jejsi7CEhYIlUaJKMHTmVIbggETrIWClfON8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW8J4QN7Qx3STIFY8ecGYEYP50r2khDpvmi7T8h4qKxPJfx+pn
	SyibA8dDf7VD0/rXBt6mNyPpn/ZDffUUerDxRi/C5dU+6aCyzbrIu5qHxvErVL3NTzMl/T6paD3
	hrDd4wErnGfMcDUsbnZbVYkpCO70F3t6SHgvSxKHD
X-Gm-Gg: Acq92OE33V/4eZ1Nu5eun42cYnXAExy+yZl17URtC+tVRzraeJwr0nsAmqkz4/ths3h
	mb6tDr7uZ4ruL6Z4u5rBKALP66mxsvbsPm9E6c74dbbNc139GUUSZ57a8bJi0/XjQN7gMBnkmA5
	/Ee1ucvmcm5vaB66rGffesccUPdx/hW2OFEeNwILSEFmWB3sx8k64rc690XjqRfhPSEtFJ/EOHq
	Xp72O2RzHy/PckPk59o+iEXH4bsfK67WX+PVLTViFdOtR8KXAU69zxVL7SAMfOrGTwJfaJ9TslH
	E0prwTFNhq6FLOXLo79xpunWPaJaWt3nfoIzSw==
X-Received: by 2002:a17:902:c412:b0:2bd:63cb:c5be with SMTP id
 d9443c01a7336-2c69c16752dmr2696475ad.5.1781628990995; Tue, 16 Jun 2026
 09:56:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com>
 <4d9c8dc420e2019e1fce62ecf31ec40933fce3a8.1781564384.git.abhishekbapat@google.com>
 <f5afcb7a-5b38-4c98-ac3e-529631bda4cb@linux.dev>
In-Reply-To: <f5afcb7a-5b38-4c98-ac3e-529631bda4cb@linux.dev>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Tue, 16 Jun 2026 09:56:18 -0700
X-Gm-Features: AVVi8CeuQwdwFenEreIZ_n6dANPmV86qly9NGCdeEqnOpkdWlWk_T04j-QDnrT8
Message-ID: <CAL41Mv7s9iA6a3YKV40E-9vk9WZfCjMEgBbLq_FVOjRS-PdVvA@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] kselftest: alloc_tag: add kselftest for ioctl interface
To: Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 11:01=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Abhishek
>
>
> On 2026/6/16 07:04, Abhishek Bapat wrote:
> > Introduce a kselftest to verify the new IOCTL-based interface for
> > /proc/allocinfo. The test covers:
> >
> > 1. Validation of the filename filter.
> > 2. Validation of the function filter.
> >
> > The first test validates the functionality of the filename filter. Usin=
g
> > "mm/memory.c" as the candidate filename filter, it retrieves filtered
> > entries from both procfs and ioctl and matches the first VEC_MAX_ENTRIE=
S
> > entries.
> >
> > The second test validates the functionality of the function filter.
> > It uses "dup_mm" as the candidate function as we do not expect this
> > function name to change frequently and hence won't be needing to modify
> > this test often.
> >
> > Note that both the tests match line no, function name and file name
> > fields. Bytes allocated and calls are not matched as those values may
> > change in the time when the data is being read from procfs and ioctl an=
d
> > hence can lead to false negatives.
> >
> > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > ---
> >   MAINTAINERS                                   |   1 +
> >   tools/testing/selftests/alloc_tag/Makefile    |   9 +
> >   .../alloc_tag/allocinfo_ioctl_test.c          | 331 +++++++++++++++++=
+
> >   3 files changed, 341 insertions(+)
> >   create mode 100644 tools/testing/selftests/alloc_tag/Makefile
> >   create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_=
test.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 019cc4c285a3..6610dd42e484 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16715,6 +16715,7 @@ F:    include/linux/alloc_tag.h
> >   F:  include/linux/pgalloc_tag.h
> >   F:  include/uapi/linux/alloc_tag.h
> >   F:  lib/alloc_tag.c
> > +F:   tools/testing/selftests/alloc_tag/
> >
> >   MEMORY CONTROLLER DRIVERS
> >   M:  Krzysztof Kozlowski <krzk@kernel.org>
> > diff --git a/tools/testing/selftests/alloc_tag/Makefile b/tools/testing=
/selftests/alloc_tag/Makefile
> > new file mode 100644
> > index 000000000000..f2b8fc022c3b
> > --- /dev/null
> > +++ b/tools/testing/selftests/alloc_tag/Makefile
> > @@ -0,0 +1,9 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +TEST_GEN_PROGS :=3D allocinfo_ioctl_test
> > +
> > +CFLAGS +=3D -Wall
> > +CFLAGS +=3D -I../../../../usr/include
>
>
> I think we should replace -I../../../../usr/include with $(KHDR_INCLUDES)=
.
>
>
> > +
> > +include ../lib.mk
> > +
>
>
> We would also introduce an extra field in the parent directory,
>
> allowing our alloc_tag target to be built when running make
>
> within /home/linux/tools/testing/selftests.
>
> like this:
>
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   TARGETS +=3D acct
> +TARGETS +=3D alloc_tag
>   TARGETS +=3D alsa
>   TARGETS +=3D amd-pstate
>   TARGETS +=3D arm64
>
> Below is the relevant build log:
>
> [root@localhost selftests]# make -j8
>    CC       acct_syscall
>    CC       allocinfo_ioctl_test
>
> Below is the log from running make clean:
>
> [root@localhost selftests]# make clean
> rm -f -r /home/linux/tools/testing/selftests/acct/acct_syscall
> rm -f -r /home/linux/tools/testing/selftests/alloc_tag/allocinfo_ioctl_te=
st
>
>
> (Sorry about this inconvenience. I had limited experience with the
> kselftest framework,
>
> so I reached out to my teammates to sort out the relevant build logic.
>
> It's my fault for not catching this issue in prior reviews
>
> and forcing you to send a revised patch.)
>
>
Before writing this patch, I had discussed this with Suren and he was
of the opinion that this should be done later in a separate patch. So
I'll let Suren answer this further.

> > diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b=
/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > new file mode 100644
> > index 000000000000..62d5a488a04d
> > --- /dev/null
> > +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > @@ -0,0 +1,331 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +/* kselftest for allocinfo ioctl
> > + * allocinfo ioctl retrives allocinfo data through ioctl
> > + * Copyright (C) 2026 Google, Inc.
> > + */
> > +
> > +#include <errno.h>
>
>
> errno.h is unused and may be dropped.
>
>
> > +#include <fcntl.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <stdbool.h>
> > +#include <unistd.h>
> > +#include <sys/ioctl.h>
> > +#include <linux/types.h>
> > +#include <linux/alloc_tag.h>
> > +#include "../kselftest.h"
> > +
> > +#define MAX_LINE_LEN         512
> > +#define ALLOCINFO_PROC               "/proc/allocinfo"
> > +
> > +enum ioctl_ret {
> > +     IOCTL_SUCCESS =3D 0,
> > +     IOCTL_FAILURE =3D 1,
> > +     IOCTL_INVALID_DATA =3D 2,
> > +};
> > +
> > +#define VEC_MAX_ENTRIES 32
> > +
> > +struct allocinfo_tag_data_vec {
> > +     struct allocinfo_tag_data tag[VEC_MAX_ENTRIES];
> > +     __u64 count;
> > +};
> > +
> > +static inline int __allocinfo_get_content_id(int dev_fd, struct alloci=
nfo_content_id *params)
> > +{
> > +     return ioctl(dev_fd, ALLOCINFO_IOC_CONTENT_ID, params);
> > +}
> > +
> > +static inline int __allocinfo_get_at(int dev_fd, struct allocinfo_get_=
at *params)
> > +{
> > +     return ioctl(dev_fd, ALLOCINFO_IOC_GET_AT, params);
> > +}
> > +
> > +static inline int __allocinfo_get_next(int dev_fd, struct allocinfo_ta=
g_data *params)
> > +{
> > +     return ioctl(dev_fd, ALLOCINFO_IOC_GET_NEXT, params);
> > +}
> > +
> > +static bool match_entry(const struct allocinfo_tag_data *procfs_entry,
> > +                     const struct allocinfo_tag_data *tag_data,
> > +                     bool match_bytes, bool match_calls, bool match_li=
neno,
> > +                     bool match_function, bool match_filename)
> > +{
> > +     if (match_bytes && tag_data->counter.bytes !=3D procfs_entry->cou=
nter.bytes) {
> > +             ksft_print_msg("size retrieved through ioctl does not mat=
ch procfs\n");
> > +             return false;
> > +     }
> > +
> > +     if (match_calls && tag_data->counter.calls !=3D procfs_entry->cou=
nter.calls) {
> > +             ksft_print_msg("call count retrieved through ioctl does n=
ot match procfs\n");
> > +             return false;
> > +     }
> > +
> > +     if (match_lineno && tag_data->tag.lineno !=3D procfs_entry->tag.l=
ineno) {
> > +             ksft_print_msg("lineno retrieved through ioctl does not m=
atch procfs\n");
> > +             return false;
> > +     }
> > +
> > +     if (match_function &&
> > +         strncmp(tag_data->tag.function, procfs_entry->tag.function, A=
LLOCINFO_STR_SIZE)) {
> > +             ksft_print_msg("function retrieved through ioctl does not=
 match procfs\n");
> > +             return false;
> > +     }
> > +
> > +     if (match_filename &&
> > +         strncmp(tag_data->tag.filename, procfs_entry->tag.filename, A=
LLOCINFO_STR_SIZE)) {
> > +             ksft_print_msg("filename retrieved through ioctl does not=
 match procfs\n");
> > +             return false;
> > +     }
> > +     return true;
> > +}
> > +
> > +static bool match_entries(const struct allocinfo_tag_data_vec *procfs_=
entries,
> > +                       const struct allocinfo_tag_data_vec *tags,
> > +                       bool match_bytes, bool match_calls, bool match_=
lineno,
> > +                       bool match_function, bool match_filename)
> > +{
> > +     __u64 i;
> > +
> > +     if (procfs_entries->count !=3D tags->count) {
> > +             ksft_print_msg("Entry count mismatch. ioctl entries: %llu=
, proc entries: %llu\n",
> > +                            tags->count, procfs_entries->count);
> > +             return false;
> > +     }
> > +     for (i =3D 0; i < procfs_entries->count; i++) {
> > +             if (!match_entry(&procfs_entries->tag[i], &tags->tag[i],
> > +                              match_bytes, match_calls, match_lineno,
> > +                              match_function, match_filename)) {
> > +                     ksft_print_msg("%lluth entry does not match.\n", =
i);
> > +                     return false;
> > +             }
> > +     }
> > +     return true;
> > +}
> > +
> > +static const char *allocinfo_str(const char *str)
> > +{
> > +     size_t len =3D strlen(str);
> > +
> > +     if (len >=3D ALLOCINFO_STR_SIZE)
> > +             str +=3D (len - ALLOCINFO_STR_SIZE) + 1;
> > +     return str;
> > +}
> > +
> > +static void allocinfo_copy_str(char *dest, const char *src)
> > +{
> > +     strncpy(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE - 1);
> > +     dest[ALLOCINFO_STR_SIZE - 1] =3D '\0';
> > +}
> > +
> > +static int get_filtered_procfs_entries(struct allocinfo_tag_data_vec *=
procfs_entries,
> > +                                    const struct allocinfo_filter *fil=
ter)
> > +{
> > +     FILE *fp =3D fopen(ALLOCINFO_PROC, "r");
> > +     char line[MAX_LINE_LEN];
> > +     int matches;
> > +     struct allocinfo_tag_data procfs_entry;
> > +
> > +     if (!fp) {
> > +             ksft_print_msg("Failed to open " ALLOCINFO_PROC " for rea=
ding\n");
> > +             return 1;
> > +     }
> > +     memset(procfs_entries, 0, sizeof(*procfs_entries));
> > +     while (fgets(line, sizeof(line), fp) && procfs_entries->count < V=
EC_MAX_ENTRIES) {
> > +             char filename[MAX_LINE_LEN];
> > +             char function[MAX_LINE_LEN];
> > +
> > +             memset(&procfs_entry, 0, sizeof(procfs_entry));
> > +             matches =3D sscanf(line, "%llu %llu %[^:]:%llu func:%s",
> > +                              &procfs_entry.counter.bytes,
> > +                              &procfs_entry.counter.calls,
> > +                              filename,
> > +                              &procfs_entry.tag.lineno,
> > +                              function);
> > +
> > +             if (matches !=3D 5)
> > +                     continue;
> > +
> > +             allocinfo_copy_str(procfs_entry.tag.filename, filename);
> > +             allocinfo_copy_str(procfs_entry.tag.function, function);
> > +
> > +             if (filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) {
> > +                     if (strncmp(procfs_entry.tag.filename,
> > +                                 filter->fields.filename, ALLOCINFO_ST=
R_SIZE))
> > +                             continue;
> > +             }
> > +             if (filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) {
> > +                     if (strncmp(procfs_entry.tag.function,
> > +                                 filter->fields.function, ALLOCINFO_ST=
R_SIZE))
> > +                             continue;
> > +             }
> > +             if (filter->mask & ALLOCINFO_FILTER_MASK_LINENO) {
> > +                     if (procfs_entry.tag.lineno !=3D filter->fields.l=
ineno)
> > +                             continue;
> > +             }
> > +             if (filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) {
> > +                     if (procfs_entry.counter.bytes < filter->min_size=
)
> > +                             continue;
> > +             }
> > +             if (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) {
> > +                     if (procfs_entry.counter.bytes > filter->max_size=
)
> > +                             continue;
> > +             }
> > +
> > +             memcpy(&procfs_entries->tag[procfs_entries->count++], &pr=
ocfs_entry,
> > +                    sizeof(procfs_entry));
> > +     }
> > +     fclose(fp);
> > +     return 0;
> > +}
> > +
> > +static enum ioctl_ret get_filtered_ioctl_entries(struct allocinfo_tag_=
data_vec *tags,
> > +                                              const struct allocinfo_f=
ilter *filter,
> > +                                              __u64 start_pos)
> > +{
> > +     int fd =3D open(ALLOCINFO_PROC, O_RDONLY);
> > +
> > +     if (fd < 0) {
> > +             ksft_print_msg("Failed to open " ALLOCINFO_PROC " for IOC=
TL\n");
> > +             return IOCTL_FAILURE;
> > +     }
> > +     struct allocinfo_content_id start_cont_id, end_cont_id;
> > +     struct allocinfo_get_at get_at_params;
> > +     const int max_retries =3D 10;
> > +     int retry_count =3D 0;
> > +     int status;
> > +
> > +     /*
> > +      * __allocinfo_get_content_id may return different values if a ke=
rnel module was loaded
> > +      * between the two calls. If that happens, the data gathered cann=
ot be considered consistent
> > +      * and hence needs to be fetched again to avoid flakiness.
> > +      */
> > +     do {
> > +             if (__allocinfo_get_content_id(fd, &start_cont_id)) {
> > +                     ksft_print_msg("allocinfo_get_content_id failed\n=
");
> > +                     return IOCTL_FAILURE;
>
> Sashiko pointed out the fd leak in get_filtered_ioctl_entries().
>
> Since we already need to update the patch to fix the missing
>
> TARGETS entry in the top-level Makefile, we might as well fix
>
> this at the same time.
>
>
> Thanks
>
> Best Regards
>
> Hao
>

Ahh I missed this code path interestingly. Ack, I'll remove these
return statements here.

> > +             }
> > +
> > +             memset(tags, 0, sizeof(*tags));
> > +             memset(&get_at_params, 0, sizeof(get_at_params));
> > +             memcpy(&get_at_params.filter, filter, sizeof(*filter));
> > +             get_at_params.pos =3D start_pos;
> > +             if (__allocinfo_get_at(fd, &get_at_params)) {
> > +                     ksft_print_msg("allocinfo_get_at failed\n");
> > +                     return IOCTL_FAILURE;
> > +             }
> > +             memcpy(&tags->tag[tags->count++], &get_at_params.data, si=
zeof(get_at_params.data));
> > +
> > +             while (tags->count < VEC_MAX_ENTRIES &&
> > +                    __allocinfo_get_next(fd, &tags->tag[tags->count]) =
=3D=3D 0)
> > +                     tags->count++;
> > +
> > +             if (__allocinfo_get_content_id(fd, &end_cont_id)) {
> > +                     ksft_print_msg("allocinfo_get_content_id failed\n=
");
> > +                     return IOCTL_FAILURE;
> > +             }
> > +
> > +             if (start_cont_id.id =3D=3D end_cont_id.id) {
> > +                     status =3D IOCTL_SUCCESS;
> > +             } else {
> > +                     ksft_print_msg("allocinfo_get_content_id mismatch=
, retrying...\n");
> > +                     status =3D IOCTL_INVALID_DATA;
> > +             }
> > +     } while (status =3D=3D IOCTL_INVALID_DATA && retry_count++ < max_=
retries);
> > +
> > +     close(fd);
> > +     return status;
> > +}
> > +
> > +static int run_filter_test(const struct allocinfo_filter *filter)
> > +{
> > +     struct allocinfo_tag_data_vec *tags =3D malloc(sizeof(*tags));
> > +     struct allocinfo_tag_data_vec *procfs_entries =3D malloc(sizeof(*=
procfs_entries));
> > +     int ioctl_status;
> > +     int ret =3D KSFT_PASS;
> > +
> > +     if (!tags || !procfs_entries) {
> > +             ksft_print_msg("Memory allocation failed.\n");
> > +             ret =3D KSFT_FAIL;
> > +             goto exit;
> > +     }
> > +
> > +     if (get_filtered_procfs_entries(procfs_entries, filter)) {
> > +             ksft_print_msg("Error retrieving entries from " ALLOCINFO=
_PROC "\n");
> > +             ret =3D KSFT_SKIP;
> > +             goto exit;
> > +     }
> > +
> > +     if (procfs_entries->count =3D=3D 0) {
> > +             ksft_print_msg("No entries found in " ALLOCINFO_PROC ", s=
kipping test\n");
> > +             ret =3D KSFT_SKIP;
> > +             goto exit;
> > +     }
> > +
> > +     ioctl_status =3D get_filtered_ioctl_entries(tags, filter, 0);
> > +     if (ioctl_status =3D=3D IOCTL_INVALID_DATA) {
> > +             ksft_print_msg("Trouble retrieving valid IOCTL entries, s=
kipping.\n");
> > +             ret =3D KSFT_SKIP;
> > +             goto exit;
> > +     }
> > +     if (ioctl_status =3D=3D IOCTL_FAILURE) {
> > +             ksft_print_msg("Error retrieving IOCTL entries.\n");
> > +             ret =3D KSFT_FAIL;
> > +             goto exit;
> > +     }
> > +
> > +     if (!match_entries(procfs_entries, tags, false, false, true, true=
, true))
> > +             ret =3D KSFT_FAIL;
> > +
> > +exit:
> > +     free(tags);
> > +     free(procfs_entries);
> > +     return ret;
> > +}
> > +
> > +static int test_filename_filter(void)
> > +{
> > +     struct allocinfo_filter filter;
> > +     const char *target_filename =3D "mm/memory.c";
> > +
> > +     memset(&filter, 0, sizeof(filter));
> > +     filter.mask |=3D ALLOCINFO_FILTER_MASK_FILENAME;
> > +     strncpy(filter.fields.filename, target_filename, ALLOCINFO_STR_SI=
ZE);
> > +
> > +     return run_filter_test(&filter);
> > +}
> > +
> > +static int test_function_filter(void)
> > +{
> > +     struct allocinfo_filter filter;
> > +     const char *target_function =3D "dup_mm";
> > +
> > +     memset(&filter, 0, sizeof(filter));
> > +     filter.mask |=3D ALLOCINFO_FILTER_MASK_FUNCTION;
> > +     strncpy(filter.fields.function, target_function, ALLOCINFO_STR_SI=
ZE);
> > +
> > +     return run_filter_test(&filter);
> > +}
> > +
> > +int main(int argc, char *argv[])
> > +{
> > +     int ret;
> > +
> > +     ksft_set_plan(2);
> > +
> > +     ret =3D test_filename_filter();
> > +     if (ret =3D=3D KSFT_SKIP)
> > +             ksft_test_result_skip("Skipping test_filename_filter\n");
> > +     else
> > +             ksft_test_result(ret =3D=3D KSFT_PASS, "test_filename_fil=
ter\n");
> > +
> > +     ret =3D test_function_filter();
> > +     if (ret =3D=3D KSFT_SKIP)
> > +             ksft_test_result_skip("Skipping test_function_filter\n");
> > +     else
> > +             ksft_test_result(ret =3D=3D KSFT_PASS, "test_function_fil=
ter\n");
> > +
> > +     ksft_finished();
> > +}
