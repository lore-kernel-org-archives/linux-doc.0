Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF595368957
	for <linux-doc@vger.kernel.org>; Sat,  1 Aug 2026 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785585260; cv=none; b=UdvaKxG6K9OkABBn7nYlgPQL9DurVxLmJOplV76xkSThtdaLNjpuu8SM9XKAw8bEjeJqO09vikLviC9etvdWTTHuVSXrmvcrtMsEpJNesalBWZGzkjSvbKuU5YBLA1bGIoQ58ZiO96NliGPPqnOkib8dn0RRjeyCOkxHdsKlc1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785585260; c=relaxed/simple;
	bh=WAyIqKS13qhtcJ8TFErAU5BnHgc3X175FNY7xpwzme0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XUtezsDOCFxIx43YBe1zC2rqeh4j1DkqW9C1mY96itDB+a07tt4suGPX6NGEGUJX/qmV4mFOtM03DK/DwcGlJUdfNPWydPSwAfjOWC+GeeYRq1GDRktTpuoCdJYyLsUkk0hxvIZqd3gishQbidIkfEzjDWfPSoxHpYf+5vrqJ6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oAJPHfCO; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAJPHfCO"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848d21bbaffso2096039b3a.0
        for <linux-doc@vger.kernel.org>; Sat, 01 Aug 2026 04:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785585258; x=1786190058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/xE7Iz2aJ6sTqnJq2mUQC5qwdq+R/GT89iKccAizqc=;
        b=oAJPHfCO19SElpaN7jU4tUpjbRnkMxoCfJsocpMoXBkn2hJNQ7EK4vsCET2RkYlztn
         BOE/6KePuHqBi6kt+c/T3X8/hCUL3NazA3PwWt7jivr/2rJEB8F6G0v3M0ezMDZrGvXe
         hwerUf8FXfZNMNd8oYWcu2yEt2O0BxECMMCTq6s5AuDubq/Wb627oJPS63adn9qrFQP3
         RzzRKEwWkIeMJ27t/Irn4SimFH+rWTEP/CGrTczPMzjYPbexI2gT0tB3YuPE/Agd6fUW
         6DPaC2E2d4I7/clfZTkDMMXz/4FVATzn7E/5cO+K/q/IhgmE9vFosDLvDJ7y8RF9u56t
         Z3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785585258; x=1786190058;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/xE7Iz2aJ6sTqnJq2mUQC5qwdq+R/GT89iKccAizqc=;
        b=EZx3kebMFgX0oaxiRo2q6YPZl93zycZF4GEFYzisj9KCiesyyQXq2nDSg6HmC58bgS
         hvX1QSoj9vKx6SAm1vfut26URPl167aVJ5BHENO0P0YaB9791YsAlYvZeCKPSuNrJWDi
         AoDTn8OKc2TQDbZw8R3t59laHmbm2APTqAy8Tax2cA7Tf+BdSXMJurv6bAOOboy2n2Ju
         KMiNAlX06Xn6kY7i+mW1tZy8ucyBGmB5OIP9Y4CHSjsy0utzHfJYb24dgopNDlkmgqNB
         5YvCKSdK3Ohd16EwUQ7uit9T5+j6wBBBTi2EXHSruHXfIw72VobSPoyl6e7p4wIiDADs
         HJRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqG5cSpQe2KLjdzVqxyfvBP8pxEPR59zmpyNSeJ+d50DV1wHqvZoG1jvT8u5AtqGxHmf6jL8ncq7YU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU5A8mnUjDQIAP6usU05CLHWWY2+WL0VBQIyvaPVKCrfZUJXJ5
	NExz6pFuboW5UaOGIMH9moRt+Y7MhjWUYDjsr9YlLtAX76RerYC7OivX
X-Gm-Gg: AR+sD10tFf5RPUqoihRB+f7TpGyLKVNhsKgLR4lCY9yVICDfed/tNMgj55vKzvjRGqy
	zLR+s0WZ/0d+5DYGkNlj0l40fdnh5hPjKtNW5tWbKRZF1b7jsHlqR8Nzhgh6cT+xh+fa12USuek
	Qjy5Irw6jsLBEE6i6dGyUyDbPe9j6AbAtxplcRJaXPHvlfHSpFaV1ZNnyVbB0TskQJWtvdMZm/r
	cltsHVnB+x1/HbBRMH5Nko1te5YB0vpJwwBPnsosgPLmfKHWr+fQ4iwhIDLmwzrVb8n/B59SM1h
	/PNHcn2sY+DHlGwCMvfA0Cl7cVMof6YtoCVShi4NFHdGqI8c/LxNmHzJGPJ1HC3Z8Kc1jshTa+8
	JXNbNHQh0vTAtFzOKtTOpjT9oohPITLRzlMgovXLTpWVQihf+Q9hFb1lkYEqoE3PsTuRtjDTt1P
	SQPWAz8PorY3RyIsPK9AhETgigwLlDaoETuY5jb//hP1mXMlV+9NwaKnpmRGiL6nbhg4VJp384E
	KS/vIY2uI8RgD1/GLoWcQb5f7FvsNMFFg==
X-Received: by 2002:a05:6a00:4b43:b0:845:40d1:87fa with SMTP id d2e1a72fcca58-84ee480a632mr2824973b3a.25.1785585258052;
        Sat, 01 Aug 2026 04:54:18 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe57a9esm1602886b3a.19.2026.08.01.04.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 04:54:17 -0700 (PDT)
Message-ID: <a13ae6e3-1f84-477a-9bfc-0a4a55152400@gmail.com>
Date: Sat, 1 Aug 2026 20:54:01 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/ja_JP: translate submitting-patches.rst (tag usage)
To: Akiyoshi Kurita <weibu@redadmin.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <20260730130030.1078990-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260730130030.1078990-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 30 Jul 2026 22:00:30 +0900, Akiyoshi Kurita wrote:
> Translate the Acked-by:, Cc:, and Co-developed-by: section into Japanese.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  .../ja_JP/process/submitting-patches.rst      | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 

This looks mostly good to me.  So,

Acked-by: Akira Yokosawa <akiyks@gmail.com>

As before, I'll take care of a couple of rough edges when I have the
time for a full review.

Thanks, Akira
