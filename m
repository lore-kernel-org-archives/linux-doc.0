Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8093F20F3
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261673; cv=none; b=XloVaMUA6ZdLuB7c3ayXi/A6yp/MY38ab3KqCvhb0xbkhAJFqGLahcIUsid46r9pAvcM72LIymg6LV4KNiDQ+CPpRKnezv75G7r0tHHJdSKTDz/+EnFaeBz9Z3LrqvD9QVXfXUHSeVRpH9wLSljJsqbiNUVjuvtpsp4fKC4XPs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261673; c=relaxed/simple;
	bh=JJfd9cxLRUeTUBsJ3P0x+fyPedQwJpF3lv9sFf8ZCgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AQPB0JC6LO7c6t34vypbuV8vfbtTseBIB8OKDU1JGn+13KL38tn06DmSE6RuduZTESbtxuQa4KknJ/cQPByoGgYsuwBmnP3He4fNmVHga+mI9XQmzuK7CM1i7CnptfrNIHLepuyIuurezbxuei9pjx6nqpdM9EPWXLPpQkFWVGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=L6iv0ubI; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="L6iv0ubI"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7dbccf6a23dso1876198a34.2
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 10:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778261671; x=1778866471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tX74UZQVsaDLmSa4UUTu1J1Fadzzh5kKACjS54Lp3PU=;
        b=L6iv0ubIQ2FAUIRvyPr57nwBRtYpplM2u32u8v7xtd27NKTCKEGph6hhjJxavRqON6
         6A+XUPwwCyZ6QxdCtSHGK3Vi5QquNFNBHfPIPNCX9rrBi4KNsdGTxrnz81WgHZGsmSu7
         YHVC2TN0OuUMU84WtTaLpsauSxhOQjxys4pcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778261671; x=1778866471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tX74UZQVsaDLmSa4UUTu1J1Fadzzh5kKACjS54Lp3PU=;
        b=eCWN7zewfEeBe+jJMQkkh59k7hbmPcb187RdG6E3tOrC8kQL4a8dVP2UOtLyL70nxw
         O7buTMunZzyiFDVEa6mWLGy4n8UPHJ1NRSn75gP8ZjQOx3uja7BvZdytjKCtDMbaQbIZ
         choOygFaJzVbdAIzX+3aB8Xq+IgscSUWdfJq7PIfbIIE8qgm3asifTv/wfEn95v0o2dm
         Q3KZelGu3YelZQLqucY98qu9HxBIoaH+5nFzzfhpLDsVvM425K+mgQnVH4H9ml1QnKzx
         aEJbiNGZasfBKla3E1t5r4nyEhK4g5tXvY+aOp85HojgFAJyXa5VhleiMujTUuvq1SjF
         dDMQ==
X-Forwarded-Encrypted: i=1; AFNElJ999b7gpARdzX8tkEKlZ3qj102dAjAhXNCCq/mQ5NeyHiJBgcrkV3LbXn9cFV9hd6gL4DlnLZ73PLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8pdaReCrWLBCczHfj/JtuJdEGGn0iMub8wTltOXfXFua+eO/q
	mF23RuWK9Quc7knNeCjfsLhFqCPIL1YffI39eOv6jVxkGPFc8+Ovy1jtIlswHAlmpaw=
X-Gm-Gg: AeBDievCZ6B49oEeJUvOnDF16xL0nQOb7rBTE4YsJv1M1UOjGkeJK6TGg8ycwbpalfQ
	00HKXlHRCo7zvGQ+GKzaIWZL+cirFGRbTOlljd/oCERUStFUzCtEL7rW8vEvHGNR86RVco2uZzn
	Fb7XNqInse8djo799Fz+tx13oNgYkpNkCx48FW+r+QO/pz2mARz6ABtibSc6PasJhsC22LUP1Jk
	Na42MgTyPdbx3v/u09aoDMgoLHnRrCpgCYiRVxRAP0BIvNIrzXtGYIp3wZiPu+pw8Zwuit61UL9
	WSR3znOiR2mBfVh39jPpxIPYcs6mnebO2XC1V6fudh/QFr3etU66eTPeEKvo8jHw9rliXLCBiDl
	nhSbHIMAFMpGZU7U/DafMDX+sUVA+QagV6rphEJeDnLeRSNPqi4w+N4Uz4KFsIaPMJuT8Kz6MkQ
	rSOX2sfDvJEwt9g6HhbMs3XE6rQCGmKqc=
X-Received: by 2002:a05:6830:390e:b0:7dc:a256:5e2e with SMTP id 46e09a7af769-7e36615f5c5mr2435057a34.1.1778261670700;
        Fri, 08 May 2026 10:34:30 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367d8ffb7sm1525633a34.22.2026.05.08.10.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 10:34:30 -0700 (PDT)
Message-ID: <cbee6599-a092-467d-bd98-b6ec8d909405@linuxfoundation.org>
Date: Fri, 8 May 2026 11:34:29 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] docs: fix repeated word 'at' in journalling.rst
To: Adrien Reynard <reynard.adrien.08@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260508163807.16284-1-reynard.adrien.08@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260508163807.16284-1-reynard.adrien.08@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/26 10:38, Adrien Reynard wrote:

Missing change log

> Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
> ---
>   Documentation/filesystems/journalling.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/journalling.rst b/Documentation/filesystems/journalling.rst
> index 863e93e623f7..2825f6c030c2 100644
> --- a/Documentation/filesystems/journalling.rst
> +++ b/Documentation/filesystems/journalling.rst
> @@ -93,7 +93,7 @@ easily as on jbd2_journal_start().
>   
>   Try to reserve the right number of blocks the first time. ;-). This will
>   be the maximum number of blocks you are going to touch in this
> -transaction. I advise having a look at at least ext4_jbd.h to see the

I don't think there is an extra "at" here - the second one "at least"
is in here to emphasize the need to look at ext4_jbd.h

It could be re-written as:
"I advise understanding the basis on which ext4 uses to make these decisions
which is detailed in ext4_jbd.h"


> +transaction. I advise having a look at least ext4_jbd.h to see the


>   basis on which ext4 uses to make these decisions.
>   
>   Another wriggle to watch out for is your on-disk block allocation

With these suggested changes made:

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

