Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975171;
	b=Zde95km229IrAg6tkIwWRJRY964iwKOxkEOwXIu/msQDp54kgKsCl5S0yUNPqByyIfuN
	 MdkPp6H7s8+xzRaj3Ictb5zUWPkRK9SP5SaJYesQh4NFWQPzxF8smJ1sbCnOsdIgT6otq
	 nEeHwhdmd+9uuO1BpxmkV44Y+geQupsYFA19V8hclFN5QNJulaRSEIjrvxfyQ6f1EAs72
	 ZV14vcCRiR7e9EtX0Pcjraua2rhwozK0SlRy1p+A5UHgJJ9EJ/GeYFwUnJBbH7M03/OUQ
	 irt8pqf+EHOlNR+gVWe7GHyS12Xc2xNZTRKHXZ+3HYjexXZaRN8kvogduM1mn9q4z+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8SfPrv2RlnRbia3emcvDOga6vE1rIcfI15DHeIm71RE=;
	b=pHUqyA3nvX/EHpfvyuevPA74TobG3jRsrePxobNqiiMKzYt5WrqpvOWHa/xNowqGi7Tm
	 4hy8BtkcbFU8YLO8I7hFNaldTzGOwLKjJmZpwWJq/PXEh45G7DNZhHpbdzuxC3GYmMu4x
	 hl+vjagcRRBzM3nEbLjaWHv9RsuotdHQUOLVg5gy1+AQzGG6q3cDKNmBF35vCP0FsGbMy
	 ngBjaQyloYL2MBQ+vKegU8BWiL8mq+XWRaoXbO6XxOX3n/oGgr+ML9qn03ZzBCEGjK5oH
	 gPDaJ3gXhAM9QLQFJxetRrLsmrXrvvzUP7i3X1kcrZVxZv3XMciRYwQma3922d9TOZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aev6FLvq;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EF7606A31A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 00:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41EF7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aev6FLvq
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso605534a91.0
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975170; x=1793579970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8SfPrv2RlnRbia3emcvDOga6vE1rIcfI15DHeIm71RE=;
        b=aev6FLvqhWFM+boOuyY03GGCoU/Ug5rjw0gLbtxXmNUylCWl3wfkL0WbSaldF+nyfU
         dfvFllTQm0hL30ZePD2Ddt7E+oAVnPt7EGStphncddpuBymNNzzifiJ/WLUb8DrTIRgG
         ZXVC/L8JOm4bcf1k4qgbqW4CYmDzr+xkq++Ken+oidKtaNs5J/htPXy/l06AQ1RNQ7Hr
         xPrXeywuSwCRiP7EIwWcIIf7GN7gxO/pwvyd6dEOpAn14aIv5TlzkyZOg6AZSo4E5TwF
         3J4DdskYcOlJo7zmRe60MwRo6qiNpgTbJkU1gkhiWxDHzAd4pEqSUHY0mFMbK9fzjCrE
         hEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975170; x=1793579970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SfPrv2RlnRbia3emcvDOga6vE1rIcfI15DHeIm71RE=;
        b=CPKEgYdiQ2/xhptOunOcs/6uPVlBCPJVkHEQL0nR1Bs8PJEO/UpqkDqdjta926iEhd
         3pa1rVG99tXc2fb8c0HY5ru0nXYXW07xWA6FMY4gvOE62we8TRg14xMKVn6lJPhvxKV/
         /YCZLHpLfrQW9zM8Hv+ewSz3PYm1K8ggzO65nX93xQZ9Ns0ZCFFnTaSCjVCQCIEp74k/
         LTgTSQqYd3ArG0sw4KdO25Qw+rc9Snsnjnfg+utfoN+dR+TzEArXybuXeL3NQa1xl+4+
         iRWJKoqketItcoCt+rQRpSSr+aEJc/z/lyJWl5z+dcjszsWxPy0q4pYAQuGUOcWPXlBc
         NOPA==
X-Forwarded-Encrypted: i=1; AKwUvBxVvgfqGQVdTd3ZegIRoMkg9wjLPpa+64Lh4z6VBwu6aTuQA5ZIbx6oq9o6jZIcJgHn8nsJFLcuZNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv+PteGWsrW3iAQkA2asGdS40w6JIZbwZjqaR48Eg/KCOp0n2l
	T250UWkVUv4eNlIr6aANthao5tE2qqtp32qJzCCQyMOg/deQGvgCmtuR
X-Gm-Gg: AYBFou30Wl4sH/lOBJ25TZdahKgvBLz8W51pw8JcUgdVdeQcS2wKXWanMY30G6jow2J
	HHUUhkov91Q+jnayF4uj549RW0/sBYUkpEoUrH6679Uxxhy/KkziFmtpkBRH9QRUc5BFygppOZj
	J8FbAz3v7PwEQa5rZOfPXtwglGK505jRDaVE7lEvZ0YTxF8dMtseZrqof0qPNCpWZNwk8iVSN6i
	s8kKrku0m9B+6hRYcBx4zG59sDWtdhu6lWAXraDUkaCDOrjpaN+b2VfjsQXu/XbqRQsJWEFvuqn
	/YLXrphD0hrveUuIeW9B5Q0GvGzwQzqRvQqhhu/UoxP1Q8Xmup5GUC90zT0ZIMt2HBBJfHaw40i
	irTJ5TXJ1bRm4TIBCbWlgdlN9JduEPIL3hiGTVLLBlKfEcRvFja4irUXU31e4cnJJgDhFzxiDSm
	o4MVAdGHLwdKt9HnV+m+aHYdPzDhYMItfJvXLA8lxoj5plvtw/gC5iCy+tXcamoIfrHL44W/7dC
	iyVzDT9ZPwT1LHyBedmDC+nN2IZ/b38Ar8lmLBMnUexFWVoBCDpqs/zZcLfXn8EoacMWg==
X-Received: by 2002:a17:90b:5647:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3adead4c290mr4014353a91.34.1792975170550;
        Sun, 25 Oct 2026 17:39:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa96sm6135134a91.7.2026.10.25.17.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:39:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:39:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars Petter Mostad <lars.petter.mostad@appear.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 4/4] hwmon: (pmbus/fs1412) Add TDK FS1412 and FS1525
 driver
Message-ID: <87895a38-c819-4193-96ac-69be7f548e8c@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-4-27ece4e43d04@nexthop.ai>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-4-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:08PM -0700, Abdurrahman Hussain wrote:
> The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with PMBus
> telemetry for input voltage, output voltage and temperature, plus the
> matching status registers. The FS1525 also reports output current and
> has an over-temperature warning limit. The FS1412 has neither:
> READ_IOUT and OT_WARN_LIMIT are not in its command table. Both read
> "KDT" from MFR_ID, which the driver checks before binding, and are
> told apart by IC_DEVICE_ID (0x0c for the FS1412, 0x19 for the FS1525).
> 
> VOUT_MODE is read-only and has bit 7 set on both: 0x98 on the FS1412
> (exponent -8) and 0x96 on the FS1525 (exponent -10). Their output
> voltage limits are relative to VOUT_COMMAND, so 0x0133 against a 0.6V
> command is a 120% over-voltage limit on the FS1412. The PMBus core
> converts them now that it supports relative VOUT encoding.
> 
> On the FS1412, OT_WARN_LIMIT answers although it is not in the command
> table, but the part reports OT_WARNING at room temperature, so the
> driver hides the register from the core and only the OT_FAULT_LIMIT
> based attributes are provided.
> 
> When the output is set with an external divider, the FS1412 reports
> READ_VOUT at the feedback pin, so in2_input and its limits all scale
> with the divider in user space. The FS1525 reports READ_VOUT as the
> output voltage and compares it against its warning and under-voltage
> limits as they are, relative to VOUT_COMMAND. Its over-voltage fault
> is an analog comparison at the feedback pin, which would read below
> in2_input on such boards, so the driver hides VOUT_OV_FAULT_LIMIT on
> the FS1525.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied.

Thanks,
Guenter
