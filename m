Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056582F3B
	for <linux-doc@vger.kernel.org>; Sun, 23 Feb 2025 09:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740301682; cv=none; b=rMgapUzo1Koki+Nb09+H70hjXScvQt9LFWGywbIm7TGgJ+lkjG2kgXWTv295AaTbFUTRunEWSm/J+x+ZUwmTC48xDD0Q5fmAExp+gwguPUimqVf4oW9cl8REufu+Rj7sFKV7wgmrYleHrU/LQgBwrKmaY/ZPo1qWFBj0GOzI7UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740301682; c=relaxed/simple;
	bh=VqlJmcbfEDDmn+uC7FWWHm5L+HA2EJxVEoUQ4ytkw5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c4dadojYeL5aA4GQ695Jsk82IRZGFr4PYqFJMM0q+NAQeRlJ28uUGdBu3/4IL6Oj+jh76N5u7HI2Z/rX1Syc03SitwhDPdWTLrXxUdRNyBdqHXk7PrGxQRUoBGYZioQ5JoAro38MNLZmfGHK6U0+CYlV5D5MhDru53wdk4l6rZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YygqMWZs; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YygqMWZs"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fc0026eb79so7178811a91.0
        for <linux-doc@vger.kernel.org>; Sun, 23 Feb 2025 01:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740301680; x=1740906480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6W8L9CRiINNthqFQgrLMYgv6sq4JyTMIrgxBSAZWdHU=;
        b=YygqMWZsu7vBQXJZWHKK7xZhUMB6crIr/a7NTh0YBRJ9GC0Cai8h1NghcWF+kX0vDf
         +zZ+GlIsrHCDeMiPk1R/w8vBJjSZsVo9wZofy3ZLRarJw7kVpOy81GagC5iWc3x5yyYi
         L+j5mG13KoZrTpFHMN/vSHmdFq8slBxanJxLEoYUUahw4PLk8kKVoD0Pgeu9cF58gLy8
         MeENHOqn4pjN1ndbvZEpvOgaTr7TgoImZ9YAeSWgOee6mjNzHqNcX373Ry18F2h5QDIT
         uiqLLL7a7UPpa7a2ZBp9ESr1EFnKot+m5SYBP75q2d0RVm9XD43jCNkzoN5Gvt2ypa6Z
         hplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740301680; x=1740906480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6W8L9CRiINNthqFQgrLMYgv6sq4JyTMIrgxBSAZWdHU=;
        b=i0h1r59rEcLU9YDFUu6v1Hu2EYXncrXHiM55ZWd4hSH3mEl9ptdQCGM8JuCXp+VPxX
         3YtDI1KbRyv2MWV34vhXd6/fQxK26dzM/Xf311HZozTXSaQkRXvRNhk2CNtnjp8W1fMM
         VxAsJ2U+0UkirS0EzLz+uWpqvGJ92mGD/2JNADV8b0W1LSJGJaXjR1NLLIBFpvlttDQh
         ssypSoLUoU6K4pu5u+qE0OKT2m6hNjS5CJ0I7wJlEYmqAqeLtaEtTEimIpEdNv0YmOOo
         G3kiqKjfx0lfZ1MObpKRPlza1FAbWW7g0bmDx+d5taiEiJ7FCoMz+9eTyxD40I7nRpms
         AWnw==
X-Gm-Message-State: AOJu0YzPU0xcSq4gMSaNHTZET/SUsdWoHeY7Om6oyf2QRpzZ5nkaXmFH
	zF4IfrQWmARVotHMotOPFxA2V6JZfuFV28V8EnmoCzMh8RKe4JEA9md6Gg==
X-Gm-Gg: ASbGncun6MMsaT+SyB30QxDWH6ZiRHPol7Ow9QXS8/HYjavZOIuNususm+bkVvzLI0W
	26ItzjJjiMerGlwywzNzJHgNfiLHHIOnk2w6QlqsE9UnOTrBAJ/RLXQlBtjP+u/Ni+Ake1VLgMy
	sQlquL6YKRJP+F3SqGIAyZkyA0dEmFzJFQc7kEf8WlbhcOWCTsHX4327LycU6nVuvKeeZOoXyCN
	w5qHTP+w1o19IsyxbYGRvnu3hPtWIOD2Lca+jlu2CSBQARFlHM1RBWnieSBYOjHVnI3AS1eQbLm
	Sb1fNuS6bX1Qya2fmSwzf/fxKnYlAx6thUiA97SSOcEyBOS6VX4KZ88TxoN2LKkfyXG/QpmE
X-Google-Smtp-Source: AGHT+IF2M+Ag99oIu3aQ7tanh5w4ssLdEXAopT4xTf9dso1YQG/zg6u4lJ4W3mTsul0QnGrhZZLmWw==
X-Received: by 2002:a17:90a:da87:b0:2fa:1e3e:9be0 with SMTP id 98e67ed59e1d1-2fce78c9247mr14487806a91.19.1740301680075;
        Sun, 23 Feb 2025 01:08:00 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb12dc27sm4366754a91.45.2025.02.23.01.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 01:07:59 -0800 (PST)
Message-ID: <b464e845-a83e-421b-aeeb-6a9ee36afbbf@gmail.com>
Date: Sun, 23 Feb 2025 17:56:26 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/ja_JP/submit-checklist: Catch up update related to
 automarkup changes
To: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, Tsugikazu Shibata <shibata@linuxfoundation.org>
References: <20250223054625.37240-1-akiyks@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250223054625.37240-1-akiyks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[+To: Mauro]

On Sun, 23 Feb 2025 14:46:25 +0900, Akira Yokosawa wrote:
> Reflect the change made in commit fb12098d8ee4 ("docs: submit-checklist:
> Allow creating cross-references for ABI README").
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  Documentation/translations/ja_JP/process/submit-checklist.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/ja_JP/process/submit-checklist.rst b/Documentation/translations/ja_JP/process/submit-checklist.rst
> index 20a952cf82f9..c5b919ea985b 100644
> --- a/Documentation/translations/ja_JP/process/submit-checklist.rst
> +++ b/Documentation/translations/ja_JP/process/submit-checklist.rst
> @@ -76,7 +76,7 @@ Kconfig 変更のレビュー
>     されている。
>  
>  5) 新規ユーザースペース・インターフェースが、すべて ``Documentaion/ABI/``
> -   以下に記載されている。詳しくは、 ``Documentation/ABI/README`` を参照。
> +   以下に記載されている。詳しくは、 Documentation/ABI/README を参照。

Mauro, this change does not result in cross reference to the README page.
Not only here, but the change in Documentation/process/submit-checklist.rst
does not work either.

What was your intention of commit fb12098d8ee4 ("docs: submit-checklist:
Allow creating cross-references for ABI README")?

Can you please clarify?

        Thanks, Akira

>     ユーザースペース・インターフェースを変更するパッチは、
>     linux-api@vger.kernel.org にも CC すべし。
>  
> 
> base-commit: 76a6782284dff53a08b688fdead3e46f22236e71

