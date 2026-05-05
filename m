Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CAA3BE646
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 18:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005640; cv=none; b=qKh067l92M6MvGObt2RQ37Ie6kflnpW6dBIhAKVgZy0SR7Fs3bE04S4BODeSeK3SCUp9ACyH/il6IdL9bxLZoViugO6X67BFbfi+Bxj2RFX3HwcJDLQH/dR8xE90bH2AJJLlYwH8GFARKgE93xoqAS48RNzUjoXGNYAzHfbyxmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005640; c=relaxed/simple;
	bh=GnzNxi4VDbwMXMgQNZmJ3WMbd3Sv0fulXwgLd0TlyNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7WYiMNJcQake1QodUmE+rF7dztTY5cV1ipXOIfyUf813GqX92yOIiiHrOg+UOsAicGXUQWxhuDxeMV2ngrv5UPIbunUcmqVDT70p5cDIJ4LIqCsM8ye1PxiGesfZ0su1DT/+Cf7LFvhMyjeQGxpBavkMAE5PIbWjf1NokhC/kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bLcEgGVb; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bLcEgGVb"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dcdd23fcdfso3034630a34.3
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 11:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778005638; x=1778610438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=INsVGbIPl7/iSrn4XtpBL59W3mw3kYeTKhUzH3YtbV4=;
        b=bLcEgGVbcJSgByGM0CmFDYaOSohIJkmYEJ3KiDQ2lEjonxLT0dDgTUI3K4oN6FAL5K
         sa5AgoA9C9BG4rRejQCITS4Kdi+zhYVlxZNy+H5CT5Fi4Zf7JH0htQrRVdEFIQ2IeU8Y
         dVYrGeHR2EEQu/oOi2PbwVNx1Qkx0QCo/cyMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005638; x=1778610438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INsVGbIPl7/iSrn4XtpBL59W3mw3kYeTKhUzH3YtbV4=;
        b=JOTx9Zb9XWw6chJ3LhAeMsttZc2hPRU8d/5rAohQDhgJA35OTpXeC49l+4krD6N7Aj
         I86WU0h6nSBdMGD+zRZEmYm2Budgkr+ACfe/LoaPZo8BCwQEFI4Aro3Y+V7wfnmgoZd/
         Z3Ek9GY8PnuaOcq3YMf9aGmnkqlQTYLDuAF0xoCsFsSOyta97j3pYLDwBmWgA3LpfxxR
         X7eZDfzYBEOA/zrz3/7GHJjFwqR6E85bnxgpxXuxIH1EF7VzfJ9eCjuxNvjLGRCSdxIX
         58Oa+GMncY8nG4HOuGR0FPkbD12nyvKHcsU6+urGphfCAsMH+RDR7oeNW+IFOF4rxvcF
         w8yQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NuiaIPK4XtaGdKWfduKbmuVYbCRqV5D9xyOcKkTeO0heVeXNywrTVHaDzXqMzn3GD5xoAxt6ZtBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBLu8P87/HiYMgJaY4TSubNCeL657LWZxcp0t8imR2I9SsG1JS
	nzGasHVHvx9UzCxSuXosEbe4yGSNxdQPaJi+7YM2L7RyIngjvYHzPgi9JXFpb1hhhfOjolNHv/r
	WoQLT
X-Gm-Gg: AeBDieunqSpT2X6w1x0eg/xgvCHhdHXj4la3/Akhh+Hwl83eGAwKSD2eg+STzpO51A/
	alGJLAv0K56f09EvsvybqpYIEbgzO8iEeYvYoTkrH7DrDl+CgDqi6iATjRNF5k7FKCrB0edUCzo
	jJB0E0Ul40W0xo9Eg5Qw8A5S1dp4IVUWzWxZilypgdbdGuFNKS8zUxjEtk34yVSz6InQVcsqBtq
	1qVNB8DUHtTdILHaq8M7KNbC2wLoVlNX8KIWy+207PLhd+Ca0dHpC6eN3YzgHM9R9C7kXo4U/VW
	qq72JFHVXjfQb5LkQs/MEwm6Xv/Tx2MKR1YNBD9RPMGi8+ivjHtzMCgumUv2di/5irn49x/G189
	ejNQX3sw85rp2CziTiROkaoVyTnAeuyQWzhBu0phMwadC4+lFXPdz9Olm2zrqHjoAjYweKEfpmW
	rz+hUGNywzbuX1UMNB9MZT9/w5SBQ9hIzvfT5K/FtWZA==
X-Received: by 2002:a05:6830:6a90:b0:7d7:5113:f83a with SMTP id 46e09a7af769-7e1887488e3mr2478049a34.25.1778005637658;
        Tue, 05 May 2026 11:27:17 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deca826dbesm10544244a34.12.2026.05.05.11.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:27:17 -0700 (PDT)
Message-ID: <c3ae10f0-c409-4adb-af58-45fd7c8a530c@linuxfoundation.org>
Date: Tue, 5 May 2026 12:27:16 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] docs: admin-guide: fix stress-ng command examples
To: Cheng-Han Wu <hank20010209@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260503101429.254394-1-hank20010209@gmail.com>
 <20260503101429.254394-3-hank20010209@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260503101429.254394-3-hank20010209@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/3/26 04:14, Cheng-Han Wu wrote:
> The workload tracing guide includes stress-ng command examples with a
> stray "command." word at the end. This makes the examples invalid if they
> are copied and run directly.
> 
> Remove the stray word from the stress-ng example. Also use "--" in the
> perf record example to clearly separate perf record options from the
> workload command being recorded.
> 
> Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>
> ---
>   Documentation/admin-guide/workload-tracing.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/workload-tracing.rst b/Documentation/admin-guide/workload-tracing.rst
> index 22cb05025ffc..43a3c8098654 100644
> --- a/Documentation/admin-guide/workload-tracing.rst
> +++ b/Documentation/admin-guide/workload-tracing.rst
> @@ -271,7 +271,7 @@ exercised:
>   
>   The following command runs the stressor::
>   
> -  stress-ng --netdev 1 -t 60 --metrics command.
> +  stress-ng --netdev 1 -t 60 --metrics
>   
>   We can use the perf record command to record the events and information
>   associated with a process. This command records the profiling data in the
> @@ -281,7 +281,7 @@ Using the following commands you can record the events associated with the
>   netdev stressor, view the generated report perf.data and annotate the output
>   to view the statistics of each instruction of the program::
>   
> -  perf record stress-ng --netdev 1 -t 60 --metrics command.
> +  perf record -- stress-ng --netdev 1 -t 60 --metrics
>     perf report
>     perf annotate
>   

Looks to good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah


