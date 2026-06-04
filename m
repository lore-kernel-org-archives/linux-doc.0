Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18FE3F5BE2
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 12:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575769; cv=none; b=aoNDzVYMalg7COxK9dlFnqIXzG2RKYzI0D2yJy6B1I79gSET7dn8ZskICisA8vcl0rx2UnIq/5tbMiMwMKCNn+x8MvP/4odf6SkwGP3hmedoHL6TAPr5ZEXqMX98FwDdh3iHNLt1M/6HSR8mx1zomaB83Kpi4JAFLaYx/rtxemQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575769; c=relaxed/simple;
	bh=a15fuknZPhg5CxoMfrb46XjXkuhlhr76ZG6Cgy5CSJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgFJSxqP7LCHYzUg3Oqkkvj05uzY2FvRdGXdECwgZw/Itk5eBgAaObVccu225aJbDfNu8KlGC4eCbM0nCb8YM/pc16ND8O+HuNEYUvpdiM03Ytolf4Cu0heBMzhodyeG+XU1C/uPwHSpQLwo6hEpDt6s+HvgICpygHqwezNMvQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z7DRIlwD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z7DRIlwD"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45eec22fab7so348989f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 05:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780575766; x=1781180566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oKLGdfNT18VsLriOtCEzvToAjcqMcAhaOgOhA4AjUBM=;
        b=Z7DRIlwDE+O5+F0yRaV4aNQJhCYEoeZ48p6+2MdthghnabTwr+VK4iyaVxW7rpeJJf
         wLGuOz0Z3d1uJbCWkkvzVfgIAqg/NpqWPwYj38e3MUzIWeEz41ME1vij0VO7kwq44Sbk
         sa2oINx1hAImPZqi5oswDQSCIUAN7ZcbgcKSe7ooWxcqhIdE1RojDtPz2Q4RgraHiGjI
         wc7YcvC0BmAS2+rAyRZPm+8oSV+YLgwZzQNJ1peOlF6cc/0Bo+r42NxpIlH869jSh7hW
         cw0ULVATqK7Sx0T9vLW/0ycPdjSa1xS98bWVbMi1LTyJtRJC/it9asoHW3sMB1+4RLyj
         Gnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575766; x=1781180566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKLGdfNT18VsLriOtCEzvToAjcqMcAhaOgOhA4AjUBM=;
        b=nsLwM0UsaAwqultKbR/1dIeXyup8iF7Z6P4wzV4v+P7tDnwwRNmlgW+F2+7jk/1TAC
         +bQppbcvho1TVXVK9TWE78gyP6xmGh+bkAePZ0fV9tzoAkrDfCI8V1uqcXQXpEmo/xN1
         2N8pwwfBg1Setn43Ro4hZrjgrS8uhY7VUAz0EuccBXbclFPbpCFvyRWPd2ZrPK3uJHNM
         zRmKE27gZAufHHdSBblj4NdDkzjwokDL+HkotLFmv022p695M98+dBM9KDPwC68u2es7
         BFMIBPO97hknQwHNR75dgFPNhWQ6DNV6XEjfu2pFNzhcUoZtCqg7jBWM7MCWds6h/Zdg
         RjeA==
X-Forwarded-Encrypted: i=1; AFNElJ+7YUF6y74cWPo6NpsrYMbKiURO/5wviQoslTGdQp59wmNbCv9mBHhp8anbd0M80FlVbhdKJmHXX3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCtu0ZtBgTKfI8ddluTZERWRq3RsstiMT0VzrT8cfTNsMuUimH
	EgeuqZIJRcpHnWzua+7a+ENHN7+wn3OhkVKW0YMpt0GgTg97PTmhQy0+kJXseo180Y0=
X-Gm-Gg: Acq92OHr1qaKFmL8VOBGUKFwPF0MlLZkDMu/xct8TqqZgMFdnD9n+zHP9VSF5wdC9yY
	OCUA2CkTKXUcxte2puqB1Hn/iNKHsxdVEj/kmtjtLyxx/1ozCqoQLcCGiCpw93P+xVhPleo5qeW
	t+EOAXsSTv9UJoyBeLgroARu9NVeobQZXcnpMFrQy3Pa63SsaJJfoDAD2xSDRHO5AEdKey/mKVk
	hqUud6+FX873l2zbQ1+EcDw5gLZt7mGPy3yf3IwGTIMtuC8Vz0KYlhlZ6F/3zs9W1MhRJOmow8o
	67hEBS5KJU3FkiYV46Bas2Q6KmevVClqpG71UFzOQCTPshuMnazlCQBLoyc6+IWGsS31qGhW/RS
	ttXRlvHaRFOv+PYvQzZGdw/EDg9dxAYpxTnb5sz9tDPmHiEu+YpPROkGmfmpSxtVb3d4oXsswZB
	vfzW/stYtIWEteFJsy3l02bq8KnWpwIiwcVD1bA4g=
X-Received: by 2002:a05:600c:a016:b0:490:bc46:1a58 with SMTP id 5b1f17b1804b1-490bc461b57mr64677525e9.18.1780575766123;
        Thu, 04 Jun 2026 05:22:46 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm15406844f8f.37.2026.06.04.05.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:22:45 -0700 (PDT)
Message-ID: <64f23ad7-5033-4d4d-9e64-7503f0d2c46c@linaro.org>
Date: Thu, 4 Jun 2026 13:22:44 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/18] perf test cs-etm: Move existing tests to
 coresight folder
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
 <20260602-james-cs-context-tracking-fix-v2-18-85b5ce6f55c6@linaro.org>
 <20260603180219.GJ101133@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260603180219.GJ101133@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2026 7:02 pm, Leo Yan wrote:
> On Tue, Jun 02, 2026 at 03:27:00PM +0100, James Clark wrote:
>> There is a subfolder for Coresight tests so might as well keep them all
>> in here.
> 
> Now we only have two shell test for CoreSight (I might add one for

That's not right, we have 6. The tests/shell/coresight folder already 
existed so it seemed like a mistake to not move these two in there when 
it was originally created.

> callchain test), seems to me it is more meaningful to move Arm specific
> tests into a central place (like tools/perf/tests/shell/arm/) for
> easier maintainence.

Maybe, but arm/ and then arm/coresight probably makes sense. There are 
some tests that have arm specific blocks in them but are still shared 
with other platforms so it could be confusing. I think we can do that 
later if we ever end up with a load of arm tests, but right now there 
aren't many.

> 
> Anyway, this patch is fine as well:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

