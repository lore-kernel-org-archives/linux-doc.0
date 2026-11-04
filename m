Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804849;
	b=RcV9w627wb1PSuQt4VcOfYnO4M4C4krTjMo4qtbsR1TlLpVgaFyphxoEUoauJIHMYc3n
	 Y9LEdcZWMcb2YQTnz0LuRWHMzbp6XND/tOQXoj3UHFyB6/RrA+GXb8pXztrjIPqbhR4e/
	 +l5ufPRgnIjFnhfRQOThRmACWjA6dI1QvKj1fVrGvH57NB3ov7lDldd/09fAPsKeVHqoH
	 fmNYUlZjz3AeEtsXJ5N791czJqEDwdmvkCDjiSWYi0X2Vh87ynyFeeZYdydjkHcpz/B5w
	 FL3D24FYePDcSxfKcaMZUliY28vidRxX0ps+HXfDs4aupwshoF3jSoRIHHy4DmBAkGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7VYDYvW+CwD5vPnIuKuoUcZjw7zRDhgYDMBwsljH6Ms=;
	b=oy08D9tq+KUJeYg5xsSJqmiiyIK4rKy7UbGc//gTFigz5TJbu7Qhhn40n1dvAlnE6y/k
	 WE2ZSZS3RLaEGBBUstU8PrJfbLp1SjFpDf1yoLoZAZqBZ6h/rOpc+dROmMgD9MWnBvUi7
	 /UPsnOb1iFQy/0hD5mcrJvdVBPV6kBA2Teeoe8vqzWTSNtP9x7zOSF5lYhplO0DvVrKXu
	 R/RFSLw/bf9lRGBWzQrjiyYu9Kg3dix6+XKStVyAXcj2xrw4ls6VZ85TnALXjlhA9Ro6b
	 7uKTawBhAHgjLfOWBZ6wDVzfkHEEpXMJlb1Edwc3HgMZ02Coh58dw509nYZbBkSX0jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="jlxkiNU/";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61AF606A328
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 15:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E61AF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jlxkiNU/
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so5217105e9.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 07:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793804846; x=1794409646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VYDYvW+CwD5vPnIuKuoUcZjw7zRDhgYDMBwsljH6Ms=;
        b=jlxkiNU/T0Zd5J2F9Ggyrr4UPnXYE2bQTFUXDcXUhkbRHBk9znBH/5ubAJFDrxWULG
         TL/JIVyc5cZWf58ZGwf3rnI6Wyn6anIcXxe7EKpBNXqaFi+klUUGxQnRK8BTs3HG1T5E
         dpXNR+/qIeuZNXP90gWFhiUSXKampHon35hGhkfJJR3DhWig6J6SG4VKqtbx6nzTrJwo
         NJ3mluh5vKukjW6Nt8GICrfn3Pu54LH2gbcptr2RgSkCLLhwJHktxf7APMDAEqtW4TST
         ZxjI+g4e//kzPziFJg8ITlHrRrD7hU5sIRE4+jJ+m7ETh4L2DOEpX04/ppr1q0sl0SNS
         gEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804846; x=1794409646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VYDYvW+CwD5vPnIuKuoUcZjw7zRDhgYDMBwsljH6Ms=;
        b=GTGAd0xQX0xbBkPSeoATFTRT15VC+so6oRbrntYQllvS7edgEAkJtWugF8gHnhLN/U
         ID07RE7WapdyMQQsD8+XyKSv3MZe0EJZI2kJJ4Rxj0i4mtC1p1GWPJu+2pW9qi5NvYIS
         PAJZKuiiFK/XiYL4ycL0Eo3RD5xPEODJZkjEICs60oTaA6pHMT+Nkx8nD6hjXO9lh/3X
         gySCy4dUB12ENeqhiUc2LIy/+ZHKULXTspkyfca1mLbWIHnYj2uAMEpg7JEJcNuQooYJ
         uPdrpotHo7uWdwZ4CvjJ5QBv8z5S57v3x3kiyfgR6pxjGUPiu7HJgRTsBHm78q0QrR0v
         u7MA==
X-Forwarded-Encrypted: i=1; AKwUvBzqtfL3g2qdfDxDuGIsB4N/ZtuvNnAixwgzH9LbtALOyzSwbI/4x77HX/XkJlPtTr2DHhwjH/Y3yUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5ONyS6Ebi+kDqXKiksSpF+BJYsZFMBk2kGd0AM6MqrxVF+20C
	1w9VXrAuq6y4aqEY4kEu8tqlEx7WhqSCCvyzuQl67n3Sk1LijBkA7tyMt5Wk/7g3314=
X-Gm-Gg: AYBFou0D8B+Fn869qEPle7VCZmW1AZyxdzuJeOkphA8vp0rdkUq07WNkUhKiemraICB
	1Q08N3G697Saf5TuRIEezUWBbPyJSnIj6sGAYA2vzFCvrjBtG+aOotpdykc0py2TM6rjr6G6JwY
	TqbLHxcAbwkMzW5tU+V20nVo1r/Q4/VVP14LlqPSfgKR/o2iGjIVOJm9CGB0Mk1Gfl8wgzO2qsZ
	4/d92XyhHS3IODy62/modvoxHt+j2Xx3kOtXQZmQtC8Q7XhM4WO4wHNULD23WbQy6dXBhQUaxkC
	dYHmCD44jZc1grKU+WMtp2QNVvejR4AX5Bye/RY5th8/zaesD+oMy9lFnmesL5343+0uA1ZAXDU
	ogMGLxf/k7eLqFb+pECxhhQrCN+Qjs/vzOo2cnVqvMr+Yir/eo/n+oJLGRAzxPPm4tpd4rATw3Y
	9r/2PmFEblvJdtajXCIOrmZwANm9HEGrFpOr6KUEaicyTDDKttxT5SPpeZ7zKPXxZ/Pr4V+FAwG
	bHeO8hrQ9JFN5/oUq/u15xM5QawANy+9SnUQtnkN8EzfcnQs7M8opOuBhpjkqH7uufoMHMaeA+k
	CLeBNqb98Xq8cJSg8aNiQgrtiip95pGXLlM55Q4ZN4aqR2UW3PBlmjM=
X-Received: by 2002:a05:600c:4e14:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4ac187a80bfmr378940895e9.30.1793804846351;
        Wed, 04 Nov 2026 07:07:26 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8648sm4578795f8f.9.2026.11.04.07.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 07:07:25 -0800 (PST)
Message-ID: <54182c51-8dfe-46fa-9369-5e4e31a63796@linaro.org>
Date: Wed, 4 Nov 2026 15:07:24 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/18] perf cs-etm: Use per-CPU queues for per-thread
 mode
To: Leo Yan <leo.yan@arm.com>
Cc: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org,
 John Garry <john.garry@linux.dev>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
 <20261102-james-cs-unformatted-per-thread-fix-v3-4-dbcb0c281b9b@linaro.org>
 <20261104142412.GI9176@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261104142412.GI9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/11/2026 14:24, Leo Yan wrote:
> On Mon, Nov 02, 2026 at 12:15:18PM +0000, James Clark wrote:
> 
> [...]
> 
>> @@ -2215,6 +2209,29 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
>>   	 */
>>   	cs_etm__flush_all_stack(etmq);
>>   
>> +	/*
>> +	 * Per-thread mode still uses a queue for each CPU, but that CPU can run
>> +	 * different threads. When the TID from the AUX record on a CPU changes,
>> +	 * re-initialize the thread using the AUX record/buffer fragment TID so
>> +	 * we can start decoding even if the context ID packet was cropped or
>> +	 * they're disabled.
>> +	 */
>> +	if (etm->per_thread_decoding) {
>> +		struct cs_etm_traceid_queue *tidq = cs_etm__etmq_get_traceid_queue(etmq,
>> +							CS_ETM_PER_THREAD_TRACEID);
>> +
>> +		if (thread__tid(tidq->decode_thread) != etmq->buffer->tid) {
>> +			thread__zput(tidq->frontend_thread);
>> +			thread__zput(tidq->decode_thread);
>> +			tidq->frontend_thread = machine__findnew_thread(
>> +				&etm->session->machines.host, -1,
>> +				etmq->buffer->tid);
>> +			tidq->decode_thread = machine__findnew_thread(
>> +				&etm->session->machines.host, -1,
>> +				etmq->buffer->tid);
>> +		}
>> +	}
> 
> Why not use PERF_RECORD_AUX events as an opportunity to update threads,
> similar to how we handle PERF_RECORD_SWITCH_CPU_WIDE?
> 

In cs_etm__queue_aux_fragment() we check if the TID from the AUX record 
is the same as the one on the buffer, so it doesn't make a difference. 
They're always the same:

		if (auxtrace_event->tid != sample->tid)
			return 1;

We can't use it directly in cs_etm__process_event() because we're not 
decoding in order with Perf events yet. In my WIP JIT patches we do, but 
it still makes sense to continue to use the TID from the buffer because 
you don't always have timestamps available to update threads when the 
AUX event comes.

>> +
>>   	return 1;
>>   }
>>   
>> @@ -3288,7 +3305,9 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
>>   
>>   	if (aux_offset >= auxtrace_event->offset &&
>>   	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
>> -		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, auxtrace_event->cpu);
>> +		/* Old per-thread files have no CPU (before v6.4) */
>> +		int queue_idx = sample->cpu == (u32)-1 ? 0 : sample->cpu;
>> +		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, queue_idx);
> 
> For per-thread mode, auxtrace_event->cpu is -1. So this is why we
> resort sample->cpu to retrieve CPU ID. This makes sense to me.

Yes, and it's only set on AUX records since we started always doing this:

   evsel__set_sample_bit(cs_etm_evsel, CPU);

Otherwise it was -1 there too, hence the condition for old files.

