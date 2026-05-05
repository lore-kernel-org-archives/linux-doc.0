Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96852492195
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 18:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005618; cv=none; b=eTK/BDUuh5KmJddsu0AIplgPihovkZZPOlVsWUfut23vB7ZfrnN3WNc1DRTcXQCP8jOZf4bMtjRf21I/Dk7ZmxkY1x3bm/eGFGM3UicPx3vP+GzQ1NgqlQODQPPlucFXI0g9IygQlI6iZT6guvf15kEzPvS/OiwAAKSioMr578o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005618; c=relaxed/simple;
	bh=8khDHB/AbzCXgWyOJoGqZIMn/DzCkUOykeK/iZn29Gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7xidMyCbNV0xaLZHYjgvU3P+7mJG7zHT8plx0fFJWAo64YoZk6S9J4fBiKLHQf85NSORgWVVcMwRHU7Czni7fufVz/ido1UJt+2avBYYt896Ts9sJ1g4O6gpGLeuF7KJYrw6ytrS61gRptXRpro2vwtlCAzy+X9PNQNtU/1+xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TN6r1TlQ; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TN6r1TlQ"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7de4ed0593fso3403083a34.1
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 11:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778005615; x=1778610415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhKovcL1mqmiAG0m7OkvSMw8SBAqattxABfcAaxTl+U=;
        b=TN6r1TlQ9JLC7xJRXUm8a8Ra7do7i/l3Dill3ZGALf6YjeWCDpkH7YOqX1CnmAapZR
         5lQO8Dou6ttMhCBcsyXFQ3SNgJtA0D4gO/CRkGM/zVmY6US5v6rIr5SmK+IXw1HE5P1i
         DIiqGThPHCD79Gng/SIXvQ4kEdK1o0oqzWWZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005615; x=1778610415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhKovcL1mqmiAG0m7OkvSMw8SBAqattxABfcAaxTl+U=;
        b=p3foLewZR8vyY7xuX5f44rhYlHW83M5ioc5EEn13ZGLfJGeCvWTrWBKmWLNXv0exd3
         rtm2IcZk95H+/tidTbpCQJWZ2qFZ7GiazMnjyo0f0iFzvOM8pq05lC1y/J/L28L5BT96
         aK2MZyMWt/WG/tzwiutZj9wurH9JyfO3URroJx6Dt5LJj/2w9/AOjZuoYUIfmXen3mW0
         yDo2daO6Qvbwj3ojyIXNEvfSTUoDxOrJSkPn/a6DTmGJFd6GFyBQKjNvwQ7gEJQCgwfX
         H56HKkMVxBDfotJb9VAHrByZ2D5MFRlvRKkSHraHpieDO9UBBrsaIVgn3rl1VVWme6cA
         XOQw==
X-Forwarded-Encrypted: i=1; AFNElJ/9oTjknew9Mcc5QaL0Wri5WLVvcyehx1+QAPdJ0YQlQetJgLYbLEBkFEZ48hOvfLq/rpyuYnEcHxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRurKLvSYF4q0vRlEB5ecWLhTIyfjdgWAQXuBVK1ESnz7IJo1l
	kJOwp7dIb8B85oDBq6FS1JmVw/NpMaQR1IF0ltYIIvqE9fxOwc3KGhUvnI8BcICvcSY=
X-Gm-Gg: AeBDies2Na3Pk+QNS/xqIkkHf4domy9YZZ4eq80j4PNP7e6bC3SdxGql8c/mLJyiN8S
	vhX6elVUnnZm4lqWiEqbh0E9RxyAy/GuuQj7yWJOsR/JzLB4FM6BEcOLfirLagxNlSjKNLoxDE6
	OeAYKZdTeBFuLqqGJ7uFiVdAX82oQKUjM9LKmopwYz7xs6DOhdoM4LQHGiRFcDQya4sJXnDAf5T
	Wq0IMmNABe3IHdyt4UJCCol7DaqXrpa83rywVsFOSEgsL1yFHZce9buLxFofDPuFBqI28K2oULF
	wIfwBSK8qIO0nNDGyUnYmPQoXiXX6PJpAIqTVIxzE5HduemymTI9WCnnoFpCeLCCvbpaMaH+tZ2
	P7tOG8QI8cIjaVkYNLSqNZvpb2r4u49MPjCs6um4Jsf7/h/UfXG7OvELVoem2QfsJ4CAzxjWKL9
	+sG3yyDoaqo1ooe47R27Fv4A/6zJRPUNbgd90POQ8UAw==
X-Received: by 2002:a05:6830:67cd:b0:7de:a330:ecb8 with SMTP id 46e09a7af769-7e17d02b89emr2646987a34.16.1778005615604;
        Tue, 05 May 2026 11:26:55 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deced80854sm10166333a34.18.2026.05.05.11.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:26:55 -0700 (PDT)
Message-ID: <77d20890-c1f5-4be6-ac58-1518f75822bf@linuxfoundation.org>
Date: Tue, 5 May 2026 12:26:54 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] docs: admin-guide: fix typos in workload tracing
 guide
To: Cheng-Han Wu <hank20010209@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260503101429.254394-1-hank20010209@gmail.com>
 <20260503101429.254394-2-hank20010209@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260503101429.254394-2-hank20010209@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/3/26 04:14, Cheng-Han Wu wrote:
> Fix several typos in the workload tracing guide:
> 
>    - sys_opennat() -> sys_openat()
>    - annotate the to view -> annotate the output to view
>    - sys_getegid -> sys_getegid()
> 
> Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>
> ---
>   Documentation/admin-guide/workload-tracing.rst | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/workload-tracing.rst b/Documentation/admin-guide/workload-tracing.rst
> index 35963491b9f1..22cb05025ffc 100644
> --- a/Documentation/admin-guide/workload-tracing.rst
> +++ b/Documentation/admin-guide/workload-tracing.rst
> @@ -278,8 +278,8 @@ associated with a process. This command records the profiling data in the
>   perf.data file in the same directory.
>   
>   Using the following commands you can record the events associated with the
> -netdev stressor, view the generated report perf.data and annotate the to
> -view the statistics of each instruction of the program::
> +netdev stressor, view the generated report perf.data and annotate the output
> +to view the statistics of each instruction of the program::
>   
>     perf record stress-ng --netdev 1 -t 60 --metrics command.
>     perf report
> @@ -349,13 +349,13 @@ times each system call is invoked, and the corresponding Linux subsystem.
>   +-------------------+-----------+-----------------+-------------------------+
>   | geteuid           | 1         | Process Mgmt.   | sys_geteuid()           |
>   +-------------------+-----------+-----------------+-------------------------+
> -| getegid           | 1         | Process Mgmt.   | sys_getegid             |
> +| getegid           | 1         | Process Mgmt.   | sys_getegid()           |
>   +-------------------+-----------+-----------------+-------------------------+
>   | close             | 49951     | Filesystem      | sys_close()             |
>   +-------------------+-----------+-----------------+-------------------------+
>   | pipe              | 604       | Filesystem      | sys_pipe()              |
>   +-------------------+-----------+-----------------+-------------------------+
> -| openat            | 48560     | Filesystem      | sys_opennat()           |
> +| openat            | 48560     | Filesystem      | sys_openat()            |
>   +-------------------+-----------+-----------------+-------------------------+
>   | fstat             | 8338      | Filesystem      | sys_fstat()             |
>   +-------------------+-----------+-----------------+-------------------------+

Looks to good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

