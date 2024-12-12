Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD70205ACF
	for <linux-doc@vger.kernel.org>; Thu, 12 Dec 2024 15:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017252; cv=none; b=NiwN6MEe1yXJtnXdnLn33fDrr1pLuMWiDufPN8Ao6q91jsueFhAJGUWrwscy/1DbSvbm7iNEx4CRN0tShC7UdWLqBtoAVrwPGDbGZ3FJ4tMLsifgpgyFc2ij4vkpp9nNlT4WzUTaroZeX38Zw43PSfs1OMs5CcMxpscSFC0Qjcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017252; c=relaxed/simple;
	bh=kPTkKrM3kFQT1WhPXY8whVxdWlSJRTnDz/er3losxv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0xuylhuGhBLQPfJj+LgAHA0SWQWByPrHY7qqzHKOqkBBPOqO5tv3QwJnfUrGVHsUg8+iTQyfBXAqYJu7TxROTUnanaVbCYsvktNOrgH96X2zKbUJLm6KIj56tivcIgCMuDtYOeitq3m2fcpTJYBqH9lebNwoN6o24FI7xvo09w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ArU11VIy; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ArU11VIy"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385deda28b3so532990f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Dec 2024 07:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734017249; x=1734622049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DpS9P9XwAS30njS9V7ckdqZVR6lOQbdme3ixokuDXWQ=;
        b=ArU11VIyVBd0nOSKkiUCGzVcnO5WEx0IPbcNgnZJDET7COlywsLoffg6EMno9KtxEN
         xLPtXTa5cluSa1ACJwpyDUYX82XEFZ/h39UQ5l3b3xBRV8PwkSEjDeJPRdkkr2T2otFH
         Ryk3OXcJHUlzOv5ydxfI+i54OyYNS47ysesQavF1s/chRHf+OpfM7024T8acWOUgwlXK
         DeYkngSx09LQlIWdCJDOCSgTuyBQK7JS94XYlcx3pTehfI9D2N2AC8VLAWM1DgDY8wCa
         kDjutmGnr5aGIO70SULI2Vx1MeSOzfDHC3np1X6PemT6jCsn6hNIiTAlwj8nxGW4TI66
         2JMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017249; x=1734622049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DpS9P9XwAS30njS9V7ckdqZVR6lOQbdme3ixokuDXWQ=;
        b=qTmSox1Tlxx0KkKhMhfsWZIB3JyG4a2M4gz3xmNfsh7Qcup78COb4z3rr3Ql8SyvLe
         s5FsPHfPPovoEj1oxFSdo7evdUJb8MaCsp5i1Q05+O+jxpkNeuCRR4+0Oq8HFyfOjEnT
         JvtJrf4/VO9sWNXCa2CDgRx+HMH2VOPPsnrNhwO7R9hg/unyZHUgKR4s6yoOLHjmMLz3
         wq/1BHqmJxy4ibORrXlRZCSIE/UNPjgsLOVAN6Rsn5xrHCnKPnfR5KPcbZmk8QtL5p7p
         CIScV5P3pjSkIRjHjLmUKz+y1SZNwaTWQG00fLgu4h9rzdcY2gVXZ3pjAplPlCUvw+Is
         zpdA==
X-Forwarded-Encrypted: i=1; AJvYcCVKh+nYju+SXiuFxBg+unccHVNfD+Rv+0WKJJm6orc9EWYd/snNcMp8xX65p4DIgfMDd6vXxbvs/N8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5MyDU+YTYxV1498te3zZBL1+aputSW1iNoKQOh2dtpmCkkiN+
	l9vILegOePC4OlZpy31y+Zpr9BGSFWpHBR3348m0TCbz5x/a9zVVcYOVYAFymoU=
X-Gm-Gg: ASbGnctkTIezHLULw5pufo897M349T1BV6PsXbNJ0OAA6lzlHgENoHO0dKhskafRLuX
	maQtAiolqmQgME5cbMoPkubC+P+P5TKxJXs8bLdsVCqxJn5AMzDBKwKjacadCc3/+j9CExtBJE/
	wpcHMJfnQnHJCX52vChLdmJAJh+lrGS5Ebt5qSxy35bRYl3dqlvlLJNIoujTGtm7/6kSJMNtTyz
	91PWlcf/V3KQPJc2ANKX6IDY7QVR8XQ0+oQX7vzgR+L81FkSWhNxfI+8jj3/5g8m+U=
X-Google-Smtp-Source: AGHT+IEhNl36m73Z9uj23to0PG8NFMTyNmDs7ZQ3Hettg3uLA6lpt+bVWiT/atLfW0TWRdXrBJzlMA==
X-Received: by 2002:a5d:64a9:0:b0:386:3213:5b9b with SMTP id ffacd0b85a97d-387877c9747mr3330810f8f.43.1734017248923;
        Thu, 12 Dec 2024 07:27:28 -0800 (PST)
Received: from [192.168.68.163] ([145.224.65.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878248e54dsm4329749f8f.19.2024.12.12.07.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:27:28 -0800 (PST)
Message-ID: <24299600-277f-48f4-9be5-cbd65ab6ddb7@linaro.org>
Date: Thu, 12 Dec 2024 15:27:26 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: docs: Remove target sink from examples
To: scclevenger@os.amperecomputing.com, coresight@lists.linaro.org
Cc: yeoreum.yun@arm.com, Mike Leach <mike.leach@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@linux.dev>,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241210144933.295798-1-james.clark@linaro.org>
 <9e53f5b9-d8a9-46b8-8ff1-7f018e2d9c06@os.amperecomputing.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <9e53f5b9-d8a9-46b8-8ff1-7f018e2d9c06@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/2024 6:01 pm, Steve Clevenger wrote:
> 
> Hi James,
> 
> I thought I'd mention this issue with multicore self-hosted trace. The
> perf command line syntax does not allow a sink "type" to be specified
> (e.g. @tmc_etf or @tmc_etr). For multicore, it doesn't make sense to
> specify a processor mapped sink as would be the case for single core
> trace. A sink "type" should be allowed to avoid the auto select default.
> In our case, the default is the ETF sink.
> 
> Thanks,
> Steve C.
> 

I'm sure it would be possible to add support for this, but I'm wondering 
if the real issue is that the default selection logic is wrong? Are you 
saying the default you get is ETF but you want ETR? And there is both 
for each ETM? The default selection logic isn't easy to summarize but it 
should prefer ETR (sysmem) over ETF (link sink), see coresight_find_sink().

It's probably better to fix that rather than add a new sink selection 
feature. Maybe if you shared a diagram of your coresight architecture it 
would help.

Thanks
James

