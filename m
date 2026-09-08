Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D5F52ED2E
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 11:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866828; cv=none; b=jcNwsFP0fvxi2Y7UViHDiucJykYyMWwn5gq+Sipb+81hO5xAger/27Rwu6sM0abEaCwuNFxwbvfQ7j+dIJh+NIhgD7ggrijgVDoIyo9hsdbk7mOx7IiV4ZSwjfy7OpAfesSBiQNNVG5UEHitPyRnTUnWB/3FN+yzgg0paEIp+Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866828; c=relaxed/simple;
	bh=ZlvQEaSbZo4H1bDmsspv6kSBdLiYLaGz97cLJBzZfqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JEh8RV4c73BSxihzQYiUTTg3pmS7BUVPaOoKjFxnth401LnJDG84Im3WN1VlCYt0hnBHmsT4hX5q9STivW8KlFQ9SlVyWiw9vFgRLZlCGsKsbdCw3RfRVF8QZ4HgR+ckL/gR18RKmR0SYvY4ufQTQBUpHJydKp8vVH8t5PdA3TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KT+Q+msk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=s9SYmMwj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KT+Q+msk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="s9SYmMwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788866816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RbWEa5Bde75USO7Z02DseODnL+IIRgvkNImN2z7KE5s=;
	b=KT+Q+mskycUDb1I5l3D2ESBVM0vf5jK2iYQjA5cXMIbveAuGCS9ZvPdwYq/F7ubY3bphTQ
	FjI8rU4044fRyX2q0clZnHV6ZfqRWEkvRoUzFwae9iQV2tdqJo7Y9D1v6rvuqF9ePqOGsi
	1Qa4YUFEXikGqKiC33Su53FwlWXSakc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-eOIzZGJaPb-yy9ASieO7lA-1; Tue, 08 Sep 2026 07:26:55 -0400
X-MC-Unique: eOIzZGJaPb-yy9ASieO7lA-1
X-Mimecast-MFC-AGG-ID: eOIzZGJaPb-yy9ASieO7lA_1788866814
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49cf5bd2f12so61584665e9.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 04:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788866814; x=1789471614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbWEa5Bde75USO7Z02DseODnL+IIRgvkNImN2z7KE5s=;
        b=s9SYmMwjz1oXEW2c7N8nRHvgN3XCP6pn/bALQAv/c2a7DwTaMylzvuDmiUdqmFYjd9
         crsk684CQYMZhyP+T0Q2Hkw74KpqJ9NA0OaWMPlicuqE03RN9sqWW+VicBs0XLr4gNAS
         SR7cpEYa36y2xVUzoepa4zJCti9N6JrbE+TPHkN8RsaOYfbTTlz4cUI2wS1iQirNysPr
         mjY6p6svPDUkhb78mJJhnRqIamTXSPi7K6bAvj6JBjeQnQYAd1nlSLFKiCf067SWlrt1
         xYB2itzLBrHkVeUmWySYauL8NjsRbkaqbTcXPRtZVionukEMRK5CbGoa93XYWTvG8LVF
         HNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788866814; x=1789471614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbWEa5Bde75USO7Z02DseODnL+IIRgvkNImN2z7KE5s=;
        b=q3XhsLcprvzJoalOqjpP7zqf8eDudhQpMTm9y9h4plOyDqqtG6UX2PmrkeS2pbWbRt
         qmCYEP9bwy83pmQ9UmezzRljA+S8Xb0i+/jTY1rOM1uWlUzFUUvE525VbUVNo1Sqa/HK
         8xlSHghXOs4BcrATyB2rFOFsKkpDTBj4ZGEynAt+FLiaukXMfpK0aKrPEyQpffvMg9kS
         nL2Np/gweyMc2JpAFt8gMnL/4MwA31gXL2JQ2k8OS8oaF0IL3040/nswATICwnXs9aGj
         DurFnxe9/Ith9ienK0TOsWlG3LP4hcB4lvVM8dpmhhGIGcUICDfX2f1ehnPtZPN666XW
         uGFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUN7+iMNUYe8AYrmfMzEJqKhSwI1fu2BJ89pjmH3LrM55OveEqayVcEMAiDfBYAAn/6bzVAIi5p9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++m+tE9hxK3tOjXJ5OaWJxJMiAJv+rnVqd9J5h1GUKL+9swFRl7V
	g8cMo0L3gzIQ7HyPnAaAPcGOvNGJd85Q/Bj7aG17cfSBgiNjOaYI1SCiL4Skdp8drrOE4sSUhAC
	4U2jEDyEs6LKzDyrtvpAEtwWUrtflvW0iWdCs0VoMlCYgNrriHtFqCkcnsmApEw==
X-Gm-Gg: AYBFou0QJMZi0zkWwf42t9IPB54Zn7w5nWUIR8HzqUemr1MMKb5tXs1A47Y/hgBxp/W
	Y7RMz8yU+O+7WHX07TclxQ9ceaij2WBAVNWrC7gZyk24BMHwPtKz20CEUP1n6TvJ4PWJxXWAKuZ
	dLgzV+LlzKOB5is+XBCXTP8HV4uGU7XLOG7FdNKd3gP5PyAu49n7CDjKff+JvkoI0u1qAgsMHce
	btkqfN1CnKHg+d7lWcwUePw7dmeRhBVPlUAz2TvEZlqcuCVdp2JoYqypn3w+AhrdwY2xGJZgHz6
	OPSxWws53NG+ASgpjv2VJMKmDi0hHSzqYhtGlWWclmh/0LG1yHn2uSB9Dn1zJnOa6KyqwCdloji
	8evPpu6CpxosARo7AYwihVHi5gdOMy1UetRhueOYu6o0/pk1g3f10pPs7DeiigSFR9lbr5rJziw
	==
X-Received: by 2002:a05:600c:3511:b0:49c:fa21:1c86 with SMTP id 5b1f17b1804b1-49cfa211cd7mr271429265e9.27.1788866814363;
        Tue, 08 Sep 2026 04:26:54 -0700 (PDT)
X-Received: by 2002:a05:600c:3511:b0:49c:fa21:1c86 with SMTP id 5b1f17b1804b1-49cfa211cd7mr271429005e9.27.1788866813957;
        Tue, 08 Sep 2026 04:26:53 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm847238405e9.15.2026.09.08.04.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 04:26:53 -0700 (PDT)
Message-ID: <3e210ef7-f807-4de7-935d-09441710acbd@redhat.com>
Date: Tue, 8 Sep 2026 13:26:52 +0200
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
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260904180058.3803849-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/4/26 8:00 PM, Jakub Kicinski wrote:
> netdev_work_proc() took rtnl_lock() for the whole batch, forcing
> even ops-locked drivers onto rtnl just to run their rx_mode / ndo_work
> callbacks. Take the per-device ops-compat lock instead: the instance
> lock for ops-locked drivers, rtnl_lock for the rest. That's what the
> callbacks already assert (e.g. netif_rx_mode_run() asserts
> netdev_assert_locked_ops_compat()), and non-ops-locked work
> such as vlan ndo_work keeps rtnl, since its compat lock resolves
> to rtnl anyway.
> 
> Without this adding more uses of ndo_work, for cases which don't
> need rtnl_lock feels like a step back.
> 
> We can drop the comment about the extra ref now, with the relocking
> it's a necessity.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Dump question: can the `netdev_work_list` work list grow significantly
under non pathological conditions? netdev_work_proc is now going to
acquire and release the rtnl lock n-times for non ops-enabled drivers.

Would it be overkill trying to acquire the rtnl lock at most once (i.e.
keeping the netdev_need_ops_lock() and legacy drivers on separate list
and process them accordingly?)

/P

