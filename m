Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206AF380FF1
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 16:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781886503; cv=none; b=Afjyvc3WLJFPA9c9xp+uxTOcBzrsVxbHtZegTl1DTB1Il0pJt5wcaLDAFpK9WxoVL0UjGLZBZQAoLttIQ1sn+JarzUCBxKdv06U5GLayxFhWwJoMIb261SImlfTN8v1PhiAvosbsd+aHtjY21NZtcbnNTQeSlXQf5NFiK5LMMXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781886503; c=relaxed/simple;
	bh=GPVLW6dahVBj2W5GEYGwLHhkC3Sgqj8B4Bu7XaUs0D8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USjYOFOGX1f1nj6/1zqLWPAEQmTL4NfZE/izQvTY0vfW9ufrs1uCXFktAv/af+D2/4V+LyHze5Re3T2ZYPjeBTWfMFPqrVaD92g7LnFmvywPT54h5AOxoDnvby6Z93bkZPkl+NmeC5By8tiMyuxwCFj/XzklBR1ifRyfslbW6UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvdrqDyF; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvdrqDyF"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so1534966a91.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 09:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781886501; x=1782491301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bVDIeJ6MuKfwP2LNcBoxiszDtASW4mF8xuBFi2RWnQ0=;
        b=hvdrqDyF3jzK1+9aE6XmXhVL7KDtDiWRcbQeTRzsrWedfsEEcsXlTx379j0R2iAkRV
         8J0lhC0I+7MYmDeKc4ssHuvVs3C1uP1K7CgIUsm2rAZRJee4/g2jg02rOC1GIFLsXakM
         yhfjgH8hoNEscw0i2zBSeaGYLwLp+jB5Qmm+cL9+4YTYCHmGtQwK9uuQZZAjJY5icMtZ
         EynGM18anIeG3vztbjUngCip/xHKHCo20aNA9NIED+QEbBu+kf4nrgKHlxZbpC27jOgi
         qpv1xxOLRoJuh7tHQHppMuxTpWrsZ2aWucxXNvrAiduIhOe1b5rzRIzUk7iq4TXROf9s
         jz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781886501; x=1782491301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bVDIeJ6MuKfwP2LNcBoxiszDtASW4mF8xuBFi2RWnQ0=;
        b=Anla+UkuHIwwhtjjouSjDepc12rbC2QeHNgYH/n6KfTfRHFpUAWtlIsPagd9BEUroj
         VNnLVmWF1OOjilEMd7rNQlZku0S/qJCaxXFUuunSOXiB7KgBSdNA1HlNszmNYXQfzIVx
         vDLlIahXo/5PzIf2BzSWhzN33l2mf+K33pqunOrhpbQwkaJd7msL6ZLoAWeqzNzCk8dH
         iYC6EuQllw/RphbCcG590NX8m2eXVmK0F/HVoODYF9qlREL/NIKJRtm5jxz26u3zGXM0
         u1ZgRoGey9MAPA7bmjVu2m6dOmrgV6E92kokhrj94p/OqzDSWHqGyhEuqT/mX1Z5Zc29
         d+9A==
X-Forwarded-Encrypted: i=1; AFNElJ/ZNdBXhwr+pYxnnHf9SFFQZ24zqSUjtejyXAddeXVwDgMVNoot3JWNIF7TOq0Nzgx0Cp9+RaSaFtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTjw3U4BbYVOEXDPWh8UV+yqQibqbjMfjt9fh5Xz/X5rAOcp40
	KvT8ug8g2cpdx9cF33J1UM8MHlEO1MDwNrfMwgqlHqm3daAU7CsTzEPr
X-Gm-Gg: AfdE7cnRQo61OAPpxPrqTu6Kgc3jAgZIXSAY5fsfuvlyC/LrRFRJ9M6LLHx7Kmm9F4q
	DfSHBDiVo9P0vdOEhFyvKSB5v18n2qtDZEmoq+VfhVnPqLJ7WariC2rNw5v8z2dAQGUoiIFGLMI
	FNpQbQ47lRUySFVX8yTbzJG8IaEgWw785vD9UZfsSQWKad7l4Xhi27lWOYMoyP/w2sllb/Jk7Ek
	wilw6MjCirndLsp55lSUiXueyMxwwGXg+uZwkmL5KfDDTynsUqUTcFano58CIQCcE3+Nl3aa2Ek
	tShUFmjBh7kuthmMAD75JepHgXsNDVPxDcHAsfstf0xWQSZ86UCpKCMXQ/7ZOiXEtLnL2MC1kUA
	QM2hVdYmNAWw5lpyHs+cP9ak9nDU4N93nb7pQ5mDqDH1fofpY6QHK/HHk16thTc0FzqgZux577Z
	yE09Egvc2NYK8IjKznN8E4
X-Received: by 2002:a17:90b:4b81:b0:369:1dbb:4732 with SMTP id 98e67ed59e1d1-37d18637020mr3626797a91.0.1781886501434;
        Fri, 19 Jun 2026 09:28:21 -0700 (PDT)
Received: from [127.0.0.1] ([103.142.140.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f315842sm47345a91.17.2026.06.19.09.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 09:28:21 -0700 (PDT)
Message-ID: <2cff714a-1662-4c17-a855-e9ff64d0bba3@gmail.com>
Date: Sat, 20 Jun 2026 00:28:16 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] docs/zh_CN: update translation of
 doc-guide/sphinx.rst
To: Jonathan Corbet <corbet@lwn.net>, alexs@kernel.org, si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260619140245.1982921-1-qiujiandong1998@gmail.com>
 <87ldcatxm5.fsf@trenco.lwn.net>
Content-Language: en-US
From: Jiandong Qiu <qiujiandong1998@gmail.com>
In-Reply-To: <87ldcatxm5.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/19/26 10:26 PM, Jonathan Corbet wrote:
> I've added a couple of comments, though I need to defer to others to
> judge the translation work itself.  I do have one question, though: did
> you do the translation yourself, or did you use some sort of tool?  In
> the latter case, you need to document that usage with Assisted-by tags.

Yes, I used Codex to help with the translation. Sorry for not
documenting that in the original submission. I will add the appropriate
Assisted-by tag in the next version.

Thanks,
Jiandong
