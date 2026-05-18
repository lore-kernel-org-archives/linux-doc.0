Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3145C248F62
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 23:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779148111; cv=pass; b=bjUbdyC8eNulm4wjs4iItaoyXvx3/x6+BCH4FwSYm8GnwYfKas5E2C73BcL4TJNmVzZM2ABPFvMK450JhA0l7rkt7W8TeiJFroewcPYwYfyvrh4M4flMGJKOa8WFyIjzyPDYSjs87/LxJE1QkfADTQRTiicnGm5ou7PL+qjWBdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779148111; c=relaxed/simple;
	bh=rp3DCl3ggTZgxTAWnokj6DSLGRfA6Cijf/KqQxxPdhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRV9nTMeXdPeI5CNwNkJYGoEcVV/7g1sphDQO0oy33Xqi0G+0GJH8VZ7V8JbcHKL2usuqUxv+FhItPtxtfCY2SUAZR1e/z6qMLTk7ZRawzgcIn0xx04TBeLjG4KG06SMmuDH0mABglGJHJigsQ3lCLiGNlEWgxOfrckqljjmY1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rQnuViai; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rQnuViai"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso1065ad.0
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 16:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779148110; cv=none;
        d=google.com; s=arc-20240605;
        b=OOJJrW9GMEK1QUs8riXWrztLEffnPHwWO/hF5/5JO/gNcnFbevYUOsd836/4VvTbIN
         v6z/VpSTGQ+iu1pE3VSuGAMZIGqMflpA2V1nPZZBxNN7mh1hACLGjf4Ak3XfVINEk/Fu
         JH6GBfA/jiEucYT0cejtpovbXF5w85EDFKRUO8JxaOaTnAPQ/e1/irLzDTx/ZWF+XRW3
         HatnTaTsUp7wqwd8GiyE4DfdgI9lYlFbo2ouJz8WdW9UXtfokd28SEiN3n3xSkRG1XdJ
         kltkz3gyfuKIC7+/ECJDnogpyafR+4nQ2BWi4kXq522Ymvt146C/tgPJDjyI8Ov8KjI/
         FArw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qITyhY0D78MWVgWOfJpH+CtGmJwy2vENeI+pczv5+/M=;
        fh=IiXaGsgZCpSo+Ku7ZSCuYc479lwvSB9vECuxJqM++Ec=;
        b=duND3RowKVEM0fWCNKX+j8extnhrafnPV/1MFrEsl911mtAW62K5/+HRfoH6ckzFCL
         AvpcqLbxG6JU/08HOddypzI52Fc/cWbD7xgS+PwH8Kvqo06VOB5PLzIMM67K24KtHrLc
         NVkYBbIiG6FKxIe+Ws/a7nj6xHYQ4OafrWFrRTdECztOOKcY7fOK2NSGQQ75cBttwR/9
         VLUU4FM4VbpP5+Va2w/i0Ylx3HymWvbVXsX6W7D7eeY3NL8fcfV1/ERoj5UvqQbnO7x5
         NaGDfmsrPl8+XUF+mXTJk/zSLKUfeMCNQB/4/N/R7XTPxDGNhVmPjAuz/5kE4sPhcsgB
         WIhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779148110; x=1779752910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qITyhY0D78MWVgWOfJpH+CtGmJwy2vENeI+pczv5+/M=;
        b=rQnuViaiWDPwAUabFrNAjNYqghRwAQwt+ohEEY9QQZArNjnWLlmCmhCTVNdmZTc4Cj
         7ekYggWkff4Gt9LyFqXxoV5H3hsRNoI0xuZm6YIprPFiIs2fZ+8mrzoQ5e+aGBqQCZEO
         DSJHljXWki+ZPuqCl36w01LqvcaEJ5mS4KvajtK0zrXUug64A6BFo1LPgWYAFKKbC7I4
         nTZS9oyblvKsiy6Tjb8siZtqS6pJ4MLq2ug5bot0G5iAkq4d6nQKk+wec/U0KOu9QuAq
         csDQvvLtcvfZgbmb1brr6PPXh9MJ/bQb+5br2FN22xdGqGtBvJ0B2xQ/J3QMvBD10udY
         n3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779148110; x=1779752910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qITyhY0D78MWVgWOfJpH+CtGmJwy2vENeI+pczv5+/M=;
        b=kJVH6kdGvicc5O2h9PD9IdL0N0Yd50UTrxlAe3XlyLxwR/a56wNzmRUAJgIU52ZyeJ
         3KdcKVyBX1+jM585mU1m84Atj3Adg4K6kqukflpZqEf68Ld3e+ULS0GDR5hdXi1lsAux
         cvdsr7aY1S1NLYmlFIVmrOiS+pd85UoGztZjDzxrWp1q6IPriSmDhRNPBEcUgnuQc26d
         UXIEJFeGAKFU/lDRLqc3lXIrLyoat+KenRvjag4uIxjBoy3POU4yvsAb2zQ3Nqkp4uoS
         hS5DPCXL3MdkzJE237477kzgkrPK5v2vbWppYjOLLeGsVs6EQeP4jqHzhlv6raHsH1oE
         RwNA==
X-Forwarded-Encrypted: i=1; AFNElJ9XI2HuXR95lR3AtCr/p8Ql034IzP3EVqD3k1FiONn8kv9UcFpKINsmqAmm1vohfqp3BToFXa2/a2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/cAMc6VCJ0q6a79Z8swEX0Tu5wy0RZ+sqSqFkYE59p2OniZcT
	iwAqzbm7qXopdNlDtMRRZSKhreCAAccgAuHiTPYvLPqU2CkmBQT0pUZfLel+QCBuG1GtN+jF6Tn
	ILKRSsy2z3KE1mLwwzwZYCrp3c/hCtypOl+pr7ZoH
X-Gm-Gg: Acq92OEw+lrn6RWLFgVg+3ePMqb3DINxXPM/pnAE1qtGH2fiJddjgtLZ+TEE/xv6RFx
	kXMS8DHTea6R5IONCQrYkpv2T5tu4ZTVdSOYlCQwrvTVKQctR5Xp/Pa7CVh7XNYoeD55q0PkGQP
	pnaZGMJnpicA6Tlak9SqkPTJ+0tJkTggBL5gwoO7FrwRVx+Qmep0SXhL2Lvh16oo9HiarL3MGu1
	04v13mqcrFoIgxxcjmSokuRg1K7ZzcsDakZ4wh08i8OzLUZVosEWi+xrpxlJSRWZmAZgAhQepMe
	8POic2ygz7xMGuE3VoPcRb+YOQwhRQ6hkokXW4eRkFM3/AVn
X-Received: by 2002:a17:903:17cf:b0:2b4:60e6:44bc with SMTP id
 d9443c01a7336-2bdb329b5eamr4190365ad.13.1779148108846; Mon, 18 May 2026
 16:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777936301.git.abhishekbapat@google.com> <6d8a2059a4625ef638062815d9586f7a083d02ec.1777936301.git.abhishekbapat@google.com>
In-Reply-To: <6d8a2059a4625ef638062815d9586f7a083d02ec.1777936301.git.abhishekbapat@google.com>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Mon, 18 May 2026 16:48:17 -0700
X-Gm-Features: AVHnY4K5suSSdtsEAUibGv7Q5I4g9-dyjhnPXdy6-fVf8_5c9_292nNmx9n22cc
Message-ID: <CAL41Mv59qrcvM3=qqjfurb0kq2RsSRELgKU6JGjZva+NxDMw_w@mail.gmail.com>
Subject: Re: [PATCH 5/6] kselftest: alloc_tag: add kselftest for ioctl interface
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 4:36=E2=80=AFPM Abhishek Bapat <abhishekbapat@google=
.com> wrote:
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
>  tools/testing/selftests/alloc_tag/Makefile    |   9 +
>  .../alloc_tag/allocinfo_ioctl_test.c          | 316 ++++++++++++++++++
>  2 files changed, 325 insertions(+)
>  create mode 100644 tools/testing/selftests/alloc_tag/Makefile
>  create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_tes=
t.c
>
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
> +
> +include ../lib.mk
> +
> diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/t=
ools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> new file mode 100644
> index 000000000000..543023ca3d27
> --- /dev/null
> +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> @@ -0,0 +1,316 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* kselftest for allocinfo ioctl
> + * allocinfo ioctl retrives allocinfo data through ioctl
> + * Copyright (C) 2026 Google, Inc.
> + */
> +
> +#include <errno.h>
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
> +static int get_filtered_procfs_entries(struct allocinfo_tag_data_vec *pr=
ocfs_entries,
> +                                      const struct allocinfo_filter *fil=
ter, int fd)
> +{
> +       FILE *fp =3D fdopen(fd, "r");
> +       char line[MAX_LINE_LEN];
> +       int matches, skip_lines =3D 2;
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
> +               /*The first two procfs entries are for the header, so we =
skip them.*/
> +               if (skip_lines-- > 0)
> +                       continue;
This logic will change slightly in the v2 patch set. Currently, the
test skips first two lines from /proc/allocinfo as they're not actual
entries. However, the number of lines to skip might change. Therefore,
the v2 patch set will contain logic that checks for the first line
that matches expected format and will start parsing from that line.
> +
> +               memset(&procfs_entry, 0, sizeof(procfs_entry));
> +               matches =3D sscanf(line, "%llu %llu %[^:]:%llu func:%s",
> +                                &procfs_entry.counter.bytes,
> +                                &procfs_entry.counter.calls,
> +                                procfs_entry.tag.filename,
> +                                &procfs_entry.tag.lineno,
> +                                procfs_entry.tag.function);
> +
> +               if (matches !=3D 5)
> +                       continue;
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
> +                       if (procfs_entry.counter.bytes < filter->fields.m=
in_size)
> +                               continue;
> +               }
> +               if (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) {
> +                       if (procfs_entry.counter.bytes > filter->fields.m=
ax_size)
> +                               continue;
> +               }
> +
> +               memcpy(&procfs_entries->tag[procfs_entries->count++], &pr=
ocfs_entry,
> +                      sizeof(procfs_entry));
> +       }
> +       return 0;
> +}
> +
> +static enum ioctl_ret get_filtered_ioctl_entries(struct allocinfo_tag_da=
ta_vec *tags,
> +                                                const struct allocinfo_f=
ilter *filter, int fd,
> +                                                __u64 start_pos)
> +{
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
> +                       return IOCTL_FAILURE;
> +               }
> +
> +               memset(tags, 0, sizeof(*tags));
> +               memset(&get_at_params, 0, sizeof(get_at_params));
> +               memcpy(&get_at_params.filter, filter, sizeof(*filter));
> +               get_at_params.pos =3D start_pos;
> +               if (__allocinfo_get_at(fd, &get_at_params)) {
> +                       ksft_print_msg("allocinfo_get_at failed\n");
> +                       return IOCTL_FAILURE;
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
> +                       return IOCTL_FAILURE;
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
> +       return status;
> +}
> +
> +static int run_filter_test(const struct allocinfo_filter *filter)
> +{
> +       int fd;
> +       struct allocinfo_tag_data_vec *tags =3D malloc(sizeof(*tags));
> +       struct allocinfo_tag_data_vec *procfs_entries =3D malloc(sizeof(*=
procfs_entries));
> +       int ioctl_status;
> +       int ret =3D KSFT_PASS;
> +
> +       if (!tags || !procfs_entries) {
> +               ksft_print_msg("Memory allocation failed.\n");
> +               ret =3D KSFT_FAIL;
> +               goto freemem;
> +       }
> +
> +       fd =3D open(ALLOCINFO_PROC, O_RDONLY);
> +       if (fd < 0) {
> +               ksft_exit_skip("Failed to open " ALLOCINFO_PROC ": %s\n",=
 strerror(errno));
> +               ret =3D KSFT_FAIL;
> +               goto freemem;
> +       }
> +
> +       if (get_filtered_procfs_entries(procfs_entries, filter, fd)) {
> +               ksft_print_msg("Error retrieving entries from " ALLOCINFO=
_PROC "\n");
> +               ret =3D KSFT_FAIL;
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
> +       ioctl_status =3D get_filtered_ioctl_entries(tags, filter, fd, 0);
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
> +       close(fd);
> +freemem:
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
> 2.54.0.545.g6539524ca2-goog
>
