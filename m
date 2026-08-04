Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50A4418A2D
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 21:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785877589; cv=none; b=A0E0SYxVtKH4ptDpip+tfpreLxR3r8ugRar2PY21M0dh69SLNABbF73k1N+/gSo7jIOiN/vXfYIDJ7HFVCsQuOwRiR6SRrFK9whnKY7QrmOJlQ7WJ+jFrjEpHTd85qQRdVwGcRBH+Hd79SXQKf4RPwFgLtykuaxpD+eIiagHs1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785877589; c=relaxed/simple;
	bh=pfxpbIeNFSc0ZoYnjnPfD4XHfZ+dclFczBOLL7vzNQ4=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=dqDWUvb8lNMNe7uvvF7eGuAru3eoRLrwjXYsmgvP8R1At0ZQ9zynxNBqPZaXa28CbKlnHih9U0BxIKr03Gk1RFbhLq8LfI/0Wci+MZ3PBUQstdohY6wPgXeOzbjHZxvSf3SqrEbhMMjuuLNQo3WPZVe4eymvdxfW6c5/teBqNMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VAxrX+kA; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VAxrX+kA"
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab4af22d09so332850b6e.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2026 14:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785877587; x=1786482387; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i5gQ2rzJspE7/RJU8+W1PyPQZBbheaHsGbRmii6HKrA=;
        b=VAxrX+kA5FQwKeL5zZ9VscSZ9ZYnlN6k0HLBpqDAV1U028F5dQuAUi3W6WCaWpSzD7
         oktkwBhVvrbJ9Nenh67kHwEZW+eMlofty50B3CQk/m/J5u+INJkq6RmjzAXOomgY7ROg
         KHby4ZSeCHgVS4P7phUdcXmWnJN3ySMnXkRRgcL0OBdoeqbCUDHH9et3n+YMVcoiBMPJ
         nUCL8Pgl/8UirWZYl7x2Av2mh3G70Anvdz3+RQTag9dxzHiGDl/pm+WR4jSbd3n6n3vX
         Y8ET3vSwLdfYpjQu0Mg5wLZk8yEKcfiCNr9Tto/QD8hievdduOqqMWC8685g8+TmMA74
         K/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785877587; x=1786482387;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i5gQ2rzJspE7/RJU8+W1PyPQZBbheaHsGbRmii6HKrA=;
        b=lf3E2o7NUb1p+7BQN/VgzpM38faIRmSSqMvJGGn34/KNBf/CzSXyvaGr6thNQ99tn/
         /q+Ifgoh9NpWutbA0L+Djr9gJtIPOh//JSOTcfq6xlgNq3IJSKmYBcbGZ580wvr2FGEI
         R8N1UAI/26V/jsCNSI1TaqRC2PuLKqZbrWrIXUGx5+CCaEzNzOlNVFVxUvv+JY93Fhc4
         ++xKVSFDF8KXJuFOnoQpAAl08SbnVE0+aKQaeexRbF+UtxUxQEaZgbOjeX791BUEb5kl
         gWnaz5yiQucxWyq3vLAemzF1ffL0+cG0QOY0CayHWWQaHZsJbLbyj7z6hYiuMIO6zqUo
         jHsw==
X-Forwarded-Encrypted: i=1; AHgh+RpITXH0C+0wbpB03PdLiR32EanZD1WoH/4fumkYZ4aMphjsCHkn+7EsLmsZ8p/YOm23rJfFG26iSUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrSiBPug1WxMGntHb8DeX7fRTcInGrX5x2kHczFEhT6LvLm53P
	bOK5OHr0NWR2D1TmtU6U0KuyRpfYGmHuG6j+C54wmByv10fb+qi+bywZrtkQtLYgGSQKsAdM5h1
	Hso/N6fpqkEBw+NVluKglpxaQDw==
X-Received: from ilhw4.prod.google.com ([2002:a92:ad04:0:b0:507:c444:90fb])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1587:b0:487:61da:70fb with SMTP id 5614622812f47-4afae0c7caamr886481b6e.10.1785877586456;
 Tue, 04 Aug 2026 14:06:26 -0700 (PDT)
Date: Tue, 04 Aug 2026 21:06:25 +0000
In-Reply-To: <2941da1a-b0b4-47a6-b57c-b28703dc0454@linaro.org> (message from
 James Clark on Mon, 27 Jul 2026 12:04:17 +0100)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntse4tvbn2.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v8 00/21] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

James Clark <james.clark@linaro.org> writes:

> On 23/07/2026 9:57 pm, Colton Lewis wrote:
>> James Clark <james.clark@linaro.org> writes:
>>>>> When running the guest on a single CPU I get different counts for the
>>>>> same event for a single process, although this never happens on a  
>>>>> host.
>>>>> I think there might even be some Perf tests which expect them to be  
>>>>> the
>>>>> same, and this doesn't depend on whether any events are running on the
>>>>> host or not. Not sure if you ran all the Perf selftests in a guest or
>>>>> not?

>>>> I'll investigate but I'm not sure perf is intended to guarantee
>>>> that. perf stat just runs the event counters but may not write or read
>>>> them at exactly the same time.


>>> Is that true? The perf core calls perf_pmu_disable() when a process is
>>> scheduled out before reading the count of each event of that process in
>>> an inner loop. The perf_pmu_disable() clears PMCR_EL0.E which freezes
>>> all of the counters so they can be read out in a consistent state.

>>> It's important that they're all stopped at the same time because
>>> counters might be used in metrics as ratios of each other. So I think
>>> it's deliberately designed that way and appears to not be working in a
>>> guest now.

>> By default I think perf assumes events can be measured independently, If
>> you want to guarantee events are scheduled together to avoid measurement
>> skew you need to make sure the events are grouped.

>> The common way to do that is with {} around the event list:

>> perf stat -e {branches,branches}

>> Please see if that resolves the issue.


> Groups only change how the events are scheduled, not how the driver
> starts or stops multiple events running on the same PMU (grouped or
> ungrouped). In my repro I had less events than counters in HW, so they
> will always be scheduled at the same time regardless of grouping.

> I did notice something extra though, you have to first open some amount
> of counters, and then open more than that. Then the second time the ones
> with different counts will be however many were opened first time, as if
> some state has stuck.

> For example if I open two counters then 6, the first two always have
> different counts the second time:

>     $ perf stat -e branches,branches true

>     Performance counter stats for 'true':

>               106129      branches

>               106129      branches



>     $ perf stat -e
> '{branches,branches,branches,branches,branches,branches}' true

>     Performance counter stats for 'true':

>               117013      branches

>               117013      branches

>               110364      branches

>               110364      branches

>               110364      branches

>               110364      branches


> After opening 6 again a third time they'll all have the same counts.

Interesting. Thanks. To clarify, is this happening in the host or VM?
