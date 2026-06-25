Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE223CEB9B
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 10:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782381956; cv=none; b=mjlHxp6s5kcPflKt70IRt4p3myYfmZhlyu7PaEAu8GkdHpnc0Volzv9dYX4cirViJ5YqAOQ5Hvrr8hY28qxKlV67nte0fR0k9RiAWZOunaZGuXO3BM5FzBQGKX39af27ziZXR1sx7T0e2Q1wD7rMpLfWMZnDcSzdAGlq4aLOKjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782381956; c=relaxed/simple;
	bh=bCzLf4a12m0+P4xvPF6Kf7T8wGTy2t8U1zmJTmo1qUs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvfJs7WS7y/3UyFMFRcNEHXWQyZNHP08kDTQiV2BBX2wOLVZ9g3OG68WYMYK1/DnGBDyHz+ahQnN0lbmxZdlO8Mkmkm6/xgSiVRKr53BPe6++QP3Yeq2FoHvFprBSKcPiU/ByYOR2Ex97d8VYnoUe3C+sptPeR2EBhBb+4SgzX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnnEqXIL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnnEqXIL"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c7cfa17fedso16081695ad.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 03:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782381954; x=1782986754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuqp0KNKTBgh4MzJ+duwi9A+WSjJ1uqkPtcQvGtxNIc=;
        b=KnnEqXILtRRtgTtODm/1rhV2Rnv+tttPQM6kZFVseUopZJ/Zr3kgAtVtJrfrS5sHJ7
         rg2Bl1qEP2VXSDqYyPiCvS+RkREkSg3JEkhUjmpkRcjMD5eNOutWW1fAJyeBYtIM/FTq
         tnErvisUyiRlUhcKoDMpRZamx/OFsPeIf6ZonS2ASOXJdVa/qCCo1JvJkG4LimyeHh7f
         KOkIEYZMhf/r4GGbG1jhU45dGdlVouQodaxFVIwRswLEtTZlQBIs33eoouFV+tlZc4WW
         zqpWCa1PqX5ag8o69Me7VQgV+WgPZAFDcGW9f12JQHu5rTw6HS5sLWnZL1bjzA0dXy0D
         DRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782381954; x=1782986754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yuqp0KNKTBgh4MzJ+duwi9A+WSjJ1uqkPtcQvGtxNIc=;
        b=mb0kroMFWzKEN+OdD0yGBvHnwXHN7PHqbiSVs/TiYLLhJ0H1BxlTA2TIWnM4YIaJ2n
         Hq5R3aqf6jFWrX2dOZNzogIyR4JHwB0dT63I7UNwOl3VFKQ0+/qfe375RbHbkGrMNfAh
         7MqB6ZI9E6sZvZlgsobcZhxkpuxzvtEI2PxxkRKnD53zdM7IDUHcRq9xzPAFE9vTKyem
         XdwypNIlkVOy07zyfYhDk6w3orqK+Wqz4vxgw5a2+jR1ZHcvyuidz4LYTMpgbTYjovEf
         L4FnQLDEa/qEamIK+s6YxhndtQ4Kvej+m+mLxVy0Pfh/q/yBmaQKeQIOgu38ItTzolfW
         rJ8w==
X-Gm-Message-State: AOJu0YzqTYUIquAex9yOcJJzbYG3cTQiPxUmdGC0ru0hFo9XIy2oWA5w
	RXTrGgV5AQicnEL6lB5KLe19b/g/wsAur2h1vzwFkkYsXRPdCrl9YTCH
X-Gm-Gg: AfdE7cm2z85ZXp6ORtOvG9X+03KLPZADuUdBds8mHSxsmU5llOh7ujI6GNFt2JYNI90
	1HR1LwQk6UyLG3YsccO8/9uJHqZIzINKMIfiVJH7hQ/fBH1BkWFV1lXaZmSytTyW6zZ/E2yyNkM
	UmYB4Koq8ZmiWToNCVNfVPdj9zopWXPRFnjXzSy8EoSdqxhgDQKLJXV380X+K3RLQgyoCgmvuQA
	H4fHc2gjr4l0AOf5Jp5dCi3hTXe1AXcleRgVsv++zhPvGgptruM3OlXMlq7Z21ZOL0Fkm1H9GY5
	6xCSNCwoeWj8MHGtj+QtGWc383eKOa+AqELhldP3yccjHcqAuQBlE0AE+M6RJ6trH9TZLAi5hUt
	6FgUV5/OjcD6TYKCgdXTAtff2i7pulxynoM9vX7xVbgbvE/4n7Xledb9oIQo6ieRl9DBgzQ==
X-Received: by 2002:a17:902:ce87:b0:2ae:450c:951e with SMTP id d9443c01a7336-2c7fc73bb04mr20774235ad.17.1782381954493;
        Thu, 25 Jun 2026 03:05:54 -0700 (PDT)
Received: from localhost ([2a09:bac5:55fe:30c8::4dc:c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63b2e18sm16974275ad.41.2026.06.25.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:05:53 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 25 Jun 2026 18:05:32 +0800
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, "open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation: dev-tools: scripts/container prefers
 Podman
Message-ID: <ajz8qtGkafGZnCPv@Rk>
References: <20260624013850.1853171-1-coiby.xu@gmail.com>
 <df2fd6ae-69bd-42e6-bf28-ad8103b4189f@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <df2fd6ae-69bd-42e6-bf28-ad8103b4189f@gtucker.io>

On Wed, Jun 24, 2026 at 11:02:49PM +0200, Guillaume Tucker wrote:
>Hi Coiby,

Hi Guillaume,

>
>On 24/06/2026 03:38, Coiby Xu wrote:
>> Obviously scripts/container prefers Podman over Docker. Putting podman
>> before docker also makes it consistent with following parts of the doc
>> and the help text of the tool.
>>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  Documentation/dev-tools/container.rst | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
>> index 452415b64662..9e23f79d5ae1 100644
>> --- a/Documentation/dev-tools/container.rst
>> +++ b/Documentation/dev-tools/container.rst
>> @@ -40,7 +40,7 @@ Available options:
>>
>>  ``-r, --runtime RUNTIME``
>>
>> -    Container runtime name.  Supported runtimes: ``docker``, ``podman``.
>> +    Container runtime name.  Supported runtimes: ``podman``, ``docker``.
>>
>>      If not specified, the first one found on the system will be used
>>      i.e. Podman if present, otherwise Docker.
>> @@ -75,8 +75,8 @@ working directory and adjust the user and group id as needed.
>>
>>  The container image which would typically include a compiler toolchain is
>>  provided by the user and selected via the ``-i`` option.  The container runtime
>> -can be selected with the ``-r`` option, which can be either ``docker`` or
>> -``podman``.  If none is specified, the first one found on the system will be
>> +can be selected with the ``-r`` option, which can be either ``podman`` or
>> +``docker``.  If none is specified, the first one found on the system will be
>>  used while giving priority to Podman.  Support for other runtimes may be added
>>  later depending on their popularity among users.
>>
>
>It's a very subtle tweak but it does help avoid some confusion.
>
>Reviewed-by: Guillaume Tucker <gtucker@gtucker.io>

Thanks for taking time to reviewing the patch!

>
>Thanks,
>Guillaume
>

-- 
Best regards,
Coiby
