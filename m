Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DBF31618F
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 16:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768322553; cv=none; b=F72+Epb5/h8VyQzSYdvXOgyrm8+nxiXFIVBcxbTLg0yMMnKRtEs18H1VvX+gYFQIlDBCSI4J1jwLQjc1jR49id2z7Yb5jlaodRFu5gVV0vgMjoyNjAJ1e5glGS1S6qTD3zpaJIjKUzTQ1pe3HZ/Au3+HZpRBNqWlZ4PpzHe9G8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768322553; c=relaxed/simple;
	bh=iqLbJUskSKL4N9IDtD++X0NNSt+LYTZ6yAIiJzJtIKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tl3g1ArHcJ/Ex0mMe/vmaTmbYjFXEWg99yyU2a984+4y/S2sT91rotL5VkHlBakiX5IMXcUb/lyq2fOiJ0kzUncN0CngEBDT1FYI02T/nr3WqAQ9LQf3z/YaxmeVmYiDX2F0pMpAaZ5ujAblh31p8Nqf0KufyYgJ9J7MmYTSzgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9XG90Yw; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9XG90Yw"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-34aa62f9e74so6384021a91.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 08:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768322551; x=1768927351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bLrLTIifRNqu5HnU5w9pTdgCpPu1ucQ1Ea9E1Sqzz/M=;
        b=I9XG90YwqEqgImbnc/E7zuRfyn/MmOrmXj3BoBKZ3R7DUMcFSsFAiBvrDzS5lFHn9T
         zqff7HlTFPYkC9OlinH9OOoZ/AzDf9ty05toTpPER105vssXbrhfealV7EIpC0wfWZQp
         kBfDaWxH649x2/LHdtdRqOXsB+HmOX3o32qk7P8wBXzLhWrlNnhh5GienCEglfobgqOS
         sUup/QIkZftg6b1nJmWxwQJ0thre2lNKDndTV4qTYQwWtdTw96n2fLrA6m9cWPyeD3Q4
         edackCFd10cTGWnug0QWJO4cGAeAl+uVkQAR1BmWsuVWEWPSYWBynUxQVTUvETZ3u2Dm
         Ljig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768322551; x=1768927351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLrLTIifRNqu5HnU5w9pTdgCpPu1ucQ1Ea9E1Sqzz/M=;
        b=Q6/8aNa2vlGMn7T6x/JnsFVPZRbpaLnXNMS7PLceUCGufIQ3V3vzC4m3Wryo9giEUV
         e0W4xVed9vzR0vXYQRCrKAEFr1FW8Brb6a/7iUlyH0hXy00CjHket/hqRC1ejN75tBWm
         Ho26jeY+PeRkrGACupRd0tofvXxZ3S5vWbT4BdzK23vkSzvERtAMdxZ3vv4lqo4DnQgU
         g9vlP9CRtHuZu5PxctDkvgRtUyZF7HSsERDc4Ns9THl+lYBY9Oq+rJQfenOd36ScDmPb
         h9lbqtbnvPChuRghnZb06puIIc0RA6azZmUL4PcvHqaFuOS2D8dpmBb/U6kAlpo+y+bO
         sc9w==
X-Forwarded-Encrypted: i=1; AJvYcCU2wFng6cbb0Mei0kK9RgetoetdCi6jrKHFZpqPSbymrMlLvgbO5Cigegaeo2ywqBJB38oaI0rxis0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBssWbqDBVoqAvpvbXM672bNpEpMOEVC2Vu/PAnyaWGvOMko1q
	Tofs0Noz7CUu5XVsfs6XNbxm9wtZcIkG4i11nhB9RjrUMAE5R4l4ektCQcdN6IJh
X-Gm-Gg: AY/fxX68mopTohsy54hAQsSHCQiy97a+NaPraT76anRwJBTg9ADqTxy8TCaKK+xogXD
	ylyowdfCKyy1zgFnSVKP50Xwdox85Y15A/TRdQz8MDC0OaEL21WKOW3wn4a4KyRE5XLLrXfRtl2
	wU6YVjm4FaHf47Ek60Ooq8FQHmuhOX5vdpaaYrRqdRnHWU7ofA0t3EdNVsnhn9NGWQ0hN8kUtJ3
	SZHmUVLtVjurJkVCcoOg5OnXDJbSX2GdJT2nsNnHudixXT5nKcHUTPFJqaEHZsJW8Fj3JDVq2Jw
	JHmDilBCOT+TjKcosyTeVJRqppncK61QamfP0Q8lH6OPT74+6zKbPS4hvHBjZx/cLEQvrx1u8AH
	C9gY+xHJc54OZY1Ld+OJBMOTq7BmmuLfTohYVpa2ww2JeK/qKCSEq3AF4g2czgIdraOx4e2/Crn
	nrPipIPzAf/Qtxpjv8TwBdynKx9nEi/XiKXniYbh1nN96R13vz1eUQBQEn7WEr
X-Google-Smtp-Source: AGHT+IHKSKZQgADOl4Pfjd3+mTQKk94xUzc05noeHLNnu6YOzYzqI6HhXwvi4DcrMT5Jb//EbsxJjA==
X-Received: by 2002:a05:7301:1124:b0:2ae:5dc2:3b08 with SMTP id 5a478bee46e88-2b17d208e7fmr20636867eec.18.1768315941203;
        Tue, 13 Jan 2026 06:52:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b175bee31dsm15888653eec.32.2026.01.13.06.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:52:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e7b367a2-bcb7-4ac9-83ee-ef55d4c2e303@roeck-us.net>
Date: Tue, 13 Jan 2026 06:52:18 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: hwmon: coretemp: Fix malformed RST
 table
To: Laveesh Bansal <laveeshb@laveeshbansal.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: corbet@lwn.net, rdunlap@infradead.org, sfr@canb.auug.org.au,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <20260113075322.978737-1-laveeshb@laveeshbansal.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260113075322.978737-1-laveeshb@laveeshbansal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/26 23:53, Laveesh Bansal wrote:
> Shorten the Celeron/Pentium processor entries in the TjMax table to fit
> within the 47-character column width, fixing the RST table parsing error.
> 
> The following entries exceeded the column width:
>    - "Celeron/Pentium Processors (Goldmont/Apollo Lake)" (49 chars)
>    - "Celeron/Pentium Processors (Goldmont Plus/Gemini Lake)" (54 chars)
>    - "Celeron/Pentium Processors (Tremont/Jasper Lake)" (48 chars)
> 
> Drop "Processors" from these entries as this preserves all searchable
> technical keywords (Celeron, Pentium, Goldmont, Gemini Lake, etc.) while
> "Processors" is implied by the chip names and adds no search value.
> 
> Fixes: 099cc1051df7 ("Documentation: hwmon: coretemp: Update supported CPUs and TjMax values")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20260113155444.57c7775b@canb.auug.org.au/
> Signed-off-by: Laveesh Bansal <laveeshb@laveeshbansal.com>
> ---
> v2:
>    - Shorten text instead of widening columns (widening would require
>      adjusting 101 data rows to realign TjMax values)
> 
> Tested with:
>    - python3 -m docutils Documentation/hwmon/coretemp.rst /dev/null
>    - make htmldocs
> 
> Open to alternative approaches if anyone has a better solution.
> ---
>   Documentation/hwmon/coretemp.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
> index 3afb179e0ced..3ba44b57d028 100644
> --- a/Documentation/hwmon/coretemp.rst
> +++ b/Documentation/hwmon/coretemp.rst
> @@ -120,12 +120,12 @@ Process		Processor					TjMax(C)
>   		x5-E3940/E3930					105
>   		x7-E3950					105
>   
> -14nm		Celeron/Pentium Processors (Goldmont/Apollo Lake)
> +14nm		Celeron/Pentium (Goldmont/Apollo Lake)

I updated the patch to split the affected lines.

		Celeron/Pentium Processors
		(Goldmont/Apollo Lake)

Guenter

