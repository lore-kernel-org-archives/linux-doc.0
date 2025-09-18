Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1BE221265
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 03:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758166630; cv=none; b=NyiapdjldyMh+IdGI0lD+aUwBbrh2KFBnSsCaWAi3lWVkeHD6LE25G2LzeqTBwNWj8i0rF51vQxsnyaFyXczY/Nr7dybEKcNMEVyRohnG0d2MUk5IGVXbZ8QlKMhg0dZzKnGFWFWSpkmn/kzoz/M39nk6f4GjZrfdOknbhg+pF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758166630; c=relaxed/simple;
	bh=9C03DLqVam0PMQ5zQvKRtpPgWSCbOXBvesI9otPqIac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYtwlZjf8fIXz/unM5KXWGBmRuV9Nzi+kx9B7LdcT/S9XDRBPmgrBu+lJPdaNbT8owuj+qM6uA8UD2A2+1P/wEmfZHTI+n2JLy+z7s8+HwBND8rh1rzAP8kxLgagDP2yMaygT4lAWItebhTiw1AzpgA/c0edRegV/x0LT6zV9pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyjaCCFM; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyjaCCFM"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7761e1fc3faso530681b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 20:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758166629; x=1758771429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TF674HGcYaIoheg5UicmzGQj1rC1+tAHApzvaBkmnHM=;
        b=CyjaCCFMsSJQmxy/dvAow5LCxNX0QHDQWHwnhas9bpGq0V7QLitd4KUuYcRhMNBciD
         1Yu6ZKVsRHbORzRWl4hpJ0y23ZhC80kG1w3t32EAZ+023KjvoiCyarOpjGDdq9q98mCt
         hrxQN+DmlbXmIm3LAu3e+IilSgCi2jJQEPNgSOaWLLYR5w7F113r0Rryfu2TOwWv5oTO
         3eUQp7e0GqD3GxEdj6vRxulMbYFZrEpUxwyw92uwZ6+JmUjceFzfXrcW6L85y3z/qmSU
         EshjnhiCr7vPjEpsYwwcb5R7syTMVDMjqWPYcxK7lXCmfe24J64jlfCaGpRoovMMQVXi
         Hcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758166629; x=1758771429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TF674HGcYaIoheg5UicmzGQj1rC1+tAHApzvaBkmnHM=;
        b=Jb3mgmydhDF88FRXOzNQcEj2LRT6k59XLPEsYVCCi8IwLzb1HlubE6af+iZ0YB2Kdb
         vIi3stxPNI0lr3Mg3CqJgKklm1UT0ldE1E0sYbs1GGDiqAfVX7daVREeTUBl26mfVy9e
         BPvGc5iLD7DiQpAOKV70kTstmmuQ+Ik/7jtTa5FIu60kMehWX0PbFN8Km5Y9fEpnCdWB
         ucEQFGSl3GvBkBYf6sn0dihsw/1FO36xtX/pe9Oi/YRBhGJWxlSYc7TELNbcztlRsaGk
         ZTFOvG5mGzL8IY5KY9X7G5x7oF3QmhfV9Khkgtk+ENUKg2q+tDnvLFaoPGo212UIUJxR
         Itrw==
X-Forwarded-Encrypted: i=1; AJvYcCXCTTnkh2GgL06ENBfbxyD26NKpPziUJu/woOnYYlmrLD26Lk2tuQvXqDF7Bbwyp30gw6Wc5RoenEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm2tCuqAcR77QNm7kp6WWJcTJq6eBwVJIT0pvpoNiCHUNoLtNC
	pz4CHJ3updGe8mpCcNk/QreImisWdKULeg/hlLfumM0jEbV3l4s4QWdr
X-Gm-Gg: ASbGnctNhguqwcF/RBuHWvAxiIEtdwLCyAcjSAUpDy+yXUh/99XqEFpogG1YfOyuBaM
	BtTmrm/jPaif9pOD8NwXTL1upqUz63npUryeXhFsMI0lAJvmVQbvcoYgvHZcNxNqFvAh5NeP7Zm
	wguOwsH7PCFv2cwQyQ7HPGdypI48eg5s1YQue3nqzWrMtsNCOUDMQwITL/MtJEn+H4gO4GJ22eN
	R8BNCJ7zpHx4TT6tidMXJJ3Xk9CbMT8ll2lndyAiLTJfmDaSg9sGvroTizTYWHM+bo9XBwZcr4f
	Zv03N+JR34xvT1r1jtoZYlwmZKzkSQDe9uql1dNcAGJkMODxISo5/GV3s6piXUDb/SSmgS2lMaq
	xByA7ORaw72FA9sawAABjJmPilwe7R+L+YvgdIL3bBghl9bS3
X-Google-Smtp-Source: AGHT+IFwCt9Dk2w/Kc41woD7GbmfS0MNDCknMwgPCNYn1sxPeLrZNLvTpZDQKV7/BLybgiTCHSJJ1g==
X-Received: by 2002:a05:6a00:2d9b:b0:772:6493:7e67 with SMTP id d2e1a72fcca58-77bf75ba331mr4842784b3a.3.1758166628542;
        Wed, 17 Sep 2025 20:37:08 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfe75ef24sm873845b3a.55.2025.09.17.20.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 20:37:07 -0700 (PDT)
Message-ID: <2b00ff29-fd35-42fe-83d9-73811356b73e@gmail.com>
Date: Thu, 18 Sep 2025 10:37:05 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: process: Do not hardcode kernel major
 version number
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Workflows <workflows@vger.kernel.org>
Cc: Dante Strock <dantestrock@hotmail.com>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20250913015147.9544-1-bagasdotme@gmail.com>
 <87tt12e5zf.fsf@trenco.lwn.net>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87tt12e5zf.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/25 23:07, Jonathan Corbet wrote:
> I have to admit that I'm not at all convinced that this change brings
> clarity to the document; using real numbers grounds the text in a way
> that "a.x" does not.
> 
> If we really think it's embarrassing to still say "5.whatever" here,
> perhaps we should just change it to "9.whatever" and be good for a long
> time?
> 

I think that's a good alternative idea.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
