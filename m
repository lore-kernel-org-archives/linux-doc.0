Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59195374E45
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 18:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778263678; cv=none; b=AuNiNh3DpyAE5bH6FzDrz9lg5H/Z9YIJGhZnnlpjq0T/1Rh5O76KH8xeazZIkxu70P0Y6/IZ5eW1St2+qhr2ki19dUoxIZXTrgPgw9MI7xnsjWYiaTIPiHU1YmsTxANXCpoOVXt8q9V3PvZ7/s98FYPAnk4OW5a2zhOJbK7bNBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778263678; c=relaxed/simple;
	bh=ufqlUDmozp4nL1Tie+ZeU3H7JAYzyL2fgLNlzO2FG2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYHRxBvZu9crZUVpxq6euIfUzaNeIJ5/pGgWRoKy+aDT0okWtYddBCCE8OOb3mByOCDc0areUial3ux+q6gqgkJsq0nomzykTdoWYy6aBPf0uXu4OcvbQif8R2CAJIzuaVr4JYiGqzzJ6As0fOAnCAkDoR8lCpXssBUxeVrF9rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=ogrl6MYO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="ogrl6MYO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891f625344so24192975e9.0
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 11:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1778263669; x=1778868469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s0WKbRowPzovOif48EIjm8s484eRn+yiPRA2nQfqrh4=;
        b=ogrl6MYOvZ2Fiftt2Y//Eh19O6LqsZQHZa95fGvytlIFZu2l+UwKqZem2yWGFg6FhA
         hGkRyWUISEqZ8XBq/huN1SVMb2sGnzB4FY/QwGE9KGxTM+7Qdnb+wp453CA0507MvBKG
         4Ah7lmbqm+eKmRqEWZY6LXzaY/26MrstWYMchklz/r+4ez00Itfji14JtE/n0LU88pgA
         F546OW3H9K9TSKeskjW7wLuDLMFEstP5zu8dKDGdW4djTzF2LEu0v2VJ5OI+XTuytgSb
         jdmyvCq38QjVbqrSItWJZlGB9BgG76Zj1md8J5STJug/xGEqv8xF790ZufviNAQFVbZK
         DZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778263669; x=1778868469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0WKbRowPzovOif48EIjm8s484eRn+yiPRA2nQfqrh4=;
        b=WOGnT7++kSmO/TWxIGUAAH1XdOMKUg3zd2Df/zom5VxB/9P2sfR3Tv4s3fTq6CtQlW
         VIoKIoC5g6PdOexdgacwOvyZumz3IZjgp7/bFwFF5b0zJeFL/SJ4eFfEy0RmFLDSYHBN
         Fd7wA7IyQO+3GvxO1DcCFdGrqhybG2bIZ1zsO78qHdDNeEf3WJm5IpBdJtPd+3bzSWnw
         9X/LcLSAcY8jiRrILAV+6sUwrWnygRSbdSnCifeZ6Uec+FU/fcUTtLTG32hvu4tkLcaX
         7aWDwz7OoclQ50/j86vtZhHJ1oF29XzPbG6DzA35GbHofD451WGE6WImwG72IP4Jr/rc
         N46A==
X-Forwarded-Encrypted: i=1; AFNElJ/xN5TOM9Igj3xDW0/RNfnK9NrFmw2CSilIAouZ4izEGVMe0kB3KkGwPM9OBGZQftUpiZ2zf0IuLxw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0N/mUvR+GNK1acRY0cmKzN/4TwBtek+hj1mb/+avZgJgDCs84
	wzOD/V7fAnl7igElCBCwVid1tBJz0yTBRiejHbXvkrIHrQFb6+y3mx6lNEgcy5YQZ+w=
X-Gm-Gg: AeBDieuSx4EkEUUhN7S4jQe+5qT8HWBDZww7ZOG5bvmlNBOkosbJlq9BJI+ohhlMLsd
	FZ7HqMSroRaiJSNO8muAWiS1JNVHDUSVz/sGiifeaBfXigVeaRTyt09IO/PdksX6IMjWbF/ltAn
	NGXl6mmu6W12cyOaLxDvKJpB6mZScwBvSBnm8LtNkiFjFkO4NXJkVR4ZrV8xfM2Di+KBVQseYML
	W3s1oSdiGORxVv/tBkbGi/8qVS52MsBQY4kt8GOxAoSw3mXWwbJ5L8MAkVDOcIP9GAKK+I/dLXh
	41TjqxNCV8gRvA2R+KzXJ1eMP0OtqQ4oWE7Lfu8nVZLkRQgDn+KSzHqWoy84oKCo9ia4JYKIX40
	81iSDuuZWx3rNB670D/Cyhi15o43/+C3f4Vkr/dqk82V3wIQNegnANMNOSIpbVESfb6OFSpgD5V
	s0hYzW21r/HFUys/lTvU+fafu0pAQxcnCF7xs=
X-Received: by 2002:a05:600c:8b6e:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-48e5dfcd72emr132299835e9.2.1778263669094;
        Fri, 08 May 2026 11:07:49 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d8d4462sm8825735e9.1.2026.05.08.11.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 11:07:48 -0700 (PDT)
Date: Fri, 8 May 2026 20:07:44 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Mark Bloch <mbloch@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Randy Dunlap <rdunlap@infradead.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Christian Brauner <brauner@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>, 
	Eric Biggers <ebiggers@kernel.org>, Li RongQing <lirongqing@baidu.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [RFC net-next 0/4] devlink: Add boot-time defaults
Message-ID: <af4lBIJdCuN5VKq_@FV6GYCPJ69>
References: <20260506123739.1959770-1-mbloch@nvidia.com>
 <aftaW-irGmkfA7FS@FV6GYCPJ69>
 <3f9215c4-7c84-46d9-ba74-30dabe24db09@nvidia.com>
 <afxvzOjqw-vxUAED@FV6GYCPJ69>
 <b6a9b568-dd09-4414-be57-6b9cd282a43c@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6a9b568-dd09-4414-be57-6b9cd282a43c@nvidia.com>

Fri, May 08, 2026 at 07:59:04PM +0200, mbloch@nvidia.com wrote:
>
>
>On 07/05/2026 14:03, Jiri Pirko wrote:
>> Wed, May 06, 2026 at 07:35:10PM +0200, mbloch@nvidia.com wrote:
>>>
>>>
>>> On 06/05/2026 18:22, Jiri Pirko wrote:
>>>> Wed, May 06, 2026 at 02:37:35PM +0200, mbloch@nvidia.com wrote:
>>>>> This series adds a devlink= kernel command line parameter for applying
>>>>> selected devlink settings during device initialization.
>>>>>
>>>>> Following a discussion with Jakub[1], I am sending this RFC to get the
>>>>> conversation moving. I started from Jakub's example/request and extended
>>>>> it to cover requirements from production systems and configurations that
>>>>> customers use.
>>>>>
>>>>> One important caveat is that the parsing logic in this RFC was written
>>>>> with AI assistance. I am also not sure whether the resulting syntax and
>>>>> parser are too complex for a kernel command line interface. This is part
>>>>> of why I am sending it as an RFC: to understand what direction and level
>>>>> of complexity would be acceptable to people.
>>>>>
>>>>> The implementation is intended to support the following properties:
>>>>>
>>>>> - A system may have multiple devlink devices that usually need the same
>>>>>  configuration. For a configuration such as eswitch mode switchdev, a
>>>>>  user should be able to specify multiple devices to which that
>>>>>  configuration applies.
>>>>>
>>>>> - There may be ordering dependencies between options. For example, in
>>>>>  mlx5, flow_steering_mode should be set before moving to switchdev.
>>>>>  With this in mind, defaults are applied per device in the left-to-right
>>>>>  order in which they appear on the command line.
>>>>>
>>>>> The intent is to let deployments set devlink defaults before normal
>>>>> userspace orchestration runs, while still using devlink concepts and
>>>>
>>>> "defaults before normal userspace orchestrarion". I read it as config
>>>> before config, which eventually could be skipped.
>>>>
>>>>
>>>>> driver callbacks rather than adding driver-specific module parameters.
>>>>> A default is scoped to one or more devlink handles, for example:
>>>>>
>>>>>  devlink=[pci/0000:08:00.0]:esw:mode:switchdev
>>>>>  devlink=[pci/0000:08:00.0]:param:flow_steering_mode:smfs
>>>>>  devlink=[pci/0000:08:00.0,pci/0000:08:00.1]:param:flow_steering_mode:hmfs,[pci/0000:08:00.0,pci/0000:08:00.1]:esw:mode:switchdev
>>>>
>>>> I don't like this. What you do, you are basically introducing user
>>>> configuration tool on kernel cmdline.
>>>>
>>>> The same you would achieve with a proper userspace tool/daemon.
>>>> I did try to come up with it and push it here:
>>>> https://github.com/systemd/systemd/pull/37393
>>>> That didn't get merged for unknown reason, but the idea is sound. You
>>>> provide configuration files for devlink object and systemd-devlinkd
>>>> will apply when they appear. Wouldn't this help your case?
>>>
>>> I agree that systemd-devlinkd is the right shape for normal
>>> devlink configuration, and it could probably replace the udev/devlink
>>> plumbing we use today.
>>>
>>> The case I am trying to cover is earlier than that.
>>>
>>> On BlueField/ECPF/DPU systems, the host PF driver cannot always finish
>>> probing independently of the ECPF side. When the ECPF is the eswitch
>>> manager, the host PF is kept in initializing state until the ECPF eswitch
>>> side is set up and mlx5 enables the external host PF HCA. That happens as
>>> part of moving the ECPF to switchdev.
>>>
>>> Today userspace observes the ECPF instance and then switches the
>>> mode through devlink, usually via udev or similar plumbing. That still
>>> leaves a window where the ECPF has probed, userspace has not applied the
>>> mode yet, and the host PF is waiting. With many ECPFs this becomes visible
>>> in host PF probe/boot time. A daemon reacting to the devlink object
>>> appearing can make the userspace side cleaner, but it still runs after the
>>> device has appeared and after userspace scheduling/uevent handling.
>>>
>>> Long term, for these DPU deployments, we would like mlx5 to initialize
>>> directly in switchdev. I am hesitant to make that unconditional because it
>>> changes existing behavior and there is no early opt-out before probe. The
>>> cmdline parameter was meant as an explicit opt-in middle step: ask the
>>> driver to apply the same devlink operation during init, before this path
>>> depends on userspace.
>>>
>>> We previously tried to address this with an mlx5 module parameter. By
>>> design, that was too coarse: it applied to all mlx5 devices handled by the
>>> module. That makes it usable only for narrow DPU-only configurations. The
>>> devlink-handle based cmdline syntax was intended to keep the opt-in scoped
>>> to the specific devices that need this early switchdev transition.
>> 
>> The switchdev mode was introduced at roughly the time CX4 was out. What
>> stopped us from making it default for CX4+ ?
>> 
>> Introducing this horrible plumbing only bacause we were not able to
>> change the default sounds so absurd.
>> 
>> Can we write the default mode as a bit in ASIC NV memory perhaps? Simple
>> devlink cmode permanent param to write it, the driver can read this bit
>> during init to decide the init flow path?
>
>I don't think switchdev by default should mean CX4+ in general. If we get
>there, I would expect it to be limited to the DPU/BlueField/ECPF case, where
>the host PF probe path can depend on the ECPF reaching switchdev. Changing the
>default for regular host NIC deployments feels like a much larger compatibility
>change.

We can't travel throught time, but if from CX5 onwards the default would
be switchdev, nobody would feel broken in terms of compatibility. That
is my point. Having "legacy" as default is simply wrong for never NIC
generations. That is why it is called "legacy" and it should have been
rotten through and out since CX4 times.


>
>For the ASIC/NV bit: maybe technically possible, but it feels like the wrong
>layer. This is boot/deployment policy, not a persistent hardware property, and
>storing it in NV memory would make the state persist across kernels/hosts in a
>surprising way.

Well, as any other nv config, it persists across kernels/hosts. Think
about it as "unbreak-my-not-legacy-device" bit.


>
>I do agree the RFC probably went too far by making a generic devlink cmdline
>configuration language. Maybe the smaller thing to discuss is only:
>
>devlink=[pci/...]:esw:mode:{legacy|switchdev|switchdev_inactive}
>
>No runtime params, no ordering between different operations, just early eswitch
>mode for explicitly selected handles.

FWIW, I'm still against this.


>
>@Jakub, I know you wanted something more generic/extensible, but maybe the
>generic case belongs in the devlinkd/systemd direction Jiri pointed at, while
>the kernel cmdline handles only this early boot eswitch mode case.
>
>Mark
