Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFD63B47C4
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 12:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895325; cv=none; b=IAJEq/EFb1tQvoU03vx27Aflyq2ekJY5jAfRA22qb99YUvCHlarwCToph+lghzvDbGvPEdCPIT3w7dmRR3gYUXQxGDVtqfG3HVqHBJqOpbRiL6At/hjmaYbgKlGIjo6VAjOXj0uxulBVZMmsyobhSnAchJ5Zgsl0zUmr9ttet/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895325; c=relaxed/simple;
	bh=1/Z0+jfdd7mDM3BMh29SwJLX/sZThi+uWWJlqoVvS4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvSiyHjUdMFD4ApBsQry+AxwOvwvDiU1F1C4mYjjn7ksZrabT395e2diD/SM7/lia25ycx9GysDcnFQhyD026ttlDWysX3JPP2KydBIVV66o+M0Pc/TYf5+6/qUu78iPIjBDUygWeMt62jwAp9lHIQpCcs7Jh/gfj/PPfKx+gWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuBxhUVd; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuBxhUVd"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ced3386430so3471595ad.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 05:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784895314; x=1785500114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6rI1p3Jw+moamc3kTzyLH+puizVgSvWDnDsVPG7R8A=;
        b=HuBxhUVd65i/hlijXcgpXuaER3E4j8FiQVunIcbk8Q6kH1YZLRhMdqpJ/RYMWwBc4h
         gSrX2U0gFQM40YGUKHWqDLvHhw2/7KYPkrFgjqJM6RDS0GureUfjpr0f+bwC2vcSJPml
         01UHPAMyZCEFFqaTJ0qBjIP9Z+tFmiy1D72Gb2bVmY9V1paSJdWu9vNJQl8xy41TYvA+
         dV4QRqLdt6jriYe5b45nWQ88/vVbOUTeUcK1KXew/v+vgoCIfzTOsDxCcYKxa6hhW62S
         qCPZ5gC2y6uq3Ojis5LhidDurKma72Qu/9lID/ofbEM4IixZfWM+b74+pXruR3+xJ5bF
         Jqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784895314; x=1785500114;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6rI1p3Jw+moamc3kTzyLH+puizVgSvWDnDsVPG7R8A=;
        b=hQ6gWYAWfSjksDwQZdhd2Jl/UX1fNggHKmraszWBpNcEzOEu7UsK30LvWPCDdbGxaD
         cubI4gD6HqCmCqauCm6Ys4MyRmklzb3BQDNPqnWPUxwyGFsK37A9zhCm/r08eFby5Wey
         O2hhg6W+jhV+s35KdWObIx5N9FD29VcwT5UEFZoDhbVSjOFDELxErLEVCRVnNx76CuSr
         kK/bdDfx7RP6lTISW/uCf4aC14chPRaJx5oLp1igieLjEp2r/klawUbGuMxZmlcZcs3a
         0s/osDpL0RuPObcAuu7y8PWcgPp/D/+LPntar35Jv7bSBjqa/rY2NmNnFZmMOkjNqyAr
         ZVJg==
X-Forwarded-Encrypted: i=1; AHgh+RopHt5/TdMwT45thkqnsAcSAk2wStIDLZdqbE2+8NzRwpOCsv+WGjcjeX7oZ9C30i7sVhCyI8j8Px4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyARxw2GqCKfMG5fTiSbIihYaYAgno9ED2x0Hrgj7Yh8W9xwq3X
	Wg+nn1a4KzTHrDWXSTxS4IfPEUC21HHoQ+hF/svlQ/W+VBFM5Ns1loAq
X-Gm-Gg: AR+sD13hssnqGjQagDnPzydWSz5E9BwaQVE7sSF+plf5I32IDCRV/ksBEVfu7i9dzq2
	29UAyg0Y50jvPrayjl0dIfAlszQcAtH2i83GsihJWm2+DVfKdSZQfS+hqRIs4Kvrm29t0wyi0+p
	zzMCFRVnEPqnAo+1SwaYqFQZX1wDDiudf6BJD6pfW4voUSnx/KNsJFapy0CV+q2EABSp5tBtmH3
	oDE5gX2OYKxBXF9wSLb64uD5J6ZiwamVODjFJLaAKLhnauvHbrABhFaZmzSB1kk8l2fwnNWutFN
	ORLTO3A+Ne9p4R0JvrhnvehC1y6kQc2jUl7pJvyYPkVqIhhs51GFb2nnNUcOtXAoSL0vh40ESeL
	Tqu2v/zbC14PYC95snnWQOJEhCC2lX6VM0DqbDBIDW16yRgoY5n7rEFcF0rjUBlvdiYEgHgF1Ir
	mbjzEoBDAnCcaTkPc28e2WriFmKvsp8Hy4kpJK3STwYctvaEk=
X-Received: by 2002:a17:90b:4f8b:b0:38e:5701:644a with SMTP id 98e67ed59e1d1-38ec6650522mr6412926a91.27.1784895313428;
        Fri, 24 Jul 2026 05:15:13 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f039b1d3asm1337969a91.2.2026.07.24.05.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 05:15:13 -0700 (PDT)
Message-ID: <9950154a-8e61-4eeb-ae80-b8a3f9fa909b@gmail.com>
Date: Fri, 24 Jul 2026 21:15:10 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3]docs: ja_JP: Add 1.Intro.rst Japanese Ver
To: dayodayo <dayodayo1410@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, Weijie Yuan <wy@wyuan.org>,
 Akira Yokosawa <akiyks@gmail.com>
References: <CAKJLdqb=dqSJ56FSRL2eBJWdtuknjkmDo=+et_BZOmbWUHuKJA@mail.gmail.com>
 <113d2aa0-a4b3-4bda-81ba-9d23cc237d0a@gmail.com>
 <5f24dbf4-d98a-4ab9-8dcf-dcadcf9307cd@gmail.com>
 <c1006587-c2f6-4ae0-948f-217bb0ff3509@gmail.com>
 <ad9f3670-2626-4af4-964d-a2e7de29719c@gmail.com>
 <9e10d9ba-e17f-4171-abe0-5caa27dbc304@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <9e10d9ba-e17f-4171-abe0-5caa27dbc304@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 24 Jul 2026 17:54:49 +0900, Akira Yokosawa wrote:
[...]
> Please reflow your change.
> 
> Further review will wait your v4.
> 

Yet, I tested by running "make htmldocs" for you.
Here are all the new warnings caused by your change:

    /linux/Documentation/translations/ja_JP/process/1.Intro.rst:29: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
    /linux/Documentation/translations/ja_JP/process/1.Intro.rst:31: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
    /linux/Documentation/translations/ja_JP/process/1.Intro.rst:34: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
    /linux/Documentation/translations/ja_JP/process/1.Intro.rst:38: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
    /linux/Documentation/translations/ja_JP/process/1.Intro.rst:42: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
    /linux/Documentation/translations/ja_JP/process/1.Intro.rst:44: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
    /linux/Documentation/translations/ja_JP/process/1.Intro.rst:47: WARNING: Title underline too short.

この文書の内容
------------- [docutils]
    /linux/Documentation/translations/ja_JP/process/1.Intro.rst:47: WARNING: Title underline too short.

この文書の内容
------------- [docutils]
    /linux/Documentation/translations/ja_JP/process/1.Intro.rst:88: WARNING: Title underline too short.

コードをメインラインに取り込む事の重要性
------------------------------------- [docutils]
    /linux/Documentation/translations/ja_JP/process/1.Intro.rst:88: WARNING: Title underline too short.

コードをメインラインに取り込む事の重要性
------------------------------------- [docutils]

    /linux/Documentation/translations/ja_JP/process/1.Intro.rst: WARNING: document isn't included in any toctree [toc.not_included]

Please resolve them all in v4.

> You can use a private message to me if you'd rather ask questions
> in Japanese.
> 
> Thanks, Akira
