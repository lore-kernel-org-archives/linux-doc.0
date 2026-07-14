Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D037B03C
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 02:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783995423; cv=none; b=BDRsn1z8fCpagGNxALMWkBTN6Db+fPeTM/xqsbKqgjHLm5Dh8YnAOTY9sZGceuRTmK4+B1g8Qt8zYlYb0DaDp6dHFdWPh6rs1yaejujQnzcOvzQK06ihWwOpWJGxahNuAFQJfiiqbI2qC4OkTgtHbtRPT/RB8UVsE5L7mQXRqsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783995423; c=relaxed/simple;
	bh=PwGUfTieG/50OjcsJpku7eifqwWute7gRHBd8d6gnw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tmrEcd/axrzfv9NaHQVyC6sXQFSljog5pCY+uBQHMPEq3ye3v2X8rMzNllPIuYlMPZh09TDcNQ9qQbEsDR+3RdBTQyA+a1w9elhvtq+7E4mzv0ajca3Hv+tFWSf+FlK1yPfCcGBfmQu54AwfcF1EOWLBGZDgMiAHLsV8FOT8gGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZmoRZbV; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZmoRZbV"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9aea40d799so207097a12.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 19:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783995422; x=1784600222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rrlmXbRSsvwvXnyIChusW3biT2HdiSPkf4UnhnPPa2g=;
        b=QZmoRZbVWSDoAja0vMLUkFP4LUjYy6DZLYuBtuJ+Q9IlwDxEck5Jhjjw7DaxnzRmhY
         NkOKKmaSPQxlmQu3iBpZok/SQxcVXT0oLYcPbHi2s057GvbzR6udVt1aJ0HsdIGhcppU
         TkUp0r3oFTFuyqL04jCdiZzTCAT1pfUbW9G3YDuNI7om3F/z4SBa5CNs0GeVkTQyBtB+
         I05DmDp5s0X18Q1XIInutIPA967twbl8z4KgWi4AP5npVMus2w8y6uJzp+4qZGdqf3Co
         ev8xhJ64LvQGMuFBfWmtgc1NFUCWBy9F+ny8wJ3LDzGDb80E+13Xd3FcF5NBbF1LR7/e
         OZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783995422; x=1784600222;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrlmXbRSsvwvXnyIChusW3biT2HdiSPkf4UnhnPPa2g=;
        b=GFD4M/LLvfoVFn5vJrQWonU4BqTmA4rpDfG+V+3LmsJE+KAWmpVxxVY9g05tcDQCgB
         dpsimhAq1KgogizQJg0CqdPLrTseSwFUGWDr7jQrWS27P6Mhf4JyBwf9eZkxA1fsTxyv
         zrtVlkQTw9aOjVuI7BJ7CCaqvhGdhgmX8Nw7uIbp5pHFSDdc/hn6qdv1DuD2E8RP5svm
         tx+XeRLoPA3FignVBC0fIGpNiPnRYDgm2X0bv1ZbsLwFT2DOYEm4J3IMANHGaCI4//ro
         SuonozMbbNLWuzOqc6o5NqRE+/7Q2h1VHJbj7ak0C4Lml4Kks47XsQLB4SdiJ+kiCWy6
         sMBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYXupL0OmGF+vmkwLrfLMXBKIY9fHWtQjOCF8PYK+Od/THSZLW1uQ37fql+rFkmg03Fh8kQD7rEvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF0FKPUQUw23ADj2FtDfU49hpeTE6F85jjJ2Ek86jtniEtnhIb
	ypanJcIRra3HkgZUK4Fln4OJrPQQv8phC6Yp9Ov/7f29tF0XWmkdlA5l
X-Gm-Gg: AfdE7cm49w7byn9CvKYEczOtChXksdiKDDY0keReWjMeVEfJoYcilZ0qrzNRYl3u11F
	LOb+JPcb8FNViAJEgXOAfaWGKnCtwhOEHTluV9Uf1RBGXnrpyhMx5SfP3VmzLPdvThvVb61cBIb
	U8EzdC8MfL87hfwe9R/MN71hlc6m6V9NADausV70NOUNQbH6Rxh/3AWMZbpjn/x6fNLFTrkyH30
	DgHQiA5f9ZNKTsUSlH6Vv7H/sYx/kZdGbnmlFtDGokoeSujH1pLKM2zbsu5TIUndhoCd5ajnVFK
	DdxJwmdq/mb7+49IEamGS9tLzwHViLf5hOcN5i7pv1ke5xW8yZjlogn+4b65kO4iXvd5hB+cJja
	cuR6VnRv1eBgqWtuvtPh4l4B0cL2TrAC/iiuGNzQ7Q2+/dZ/5Qray0PCu1+69MIaCuX0QOqyvya
	BdqofXQOHYy/LkEL/caBIdzz4xK+5CAK0Q4zs12HlFdkDq484vod9e5LDFr3z3NrDO
X-Received: by 2002:a05:6a00:9298:b0:847:86d8:5937 with SMTP id d2e1a72fcca58-848897d3be6mr9715305b3a.50.1783995421730;
        Mon, 13 Jul 2026 19:17:01 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:3a01:ce86:5400:dbd7:7cc6? ([240e:38b:e68:3a01:ce86:5400:dbd7:7cc6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7da400sm640395b3a.43.2026.07.13.19.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 19:17:01 -0700 (PDT)
Message-ID: <690241c3-8aed-4690-8f03-0dee1adf073e@gmail.com>
Date: Tue, 14 Jul 2026 10:16:56 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: fix KASAN SW_TAGS mode description
To: Zenghui Yu <zenghui.yu@linux.dev>,
 chengyaqiang <chengyaqiang@chengyaqiang.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
 corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, chengyaqiang@tsinghua.edu.cn
References: <20260522075735.2022734-1-chengyaqiang@chengyaqiang.com>
 <05ee738e-37ea-4697-99de-4cec914066b4@linux.dev>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <05ee738e-37ea-4697-99de-4cec914066b4@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/5/24 18:44, Zenghui Yu wrote:
> On 5/22/26 3:57 PM, chengyaqiang wrote:
>> From: chengyaqiang<chengyaqiang@tsinghua.edu.cn>
>>
>> CONFIG_KASAN_SW_TAGS enables Software Tag-Based KASAN mode, not Hardware
>> Tag-Based mode. Fix the incorrect translation in the Chinese documentation.
>>
>> The original text incorrectly described both CONFIG_KASAN_SW_TAGS and
>> CONFIG_KASAN_HW_TAGS as "基于硬件标签" (hardware tag-based).  Correct
>> CONFIG_KASAN_SW_TAGS to "基于软件标签" (software tag-based).
>>
>> Signed-off-by: chengyaqiang<chengyaqiang@tsinghua.edu.cn>
Applied, thanks!

