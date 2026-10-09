Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7290C46AED3
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 10:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541907; cv=none; b=eWKiuk8Rb10i+qUeUsSDn7vr/kXH1ygd2AiYIO9sGY06fxYppw8cbvaSbhjq6TSkhVZnqonlCayzkL4P01tgw2LtEtdcssu/pWQUCQRpTuG7rtJah1us2bprEeKgfXXOpMUF9Rec622/SrhkzEYDrG2baD4Um59Ka83fjXzrqmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541907; c=relaxed/simple;
	bh=fCn6GGG09orHL9tSGfJaYcZKEKdOcNu7j1Fq1v7EutU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBQQfbY7fdhFbiaAze9C2V76mNkNKnLi/yWF1fDyYiX/8ksU7KpPgndZMwHwtpSLxvEAf55xG+3z9AnO3pZ+wewo/IS3Vpc6Vtfy49QzBkbfXsyYXRPmfP/jmqifsS1W4cs/pjwei+eiOMLjQTbKwomLE76Jwa1MtJQUg0I5kNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ga+2rltW; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ga+2rltW"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2532664a91.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2026 03:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791541905; x=1792146705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXpd0O7nNhh5SkXMzzZNxeerXfjgoe/yo+e/IHXCxgo=;
        b=ga+2rltW9EyIFIc4TL548Yb69dbstYOoInpjfJqZQ/4sZJEvHNyBa4ppe4W+VQphVv
         300SHrhzJ6+2hVmS2JqA5dOK9Wu8NQuBWI30tU//Nd1xdCAlldrS+FAw+fTQOECZl6VF
         IhfdOOH1QjS3xzSmKc7A0C0Q1uw7gTZB5aWvoHx6VBBfBLwYwXPU/dG0FT0S+OthR2QV
         QC752+J8s6If1FSLJyR+eJILaX/DkpP88/FRnJ+/rveto8KVeBdHUAz5gTj0RieEYpe7
         v0yCUiiMuIXCgwISP7bfOok1dUbs6rv594b+Fx2O6W0InAP5IQDwzu7blW4xhkjPQMVS
         hlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541905; x=1792146705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXpd0O7nNhh5SkXMzzZNxeerXfjgoe/yo+e/IHXCxgo=;
        b=etvEOmxccA9ykm2jm/wQa7Ls2Cuj0PgPw20a4g0TT4ThR529KQv94V85gYrmBM2CjB
         IVMtCuU3GS7SqzSBJYis8w+MYl68DiUuwwxZniAo9aQGgpchaf2UW99KKqYAHtqDjxff
         KEaNiDHbNawLMHJclBrPpWbK4dIBec1ceSISbhudVrTWarNN7UdzaRAOAItXfCrY74Cb
         mb+7Bb2UZICY6vA/j84sQPCDvRVdKtKbo0++pKlC4Ed14nEJQqJ/ajYPtcJ6rqZhS80Y
         lXr/RKdcR2iWcSDMtP3pDbFpfLjoDJ+kCydbVJx/bVHidAYJ5JVvLJzSgN48kSdjRtU3
         vVtA==
X-Forwarded-Encrypted: i=1; AKwUvBwFUcQOTBL8uTdRhwDsOOIvv7dOECSbGocPk0xjg8FDK38jhmgDUSgX1Htfpe5EYOaUJvX0gzUi/r0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKC/AhBlk7rByj4MGDxQi7CNWKNsS29WgYgw5RDDJ7Su5LHcgim
	sb15TnuhMY9iDGi+Ud7JZL0gIVAQviRqDUXeey2QPnmNs3IClS/ugOgd
X-Gm-Gg: AYBFou3G0wNXkGoMiE31l0zEtVb2B07vkcEEFWsRnXbk8Yg/KSZ3XAhybDi5Rjys1+m
	jPyjqBMJ6GKBQ1gVehLilDVMtaB4dNHjw4hbaN4ui8Q3+Uy1+RRdDgxqjVxigZwfC1Cvkz2lQ90
	BrzznJV8/a3pcK/csC2l1EPOFxZ5bGUtQOZ0Jx28SIr7+sVYSuJqNKgdGpgkcshRqQLjsSNFTmM
	iMfao4qY53QBYhO/KGVUBPpNIzdigcKDl6ywlVWEQIdK2eK3sGr1li+D2RfxMnC0Nf1NLBGuNPH
	cquqVXn6aUG44eOXuGmznxvNNPM9S3K1V+lVnMHZJmRLjIWlMTfXvaiD8v0Rbqs1lEchfyO/Esi
	ht3wIfzZSKx6bI/Idq35Lk14XMPBdRuwHBKuNhNwvCSZIy1Ns5nL0dl2ZShR7lUsu/b0MX5CI/5
	/wqGx/VrctBqr+SAdqEfXXpluiQ+67SKvQs0hYefHxYi7szSKdP7sFxS8cp8zJqoU/zHl19wrLX
	Fa9vp+5ZDgje5CT4nGKhuSVl9CkAQ1//aZ/qWYciB4H62JzBKgBOQ==
X-Received: by 2002:a17:90b:2886:b0:3ab:22fe:b142 with SMTP id 98e67ed59e1d1-3ab3a47f4f4mr1354600a91.1.1791541904771;
        Fri, 09 Oct 2026 03:31:44 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37163e21sm3372026a91.14.2026.10.09.03.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:31:44 -0700 (PDT)
Message-ID: <70d8df5e-5bb6-4cc8-ab8d-8ae36bbbcd30@gmail.com>
Date: Fri, 9 Oct 2026 19:31:40 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/ja_JP: translate submitting-patches.rst (review
 and report tags)
To: Akiyoshi Kurita <weibu@redadmin.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261007004715.107860-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20261007004715.107860-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On Wed,  7 Oct 2026 09:47:15 +0900, Akiyoshi Kurita wrote:
> Translate the section describing Reported-by, Tested-by, Reviewed-by,
> Suggested-by, and Fixes tags into Japanese.
> 
> This includes the Reviewer's Statement and the guidance on adding or
> removing review and testing tags in subsequent patch versions.
> 
> Keep the Reviewer's Statement in English and add a Japanese tentative
> translation in a formal style.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> Changes in v3:
> 
>  - Use the current Reviewer's Statement structure from the English
>    documentation.
>  - Make the Japanese tentative translation a literal block.
>  - Remove reST markup from the Japanese literal block.
>  - Translate "statement of oversight" as "監督声明".

Looks good to me!

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Thanks.

> 
>  .../ja_JP/process/submitting-patches.rst      | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
> 

[...]
