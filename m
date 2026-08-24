Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C64F2727F3
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787536797; cv=none; b=AuBhh8Wg1qEoZFbdiEnKaZdWI2PggmgdeZV6sAEQy5EaQG4nxUhfd8N1vaiXlFLs3DKm23ZzxEoD+xX4rmy67CBuwsgIztgT6lnk4CSu2LyRGyfUeghf5X7Z/Ht5YhESTCsAZ448Qk4vdlOa/zP8BjdROK88SiTJyOTcGe0fbYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787536797; c=relaxed/simple;
	bh=q1oTTu8hdlmyS/I3ZnhNxIEN1noJ1EIHX2BS8qONzGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amy1zcXrb23g/CE6YRMcckxgMj3mMY2ffejOqmb9M4H03TlM6mU1RAPdAxKNf+TjUIckytP+ohAZtse85wfRTHQziApW/V7rhnbYwTLKYOlZwEn7t+56A/3XrnsfnGm/yX8elxJKoznfb+pxzUPmxLIGb1robMmk7OfFMmne1bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Am0rQCaG; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Am0rQCaG"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39266382df6so2270819a91.3
        for <linux-doc@vger.kernel.org>; Sun, 23 Aug 2026 18:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787536796; x=1788141596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yDZxad6sDkeQbt2tQUdIl4hd1xuMLOzXIcOJiNdh6Z0=;
        b=Am0rQCaGbKa6tUj88ocEu9UgbZUSKEBwUo8C5pB8bfBUoyvkY8BBBo15DDmMWwsNjF
         GMuie5/IDC3TOEdcH4oTTpeJDTrbVP80wOeWYDuK4OgfykIwmao9JAR0xJJ8HlY8x2rp
         NtvqHyMG6g29haHfyMD8VWNFEzTzR4avfBuhvZiU/2HcLVkX6msLzZvuOIs7Vl9/d13a
         /aLABQZFdkMKEjjGCH/k65jTjMcZLGbaUGQMVGhkd2KfkreYvkjiB/JVJKtcOOXr6TEK
         R6npnQ9WCvN0Gywt07fXM9hxm30/g00svOdBJ+vSDbuAtNVPI0fM1wagtmpGzpMsBlTU
         kQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787536796; x=1788141596;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yDZxad6sDkeQbt2tQUdIl4hd1xuMLOzXIcOJiNdh6Z0=;
        b=PRdzxNxXnXa3lkkBc95rpe6rAgJIq/HO/ThNJZ8w6R8hk/PvzC73J9tJD2tu2e+Nsl
         e+HPRvfWwHcyv+/j1WAgfAfnI0kU63kSwYF9uCGlyfGxl+iIg/NZj99mur9FaJeSardx
         kLlFLB77yf+O3Koq8C3eclNXdP2dTmy/MoURxBzxx5nu6y4gDUuYCGPi7LvJ6YdS0/iE
         IM7IfIALGQXkLUalS+fhSK10mCUpN8zxwlsDWnySVXkZqEnGphGXUwa3mCMaynIcz8su
         xnrvQ/ZW93BaIXgX8nVdmoipISrk7bXiyAkdmYyAixWPEVeMkXcO0j7T93HU2Y/xnHLA
         Xz8A==
X-Gm-Message-State: AFuF++min0C5RNufT+M/lJcMOMGQvoZXPE99beHOQ1lYA6jlpVjtBXV7
	4REufbFpB7Mzya+pRVnX1HQ26UqOVzPbtHxZZVBLzLcWuyBby21CVomh
X-Gm-Gg: AR+sD13+b92jK2rPLbyRab6IcVQOa8fbJClCO/RidxV2TgBIbZUokF/Ox4hmwY3DrMX
	0i2bx+EDQj5YiNrLDQf6TOVhG77LZW8/6jZ578+lphzF2XNHqbk7o9FLlljVWxVNf0HorSD2TW8
	Bdn9GaonoyN+DaefyQAsr+OWHW+Vxlq8OxR2dSJ09Mjvq38Mq4NDsj6YbW8s/NtYO6DkZORcpbg
	n4NUpKOZQbrD0idhyWBjFicmUWrE7e9vAzzPdw+2qJNzKywDxQa7CZ0prZeuS6/Vky6GUaOzEv6
	IX1dUU8GTC1CrV/5/o7F/HAk9w0kZLyANg13kBtCI6OzG0SFezj8pSYcbdMBLu2w8RNkQZ7u7sg
	n9cy/HzoVru63XURShVU7c79U8iI8AzWrM62dJ0FXtRh62p9exZgbaPJVCnALEeB96nNWNvzmCY
	shGHg+JG2FlHubiOcXu+zIyZuDx+x0aqC/VbdXS1Tg/dsXix+Slrfo4Wp+LH3RqdvzxLHy3N8Mr
	XhmuvuqkSYYQybETCfr2eHMwZ0H1tk=
X-Received: by 2002:a17:90b:3945:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-395c37199b7mr42425767a91.15.1787536795712;
        Sun, 23 Aug 2026 18:59:55 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:5201:2a4a:3fb5:64ff:82de? ([240e:38b:e68:5201:2a4a:3fb5:64ff:82de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4b2af01sm7783990a91.14.2026.08.23.18.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 18:59:55 -0700 (PDT)
Message-ID: <6c674f81-35ca-4074-b22a-b9ed6122ce6c@gmail.com>
Date: Mon, 24 Aug 2026 09:59:47 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: update maintainer/configure-git.rst
 translation
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Wu XiangCheng <bobwxc@email.cn>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260823-configure-git-v1-1-3c65eefcc585@wyuan.org>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <20260823-configure-git-v1-1-3c65eefcc585@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/8/23 23:13, Weijie Yuan wrote:
> Upstream documented the common 'git tag -s' workflow and cleaned up
> unneeded RST markup. It briefly updated the automatic lore Link: hook
> for Git 2.41 and HTTPS, then removed that guidance because Link: tags
> should only point to useful additional information.
> 
> Add a SPDX-License-Identifier.
> 
> Remove a useless top-of-file label, as Jon always tries to do.
> 
> Update the translation through commit 944df7a31452
> ("docs: update the guidance for Link: tags").
> 
> Signed-off-by: Weijie Yuan<wy@wyuan.org>
> ---
> Hi Jon, I added a SPDX-License-Identifier for this file while the
> original English one doesn't have one yet. Should I do that? / Is it
> "legal" to do so? , if XiangCheng would be happy with what I'm doing.
> 

I am not Jon. but usually changes should start from the original file. 
we don't add or change anything different from it.

Thanks!
