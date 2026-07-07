Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93F7367B76
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 03:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394899; cv=none; b=h7zUnO8VqCkXK0Edp/K6P/oxGFAULOnr2QEP+ML2kDH+lby7TzgqHnTVpLk+rx5dyiOanCFZP2w4qTuNLqX20s+oHyfNb54Z8ERbbIdLt9rEDDS9JPvFgRNvOGtgparu08qWT3Ww+FIhFGKFbDmmU7OBa03s9YmwXUsKSTD77YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394899; c=relaxed/simple;
	bh=4HJ5uUknpsltXYlF0NVsOd30nw6eP0oL38LMjmyZVAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEU7Yxt731BkU7kwe1pyyYwQAq2qilDA8W9n7HzMxB9ySlp5tE351dYel6nnHKJNp1LbAfW9OUkQQb+/vMFLj2CMRr0VSTNm0tNq5yUedkOPfOwlATPAXCmGMzKVDd1mGtOGyqy8aIKC/I+wuo+XEW5rl5OLBzLtTjsF9f7i/0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DIjvS958; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DIjvS958"
Message-ID: <4cc47988-49b3-4b73-90ed-a0a16a56a8dc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783394892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEiA+pwtCXC1ZAr5AF0iwJd+evuAzVicLVb++73QmaU=;
	b=DIjvS958UCpmND1SKSWGn1h43DDuuBX48YGsON2jaSu/xihXISVbmmUZExTKUFXMVaHGIf
	CKSWLDC2J/coQlARTg6IV8eU96X6u6mWb3trdHEg5gVj3hf9QzqMNCFUrVdS/RcO/MTe78
	csk7cnTtb+mNxTbCgLtAL9tbBkOh0ls=
Date: Tue, 7 Jul 2026 11:27:40 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 6/6] kselftest: alloc_tag: extend the allocinfo ioctl
 kselftest
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>, Suren Baghdasaryan
 <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
References: <cover.1783361692.git.abhishekbapat@google.com>
 <f6bd1ff0257987dbb7512f93595eaa6962c6153b.1783361692.git.abhishekbapat@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <f6bd1ff0257987dbb7512f93595eaa6962c6153b.1783361692.git.abhishekbapat@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Abhishek


On 2026/7/7 02:25, Abhishek Bapat wrote:
> Add the following 2 scenarios to the allocinfo ioctl kselftest:
> 1. Validate size based filtering
> 2. Validate lineno based filtering
>
> The first test uses "do_init_module" as the candidate function for the
> test. This is because the associated site will only allocate memory when
> a kernel module is loaded. The return value of get_content_id() changes
> every time modules are loaded or unloaded. Hence, as long as
> get_content_id() values at the start and the end of the test are the
> same, the memory allocated by the do_init_module call site should also
> remain the same. Consequently, the test can assume consistency between
> the value returned by the ioctl and the procfs resulting in less
> flakiness.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> ---
>   .../alloc_tag/allocinfo_ioctl_test.c          | 216 +++++++++++++++++-
>   1 file changed, 215 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> index 9ce7b53078b1..092348097204 100644
> --- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> @@ -5,6 +5,7 @@
>    * Copyright (C) 2026 Google, Inc.
>    */
>   
> +#include <errno.h>
>   #include <fcntl.h>
>   #include <stdio.h>
>   #include <stdlib.h>
> @@ -312,11 +313,212 @@ static int test_function_filter(void)
>   	return run_filter_test(&filter);
>   }
>   
> +static int test_size_filter(void)
> +{
> +	int fd;
> +	struct allocinfo_tag_data_vec *tags = malloc(sizeof(*tags));
> +	struct allocinfo_tag_data_vec *procfs_entries = malloc(sizeof(*procfs_entries));
> +	struct allocinfo_filter filter;
> +	int ret = KSFT_PASS;
> +	__u64 target_size, i, pos;
> +	struct allocinfo_tag_data *found_tag = NULL;
> +	const char *target_function = "do_init_module";
> +	struct allocinfo_content_id start_cont_id, end_cont_id;
> +	int retry = 0;
> +	const int max_retries = 10;
> +
> +	if (!tags || !procfs_entries) {
> +		ksft_print_msg("Memory allocation failed.\n");
> +		ret = KSFT_FAIL;
> +		goto freemem;
> +	}
> +
> +	fd = open(ALLOCINFO_PROC, O_RDONLY);
> +	if (fd < 0) {
> +		ksft_print_msg("Failed to open " ALLOCINFO_PROC ": %s\n", strerror(errno));
> +		ret = KSFT_FAIL;
> +		goto freemem;
> +	}
> +
> +	do {
> +		found_tag = NULL;
> +		pos = 0;
> +
> +		if (__allocinfo_get_content_id(fd, &start_cont_id)) {
> +			ksft_print_msg("allocinfo_get_content_id failed\n");
> +			ret = KSFT_FAIL;
> +			goto exit;
> +		}
> +
> +		memset(&filter, 0, sizeof(filter));
> +		filter.mask |= ALLOCINFO_FILTER_MASK_FUNCTION;
> +		strncpy(filter.fields.function, target_function, ALLOCINFO_STR_SIZE);
> +
> +		if (get_filtered_procfs_entries(procfs_entries, &filter)) {
> +			ksft_print_msg("Error retrieving entries from " ALLOCINFO_PROC "\n");
> +			ret = KSFT_FAIL;
> +			goto exit;
> +		}
> +
> +		if (procfs_entries->count == 0) {
> +			ksft_print_msg("Function %s not found in procfs\n", target_function);
> +			ret = KSFT_SKIP;
> +			goto exit;
> +		}
> +
> +		target_size = procfs_entries->tag[0].counter.bytes;
> +
> +		memset(&filter, 0, sizeof(filter));
> +		filter.mask |= ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE;
> +		filter.min_size = target_size;
> +		filter.max_size = target_size;
> +
> +		while (1) {
> +			struct allocinfo_get_at get_at_params;
> +
> +			memset(&get_at_params, 0, sizeof(get_at_params));
> +			memcpy(&get_at_params.filter, &filter, sizeof(filter));
> +			get_at_params.pos = pos;
> +
> +			if (__allocinfo_get_at(fd, &get_at_params))
> +				break;
> +
> +			tags->count = 0;
> +			memcpy(&tags->tag[tags->count++], &get_at_params.data,
> +			       sizeof(get_at_params.data));
> +
> +			while (tags->count < VEC_MAX_ENTRIES &&
> +			       __allocinfo_get_next(fd, &tags->tag[tags->count]) == 0)
> +				tags->count++;
> +
> +			for (i = 0; i < tags->count; i++) {
> +				if (strcmp(tags->tag[i].tag.function, target_function) == 0) {
> +					found_tag = &tags->tag[i];
> +					break;
> +				}
> +			}
> +
> +			if (found_tag || tags->count < VEC_MAX_ENTRIES)
> +				break;
> +
> +			pos += tags->count;
> +		}
> +
> +		if (__allocinfo_get_content_id(fd, &end_cont_id)) {
> +			ksft_print_msg("allocinfo_get_content_id failed\n");
> +			ret = KSFT_FAIL;
> +			goto exit;
> +		}
> +
> +		if (start_cont_id.id == end_cont_id.id)
> +			break;
> +
> +		ksft_print_msg("Module load detected during size verification, retrying...\n");
> +	} while (retry++ < max_retries);
> +
> +	if (start_cont_id.id == end_cont_id.id && !found_tag) {
> +		ksft_print_msg("Entry with function %s not found in IOCTL results\n",
> +			       target_function);
> +		ret = KSFT_FAIL;
> +	} else if (start_cont_id.id != end_cont_id.id) {
> +		ksft_print_msg("Failed to match content_ids for procfs and IOCTL, skipping...\n");
> +		ret = KSFT_SKIP;
> +	} else if (found_tag && found_tag->counter.bytes != target_size) {
> +		ksft_print_msg("IOCTL entry size %llu does not match target size %llu\n",
> +			       found_tag->counter.bytes, target_size);
> +		ret = KSFT_FAIL;
> +	}
> +
> +exit:
> +	close(fd);
> +freemem:
> +	free(tags);
> +	free(procfs_entries);
> +	return ret;
> +}
> +
> +static int test_lineno_filter(void)
> +{
> +	struct allocinfo_tag_data_vec *tags = malloc(sizeof(*tags));
> +	struct allocinfo_tag_data_vec *procfs_entries = malloc(sizeof(*procfs_entries));
> +	struct allocinfo_filter filter;
> +	enum ioctl_ret ioctl_status;
> +	int ret = KSFT_PASS;
> +	__u64 target_lineno, i;
> +	struct allocinfo_tag_data *target_tag;
> +	bool found = false;
> +
> +	if (!tags || !procfs_entries) {
> +		ksft_print_msg("Memory allocation failed.\n");
> +		ret = KSFT_FAIL;
> +		goto exit;
> +	}
> +
> +	memset(&filter, 0, sizeof(filter));
> +
> +	if (get_filtered_procfs_entries(procfs_entries, &filter)) {
> +		ksft_print_msg("Error retrieving entries from " ALLOCINFO_PROC "\n");
> +		ret = KSFT_FAIL;
> +		goto exit;
> +	}
> +	if (procfs_entries->count == 0) {
> +		ksft_print_msg("Could not retrieve procfs entries\n");
> +		ret = KSFT_SKIP;
> +		goto exit;
> +	}
> +	/*
> +	 * We depend on the procfs results to determine the line number for the filter before
> +	 * making the ioctl query. Hence, we cannot reuse run_filter_test here.
> +	 */
> +	target_tag = &procfs_entries->tag[0];
> +	target_lineno = target_tag->tag.lineno;
> +
> +	filter.mask |= ALLOCINFO_FILTER_MASK_LINENO;
> +	filter.fields.lineno = target_lineno;
> +
> +	ioctl_status = get_filtered_ioctl_entries(tags, &filter, 0);
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
> +	for (i = 0; i < tags->count; i++) {
> +		if (tags->tag[i].tag.lineno != target_lineno) {
> +			ksft_print_msg("IOCTL entry %llu has incorrect lineno %llu.\n",
> +				       i, tags->tag[i].tag.lineno);
> +			ret = KSFT_FAIL;
> +			goto exit;
> +		}
> +
> +		if (strncmp(tags->tag[i].tag.function, target_tag->tag.function,
> +			    ALLOCINFO_STR_SIZE) == 0 &&
> +		    strncmp(tags->tag[i].tag.filename, target_tag->tag.filename,
> +			    ALLOCINFO_STR_SIZE) == 0)
> +			found = true;
> +	}
> +
> +	if (!found) {
> +		ksft_print_msg("Original procfs entry not found in IOCTL lineno filter results.\n");
> +		ret = KSFT_FAIL;
> +	}
> +
> +exit:
> +	free(tags);
> +	free(procfs_entries);
> +	return ret;
> +}
> +
>   int main(int argc, char *argv[])
>   {
>   	int ret;
>   
> -	ksft_set_plan(2);
> +	ksft_set_plan(4);
>   
>   	ret = test_filename_filter();
>   	if (ret == KSFT_SKIP)
> @@ -330,5 +532,17 @@ int main(int argc, char *argv[])
>   	else
>   		ksft_test_result(ret == KSFT_PASS, "test_function_filter\n");
>   
> +	ret = test_size_filter();
> +	if (ret == KSFT_SKIP)
> +		ksft_test_result_skip("Skipping test_size_filter\n");
> +	else
> +		ksft_test_result(ret == KSFT_PASS, "test_size_filter\n");
> +
> +	ret = test_lineno_filter();
> +	if (ret == KSFT_SKIP)
> +		ksft_test_result_skip("Skipping test_lineno_filter\n");
> +	else
> +		ksft_test_result(ret == KSFT_PASS, "test_lineno_filter\n");
> +
>   	ksft_finished();
>   }


https://sashiko.dev/#/patchset/cover.1783361692.git.abhishekbapat%40google.com

Sashiko is really strict, but its warnings are legitimate. I ran the 
test program on a kernel built without

CONFIG_MEM_ALLOC_PROFILING, and here are the results:


[root@localhost alloc_tag]# ./allocinfo_ioctl_test
1..4
# Failed to open /proc/allocinfo for reading
# Error retrieving entries from /proc/allocinfo
ok 1 # SKIP Skipping test_filename_filter
# Failed to open /proc/allocinfo for reading
# Error retrieving entries from /proc/allocinfo
ok 2 # SKIP Skipping test_function_filter
# Failed to open /proc/allocinfo: No such file or directory
not ok 3 test_size_filter
# Failed to open /proc/allocinfo for reading
# Error retrieving entries from /proc/allocinfo
not ok 4 test_lineno_filter
# 2 skipped test(s) detected. Consider enabling relevant config options 
to improve coverage.
# Totals: pass:0 fail:2 xfail:0 xpass:0 skip:2 error:0
[root@localhost alloc_tag]#


Looking at the test log above, some tests that ought to be skipped are 
flagged as failures.

Would it make sense for us to go through all relevant test cases in the 
codebase,

and check if we've missed any logic to skip tests when /proc/allocinfo 
is missing

due to CONFIG_MEM_ALLOC_PROFILING being disabled?


BTW,  when merging this series into the latest mm-new branch, there will 
be a minor header file conflict.

This is because the series at 
https://lore.kernel.org/all/20260703-alloc-trylock-v5-15-c87b714e19d3@google.com 
was merged ahead of this change.

We might want to consider rebasing this series to resolve the header 
conflict.


Thanks

Best Regards

Hao


