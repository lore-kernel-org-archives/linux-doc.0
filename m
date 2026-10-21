Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574459;
	b=CkV4vD0S1B6Qp/5QLImvtVy9LVNYUZWQOuzNHjWhYFvg/PWk7WQe0v39og8EZyeZlyOb
	 ErwFzwATqOB1vZg9BLYh1bWHFCPRGgWq16U7JVgypXMm/jSe8m1KG/XIzBPMyLoCF3Rfx
	 XeHQkY3OIVvYxRzkWzn2hnVoZdU+MOOCyGAX+4+JlReXtJcfp6soFRoZYx+ljMw+1+j9Y
	 9v/yK/hX+Zc/XsmJYu3E9l1RRXsd6/B5maB1uaYZLbQ1zvDe5FHt2p7s7QGZ/YLwbbSmN
	 1txEa6ZS1qZEsA6w+OFDj+0Enfguw2zX9nK6k80xKyL8onwLUsgBNq/j0iKku5JUPdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=00yPyIz5pNBZ/uGIfADGiLvcMOlz91ylxALbeXNOiwE=;
	b=Iz7Wxx9+T997APFdt8JhOv2Uxcb/fd6G2iYtE+7q/CnuPeoplf+EzlyICGBUCMHxw0Ht
	 /qzcf5dZgqbS6Oj29232bh+vkqNXb8593FDz2vXq+KHO1zg0MtuN2N0GfswDXozkv/CTO
	 8+qUQ3vDqcwB3gp0ce2974dwHjaYSRIVDLFsLuoXaXI6Aa71QgBlIGhJwAmakIdgS1nMY
	 Jz/x6zWvtuRMJS54QvtCFqzyczc7MQjBTRFnmxPxXw+vbkZvpmfvKKfiKeZMJv0BRRw0F
	 6k4nkeAYU1/3ZInEeNnOfD0ut660g4YgLNg/YPjaScLbkgt565HZtCWmhIOytQUmbZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=geohffDN;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC397606A325
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 09:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC397606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=geohffDN
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso620776a12.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 02:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792574457; x=1793179257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=00yPyIz5pNBZ/uGIfADGiLvcMOlz91ylxALbeXNOiwE=;
        b=geohffDNhXnQl2CIjH6SUS1If+GXlo5kS7JwUdNr8n73Kd8v5lAVySY85MP5hrlhIx
         a43PJF+dxwumrOAntado0v55ynDrtsrF0ulISH6iKSBaVZRGDzKNxcI4+NkeGE/edph6
         xZvJQT05QmxeKWDWLuBqfS478NUy7NH/pTEi6yUx/7bXFRud6GnKTRLfJatPoYOFIGOS
         joWga1k9wqz7NC3ndrvc41SMxu9vnI5KO1qip3ZWo4f61Xss11O0VzsMXvtwSWHn0ZL+
         Q/KaafG4UKUipikAtLODr9xZWImisd66MdCRE/nU9jDSVGcf+3FfOighEMAig/szAn8C
         RrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574457; x=1793179257;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00yPyIz5pNBZ/uGIfADGiLvcMOlz91ylxALbeXNOiwE=;
        b=korEuUPinJntdPiswmrBYkYAjLXCzpZvHh9z62PQsxTAL9ES29SAi8Sd8FyG0lP49J
         W7KQpAy5bPrbSbNrmUQq6xH4V9AYpb9ai8L2WGMtL50udj/b1QPbxKnkGZ2XHC0Ia1fA
         dkFsaZFTy8IgGK/NLu253ND2iYKLD51/nm/GKcRIuz3hLsZWynIsA91Ak486yzR7txJO
         U+cl1SHnZwN5CsjwsmhAY0PEyULTWK5nKz8pRgMixTEjwHPOtlxVa9tnB6hO1haU0NcV
         MLk6M/1EOhjznPz4hCEEfFLfftVNUtbCmcX09mXEEr81QKiaozHVFy6kZDhOk78rjwOQ
         KcVw==
X-Forwarded-Encrypted: i=1; AKwUvByFQVuyNr0JeiQtZK0ZrnFnJ0zsVcY2QYtDeMwQFSl1hLVWA9XQavHoX/cC3QujSB+KXbc0G3+5HPQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNfHl8GYDLjBNobM7fIA9oxQbSIs7GAUkU7ppZ2mc3D3efRZwF
	Nwk/JMB2kiiH337+FPRdV7+cQbhePLuUzOiAtS1urmMke69fLIEaje9Ap7HRo7B3AE4=
X-Gm-Gg: AYBFou1kG5f1bWVZnPN9u0+KtaxUyzDAM+fvaQZYIcqC7RRi/E9gjcdhveTVQuYlj0c
	4IaZDzyCsNSXFeXccuYAvv7PAP9qC0x4Tn9puqFzgIu6JH81U/p4BQRNKjhTZTRru+ppej5Gp42
	uQIv0l8Qv/7B8EXD+e+T1Y4PcyAGbNNIZpjARchhOWvlqVuNGB5MafjCtW9VYQgJNEu++GJhIhe
	4rIBhb4p2Cj77RFaN5aVLvuDWTcd4kvnnok1YgRYx5N4p/4kUYwM6vnjCMUsaXbBFsLVgRaXFsZ
	xEfXz8pqaok9VAACBeiGuq6CMsa46t/HI3URUeqh+qjSyOGQNF9KUBgzeSHC6e4gvLM/MKx4FB6
	+FCsVSzrX5Ftzkqd8YMViUS34y8H0cLaInX445O5HgNzFtX5ptjgcsd408AuOI+HZnpF7aItfuW
	JMQaxjaClN2ALDbOf7izq5hfWeg6mxVtJBYcBb7Sxlp+0TeKKs0JK1XgiuvlpLoO04bOMbx9lw7
	p6eXHASfgSGNPnUxQPOQVui3ydultK5YBZUeAZBUgV25Eb6L6hZmzt4hyFtECRZJM36F6QVBddA
	cZhZWA==
X-Received: by 2002:a17:907:d40a:b0:c45:d8aa:6ae5 with SMTP id a640c23a62f3a-c46799bdbb7mr118867866b.42.1792574456702;
        Wed, 21 Oct 2026 02:20:56 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678faa974sm57756566b.43.2026.10.21.02.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:20:56 -0700 (PDT)
Message-ID: <0621ac72-950b-4bb7-9bc9-5547a2ce90cf@linaro.org>
Date: Wed, 21 Oct 2026 10:20:54 +0100
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
From: James Clark <james.clark@linaro.org>
Subject: Re: [PATCH v2 04/14] perf cs-etm: Use per-CPU queues for per-thread
 mode
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
 <20260821-james-cs-unformatted-per-thread-fix-v2-4-00c4fd0701b4@linaro.org>
 <20260826190645.GL8904@e132581.arm.com>
Content-Language: en-US
In-Reply-To: <20260826190645.GL8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/08/2026 20:06, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:49:02AM +0100, James Clark wrote:
>> This fixes two problems, firstly per-thread mode didn't support multiple
>> threads well or at all because we always use queue 0 and assumed it was
>> for a single thread. However, Perf attaches to all child threads of one
>> process or allows multiple threads to be specified on the commandline.
>> This meant that trace before a context packet could use the wrong MMAP
>> for decoding, and threads running concurrently wouldn't be interleaved
>> properly.
> 
> If I connect this with patch 03, I understand "a context packet" here as
> the trace synchronization with a timestamp, which is needed to correlate
> with MMAP records.
> 
> What I don't quite understand is how switching to multiple queues fixes
> the "trace before a context packet" case. Wouldn't decoding still need
> to wait until the first timestamp/context information is available?
> 

Context IDs aren't enabled in per-thread mode, we still use the TID 
initially assigned to the queue for mmap lookup. That TID comes from 
"etmq->buffer->tid" which is always correct in per-thread mode. Even if 
we turned on context IDs they might either be cropped in snapshot mode, 
or not exist when we drop the PID_IN_CONTEXTIDR hard requirement.

The commit message is a bit misleading, it should say "trace before a 
trace synchronization *timestamp*".

>> The second problem is that we'd put all HW_IDs into queue 0, so if a
>> thread runs on multiple CPUs then it would receive multiple HW_IDs and
>> trigger the assert that unformatted trace should only have 1 decoder
>> per-CPU:
>>
>>    $ perf record --per-thread -e cs_etm//u -- taskset --cpu-list 0 \
>>       taskset --cpu-list 1 true
>>    $ perf script
>>
>>    perf: util/cs-etm.c:3381: cs_etm__create_queue_decoders: Assertion `decoders == 1' failed.
> 
> Seems the commit log misses to explain how to fix issue.
> 

This issue is gone now, V3 will be based on "perf: cs-etm: HW_ID 
improvements" which doesn't read HW_IDs at all for unformatted mode. 
I'll remove this and the fixes tag.

For information, the fix explanation was:

  "The second problem is that we'd put all HW_IDs into queue 0" ...
   making that queue have multiple decoders ... Fix it by not special
   casing queue 0 in per-thread mode in cs_etm__get_queue(), so each
   HW_ID goes into it's correct per-CPU queue and leaves only 1 decoder"


>> Fixes: 9182f04a85b2 ("perf cs-etm: Pass unformatted flag to decoder")
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   tools/perf/util/cs-etm.c | 30 +++++++++++++++++++++++++-----
>>   1 file changed, 25 insertions(+), 5 deletions(-)
>>
>> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
>> index d423f1cb408f..ccf886efff95 100644
>> --- a/tools/perf/util/cs-etm.c
>> +++ b/tools/perf/util/cs-etm.c
>> @@ -295,9 +295,6 @@ static int cs_etm__insert_trace_id_node(struct cs_etm_queue *etmq,
>>   
>>   static struct cs_etm_queue *cs_etm__get_queue(struct cs_etm_auxtrace *etm, int cpu)
>>   {
>> -	if (etm->per_thread_decoding)
>> -		return etm->queues.queue_array[0].priv;
>> -
>>   	if (cpu < 0 || cpu >= (int)etm->queues.nr_queues)
>>   		return NULL;
>>   
>> @@ -1268,7 +1265,7 @@ static int cs_etm__setup_queue(struct cs_etm_auxtrace *etm,
>>   	queue->priv = etmq;
>>   	etmq->etm = etm;
>>   	etmq->queue_nr = queue_nr;
>> -	queue->cpu = queue_nr; /* Placeholder, may be reset to -1 in per-thread mode */
>> +	queue->cpu = queue_nr;
>>   	etmq->offset = 0;
>>   	etmq->sink_id = SINK_UNSET;
>>   
>> @@ -2160,6 +2157,7 @@ static void cs_etm__flush_all_stack(struct cs_etm_queue *etmq)
>>    */
>>   static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
>>   {
>> +	struct cs_etm_auxtrace *etm = etmq->etm;
>>   	int ret;
>>   
>>   	/* The current block is not finished */
>> @@ -2188,6 +2186,27 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
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
>> +			tidq->frontend_thread = machine__findnew_thread(&etm->session->machines.host,
>> +									-1, etmq->buffer->tid);
>> +			tidq->decode_thread = machine__findnew_thread(&etm->session->machines.host,
>> +								      -1, etmq->buffer->tid);
>> +		}
>> +	}
> 
> This works if the auxtrace fragment initially represents trace from that
> TID. However, doesn't this introduce an assumption that an AUX fragment
> contains trace from only one thread?
> 
> It seems this assumption impacts the kernel patch [1], the tool's
> implementatoin imposes the limitation that driver to cannot support
> multiple threads run concurrently with shared sink.

Seems like we've decided to prohibit multiple per-thread events with 
shared sinks, so we can keep the assumption that each fragment only 
contains trace from buffer->tid. This is similar to the assumption in 
the aux sampling patches where we initialise the thread with the TID of 
the sample.

> 
> Would it be better to enable contextidr for per-thread mode and rely on
> Context ID packets to update the thread context? We could then reuse
> cs_etm__etmq_update_thread() / cs_etm__etmq_update_decode_context()
> rather than relying on the AUX fragment TID for this purpose.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/d833aeed-7376-48af-b772-4fe4ac66471d@linaro.org/

This comment is probably a bit stale now given the latest version of [1] 
where a per-thread event can only contain trace from one thread. So the 
context packets aren't useful. I thought the plan was to eventually drop 
the requirement for PID_IN_CONTEXTIDR and rely on timestamps anyway, so 
it doesn't make sense to add it in more places.

