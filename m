Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFD356B7C
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 03:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707188680; cv=none; b=T8rEc5xa4qPgJ3TzOB7LQyQG2g/ur9PEdCpWg7Xh+3+UHzSqlKvdljrJPx7bOSmAc7XoDkFhhPPTvWHJF29j3V8HGfs3OcjIXbK+5d0gU8UOwqU4NuixjUfxhYCDNxahKvg8KM4IfuS5SDmbRnHmfmQqHCrK9PTEy/rB/H02tNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707188680; c=relaxed/simple;
	bh=74ufEIXExOmiUxVq7HtBBKKNlVSOfwO6muV/N/cFBBg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=U//RTsJVte91XrNJdrRlp7jD1NsEZBvADrtZBu3ElNdalXQV26l9dNdScV1ENkSKuiWs+b4fh8mrhg6JhewSn23m1u0GU88SiYdwxj2srza1ISdc1WgeE53gFn1/F2AdtrH4hYqbSUhf0yMwRdCzDGQSia31ANZ83aFY1SU/5LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyKfIr4a; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyKfIr4a"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so3735276b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Feb 2024 19:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707188678; x=1707793478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fT18hycL2DMuAaefjtXDuz480XYlrD40t1A8vhR5sis=;
        b=KyKfIr4abvppk3VzRIqTBgXzzsJQPjrtwV7I1y5bKyGmX77/BjoLP/TNyuMpJgwydZ
         6J0AZo7oCWuEEbb+ilpryAlqgbYPQCYFjH7awbu0vFv/mXcy2yQmhMGkBqeRRoDGedQI
         /+fvoDtnNTMdRMkq16VGtcJwjEWqtgNAx4/XHhs4gw8smSVGnhfG+qo9RPvYtc58lifH
         UVKJEvAR/1+tVWZRz4XoAcACPFTTE+zlvZD/HVTsDy/n+YhQMhQtcfmhJwr+j6v9h7ga
         8gqpmPDrUPvCR3Wy7jZpXKYkUFhlfWlfjajAUdSRr65G1sSflCOSbT62eej2gag+okRn
         7e8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707188678; x=1707793478;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fT18hycL2DMuAaefjtXDuz480XYlrD40t1A8vhR5sis=;
        b=tZY7Wv6wvQ2h5iW+Bxane+PEgU2urisY522loHwHE7zn5isrZeZzW8nAu/1uGnYKgT
         qQoloI/JG4w2djsf9kP3e621VsobjDkpNMjIq/Ij7uhTIF6O/nXs4Kbu/q6HNVHqpbcj
         SYzeezxv72Mp19oSZrZJfVWmqkQxFmjDzFYORPoLq6HtT37yr1clwLbhtpsHR0HBmJeY
         UeWicR2YKxeTn8l/4FozQ+M2qceKZ2/y1XYpiQ3DYI3ogbNWY8zWhVb8q6dTl9MWUp4q
         RqTEdwnc7L7ROdY7i/KFEu93YZqicdVHpQ2RhayQGz5wrKcjWTPbhTsoyVmJ6hB4FTW1
         4Ydw==
X-Gm-Message-State: AOJu0YxoEDenZLTvKhTtbIs/N2MoZwNwKCCW8jujC489JYGrxDG/elBk
	qxdlmVOPEmFBjP62TIbwfU/ZBbKwvar7woQ2wXt2AIjk1jF2CsBJ
X-Google-Smtp-Source: AGHT+IHCoQ37vzLoawH0f/mPZdYErhNSPEBJRJtZXdk3BuEAs/yROYTQvL2IlsEaBlSyV8S9azKELA==
X-Received: by 2002:a05:6a00:928b:b0:6e0:4d4c:f8f3 with SMTP id jw11-20020a056a00928b00b006e04d4cf8f3mr1920582pfb.22.1707188677959;
        Mon, 05 Feb 2024 19:04:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW6Cc8cYuj3RBPcFIwIIEVCT0gqPssCTvpnsxz4FnKFYetCBeVAsVNLBqdqn37r2fK8lwAqpEhhTiy45qEP1JhvmhZBDNK6BduLfJ83yVyfKIVhwQG65ggIc9jNMgzXIFiwMNMd3QmYTBxUT94Fc95yoWmQ1qUaqqOp/984w68lJW3eaHFJ6g==
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id t27-20020a62d15b000000b006e04efcfbc2sm671700pfl.74.2024.02.05.19.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 19:04:37 -0800 (PST)
Message-ID: <f3735f2e-dcc3-4d27-94a1-7390589132c2@gmail.com>
Date: Tue, 6 Feb 2024 12:04:36 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vegard.nossum@oracle.com
Cc: corbet@lwn.net, jani.nikula@intel.com, linux-doc@vger.kernel.org,
 mchehab@kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <20240205175133.774271-7-vegard.nossum@oracle.com>
Subject: Re: [PATCH 6/8] doc: kfigure.py: convert to sphinx.util.logging
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20240205175133.774271-7-vegard.nossum@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon,  5 Feb 2024 18:51:31 +0100, Vegard Nossum wrote:
> As of commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement
> to 2.4.4"), we can use Sphinx's built-in logging facilities.
> 
> Gotchas:
> - remove first argument 'app' from all calls
> - instead of (fmt % (args)), use (fmt, args)
> - instead of ("<fmt>: " + str) use ("<fmt: %s>", str)
> - realign wrapped lines
> 
> I changed the "Neither inkscape(1) nor convert(1) found." message from a
> .verbose() to a .warning(), since that actually affects the output in a
> big way.

No, please don't!

you are partially reverting commit d987d5ae51ec ("docs: kfigure.py:
Don't warn of missing PDF converter in 'make htmldocs'").

See its changelog for why it should be kept verbase.

        Thanks, Akira

> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/sphinx/kfigure.py | 66 ++++++++++++++++-----------------
>  1 file changed, 32 insertions(+), 34 deletions(-)
