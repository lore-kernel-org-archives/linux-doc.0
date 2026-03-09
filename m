Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA65B38E5ED
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 16:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773073974; cv=none; b=QdMs9vz9CK9lD6naPYNXA9XxYbL/ex29YZZBsRgz2//vKZSTAd05OaQIV9LfbmR6tJfup60imsg8HeUIotgAkraXsws21SlcvPnJyajFbNKfYsY6H4pANFxDZ4FHIIyZNKsL4/QvFwfBFfEUQFzqWkzqXqBdMX83C0LWwpkCBeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773073974; c=relaxed/simple;
	bh=rJPiuKTGg8r5wm3C1oCiLB+xUeCFsrM0/xa01u2CYkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2BTymngTbVeAT0/VWSViKJR6DVrov59HBF8/huu9TcJodkINOFExuEhJCSJvtuLDAGbZ7rfgx9b1YIUH/bFKX1VvkODT8tLv6Fmkq453mfFm6yQrl2tM4PDktzZevSuYvjgvCKCsL/9+K5bQ0qFjdUM60jNAgk7bgkGk5eIpDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkj/ZeFC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkj/ZeFC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2aae4816912so78309895ad.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 09:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773073973; x=1773678773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEUjR6uOStFxoT8n1is1K4BrRkwLp3/TRT3caJSkOno=;
        b=lkj/ZeFCE0jFX0el9TuCDzDm5QTinGDG6Zt+m1BEJBPJKNboRzSqQZJdFkXPenkk7k
         FFDeDms+YjOk3yocPtTBJW9JU82Su+bPTxVCydBd69zdTOnVAXmuVuP2qLftvYRXi1ZS
         bZVzpxWT8GolRITV9pAn5hmCaBHlq0sq0UCmMrrcPoV3Q5rNZ0f54TBaT3Q2RI5yVi5n
         f0IGbAIyvJcmvqCoWz792KoxJVJN79TC6Bo8BN8rUKtHBDwsbf3pOZ+Yij4sQu/ZfSxl
         SpkjiKk+tGrBK5H7uwbezen4ABxPdr+ReBhONMFwhnz+ESmT5I2bGx/ulpwO3zaHWmqu
         kAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073973; x=1773678773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gEUjR6uOStFxoT8n1is1K4BrRkwLp3/TRT3caJSkOno=;
        b=XAXqlnAOMYco3VStqG/YXM7SKYkZbEw7xXP1oZlbupjK3LGq46tNhPwgJ/Iv78uZtk
         1CYsDGu9HUMAgD+XJrnEwctY99kHq/VBqTXxlNMZ+qlC3kRaFvVlBhB+sSkY7GBQL8so
         YtwGn5d9uoUKuJqRrqmSGJjLev6BRiQpsxnwh6kpnvdIMoy6618USAixZXnJASj6QIuU
         TjDC+u4awgZtlArlq7fczHieaBcd1lf7bOqGaSCcZGNFVmgjEGIFK2+MWMaONhHNtPY1
         O19drxRE2/cMJQ1T0XskKNx8HwYuYrB2Xmo4AYxFhiP+d4EYhyeayeudyUd5YY15Udeg
         YwPg==
X-Gm-Message-State: AOJu0YyxPQl6dDd9P2FKePGaKJ1RLL2XRplyP2v4l4U3wYlfYtrVIh8n
	DTcZWzBTXPR8PwD52svjgKQHEtiV6G8QHEL5ts4AwnHmds67gfJeivql
X-Gm-Gg: ATEYQzx0vKeZKIFUi019pi1pzvx3M9YEbVaGFuTwDZs3Qtyl9AWOdcNoUOogZRhvFQ2
	sd8sBu4HqcZGS4pgA9+SR1nl4vDh3+XKreZ0Sfrb2T4yfV7xNx8KdqguAjw4g9nfa3h/etAtIdr
	KWBYXG0QR+CDLRm7DHXrethmVvShtf3vMi+nxCLIIhUZ2/RLgXgvtNrr0o8fLPrad2kQwRkTVFt
	gnbPi/sRv4VJcWIKsQsHaGxXQbqhlHkJVsCZ7kBn5eFlQARWc/bVaJpzfyImUU+oxcawRSKxZJT
	TPXi+V5t2APdKFZAxCAxvTcYKIhIJYLTdc5nKeREiLpzoGYY7U50ptJwTLizd0BBjIu9kIbTy/t
	Tgv3jmqw+2ZI43pwEuAXJ6O6gXJXfpZRdUR2D4ZWqlJtN8Nafjnfil4FQj9nzDuBxol/IyAJJlT
	yke2YmiNJsOvpt1Sd95X7yLVOPO7E89QdPvMXa9ed7Of+MgQzwIsxfy4pycQ==
X-Received: by 2002:a17:902:f68f:b0:2ae:5671:7067 with SMTP id d9443c01a7336-2ae823a836bmr108455925ad.23.1773073972856;
        Mon, 09 Mar 2026 09:32:52 -0700 (PDT)
Received: from [10.79.58.83] (wf121-083.ust.hk. [175.159.121.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9b9c6sm137164595ad.29.2026.03.09.09.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 09:32:51 -0700 (PDT)
Message-ID: <13926087-127d-423e-a4d6-55b8aabb32ce@gmail.com>
Date: Tue, 10 Mar 2026 00:32:48 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/docs/checktransupdate.py: add support for scanning
 directory
To: Jonathan Corbet <corbet@lwn.net>, Dongliang Mu <dzm91@hust.edu.cn>,
 Yanteng Si <si.yanteng@linux.dev>, Alex Shi <alexs@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260308111314.27333-1-tttturtleruss@gmail.com>
 <87zf4hvvep.fsf@trenco.lwn.net>
From: Haoyang Liu <tttturtleruss@gmail.com>
In-Reply-To: <87zf4hvvep.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/10/2026 12:07 AM, Jonathan Corbet wrote:
> Haoyang LIU <tttturtleruss@gmail.com> writes:
>
>> Origin script can only accept a file as parameter, this commit enables
>> it to scan a directory.
>>
>> Usage example:
>> ./scripts/checktransupdate.py Documentation/translations/zh_CN/dev-tools
> I've applied this, with one tweak:
>
>> +    else:
>> +        # check if the files are directories or files
>> +        new_files = []
>> +        for file in files:
>> +            if os.path.isfile(file):
>> +                new_files.append(file)
>> +            elif os.path.isdir(file):
>> +                # for directories, list all files in the directory and its subfolders
>> +                new_files.extend(list_files_with_excluding_folders(
>> +                    file, [], "rst"))
> There's no reason to break that line there, so I took the liberty of
> joining it back together.

Dear Jon,

Thanks for pointing it out, I didn't notice when I make this change, and 
I'm sorry for that.

Sincerely,
Haoyang

>
>
> Thanks,
>
> jon
