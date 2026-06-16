Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E63DA5B5
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 06:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781589688; cv=none; b=ptAfP77l7FQZ7lIPKfxa8oRC7imh5gB8TiSo67DMAHtHAxRuQ8t6fb6NHUy/xX6/NzHDAP0j4dpCRYmYMTzMumTEZ7pP8V12LIqje8C+XxRkonBIdILXrPsLA0RY7H7+DE5Apu6qkyvYna/mbTpl3/1tAVmmq54CMcU0vzmxhsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781589688; c=relaxed/simple;
	bh=NLnmje/2riA8VA+F/jZk4/tl2LJnTHpwsS3pq7/pz9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMmwn4BPKEekNe64mum1gCGojEcR7LTTFLoAizb8cbU5Sjiaq+47j8gMS5hWcssZr8wVmx02md8di8vvWNugLv+DmZ/vP54uLoG2/IzbyiHCGkh1YOAo4d4l8SPjRm4SWu2dShcWbiC9ArshzhHurwhOl44gPu4jvhpT41Plihs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aZ+XmiHw; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aZ+XmiHw"
Message-ID: <f5afcb7a-5b38-4c98-ac3e-529631bda4cb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781589681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/RzKSCmRDq7PKHmptNVVDMu1v4CvhndRv1GCXewJYSo=;
	b=aZ+XmiHwxpQlDXK4jRrQTLU1hGHI66MondhIrrWVWXXSFExdrTmPZ8ECGNkIm23IEIznBN
	P/nI7a3zc3Nr0KPdb3DytAoAdYx2PFdF4LYhE3pBqs4n1wQImsBxSVoAuaKXYWwX27Ad/C
	AWLQp0+JvTQMmPtYExoPK4pSEVlgvqs=
Date: Tue, 16 Jun 2026 14:01:28 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 5/6] kselftest: alloc_tag: add kselftest for ioctl
 interface
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>, Suren Baghdasaryan
 <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
References: <cover.1781564384.git.abhishekbapat@google.com>
 <4d9c8dc420e2019e1fce62ecf31ec40933fce3a8.1781564384.git.abhishekbapat@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <4d9c8dc420e2019e1fce62ecf31ec40933fce3a8.1781564384.git.abhishekbapat@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Abhishek


On 2026/6/16 07:04, Abhishek Bapat wrote:
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
>   MAINTAINERS                                   |   1 +
>   tools/testing/selftests/alloc_tag/Makefile    |   9 +
>   .../alloc_tag/allocinfo_ioctl_test.c          | 331 ++++++++++++++++++
>   3 files changed, 341 insertions(+)
>   create mode 100644 tools/testing/selftests/alloc_tag/Makefile
>   create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 019cc4c285a3..6610dd42e484 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16715,6 +16715,7 @@ F:	include/linux/alloc_tag.h
>   F:	include/linux/pgalloc_tag.h
>   F:	include/uapi/linux/alloc_tag.h
>   F:	lib/alloc_tag.c
> +F:	tools/testing/selftests/alloc_tag/
>   
>   MEMORY CONTROLLER DRIVERS
>   M:	Krzysztof Kozlowski <krzk@kernel.org>
> diff --git a/tools/testing/selftests/alloc_tag/Makefile b/tools/testing/selftests/alloc_tag/Makefile
> new file mode 100644
> index 000000000000..f2b8fc022c3b
> --- /dev/null
> +++ b/tools/testing/selftests/alloc_tag/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +TEST_GEN_PROGS := allocinfo_ioctl_test
> +
> +CFLAGS += -Wall
> +CFLAGS += -I../../../../usr/include


I think we should replace -I../../../../usr/include with $(KHDR_INCLUDES).


> +
> +include ../lib.mk
> +


We would also introduce an extra field in the parent directory,

allowing our alloc_tag target to be built when running make

within /home/linux/tools/testing/selftests.

like this:

--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -1,5 +1,6 @@
  # SPDX-License-Identifier: GPL-2.0
  TARGETS += acct
+TARGETS += alloc_tag
  TARGETS += alsa
  TARGETS += amd-pstate
  TARGETS += arm64

Below is the relevant build log:

[root@localhost selftests]# make -j8
   CC       acct_syscall
   CC       allocinfo_ioctl_test

Below is the log from running make clean:

[root@localhost selftests]# make clean
rm -f -r /home/linux/tools/testing/selftests/acct/acct_syscall
rm -f -r /home/linux/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test


(Sorry about this inconvenience. I had limited experience with the 
kselftest framework,

so I reached out to my teammates to sort out the relevant build logic.

It's my fault for not catching this issue in prior reviews

and forcing you to send a revised patch.)


> diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> new file mode 100644
> index 000000000000..62d5a488a04d
> --- /dev/null
> +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* kselftest for allocinfo ioctl
> + * allocinfo ioctl retrives allocinfo data through ioctl
> + * Copyright (C) 2026 Google, Inc.
> + */
> +
> +#include <errno.h>


errno.h is unused and may be dropped.


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
> +#define MAX_LINE_LEN		512
> +#define ALLOCINFO_PROC		"/proc/allocinfo"
> +
> +enum ioctl_ret {
> +	IOCTL_SUCCESS = 0,
> +	IOCTL_FAILURE = 1,
> +	IOCTL_INVALID_DATA = 2,
> +};
> +
> +#define VEC_MAX_ENTRIES 32
> +
> +struct allocinfo_tag_data_vec {
> +	struct allocinfo_tag_data tag[VEC_MAX_ENTRIES];
> +	__u64 count;
> +};
> +
> +static inline int __allocinfo_get_content_id(int dev_fd, struct allocinfo_content_id *params)
> +{
> +	return ioctl(dev_fd, ALLOCINFO_IOC_CONTENT_ID, params);
> +}
> +
> +static inline int __allocinfo_get_at(int dev_fd, struct allocinfo_get_at *params)
> +{
> +	return ioctl(dev_fd, ALLOCINFO_IOC_GET_AT, params);
> +}
> +
> +static inline int __allocinfo_get_next(int dev_fd, struct allocinfo_tag_data *params)
> +{
> +	return ioctl(dev_fd, ALLOCINFO_IOC_GET_NEXT, params);
> +}
> +
> +static bool match_entry(const struct allocinfo_tag_data *procfs_entry,
> +			const struct allocinfo_tag_data *tag_data,
> +			bool match_bytes, bool match_calls, bool match_lineno,
> +			bool match_function, bool match_filename)
> +{
> +	if (match_bytes && tag_data->counter.bytes != procfs_entry->counter.bytes) {
> +		ksft_print_msg("size retrieved through ioctl does not match procfs\n");
> +		return false;
> +	}
> +
> +	if (match_calls && tag_data->counter.calls != procfs_entry->counter.calls) {
> +		ksft_print_msg("call count retrieved through ioctl does not match procfs\n");
> +		return false;
> +	}
> +
> +	if (match_lineno && tag_data->tag.lineno != procfs_entry->tag.lineno) {
> +		ksft_print_msg("lineno retrieved through ioctl does not match procfs\n");
> +		return false;
> +	}
> +
> +	if (match_function &&
> +	    strncmp(tag_data->tag.function, procfs_entry->tag.function, ALLOCINFO_STR_SIZE)) {
> +		ksft_print_msg("function retrieved through ioctl does not match procfs\n");
> +		return false;
> +	}
> +
> +	if (match_filename &&
> +	    strncmp(tag_data->tag.filename, procfs_entry->tag.filename, ALLOCINFO_STR_SIZE)) {
> +		ksft_print_msg("filename retrieved through ioctl does not match procfs\n");
> +		return false;
> +	}
> +	return true;
> +}
> +
> +static bool match_entries(const struct allocinfo_tag_data_vec *procfs_entries,
> +			  const struct allocinfo_tag_data_vec *tags,
> +			  bool match_bytes, bool match_calls, bool match_lineno,
> +			  bool match_function, bool match_filename)
> +{
> +	__u64 i;
> +
> +	if (procfs_entries->count != tags->count) {
> +		ksft_print_msg("Entry count mismatch. ioctl entries: %llu, proc entries: %llu\n",
> +			       tags->count, procfs_entries->count);
> +		return false;
> +	}
> +	for (i = 0; i < procfs_entries->count; i++) {
> +		if (!match_entry(&procfs_entries->tag[i], &tags->tag[i],
> +				 match_bytes, match_calls, match_lineno,
> +				 match_function, match_filename)) {
> +			ksft_print_msg("%lluth entry does not match.\n", i);
> +			return false;
> +		}
> +	}
> +	return true;
> +}
> +
> +static const char *allocinfo_str(const char *str)
> +{
> +	size_t len = strlen(str);
> +
> +	if (len >= ALLOCINFO_STR_SIZE)
> +		str += (len - ALLOCINFO_STR_SIZE) + 1;
> +	return str;
> +}
> +
> +static void allocinfo_copy_str(char *dest, const char *src)
> +{
> +	strncpy(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE - 1);
> +	dest[ALLOCINFO_STR_SIZE - 1] = '\0';
> +}
> +
> +static int get_filtered_procfs_entries(struct allocinfo_tag_data_vec *procfs_entries,
> +				       const struct allocinfo_filter *filter)
> +{
> +	FILE *fp = fopen(ALLOCINFO_PROC, "r");
> +	char line[MAX_LINE_LEN];
> +	int matches;
> +	struct allocinfo_tag_data procfs_entry;
> +
> +	if (!fp) {
> +		ksft_print_msg("Failed to open " ALLOCINFO_PROC " for reading\n");
> +		return 1;
> +	}
> +	memset(procfs_entries, 0, sizeof(*procfs_entries));
> +	while (fgets(line, sizeof(line), fp) && procfs_entries->count < VEC_MAX_ENTRIES) {
> +		char filename[MAX_LINE_LEN];
> +		char function[MAX_LINE_LEN];
> +
> +		memset(&procfs_entry, 0, sizeof(procfs_entry));
> +		matches = sscanf(line, "%llu %llu %[^:]:%llu func:%s",
> +				 &procfs_entry.counter.bytes,
> +				 &procfs_entry.counter.calls,
> +				 filename,
> +				 &procfs_entry.tag.lineno,
> +				 function);
> +
> +		if (matches != 5)
> +			continue;
> +
> +		allocinfo_copy_str(procfs_entry.tag.filename, filename);
> +		allocinfo_copy_str(procfs_entry.tag.function, function);
> +
> +		if (filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) {
> +			if (strncmp(procfs_entry.tag.filename,
> +				    filter->fields.filename, ALLOCINFO_STR_SIZE))
> +				continue;
> +		}
> +		if (filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) {
> +			if (strncmp(procfs_entry.tag.function,
> +				    filter->fields.function, ALLOCINFO_STR_SIZE))
> +				continue;
> +		}
> +		if (filter->mask & ALLOCINFO_FILTER_MASK_LINENO) {
> +			if (procfs_entry.tag.lineno != filter->fields.lineno)
> +				continue;
> +		}
> +		if (filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) {
> +			if (procfs_entry.counter.bytes < filter->min_size)
> +				continue;
> +		}
> +		if (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) {
> +			if (procfs_entry.counter.bytes > filter->max_size)
> +				continue;
> +		}
> +
> +		memcpy(&procfs_entries->tag[procfs_entries->count++], &procfs_entry,
> +		       sizeof(procfs_entry));
> +	}
> +	fclose(fp);
> +	return 0;
> +}
> +
> +static enum ioctl_ret get_filtered_ioctl_entries(struct allocinfo_tag_data_vec *tags,
> +						 const struct allocinfo_filter *filter,
> +						 __u64 start_pos)
> +{
> +	int fd = open(ALLOCINFO_PROC, O_RDONLY);
> +
> +	if (fd < 0) {
> +		ksft_print_msg("Failed to open " ALLOCINFO_PROC " for IOCTL\n");
> +		return IOCTL_FAILURE;
> +	}
> +	struct allocinfo_content_id start_cont_id, end_cont_id;
> +	struct allocinfo_get_at get_at_params;
> +	const int max_retries = 10;
> +	int retry_count = 0;
> +	int status;
> +
> +	/*
> +	 * __allocinfo_get_content_id may return different values if a kernel module was loaded
> +	 * between the two calls. If that happens, the data gathered cannot be considered consistent
> +	 * and hence needs to be fetched again to avoid flakiness.
> +	 */
> +	do {
> +		if (__allocinfo_get_content_id(fd, &start_cont_id)) {
> +			ksft_print_msg("allocinfo_get_content_id failed\n");
> +			return IOCTL_FAILURE;

Sashiko pointed out the fd leak in get_filtered_ioctl_entries().

Since we already need to update the patch to fix the missing

TARGETS entry in the top-level Makefile, we might as well fix

this at the same time.


Thanks

Best Regards

Hao

> +		}
> +
> +		memset(tags, 0, sizeof(*tags));
> +		memset(&get_at_params, 0, sizeof(get_at_params));
> +		memcpy(&get_at_params.filter, filter, sizeof(*filter));
> +		get_at_params.pos = start_pos;
> +		if (__allocinfo_get_at(fd, &get_at_params)) {
> +			ksft_print_msg("allocinfo_get_at failed\n");
> +			return IOCTL_FAILURE;
> +		}
> +		memcpy(&tags->tag[tags->count++], &get_at_params.data, sizeof(get_at_params.data));
> +
> +		while (tags->count < VEC_MAX_ENTRIES &&
> +		       __allocinfo_get_next(fd, &tags->tag[tags->count]) == 0)
> +			tags->count++;
> +
> +		if (__allocinfo_get_content_id(fd, &end_cont_id)) {
> +			ksft_print_msg("allocinfo_get_content_id failed\n");
> +			return IOCTL_FAILURE;
> +		}
> +
> +		if (start_cont_id.id == end_cont_id.id) {
> +			status = IOCTL_SUCCESS;
> +		} else {
> +			ksft_print_msg("allocinfo_get_content_id mismatch, retrying...\n");
> +			status = IOCTL_INVALID_DATA;
> +		}
> +	} while (status == IOCTL_INVALID_DATA && retry_count++ < max_retries);
> +
> +	close(fd);
> +	return status;
> +}
> +
> +static int run_filter_test(const struct allocinfo_filter *filter)
> +{
> +	struct allocinfo_tag_data_vec *tags = malloc(sizeof(*tags));
> +	struct allocinfo_tag_data_vec *procfs_entries = malloc(sizeof(*procfs_entries));
> +	int ioctl_status;
> +	int ret = KSFT_PASS;
> +
> +	if (!tags || !procfs_entries) {
> +		ksft_print_msg("Memory allocation failed.\n");
> +		ret = KSFT_FAIL;
> +		goto exit;
> +	}
> +
> +	if (get_filtered_procfs_entries(procfs_entries, filter)) {
> +		ksft_print_msg("Error retrieving entries from " ALLOCINFO_PROC "\n");
> +		ret = KSFT_SKIP;
> +		goto exit;
> +	}
> +
> +	if (procfs_entries->count == 0) {
> +		ksft_print_msg("No entries found in " ALLOCINFO_PROC ", skipping test\n");
> +		ret = KSFT_SKIP;
> +		goto exit;
> +	}
> +
> +	ioctl_status = get_filtered_ioctl_entries(tags, filter, 0);
> +	if (ioctl_status == IOCTL_INVALID_DATA) {
> +		ksft_print_msg("Trouble retrieving valid IOCTL entries, skipping.\n");
> +		ret = KSFT_SKIP;
> +		goto exit;
> +	}
> +	if (ioctl_status == IOCTL_FAILURE) {
> +		ksft_print_msg("Error retrieving IOCTL entries.\n");
> +		ret = KSFT_FAIL;
> +		goto exit;
> +	}
> +
> +	if (!match_entries(procfs_entries, tags, false, false, true, true, true))
> +		ret = KSFT_FAIL;
> +
> +exit:
> +	free(tags);
> +	free(procfs_entries);
> +	return ret;
> +}
> +
> +static int test_filename_filter(void)
> +{
> +	struct allocinfo_filter filter;
> +	const char *target_filename = "mm/memory.c";
> +
> +	memset(&filter, 0, sizeof(filter));
> +	filter.mask |= ALLOCINFO_FILTER_MASK_FILENAME;
> +	strncpy(filter.fields.filename, target_filename, ALLOCINFO_STR_SIZE);
> +
> +	return run_filter_test(&filter);
> +}
> +
> +static int test_function_filter(void)
> +{
> +	struct allocinfo_filter filter;
> +	const char *target_function = "dup_mm";
> +
> +	memset(&filter, 0, sizeof(filter));
> +	filter.mask |= ALLOCINFO_FILTER_MASK_FUNCTION;
> +	strncpy(filter.fields.function, target_function, ALLOCINFO_STR_SIZE);
> +
> +	return run_filter_test(&filter);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	int ret;
> +
> +	ksft_set_plan(2);
> +
> +	ret = test_filename_filter();
> +	if (ret == KSFT_SKIP)
> +		ksft_test_result_skip("Skipping test_filename_filter\n");
> +	else
> +		ksft_test_result(ret == KSFT_PASS, "test_filename_filter\n");
> +
> +	ret = test_function_filter();
> +	if (ret == KSFT_SKIP)
> +		ksft_test_result_skip("Skipping test_function_filter\n");
> +	else
> +		ksft_test_result(ret == KSFT_PASS, "test_function_filter\n");
> +
> +	ksft_finished();
> +}
