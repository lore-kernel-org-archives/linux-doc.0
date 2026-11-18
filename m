Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001325;
	b=4YnFmvIjGmcRY02fXwofer7rj3hMj/AAE/RArH2XiRrfp3SRns4nAK+jqmXYHsw2hZ9N
	 PioiNdHJ6sNh9MwAQMWXaQOz9sLhmULxEeCSLHGACY3WBJTWTyqNMKUhF1UJB8vO3ZBhq
	 uIoKrxZ04eDWA4wAFtbpeP3+8b9tBj6Ym+rcnI8VBMjrO6GxpGwortHSO4KQW692wqerv
	 qxUZnDw7jDnUMUQ9/h8SBXxUltGz5HsvqV3/UhA/vUbRg17VZgj4ig9yk/ovhs/1cQRAH
	 p18T9pR4TSeNQIeVOfchpsqxUmH3v4NwXwHpWiUzoQoNMz3gM+nvx0b+iwGk7kOKq2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=PTE76i3nixm+phqU46XvEqvVLXQTlr+vsdjYP97MKXk=;
	b=S2bBTDnIeD4itd8PxXHaJVyY3doP9BG2U4ULVIO54BQ0Ldw8lunGleDtO23ZdkJbBoi+
	 GHZfQkRl9jWAksfAitCV1SCph+2hoalg1UK1c7hHc2BYoROkMPiW3+Bj/MkEK+T+XrSPt
	 wGEnRKeEBdG9e6Yp36ITidddFnGIwvZvqCk95MCoOBQ1ItChbF9vGlWSxw0KSBt+1KWSe
	 hCAw7AQtWT2xIN8DWEuOi4TTi4H7p+zW4XgHTwNwSj14QUZ2J39Yg7oxS5BYPYlb99JzO
	 eTQ/s4G3cwsEeCIcZVw6hcj25WSxCxlu1MlN1b22WlYRJiKNGGWhVjvxGvHBKkyZeOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J9D5OyQQ;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C06606A320
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 11:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C06606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J9D5OyQQ
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91ccfb88e4dso8556946d6.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 03:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001324; x=1795606124; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PTE76i3nixm+phqU46XvEqvVLXQTlr+vsdjYP97MKXk=;
        b=J9D5OyQQ7CtDJfGNBTDrS8xXQb1oxOlFHB2CwmcqpmdeGfNTXI0akJ0lAfAC8TqwEE
         W50Zc7KjwtcLjWa64N2bJICEox+7cN8GZp6uc5A+aZVDr1EgOu+t+DzvVISOmYq2iAnP
         PN/umpdWd49EvKjLiMbMTTDtc2chbXkrfAjgKwizy/4ebN+GLj6a8QG9/g9QGRq3LP2F
         5aqm27u+smmz8Up+MD8FsgOPaxTto6ProUjm1Ki35/BNDk9qaIae2f3/ow6m/6yAcjKq
         cLv7TJBXbB76xCs5dvWqFwpFu2U8Z1Q49AEo32dVZKR7hFJLipWw1HLWdgp89P5IDKk2
         3zvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001324; x=1795606124;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTE76i3nixm+phqU46XvEqvVLXQTlr+vsdjYP97MKXk=;
        b=ZJ/0Di0AtHRwC2PNKf06HHR9lmsW8KmCSappuD6NoUHYR03FsoJZXq42VYPCyicxqU
         u1aeOpHfl2XUq96OZ117gxCYxrUTGaFF8XSjlRBFKT9Kak8je9V7r7iG+yT3RACBXp5j
         VwZ7jjkO5+I39Vc8CipciO/e3dMRjYsGzP9he9wyImOx6Ta0TCnRamAa/w02atCbfg46
         VnQrB7leSAuz1i6w1kYVM6xVg5l5pOFJfZrozL2OTd62nIkFWGD5Z9u5fmfvG14siGzq
         12hqeizew2W90vY6pqkeRepysLAaqBteqgN2neDr1/FyVMzqeKbt5CmUX0oCVRa3z5rw
         WVBw==
X-Forwarded-Encrypted: i=1; AL+hErFZlkeEPBBLkitQP+aF6IXNsYuiWUG2GYyEJSj+oKiGMOYTK0oA2mfFVebLttwdDNa/kzrGx7QRSbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MnWpb+jOGwg2Te7pjzbH3qBw6QqF69R/a11oi/0cbJWKuNS7X
	/RrJoy5a+0iImlwrm/6DY5Q4kjFlVKvzu13ku+qH14oHfCgPw4pMEYhLpYSvCg==
X-Gm-Gg: AZFdTZfW48w6RGjnOqPxoVJpVKWdlhvSTt7YoMLQLR5OTaCSJXJrdd92JoE95LxjfgD
	Dh52RbBS0YV7j2TAsWH6i+WDQGq44XlD3bG4leILv9f99PylIZ4T92OxE8suJ6sXEhRi1zFuUTD
	bXG0S/CXRE25+Gnv5FmW7eCotQcswrM6ndOhBxPn1tFM9WdaeZGW0jLpH+0SszYUzVBEl0IfzWn
	qI/TbEiAabFg3T42bHl9ruXaGxhK49Q0kf3cIcPVhw9O0fSskd6Mfqh59tn0Gbtp6C6EPC7akYm
	LfWf0eBY4TyeZFerkGCPj/y75fe3Pi0gVak/XZOAiS2iqbnUz7METDcoijXrEvj7+w6fDMKlRTz
	X8r+Rok9A4bc0lHMjv6nhcuTiO/iHwQTjGSk2XrYyQ3MJrd9mRMHH5LFFIcLy8ScyY0b3+OyY5m
	UX4zhEOgWf464qZSUKY5JOKgl1Vm2mFS+3KulQIl6LGdaTQMzrxNc8+FD95mP4on1EiTcv8/U6L
	NVyIEEbHXzHispXa36ccb98S8agw2U9xUY3j3vItfDosTwS8UEziaqs58+1bgS3PFeNQAEpX1lI
	R1UoxvGz9o0y9vewN+3/6rZm7CdP+XTJAw==
X-Received: by 2002:ad4:5aaf:0:b0:91f:329a:904 with SMTP id 6a1803df08f44-92114ee2ddcmr32476686d6.32.1795001324220;
        Wed, 18 Nov 2026 03:28:44 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d35dabsm19207126d6.17.2026.11.18.03.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:28:43 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 06:28:42 -0500
Message-Id: <DMYAV3MCA9T5.180N4MSVXNWT@gmail.com>
Subject: Re: [PATCH net-next v4 3/5] psp: defer tx key deletions for SADB
 drivers
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <willemb@google.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261116-psp-v4-3-1a599df2aefa@gmail.com>
 <179498190614.3136.5698785790307751985@kernel.org>
In-Reply-To: <179498190614.3136.5698785790307751985@kernel.org>

On Wed Nov 18, 2026 at 1:05 AM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The new PSP_ASSOC_DEFER_TX_KEY_DEL path in `psp_assoc_free()`
>   (net/psp/psp_sock.c:118-121) gives up its only psd reference before=E2=
=80=A6
> - [Medium] Removing the SADB check in `psp_sock_tx_rekey()` lets any non-
>   admin user who can reach the PSP device rekey one established TCP=E2=80=
=A6
> - [Low] The commit message never says that this patch turns on Tx rekey
>   for SADB devices.
> - [Low] The patch adds a lock-context rule for SADB drivers that only the
>   commit message states: they must not call `psp_dev_unregister()` with=
=E2=80=A6
>
> --
>
> psp: defer tx key deletions for SADB drivers
>
> This commit adds a deferred deletion queue for Tx keys on SADB devices.
> A key detached by a Tx rekey is removed from the device only after a
> BQL-based descriptor grace period, which a delayed work item checks by
> snapshotting per-queue num_queued and polling num_completed. It also
> makes INET_PSP depend on BQL, requires ops-locked netdevs for SADB
> drivers, and drops the check that rejected Tx rekey on SADB devices.
>
>> diff --git a/Documentation/networking/psp.rst b/Documentation/networking=
/psp.rst
>> index 43f222b38d3d4..ceb1e232317fc 100644
>> --- a/Documentation/networking/psp.rst
>> +++ b/Documentation/networking/psp.rst
>> @@ -202,6 +202,48 @@ Drivers must use ``psp_skb_get_assoc_rcu()`` to che=
ck if PSP Tx offload
>
> [ ... ]
>
>> +* Before calling ``psp_dev_unregister()``, the driver must ensure that =
all
>> +  outstanding Tx descriptors containing key references have been comple=
ted
>> +  or discarded. PSP core deletes all remaining Tx keys during
>> +  unregistration without waiting for a grace period.
>
> [Severity: Low]
> Should this list also say that psp_dev_unregister() must not be called
> with the netdev instance lock held? The commit message states that rule.
> It is not in this list or in the psp_dev_unregister() kernel-doc, and
> nothing asserts it.
>
> psp_dev_unregister() now starts with:
>
> psp_dev_unregister()
>   psp_deferred_del_stop()
>     disable_delayed_work_sync(&psd->tx_del.work)
>
> and psp_deferred_del_work() takes the locks in this order:
>
> 	mutex_lock(&psd->lock);
> 	netdev_lock(psd->main_netdev);
>
> Suppose a driver calls psp_dev_unregister() while holding
> main_netdev->lock, and the work is blocked in netdev_lock(). Wouldn't
> disable_delayed_work_sync() then wait forever?
>
> Even with the work idle, the later mutex_lock(&psd->lock) in
> psp_dev_unregister() would run under the netdev lock. That inverts the
> lock order the work uses.
>
> mlx5 complies today, because mlx5e_nic_disable() drops the netdev lock
> before mlx5e_psp_unregister().
>
> Could the rule go in this list with the other requirements? Something
> like lockdep_assert_not_held(&psd->main_netdev->lock) in
> psp_dev_unregister() would also match the ops-lock WARN_ON check in
> psp_dev_create().
>
> [ ... ]
>
>> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
>> index d497f41c483e1..48bffe088c79b 100644
>> --- a/net/psp/psp_sock.c
>> +++ b/net/psp/psp_sock.c
>> @@ -114,8 +114,14 @@ static void psp_assoc_free(struct work_struct *work=
)
>> =20
>>  	mutex_lock(&psd->lock);
>>  	if (psp_dev_is_registered(psd)) {
>> -		if (psp_assoc_needs_tx_key_del(pas))
>> +		if (psp_assoc_needs_tx_key_del(pas)) {
>> +			if (pas->flags & PSP_ASSOC_DEFER_TX_KEY_DEL) {
>> +				psp_deferred_del_queue(psd, pas);
>> +				mutex_unlock(&psd->lock);
>> +				return;
>> +			}
>
> [Severity: Medium]
> Once pas is on psd->tx_del.next, its psd reference belongs to the
> deferred queue. This path keeps no reference of its own across
> mutex_unlock(&psd->lock). Can psd be torn down while this thread is
> still inside mutex_unlock()?
>
> Documentation/locking/mutex-design.rst says mutex_unlock() may access the
> mutex after releasing ownership, so the caller has to keep the mutex
> alive until it returns. When there is a waiter, __mutex_unlock_slowpath()
> releases ownership and then still takes lock->wait_lock and calls
> debug_mutex_unlock(lock).
>
> A possible sequence:
>
> CPU1 (psp_assoc_free work)         CPU2 (psp_dev_unregister)
> psp_deferred_del_queue(psd, pas)
> mutex_unlock(&psd->lock)           mutex_lock(&psd->lock) succeeds
>   still in slowpath                psp_deferred_del_uninit()
>                                      psp_dev_put(psd)
>                                    mutex_unlock(&psd->lock)
>                                    psp_dev_put(psd)
>                                      psp_dev_free()
>                                        mutex_destroy(&psd->lock)
>                                        kfree_rcu(psd, rcu)
>   debug_mutex_unlock(lock)
>

Ah TIL. I was a bit naive that mutex_unlock() can still be running while
the next waiter enters the critical section.

pw-bot: cr
