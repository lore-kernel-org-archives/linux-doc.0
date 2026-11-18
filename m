Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032338;
	b=PnRyIKKl2o0ryplNikzAEmXJvPHGUUDIqhP5KVmr21Je/yXUAEHPeDPiwHBj0yMeL4Mp
	 s1zQ9Go5o8lyoPONPx4ec9930J2VPTkHlyuRxvaRMyOTPGeTMbvlrjeqcA0KkWigg9+zT
	 grng6czy6bd7S/TAkTpYyfUjI1/tZhMr6W+GoapBq52d3K6XM5w2Zo6QNyYAWcgyZlUrB
	 6H2oB+6QxXceLwFJl5lkI+QZmXe/FAbrxJEV8c2o0/fjgcDZHekS7pODCwJaH2pstZKOP
	 RdLBItL/PeNmHMHW/ogtJMGScJHNDtFTa72kQmRbGvHdLQKVbyZwUXKqd1NsIq7MhDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sT8BXmWr3ZtRZWaM79NQqvkyqTyjCTuzoolorXg8m8g=;
	b=dpvRSr0Valo2WTJ3oI/23+NIo7891vAXPs4Zsaz4XdDRzXNFGvaV8wVPa61DYHjs18UF
	 B2FZh+6YT1NMRJWFQuWxTooZEVsiGSb2tDsjyKi/FlQOwDmFGW3rzU50SbdctW8FJEuAf
	 +LrY253SCfCg+B2T64eVEcNv4PuPsfs29gBV6bTPddW7AE4fN82CU0q5ZAiBgDNeSZI0B
	 t7D5Z8wCoat0TNo+/6r3JZm7laftDcQlJFO7q7Lp5My+BCVS975Nx2/quni2iFMqFetqO
	 vXytg230UcyyUJ/upoHttp48ACSTLnGs8FXGJWcJcUNlEEE/KVzjiG3NyL+W675fjvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XlcqI/WD";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DD160A2622
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 20:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3DD160A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XlcqI/WD
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-382c3c9671fso1728848eec.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 12:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032337; x=1795637137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sT8BXmWr3ZtRZWaM79NQqvkyqTyjCTuzoolorXg8m8g=;
        b=XlcqI/WDSL40sFhRfuRWgVgFbUDcqd4dc89nkRX5hq+S6M8QdNcniDdhvF5vb59JR9
         +24b2dBI34OdoIn/aYyBvSwB9tz2lynON+qJxamsUAXHpVmYD/3ZKBFhNp3ecyO+jlfH
         yLH7pY8+TH7FTvuT5+ik8N0FN9+di52g35SX1/oNpSBHggxVrH/KYVnpZPxnnGG7tPAK
         ijRQX/dWp/4oznE3o52u/IE1GSe+QjU5+euXF7w4YEyxGh1/eE5NSDL7B9b1dtmhE3RB
         XHUDBQWdTuTfQpILYYqp1x29wahndXSFG4yJo9XWSRArReOv4M9bjUoseDYx8yWpnopP
         7jSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032337; x=1795637137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sT8BXmWr3ZtRZWaM79NQqvkyqTyjCTuzoolorXg8m8g=;
        b=FOEbZKAmJw91jiQRZzknFVm/3ha6LBwYEZIxlrI/QRbh7gHITbK3bCZMoEcYZzB6Re
         cES6Y5nf7lzNiEJNP4fVXVrkJhfSBGWAgMmcuOqG5wa19XymRy3iEo7gvKPvLGKBaUNF
         FijC2CSpTZetYKW4L1VjHrMXZCzai0tAVrr2zTEV/XaNNKv6mhuhgh70b+Sx5Nr843of
         Xg12nipOKSfIFSMiZvptwy7hotCzDjFcyrB4XeEi/gz0d0249rjMZT9UHUcCWvVkt3Yo
         wPoNLTOr1IZ/xYGq5fLdGp8490BgHvSsDTBpsY4zChfqtVBB6GtcKUPdqZGnZkpjtfnv
         ldWg==
X-Forwarded-Encrypted: i=1; AL+hErH5puJtOs86EQ0i9oAq5z2ixi0h/piRmxrKVdImwOKcB6wiwcfX12ESSszWJ1N3PI0xRYtZN/KgCsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yzWmTGv5pewOb7MQoejTLmonTNlFrmoSdJ/Bfa+46pcgwXJP8
	AlAqWFA92dDbjCL3TdbLDt0P1sbFd8mvuTF1b601vnH6wzzJolqdVW9X
X-Gm-Gg: AZFdTZcVKNeh4GqiLR5OSrKYzXvUgTdpfL/4TbOJBBQamy2sAbi0RdU76UG+aZGaU2O
	BdFnJDTR1KZYEefyWix6hwYReGSam2V9QH1rvZ9wQkNGjsiPmdYCZdcGp6ZaVEKm/rEJV0gRmw5
	07SBySMYmspnJacOYg6qZs786cgEryMP7X3Xn4AzVfJbs8Q+SahdzB9KAETcVfbAJ1Z5LAUlXPo
	u1tkeGKuDVnEDEUH8fqiD7YtMoTY8TKmTBJWYEfA8BEU9+ekjR+WJfdpZcJoTB6L4l6HF7JyGq1
	Fss+jl8OuIDyUc6TuyoyzPEZG2uFUEkr0ci1FzmSMfn3+05Bz1BHb+MQEAvBQLUMyV+EHt+TYiH
	fi9NEc5suE0Crdf2iNGV5QuOa+cONlB3vSY4A+wyV2WScEaR/GbtWH/b0jdL9FIBYVC0D0BIPPO
	axmvP4x6vN09r+o6HuIjw7oc07FZiNZtkxFylHgnfZVMKSI4HS1vn5IzRRhxTqoQI6n+G6IdnpF
	xdfixcLi+wTaQoItUzpOiW9ij+XxUb6HGIF3Onm9MlnHENI5NpCDbLWqOIVdLBA9eR5oU/LCtta
	NefV5Qqtpj0y0JCU13ESTHzh/YZF6/j/WlV+mT1bnN40Q6Ez6msW/usaHmnSzo6tp5LQ4rYaEIn
	xjri+cgqSOeWqSzZ+2GHdoTaYyDIz
X-Received: by 2002:a05:693c:83d4:10b0:36a:5126:a8aa with SMTP id 5a478bee46e88-38281025978mr3395503eec.27.1795032336889;
        Wed, 18 Nov 2026 12:05:36 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm11752204eec.18.2026.11.18.12.05.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:36 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next v3 3/3] ptp: ocp: support the WiWi revision 02 Time Card
Date: Wed, 18 Nov 2026 12:05:34 -0800
Message-ID: <20261118-timecard-common-301f823ddd-r3-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179502617840.3136.12704245716223038161@kernel.org>
References: <20261116-wiwi-v3-87afa10a8-3-ahmadexp@gmail.com> <179502617840.3136.12704245716223038161@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks. I have prepared separate common-driver fixes and a WiWi v4 draft.

The common fixes use tbl[i].value for all boards, mask SMA_ENABLE on
frequency readback, report disabled inputs through the None/0 Hz entry,
and correct the common DCF output frequency to 77500 Hz. The selector,
disabled-input and frequency fixes carry Fixes: 09eeb3aecc6c.

The WiWi table also uses 77500 Hz. Its new init replaces unsupported
output selections, including GNSS2, with the connector's default output.
It leaves valid outputs, inputs, directions and neighboring mux fields
alone. The normal sysfs read therefore names a supported signal. If an
unsupported output value appears later outside the driver, the read
returns -EIO; the ABI document describes this instead of adding the
unwritable "unavailable" token.

The removal concern is real at the source level. An EXTTS request can
rearm a channel after detach disables it but before the POSIX clock is
revoked, without assigning a PTP_PF_EXTTS pin. Clearing readiness alone
does not serialize an enable that has already passed the check.

The separate teardown fix uses a mutex shared by timestamp enable and
disable. Detach sets a permanent stopping flag under that mutex, then
disables and synchronizes all timestamp IRQs before unregistering the
clock. New enables return -ENODEV; an enable already in progress must
finish before stopping is published. Disables remain available to the
PTP core. The IRQ handler does not acquire the mutex. This is a common
fix with Fixes: 627366c51145, not a WiWi-only gate change.

A source-derived pthread/MMIO harness reproduces the rearm window with
the old code. The revised code passes late-enable, in-flight-enable and
active-IRQ-drain cases for timestamps and combined PPS/EXTTS requests.
The tests run under ASan/UBSan; DPLL and routing tests also pass, including
negative controls. Both driver objects compile with W=1 and -Werror.
These are software tests with stubbed I/O, not an in-kernel UAF or a
physical removal test. The card is currently reserved for Windows HLK.

I have sent the four common fixes to net as a separate series:
https://lore.kernel.org/r/20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com

WiWi v4 remains unsent. I will rebase it after the fixes reach
net-next, so the feature series will not duplicate them.

pw-bot: changes-requested
