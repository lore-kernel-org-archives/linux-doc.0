Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EE1382374
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 20:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038466; cv=pass; b=TBeFma5SVNaK9o3n6QAl/h4GjBP58UMH1sS+nTmIT/PhRTrxx3bdJyLi+ah/xvFTMSfgoW3rxYw8ERUbDZofwIpTKeruA6VEsDSe+kx4w+jWiIy+/kXK6raeftDAzJSrCc7x5OjIQbonAlguzM/mSHVAgookvFbWxQdh9/6NpO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038466; c=relaxed/simple;
	bh=rxULBCsb94YSnUURsfkYXKFfi85nVU4r0MYrCaO0Ssw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bAJf3eorv9MrVxWp/bBtTTRJbM69SwNQss9C5E1AqYFdygnVSOLcU9wzhTMYGuBviv4v/3GbGAJESTYemKS4laVAk8U/Kut4OGktpDaB3vjaeAnQejoc5n9lXGknj20MHAWt6bfLr0vByt46BWSMWbEyj80evxBnonijwDIiAuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K37Pjueb; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K37Pjueb"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0b1a48855so5495ad.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 13:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781038464; cv=none;
        d=google.com; s=arc-20240605;
        b=VaOt+bL5gNK+a91xFwU/UlIKk6IeJrJ8AZudosioencr5QwyxD9rnfhTVeyTLLIrVA
         gJ2EPB62yYfz7pXT958EEeRT7VNPIqh3svtiLCoKeWkxyk1cijog83QyJo6+g3Nd4KDQ
         BIi75uGQlX/K1swz3fVD66NnpwHX9DN/cs3wdgHyYPIddX0w8zlcQf8/++5qZ6Ogij3G
         UzH51P+kYLTGeis950FrLU6fzXTH6y5TpTMWyc1M7RlJ/L76QtCkt/XSgVUJZ5m6ZJW2
         XgxIudQlTq2NZYFS3SjB+l7nSV2ItpeH4AxcWd/K+gSo22fcO7l+vJ/U+yxum6IRtAz+
         JeRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tqqw2hwIdYKgB5JLRszYpZYql7zN6WelT6xH9FGqWa0=;
        fh=Cg+/rXsDfiQ9hRFKwiBqRDCFPfzLk9DnZ4PUVpp9Bac=;
        b=TEt2ff46UC8z241Dfy7PY+A8aCmZdqlDCH7htn9lh2Lw/dYlaBpZIkmKL240keJ0zR
         R8jPCsudUVLfB2+vOAtMfAea1uxyCBcRDBz7Nnu0fFb1LeFN9FvZxb79nA9235wnurd3
         FzwKnZ4b9yYq/hkmat2rKbIna4aqt/b0R2WVn13InYiC5H4+edbY6zLYFqqseseY2nsA
         awzG5Ld/VEISETlPT9K9vW3jojw43lXiEKW1KAwi4D97PyBGTC07k0Ust0iLqP+didUi
         Y4LQq3t0Lt1Q8Dlr9ZfluKUfKzwJLmD0T1aru3k9Hi/oQu+16hMofjCfttCMQ+wfwudr
         O24w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781038464; x=1781643264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqqw2hwIdYKgB5JLRszYpZYql7zN6WelT6xH9FGqWa0=;
        b=K37PjuebiDSSwM2T3bOsyzau2n1JEmpw3q0/W4PX590YBJQCqZ+sQFLeHwVNzdRIm6
         r3u/Okd1vW4l7AXTEzMD0YoffAvgEbpBCaXrIrXgT1aAGxNabRNxJhkBRuoHF6p+rnI7
         C8trckR+mnmABS3sOzBwlBxT6WJcSzOjRsNZgh0bSOsIH31EI5idYTR3xDFmfytMIRVi
         lEid+T6SS72a2ATein9fTdQMHM3a9+1BsYbiFiBcwsXJ7phgeri2H1sDhCnOYYgDkE3x
         GmcNO0oe5PTky2K3F/10xMWeawDcb/L8PsG7LgGBO05ydJt5CCo2bIj8nVvaLzArnd4S
         UOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038464; x=1781643264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tqqw2hwIdYKgB5JLRszYpZYql7zN6WelT6xH9FGqWa0=;
        b=OL6KOvbXeASQhGzPI6FyJVUsvLyMphIl5aYVGySVZW7LwdvGRH9CFwXMGiX7k6dgG5
         1I65Jn+/uBLHugroYXuI3AJPS6IIXL7ZZqzEtLQQcCSyCiKi5OgdPWLwG8FJMP1KoccH
         ORxfQbEv7ai912f/xOP+HcRvEg5b6+sOAFC8wB7AbKJsJ24m1E586iX3RrmF9up5nEQg
         YROzRFJrbM/c4Adrk41Uc2yyb7TC8Kf/2jxJKe7gUnIJDXQ8//9aV66k1FPAUXgv30Z2
         5SQo+ysjGEhDFAagi0lIQUcGO+pgKazfMRuj7cm+OPgzT7xQNohtIf9jZlQdnOzPts3F
         SQhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jg6om2qn4kVBQJ6MZ5UQXXbvdJhrNdxL3LDh2sZTmSBI6tCF8Pz3igwjbdiy9rOQqbCw+/FuZ8xA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpFd6kSQhXL+9PlVQIjAE8UmI3gn0crLfqo6cNwbeilSFipMob
	taiRUFyKxJpnRtmY3tABYAnwx1qNcyFB9XqNe3aPF0yb4CZQVvgnqGqzEVz9KJ5v292dAchr4lz
	EaIHd1LBkC4CCZqNsrDRr0OMSgT1XilTJiS2L0yN8
X-Gm-Gg: Acq92OEpUMgRJS+upo00doe4WM5I9AEqcUFInjb2lYVzQrwc8WCapujHtv0DPGM+4Fi
	X1Ctgh0J2lWgmT1aHxq4aj1HBWCmGRLIuQMxx9lfZAVDtwtiHG9uLOKwZ7yUwwFg6z6fUzfjNVs
	hiDqnyJmBkFWlynTzRDBIPpfJ1rlY6GeqW9gG1NL06cUehPW2JM6pyMecGV/T680eyBGEH4xc7W
	sueAVr4J1K+BEnjLAm4X1hiehoK4dGn8+ePoz70lQo+m9RawQ7fl0Xl5W9mJ5AOAgJ3FysHT32p
	RUAO8shwHgMwiMaG9sZF7CZMq1MBUvCJLcOudtoZALBt3qMC
X-Received: by 2002:a17:902:cf0b:b0:2c1:68ba:aa7b with SMTP id
 d9443c01a7336-2c1ebfd6b21mr8209025ad.20.1781038463230; Tue, 09 Jun 2026
 13:54:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780701922.git.abhishekbapat@google.com>
 <2e55b3b1388a4f7a59f670a83f222ba6c836ac4e.1780701922.git.abhishekbapat@google.com>
 <49f725a7-577d-4036-bd5a-5a33fc9e17c3@linux.dev> <26193499-e9dd-45e7-afc2-365685d6a749@linux.dev>
In-Reply-To: <26193499-e9dd-45e7-afc2-365685d6a749@linux.dev>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Tue, 9 Jun 2026 13:54:12 -0700
X-Gm-Features: AVVi8CdOb3SxpKX0t1hUfhz3i-rs5b_W0BECNgZZ22bjrm9-dLjLeFjugSjrW90
Message-ID: <CAL41Mv7Pg4jMeFc=nnpBntv11y=J=N-pj-DGCrWLvQgyQwwcGQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] kselftest: alloc_tag: add kselftest for ioctl interface
To: Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 11:27=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
>
> On 2026/6/9 14:09, Hao Ge wrote:
> > Hi Abhishek
> >
> >
> > On 2026/6/6 07:36, Abhishek Bapat wrote:
> >> Introduce a kselftest to verify the new IOCTL-based interface for
> >> /proc/allocinfo. The test covers:
> >>
> >> 1. Validation of the filename filter.
> >> 2. Validation of the function filter.
> >>
> >> The first test validates the functionality of the filename filter. Usi=
ng
> >> "mm/memory.c" as the candidate filename filter, it retrieves filtered
> >> entries from both procfs and ioctl and matches the first VEC_MAX_ENTRI=
ES
> >> entries.
> >>
> >> The second test validates the functionality of the function filter.
> >> It uses "dup_mm" as the candidate function as we do not expect this
> >> function name to change frequently and hence won't be needing to modif=
y
> >> this test often.
> >>
> >> Note that both the tests match line no, function name and file name
> >> fields. Bytes allocated and calls are not matched as those values may
> >> change in the time when the data is being read from procfs and ioctl a=
nd
> >> hence can lead to false negatives.
> >>
> >> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> >> ---
> >>   MAINTAINERS                                   |   1 +
> >>   tools/testing/selftests/alloc_tag/Makefile    |   9 +
> >>   .../alloc_tag/allocinfo_ioctl_test.c          | 313 ++++++++++++++++=
++
> >>   3 files changed, 323 insertions(+)
> >>   create mode 100644 tools/testing/selftests/alloc_tag/Makefile
> >>   create mode 100644
> >> tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 77f3fc487691..80560f5f1292 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -16713,6 +16713,7 @@ F:    include/linux/alloc_tag.h
> >>   F:    include/linux/pgalloc_tag.h
> >>   F:    include/uapi/linux/alloc_tag.h
> >>   F:    lib/alloc_tag.c
> >> +F:    tools/testing/selftests/alloc_tag/
> >>     MEMORY CONTROLLER DRIVERS
> >>   M:    Krzysztof Kozlowski <krzk@kernel.org>
> >> diff --git a/tools/testing/selftests/alloc_tag/Makefile
> >> b/tools/testing/selftests/alloc_tag/Makefile
> >> new file mode 100644
> >> index 000000000000..f2b8fc022c3b
> >> --- /dev/null
> >> +++ b/tools/testing/selftests/alloc_tag/Makefile
> >> @@ -0,0 +1,9 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +
> >> +TEST_GEN_PROGS :=3D allocinfo_ioctl_test
> >> +
> >> +CFLAGS +=3D -Wall
> >> +CFLAGS +=3D -I../../../../usr/include
> >> +
> >> +include ../lib.mk
> >> +
> >> diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> >> b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> >> new file mode 100644
> >> index 000000000000..5c3c16e86c23
> >> --- /dev/null
> >> +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> >> @@ -0,0 +1,313 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +
> >> +/* kselftest for allocinfo ioctl
> >> + * allocinfo ioctl retrives allocinfo data through ioctl
> >
> >
> > nit: s/retrives/retrieves/
> >
> >
> > I've applied the full patch series locally and ran the kselftest, all
> > 4 tests pass:
> >
> > [root@localhost alloc_tag]# ./allocinfo_ioctl_test
> > 1..4
> > ok 1 test_filename_filter
> > ok 2 test_function_filter
> > ok 3 test_size_filter
> > ok 4 test_lineno_filter
> > # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:0 error:0
> >
> > But there are no tests for ALLOCINFO_FILTER_MASK_MODNAME and
> >
> > ALLOCINFO_FILTER_MASK_INACCURATE.
>
>
> Sorry, please disregard my suggestion about adding tests for
>
> ALLOCINFO_FILTER_MASK_MODNAME and ALLOCINFO_FILTER_MASK_INACCURATE.
>
> ALLOCINFO_FILTER_MASK_MODNAME depends on kernel config and also requires
>
> the module to be loaded. ALLOCINFO_FILTER_MASK_INACCURATE entries may not
>
> be common, unless we can find a stable way to produce them.
>
>
Ack, those are non-trivial to repro and hence we left them out.
> >
> >
> > Thanks
> >
> > Best Regards
> >
> > Hao
> >
> >> + * Copyright (C) 2026 Google, Inc.
> >> + */
> >> +
> >> +#include <errno.h>
> >> +#include <fcntl.h>
> >> +#include <stdio.h>
> >> +#include <stdlib.h>
> >> +#include <string.h>
> >> +#include <stdbool.h>
> >> +#include <unistd.h>
> >> +#include <sys/ioctl.h>
> >> +#include <linux/types.h>
> >> +#include <linux/alloc_tag.h>
> >> +#include "../kselftest.h"
> >> +
> >> +#define MAX_LINE_LEN        512
> >> +#define ALLOCINFO_PROC        "/proc/allocinfo"
> >> +
> >> +enum ioctl_ret {
> >> +    IOCTL_SUCCESS =3D 0,
> >> +    IOCTL_FAILURE =3D 1,
> >> +    IOCTL_INVALID_DATA =3D 2,
> >> +};
> >> +
> >> +#define VEC_MAX_ENTRIES 32
> >> +
> >> +struct allocinfo_tag_data_vec {
> >> +    struct allocinfo_tag_data tag[VEC_MAX_ENTRIES];
> >> +    __u64 count;
> >> +};
> >> +
> >> +static inline int __allocinfo_get_content_id(int dev_fd, struct
> >> allocinfo_content_id *params)
> >> +{
> >> +    return ioctl(dev_fd, ALLOCINFO_IOC_CONTENT_ID, params);
> >> +}
> >> +
> >> +static inline int __allocinfo_get_at(int dev_fd, struct
> >> allocinfo_get_at *params)
> >> +{
> >> +    return ioctl(dev_fd, ALLOCINFO_IOC_GET_AT, params);
> >> +}
> >> +
> >> +static inline int __allocinfo_get_next(int dev_fd, struct
> >> allocinfo_tag_data *params)
> >> +{
> >> +    return ioctl(dev_fd, ALLOCINFO_IOC_GET_NEXT, params);
> >> +}
> >> +
> >> +static bool match_entry(const struct allocinfo_tag_data *procfs_entry=
,
> >> +            const struct allocinfo_tag_data *tag_data,
> >> +            bool match_bytes, bool match_calls, bool match_lineno,
> >> +            bool match_function, bool match_filename)
> >> +{
> >> +    if (match_bytes && tag_data->counter.bytes !=3D
> >> procfs_entry->counter.bytes) {
> >> +        ksft_print_msg("size retrieved through ioctl does not match
> >> procfs\n");
> >> +        return false;
> >> +    }
> >> +
> >> +    if (match_calls && tag_data->counter.calls !=3D
> >> procfs_entry->counter.calls) {
> >> +        ksft_print_msg("call count retrieved through ioctl does not
> >> match procfs\n");
> >> +        return false;
> >> +    }
> >> +
> >> +    if (match_lineno && tag_data->tag.lineno !=3D
> >> procfs_entry->tag.lineno) {
> >> +        ksft_print_msg("lineno retrieved through ioctl does not
> >> match procfs\n");
> >> +        return false;
> >> +    }
> >> +
> >> +    if (match_function &&
> >> +        strncmp(tag_data->tag.function, procfs_entry->tag.function,
> >> ALLOCINFO_STR_SIZE)) {
> >> +        ksft_print_msg("function retrieved through ioctl does not
> >> match procfs\n");
> >> +        return false;
> >> +    }
> >> +
> >> +    if (match_filename &&
> >> +        strncmp(tag_data->tag.filename, procfs_entry->tag.filename,
> >> ALLOCINFO_STR_SIZE)) {
> >> +        ksft_print_msg("filename retrieved through ioctl does not
> >> match procfs\n");
> >> +        return false;
> >> +    }
> >> +    return true;
> >> +}
> >> +
> >> +static bool match_entries(const struct allocinfo_tag_data_vec
> >> *procfs_entries,
> >> +              const struct allocinfo_tag_data_vec *tags,
> >> +              bool match_bytes, bool match_calls, bool match_lineno,
> >> +              bool match_function, bool match_filename)
> >> +{
> >> +    __u64 i;
> >> +
> >> +    if (procfs_entries->count !=3D tags->count) {
> >> +        ksft_print_msg("Entry count mismatch. ioctl entries: %llu,
> >> proc entries: %llu\n",
> >> +                   tags->count, procfs_entries->count);
> >> +        return false;
> >> +    }
> >> +    for (i =3D 0; i < procfs_entries->count; i++) {
> >> +        if (!match_entry(&procfs_entries->tag[i], &tags->tag[i],
> >> +                 match_bytes, match_calls, match_lineno,
> >> +                 match_function, match_filename)) {
> >> +            ksft_print_msg("%lluth entry does not match.\n", i);
> >> +            return false;
> >> +        }
> >> +    }
> >> +    return true;
> >> +}
> >> +
> >> +static int get_filtered_procfs_entries(struct allocinfo_tag_data_vec
> >> *procfs_entries,
> >> +                       const struct allocinfo_filter *filter, int fd)
> >> +{
> >> +    FILE *fp =3D fdopen(fd, "r");
> >> +    char line[MAX_LINE_LEN];
> >> +    int matches;
> >> +    struct allocinfo_tag_data procfs_entry;
> >> +
> >> +    if (!fp) {
> >> +        ksft_print_msg("Failed to open " ALLOCINFO_PROC " for
> >> reading\n");
> >> +        return 1;
> >> +    }
> >> +    memset(procfs_entries, 0, sizeof(*procfs_entries));
> >> +    while (fgets(line, sizeof(line), fp) && procfs_entries->count <
> >> VEC_MAX_ENTRIES) {
> >> +
> >> +        memset(&procfs_entry, 0, sizeof(procfs_entry));
> >> +        matches =3D sscanf(line, "%llu %llu %[^:]:%llu func:%s",
> >> +                 &procfs_entry.counter.bytes,
> >> +                 &procfs_entry.counter.calls,
> >> +                 procfs_entry.tag.filename,
> >> +                 &procfs_entry.tag.lineno,
> >> +                 procfs_entry.tag.function);
> >> +
> >> +        if (matches !=3D 5)
> >> +            continue;
> >> +
> >> +        if (filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) {
> >> +            if (strncmp(procfs_entry.tag.filename,
> >> +                    filter->fields.filename, ALLOCINFO_STR_SIZE))
> >> +                continue;
> >> +        }
> >> +        if (filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) {
> >> +            if (strncmp(procfs_entry.tag.function,
> >> +                    filter->fields.function, ALLOCINFO_STR_SIZE))
> >> +                continue;
> >> +        }
> >> +        if (filter->mask & ALLOCINFO_FILTER_MASK_LINENO) {
> >> +            if (procfs_entry.tag.lineno !=3D filter->fields.lineno)
> >> +                continue;
> >> +        }
> >> +        if (filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) {
> >> +            if (procfs_entry.counter.bytes < filter->min_size)
> >> +                continue;
> >> +        }
> >> +        if (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) {
> >> +            if (procfs_entry.counter.bytes > filter->max_size)
> >> +                continue;
> >> +        }
> >> +
> >> + memcpy(&procfs_entries->tag[procfs_entries->count++], &procfs_entry,
> >> +               sizeof(procfs_entry));
> >> +    }
> >> +    return 0;
> >> +}
> >> +
> >> +static enum ioctl_ret get_filtered_ioctl_entries(struct
> >> allocinfo_tag_data_vec *tags,
> >> +                         const struct allocinfo_filter *filter, int f=
d,
> >> +                         __u64 start_pos)
> >> +{
> >> +    struct allocinfo_content_id start_cont_id, end_cont_id;
> >> +    struct allocinfo_get_at get_at_params;
> >> +    const int max_retries =3D 10;
> >> +    int retry_count =3D 0;
> >> +    int status;
> >> +
> >> +    /*
> >> +     * __allocinfo_get_content_id may return different values if a
> >> kernel module was loaded
> >> +     * between the two calls. If that happens, the data gathered
> >> cannot be considered consistent
> >> +     * and hence needs to be fetched again to avoid flakiness.
> >> +     */
> >> +    do {
> >> +        if (__allocinfo_get_content_id(fd, &start_cont_id)) {
> >> +            ksft_print_msg("allocinfo_get_content_id failed\n");
> >> +            return IOCTL_FAILURE;
> >> +        }
> >> +
> >> +        memset(tags, 0, sizeof(*tags));
> >> +        memset(&get_at_params, 0, sizeof(get_at_params));
> >> +        memcpy(&get_at_params.filter, filter, sizeof(*filter));
> >> +        get_at_params.pos =3D start_pos;
> >> +        if (__allocinfo_get_at(fd, &get_at_params)) {
> >> +            ksft_print_msg("allocinfo_get_at failed\n");
> >> +            return IOCTL_FAILURE;
> >> +        }
> >> +        memcpy(&tags->tag[tags->count++], &get_at_params.data,
> >> sizeof(get_at_params.data));
> >> +
> >> +        while (tags->count < VEC_MAX_ENTRIES &&
> >> +               __allocinfo_get_next(fd, &tags->tag[tags->count]) =3D=
=3D 0)
> >> +            tags->count++;
> >> +
> >> +        if (__allocinfo_get_content_id(fd, &end_cont_id)) {
> >> +            ksft_print_msg("allocinfo_get_content_id failed\n");
> >> +            return IOCTL_FAILURE;
> >> +        }
> >> +
> >> +        if (start_cont_id.id =3D=3D end_cont_id.id) {
> >> +            status =3D IOCTL_SUCCESS;
> >> +        } else {
> >> +            ksft_print_msg("allocinfo_get_content_id mismatch,
> >> retrying...\n");
> >> +            status =3D IOCTL_INVALID_DATA;
> >> +        }
> >> +    } while (status =3D=3D IOCTL_INVALID_DATA && retry_count++ <
> >> max_retries);
> >> +
> >> +    return status;
> >> +}
> >> +
> >> +static int run_filter_test(const struct allocinfo_filter *filter)
> >> +{
> >> +    int fd;
> >> +    struct allocinfo_tag_data_vec *tags =3D malloc(sizeof(*tags));
> >> +    struct allocinfo_tag_data_vec *procfs_entries =3D
> >> malloc(sizeof(*procfs_entries));
> >> +    int ioctl_status;
> >> +    int ret =3D KSFT_PASS;
> >> +
> >> +    if (!tags || !procfs_entries) {
> >> +        ksft_print_msg("Memory allocation failed.\n");
> >> +        ret =3D KSFT_FAIL;
> >> +        goto freemem;
> >> +    }
> >> +
> >> +    fd =3D open(ALLOCINFO_PROC, O_RDONLY);
> >> +    if (fd < 0) {
> >> +        ksft_exit_skip("Failed to open " ALLOCINFO_PROC ": %s\n",
> >> strerror(errno));
> >> +        ret =3D KSFT_FAIL;
> >> +        goto freemem;
> >> +    }
> >> +
> >> +    if (get_filtered_procfs_entries(procfs_entries, filter, fd)) {
> >> +        ksft_print_msg("Error retrieving entries from "
> >> ALLOCINFO_PROC "\n");
> >> +        ret =3D KSFT_FAIL;
> >> +        goto exit;
> >> +    }
> >> +
> >> +    if (procfs_entries->count =3D=3D 0) {
> >> +        ksft_print_msg("No entries found in " ALLOCINFO_PROC ",
> >> skipping test\n");
> >> +        ret =3D KSFT_SKIP;
> >> +        goto exit;
> >> +    }
> >> +
> >> +    ioctl_status =3D get_filtered_ioctl_entries(tags, filter, fd, 0);
> >> +    if (ioctl_status =3D=3D IOCTL_INVALID_DATA) {
> >> +        ksft_print_msg("Trouble retrieving valid IOCTL entries,
> >> skipping.\n");
> >> +        ret =3D KSFT_SKIP;
> >> +        goto exit;
> >> +    }
> >> +    if (ioctl_status =3D=3D IOCTL_FAILURE) {
> >> +        ksft_print_msg("Error retrieving IOCTL entries.\n");
> >> +        ret =3D KSFT_FAIL;
> >> +        goto exit;
> >> +    }
> >> +
> >> +    if (!match_entries(procfs_entries, tags, false, false, true,
> >> true, true))
> >> +        ret =3D KSFT_FAIL;
> >> +
> >> +exit:
> >> +    close(fd);
> >> +freemem:
> >> +    free(tags);
> >> +    free(procfs_entries);
> >> +    return ret;
> >> +}
> >> +
> >> +static int test_filename_filter(void)
> >> +{
> >> +    struct allocinfo_filter filter;
> >> +    const char *target_filename =3D "mm/memory.c";
> >> +
> >> +    memset(&filter, 0, sizeof(filter));
> >> +    filter.mask |=3D ALLOCINFO_FILTER_MASK_FILENAME;
> >> +    strncpy(filter.fields.filename, target_filename,
> >> ALLOCINFO_STR_SIZE);
> >> +
> >> +    return run_filter_test(&filter);
> >> +}
> >> +
> >> +static int test_function_filter(void)
> >> +{
> >> +    struct allocinfo_filter filter;
> >> +    const char *target_function =3D "dup_mm";
> >> +
> >> +    memset(&filter, 0, sizeof(filter));
> >> +    filter.mask |=3D ALLOCINFO_FILTER_MASK_FUNCTION;
> >> +    strncpy(filter.fields.function, target_function,
> >> ALLOCINFO_STR_SIZE);
> >> +
> >> +    return run_filter_test(&filter);
> >> +}
> >> +
> >> +int main(int argc, char *argv[])
> >> +{
> >> +    int ret;
> >> +
> >> +    ksft_set_plan(2);
> >> +
> >> +    ret =3D test_filename_filter();
> >> +    if (ret =3D=3D KSFT_SKIP)
> >> +        ksft_test_result_skip("Skipping test_filename_filter\n");
> >> +    else
> >> +        ksft_test_result(ret =3D=3D KSFT_PASS, "test_filename_filter\=
n");
> >> +
> >> +    ret =3D test_function_filter();
> >> +    if (ret =3D=3D KSFT_SKIP)
> >> +        ksft_test_result_skip("Skipping test_function_filter\n");
> >> +    else
> >> +        ksft_test_result(ret =3D=3D KSFT_PASS, "test_function_filter\=
n");
> >> +
> >> +    ksft_finished();
> >> +}
