Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CD02D839C
	for <linux-doc@vger.kernel.org>; Sat,  2 May 2026 05:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777699528; cv=none; b=STcHlVUDsWohhhmhmCfDQM2B1DQoqxuvySNTrOAZn9wHjyNHKj+JcAysdW72n6WNRgUfGMB1uyU/YQjrlzk1cdCu0kLA/eagw4F+Nf6AygR7fLyIr3R+NL/fbxCiVmuRJbcaaZ0zS5dsNCMd0aTMBqXHod29VvpiWvcLy9Ib8fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777699528; c=relaxed/simple;
	bh=vdb71i5nh150CpCSMBrmlSaoZfuckT9Er0cO/Q711Ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=irWqDDCR1Vuqxcz12oqJWi7qgtZuLPClL/7yzo3H21W5JqnV7Owoa/XYo3XXA3B4xt9WaT685NqCk/AMRhQuAlbPkqNKTI+ZQZMQuvfrt83DhdSdBZNn/fdfrF0d+wyuAt1Nl+ci3hDUn+mtyaYI9aPRB/0i/Dc/y87DNgb9txc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMO3iGix; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMO3iGix"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35691a231a7so1686443a91.3
        for <linux-doc@vger.kernel.org>; Fri, 01 May 2026 22:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699527; x=1778304327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KB/P/IEyy7cjQ290dWdyvnAgkIG7ck3vX38fGSliG9g=;
        b=OMO3iGixZTRWthbbwyhLJqiUmp1tL4vM332ysrpHIESqcZfDq6dHK/8SrXYTmk+5Xx
         3I3rd9LelqG4qDIdSf9dgxssH/D32VmkYKBqaaB4mANtpbiqvuAzDHtH09rdrLRk/VVa
         KklJAz4v64D+B+5/+bfdtrXEZhO86qDeNNnbiXWrN507ZdYzCQVXVxvpsQQ29+oLlOFA
         24+K0j4S8qldJDsnhbWslwshUrhHlyy2P3IbYkgLxpDrfQsaVGM3Vj+C/6orwB+/VygB
         3yiE+J01JnEOxZyfjMU9hH0HZEyxp2KoX0iM/4B4wNcBHF7s/481bfZMcw/CDQi7b1U7
         /OjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699527; x=1778304327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KB/P/IEyy7cjQ290dWdyvnAgkIG7ck3vX38fGSliG9g=;
        b=GTP37V9N+6DS8G5BEDJVpp3d6UxZZuFSgFraUHzVYBg8hb/pu3p50GQjZ/Wrt/xa1Y
         FNiop42OvsJqp09YuLEO3uwUOiNMww1A1NZhaZTdMOz4zHY9N76m555qIWD3kFX6GVt0
         bXHrjNKjWzxTLxF7ZOZuOYrIwCVlVuJUUJevQz13runY1W4izMOYE88yn3tvDv/tMX43
         ZIdtx64exxnWbJnTF7A8jmRhkcZfnkHJH7aRnD6zKHfKdEoiFqWFYL0C0t6PMX/bEacV
         K9H4jGhXqjziw0um7rOYsHHYbTEr0K46G+C0IRPSUgoeWpBQRlFBTaHMnequRFh1Jui3
         G1tw==
X-Forwarded-Encrypted: i=1; AFNElJ+SAU4O2bMDl28P1UeRD2jmsA6zo70wO5poALA5N2QmUYmWspow9cPQmBcCd3AxMLyrnxOxt91KKMI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe0rFyLhDHptwIyYRfHV1uQ/DnLz4khDvqwI/+DrAClCHAgIQt
	K05770CDc4iWSLvWfLtJGYQKRsNfUOhvwIljfljEXCpCQ+jkaJ1G7XbwLE5e4g==
X-Gm-Gg: AeBDietB0VrVjPBulBJ/NGLTw3CsLP5VqANelIF7ACzwXTclN8/l2xWvQjA0u9lkOci
	C2/ha1i3+8nBQdhnECe17yYr+iudNs0Qu0YSDHzfbzL/l5GAPyC1msYNms3Lkr9CO10XPAx87xF
	oVXx6Yg1bOpjlpqz5i9KMeyi31bzo1AlEwtX+f+ytX8DrRoEOZ9VKbrSAGLJvcf6YABSyDubsVQ
	slZ5+S3lo+W7uwBSf0E5oDIz4XYAJXNd1tZbA9q0Kaav0C3zpwx0Q2uMXxXQA6HboNnUPgnfXlF
	LplQex/iUgrlM4efOVLUHZnFCeUri8yzUlXt43voTu2OeEciaVJaOgpJ86iakLBh5AS4j5wr6c+
	lALOHEOxBvhZp5sb9VdxttgGGKXccou4QJQN31upi+CtoiX2R4qiG7NgLUaF4SPzPbIgYH/hxyo
	zZbQRJ9btoNXAz4cOAXGIp60cOqwXCC8p3pr5XZyPlbIpwL1HX/+Ax8+PEpGTwRs6kkszs1wioE
	AT+ldo=
X-Received: by 2002:a17:90b:5543:b0:35f:b953:244c with SMTP id 98e67ed59e1d1-3650cb696c5mr1991672a91.0.1777699526536;
        Fri, 01 May 2026 22:25:26 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be00b175sm7032129a91.9.2026.05.01.22.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 22:25:26 -0700 (PDT)
Message-ID: <6af83511-4e0a-4f09-a16b-6812d25f9b4d@gmail.com>
Date: Sat, 2 May 2026 14:25:25 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/ja_JP: translate more of submitting-patches.rst
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20260501191114.939418-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260501191114.939418-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2 May 2026 04:11:14 +0900, Akiyoshi Kurita wrote:
> Translate the "Separate your changes", "Style-check your changes",
> and "Select the recipients for your patch" sections in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
> 
> Keep the wording close to the English text and wrap lines to match
> the style used in the surrounding Japanese translation.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> v3:
> - Use a file-local cross-reference to the translated "変更を分割する" section
> - Keep the TODO for the untranslated "The canonical patch format" section
> - Drop the obsolete TODO for "Separate your changes"
> - Rewrap the latter part more consistently
> 
>  .../ja_JP/process/submitting-patches.rst      | 123 +++++++++++++++++-
>  1 file changed, 118 insertions(+), 5 deletions(-)

This does not apply on docs-next.

> 
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index 91bd79a0e9dc..8f85d2cfde71 100644

At docs-next, .../ja_JP/process/submitting-patches.rst has index 9d63220abd15.

Your patch should start with:

index 9d63220abd15..xxxxxxxxxxxx 100644

Please rebase and resend.

Thanks, Akira

[...]

