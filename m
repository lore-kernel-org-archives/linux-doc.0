Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7733C8C7D
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537955; cv=none; b=YY7Q66pVzgceuHqyt6pSM/UdcdcUv5WWSGUPk5FicDkysOR9Ujx2OoEcViIyxi/nk1k0g59sdzIJQEZ0K0NjKVb0Doy9PlzrPMLLyiVFuioAYeTN1LO4f4KuJXmItJ3tk4hPoGaYp5kqPwHb3S3cFLNuhnIcYIwKHPb+4GR+gF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537955; c=relaxed/simple;
	bh=i098y0mnHm57TQorRg/tN8rNvRK0uv5JFbnfSKqREz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aKCDX9Um+5/BTGq1D3WlOoHFVVWDjkzCTtGEg7QdUFLWAyEqxZSdRjJhlG9faEfYG/5ShS/3mKZAn/HHX62DA6o7kvNbJXP2CPs+2ZYyE3t4eyz0X8vkN2ef2mqyi70F0SwWmlrBl4pu6pkmB44f2W5ofpeAjTIQNL61kFyoA24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ugBAGAhD; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ugBAGAhD"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso4662388f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2026 02:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791537952; x=1792142752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgzMN7GSKW7bwxrlr1yTEXEUokyD0aM/o483mXV6npk=;
        b=ugBAGAhDkwUDNRWXTqCR9hlFdBb6S4w/BffoywkkgsDPKAIT2JmGqu/4olI4juJMZp
         g8ZFm5Ekfo2i7sTMScylHScoDFB2zTag2n5ZAMq+c5NMgmz9QmcfV5PgRFWLgFvDO93W
         dPZA0K6dKisa5+fFw319aAGmM5EOlFd5BbEERcBysSTH0pVvFVNBD2/pbinG5Q6SIPf+
         Y8qHcxQzXXNG+Wn5VG4YnWNxLC6LWqOoUttgsWL3lEawWe0g5sJ4WZ01rPtFiN24tcf0
         HVgZeEIG/BYfUt8wfwkfT3/iXRQReYGbbWYMCqOBt2J7s+6ULdOy5nSV7C+WcfMmadyU
         LTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791537952; x=1792142752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgzMN7GSKW7bwxrlr1yTEXEUokyD0aM/o483mXV6npk=;
        b=KeG6lHBIlcHnitRJP1CPdxbb1qCULTEd8wjgk3Rlcw+AnuQ8NCFIRfizOuOUeO+Ir8
         29wVhI8/5kezj9MNYvsq0zfq55I7vUuRZs7KLMX3+y5w4D7t9tjaKoMZzMQkLd+owH7z
         uzvjb7Vj1g22wIBtePgxAxljd4yXqZlT2VtQn4o+JBWqbrDh85n3F4tk8cJC7cMWb1MB
         r1Yxw4qyX4xcKl6XLZbm7bstJA+7BvJoBsfC64dgPWj1tuOWWnGVODvQdPDMF22CcxNi
         K0q3jU9J7PyWIiZaeGegLrO+p6HmZe9BwYeT56Us4dznASEsVlQxyRgFVF9lvPosxKlt
         kdeg==
X-Forwarded-Encrypted: i=1; AKwUvBywK+7KHHRY9rCFGGW1PDKynV4NZUsmcOsTH2QPmShJ6AUZxa3SnfSQ5b/iQr30KinCjLL3uW+0z2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCp0uQF/Ic8Q9hUpsGnkHW+3rcsU6wnonQ51+uoFyXPzaLKlsV
	OdZ5WieagKHopXRi2yGym9ThS9KDr8u3LYTbcm653fs76FwhPW3J/hSeChk04biNbY0=
X-Gm-Gg: AYBFou16g9nlIA9n97uGR76OR9GVjMJrUojG6JfLvO6lzGdp0Z8UofjpRL8v5d3km1X
	CsxMuJde3WDYQDkPYCRXUuSvn3lRXsA+zIB5aMggo9Abowdxgw7FiTYLPx1zcbVhutQqBDaE9MD
	Huxq5Dkk4DH7r99wMf/IibW/B5Lfj9dNPoDUJyliVY6Vd6+wR4Wbso3VQ9R+qVvbcEMXYbfoWiA
	IklXhWw+/avRjm8NQb6gpghzkBnbhlf818AwOsh8cdfrpOtN7BLetxsvIvO0KzDb62kA4L76Ogw
	TK5rFuDvd1ireFEFM82pydf+EKxDzThia+i12mMr1lW/RYu++Nal/p/bD12ZspncUv3jjewXPnE
	o1/OQAVn48EgDcMet72VbIa1Q4eCiXtdqcmBmOiSv9K5Ysn892je91ENpmk8LWWVjcCC3wRuUUW
	j8JRuwlH4sUmSyR0BAzHmxi5XPyfoyMYEJerWOJRQagt6qnmWu+VeOZbxTPLv3XLX2YanM6vUl1
	/Ya/i6wIx2ydg==
X-Received: by 2002:a05:6000:2301:b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-48dba77cd61mr2451398f8f.3.1791537952139;
        Fri, 09 Oct 2026 02:25:52 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9462ebcsm3297499f8f.8.2026.10.09.02.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 02:25:51 -0700 (PDT)
Message-ID: <f66a803f-6355-45df-83d0-bb6d29afb4c5@linaro.org>
Date: Fri, 9 Oct 2026 10:25:50 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] perf cs-etm: Queue partial AUX records
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
 <20260821-james-cs-unformatted-per-thread-fix-v2-9-00c4fd0701b4@linaro.org>
 <20260827170936.GO8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260827170936.GO8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/08/2026 18:09, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:49:07AM +0100, James Clark wrote:
>> In snapshot mode AUX records may straddle the boundary of multiple trace
>> buffers. Currently we only queue AUX records whose range is contained
>> wholly within a single buffer.
>>
>> Fix it by queuing any partial AUX range that overlaps any buffer.
> 
> This issue has already existed before this series, so need a fix tag?
> 

I saw it as more of an improvement than a fix. I was hesitant to put fix 
tags on everything because there can be so many different interactions 
between the changes.

Maybe we can leave the fix tags for the actual blockers and asserts etc?

>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> Otherwise:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

