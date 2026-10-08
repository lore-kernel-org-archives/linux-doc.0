Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EDD435537
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454617; cv=none; b=nVJUweqRBolmrLWq59arZbdg+hsihUVWdYL9Y9dLC5J4PNwi9yJGDTafr4OSljOp+hc7i9C4DO7zDUpRuAxy+ozpKi3Ixmqcu94L74/ChBdfSfP8lD8IGpnQvN4ohUI6GAME+PGB22dyTyFnfiuwA+lrne2dhlpwKN1WSV0reBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454617; c=relaxed/simple;
	bh=zr57d1ZsF5kLXjGYob37OWc0jqT5c2OOuPZtQUr/tHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVlRu9sYUYIUjjWgGdoHSft4xOmayhTAabwbggqjeotpwhrX6IYYmux1MHr5eGoRjYZ44+eoxml/9LssPRAkLIcCxMRPKSGH0x/cResrfyDiXZerskj/fKnm1BL1YifKiaSjadmELZNY4VRzLKGwcKcRk9rJdBRQN+WorYW4o00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q2DpU49c; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q2DpU49c"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so18061155e9.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 03:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791454614; x=1792059414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnmV+GF5F+3o4WuN9B2P/gYsWL8ntjLMdxMPioE157g=;
        b=q2DpU49cazvBa8h/9Y3/aKQvCqqyMXujNpWce5qkh+Pz7NJ5azihH2TYIi5Fa8c6+4
         ZGn1VVjePLPkj0vU7+/MA2s4pma5ot5b0w210hQ+Ydxa5obyvUX6nUrBNMGaG8rVzMy/
         0uTMJq/cT7Vvww3W9BZIEqRL69XZG+1lrnK1OHtjUEe1Tle6bmjTsv2Brh2vmHP0dn19
         EH5F2RKvJuBUrBGoRkqupsChDLsA+ZnCvKdqZXV+KZJoY2vwtC6HiMYwQ4uuPNHTagAF
         jHGc0bhmNC113B54v6+p0QNM3noORXCfh1URt+bblLkJ1sfJw3uULjvLlbBYkCKGaBCU
         JDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454614; x=1792059414;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnmV+GF5F+3o4WuN9B2P/gYsWL8ntjLMdxMPioE157g=;
        b=PEtUwOLG5O0h9WPdt34GbsEZkuV7cVXFmCpA1DuF5qvyKL4SgM5NodDX0TR0YvX1Kq
         gBBqI2p1cWH19KNwjcE3OQcBDgVlJyK0NkQKd53U1mUpbQQFGSlr7Bf8ki6AvE333J6J
         NW33IOhucgMYdJgQMNMP+6VzSOeXnUIIVNwA+K4i3mHCYMfBvay12NJfT4xyvv80jrNg
         REmuFXBrIk1lq1Pa+GcqvQR3mYgrCNfWOttYV9C0TzY0hxsAU14A4TGKSc7EKEq5HxdC
         m2rM8kUpcU+7ueahcYf8VpJ4HsyyzbeAVUXrivKvoJRyvhTwCSSXvAnTvLk2TOR4/We4
         z8LQ==
X-Forwarded-Encrypted: i=1; AKwUvBzreAaFwpU0eyRbWsNsSQMBv7OOIRmd/g89jGVtdKnvCnjBgA4C8uyy4DI/6IC2qspF/F0SG5Z6ZZc=@vger.kernel.org
X-Gm-Message-State: AFuF++mG8kLHOltpkQGDBL79pRahRosGT+N6WmAc+0mKYHkTMBkmNWJi
	CcsGwYhNteSaIXa1+2y3EhbmkJyBJv+UmzRRbSlCSbJ23nx7wa5nIk9w0bQK+Ut4ZUs=
X-Gm-Gg: AYBFou1tVffOqwDcOIK0scps4cDvY3H97t6NMF0r0uuf70yd5YOIf53zmXiugsGGmfV
	r0w6XokC3Sny6UxXcB3GClFMtRIcHRQ3n7AxYBqD6Th/cj9ZUxQ0EyXtGrYz0mDwpwJ6T/hfGaP
	Y0XGDHZcve1NIUZjGg3NMkYEyck/6WcGF9H16Td54sKFwUG4V1Gpax5ZQO+3FcokS55xcPHbJng
	dVzl+R/Sa2Sz/xIiV0D7Y0BJv0fU7c4WwTsYosK4dcjkyOFVSuXYmF0k2nOZRAlTU6Ax8CTF15I
	4TB/AkWkdLABKVOOeYNhGtnwvBl9sD0n9973vZxobolVy/eb6ftQRo/yYYhmiNYNSF4JADbZcnc
	9i+hz9rpqkrVeLbUW5p/WGrKW9QAfuu5TbHchMKKjF91GF5zTUxs9W9xLaFLcdoDTWKlWF/cRXJ
	51XSvHrU92k2vpTDUb1555jHURONFiknx7LWC5zbbrjU9y6v4J/gF38SqiHD3S09MZ0v16UEZOf
	ZI=
X-Received: by 2002:a05:600c:820d:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a180423b6bmr85575205e9.12.1791454611842;
        Thu, 08 Oct 2026 03:16:51 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842abdb9sm57441605e9.6.2026.10.08.03.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 03:16:51 -0700 (PDT)
Message-ID: <a8373961-8ca5-4e8f-9f81-69d099bcaf3c@linaro.org>
Date: Thu, 8 Oct 2026 11:16:49 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] perf cs-etm: Turn on context packet timestamps
 in per-thread mode
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org,
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-doc@vger.kernel.org
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-3-00c4fd0701b4@linaro.org>
 <20260826153648.GK8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260826153648.GK8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/08/2026 16:36, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:49:01AM +0100, James Clark wrote:
> 
>> @@ -453,13 +453,22 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
>>   	 */
>>   	evsel__set_sample_bit(cs_etm_evsel, CPU);
>>   
>> -	/*
>> -	 * Also the case of per-cpu mmaps, need the contextID in order to be notified
>> -	 * when a context switch happened.
>> -	 */
>>   	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
>> +		/*
>> +		 * Timestamps are required to interleave samples from different
>> +		 * CPUs.
>> +		 */
>>   		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
>> +		/* Context IDs are required to associate trace to a process */
>>   		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
>> +	} else {
>> +		/*
>> +		 * Enable context packet timestamps only (no periodic
> 
>> +		 * timestamps). Even in per-thread mode with a single process we
>> +		 * still need to correlate trace to a specific mmap around
>> +		 * execs, which can be done with just context packet timestamps.
> 
> Could we use terminology that is aligned with the ETM spec?
> 
>    "Disable periodic timestamps but generate timestamps for trace
>     synchronization  ... to a specific mmap around execs, which
>     can be done with just timestamps of trace synchronization."
> 

Done.

>> +		 */
>> +		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", UINT64_MAX);
> 
> It seems this will eventually convert UINT64_MAX to 0xf for the
> timestamp bit field. Why not use 0xf directly to avoid confusion?
> 

Then it wouldn't support the size of the field changing. I thought that 
was the point of the kernel publishing the fields dynamically. Hard 
coding widths and positions in userspace only caused issues in the past.

I don't think "...MAX" is confusing for what the intention is, but maybe 
a comment would be better than hard coding it?

>>   	}
>>   
>>   	/*
>>
>> -- 
>> 2.43.0
>>

