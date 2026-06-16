Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6768134AAE9
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 06:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590742; cv=none; b=Mdpy4AF4QrdDPrR5i1kQQWKweQYxS9M5xHG+GWHxaGVPul9/PSd04EjzGqkWKJXnG6+Hg3BCOuRCngkroLfFLkDeucSbLsUp+PUlJD1Gj+nPKzITJHcXmucYzs/jnPxcSg85pRnnzLJF1hGbA4l9fFMgM7HpBlv9Gq6TIwkBTHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590742; c=relaxed/simple;
	bh=AnYrZl0BhHGwz6i0dNMj7fbfdT7eRTtG0/yu8ZWYwMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PuZZJ9U/23yrf9t5d03azAcVpOnuutLA5ybLfpcI4bQ2U6Kl/EQD7tGoJxoKcsWsdDTiLvW/K6V9hG4o6XnkIK+8s9tPmeSMwsP7gulFKsTPFrvS3k4089f3kVFpeT1WNwOrqfCrbzBFk60KHpf/Po1jQXVTj2sBGt6uyndMzLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r00WX9oI; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r00WX9oI"
Message-ID: <8e554bce-bd66-4481-bc53-fa4cbaf0c0b9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781590738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DTZn/K91RXEjkn2MUF6g/U9/4LYerNs+AEXDQw5Dr6o=;
	b=r00WX9oIF9lc3T2yTxq+thmP5w0VjX8lrv5B5Xx3YIIQt02Qww35VraWVVVCZs6CHscWsy
	nc1deqtF/4GoURvhKyR+GP0U98M2T3IS7qB/sNdknd7KUReyuTlknvBNNB6MJkNKRjRIRv
	pYj1CFFnnUa+XQj4cyqDxpoMpoqb1KY=
Date: Tue, 16 Jun 2026 14:18:09 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 6/6] kselftest: alloc_tag: extend the allocinfo ioctl
 kselftest
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>, Suren Baghdasaryan
 <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
References: <cover.1781564384.git.abhishekbapat@google.com>
 <1a68864b1493528abed0e9e3489688fc6287c37e.1781564384.git.abhishekbapat@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <1a68864b1493528abed0e9e3489688fc6287c37e.1781564384.git.abhishekbapat@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Abhishek


On 2026/6/16 07:04, Abhishek Bapat wrote:
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
>   .../alloc_tag/allocinfo_ioctl_test.c          | 197 +++++++++++++++++-
>   1 file changed, 196 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> index 62d5a488a04d..041fee1a3d74 100644
> --- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> @@ -309,11 +309,194 @@ static int test_function_filter(void)
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
> +	bool found;
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


I see. The #include <errno.h> you added in patch 5 is meant for this 
spot, right?

If that's the case, I'd prefer moving the #include <errno.h>

addition into this patch, though this is a trivial detail either way.


Thanks

Best Regards

Hao


> +		ret = KSFT_FAIL;
> +		goto freemem;
> +	}
> +
> +	do {
> +		found = false;
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
> +					found = true;
> +					break;
> +				}
> +			}
> +
> +			if (found || tags->count < VEC_MAX_ENTRIES)
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
> +	if (start_cont_id.id == end_cont_id.id && !found) {
> +		ksft_print_msg("Entry with function %s not found in IOCTL results\n",
> +			       target_function);
> +		ret = KSFT_FAIL;
> +	} else if (start_cont_id.id != end_cont_id.id) {
> +		ksft_print_msg("Failed to match content_ids for procfs and IOCTL, skipping...\n");
> +		ret = KSFT_SKIP;
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
> +	 * We depend on the result of procfs entries to create the ioctl_filter. Hence we
> +	 * cannot recycle the run_filter_test function here.
> +	 */
> +	target_lineno = procfs_entries->tag[0].tag.lineno;
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
> @@ -327,5 +510,17 @@ int main(int argc, char *argv[])
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
