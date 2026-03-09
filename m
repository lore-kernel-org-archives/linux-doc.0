Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924AF2C326C
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 17:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075915; cv=none; b=cnN330rIGxplcyhJiIryOVjvNfE+9koAOeiDcT7SXTYWazIU49XNxAINZM5I6IjxMYQcHMuxmovSIEGjTPRZRp2WGBpVkGU/qqAw4GScznjSuwqDVNzY2Cy+NV8BH0o7HHxFgMzLFbxWGhjR+FcaGUMCr+yzqHdZ+hpY6gmCZ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075915; c=relaxed/simple;
	bh=VXvv3WCzsyfPONIhVrXFc/XZlCVdvgotiBS6dOrdCEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RM7S+xS962pYlrV/h7avc8d129bGn3bpRDnZ3iAYzwIHCHtJvo9pdPEEjOuTFZpm6hNwaiQTul5ODdLtg1iUR0NJclPHqmXjzIyoICOxRjzFEqvXl68ZvoJyGK1TItKYQmKzSQL2cWJMujsvsld4vQcsuVbVK+Az68VBm6l1m+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTuTjQJ+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTuTjQJ+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ae88e16485so16590685ad.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075912; x=1773680712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2aJcP1eqTkoObRnwc3YqPHSFgBzdgVjK1dLwC/F/iY=;
        b=GTuTjQJ+bDWOzol6WmG2rbJlIbk5Q3VLJtQNI3jTSqSP852CzqdiFtKydzrUcH8/y+
         oFccCJzRIvflgsreWdrb1zb/8JJylyPIGrpZdm3ZXADlgG4wNTdOFkutXnhck5+PVGuD
         y65CblohXjaeixEhKfgBtFpv1wPlWqtm71obYwSddHgldWc4Gr4SW3C5TfUl04RLSvKr
         AWfDj1WSoJT06vJqhtcW6ew2umhq5dNRuSbcIfDCYfyda935iRtdJ+lLlKdL9OPbzjd1
         PgZA4ERjyJRrabrYrtd1qZyIFrXGQdhK46g5DCfP7xPxtPoQ+lHBWGK9idx92s0AiE8K
         3Aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075912; x=1773680712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D2aJcP1eqTkoObRnwc3YqPHSFgBzdgVjK1dLwC/F/iY=;
        b=YAZdr/FTnb+kQ3ysp8sFbnl3opM5Q6fcfJAmDjmOQV9SLk3RVElfJujmPwSbOhFHt2
         /upFnQtMmm7V741jhiciIAyaibhYwIRZZs/HcgCSBMy1RpptI0ROicZkxqcctL8iuIxq
         O/PTz0uerAYZ02Wag5q0w2w7vo/3wPZJsqdlb6WjGfXtpK+JjJsiazyCHdMDp5qC6svs
         pLle4LgUcdGNt7gE2ocC2aM6DcorwkDL6QF2HhcdenomfHRFgUNqwzfR4o6mhiozmQwL
         J088G7pGu8q5iWvGr1gUOJA5yasGvrXPnMxekKIIy2qL10EmwMgPakuWRV0D7XO3pyKF
         1I1w==
X-Gm-Message-State: AOJu0YyUIAU/iSZnQvW4IfX7mrNAKkEUM7qVjoZ12zcRQzaCcApKf7MX
	yiAdHzuCsrj2mPT7Z52Xvco0ybS17lIAIw9TiQJ0l7o5cZR5OE598kIV
X-Gm-Gg: ATEYQzxyjPxdcTev1oq6xpQyeZx4Hsz3Cw01IivgE4UmWoPmpnqdq9Sjualkvdj41sK
	Bk1HWWLrIpBGBLKNO7gy+s78iaeAj5SnK8o7WDs1RahDotn9bEBg9ER0dr6TEgfhncXPOk+RMvH
	H+zfO+F3olJ6Qc8nmkDSDF6Pfz6qZ6JgIUbMNseWSFC9DXu5I8ehFUFp1PGsIecgVhigN4bhZUc
	ZeYTrf1q9NMDAeOA5Qbi/5DzMApqDFab3gt4syYojMjs9LN2kGElZqSAiEb+bMh9b/m6VDMaPkz
	DXpdAqpjgY12hKOYEOS1jKCuYe1kyf3OzEvZDPSNOuVvsuNa7iUllK4mBd9dnakazXSLpLciKZA
	SjrH95I52Bqo17gdN13lLMXsaVmT89folZgS9U1poWpNy1gAM7wpVB2iPOQ1k0+W9gj6LMtGcOO
	RrCAr4XeG+jpgNt/1mjaC+V7K3Yt4bYxSre5aGB7+vkzszPr/ompBADN7r1U9TO7vJUl6tjNiM8
	dpMPq0PqVB6uUUFN1A=
X-Received: by 2002:a17:902:f78f:b0:2ae:5d7a:b6a1 with SMTP id d9443c01a7336-2ae8248140dmr106622625ad.25.1773075911665;
        Mon, 09 Mar 2026 10:05:11 -0700 (PDT)
Received: from [198.18.0.1] (ec2-54-255-20-216.ap-southeast-1.compute.amazonaws.com. [54.255.20.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f7837bsm122545135ad.48.2026.03.09.10.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 10:05:10 -0700 (PDT)
Message-ID: <2bd7d364-6e23-4980-9852-b1561ac17709@gmail.com>
Date: Tue, 10 Mar 2026 01:05:08 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/docs/checktransupdate.py: use metadata to lookup
 origin path
To: Jonathan Corbet <corbet@lwn.net>, Dongliang Mu <dzm91@hust.edu.cn>,
 Yanteng Si <si.yanteng@linux.dev>, Alex Shi <alexs@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260309095832.41209-1-tttturtleruss@gmail.com>
 <87pl5dxfep.fsf@trenco.lwn.net>
From: Haoyang Liu <tttturtleruss@gmail.com>
In-Reply-To: <87pl5dxfep.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/9/2026 10:10 PM, Jonathan Corbet wrote:
> Haoyang LIU <tttturtleruss@gmail.com> writes:
>
>> The get_origin_path() function assumes that translation files have the
>> same relative path as their origin files, just with "translations/{locale}"
>> inserted after "Documentation/". However, this assumption is incorrect
>> for several translation files where the origin path differs. For example:
>> translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
>> -> process/debugging/gdb-kernel-debugging.rst
> Honestly, rather than trying to work around such things, I think it
> would be far better to fix the places where the translated structure
> differs from the original.  Those differences can only lead to
> confusion, and I've been trying to avoid creating any more of them.

Dear Jon,

That makes sense. I agree that keeping the translated directory
structure consistent with the original would avoid confusion and
reduce the need for special handling in the script.

I’ll take a look at the places where the structures differ and see
whether they can be aligned with the original layout instead.

Sincerely,
Haoyang

>
> Thanks,
>
> jon

-- 
Sincerely,
Haoyang

