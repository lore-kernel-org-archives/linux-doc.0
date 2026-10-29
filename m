Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271837;
	b=f3unLhBkUReiKPtEUDs/b857AHfw9zAJMpUe0Q8yntJlwhOxzcENiYV5CbxEi5Sp8fr9
	 oCF1VkGthiJFg9NoywlQycsLffvUMyThla9tQeb3oi4xJdSmKzTlCPFcBpmpWCaDBkzzQ
	 QbvwQZNCxcHICI4fnJNNoK1jkyTe2+fjdFD75xs9Dmha9uo2R5dSy8e06U/ZqapQ6mvpe
	 OEvcdC6n/E/UABpeCdqPww6toAInKlxJzjBdC0+/CFgrEhDCgcVo9IuQJo6LpvOxnPahr
	 hOrHLr/paX3F7rKuRehPvJ0iLOz0Hyzt84XXA2W//gApcQlYyTaswBLCHEcH1W9doIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=muSquEeptmJIsXJiarZANV9wpj/9lTOSCGNsvcEZLTo=;
	b=YqYyVDR4hiycHdSmkYeMAOHZEjPvDA7J1Cp1z/pD+U6U4WZ5EtvALPCHaurjSAF2zwIe
	 sb/YufC49D7bW0WHWFxi3AfeoG/r9WcC5QyMe9i5Wd/oiuGBCM2yS7yVu5oslT4wvByV6
	 O4MEwmOl1EDIqSIWOFAuj4Li6K8XxBbq+lEkAVi6zRl+x9+XRh1LBFbYRLPPzjvMjj9q/
	 vqIppH3/QrhMptfNyaWgTuWsVHQIpkhIm9eEutT62Dp+Jj+sMZroVXY0Mw4BVbimJBjaw
	 V5vFChIXhwoU5RqwAMjZ38FthiiptRNtS9aazEPIkCDXRHhY5IbLN0zK774kmHgLAMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qvHinnD/";
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5087606A31A
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 11:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5087606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvHinnD/
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f3c8958d5so213714985a.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 04:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271836; x=1793876636; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=muSquEeptmJIsXJiarZANV9wpj/9lTOSCGNsvcEZLTo=;
        b=qvHinnD/zBOohgWrBCPjKhxrCzsM5HIs+nI4rv2uerlKKl4bAfAogD0nXVnEzVc6E7
         /QPewiKO5a3PhClnv8wrwJHy4hWNsd1N5JOXDhXrYiqwfGGWk4Eyi2PRTbkOn3EvNE3f
         bzHsuT9CuuNzS/XKGTdWov126Pyo/KycEqR3JkcwfoPBdxwZTjlGWmqDWC0IvPb+STt+
         vGUc2mxpeYiT/o6Tt64YokXfvgkLvmTzniUq9524kWyfOGfzXFS6Jlm7VFsqFI74uP8N
         glpJ7XJu/M2le5uQVgKOhgpK/u3vfnmihOyeM3U3AOTEBBR2+q1/ek6cNwxtoFZVYwLJ
         xtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271836; x=1793876636;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muSquEeptmJIsXJiarZANV9wpj/9lTOSCGNsvcEZLTo=;
        b=iGzvhgADhDlXZoJ21Qr4SdEmVxW82+8bAkHeBeTFfgcpfVVr+8gOiLpAfG1vGBe8gU
         jOvIju9tFdLn0qcs4QEqDQPAR5rYEY0YG4iY4/yJtCP8BMaQasfsZRkTIsPjeahXBrSM
         U8S5Zib78UDdzIHn97tenj8VgjGldIZOCURvWfT/T0uDtcpnDgTvQUkhPx45gAAd/5J5
         PRxWhEJezOro9Fo88/N+M2zi6pb80WdiNnRgQ39TpBN6aPWPsCBwvZMyeoc8R8BawHCz
         yolPb/IeSSYVygP1lfeKf7uuc6XVTlin9jrCPZ2j1YOdHb5AMcvIF99LUlaVW6prz6FJ
         7ViQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVph/EV7mxf7pItkwcYkyzLZQ6zQT5OqUuaHfBHf2p0TvZlmmdhqMWajgkf2ECkNxZuDneSet+bes=@vger.kernel.org
X-Gm-Message-State: AFq9FYIO8xv7Y76L9F5eFaoZEhYUMG9TdMWRtdCebWDc+UVkeSFUdiTc
	wjij4vdpzg1TJYCaemahFsG0/huUJsb7cKk9P03AwssMrVznjATXJA2O
X-Gm-Gg: AYBFou1cu+MYNReNFGbSVhuZZd9FQxPoNwz3ehMfNA3QkzpluPNuL+5xcSbpuLkdl4L
	u77a0if+rYxHkN/jPVKBe/+bs2+4cw2PG45YRqkwsNXpFQiF5+bMFptvkT1GjB/kv58EikzjN1X
	QrIdfbC+Yuz/zZNZ9ZU3ZYbcXRT/DLI4qTX9sPLQkK7PT8lz9beWFB05eD8bA5lDX46H/5I4tiW
	2Ol4HxI6XzbvbDxRzDwKQbfXltIJwiLYAaoVO2mAZ91+7h+gjKgzqUg6l5TTYh/aoUGtS6OOMr+
	RmOOBnnEBDD9PyuF4AWMUhcMWtvh+odeVuXZi1tvmNfMclWM6AcEgkN3JeKFa3qtykDHh0SwkuD
	5FYX68UqVlutlCK6gfM5dZxeGxhh6c0uXsb8ciBBoeC/mc3LcUhD/UTMJKFEvj2SJZ5Jf4EdaGP
	5NDSHS62jtDm3uMnFypOiOCblYpFOAs8nA0ySoRuX6AZiQ5ICyIv16ugaIDiObOMvmCCf6SlMX/
	vCjzYBu6KTfomeGb5wfuwcNQ23nbRbN/3e72jGCL6auW460nYVXYdkh8v3IPMuT9nhDXSHeVNm/
	uJ0EDQyPRJ9EXma3xa65y7qqiYAZYCyADw==
X-Received: by 2002:a05:620a:3183:b0:93f:2c95:658c with SMTP id af79cd13be357-94408a7fa2amr789388085a.14.1793271835721;
        Thu, 29 Oct 2026 04:03:55 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f05af648sm1506079685a.1.2026.10.29.04.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 04:03:55 -0700 (PDT)
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
Date: Thu, 29 Oct 2026 07:03:54 -0400
Message-Id: <DMH9T7NY96VZ.X2G6APCG51K0@gmail.com>
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Kiran Kella" <kiran.kella@broadcom.com>, "Jakub Kicinski"
 <kuba@kernel.org>
Cc: "Daniel Zahka" <daniel.zahka@gmail.com>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Donald Hunter" <donald.hunter@gmail.com>, "Andrew
 Lunn" <andrew+netdev@lunn.ch>, "Shuah Khan" <shuah@kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next v2 4/7] psp: add core tracked stat for
 outstanding tx keys
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261009-psp-v2-0-5596ab50f677@gmail.com>
 <20261009-psp-v2-4-5596ab50f677@gmail.com>
 <CAPHeo3erVfzLE0wTmz4=0HKWdOL63+7W2KXO67OuEfRXhf_M8Q@mail.gmail.com>
 <20261028152950.6624ee83@kernel.org>
 <CAPHeo3c0RP34ASvzV3UrwDa4PvXHhuAOq1+-Bn0Z5+QXFV+BpA@mail.gmail.com>
In-Reply-To: <CAPHeo3c0RP34ASvzV3UrwDa4PvXHhuAOq1+-Bn0Z5+QXFV+BpA@mail.gmail.com>

On Thu Oct 29, 2026 at 3:14 AM EDT, Kiran Kella wrote:
> On Thu, Oct 29, 2026 at 3:59=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> =
wrote:
>>
>> On Wed, 28 Oct 2026 17:16:17 +0530 Kiran Kella wrote:
>> > > +      -
>> > > +        name: tx-key-count
>> > > +        type: uint
>> > > +        doc: |
>> > > +          Current number of Tx keys installed on the device.
>> > > +          Only visible if the driver stores keys on device.
>> > > +          Kernel statistic.
>> > >
>> >
>> > Maybe it is good to have a counter that denotes the number of PSP
>> > sessions set up on a device, which is managed in
>> > psp_dev_tx_key_add/psp_dev_tx_key_del operations similar to the
>> > tx-key-count. That way, even in non-SADB drivers the user can know the
>> > scale of the PSP sessions set up on a device at any time.
>>
>> AFAIR the thinking was to also implicitly flag that the device has
>> an SADB here. So this stat should probably be called tx-sadb-key-count.
>> We couldn't think of a reason to count the tx keys when SADB is not
>> present. Rx keys? maybe, because of SPI exhaustion. Tx keys - why..
>
> Tx keys to just provide info to the user about the scale of active PSP
> bidirectional sessions (after the key exchange) for debuggability and
> for any other derived scaling/performance metrics.
> Especially for non-SADB drivers, where there is no device limit on the
> Tx keys that can be created (of course limited by the SPI exhaustion
> on the peer).

The main use case I had in mind was seeing how much of a device's SADB
was in use. If the usage is high, maybe the user will have a policy to
not even try rx-assoc (which always succeeds), just to fail tx-assoc
with -ENOSPC.

Total active PSP connections on a host is something I think users will
want to track. I'm not sure it needs kernel support though.
