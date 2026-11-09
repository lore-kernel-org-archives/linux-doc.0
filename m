Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228054;
	b=no6gJ0uQcNtUEwjQfvcWrQ2IT2C+v89rz0/Yoy7oDKN6opvungilzV8qAsF7wXH7mqTa
	 xZ5PHl2ZPrKKJ8m3vLuwLzq5jILZcTfnln5PdddljWTfL5q8dz5260HAAyUG/syXx6u/e
	 0HGOo5JqoxrNbGwiwKjQ+IC1hJphqMF469zAqbaMrwfGz1Su3j766ohT30TjY1Z4hGb+I
	 At/eJeFIHtO0g80r7yAae8yUNZpvGWnl2RHxJYwuwWqAvPkTU7vMB8eV2JPADYbLO893A
	 gNG7ei7tihZTlm1cxT3GDbbR8vlVBJMQhbqN4Z9SAxhskkMHaeOAFh2ZLcMU8qn/nng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=DcXkNikRo3mZCR3DVumgx3XxvXggolf9GwPpELKwp5w=;
	b=J0fyF1ozVQFWZhj2Lte+/sg/6O3u2LBPO9HCOvBUTR6Opiwr3Ykq6NEuTpIQoXkCnXj3
	 rovMoDx9OKPD5Bs8g/rBxvHtjvBNUlxzO0ehNhUnCXUu0MVxc8eze/n+Pji4XAY9NFnWn
	 3Lh1tCrBvLnp/GTlfZHXBtV5XjRnwwgHI55QY0O4NH1/2xjI5Bu6NqGBg2/DFBvuhvBf6
	 +A0MJYMW/necGjMfPaK4fd8Oh7wUwvIutgCPvXRov2F9yQ06bOsrZo7mam1n2R4swPWcl
	 gGmZI5i6jqyqbdVSGCYccknr1IkX3GD0m3Jg94Yfe2T36hMbNKqf9fSK2xT28/BHLaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJ7izS+N;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF1B606A325
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 12:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF1B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJ7izS+N
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3adfe77d35aso5884611fa.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 04:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794228053; x=1794832853; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DcXkNikRo3mZCR3DVumgx3XxvXggolf9GwPpELKwp5w=;
        b=QJ7izS+Nj337/icZ8gnu/PtKd7bI9LEikfONLukvDU7r3Ya370Bl0KcCvZevMwPhgr
         S+KpQQQxUox2f7M5fZavoTgNLU2yS1Gb+/Wc4a/IK1Q+2xIE4KoIwHs2XZbz/9vvEl5O
         GKOi0QCuhlQRsXgU6Pb4irlboDW/fe4IIeCv+B98JHx2TkOd5fQNQvWxj7d3+LYsWM8I
         4JcAOjeHBogfG8zWenDpoRbyryEni+6+3mn6UV74xs3iDztePzQdf0Sb66+IZ+mttQdT
         kzynONylS+rpyPxEdUY/QH9mz/aF5O7jcssOOsK9EYjgVQV/Q3jRmFuTILxTxOy2FlQt
         yMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228053; x=1794832853;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcXkNikRo3mZCR3DVumgx3XxvXggolf9GwPpELKwp5w=;
        b=wtdmxihUcVB07OYMzrQGJ8wmhXh2jRd6Rw1fpMx9Sv6FXGzockW+HkPx962Yb2ch/B
         M+3P0lwHIVqk9OKowWaJuptoskdEJNSPzieLcOBjwfsYhw00DpvKISUXpknd3XTnp8FS
         XTYrUHdw7ygYz0wolPFxiSBHJyVwBEwAWFMWjyq573I1308ggxouPHEDYoeAuC4k4z6v
         TleuyvcIPZunN/GGEuwAPOn6v2iDv1wq2t8k4dwi7hCbBfLC27LKCHAkxy9JNMWvcet4
         KB1zbJIkuJCBmYffTXRD/41N4/5XYsuLD5SIRAP4tj2bEDUqG9DXeBXh6ryMgOlpka/k
         ic5g==
X-Forwarded-Encrypted: i=1; AL+hErHiaJdB7cl3dcjM0QyOLtTm4XuLNK22OEsQMJv9YYKDqG9jIwGUO+0R3ltFR/6la9OUobGDgNKPhVU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TW1o+2tzvFiwg7uwMPdvEUY9o+zrznXrnKUovuzrVFnWjsPoq
	AYGCsyJuY27itJGJUQdch/DWD+nE5bFnmPKETNxXB2MhEjMTe2U1lAo2
X-Gm-Gg: AYBFou2xYV4rcLyk7GkhuMNEThHFfvkwjYkZ5irFbNCL3rfQbCpN6lrSCuamNdCmYvi
	cJSnVfSRx51MNiiMldkWFaKvnV5VwEj8bHHekBsUYwZcgviFzMh2g/zS2DFQyqva2llS2gAgksj
	6WOk+kQ+L4gQYzLBd+slo0HKFJWJ3Z69mHFE91onM9fCKyO2Xj4zW6Z9cP2DCfvJO+GdH2pjC/Y
	0g5NsHSDvk881Fphgzy0CG7a3oC11wzzZeis/b6BqXDWLw5g8+q6C4MFSnWBk5GZ7ycgrFNcjBA
	C0T8xe2zKy75h0LQAqbwBWaQArGw9ecPSO/gwhtyqy46DHy6nRaf9P1NhO0zp2TFlO+fnZgnuSr
	fbRSDrhkFXO+4g9voK9sBCAQOPiSSV7lJQUsyPA7IXMgRgdhHQI7yLV2m8WJRhL/K0Z5+qG1srn
	axm9B85PZ0E/BWKPwRi0CZFAPyr9MYWNa+fDDRhWHgb3bAPCaDccTqw85tWmUT0zs/jDhGD+IK7
	nYErDuCJYTpIrjcSSp5vyWTRfU0ppHT8GEDraud6OzJKJGO16Qp8HG7qqUJcjaVLiWjuIcxu3sl
	SxJXYuBy0LeoE9BT+LykW2/8BGLYxvzwqQ==
X-Received: by 2002:a05:6512:1591:b0:5bc:e661:d673 with SMTP id 2adb3069b0e04-5c14c0394demr1140950e87.56.1794228052333;
        Mon, 09 Nov 2026 04:40:52 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b81ae9bsm856420e87.62.2026.11.09.04.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:40:51 -0800 (PST)
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
Date: Mon, 09 Nov 2026 07:40:47 -0500
Message-Id: <DMQORDXEIDQQ.2R8EHB9NQARGY@gmail.com>
Subject: Re: [PATCH net-next v3 3/5] psp: defer tx key deletions for SADB
 drivers
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261106-psp-v3-3-a8dd38f5a727@gmail.com>
 <179408516694.994134.18039275084711975656@kernel.org>
In-Reply-To: <179408516694.994134.18039275084711975656@kernel.org>

On Sat Nov 7, 2026 at 3:59 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] This patch removes the psp_dev_has_sadb() -> -EOPNOTSUPP guard
>   from psp_sock_tx_rekey() (net/psp/psp_sock.c) and replaces the old=E2=
=80=A6
> - [Low] The patch adds an implicit rule for SADB drivers (those with
>   tx_key_add/tx_key_del) that is written down only in the commit=E2=80=A6
>
> --
>
> psp: defer tx key deletions for SADB drivers
>
> This commit enables Tx rekey on devices that keep Tx keys in an SADB. A
> superseded Tx key is now deleted only after a BQL-based descriptor grace
> period has passed on every active Tx queue, and a delayed work polls the
> queued and completed byte counts to detect the end of that period.
> CONFIG_INET_PSP now depends on CONFIG_BQL, and SADB drivers must be ops
> locked.
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
>> +Drivers which implement the Tx key callbacks must meet the following
>> +requirements:
>> +
>> +* The driver must be "ops locked"
>> +  (see Documentation/networking/netdevices.rst).
>
> [ ... ]
>
>> +* Before calling ``psp_dev_unregister()``, the driver must ensure that =
all
>> +  outstanding Tx descriptors containing key references have been comple=
ted
>> +  or discarded. PSP core deletes all remaining Tx keys during
>> +  unregistration without waiting for a grace period.
>> +
>
> [Severity: Low]
> Should this list also say that psp_dev_unregister() must not be called
> with the netdev instance lock held? Right now that rule is only in the
> commit message.
>
> psp_dev_unregister() now begins with psp_deferred_del_stop(), which waits
> for the work:
>
> psp_deferred_del_stop() {
> 	disable_delayed_work_sync(&psd->tx_del.work);
> }
>
> The work takes psd->lock first and then the instance lock:
>
> psp_deferred_del_work() {
> 	...
> 	mutex_lock(&psd->lock);
> 	netdev_lock(psd->main_netdev);
> 	...
> }
>
> Suppose a driver calls psp_dev_unregister() under netdev_lock() while the
> work is blocked in netdev_lock(). Then disable_delayed_work_sync() never
> returns. Taking psd->lock after that would also invert the psd->lock ->
> instance lock order.
>
> The psp_dev_unregister() kernel-doc has no Context: line covering this.
> The @tx_key_add / @tx_key_del kernel-doc in include/net/psp/types.h still
> only says "Can be left NULL if device does not store Tx keys". It doesn't
> say that psp_dev_create() now rejects tx_key_add on devices that aren't
> ops locked, and it doesn't mention the BQL requirements.
>
> mlx5 calls psp_dev_unregister() from mlx5e_nic_cleanup() without holding
> netdev_lock, so it isn't affected today.
>
> [ ... ]
>
>> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
>> index d497f41c483e1..48bffe088c79b 100644
>> --- a/net/psp/psp_sock.c
>> +++ b/net/psp/psp_sock.c
>
> [ ... ]
>
>> @@ -287,10 +293,6 @@ psp_sock_tx_rekey(struct sock *sk, struct psp_dev *=
psd, struct psp_assoc *pas,
>>  	struct psp_assoc *new;
>>  	int err;
>> =20
>> -	if (psp_dev_has_sadb(psd)) {
>> -		NL_SET_ERR_MSG(extack, "Tx rekey not supported on this device");
>> -		return -EOPNOTSUPP;
>> -	}
>>  	if (!pas->peer_tx) {
>>  		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
>>  		return -EBUSY;
>
> [Severity: Medium]
> With this check removed, can an unprivileged user use up the device's Tx
> key space by calling tx-assoc in a loop on a single socket?
>
> The PSP_CMD_TX_ASSOC op in psp-nl-gen.c sets only GENL_CMD_CAP_DO and not
> GENL_ADMIN_PERM. The caller just needs to own an established TCP socket
> routed over an SADB device. Every rekey allocates a new device key:
>
> psp_nl_tx_assoc_doit()
>   psp_sock_assoc_set_tx()
>     psp_sock_tx_rekey()
>       psp_assoc_set_tx()
>         psp_dev_tx_key_add()
>           mlx5e_psp_assoc_add()
>             mlx5_create_encryption_key()
>
> The superseded key is released only after all of these steps:
>
> - an RCU grace period
> - the free work runs
> - psp_deferred_del_queue() moves it onto psd->tx_del.next
> - a BQL grace period completes on every Tx queue
>
> psp_deferred_del_work() checks for the end of that grace period only once
> every PSP_TX_GRACE_POLL_MS (1000 ms).
>
> Nothing limits the rekey rate or the length of tx_del.next and
> tx_del.active:
>
> psp_deferred_del_queue() {
> 	...
> 	list_move_tail(&pas->assocs_list, &psd->tx_del.next);
> 	schedule_delayed_work(&psd->tx_del.work, 0);
> }
>
> If a Tx queue stops completing its snapshotted bytes (for example, the
> peer sends link-level pause frames), the grace period never ends. In that
> case tx_del.next keeps growing and new device keys keep being allocated.
>
> Every PSP socket on the device shares these keys, and they aren't charged
> to the caller's memcg (only the psp_assoc allocation uses
> GFP_KERNEL_ACCOUNT). Once they run out, tx_key_add() fails for every
> other user of the device.
>
> The commit message says:
>
>   Adding a time based rate limit per socket for tx-assoc to prevent
>   wasting SADB or deferred deletion queue space is possible for future
>   work. For now, users should avoid presenting PSP devices to users they
>   don't trust to abuse this.
>
> Before this patch, a socket on an SADB device could hold only one Tx key.
> There also doesn't seem to be an in-kernel way to limit tx-assoc to
> trusted users. The rest of the series only adds selftests, so no later
> patch adds a bound.
>
> Could this patch cap the number of pending deferred deletions per device
> or per socket, or rate limit Tx rekey, instead of leaving that for later?
>

The cover letter and commit message discuss this. I think adding a rate
limit is a reasonable bit of hardening that can be done. My preference
is to introduce that in a follow up series, as I think this series is
already pretty dense in terms of complexity, and deployment-wise the
admin user can hide PSP devices with namespaces, or block all usage of
tx/rx assoc netlink calls by just disabling PSP on the device.

> [ ... ]

