Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8972628488D
	for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 23:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758152604; cv=none; b=GxS6oSvjDpp7InWRUIWLGl3NY9IAWEgrseH0HVYyW2hHcMMd0GlXgYw5MpT9/yFsIEaY0deFwm3r3XWgR1cXQatpEmHjaNP4peH6kdCP+41D4At38Jjj0h3D15YaaIdQHRD+fBm2m2mPfYCgQtA4FybvrC1SbO/IrnBpwb7J8h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758152604; c=relaxed/simple;
	bh=jSeTN6nzIsbHOgx4OEw1vk2exHEt/XFJjBSNPI8dLAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNIi03bAWnjTZfVB0j538/dgbTGM3dpOyLfCrY5z2uT3eC5Ox7HO5cW+EpXc3On1PNbxNPmeCTQJxgVu5l2SJNaUyil6n4+R3m3qQFVSI16PVGVzv77h/8RDSwHlFXdMp4X1naF67p1z+FVlEkJDmwKbitzfq+m9nz/1ve0W/W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPEZHvck; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPEZHvck"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-25669596955so3499245ad.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 16:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758152603; x=1758757403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K22AcgH6usYW+3VD2+AXa1QNrSpq3eTK8kK1qqAVf7M=;
        b=JPEZHvckUWuBjK5xQUF30TCZcTMkbFIsouJL3gLtw3ihH4QOofVytEnwF7byG4Ip3b
         eI1QVWhSh8KsKGsr3ZzQEwRW/pfbo6yeySwhIFexwxAUoFw/+rqByvYvDIVQh8ZEG6Gc
         Jaw563dAbOlyXeGSk7s6qMDJCwrBvjRjbadfbyuGBbg1+LVPh6oIR/0jTCKADa0/+QQR
         mYMYOM2Z84vh9sZB74KE709MDpJB8DPC/QGxyAjWLlLZue1eX5a8d2FPdDitVO//PQ6W
         MHbj19bKvaT1Evuco2eukLhOq8KRi3dpxuZDT2+IBEfLg49j5h8lGRp16/tOAnVS9yMS
         Bk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758152603; x=1758757403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K22AcgH6usYW+3VD2+AXa1QNrSpq3eTK8kK1qqAVf7M=;
        b=WhfT/OnoxZmE4k3PcvJAYWk1BxeDmSVvLzY4Ua2rqO8tGDC161PBDcAKBZagC220Sk
         fHovjHRkWGDeowWKOwF6bMWKBMp6tIFuXaI8y9tPcRdN69KipCOti8rYcjYF/BJLT7ha
         LTSZK8LTSnraPKxZ2GxKBRKbcX4eZT2c4MeB5fY7UnYzJ+pAD2n8jmc57a3BgJViAUCs
         VXmc6s1Ni32JgS2TrkRvBWsQRWlAICwYYqW2/8S+ty8yu6fGfXCXPxQANQomNEcHJhFU
         G+m3LqhCPmQ7a8KkOPdeXyCv0C1/pCv/smYYR84d215iwOqNX6wAZp5rO3vsKqtYkWrr
         Gsfw==
X-Gm-Message-State: AOJu0Ywr6HGJ29O7y8qefV9KJ1NSmkKlqhkdCfYI2DwRxM53U93PqtNe
	xz6jvvyADZW9qJXralGowe7Uump3QODDW/E40z6ABrC7wB8AxCxHJt7D
X-Gm-Gg: ASbGnctR3r0b5txOyVbQEw6ep2oGD3Ky22ejCokjR6z2IRb9xhoG7z8eglaqCrU/One
	zritUGRcukzhsIFTbCZuHZ1dkFpa54O0x0bskkaEykmHWt5kyfKpgwJ/Wj1x9dR0Qx9EHcUQ44f
	HhZieG31Q9j59aOw6SYlFXlqDNiGoO3+u3Bjndcj6sh+UdLN4ETAjmmtLGTwRiFVRlXaCyI/4CA
	pqSQenihTncMwwoJFDas+JPsdUVvu6cI/TIz0ODDunmJKJXtPTEM4b6QTBntn44H4CGCIKMWM6c
	Pr7bFzxATIRqQxFnru1nCQcIfMi1eiee0DdcSifCNOYZgioKFZz/ipEqe/4VJtKY5xTP2kgP/MY
	9/iMLZxUH0J71DqVBXwmInQCQTTIXvgBR4sFfqkfjXTgrWCuECwts7XG84Ry1Ms1PTmWV/QhLpq
	nI1dq1HMt2Iyc=
X-Google-Smtp-Source: AGHT+IHzJozMWX1UmUSatrcOmSTMgSl/UvNpJf40IXqO/pzHqyYyudqjzbklOROJsd9tAclA1s1m0A==
X-Received: by 2002:a17:902:f792:b0:264:4e4a:904a with SMTP id d9443c01a7336-26813cfeb3fmr47054915ad.53.1758152602908;
        Wed, 17 Sep 2025 16:43:22 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980310e41sm6653385ad.108.2025.09.17.16.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 16:43:22 -0700 (PDT)
Message-ID: <ed4eeee3-4e95-4bf4-b19f-cf7d38d8a1ea@gmail.com>
Date: Thu, 18 Sep 2025 08:43:19 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/21] tools/docs: sphinx-build-wrapper: add a wrapper
 for sphinx-build
To: Jonathan Corbet <corbet@lwn.net>, mchehab+huawei@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <4d4dc78a4e29f2478fd1c1a746378dc61a090ca3.1758018030.git.mchehab+huawei@kernel.org>
 <1d454604-288d-4185-8567-836e06b3cbea@gmail.com>
 <875xdhazcq.fsf@trenco.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <875xdhazcq.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jon,

Jonathan Corbet wrote:
> Akira Yokosawa <akiyks@gmail.com> writes:
> 
>> Wait!  In the cover-letter, you said:
>>
>>     It should be noticed that it is out of the scope of this series
>>     to change the implementation. Surely the process can be improved,
>>     but first let's consolidate and document everything on a single
>>     place.
>>
>> Removing current restriction on SPHINXDIRS does look inconsistent with
>> your own words to me.
>>
>> So, I guess I have to NAK 06/21 as well.
> 
> Is there an actual problem with this change that we need to know about?
> I am not quite understanding the objection here.

As Mauro has pointed out, and as I could not apply v6 series, I failed
to look at the whole patch.

My knee jerk reaction came from the fact that, for example,

    make SPHINXDIRS=translations/zh_CN pdfdocs

won't build.  This is because I didn't know such a sub-directory is
allowed (despite what "make dochelp" says) in SPHINXDIRS.

At the time I made "improvements in CJK font configs", I embedded
hacky ".. raw:: latex     \kerneldocCJKoff" and others in:

     Documentations/index.rst
                   /*/index.rst

, assuming all of those latex macros would appear in translations.tex
in the right order.

I admit it was not ideal, but I could not, and still can not, come up
with a more robust approach.

Hopefully, this explains enough for you.

Regards,
Akira

