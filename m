Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40C74A13AE
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 08:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575546; cv=none; b=Sx7PpN4JzpD+qkv0XhaCPOAZgvXef+ZqvHbGtpXa8lv9JDn/v8wJjrYaKcDD1TFcnOTg8J8LDR7K2LOaRWvZw1Cqfg3rb1NpfrchZ39hBEvd0eiZTRKGo0OsbGEqmjJ+cRfcOJXhmiFC/IiwYpTVLPGJCOip0ShuBeM+QflH2Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575546; c=relaxed/simple;
	bh=VejzyZEps18cwGic+7y+WtCkMAqA/TE5eqTckN89HUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeqDmEjaK8oMdgICMaPRNqON1smmg1Z319+WQzNQ80LMOpafQotUbJS4UPAR4gwGW1enew1nwqM/MoNn5Se/RSCJ+QXpPSs4Hdb1A4nQ1venKzofzgvuBIE2C1pMeaQjQK+EE2i23eM6IMJk+8dD7UcUgoFRIm4GKId8ymKLdYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=LeakSED8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="LeakSED8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so32428455e9.3
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 01:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1778575534; x=1779180334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xOyBgh5+zqSkeyyWb8Vcm36qUJiK94Wa6W+p9Jv89ZA=;
        b=LeakSED8mzEjkziOEF017NihImfhHHQlpj458I8uwZBvUCjkO6zTlIPrfDzSNIttud
         xYYRo5EPB6xkd0LNw1GaLgqmqCVARGDQpIG590qMTtAVWha+dqXogLiRcXyrQSYC8NQx
         L+8y1c5oIEoc7ZJZWjOSfYApEi29UWMqo8LhQXPzNqjIQeGgVpHIQV5rnzdq5dnjaTSK
         Dg7IYzjAmfgSdnyRMpf5HSGdcvxMpT8OWEW7d5hH4LCkuHFO3z6r9E7UwYk92ymOKZvO
         s06MJbhun+y2dfeM2uGt/CQt6G2E1hMUInjuPMNwaIercHz2lXRcsozzJsk+dI33PJo4
         4rpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778575534; x=1779180334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOyBgh5+zqSkeyyWb8Vcm36qUJiK94Wa6W+p9Jv89ZA=;
        b=iOC6gkuCpuhT7HuGwCo5k2h/j9fvY/6vgBVv339+EQS6ghkyD+HD3eNyxkKjWmfCrh
         ZpdjEOiDhU4kZRk/upqnB4cNMWf+rMtFEWE9/n7b5usSs31q8SfHbA+pyqqZ4lCE3W/8
         gAwV9oKi5k7xvE0dnnUQtf7KA8FOxmlwQ+DczgoGQ/0Qeb9kaHCOy187KVG7U/7uXtmu
         omFbFZbKncLm8wovhnq1wjBIm4hkaRHbYAE7+qDAlRa4wOomwEPpSmth6vPE2dWG3nRV
         9BPnVG28SzZTx9aP5E60bg8JiduXrl7L1SvyLnCaVJcxKWz+28P5c2SMuXqwgeMbxavj
         V4xg==
X-Forwarded-Encrypted: i=1; AFNElJ9zsmyC/tKxCCulOXeBVBf0AjtiZh7mMMsXc3QRZz4oYmCfEumXXztIVowj6h5OamM9qRiseLTvaEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHsjC00PyTlP7Erk6cK2QJn+1rUZGX5Jm2qZd6a2HdxhxCX3kR
	cxkdkcO2QZQ5kh/4f2HTAQv710WNf2GpKu54s1eLn3FXGBTFr6hANjW/NQEqHdBAlFg=
X-Gm-Gg: Acq92OEJEnBf2mCjDZES2uU8jncukjAxtytn39iCVrNscUUmBlEv1M9pqvGSEMKJPlM
	8LCEuNrXtdalclaeQ5n8fpB2koEzNt7G10xTiYLVyX0N9IY98qR1WdHQnA17BQLCLiiwoaPszbR
	TPVWlyqETfSJSoZOK7bTqgDJeGWu2hUo3YVi84lgIJfOaQoQLkRO3nfnvgtajryx8AK3HoNLKq6
	QVblKWhxlpTH4PPykf2FcbgWLFfHM2SJmNJTu44xvRyOVgZohwAZLNpMDBZRsT7fXUoTgAbLUK6
	0+T6pamHduViFhLnbmCKYLXjjQvisyiqpmkSwlsK4ZVUTdwr0E5C2twG+lfU0elLIHkAhH82VtA
	GN5ju/c22WGz00ZX1JbbsNJZFfwd73kwhuWUEyiRY3b3GF8+dkst2nRM8Uy2ImDjiheQfczisTC
	vRxRoFJajTvWuEYClHeig3gdNb/cHPDqUNHZnpmeI4Dljf7A==
X-Received: by 2002:a05:600c:a11a:b0:48e:635a:18d2 with SMTP id 5b1f17b1804b1-48e8fe4dc0bmr23026925e9.2.1778575533826;
        Tue, 12 May 2026 01:45:33 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e906b04a9sm50232105e9.7.2026.05.12.01.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:45:33 -0700 (PDT)
Date: Tue, 12 May 2026 10:45:30 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Parav Pandit <parav@nvidia.com>
Cc: Mark Bloch <mbloch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Simon Horman <horms@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Borislav Petkov (AMD)" <bp@alien8.de>, 
	Randy Dunlap <rdunlap@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Christian Brauner <brauner@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>, 
	Eric Biggers <ebiggers@kernel.org>, "NBU-Contact-Li Rongqing (EXTERNAL)" <lirongqing@baidu.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: Re: [RFC net-next 0/4] devlink: Add boot-time defaults
Message-ID: <agLoeZtsSizR-R24@FV6GYCPJ69>
References: <20260506123739.1959770-1-mbloch@nvidia.com>
 <aftaW-irGmkfA7FS@FV6GYCPJ69>
 <3f9215c4-7c84-46d9-ba74-30dabe24db09@nvidia.com>
 <afxvzOjqw-vxUAED@FV6GYCPJ69>
 <b6a9b568-dd09-4414-be57-6b9cd282a43c@nvidia.com>
 <af4lBIJdCuN5VKq_@FV6GYCPJ69>
 <20260508175213.1952097f@kernel.org>
 <af7Y4AYv-XDCbK_8@FV6GYCPJ69>
 <580a774b-ba9e-4523-b43a-476f75dd5b12@nvidia.com>
 <SJ0PR12MB68068C50EE9776A3D9060635DC382@SJ0PR12MB6806.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR12MB68068C50EE9776A3D9060635DC382@SJ0PR12MB6806.namprd12.prod.outlook.com>

Mon, May 11, 2026 at 08:21:37PM +0200, parav@nvidia.com wrote:
>
>> From: Mark Bloch <mbloch@nvidia.com>
>> Sent: 10 May 2026 06:02 PM
>> 
>
>[..]
>
>> > I look at it from the perspective that from some CX generation,
>> > switchdev mode should be default. So that is a device-based decision.
>> > I believe as such it can optionally be permanenty configured (nv config)
>> > on older device. Why not?
>>
>Because sometimes switchdev_inactive is needed and sometimes not.
>Such knob is not device decision.

That is what I would call corner case. In that, user can use userspace
configuration to change the mode in runtime.


>If it is placed in the device, orchestration needs to yet use additional vendor tool to configure in the device.
>And that theoretical tool cannot even run yet because driver is not yet loaded.
>
>That sort of defeats the purpose.
> 
>> This is a deployment policy decision, not a permanent property of the card.
>+1
>
>> The same adapter can be used in a regular host/RDMA setup or in a
>> switchdev/offload setup. If we store this in NVM, that Linux switchdev policy
>> follows the device across hosts, kernels and use cases, and can surprise the
>> next deployment that just expects a normal NIC.
>> 
>> I'll send another RFC v2 with support limited to:
>> devlink=[...]:esw:mode:{ switchdev | switchdev_inactive | legacy }
>> and let's see where we land with that.
>> 
>This looks elegant to me as well covering all eswitch modes and still sw is in control.
