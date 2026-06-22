Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4467830C157
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 03:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782098453; cv=none; b=pM7gteoB1EuntP3305yJ5/HEgSBbM4IbFymYqhnHLRqtDU+kJQFGAcWxhUNBGqcJFBvJXSlxEMRrdzbnCQLEuo1YmquVnuq7Iu0WNRJ4+maXaakx1qeTtaqPMyWg/52fdBBeaUZUSDvd0yCOU7eIu+f9kKAjAGrXEbg16IH2dRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782098453; c=relaxed/simple;
	bh=ngXTELwj/dY5wq5iMRY+KgLBhO8examGzHCS7Ik9lT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJ5xpMiO/zGc3deXJtuoIkisplen28A+ezeJoqdaPbcUgIBr/Q+eNMeLmgJm0SIn/OedT2coNIJUk5aQHIfymEqumGglNL0aRQqDYwoH8uKLt92V4IBROJjSAs1AsXO3MkRZrZWHFHoRg3WB1Xux12uVjHdobAcA7mVxBM9bEY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cdo7B1vW; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cdo7B1vW"
Message-ID: <59ed6002-c071-429e-91a7-93623b1b4693@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782098439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UboUZ7fguY8gp8es7Nt/C+EvP//xGAt+Mw8t3dTsSpQ=;
	b=cdo7B1vWdJRPFhxlWEGqZeJG0zJ+NAoTCBg/Sp9Xzrsoh6RGTSzJDtQMEfNw2iEqbSnP+h
	nuJomBux4Efi3pSlO1g1rK3Qbs4GNUG0JeY2pCKUXeu37THZtbr0QXIdTL1WICckiay4Or
	iDSRhjkoyr3Y1c2SzaxkOuTOUnPIoPo=
Date: Mon, 22 Jun 2026 11:20:16 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v6 5/6] kselftest: alloc_tag: add kselftest for ioctl
 interface
To: Suren Baghdasaryan <surenb@google.com>,
 Abhishek Bapat <abhishekbapat@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>
References: <cover.1781803482.git.abhishekbapat@google.com>
 <1d729195a8d11fadb1a1fb78c64633d46843ffe3.1781803482.git.abhishekbapat@google.com>
 <CAJuCfpHPBq7TiD1wfvMyVWbBOw9prEY7LvoLveeoYQOuEEJabg@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <CAJuCfpHPBq7TiD1wfvMyVWbBOw9prEY7LvoLveeoYQOuEEJabg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 2026/6/21 08:10, Suren Baghdasaryan wrote:
> On Thu, Jun 18, 2026 at 10:36 AM Abhishek Bapat
> <abhishekbapat@google.com> wrote:
>> Introduce a kselftest to verify the new IOCTL-based interface for
>> /proc/allocinfo. The test covers:
>>
>> 1. Validation of the filename filter.
>> 2. Validation of the function filter.
>>
>> The first test validates the functionality of the filename filter. Using
>> "mm/memory.c" as the candidate filename filter, it retrieves filtered
>> entries from both procfs and ioctl and matches the first VEC_MAX_ENTRIES
>> entries.
>>
>> The second test validates the functionality of the function filter.
>> It uses "dup_mm" as the candidate function as we do not expect this
>> function name to change frequently and hence won't be needing to modify
>> this test often.
>>
>> Note that both the tests match line no, function name and file name
>> fields. Bytes allocated and calls are not matched as those values may
>> change in the time when the data is being read from procfs and ioctl and
>> hence can lead to false negatives.
>>
>> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
>> ---
>>   MAINTAINERS                                   |   1 +
>>   tools/testing/selftests/Makefile              |   1 +
>>   tools/testing/selftests/alloc_tag/Makefile    |   9 +
>>   .../alloc_tag/allocinfo_ioctl_test.c          | 335 ++++++++++++++++++
>>   4 files changed, 346 insertions(+)
>>   create mode 100644 tools/testing/selftests/alloc_tag/Makefile
>>   create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 019cc4c285a3..6610dd42e484 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -16715,6 +16715,7 @@ F:      include/linux/alloc_tag.h
>>   F:     include/linux/pgalloc_tag.h
>>   F:     include/uapi/linux/alloc_tag.h
>>   F:     lib/alloc_tag.c
>> +F:     tools/testing/selftests/alloc_tag/
>>
>>   MEMORY CONTROLLER DRIVERS
>>   M:     Krzysztof Kozlowski <krzk@kernel.org>
>> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
>> index 6e59b8f63e41..276a78c64736 100644
>> --- a/tools/testing/selftests/Makefile
>> +++ b/tools/testing/selftests/Makefile
>> @@ -1,5 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   TARGETS += acct
>> +TARGETS += alloc_tag
>>   TARGETS += alsa
>>   TARGETS += amd-pstate
>>   TARGETS += arm64
>> diff --git a/tools/testing/selftests/alloc_tag/Makefile b/tools/testing/selftests/alloc_tag/Makefile
>> new file mode 100644
>> index 000000000000..f2b8fc022c3b
>> --- /dev/null
>> +++ b/tools/testing/selftests/alloc_tag/Makefile
>> @@ -0,0 +1,9 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +TEST_GEN_PROGS := allocinfo_ioctl_test
>> +
>> +CFLAGS += -Wall
>> +CFLAGS += -I../../../../usr/include
> I recall Hao suggested replacing this path with $(KHDR_INCLUDES). Have
> you tried that?

Hi Suren and Abhishek

Yes, I suggested this in my previous email.

Using CFLAGS += -I../../../../usr/include fails to support out-of-tree 
build workflows.

I ran the following command:

make O=/home alldebug_defconfig

make O=/home -j8

make O=/home headers_install

make -C tools/testing/selftests/ TARGETS=alloc_tag O=/home/


[root@localhost linux]# make -C tools/testing/selftests 
TARGETS=alloc_tag O=/home/
make: Entering directory '/home/linux/tools/testing/selftests'
   CC       allocinfo_ioctl_test
allocinfo_ioctl_test.c:16:10: fatal error: linux/alloc_tag.h: No such 
file or directory
    16 | #include <linux/alloc_tag.h>
       |          ^~~~~~~~~~~~~~~~~~~
compilation terminated.
make: *** [allocinfo_ioctl_test] Error 1


Therefore, using $(KHDR_INCLUDES) here is more appropriate. The 
corresponding build flow is as follows:

https://elixir.bootlin.com/linux/v7.1/source/tools/testing/selftests/Makefile#L198


After modification, the compilation output is shown below:

[root@localhost linux]# make -C tools/testing/selftests 
TARGETS=alloc_tag O=/home/
make: Entering directory '/home/linux/tools/testing/selftests'
   CC       allocinfo_ioctl_test
make: Leaving directory '/home/linux/tools/testing/selftests'

[root@localhost linux]# ls /home/kselftest/alloc_tag/allocinfo_ioctl_test
/home/kselftest/alloc_tag/allocinfo_ioctl_test
[root@localhost linux]#


Thanks

Best Regards

Hao


>
>> +
>> +include ../lib.mk
>> +
>> diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
>> new file mode 100644
>> index 000000000000..1ae0291f2245
>> --- /dev/null
>> +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
>> @@ -0,0 +1,335 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/* kselftest for allocinfo ioctl
>> + * allocinfo ioctl retrives allocinfo data through ioctl
>> + * Copyright (C) 2026 Google, Inc.
>> + */
>> +
>> +#include <fcntl.h>
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <stdbool.h>
>> +#include <unistd.h>
>> +#include <sys/ioctl.h>
>> +#include <linux/types.h>
>> +#include <linux/alloc_tag.h>
>> +#include "../kselftest.h"
>> +
>> +#define MAX_LINE_LEN           512
>> +#define ALLOCINFO_PROC         "/proc/allocinfo"
>> +
>> +enum ioctl_ret {
>> +       IOCTL_SUCCESS = 0,
>> +       IOCTL_FAILURE = 1,
>> +       IOCTL_INVALID_DATA = 2,
>> +};
>> +
>> +#define VEC_MAX_ENTRIES 32
>> +
>> +struct allocinfo_tag_data_vec {
>> +       struct allocinfo_tag_data tag[VEC_MAX_ENTRIES];
>> +       __u64 count;
>> +};
>> +
>> +static inline int __allocinfo_get_content_id(int dev_fd, struct allocinfo_content_id *params)
>> +{
>> +       return ioctl(dev_fd, ALLOCINFO_IOC_CONTENT_ID, params);
>> +}
>> +
>> +static inline int __allocinfo_get_at(int dev_fd, struct allocinfo_get_at *params)
>> +{
>> +       return ioctl(dev_fd, ALLOCINFO_IOC_GET_AT, params);
>> +}
>> +
>> +static inline int __allocinfo_get_next(int dev_fd, struct allocinfo_tag_data *params)
>> +{
>> +       return ioctl(dev_fd, ALLOCINFO_IOC_GET_NEXT, params);
>> +}
>> +
>> +static bool match_entry(const struct allocinfo_tag_data *procfs_entry,
>> +                       const struct allocinfo_tag_data *tag_data,
>> +                       bool match_bytes, bool match_calls, bool match_lineno,
>> +                       bool match_function, bool match_filename)
>> +{
>> +       if (match_bytes && tag_data->counter.bytes != procfs_entry->counter.bytes) {
>> +               ksft_print_msg("size retrieved through ioctl does not match procfs\n");
>> +               return false;
>> +       }
>> +
>> +       if (match_calls && tag_data->counter.calls != procfs_entry->counter.calls) {
>> +               ksft_print_msg("call count retrieved through ioctl does not match procfs\n");
>> +               return false;
>> +       }
>> +
>> +       if (match_lineno && tag_data->tag.lineno != procfs_entry->tag.lineno) {
>> +               ksft_print_msg("lineno retrieved through ioctl does not match procfs\n");
>> +               return false;
>> +       }
>> +
>> +       if (match_function &&
>> +           strncmp(tag_data->tag.function, procfs_entry->tag.function, ALLOCINFO_STR_SIZE)) {
>> +               ksft_print_msg("function retrieved through ioctl does not match procfs\n");
>> +               return false;
>> +       }
>> +
>> +       if (match_filename &&
>> +           strncmp(tag_data->tag.filename, procfs_entry->tag.filename, ALLOCINFO_STR_SIZE)) {
>> +               ksft_print_msg("filename retrieved through ioctl does not match procfs\n");
>> +               return false;
>> +       }
>> +       return true;
>> +}
>> +
>> +static bool match_entries(const struct allocinfo_tag_data_vec *procfs_entries,
>> +                         const struct allocinfo_tag_data_vec *tags,
>> +                         bool match_bytes, bool match_calls, bool match_lineno,
>> +                         bool match_function, bool match_filename)
>> +{
>> +       __u64 i;
>> +
>> +       if (procfs_entries->count != tags->count) {
>> +               ksft_print_msg("Entry count mismatch. ioctl entries: %llu, proc entries: %llu\n",
>> +                              tags->count, procfs_entries->count);
>> +               return false;
>> +       }
>> +       for (i = 0; i < procfs_entries->count; i++) {
>> +               if (!match_entry(&procfs_entries->tag[i], &tags->tag[i],
>> +                                match_bytes, match_calls, match_lineno,
>> +                                match_function, match_filename)) {
>> +                       ksft_print_msg("%lluth entry does not match.\n", i);
>> +                       return false;
>> +               }
>> +       }
>> +       return true;
>> +}
>> +
>> +static const char *allocinfo_str(const char *str)
>> +{
>> +       size_t len = strlen(str);
>> +
>> +       if (len >= ALLOCINFO_STR_SIZE)
>> +               str += (len - ALLOCINFO_STR_SIZE) + 1;
>> +       return str;
>> +}
>> +
>> +static void allocinfo_copy_str(char *dest, const char *src)
>> +{
>> +       strncpy(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE - 1);
>> +       dest[ALLOCINFO_STR_SIZE - 1] = '\0';
>> +}
>> +
>> +static int get_filtered_procfs_entries(struct allocinfo_tag_data_vec *procfs_entries,
>> +                                      const struct allocinfo_filter *filter)
>> +{
>> +       FILE *fp = fopen(ALLOCINFO_PROC, "r");
>> +       char line[MAX_LINE_LEN];
>> +       int matches;
>> +       struct allocinfo_tag_data procfs_entry;
>> +
>> +       if (!fp) {
>> +               ksft_print_msg("Failed to open " ALLOCINFO_PROC " for reading\n");
>> +               return 1;
>> +       }
>> +       memset(procfs_entries, 0, sizeof(*procfs_entries));
>> +       while (fgets(line, sizeof(line), fp) && procfs_entries->count < VEC_MAX_ENTRIES) {
>> +               char filename[MAX_LINE_LEN];
>> +               char function[MAX_LINE_LEN];
>> +
>> +               memset(&procfs_entry, 0, sizeof(procfs_entry));
>> +               matches = sscanf(line, "%llu %llu %[^:]:%llu func:%s",
>> +                                &procfs_entry.counter.bytes,
>> +                                &procfs_entry.counter.calls,
>> +                                filename,
>> +                                &procfs_entry.tag.lineno,
>> +                                function);
>> +
>> +               if (matches != 5)
>> +                       continue;
>> +
>> +               allocinfo_copy_str(procfs_entry.tag.filename, filename);
>> +               allocinfo_copy_str(procfs_entry.tag.function, function);
>> +
>> +               if (filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) {
>> +                       if (strncmp(procfs_entry.tag.filename,
>> +                                   filter->fields.filename, ALLOCINFO_STR_SIZE))
>> +                               continue;
>> +               }
>> +               if (filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) {
>> +                       if (strncmp(procfs_entry.tag.function,
>> +                                   filter->fields.function, ALLOCINFO_STR_SIZE))
>> +                               continue;
>> +               }
>> +               if (filter->mask & ALLOCINFO_FILTER_MASK_LINENO) {
>> +                       if (procfs_entry.tag.lineno != filter->fields.lineno)
>> +                               continue;
>> +               }
>> +               if (filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) {
>> +                       if (procfs_entry.counter.bytes < filter->min_size)
>> +                               continue;
>> +               }
>> +               if (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) {
>> +                       if (procfs_entry.counter.bytes > filter->max_size)
>> +                               continue;
>> +               }
>> +
>> +               memcpy(&procfs_entries->tag[procfs_entries->count++], &procfs_entry,
>> +                      sizeof(procfs_entry));
>> +       }
>> +       fclose(fp);
>> +       return 0;
>> +}
>> +
>> +static enum ioctl_ret get_filtered_ioctl_entries(struct allocinfo_tag_data_vec *tags,
>> +                                                const struct allocinfo_filter *filter,
>> +                                                __u64 start_pos)
>> +{
>> +       int fd = open(ALLOCINFO_PROC, O_RDONLY);
>> +
>> +       if (fd < 0) {
>> +               ksft_print_msg("Failed to open " ALLOCINFO_PROC " for IOCTL\n");
>> +               return IOCTL_FAILURE;
>> +       }
>> +
>> +       struct allocinfo_content_id start_cont_id, end_cont_id;
>> +       struct allocinfo_get_at get_at_params;
>> +       const int max_retries = 10;
>> +       int retry_count = 0;
>> +       int status;
>> +
>> +       /*
>> +        * __allocinfo_get_content_id may return different values if a kernel module was loaded
>> +        * between the two calls. If that happens, the data gathered cannot be considered consistent
>> +        * and hence needs to be fetched again to avoid flakiness.
>> +        */
>> +       do {
>> +               if (__allocinfo_get_content_id(fd, &start_cont_id)) {
>> +                       ksft_print_msg("allocinfo_get_content_id failed\n");
>> +                       status = IOCTL_FAILURE;
>> +                       goto exit;
> nit: I would prefer a "break" instead of these "goto exit" statements
> for exiting this loop. Makes the code flow more readable IMHO.
>
>> +               }
>> +
>> +               memset(tags, 0, sizeof(*tags));
>> +               memset(&get_at_params, 0, sizeof(get_at_params));
>> +               memcpy(&get_at_params.filter, filter, sizeof(*filter));
>> +               get_at_params.pos = start_pos;
>> +               if (__allocinfo_get_at(fd, &get_at_params)) {
>> +                       ksft_print_msg("allocinfo_get_at failed\n");
>> +                       status = IOCTL_FAILURE;
>> +                       goto exit;
>> +               }
>> +               memcpy(&tags->tag[tags->count++], &get_at_params.data, sizeof(get_at_params.data));
>> +
>> +               while (tags->count < VEC_MAX_ENTRIES &&
>> +                      __allocinfo_get_next(fd, &tags->tag[tags->count]) == 0)
>> +                       tags->count++;
>> +
>> +               if (__allocinfo_get_content_id(fd, &end_cont_id)) {
>> +                       ksft_print_msg("allocinfo_get_content_id failed\n");
>> +                       status = IOCTL_FAILURE;
>> +                       goto exit;
>> +               }
>> +
>> +               if (start_cont_id.id == end_cont_id.id) {
>> +                       status = IOCTL_SUCCESS;
>> +               } else {
>> +                       ksft_print_msg("allocinfo_get_content_id mismatch, retrying...\n");
>> +                       status = IOCTL_INVALID_DATA;
>> +               }
>> +       } while (status == IOCTL_INVALID_DATA && retry_count++ < max_retries);
>> +
>> +exit:
>> +       close(fd);
>> +       return status;
>> +}
>> +
>> +static int run_filter_test(const struct allocinfo_filter *filter)
>> +{
>> +       struct allocinfo_tag_data_vec *tags = malloc(sizeof(*tags));
>> +       struct allocinfo_tag_data_vec *procfs_entries = malloc(sizeof(*procfs_entries));
>> +       int ioctl_status;
>> +       int ret = KSFT_PASS;
>> +
>> +       if (!tags || !procfs_entries) {
>> +               ksft_print_msg("Memory allocation failed.\n");
>> +               ret = KSFT_FAIL;
>> +               goto exit;
>> +       }
>> +
>> +       if (get_filtered_procfs_entries(procfs_entries, filter)) {
>> +               ksft_print_msg("Error retrieving entries from " ALLOCINFO_PROC "\n");
>> +               ret = KSFT_SKIP;
>> +               goto exit;
>> +       }
>> +
>> +       if (procfs_entries->count == 0) {
>> +               ksft_print_msg("No entries found in " ALLOCINFO_PROC ", skipping test\n");
>> +               ret = KSFT_SKIP;
>> +               goto exit;
>> +       }
>> +
>> +       ioctl_status = get_filtered_ioctl_entries(tags, filter, 0);
>> +       if (ioctl_status == IOCTL_INVALID_DATA) {
>> +               ksft_print_msg("Trouble retrieving valid IOCTL entries, skipping.\n");
>> +               ret = KSFT_SKIP;
>> +               goto exit;
>> +       }
>> +       if (ioctl_status == IOCTL_FAILURE) {
>> +               ksft_print_msg("Error retrieving IOCTL entries.\n");
>> +               ret = KSFT_FAIL;
>> +               goto exit;
>> +       }
>> +
>> +       if (!match_entries(procfs_entries, tags, false, false, true, true, true))
>> +               ret = KSFT_FAIL;
>> +
>> +exit:
>> +       free(tags);
>> +       free(procfs_entries);
>> +       return ret;
>> +}
>> +
>> +static int test_filename_filter(void)
>> +{
>> +       struct allocinfo_filter filter;
>> +       const char *target_filename = "mm/memory.c";
>> +
>> +       memset(&filter, 0, sizeof(filter));
>> +       filter.mask |= ALLOCINFO_FILTER_MASK_FILENAME;
>> +       strncpy(filter.fields.filename, target_filename, ALLOCINFO_STR_SIZE);
>> +
>> +       return run_filter_test(&filter);
>> +}
>> +
>> +static int test_function_filter(void)
>> +{
>> +       struct allocinfo_filter filter;
>> +       const char *target_function = "dup_mm";
>> +
>> +       memset(&filter, 0, sizeof(filter));
>> +       filter.mask |= ALLOCINFO_FILTER_MASK_FUNCTION;
>> +       strncpy(filter.fields.function, target_function, ALLOCINFO_STR_SIZE);
>> +
>> +       return run_filter_test(&filter);
>> +}
>> +
>> +int main(int argc, char *argv[])
>> +{
>> +       int ret;
>> +
>> +       ksft_set_plan(2);
>> +
>> +       ret = test_filename_filter();
>> +       if (ret == KSFT_SKIP)
>> +               ksft_test_result_skip("Skipping test_filename_filter\n");
>> +       else
>> +               ksft_test_result(ret == KSFT_PASS, "test_filename_filter\n");
>> +
>> +       ret = test_function_filter();
>> +       if (ret == KSFT_SKIP)
>> +               ksft_test_result_skip("Skipping test_function_filter\n");
>> +       else
>> +               ksft_test_result(ret == KSFT_PASS, "test_function_filter\n");
>> +
>> +       ksft_finished();
>> +}
>> --
>> 2.55.0.rc0.786.g65d90a0328-goog
>>
