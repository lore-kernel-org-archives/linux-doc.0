Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915133537FB
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579894; cv=none; b=HycxjFnhCzmW9R12KXjXWmt+0JAGgE3L6xHH879Ec+mXniuBK/E5zx20WE1wdprnvdeosWhYlddYhybLYRQrPrDZngbqwlNZ/I0FRsamNsNGea6bKUlccZPtHRCpRyyT1gBmyCd/PMsiQEIwxfZVGMwitTLN5n0AICHd/SN8C40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579894; c=relaxed/simple;
	bh=kOyFFVsgLyRTHjGzNqbc0mRHi+Lm0TcVUi4DJKuIv1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hoGHio2vX19e8XIk4EDILL/bLxOK5WXDml5ERRyHDZ8aNys9X+DywvEOFbRR4eYXVI9Fs86le7Xa3XTX4edUVmJVr0BtY7uOM4jzy6ta86zEvy6i6KeGLDPlRfDAE68Mv0aqX67r/yH5t6yurVecwGEqbZ4Dg/EPWDOZFeAhgHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ip8l7wLg; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ip8l7wLg"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bef1e6423e7so77936866b.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 06:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780579892; x=1781184692; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8RpaPlWKAO3dChkQSzu5tZ6cbmxeZTl6U2Q5KqvJNao=;
        b=Ip8l7wLgkCA3A9EDzSVotx7iS2KQ1G/2pV791Ppjql5rpgIXBlteJ+/qA+lBV+G30K
         0tajJcGR0AEcuUqAnK5T3N5WI5ym4onmv15miUIghGjFm06YZXzC2ZjSs7N/M/CZ8d57
         1rhjeCAX5GusOP3RSjVwhTrG27D5liR8lJkSX//W5vUQH3u9GupGG13pBtnBqxmkDjHN
         CbyJvboweU39uJH6bLuh3kDhtTkOOGy5Ra0eQ+BB/qoxOQy1tClTgnQMgrOuGZ8OsK2y
         f0u+lEqP3xt84GumOUR/hP6HpVrEakSfqCm00UjEU2FFeLNmm2IUfZRyNpM2FDekCwej
         rRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579892; x=1781184692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RpaPlWKAO3dChkQSzu5tZ6cbmxeZTl6U2Q5KqvJNao=;
        b=nwb2wR8dJeFnOztZlZ6qLRPakrNp7346LgWbOmtvftfTWnHuPQXKc3eo3RRRGb8CnZ
         XnbltxIk2kLCCp0P0B/V3+B+fRcD7AWzuGIZ5FdpzEXSoBCX0Plmpa1gPzn/4LXtw6KV
         9u7fHGpUaXqT5HyFMmIz5Hv5Zk3IWzA+da3mRh/pu3g2Tmf2uIDWzZzi0GYGWWGmP5wZ
         kBbZT4OAFC5AxiXoCIT+27pJxG1I5aiBbFwD1gArmwQkRwilnLPLWkQk37mayMxA2/VJ
         V4py3CVKfOPiigClxsIVF13h+85GRWO3lYjduDhSRLV3AW1Jkb3rBCNwnJwOols9XyMb
         2bcw==
X-Forwarded-Encrypted: i=1; AFNElJ/khw2Q5XTCET0oPeroQlwoJcpwhUrt1ANUMe21yJ4VGsD/gEVWsO60o3AxsAmvB+6exuKQblEGJ20=@vger.kernel.org
X-Gm-Message-State: AOJu0YybGzJz2YIfSEHQMXwW1TtmqCfjjSiUoPBu6JAVqDXH+Po5XKBt
	jNZBci2tyQ/1+eGHjASKa1hjOLJWZIk8knbi0JJjybz/PwEgpOnzGPGg+6awAxfHi84=
X-Gm-Gg: Acq92OGhS3YBmoJDVwC2ElAGWBfQ4K+b4Gen3GRVzHBSV19QxozKKh9HNt2wOIYHTdK
	y6nU1/LonSlDWdXnf40G0bGJlH/mceprLX9k6TJP0xYZG1RHZLpkQh1t9JMoBIZ3v9WTp3Z40dx
	jRegIJ/h71hxwanPzosPqJOqiFGOtjE9G7inb5/I6lGpRfnVggdXrk2vb6kov1rW1Witu137Lg/
	Y18QX4YDcoaYygs0FM+EuFb8m9Wis4bRexZ8vihoMuuSqF8FOw3BBvxi5YNWANciiM/XuTcmxq2
	KFv+HBoB+InJhV4u769e4cnWH8aEwvmFZAo2tHlE2hYXZBhkacQy3lYiLVEhmftjsCD73tkQSrn
	WaO0umhF7ElpUKhHn4tLCsneygF/98JrPFzo649nlFWF5aAeBauf/9Ub4oDvRXv5IHKVKf49+U/
	1hbd1mXa+PijuB/IVmVPsmBj4tRhhL79wwPV2W8O4=
X-Received: by 2002:a17:907:6e89:b0:beb:f71c:63a with SMTP id a640c23a62f3a-bf0ac304ccfmr461348966b.2.1780579891965;
        Thu, 04 Jun 2026 06:31:31 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055303fc6sm309199566b.42.2026.06.04.06.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:31:31 -0700 (PDT)
Message-ID: <8721d1b4-ce27-4ab0-9a24-138c31440e94@linaro.org>
Date: Thu, 4 Jun 2026 14:31:30 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/18] perf test cs-etm: Remove unused Coresight
 workloads
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Amir Ayupov <aaupov@meta.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Paschalis Mpeis <Paschalis.Mpeis@arm.com>, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
 <20260602-james-cs-context-tracking-fix-v2-14-85b5ce6f55c6@linaro.org>
 <20260603172546.GE101133@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260603172546.GE101133@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2026 6:25 pm, Leo Yan wrote:
> On Tue, Jun 02, 2026 at 03:26:56PM +0100, James Clark wrote:
> 
> [...]
> 
>> -When you run perf test, it will do a lot of self tests. Some of those
>> -tests will cover CoreSight (only if enabled and on ARM64). You
>> -generally would run perf test from the tools/perf directory in the
>> -kernel tree. Some tests will check some internal perf support like:
>> -
>> -   Check Arm CoreSight trace data recording and synthesized samples
>> -   Check Arm SPE trace data recording and synthesized samples
> 
> Should we keep the chunk for but suggest a perf command as
> 
>    perf test "CoreSight" ?
> 

I put this at the end, not sure if you saw it:

  +There are a set of Perf tests for CoreSight which can be run with::
  +
  +  sudo perf test coresight


"When you run perf test, it will do a lot of self tests." didn't seem 
useful. And the other part about the directory was general advice which 
I'm not even sure is accurate. The tests are supposed to install and you 
can run them from anywhere.

>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index b539be153f6a..7efb893edcbb 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2751,7 +2751,6 @@ F:	tools/perf/arch/arm/util/cs-etm.h
>>   F:	tools/perf/arch/arm/util/pmu.c
>>   F:	tools/perf/tests/shell/*coresight*
>>   F:	tools/perf/tests/shell/coresight/*
>> -F:	tools/perf/tests/shell/lib/*coresight*
> 
> Need to delete tools/perf/tests/shell/coresight/* ?
> 
> Thanks,
> Leo

