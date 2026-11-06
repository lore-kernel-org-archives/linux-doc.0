Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968053;
	b=whaRloPLZEDT2j19S5iUOreQfZK8uR7qUgPiEvd1p4ElA+B4h/XHjMrNxLIJWl1TQRiW
	 ulVlURVmh+k8SZaMKheopFLfQMrsYPbvRCRk7Kw7/7AFFGWjVNUb2F28I6W3s67bvHsaP
	 bby6r5xtqQELmTfvup6DntJpiafe3ZPHG/t5zXgUv1MIgQ3IxtPjNQDii2QctWXFqpTAO
	 8pZOdwhFTuDpAtfTD+VuhX7ys/Is2st1pGmEpwKi790UMBbO3iPWCrvAtZLuEAUoIc/Dk
	 eycb/rg0kNsWAU9SRcy7Fs22YYzgHSRJj3xhlLBzWpBz312ORQAP7nClQwgYQ8P17sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hVQgj/qtamPKqZe9GjDSaLmwvkqiYswM2rlF0amjSwA=;
	b=iVE8NSkGme1scdHP6L7gON5Xr1dpj8u3ifMpmQ7SyYvw3ZzUoZ0/KAvUg+KOIfmM8IGv
	 n5ekQzWcEug5HiFVMmA7FTLE8V8mhdgKoaEWBjJLBF6AX27j/hCAJGtnl+5bWlQQscNTx
	 8En4dDsB/BU1IMxGiNv4ELL2/snz71u7ze3mBTugEomiSzXdM1jg8UrkvB5vqDg4r7ibI
	 9VPmNQ9+ot4Z4hkdEFPYd0tLJ2gkHhdJj6UbqYwd41NChBmmIBfyUZoAZzLJY5CH6P4Xx
	 kFsLIhHqozodLFrzDaG7gbRSfCSgRFBReT4AHLC6SMPCZod8Y8Kq4+WYE6AVSqtAmNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Slzp+EhU;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCF7606A32E
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 12:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCF7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Slzp+EhU
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so4154255e9.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 04:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793968049; x=1794572849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVQgj/qtamPKqZe9GjDSaLmwvkqiYswM2rlF0amjSwA=;
        b=Slzp+EhUlrouRtTK7cIqBLFjFKtffdW/HyvUHLYmJw7XjmBeYevm8Lj12xNdvJ+2qi
         liAcKT2C2BgvihbgNMzb8b3i69eta9Ggy22EKuffT47ojjRQQeUZUlL0+CMrIOXXRdN+
         sRLJx6nb9Q70/SrkYjnSYGmXCsN58DJZDOsQf3cuKue7biIpYuLYhoQmYvNYoUk6fl9O
         lbOnIYtMBTTw5XM6N7cJWvWgsAPf/swDvDDEU7e0iy8FWBxtte++wUHhFiZsO9OPSdTN
         CsUi1P7v2jyC3Rb5umcVVSNAGKgE5NKtIg3wR8TSSyEYwPS5r+U3dUbei/vxB4IV5Zoe
         WKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968049; x=1794572849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVQgj/qtamPKqZe9GjDSaLmwvkqiYswM2rlF0amjSwA=;
        b=lWRr4v6AOM4+s+u+XoqSZ6YBFbPk2KIqFAHGwlOFw40RezzNzCFFblterQisukK9GU
         E0epCtMG/0rHZKKL/+tf970DbNSSn3Ce82c9G9T2MlMhBDnrshk/8onh91R+fw+2kxTv
         ebgPEIVVFBZ/gjaurvF4hWCbwDlWIYTWRFKV15f9LRA+a0l9l3MwdvJse3nlbTVugeKk
         3cYOrIoVukP4UZpgdm+Dm7LJPxwOF7p4SFh7p6qqdclmqY54ChgkF4mXetbirkkBHNG/
         jrVjn/pSCFgw1r80YlbJ4AT54y5gn1cxvwr8YIbnx2uyg9FgR0+5AgwVTLoNnNrnFD9V
         upCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyqxgVw/CKggzLtSA6pHvBi+GZei2GQKmZUz3FG7IJJDoCv20pop4w4e8feEteu0lcu7oqHI1GIi8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s1RgnkhNfBsSTozM1XTZHJNKX7D0xBaVaB2QBLC2K0MBk4De5
	8ZksItUeJvDqOwO5zyNJsNDQCQwjAT21KJ402isXkMjORVLPUnci28vZ3ep7tg43rpg=
X-Gm-Gg: AYBFou0vY3Do0GEL6idU7I8y86c0aP0Js+xX7vfI8P+nNRXuRahVvAtW8lFClonEcTC
	opZ+tGvg2TMmMSL8d5koMmbgxsKXB7dkfadSVeCdp4aE+BmR11u1ji6+BAl38WwHnwWiG3y3IW4
	vOHa0Zm/9HGomGMYbHFZKGe/gh9ZOneS1P//iars6YGK8ayjv15XQE4UTgAVYWK2XPIB/hI9ffp
	WQ+q1PabeGSH+baU5dweK9OlT8Byv3hendn3+UwI1siW272e0dWlWVOoksfpZjbH+aAWCV9Kqiw
	Mp6AgkH34ZDK2pYQi1PTU07v3Wn08blZFOEEjVOjqVWnTCr6XadbpuMygLs5WbpPn7J0OfqHqUo
	TTewMl24Ru6SCyNPTqN4lgiANgEzPi+ih+mLN3EM+IcbVO+K+UGDcidPlOPWQXPzfCV83hPxcPh
	RJyTbZMUCGMT+kRaNmRKnKKunOX5InXLD4envto+qELdS0CzOluDyoO/eWhvel1J2jQNPIR0b4D
	VJECddxN706D/8kB1l+IZSsnWeZzF9up8BrzoDU6K3B0fw7TCwOqdk72G8/UJDeeDdNEaT5ZHFP
	jJiOfzAn0b+QhfREA/rjq4b4azsxYoV325a3
X-Received: by 2002:a05:600c:4454:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4b6dfba8640mr38712955e9.23.1793968049321;
        Fri, 06 Nov 2026 04:27:29 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e1b5d745sm51444055e9.6.2026.11.06.04.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:27:28 -0800 (PST)
Date: Fri, 6 Nov 2026 13:27:24 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Petr Oros <poros@redhat.com>
Cc: netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, 
	Ivan Vecera <ivecera@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 00/14] dpll: add a simulated DPLL device
 driver
Message-ID: <au3HhHt5LD5scvn1@FV6GYCPJ69>
References: <20261105151852.1844305-1-poros@redhat.com>
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
In-Reply-To: <20261105151852.1844305-1-poros@redhat.com>

Thu, Nov 05, 2026 at 04:18:38PM +0100, poros@redhat.com wrote:
>The DPLL subsystem has no in-tree driver that can run without real
>hardware, so core changes and userspace tooling are hard to exercise in
>CI, and the pin-on-pin and reference sync paths see almost no coverage
>outside the vendors' labs. This series adds dpllsim, a simulated DPLL
>device driver, together with selftests that run against it.
>
>The driver is controlled through configfs, following gpio-sim. Writing a
>clock ID into a device directory and setting "live" to 1 registers a
>DPLL device with the core. Pins are directories under pins/ with their
>type, frequency, direction and priority as attributes, and all of them
>are registered when the device goes live. The split between creating
>the configuration and going live keeps the register and unregister
>paths reachable from userspace, so they can be exercised repeatedly
>without reloading the module. Nothing in the simulator is a stable ABI.
>
>The patches follow the shape of the zl3073x introduction. The
>driver starts with the device alone, then gains pins and the static pin
>operations one at a time (state, priority, frequency, phase adjustment),
>and every feature patch is followed by the selftest that covers it. The
>last two patches add concurrency stress tests and reference tracker
>leak tests for the lifecycle paths.
>
>The simulation loop (lock state machine, phase and frequency
>measurements, monitoring features), the topology features (MUX pin
>hierarchies, reference sync, media failure injection), netdevsim
>integration and device mode setting follow in two further series once
>this one is in, to stay within the 15 patch limit.
>
>The driver and the selftests were developed with an LLM coding
>assistant (Claude Code) working under my direction. I chose the
>configfs design, the split into one feature per patch and the test
>scenarios, and I reviewed every line. The assistant wrote most of the
>code and the first drafts of the changelogs, and it found and fixed
>bugs by running the suite on the lab host. The series then went
>through several rounds of an LLM based patch reviewer whose findings
>were fixed, and through a mutation test in which deliberately broken
>driver and core code was caught by the tests.
>
>The selftests live in tools/testing/selftests/drivers/net/dpll and run
>with "make -C tools/testing/selftests TARGETS=drivers/net/dpll
>run_tests". By default they create dpllsim devices; with
>DPLL_DEV_ID=<id> the basic and feature scripts run against an existing
>device instead, so the same suite exercises real hardware. The whole
>suite was run through the kselftest runner on an ice E810 host with
>CONFIG_KASAN, CONFIG_PROVE_LOCKING and CONFIG_DPLL_REFCNT_TRACKER
>enabled, against the simulator and, with DPLL_DEV_ID, against the ice
>DPLL, where the tests that need a simulator skip and the pin state and
>priorities of the hardware are left as they were. All pass with no
>warnings in dmesg.
>

set-
Acked-by: Jiri Pirko <jiri@nvidia.com>
