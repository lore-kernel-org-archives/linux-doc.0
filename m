Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F13747A
	for <linux-doc@vger.kernel.org>; Wed, 24 Jan 2024 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706108549; cv=none; b=CEfsMDi14WD3GJxQ/Hlg2plKRF59OIF5ipLUn0Baaxk1cNfzaq6zA55XH5HBNK9K5aoy9KReS6cN3lCPOuumVD8Bmd7H+CCJfi2AK0VMSqVMgJbFGLfZMZWXaWrPHfHcPvCd5F6k8reroEilWk57yLadKCcfnax17vffPTaq4u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706108549; c=relaxed/simple;
	bh=BOi5e1tfVfqqINQvinXVTE4+DXtdgoXgWJF8oClMg6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L58MjJdKNbnivtbP751E5MO5t555c+tfJbHiQXK6BCocNyhRk/9P1WOSlkBtgrjRGtvHG5iAE6qRxQ7T2nED+RC4Xt7npjKE428KYVtyrnAwDa/X5i6jwBNn0BhinmOh0AV6xB9abmmVE1x3wGDGcwWg8qAVYLzMI9yRDpFS4c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSaQ9WOR; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSaQ9WOR"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6dda0e3600aso435813b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Jan 2024 07:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706108548; x=1706713348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LWXfIbB9esZwNcOuZ+NyBS1AWMzTOoPoaLwqvlF1iGQ=;
        b=dSaQ9WORT6+xczQUBCPa/tWvzwEFXWUjz61EeIPG7Rp7o9q3CTQaUV7z8HH2xxcGnK
         vUOx/2h6K+UgyfkGkid0jyEMohQmyKpOGERUcIxA9RQAoIGTSZGgnnKKEHoj+nglBA73
         rhdOXMFc8FERy7MxLMp0Q76EKz3lehAN01+aOw0NAWHZs5PSOMQLTLytzFZl/2lYSr50
         HJxg9Ms9aE20Gfz6C9Du7XWkri80Gj6xfRR95RVFg8rr1noLrCbMEB29BCopotztwRj/
         JtOVOs1YB6cvenOndJzIdYn6/LGdcP56BHVmaPLVkiduhOP0jEcXF5ChvcC09Ps2hBpB
         M1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706108548; x=1706713348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LWXfIbB9esZwNcOuZ+NyBS1AWMzTOoPoaLwqvlF1iGQ=;
        b=eFg3hSgLeNdeHEqHLy+38XoR8gl7NH+bWWKDHrxFpaQA69omMOh19kUtG9FG+Oydqt
         LoJ4FCf5t7fYWzUVBwHHntS23qp1ERBqCeZsLVDMLW55+0qB5q8uBDVNjcgquxMrPeGm
         ie042cVg8zelKz6pDTUO5vrwLXa4/LzbHzUOs7h+7YFSRD0fGdRp29CM0h5BvOW4c6Rc
         ZQh1hg3BBdsSLxF48+b5aGFeP1tathp4/SixT5uaAvWc+lts/8kyBOL55TSdbfATrKsX
         v6ubWR6QgjQg8wbvbe13L7nrczZ6C4+kJI9RIBv1heWQm2XR8uxOVEeb71QtYJu76pTF
         ZzQg==
X-Gm-Message-State: AOJu0Yz7duvO/g/eQ3G+ca3e0nyD6bMg/rgVCpVYhSyOMWQ/ztIR+Njx
	mT1nKQQA51ObUpIj6PoZvheoTEqNVdblC6kaB2oCgbw7TNJighU0
X-Google-Smtp-Source: AGHT+IGL92YkX9l2KTu/rZvBRwytv4G+vwVB5we962hTDH8eipdBaa3e/cxclly5ElLbmf9ozo6xDQ==
X-Received: by 2002:a05:6a00:1da4:b0:6dd:80a9:e1a with SMTP id z36-20020a056a001da400b006dd80a90e1amr2797520pfw.39.1706108547943;
        Wed, 24 Jan 2024 07:02:27 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id z8-20020a056a00240800b006daa809584csm13748927pfh.182.2024.01.24.07.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 07:02:27 -0800 (PST)
Message-ID: <6e4b66fe-dbb3-4149-ac7e-8ae333d6fc9d@gmail.com>
Date: Thu, 25 Jan 2024 00:02:20 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: docs: requirements.txt has stopped working again
To: Vegard Nossum <vegard.nossum@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
References: <cb72b3d6-de7a-4c8a-a99c-72d58a23f89c@gmail.com>
 <b0ddcb5d-e735-437c-a828-5e400facb978@oracle.com> <878r4gnsev.fsf@intel.com>
 <2018acaa-a6ce-4074-b3e1-1a12018573fb@oracle.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2018acaa-a6ce-4074-b3e1-1a12018573fb@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, 23 Jan 2024 14:21:32 +0100, Vegard Nossum wrote:
> On 23/01/2024 13:30, Jani Nikula wrote:
>> On the other hand, if you're using a virtual environment, what's the
>> point in holding back to a version as old as 2.4.4? You might just as
>> well go for latest, specifying only the top level dependencies,
> 
> Performance... Specifying exact package requirements like 2.4.4 is
> useful since 2.4.4 is by far the fastest Sphinx version that builds our
> documentation correctly (AFAICT) and build speed matters a lot when the
> difference is 10 minutes vs 30 minutes.
> 

I've never observed such a huge difference, probably because I almost
always do clean build of the document, i.e., run "make cleandocs" before
running "make htmldocs".

So I assumed the performance regression Vegard are emphasizing should
be in incremental builds.

Here are some of the results comparing v2.4.5, v4.3.2 (of ubuntu jammy),
and v7.2.6.  (v2.4.5 needs "make -j2 htmldocs" to avoid OOM.)
Incremental builds are done after moving from v6.7 to v6.8-rc1.

VM spec used: memory: 8GB, threads: 4, ubuntu jammy

data in each cell: elapsed time, max resident memory

                                    v2.4.5        v4.3.2        v7.2.6
  =============================  ============  ============  ============
  clean build at v6.7            10m08s 3.3GB  10m31s 1.1GB  10m14s 1.2GB
  incremental build at v6.8-rc1  11m22s 3.3GB  18m55s 1.2GB  19m50s 1.4GB
  clean build at v6.8-rc1        10m45s 3.2GB  10m32s 1.2GB  10m13s 1.3GB

  empty make at v6.8-rc1         3.3s          6.6s          7.0s
  =============================  ============  ============  ============

I took only one sample for each run, so these numbers should not be
taken as representative, but they can still show tendencies.

This means the slowness in incremental build is not improved in v7.2.6,
which contradicts what Vegard said earlier in this thread.

I think incremental build is what Jon uses in his merging.
So I'm afraid the performance regression might be troublesome in Jon's
workflow.

HTH, Akira

