Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD729355030
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 18:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763576676; cv=none; b=Px5VVf+do4yexBZZZ2wM8mlyBaCOYGrt4Ht2nl1q1EET03gfBPNBdDntjwF7axnHh3+aMc8PkPGU28taemGjPyZVn3BdQfG23XRh9dcNatt8HJJAe81FIYw9akz2xVev1O/SSdgXvCYEEPSefEz0DLmZXKAWGQ4rIF6f/vn7sx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763576676; c=relaxed/simple;
	bh=d2VKNeBI9mdU3CulQqLDBXeD89R8ghbqwp0xbHbIKDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DOdNgXulVUqc+aRqKeiINEDZPEcWIvCaUQTQMSqTVV5FmZ5aGn+ELqTwWLvPp9eI3G2/CE1x8vOUjt5FULzRW+IfMuz2s4pyuhYku8ys44RNekoYOe/2FFN5+PloBiwPoeZtTNel+0ulaP0GC+BxTB5Ggm2hmKJQ/34kGpVc1/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NHB56gLK; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NHB56gLK"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64074f01a6eso2653179a12.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 10:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763576666; x=1764181466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXp2uUfyAn7qQSV84bcf4nMWFAwyWFqJON+TttJbAcU=;
        b=NHB56gLKbXdEvERiIKxyKRzQy9x+BRJO0FalV2vWqUvsDwCie6WhACfrN9e36qHhJG
         OGpSc25nBLdINljnrtbcWaXr3kHm5dxGf0IyXFcfK4WZma60ovr/3E0doiG8m5vj643e
         mriYNHJ2bsjrcqiN2uO/CUNNlORYDELZ3r1mrN1g7c6GkCoiTvSnWQKAj3EjRL5lIGCG
         oRlG5Q/VRcCNsBAAfLsApgXoxbL9PG3ka/MMCPIVWRWXSJjbGggV6lyCKu/VgSv0dZKK
         25bBFCR+Uj3S5mAGC6qgXTaRuKtSvSx5Hs/MYXahRdJSseagBo7onsRf697vqSx8U4+u
         eBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576666; x=1764181466;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXp2uUfyAn7qQSV84bcf4nMWFAwyWFqJON+TttJbAcU=;
        b=hauLVvcZP2R3Jdcv9+431VdXBfOrj1OilaKXH3IqyDGfaxabPGVPVCLR0/Dc5DraKE
         F5Hsjk06dR6Cvf1B5rhVdP8M2Zlimz78+krKS29Gg0164g8RbBLMg1WytIx39L7FG55a
         QiTH+icv0+ONgnA9ELGq10Ztz3TvcpSNqJ7tKLklRquyjdJiDiL01T2AIcKUAyn7PXPM
         oTQLEWRI61siUR5RC8UQab9/9jKqAxnIM/8sjKoaKWLo05K0nSCRd9yrQkVzJbs5J8Ie
         J+X2OqKNOFy80vtMqtYtcBUMsV1fEnLpemU7NFtBEdswNtDAnLN03/Y1WHUL5Yc8tj7M
         7yEg==
X-Forwarded-Encrypted: i=1; AJvYcCXspwm2d37xTCswNqdatL3Nb8y1UE5YrUqz+HlNW+izIiC87xZa/YsfqfjYVgXVEizV8rIY7iwyp24=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIbUQpxCPfrnXUVbgm1H85s7DTBCkHNIvGRpuqzn8syKTPW1Ai
	Q5liGjRqCU0Yj5biQaAokan9G5JWO2LlqdOOcaoXLbehcjdLQoAd/SYEeE08F9z3NiY=
X-Gm-Gg: ASbGnctEq69d0uhBIdeZSw9sN2VyhTNNowi2xCV87K8/aJTrhVoOzDrJBFQ8nTehjGV
	dlQ5v2Y0YUZIDZKVKQa8b7dEJSLEm2H8q8R8MTMw0wl70hYxGdd9TwB7bwN/h0A8n+dWrSs2RwW
	4IwGrdtPJUip9ekewfnshe+sUqyblKg8+tD708IUJTsIa1TtFrC4m0Ro5Yx+1ZsW3EXf9naPgGe
	LIR27qDVY057c+1vdzOB1Wxd92OqxdQjZENvwmZICL6wW5Omff18V2dSPxSgX/FtoQ0SSotGmBK
	UdpAi6BKgfRuEuw5Jt+MotOCZPeE+QQreME2QjOWIr2Kb5HoFE40sNObYeXUGSRkjWv1UkG9Dkz
	RSmNue5niS10SgYn/5HQ8Kv7mdxv0ItBsgi51x4Js49vIGZLwKGra6C+0gqfudsqEUXPzU51uqE
	41BualLX9HN5UIU3CCclJxw8QkcIj6/PM=
X-Google-Smtp-Source: AGHT+IHFWcpqhe+aEp30Ksls0LghzQFo1sGYaD1WHh6eJAE08Lx/+/aqM6jp4/gMRRi4U1LtQQLFuQ==
X-Received: by 2002:a05:6402:5247:b0:643:129f:9d8e with SMTP id 4fb4d7f45d1cf-645363e41d7mr312140a12.8.1763576665944;
        Wed, 19 Nov 2025 10:24:25 -0800 (PST)
Received: from [10.101.2.140] ([93.122.165.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363b66e5sm169342a12.14.2025.11.19.10.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 10:24:25 -0800 (PST)
Message-ID: <b0102b82-9ae8-4e01-ba27-44b78b710fca@linaro.org>
Date: Wed, 19 Nov 2025 20:24:23 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/26] Introduce meminspect
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com, tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-arch@vger.kernel.org,
 tony.luck@intel.com, kees@kernel.org
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119131534.392277e3@gandalf.local.home>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20251119131534.392277e3@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Steven,

On 11/19/25 20:15, Steven Rostedt wrote:
> On Wed, 19 Nov 2025 17:44:01 +0200
> Eugen Hristev <eugen.hristev@linaro.org> wrote:
> 
>> Once you have all the files simply use `cat` to put them all together,
>> in the order of the indexes.
>> For my kernel config and setup, here is my cat command : (you can use a script
>> or something, I haven't done that so far):
> 
> Interesting.  Hmm, it seems this could be used with the persistent ring
> buffer code as well. But if the firmware does not keep the memory around on
> reboot (where the buffer would be reloaded), you could mark the persistent
> ring buffer's memory to be inspected.

I was kinda hoping I could get a chance to talk to you about this.

I managed to mark the trace buffer for inspection. By using the cmd line
argument to have it preallocated, it was very easy to just mark it for
inspection and dump it on a crash, as a dedicated meminspect region.

> 
> The persistent ring buffer creates a single allocation to hold all per-cpu
> memory in a single region. That is, because on a crash and reboot, it
> expects that memory to be at the same location and does a verification
> check to see if it contains a valid buffer. If it does, it will recreate it
> for view in the instance directory of choice.
> 
> Now if this same range is marked for inspection, you could then download
> the entire contents of the persistent ring buffer after a crash. It would
> be trivial to update trace-cmd's restore functionality to rebuild a
> trace.dat file from it. It would require saving the event formats of the
> running kernel before the crash, but that's not hard to do.

The problem is that all the meta-data is not allocated inside the
preallocated buffer. The meta-data is kmalloced all around the code. I
mean the structs that hold the information on what's in the buffer. You
know what I mean.
And all these kmalloced things, turn out to be in order of hundreds just
on a kernel boot, which I tested. This is not feasible for the
meminspect table, as it would get overcrowded very easily.
I thought of perhaps trying to kmalloc all of them in a dedicated cache,
but I haven't progressed on that. Another idea would be to try to
recreate the meta, but I have not found a way to do it yet.>
> That is, by using the persistent ring buffer code with the meminspect, if
> the firmware doesn't save the memory across reboots but allows you to dump
> it to disk, you can enable tracing within the persistent ring buffer, on
> crash, extract the buffer, and then use trace-cmd to rebuild a trace.dat
> file that you can now inspect, and see the trace that lead up to the crash.
I used 'crash' tool with trace plugin and I am able to see all the trace
contents, but, with the limitation above. (To achieve this, I dumped a
huge area to include it, so , not feasible for my goal )

> 
> Now I don't have any hardware that uses this feature (not that I know of),
> but if others find this useful, I would most definitely help them implement
> it.

We could have some drivers pass the inspection table and then store it
in ramoops e.g., tapping into pstore. This idea has been going around,
but I have not had the chance to write a pstore thing yet.

So , I was stuck, and I was hoping to talk to you, either by email or
maybe at Plumbers in Tokyo where I have a talk about meminspect.

Thanks for looking into it,
Eugen

> 
> -- Steve

