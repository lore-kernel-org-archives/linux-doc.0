Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA75240D588
	for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 00:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782000633; cv=pass; b=aZ04uA53p1ajlsgfKMtMk3y0SVCuCvVgL37jAaxsU9bSP8Dd7Gp7/pMCl0rM7sRehgU/4anO5jzkqZulSJZ/QR357zDr4TjLw8sCBY4utZLzSFm7SBjTtQ7HJkNoULSHGnBqyZ8G3NWI4QndF0PvBhi4lJbk2dLsgJL33z2Ss44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782000633; c=relaxed/simple;
	bh=hKNLgiiy5HKotKx84qs0YM1+UG7Eym6402FqMwdUKy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaD1OmFN7u+wjWX+4ZxzEWCyl24RHYDnxvyS/f8mNbjbG4prYDfC1ty0WOm9k3TNGHW9jgVsdIdgqta83VRGoj3M67AxS7PmKZ4j6gcst8AVi07FbncvxhZgrOhbRvCpoR2pb3WtB7XiBKRJLRM63xCl/7sNntPZ8VDbfYV4pYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r2XgAbFj; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r2XgAbFj"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5177d1ff061so347881cf.1
        for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 17:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782000630; cv=none;
        d=google.com; s=arc-20260327;
        b=AhCfQTN2p3F7Q8EoM2S9RHk2FUIJb1hIPYSW9Y53w0ea9zywZusqQWMDiwVN4q1/9R
         YxuN6602Hg/pYYfe6XU+Wc6tcxwUblin0FvzPAJW8GexoaIVMacbgd2gNIrv+Cxj7MWc
         FurgnLofTq0+b1SMrf+dlGS/AldUWsCHqkFBAr0B1VC1S+L1NIxE7NTYEBCz25Zh0uY0
         Ma6SWakK8EDdvvYW6J1h+z+WKqSG0t8eQ3rqsXn1rkANGnCoHjeukmaVsmtdZSzmYgpy
         7uNzxhlzWpXJ7J4ny/+RzoNOZMbQs4MU19s+z6jnoUu34AUMR/xkjytywdRjcljptjfT
         j7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4KIUId1f1sVncDnw+MzAlE/xDSKE+kT336E6fD6PfA=;
        fh=LPMSJFzDQGIDI/bwPg5cwW1lXIGxspNFIfTKgE16r2g=;
        b=n2czboGd3zJ9RZCKoGphD/NkbnbGqq4aUq/yFwOwMjZT5hyCebt06yrdBfEa4Jr7tb
         nbRk9olHsQlxyy800Ztpzqfg9FUKmJF0pl0MPJmFhWc2KfDuQMJYW7MUi7Uh5gSE0rOM
         5eKPXwvTX9k4lyviP2F5otr9DZimLs7pGgEpYNUqOFFOVcGmfULB0b1eg70rAnrc787T
         wbBjLVETt60z+DfCORUiClTyvrx+LC4t+EdcrfiiyZoAlrif7Xepzsv5q8vepbuGTU9/
         qvF7ageJp73Mj4pZu8YPm3RMb4eXUuM7y7U8WyWJXtXXh0OgqfNDotFhC5RHxPbEJWa1
         o6pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782000630; x=1782605430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4KIUId1f1sVncDnw+MzAlE/xDSKE+kT336E6fD6PfA=;
        b=r2XgAbFjP8nKnvMoLFKG2F/FvzgWjS4FjSSvYFz24qpF0hiZ6NCE6PmcaCVaVDRUWY
         +AFRrrlxLeae5MMf4W2aE+bfsEVWxsoRmedQ/U3e2SCVm7tjxH1eITKah2AuKXye01Ue
         eHXCuid0hC2VGpyzsgoeP3DAkrnCIUbRG4uMPG1vWGbXAjxcIA4eZ13XGMOLO5F3oQEi
         hRYsc27PmrwZGC2mKeBjj9+Aga73PBOv3ivsg6T1gePHppj67xC5OOZuEd/E8v+AuWur
         iuhS2t3t1XZTFja+pNBLhSHJ6QdmdN8QphEdAprdI6GM8ehckYCkhv3AXM31Bcvs2iku
         uxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782000630; x=1782605430;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4KIUId1f1sVncDnw+MzAlE/xDSKE+kT336E6fD6PfA=;
        b=iqBseZWiKDvexFSmJ9gW70VxjOsHKqr5lbZYMU9I5BcrUQGXLlEXIXf5B5ciLASE0R
         egn5NoQoqvsxc6zi9s23ShKYkOxMBuC+0pdK8Oqv0HdFyiQ07+zWOuTZrNKOHNILZ5qI
         e3Whoz8NtjSdxr2dJ8vknqhcZYKy1F5nlW8fXluJmNdr8ZPPnXbXUB2pBXhv8/3BOkHO
         vo+BMpWjmcV885F74H7ILcDBCrRPEst0KHK5xlX+CWBgDg76thS1CXXEj37qSPHg/6Ti
         J9mCM/ROpD6UVawJrrXPy8lYwBgNhbUDspqjgC8xH9oMlp0hRnTrBPyShrYVlsNxPdKN
         tp0g==
X-Forwarded-Encrypted: i=1; AFNElJ/RnIPVUrxrvVLwuya4zYuyVvEUDtwJ13t8VyW4Azckq2rvOcLqSfJVVMA7+ljRJ2jf7ufIC96VFec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNJNCRMCwZSMjfqjvPzz9d88uwAoHWfa1X6zrZprjx0Dubbi9l
	5q15M8pMs9gva/8bGsN7duLPwie9Myts1GnpXF5uqKkIIlsOQfWKWmsqaEMw2vf/3lZNRlmLtPj
	d5t0PkH8dJsFoFSeCtzS1xB2lEZ+A1pZXMXYz4SnJ
X-Gm-Gg: AfdE7cnorjJhOHZfrvMTuyE80W9qgK+g8VxkZWpaxidovps6F3HhJ3Cwe9xfXVS5wTB
	xCirAIRMfWJpnfs69NKk3mvHvhyXT/P9r89F5CTNPa4OOewo6FyOMrpDmdNpG8Mko5yTfmdrPUM
	c8eTRRWOrCp+GY1Fc6G4jVFT5iqABs+8FUcDExABeVLrHJxajfKXT54ppreKsI2A27F+SiZgHAe
	YSC5Q3FIr3U6F52KCE+9eYbCHU9qqh3gHmD6F8ntVjoHNar1TwyEUDsuRX+lDHhp92XHuY=
X-Received: by 2002:a05:622a:4c1b:b0:516:4f62:85e6 with SMTP id
 d75a77b69052e-519e8d23ffcmr14386541cf.17.1782000628850; Sat, 20 Jun 2026
 17:10:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781803482.git.abhishekbapat@google.com> <1d729195a8d11fadb1a1fb78c64633d46843ffe3.1781803482.git.abhishekbapat@google.com>
In-Reply-To: <1d729195a8d11fadb1a1fb78c64633d46843ffe3.1781803482.git.abhishekbapat@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 20 Jun 2026 17:10:17 -0700
X-Gm-Features: AVVi8Ccp1JWWGh8vuK0OCMvf2qXL_iG1xVRWvCaRYZI7qVBXymsswxgx3mKN_Ao
Message-ID: <CAJuCfpHPBq7TiD1wfvMyVWbBOw9prEY7LvoLveeoYQOuEEJabg@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] kselftest: alloc_tag: add kselftest for ioctl interface
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 10:36=E2=80=AFAM Abhishek Bapat
<abhishekbapat@google.com> wrote:
>
> Introduce a kselftest to verify the new IOCTL-based interface for
> /proc/allocinfo. The test covers:
>
> 1. Validation of the filename filter.
> 2. Validation of the function filter.
>
> The first test validates the functionality of the filename filter. Using
> "mm/memory.c" as the candidate filename filter, it retrieves filtered
> entries from both procfs and ioctl and matches the first VEC_MAX_ENTRIES
> entries.
>
> The second test validates the functionality of the function filter.
> It uses "dup_mm" as the candidate function as we do not expect this
> function name to change frequently and hence won't be needing to modify
> this test often.
>
> Note that both the tests match line no, function name and file name
> fields. Bytes allocated and calls are not matched as those values may
> change in the time when the data is being read from procfs and ioctl and
> hence can lead to false negatives.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> ---
>  MAINTAINERS                                   |   1 +
>  tools/testing/selftests/Makefile              |   1 +
>  tools/testing/selftests/alloc_tag/Makefile    |   9 +
>  .../alloc_tag/allocinfo_ioctl_test.c          | 335 ++++++++++++++++++
>  4 files changed, 346 insertions(+)
>  create mode 100644 tools/testing/selftests/alloc_tag/Makefile
>  create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_tes=
t.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 019cc4c285a3..6610dd42e484 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16715,6 +16715,7 @@ F:      include/linux/alloc_tag.h
>  F:     include/linux/pgalloc_tag.h
>  F:     include/uapi/linux/alloc_tag.h
>  F:     lib/alloc_tag.c
> +F:     tools/testing/selftests/alloc_tag/
>
>  MEMORY CONTROLLER DRIVERS
>  M:     Krzysztof Kozlowski <krzk@kernel.org>
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/M=
akefile
> index 6e59b8f63e41..276a78c64736 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  TARGETS +=3D acct
> +TARGETS +=3D alloc_tag
>  TARGETS +=3D alsa
>  TARGETS +=3D amd-pstate
>  TARGETS +=3D arm64
> diff --git a/tools/testing/selftests/alloc_tag/Makefile b/tools/testing/s=
elftests/alloc_tag/Makefile
> new file mode 100644
> index 000000000000..f2b8fc022c3b
> --- /dev/null
> +++ b/tools/testing/selftests/alloc_tag/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +TEST_GEN_PROGS :=3D allocinfo_ioctl_test
> +
> +CFLAGS +=3D -Wall
> +CFLAGS +=3D -I../../../../usr/include

I recall Hao suggested replacing this path with $(KHDR_INCLUDES). Have
you tried that?

> +
> +include ../lib.mk
> +
> diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/t=
ools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> new file mode 100644
> index 000000000000..1ae0291f2245
> --- /dev/null
> +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> @@ -0,0 +1,335 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* kselftest for allocinfo ioctl
> + * allocinfo ioctl retrives allocinfo data through ioctl
> + * Copyright (C) 2026 Google, Inc.
> + */
> +
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <stdbool.h>
> +#include <unistd.h>
> +#include <sys/ioctl.h>
> +#include <linux/types.h>
> +#include <linux/alloc_tag.h>
> +#include "../kselftest.h"
> +
> +#define MAX_LINE_LEN           512
> +#define ALLOCINFO_PROC         "/proc/allocinfo"
> +
> +enum ioctl_ret {
> +       IOCTL_SUCCESS =3D 0,
> +       IOCTL_FAILURE =3D 1,
> +       IOCTL_INVALID_DATA =3D 2,
> +};
> +
> +#define VEC_MAX_ENTRIES 32
> +
> +struct allocinfo_tag_data_vec {
> +       struct allocinfo_tag_data tag[VEC_MAX_ENTRIES];
> +       __u64 count;
> +};
> +
> +static inline int __allocinfo_get_content_id(int dev_fd, struct allocinf=
o_content_id *params)
> +{
> +       return ioctl(dev_fd, ALLOCINFO_IOC_CONTENT_ID, params);
> +}
> +
> +static inline int __allocinfo_get_at(int dev_fd, struct allocinfo_get_at=
 *params)
> +{
> +       return ioctl(dev_fd, ALLOCINFO_IOC_GET_AT, params);
> +}
> +
> +static inline int __allocinfo_get_next(int dev_fd, struct allocinfo_tag_=
data *params)
> +{
> +       return ioctl(dev_fd, ALLOCINFO_IOC_GET_NEXT, params);
> +}
> +
> +static bool match_entry(const struct allocinfo_tag_data *procfs_entry,
> +                       const struct allocinfo_tag_data *tag_data,
> +                       bool match_bytes, bool match_calls, bool match_li=
neno,
> +                       bool match_function, bool match_filename)
> +{
> +       if (match_bytes && tag_data->counter.bytes !=3D procfs_entry->cou=
nter.bytes) {
> +               ksft_print_msg("size retrieved through ioctl does not mat=
ch procfs\n");
> +               return false;
> +       }
> +
> +       if (match_calls && tag_data->counter.calls !=3D procfs_entry->cou=
nter.calls) {
> +               ksft_print_msg("call count retrieved through ioctl does n=
ot match procfs\n");
> +               return false;
> +       }
> +
> +       if (match_lineno && tag_data->tag.lineno !=3D procfs_entry->tag.l=
ineno) {
> +               ksft_print_msg("lineno retrieved through ioctl does not m=
atch procfs\n");
> +               return false;
> +       }
> +
> +       if (match_function &&
> +           strncmp(tag_data->tag.function, procfs_entry->tag.function, A=
LLOCINFO_STR_SIZE)) {
> +               ksft_print_msg("function retrieved through ioctl does not=
 match procfs\n");
> +               return false;
> +       }
> +
> +       if (match_filename &&
> +           strncmp(tag_data->tag.filename, procfs_entry->tag.filename, A=
LLOCINFO_STR_SIZE)) {
> +               ksft_print_msg("filename retrieved through ioctl does not=
 match procfs\n");
> +               return false;
> +       }
> +       return true;
> +}
> +
> +static bool match_entries(const struct allocinfo_tag_data_vec *procfs_en=
tries,
> +                         const struct allocinfo_tag_data_vec *tags,
> +                         bool match_bytes, bool match_calls, bool match_=
lineno,
> +                         bool match_function, bool match_filename)
> +{
> +       __u64 i;
> +
> +       if (procfs_entries->count !=3D tags->count) {
> +               ksft_print_msg("Entry count mismatch. ioctl entries: %llu=
, proc entries: %llu\n",
> +                              tags->count, procfs_entries->count);
> +               return false;
> +       }
> +       for (i =3D 0; i < procfs_entries->count; i++) {
> +               if (!match_entry(&procfs_entries->tag[i], &tags->tag[i],
> +                                match_bytes, match_calls, match_lineno,
> +                                match_function, match_filename)) {
> +                       ksft_print_msg("%lluth entry does not match.\n", =
i);
> +                       return false;
> +               }
> +       }
> +       return true;
> +}
> +
> +static const char *allocinfo_str(const char *str)
> +{
> +       size_t len =3D strlen(str);
> +
> +       if (len >=3D ALLOCINFO_STR_SIZE)
> +               str +=3D (len - ALLOCINFO_STR_SIZE) + 1;
> +       return str;
> +}
> +
> +static void allocinfo_copy_str(char *dest, const char *src)
> +{
> +       strncpy(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE - 1);
> +       dest[ALLOCINFO_STR_SIZE - 1] =3D '\0';
> +}
> +
> +static int get_filtered_procfs_entries(struct allocinfo_tag_data_vec *pr=
ocfs_entries,
> +                                      const struct allocinfo_filter *fil=
ter)
> +{
> +       FILE *fp =3D fopen(ALLOCINFO_PROC, "r");
> +       char line[MAX_LINE_LEN];
> +       int matches;
> +       struct allocinfo_tag_data procfs_entry;
> +
> +       if (!fp) {
> +               ksft_print_msg("Failed to open " ALLOCINFO_PROC " for rea=
ding\n");
> +               return 1;
> +       }
> +       memset(procfs_entries, 0, sizeof(*procfs_entries));
> +       while (fgets(line, sizeof(line), fp) && procfs_entries->count < V=
EC_MAX_ENTRIES) {
> +               char filename[MAX_LINE_LEN];
> +               char function[MAX_LINE_LEN];
> +
> +               memset(&procfs_entry, 0, sizeof(procfs_entry));
> +               matches =3D sscanf(line, "%llu %llu %[^:]:%llu func:%s",
> +                                &procfs_entry.counter.bytes,
> +                                &procfs_entry.counter.calls,
> +                                filename,
> +                                &procfs_entry.tag.lineno,
> +                                function);
> +
> +               if (matches !=3D 5)
> +                       continue;
> +
> +               allocinfo_copy_str(procfs_entry.tag.filename, filename);
> +               allocinfo_copy_str(procfs_entry.tag.function, function);
> +
> +               if (filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) {
> +                       if (strncmp(procfs_entry.tag.filename,
> +                                   filter->fields.filename, ALLOCINFO_ST=
R_SIZE))
> +                               continue;
> +               }
> +               if (filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) {
> +                       if (strncmp(procfs_entry.tag.function,
> +                                   filter->fields.function, ALLOCINFO_ST=
R_SIZE))
> +                               continue;
> +               }
> +               if (filter->mask & ALLOCINFO_FILTER_MASK_LINENO) {
> +                       if (procfs_entry.tag.lineno !=3D filter->fields.l=
ineno)
> +                               continue;
> +               }
> +               if (filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) {
> +                       if (procfs_entry.counter.bytes < filter->min_size=
)
> +                               continue;
> +               }
> +               if (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) {
> +                       if (procfs_entry.counter.bytes > filter->max_size=
)
> +                               continue;
> +               }
> +
> +               memcpy(&procfs_entries->tag[procfs_entries->count++], &pr=
ocfs_entry,
> +                      sizeof(procfs_entry));
> +       }
> +       fclose(fp);
> +       return 0;
> +}
> +
> +static enum ioctl_ret get_filtered_ioctl_entries(struct allocinfo_tag_da=
ta_vec *tags,
> +                                                const struct allocinfo_f=
ilter *filter,
> +                                                __u64 start_pos)
> +{
> +       int fd =3D open(ALLOCINFO_PROC, O_RDONLY);
> +
> +       if (fd < 0) {
> +               ksft_print_msg("Failed to open " ALLOCINFO_PROC " for IOC=
TL\n");
> +               return IOCTL_FAILURE;
> +       }
> +
> +       struct allocinfo_content_id start_cont_id, end_cont_id;
> +       struct allocinfo_get_at get_at_params;
> +       const int max_retries =3D 10;
> +       int retry_count =3D 0;
> +       int status;
> +
> +       /*
> +        * __allocinfo_get_content_id may return different values if a ke=
rnel module was loaded
> +        * between the two calls. If that happens, the data gathered cann=
ot be considered consistent
> +        * and hence needs to be fetched again to avoid flakiness.
> +        */
> +       do {
> +               if (__allocinfo_get_content_id(fd, &start_cont_id)) {
> +                       ksft_print_msg("allocinfo_get_content_id failed\n=
");
> +                       status =3D IOCTL_FAILURE;
> +                       goto exit;

nit: I would prefer a "break" instead of these "goto exit" statements
for exiting this loop. Makes the code flow more readable IMHO.

> +               }
> +
> +               memset(tags, 0, sizeof(*tags));
> +               memset(&get_at_params, 0, sizeof(get_at_params));
> +               memcpy(&get_at_params.filter, filter, sizeof(*filter));
> +               get_at_params.pos =3D start_pos;
> +               if (__allocinfo_get_at(fd, &get_at_params)) {
> +                       ksft_print_msg("allocinfo_get_at failed\n");
> +                       status =3D IOCTL_FAILURE;
> +                       goto exit;
> +               }
> +               memcpy(&tags->tag[tags->count++], &get_at_params.data, si=
zeof(get_at_params.data));
> +
> +               while (tags->count < VEC_MAX_ENTRIES &&
> +                      __allocinfo_get_next(fd, &tags->tag[tags->count]) =
=3D=3D 0)
> +                       tags->count++;
> +
> +               if (__allocinfo_get_content_id(fd, &end_cont_id)) {
> +                       ksft_print_msg("allocinfo_get_content_id failed\n=
");
> +                       status =3D IOCTL_FAILURE;
> +                       goto exit;
> +               }
> +
> +               if (start_cont_id.id =3D=3D end_cont_id.id) {
> +                       status =3D IOCTL_SUCCESS;
> +               } else {
> +                       ksft_print_msg("allocinfo_get_content_id mismatch=
, retrying...\n");
> +                       status =3D IOCTL_INVALID_DATA;
> +               }
> +       } while (status =3D=3D IOCTL_INVALID_DATA && retry_count++ < max_=
retries);
> +
> +exit:
> +       close(fd);
> +       return status;
> +}
> +
> +static int run_filter_test(const struct allocinfo_filter *filter)
> +{
> +       struct allocinfo_tag_data_vec *tags =3D malloc(sizeof(*tags));
> +       struct allocinfo_tag_data_vec *procfs_entries =3D malloc(sizeof(*=
procfs_entries));
> +       int ioctl_status;
> +       int ret =3D KSFT_PASS;
> +
> +       if (!tags || !procfs_entries) {
> +               ksft_print_msg("Memory allocation failed.\n");
> +               ret =3D KSFT_FAIL;
> +               goto exit;
> +       }
> +
> +       if (get_filtered_procfs_entries(procfs_entries, filter)) {
> +               ksft_print_msg("Error retrieving entries from " ALLOCINFO=
_PROC "\n");
> +               ret =3D KSFT_SKIP;
> +               goto exit;
> +       }
> +
> +       if (procfs_entries->count =3D=3D 0) {
> +               ksft_print_msg("No entries found in " ALLOCINFO_PROC ", s=
kipping test\n");
> +               ret =3D KSFT_SKIP;
> +               goto exit;
> +       }
> +
> +       ioctl_status =3D get_filtered_ioctl_entries(tags, filter, 0);
> +       if (ioctl_status =3D=3D IOCTL_INVALID_DATA) {
> +               ksft_print_msg("Trouble retrieving valid IOCTL entries, s=
kipping.\n");
> +               ret =3D KSFT_SKIP;
> +               goto exit;
> +       }
> +       if (ioctl_status =3D=3D IOCTL_FAILURE) {
> +               ksft_print_msg("Error retrieving IOCTL entries.\n");
> +               ret =3D KSFT_FAIL;
> +               goto exit;
> +       }
> +
> +       if (!match_entries(procfs_entries, tags, false, false, true, true=
, true))
> +               ret =3D KSFT_FAIL;
> +
> +exit:
> +       free(tags);
> +       free(procfs_entries);
> +       return ret;
> +}
> +
> +static int test_filename_filter(void)
> +{
> +       struct allocinfo_filter filter;
> +       const char *target_filename =3D "mm/memory.c";
> +
> +       memset(&filter, 0, sizeof(filter));
> +       filter.mask |=3D ALLOCINFO_FILTER_MASK_FILENAME;
> +       strncpy(filter.fields.filename, target_filename, ALLOCINFO_STR_SI=
ZE);
> +
> +       return run_filter_test(&filter);
> +}
> +
> +static int test_function_filter(void)
> +{
> +       struct allocinfo_filter filter;
> +       const char *target_function =3D "dup_mm";
> +
> +       memset(&filter, 0, sizeof(filter));
> +       filter.mask |=3D ALLOCINFO_FILTER_MASK_FUNCTION;
> +       strncpy(filter.fields.function, target_function, ALLOCINFO_STR_SI=
ZE);
> +
> +       return run_filter_test(&filter);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +       int ret;
> +
> +       ksft_set_plan(2);
> +
> +       ret =3D test_filename_filter();
> +       if (ret =3D=3D KSFT_SKIP)
> +               ksft_test_result_skip("Skipping test_filename_filter\n");
> +       else
> +               ksft_test_result(ret =3D=3D KSFT_PASS, "test_filename_fil=
ter\n");
> +
> +       ret =3D test_function_filter();
> +       if (ret =3D=3D KSFT_SKIP)
> +               ksft_test_result_skip("Skipping test_function_filter\n");
> +       else
> +               ksft_test_result(ret =3D=3D KSFT_PASS, "test_function_fil=
ter\n");
> +
> +       ksft_finished();
> +}
> --
> 2.55.0.rc0.786.g65d90a0328-goog
>
