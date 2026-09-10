Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100043BED7F
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 06:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021871; cv=none; b=Klwbe7ZdekMMul4tdK6YJGvDEOMqqobt7PTXh6Zsez6+EeJEUlq8Xe0Qv7nuQyT8WEuRNkKeVOK2uN/yc5oMCU2HWs6+McuQz/0gctkfxuLjArFU+PfxtDJCC6vdcA8CNBf1Kh0JpoNCkm5xPx3D/LLkwwznObrse9gEUe11Oo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021871; c=relaxed/simple;
	bh=K5MCWGaDb9+Usu89p/nhCacCUBAdkl7T6O5WGidxHQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxE0jEIyz+sXsZipRs6t/0LEPZrxKkj3kK8+TlPCsE8NE6Zk3SEke55m4TBPKhWzKii96kHfnTWoOv0uzu7BTRWfP1f5jHFNWXh62ZoEj2uZ3J1E9R5wAYBw4fD30XUT393uMER/ZNWLU5yHZQwfDtXvjhQXdrz1g+o4mrnyPQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DLXi1bzp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MhDWU+w3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DLXi1bzp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MhDWU+w3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789021868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uNvskUkqFZbQpRJgmwdtmrBCyRkK9l89EkCz1aQmZnU=;
	b=DLXi1bzpVDHFKNm1Xjz7aOVOFZHgubo80yMeyQ0deKxuqZpGq74EO3SlgmNYoZrgXKATVx
	NqKp7S3KSZFVcgKP/kv6EsAQm9dmsN/FfjESz4k6KB8gvCvP6PSNThnwBWz5QzwNGQfOSO
	WvfFpoD2Qybnc4kNdqhSH06TYpJQtQo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-sSIhbHZVPxu9KHwHKB68RQ-1; Thu, 10 Sep 2026 02:31:05 -0400
X-MC-Unique: sSIhbHZVPxu9KHwHKB68RQ-1
X-Mimecast-MFC-AGG-ID: sSIhbHZVPxu9KHwHKB68RQ_1789021864
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49d156c917cso3349405e9.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 23:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789021864; x=1789626664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNvskUkqFZbQpRJgmwdtmrBCyRkK9l89EkCz1aQmZnU=;
        b=MhDWU+w3Y+5frC/WF5QUoa6C0pwu/Md8TCJuTO98kLmPW0742EX9GP91PrX5wwN+kP
         KVHIVac24wRWz7lrwFkD9XAlWsq7YnV+v97s7wVwsZKOmWrb6aQLNoyJA2hdI/Pvfx7D
         jl/YiXFuyJ9aaH5MFLTnDLv8Ed+sGPKF0lmyggLhe0rjvxUcmari7hrhB5TRGHRbTEGD
         mPn07mx6gRF4jX/EETYXkNz3xAwYAU0Q+rsuo3+mXX2KlOuw4TmnYq0f75pOoo2Z2Te4
         W24rH35Ep2pHPwAew3V+NeyrHcCwWNSGlDzpNn9aRSikFOmIzEQcSMuqWRprElEaN+53
         DugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021864; x=1789626664;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNvskUkqFZbQpRJgmwdtmrBCyRkK9l89EkCz1aQmZnU=;
        b=RLudWFSKcr6MvrCvjGo9It5SIJkKGbqGOjY5VGg3zMc79k1LI1W+tY+P+Dc+Id4UgP
         mUvl0wUaimfPez0IAOqxGO0ze4RHCp919ALoOju4bI7LLIoP+EL70hZaZC2ValQVUI8b
         WaPXBjNrrt1CPfJREjPF6GGwiEXJlJMmIDImd7YSIgiZFvY9obLk4DgFTTk3uTjKsEGj
         cMmn3hImBDiUun1nMH6LuxP3rffKnBfL73dnF89QV0VqTWctj/orQx/Aqs1Xvt4S5ZRq
         2w0arC88LTGlcC/IJq49CRR0CS0kyqhf5pl+RK8yXBy/VXDnoDxSh95c4+SdCoirNW1v
         vJiQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/2schVdkRJ5i2ZGj0c5wUVmQ3mixI6nYyGkLm55EXgYl0VKPdIi+XUsnYArVMZjQB+g/UJokoD+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lIeA111M8ikzuBwWHvryOwpAlM+C82XzlUfotFuEmCxbU1Iq3L
	x8lWCvnww3ESxGHA0fdqNPNijQG5z8x4Pa+T/I9iPFkA43t/QH2ieR8d/gZNfrZEeaCaoeAIwk1
	OiETPnYdE1VcoKVB8+SU6y/mC3yvC10FLkvhoPb+l5eq4+QzgqPWn/TKB6SZ7KA==
X-Gm-Gg: AYBFou0bFcY8UBIJq0p+1lMhuZ1/GS9rGo6wKv/ekmj1QCZBJRElCd+Wc4LnpzBpwtt
	Mz2EE+FlLGdePekqNcKwBYAGkpUkyMAeC/gKiI2HL8TofyYjSlSIWYnbC+4R0jvxrYiscXOhUNQ
	Y+SIc8XT//05UK6K8DVs/77bpdZpujXYTho+wt/WqEwLwiLFtYEeJaWgZjgCV1ZcURiQoebGo9p
	NH0dLK4co10O1/pMOSAqd9IblilJgH+4ArUT00PwayKHwYgCCsvsoK3SjFopv55GWr69Ik29t9a
	iQD5mBDAZArO8X/dNSVmx7isWLErVpufgkIM9BHvulXmkyb51eTHd+hrdzzhTiYfCN89cddddKA
	rv61EH/mp3u9xsgZSnfcUduMRayU5N/rkC/jalX4wEcJxTX7C7Oq5tZT7spFujtWyS/iXUOqFoQ
	==
X-Received: by 2002:a05:600c:8b10:b0:49d:1e79:35d6 with SMTP id 5b1f17b1804b1-49d26dcaa22mr30713725e9.14.1789021864404;
        Wed, 09 Sep 2026 23:31:04 -0700 (PDT)
X-Received: by 2002:a05:600c:8b10:b0:49d:1e79:35d6 with SMTP id 5b1f17b1804b1-49d26dcaa22mr30713235e9.14.1789021864004;
        Wed, 09 Sep 2026 23:31:04 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c38e3asm52660975e9.9.2026.09.09.23.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 23:31:03 -0700 (PDT)
Message-ID: <6c019cad-be78-441c-a556-05dde12a53d9@redhat.com>
Date: Thu, 10 Sep 2026 08:31:02 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: run netdev work under the ops-compat lock
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, sdf@fomichev.me, kuniyu@google.com,
 linux-doc@vger.kernel.org, davem@davemloft.net
References: <20260904180058.3803849-1-kuba@kernel.org>
 <3e210ef7-f807-4de7-935d-09441710acbd@redhat.com>
 <20260909182215.14b5d94d@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260909182215.14b5d94d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 3:22 AM, Jakub Kicinski wrote:
> Oops, looks like this has been sitting in my outbox for some reason
> 
> On Tue, 8 Sep 2026 13:26:52 +0200 Paolo Abeni wrote:
>> On 9/4/26 8:00 PM, Jakub Kicinski wrote:
>>> netdev_work_proc() took rtnl_lock() for the whole batch, forcing
>>> even ops-locked drivers onto rtnl just to run their rx_mode / ndo_work
>>> callbacks. Take the per-device ops-compat lock instead: the instance
>>> lock for ops-locked drivers, rtnl_lock for the rest. That's what the
>>> callbacks already assert (e.g. netif_rx_mode_run() asserts
>>> netdev_assert_locked_ops_compat()), and non-ops-locked work
>>> such as vlan ndo_work keeps rtnl, since its compat lock resolves
>>> to rtnl anyway.
>>>
>>> Without this adding more uses of ndo_work, for cases which don't
>>> need rtnl_lock feels like a step back.
>>>
>>> We can drop the comment about the extra ref now, with the relocking
>>> it's a necessity.
>>>
>>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>  
>> Dump question: can the `netdev_work_list` work list grow significantly
>> under non pathological conditions? netdev_work_proc is now going to
>> acquire and release the rtnl lock n-times for non ops-enabled drivers.
>>
>> Would it be overkill trying to acquire the rtnl lock at most once (i.e.
>> keeping the netdev_need_ops_lock() and legacy drivers on separate list
>> and process them accordingly?)
> 
> I haven't seen any evidence of such relocking causing issues so I didn't
> want to complicate the code. We have a similar situation in a number of
> netdev genetlink dump handlers.

I see. I suspect containers orchestration/control-plane heavy
application could notice if they depends on the relevant handlers (I
think at least the one I'm less unfamiliar with doesn't) when the
relevant change will reach downstream.

I think we can improve incrementally as need (at least here should be
quite straight-forward, for gennetlink dump handlers it looks more complex).

/P

