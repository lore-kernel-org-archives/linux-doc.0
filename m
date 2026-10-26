Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006551;
	b=eq6aiVmiUTM2vEzYNXg/+Z6L71f5KlTEVIB9zun+Wr4LefzmdlDBpW+/vMcScmAaXZQd
	 sTkN5/KwS9ftIvYxmfu/cFrumqes3/tc8vaM/hY76WFiH5JYFrU0ks9cXMi03cMHq2ACj
	 dPSOW5/FnQXwHLtisVZ8BBSpoui1FKOLeDADpeFY96Yv7ZatrGX5iH5YEE4yOS5WAV/Hb
	 YwHL+MuBeRgdd1UGQvV8ywGhdrgOhnpVyxLRgumhRgjfz3tkPxg4dKoh2EEw4yLBdZvqD
	 wFKDllSNygjWG6LdybT8LwCB5DcX34OiNNzz1FGXCPOfbY1BE+qMgLaxYbHi9Q9Rzcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=V8YYNHqrt33tQh3j/NNFt0Ir9INku8h3/joaCNcuNYA=;
	b=qQHmKWpbqichvjCnqT80+AJP2nr8TN38Wpqr6ZbKnUw4T0ROE/jlXVsP2Q3Xhhg3rMTk
	 5BC6A89uEAeUVmFHDWQGRSeJeEX2b3dFk6WLGmU8v9JJ0Wx7m33EZPRmHiBtrUfm/aPXD
	 RcaLZaNuC9Aj83DJRl9xlh9eZZqnnQIbwNzezxI+PXxT27QFZpZVTfXOqvNGhgGI5umsr
	 i928Gw76awrNe4E7EBwT1j++DxNkidkwZ6wCkDcrhrCNdS+dM1hzgpYD0hJzmqaETBk1S
	 xYflqk9gyuTT+/g6PTlaLrmkI8GXQJ+ow5hp6yTq8zH9fEPFMQryESU4rZjmvgn/+tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pB7B5UZh;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FE2606A321
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 09:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33FE2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pB7B5UZh
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20edd106so2384896f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 02:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793006544; x=1793611344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8YYNHqrt33tQh3j/NNFt0Ir9INku8h3/joaCNcuNYA=;
        b=pB7B5UZh92Vl2OCgdj0Ce/SFQiad4yYYyQnKuP0k9WbZAC4/shpL6dpSNnhVHI4mhq
         vZ6xbo7kWdoZqFcpLDDetrrQxkzs/1rPBD6YF1vmGLGvm1yUxtFWTzSQ/bHkke3iDPyx
         gtosadZH0zXr1ivEopWQvZu7ezR/CWsOcBsp++w/s3q4BKXAsFwiskZmtnFn0swya1Ml
         do8j2VrU0zkEc2WQYFWM+BznoCRDpWFjPfaGEXnWioXwbqosGK5miWbgeLJWTaiKYGKA
         Zy5nD9GDd8AoxdXrr7MVbgw+Yvr5aFW+urZvRjtpub5S2k6gN3jvN2xr9AlbVHCVDHw/
         eTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006544; x=1793611344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8YYNHqrt33tQh3j/NNFt0Ir9INku8h3/joaCNcuNYA=;
        b=aTU3tH8xI29xIlJURa6PTF47XK/BwzF9dI9hYV68kK8asLABgKlRYaINzLteTilK9m
         0fNeQb2bCjMwL+TdTgXY7D2ZFPzHTX8e7oV8eYu90kzwcl5MMtAOcJ0K+OlzD2s5EU3X
         YoIHr8b7spupB+IxOSaoa9jeDHsRQKIz8PzRcjpZeG/PPd4KdoL9DiuXNpdgLdn4zW54
         8CwtoLGev2DMLKe4gMUhaDG61tNpcuCpQSoXzcgBWKJfVgI65JecsnlTwIIxL87mv0g6
         YaEbXi4+8FkfUpJS1dsOhE2dQvYWnFOzlF9siYeE1y6P36X31J3Fw8QLcZ2oc37gg0Mn
         UqyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3vB1bK9o8bVQtcLNgEAf/HniPFbOEBG5z5H46aK7mL287XNKMENo1rJuHjy6ExV6PsswKN9/EChU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEidLP1vfVow+1IavoOmiRglhxKmpNlNFyAonhpoGbbsnCMHgu
	VMdiVQwab8rBMZAln441pUzHTBaG6PG7bvzXmIhBsHXG9CAFrNUDMTtB0kSnPr2ZseU=
X-Gm-Gg: AYBFou1oBEKOh5pg637loMBRai7Ub3FPtoNo/jqa3cTDteg5C4iaxeAALVS82IIz7l2
	obK9Kmhy6JJth4uE8SOZEEoa7kaSnt7V2qZs3KRIY3UZH6iu9D608Fmwo3nnwZnhdmPwUliCJdF
	Lla1yMS01M3ifBlDgIt15M6JUbeiYtQ20sRbrwC/v0Kzpr90mnkAs4LWgZG9M9s1msKMRvLpxG4
	ANY9tK/6oklW1zVMFDRhVTsdI69MATQ3NU8yZMdri0Tbd57RkxNCBh0NdD6MSAr68IlZprWAL2j
	WmA1A8/jMtFKnpbrLEgq+EeDaD9rmMG4WQD7yumyx5hglF3BJSFEUEFyp3Ms7K9moawgE1d/P2I
	jxN+k2pkd1vxfQqHafyQwM5R6TN/WI28MdXIt8xdUflG5M9WFbIIXTBAdU2uUiEkFJ/mmh1+ycA
	XoxyY7wP8N7GW2vLnBKurudWnmmiE707oIjntdOqvrcg1jbk5XMPs7nmKUhZMJmNrPvf+FcReWw
	+v0Hl/yh7hQ1GBDhY1c4X2jlvtBM691TBXwieW7ukOBKPaTI4jZ01hP0mdzJg==
X-Received: by 2002:a05:6000:470d:b0:48d:facb:5937 with SMTP id ffacd0b85a97d-48e3eb3cc6fmr11105736f8f.7.1793006544434;
        Mon, 26 Oct 2026 02:22:24 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece5e4asm15042461f8f.59.2026.10.26.02.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:22:24 -0700 (PDT)
Message-ID: <1de1884e-11e1-4375-97af-fe3bf924a584@linaro.org>
Date: Mon, 26 Oct 2026 09:22:23 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the
 PMU counts
To: Leo Yan <leo.yan@arm.com>
Cc: Amir Ayupov <aaupov@fb.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-4-aaupov@fb.com>
 <20261021164332.GI26205@e132581.arm.com>
 <024bc6f1-eb73-4f01-84f3-738bf68bdc93@linaro.org>
 <20261023140013.GK26205@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261023140013.GK26205@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/10/2026 15:00, Leo Yan wrote:
> On Fri, Oct 23, 2026 at 10:49:40AM +0100, James Clark wrote:
> 
> [...]
> 
>>>>     * a device that matches one of its classes and has all of its capabilities.
>>>>     */
>>>>    #define CS_CFG_MATCH_CAP_MASK		0x0000ff00
>>>> +/* trace unit external output n is countable by the PMU as TRCEXTOUTn */
>>>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT	8
>>>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_NR	4	/* TRCEXTOUT0-3 */
>>>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT(n)	BIT(CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT + (n))
>>
>> Isn't this recreating what GENMASK() and FIELD_PREP() does? Can we use that
>> instead?
> 
> TBC, are you suggesting using separate capability bits to represent
> TRCEXTOUT0-3? Why can't we use a single capability bit to indicate
> whether the feature is supported and caps->num_event to indicate
> the number of external output signals?

Just the pattern of *_SHIFT and other stuff to make a bitfield is 
usually better done with GENMASK(). Or if there are only 4 of them, even 
defining four BIT()s would be clearer.

But yes if a single bit and caps->num_event works we should do that instead.
