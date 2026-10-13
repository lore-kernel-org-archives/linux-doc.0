Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B313769EC
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 20:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921683; cv=none; b=Ic+fkJJuwYKfsrxYzeyotRdJhocTutGrAnHVB9QtOQdUqmr5fefmcJyGvhZjh9bjRyf6GBxMIclZU0y/vB1rxvbx0xqpxDfcp3gfNIImfOvo53VM7M8A3pOZ66DysN+IIstBy83CHvPuxE6Kt/vLxkqCeYIefX/FmnkFfP2icS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921683; c=relaxed/simple;
	bh=fQVY5chC60ZjBQjDFPKKF/d1XMZEKgL4x/CtPrZ0YQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GD0lhcusuOBby7u+EGLXHBSdfGBEYwQK2iUKCUEsWFHMfq1/u0B+nh+vfSVxMALUeC4SA+LSiPZGV7VmU4k3eA726V+sMixKuIaVst5vdtKDr7aRz5ljSXLH+VpiX4MlP2xvqF9Qpb5gxWoJKSMm1gTWozfU6GOyHpwine3H4Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bHHNblJA; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bHHNblJA"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-81579d03929so2360701a34.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 13:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791921679; x=1792526479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yptnc6KUcr57HmaDPJW3YGRT6JlQRoFG6je5ZFpjWiE=;
        b=bHHNblJAwI9TqaTiC/MFjsd0joApLpBanlzHeO5elCnR6Em9h4aL7Gki6LXOqQUBn4
         HukHeCqAhzWt94MFMYsY/Bk1kxfCWaYFujo+AGDrMPB9B14AJFQMJFcXsh55J9LrWnPN
         xu1tJBrHCaSm3ozS9XlCitZEEPO9GWn+rwM+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791921679; x=1792526479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yptnc6KUcr57HmaDPJW3YGRT6JlQRoFG6je5ZFpjWiE=;
        b=yNdAB0GijJHskkTXhkjc2Uk2DDfgJLnYkpnXSIrXkhZGlw///E1LrW0nDQJLK+WVzp
         yWyr+0dvt/uCwQ7KgZY4D8EX4nwQ2rbjaB2Br0qVm97QWNU4fN6hNmyECRe7zypeoeDL
         diwkrO0m6DzQXaIe7/MPESc20CHQArsbz+oT8k69IQ+i8LD8F0yV1O5vw0NKYixNEETa
         hLPfaGy697A2AvNXzRQWF1K8qlQx9WrtVZt60ZHp4oxu6Q1Ku/ROjFBYWWGtMr2HIqWC
         edGXIM1cPG4ZwBIbaCHfj3qWYnx2/lyD6HppuwtpcPRB6Sf6sBPFsjlHPgJSUbSoTPKv
         d56Q==
X-Forwarded-Encrypted: i=1; AKwUvBzc1qL76fe7/qvWzwCoN8MWXXe0OYWwAaa+bllsISM/PIokRTgHZeBEQj6zt9tGHR65ZfFl1ZY1CXQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnEh8Aibhs/wlgiU51tN0cwdAgLkQbhkKj3A22GU4xy9Eb/Sxt
	s0KUykm1sUMEr+ozi5ks4UwGOhR8cKSJau/uyOZsCywp5Vzfegff9UWQGYxwsUZc8qE=
X-Gm-Gg: AYBFou1k+U2oID0bjD3CdWxgcTiLPTPqTu7VvieGKtmKgO2oP2rA1Z7r4TdA371cqxI
	Y4/+7bBYlJap8WswAZhTrw1xUoQGdhjBSkJOaBl/sK3ai1tr0pV5NvVFTEMku9EqYTt72mnZ6YV
	8sNS1Y8ozfbMpb2N8N/g3qBBMKObJ1AzFWrppLJgFso03m4G66uFTLmSi7ZBqXFaDqeQv63UGrS
	Ys/BHeHdalaKmM6+WrLCkt0B0lXpvW+X6/9ioY1P5bKWnUX9laKGj6KSujgfGUBM2y9+7mlAylf
	ic9i/mzxufGbVTmfY5fm+w4v6RNInVrTmjodKYgO6qm+qBnnh0qDMVWLJ89dRQri885cyTjMCuS
	zgwRLEHHIcPDNJa2XDx8I46p8Ka7d4OsFA/vAn2YwW/B3Qweqwk86eJUS2UYiJo+ooomIu0yxJB
	oMoCZRl2W3uEPAhgXIeulVYGexYnjEO6EFkUCbaZVgR0wphEoEpJ/Xi/y/aEEkm2ggkJ226igqW
	0OrvgUW7Q==
X-Received: by 2002:a05:6830:680f:b0:81b:ac5b:ea0d with SMTP id 46e09a7af769-83096cc4e39mr13898778a34.19.1791921679468;
        Tue, 13 Oct 2026 13:01:19 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039a3dfa1sm13350079a34.18.2026.10.13.13.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:01:18 -0700 (PDT)
Message-ID: <3c45e083-4e08-4699-adea-1d758baf8d0e@linuxfoundation.org>
Date: Tue, 13 Oct 2026 14:01:14 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: remove Assisted-by reference
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mark Brown <broonie@kernel.org>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>, Kees Cook <kees@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Sasha Levin <sashal@kernel.org>,
 corbet@lwn.net, federico.vaga@vaga.pv.it, apw@canonical.com,
 joe@perches.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261009083137.3-1-sashal@kernel.org>
 <202610122124.08E058768D@keescook>
 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
 <202610130120.E43D236E@keescook> <as4gLo_6acb_zZu0@daedalus>
 <20261013125559.GG4214@killaraus.ideasonboard.com>
 <7524f3d6-02c0-488c-be76-23de8afc2b76@sirena.org.uk>
 <20261013170744.GA178151@killaraus.ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261013170744.GA178151@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 11:07, Laurent Pinchart wrote:
> On Tue, Oct 13, 2026 at 04:18:32PM +0100, Mark Brown wrote:
>> On Tue, Oct 13, 2026 at 02:55:59PM +0200, Laurent Pinchart wrote:
>>
>>> The absence of the tag on a suspicious series offered a low-effort way
>>> for maintainers to push back. What's the proposed low-effort replacement
>>> ?
>>
>> Greg's suggested asking "how did you test this?" or similar, a lot of
>> people just throwing stuff at the wall simply won't respond.
> 
> I've done that too. I still find it better to have multiple tools at my
> disposal, I want to be able to tell people they're expected to disclose
> that the code they submit was generated.

Asking how the fix was found and tested has been helping me. I get silence
or didn't test it and that ends the discussion.

> 
> Maybe Documentation/process/generated-content.rst is enough. As I wrote,
> what matters to me is the disclosure requirement, not the Assisted-by
> tag as such. I'm however concerned that it's even easier for
> contributors to ignore Documentation/process/generated-content.rst than
> the tag.
> 

We could add documentation to call out the need for telling us why the patch
is necessary and how the code was verified in the commit message.

This will save time asking those questions.

thanks,
-- Shuah

