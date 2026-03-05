Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E9D411610
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 19:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740795; cv=none; b=be9plVD4oRZKy6cDI6I+OsYEmZAKAajOOKgOG5JVNrnGzYQygDeluls4zAbZhLZQ/6WhiWVlw4TfRO3DRE7nOINpYH6TAgjYveaRvA3jmtuvib8h8GLieL79qWZKzHjFrFWLy3Nsdb7K6cu6jQL94tRj/8dSEA5kHS7hllXpQUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740795; c=relaxed/simple;
	bh=pibzqU6aoeWQpdp1zuQaediImQZYkvHSU60rb8p3Ue0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rRmLE/f6y7gppSV6qk5KRkfOZP7PPpM2bGNe83aixetLhLnmcKBRT0cbCjYKlCU2ke6xBZ9n8JY1Rfxd45+/F+QOrgbkS3jzQxZnlANuOjn/rcBKMlVBUHd+hFKCqTc60rOXnWomYahtCGJFj4MisT0JC4Hujpd8B2fcHTOt3Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MK8CQfFT; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MK8CQfFT"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35990245493so2995781a91.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 11:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772740785; x=1773345585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+FGFhYASWu15dVGsznpbd992cpWDX99r4xQ1fzHvHY=;
        b=MK8CQfFTaMRvauMzKa42++UAiyaoWzW2oZrLPtI6hCC0JZZ5riHrIBxN2bWmoQhP5E
         7XYzMdWQshtrvo3jNzYATVTvh/vbOrTl1LFZ0E9RqAJkClYZXeuGHGP+MS3YF8sAKRi0
         rYav5KArroUBO71+v5MoAJsDdiFl+ZQpsYbrrsj/YjeQ7Dv83D/O/JW4ML/ppx9+c9ZB
         YCFjMZO7I4STLrdzJqqNryWH0eGLHzIDcZ7xh0NTLGGCgI1C6a3EwFv245QbPKsujTxT
         FrVSc16YGFoh8kvPJ0rgdN+Z+KmOJbC1M/RKXMyVPrPEZXNvvKeC8ZD5dppYX+bTL1le
         ddJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772740785; x=1773345585;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+FGFhYASWu15dVGsznpbd992cpWDX99r4xQ1fzHvHY=;
        b=U8FJSokyQARDsaJFmHLQWgqX7RD4ChDgOrz2Na/tcN1tLsXV3Bf8oLdVqnfDs9sBht
         OLTb9cyG2pApT8X1F6tzFeNsp9OTCOP/K5A+yH9MgsQdKgDDd3UUZ2WetzwJlapRSNRY
         WaSCLdUlIUVK3AAmvJPcvhEAitHBWMyPsgd4EfwREpkPT75/50B3u6tLmSd9sFRWXCkw
         db7brDtD+kaQaiK5jZ69Cp4qGFx10je8lBvY5FHetIYPuqi9ywfCQ2HF9WiqsZaab1XY
         taZTDnST8xh6jRv+DYOib8BbG/e7mT4EpnBdEpYoiERZDzoC9xqrTfEzVUz3XzaCRyGy
         lP+g==
X-Forwarded-Encrypted: i=1; AJvYcCVVQPlB8ze4Qfe+s/ENofIxjXi6wNE8YUEEffpR1500EdEG8hOs7oGHPosKZkg2BKOKqAgnlPsqr+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlFRpaFMiIbYBwYRTfeTntoZiSnlS1aQCKcA36hY9QdsnAk1A9
	RTr/Is9h2BPyKm6YLlQ0C2bK8wSOknx9ALmbHw3gprsZYQm4hH2bw9+5
X-Gm-Gg: ATEYQzyU2BYEHxXEe78hx8PDjEIeo6mKxV6bmKK4aEW8rNQXu/m1W0z2zhcL4DCH6zU
	6EAX3VHs5xiFPg/nGG2SOAlqat6g41b39AIEg59jEnbqmhj1vrnp6GfyAlBRuck2xACx6zXu8mr
	Hem8AkW5yY5Pil316sHU6K28hJZj2eV/8jrL9Hp73Een5s1/Pydwl2bBsVqJ/0mGMvTtlsdSNMx
	LlgRXItE7i0vQwziIcyoaHM8tcmcgbAPjoX8o5REn/9NNcGo1EboTpKZ3vMPgfwTG8XsMzw8pEz
	FA73CatEC6/wOoeIaoeYL8RjjdSPApuoiyaQF7kqV33pMFxY8wj80h/amhlFAySQTQIYCUGtOVP
	T49KXsFrVjwOJetqALYSrgdBHNm3zfHpO7u711NhCV+9NGqHLEJ1JQSjoahklKYLtvL6r8abZDb
	hY7zL6CLtD7bzBri3P9PIXgZP+U6RfVNg3FBCtRj8cimTxnDEMGVnemRAfAg==
X-Received: by 2002:a17:90b:528b:b0:359:8e1c:53e with SMTP id 98e67ed59e1d1-359a6a87c77mr6124295a91.31.1772740784932;
        Thu, 05 Mar 2026 11:59:44 -0800 (PST)
Received: from [10.79.58.83] (wf121-083.ust.hk. [175.159.121.83])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d56adasm2850044a91.12.2026.03.05.11.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 11:59:44 -0800 (PST)
Message-ID: <29bd0dbc-c6f9-43ce-b95f-4e787e3fe9c3@gmail.com>
Date: Fri, 6 Mar 2026 03:59:42 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: fix an inconsistent statement in
 dev-tools/testing-overview
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260305192048.16405-1-tttturtleruss@gmail.com>
From: Haoyang Liu <tttturtleruss@gmail.com>
In-Reply-To: <20260305192048.16405-1-tttturtleruss@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/6/2026 3:20 AM, TurtleRuss wrote:
> From: LIU Haoyang <tttturtleruss@gmail.com>
>
> This patch fixes an inconsistent describtion in testing-overview.rst,
> which should be ``kmalloc`` instead of ``kmalloc_arry``.

Dear all,

I just find out that there are some errors in the commit message, I've 
sent the V2 patch to fix. Sorry for that.

Sincerely,
Haoyang

>
> Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
> ---
>   Documentation/translations/zh_CN/dev-tools/testing-overview.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> index 286ed6b01f65..5efa8c6db867 100644
> --- a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> @@ -154,7 +154,7 @@ Smatch和Coccinelle的强项
>   Coccinelle可能是最容易写检查的。它在预处理器之前工作，所以用Coccinelle
>   检查宏中的错误更容易。Coccinelle还能为你创建补丁，这是其他工具无法做到的。
>   
> -例如，用Coccinelle你可以从 ``kmalloc_array(x, size, GFP_KERNEL)``
> +例如，用Coccinelle你可以从 ``kmalloc(x * size, GFP_KERNEL)``
>   到 ``kmalloc_array(x, size, GFP_KERNEL)`` 进行大规模转换，这真的很
>   有用。如果你只是创建一个Smatch警告，并试图把转换的工作推给维护者，他们会很
>   恼火。你将不得不为每个警告争论是否真的可以溢出。

-- 
Sincerely,
Haoyang

