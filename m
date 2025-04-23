Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC4422CBD8
	for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 20:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745439134; cv=none; b=eqjgX1mN0j83hlR6YWNdQDbpqmrFK6nKqcSPLQJGkLftGiLKP3RNSf6M6rgTBlRuwzFdFKd8+UjKLE5s4vTQjW5gAU8xQrfskFuouMWGvkNtmlN/lFLJC2UHDbIotEoTViWnt6zrr9iT/s5qmiY6INi3iYVHf1cmbpKl2auBATo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745439134; c=relaxed/simple;
	bh=0oI6H3JU7dXC/ESxQwhxoh6QKaSMqhYZPxTmYuOujis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffwPzcyJloABseqWPonkTXIe+C0Ng/IBouY8dubKt1TygSUo8IIw8pyMcm9ZB9GubY4Es9FORxIZLmA4Ttv9hU4+A/wwNv4sXkS3tHrN/a+DZy6qjOgdzOTjIPWaomSbNqBLsULWqqcfizay6pmzWreyMQtxpXtLZI+yf3bXT+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Sx4d+njZ; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Sx4d+njZ"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-86142446f3fso9415439f.2
        for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 13:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745439132; x=1746043932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GYDwOUZ2pYA1l2ZUcy5ttcsi+e563LieF768X0Rxoc=;
        b=Sx4d+njZD8u0myy2Idfy2VTol9FDgv9JcISNE+jHE6CQueZKiFE+eYfjUA5vhQq071
         2rzgIVtzzDLyobjY6qWZR49nTu5hNvM8TDn8+4yTyJwvygQrnq6gGH55p9cL/fcICEmO
         Up2qdUuFUJSGlmX8EflIKsLZBlixgWYGhzBVB3BdGNDhfk71RgOFob6Hk9/3exrse5up
         XuWE1+i1r2Y6ClPEB2l/ms2irkMltW4wAo38ovXv1gt6CwUqiD/mBZ153RrG9VYw4q15
         ujuA/wIEjrgVOHBlBIN30J5PL+DI+TL3ZV+Mc3p/rwaenGwZtiCXYlbfri6xx4LYoJwa
         lZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745439132; x=1746043932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GYDwOUZ2pYA1l2ZUcy5ttcsi+e563LieF768X0Rxoc=;
        b=Gi5s+9nITcF0OPUPsHjMuRkViaOezJJyJvCkHMY5g42HFUIT/3pHsQGwRrVlCAbrhE
         4MhD4VvCa5HQ8WoP9yKgan/VD725VjMZTLWUK2ajCxWTTDgZ3KfmVQ+INLHniTV3MMIQ
         Mab0L6FlW1W9UV9Ks75wdldT/0aq/w3QBUkGmTox86DcyO4BCNzgK/E13GcyB6zN5c3r
         X04jC1Q6wZSVKKd7M1+9TpXdLGYP/H8UtxtVnCQmIqe0+xYSrwO3SDd8gT4qehs+BgDD
         IlnRBkIChqP/Fmdn+WTwEcFPr9yqHtf7buWFWr9uCDHDai9C8vXSyqnpLJ8suNuH5xOC
         YeCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVgg0BjPqUJj5V8LoCdlxmVqTPswMnnKzdHRuMI7qf+KaQBvzJUdQzKV4yStfAmcDIloMtMmK7WEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVPk3hk2KJ/oY8LHsV6huzCjy+ZRqzHJI8OJzAyGywJY4h/Clx
	SZCeD/Zwq50zoLAKEwRTz1ZZcQkFd4wY6IFgGNQYkMVlMU93nxZZeHLvWGF2B+s=
X-Gm-Gg: ASbGncuK4S2x//063Al4FYMlM/lFAqXHEe4cRzIIGxqX6bHYVtFaAQMSElhKuDB6b25
	dxA9km7KaBnk5GfyJKHZCP1Ype4ESxtvP3SyNETDQic0c/5JAG59t+oHm4cTlhNimL8RuHoMyHG
	68iQBKJzfAdkNQTREUUZx6Xi9PzEbWrS0FEuAIaUE2/HbBriqEoO7aI97FYWzeY1Q2krAOR7LZi
	/t1YCmu9ULLwtqmCUWBaOEBa5XiARcID0jNPkVx12prFiRTNRAstoXof4j6lAKUTFZPwAnR3ykq
	lTWy6dOr0yvginmEc1GUEBG9El9DamWY5ngF
X-Google-Smtp-Source: AGHT+IF9vIk8OfA8cuvvqIlQdjlqT8DUNnmqT7ndDWNAzbdPkvhypxwcvV4DAZpmUzsxMViIR4dExA==
X-Received: by 2002:a05:6602:27cf:b0:864:4a9c:1bd7 with SMTP id ca18e2360f4ac-8644f84d864mr37879539f.0.1745439132084;
        Wed, 23 Apr 2025 13:12:12 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-864447402a9sm43361039f.15.2025.04.23.13.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 13:12:11 -0700 (PDT)
Message-ID: <f57ec419-08ef-4a87-b4ac-fc60c5fd2d3d@kernel.dk>
Date: Wed, 23 Apr 2025 14:12:10 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
To: Andrew Morton <akpm@linux-foundation.org>, linux@treblig.org
Cc: andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
 corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250418234932.490863-1-linux@treblig.org>
 <20250420140758.601ae8abaa03aacb33ce7084@linux-foundation.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250420140758.601ae8abaa03aacb33ce7084@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/20/25 3:07 PM, Andrew Morton wrote:
> On Sat, 19 Apr 2025 00:49:32 +0100 linux@treblig.org wrote:
> 
>> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>>
>> The last use of relay_late_setup_files() was removed in 2018
>> by commit 2b47733045aa ("drm/i915/guc: Merge log relay file and channel
>> creation")
>>
>> Remove it and the helper it used.
>>
>> relay_late_setup_files() was used for eventually registering
>> 'buffer only' channels.  With it gone, delete the docs that
>> explain how to do that.   Which suggests it should be possible
>> to lose the 'has_base_filename' flags.
>>
>> (Are there any other uses??)
>>
> 
> For some reason get_maintainer points at Al and Andy for relay.c but my
> mental rolodex thinks "Axboe".

Heh, probably because I did dabble in it 20 YEARS AGO as we used it for
the original blktrace! I'm not saying we're both old, but...

> Jens, does this look OK?

Looks fine to me.

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe
