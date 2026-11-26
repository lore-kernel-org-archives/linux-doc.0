Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684515;
	b=Mds7uhnfJdHRns6g8D/Gy7wEUzDWtrAfEH7Gai1q0QOKJld5m96CoLMEdvs/Dxlh06jB
	 WDqxMwd+NxG5FnxCL9KU4wNNAppVZDTL+mqBnoMU/fgLagjsceCgfdFEwvlHnEVxc+c1A
	 QZYZsDsTjGuxI/E9ErANKx8zAmxIAQIvCzb2Of1wPh1bMhJC0u3cE7ObT5cKZhDQTe48u
	 rlwrQJUdXrvCvdXkbvGnw0Q44hN3qXzONc3ewttRkCxzdIrw0Q0Sow6Dmq1LOt5aGl4yB
	 r+tnFzocB3NOs8X5GuuBO33EJ9gI/9ErYc8BIiEp5xdUT6g9xNx2u1iigM3netLtLaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nOvBGWrpieXjeYeaYeQ4iz+dQ3K5Ruh6yQGDubq0gG0=;
	b=0wzFo0YeSpgFeEF6JVHw3jWVPEJc8zadCXQTEJETeGVJ3+yOh3oCtABkWVjr3qdqVJoG
	 dCvmQbVZh0kP8DlwkcEV6Ns7lL1wYtP8ubddD99T2+bzleh3q0Wifh0qT2n1WsU8Q1Ry8
	 fPyT+NyERBVC/vl477tqVqRnOQn9EXdFSax3yNj1OhINF160xZQYdX30YSmtv77UqB14C
	 PVAMFlHbk8jntc6rvusizrJ6b/3rcrb71X87qBvfl+bxQ+D7LJH1AZKfZCY8+SYq+g3XW
	 1sJWvUbkj8TxMenNoKPcR6oTDyalnKefU7locjkYKBkHWRcNeDddQd00hh11597qDhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1eo+N4W;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C0A606A326
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 09:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C0A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1eo+N4W
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49412eb1474so4387658f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 01:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684512; x=1796289312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nOvBGWrpieXjeYeaYeQ4iz+dQ3K5Ruh6yQGDubq0gG0=;
        b=c1eo+N4Wiv7EjKxwfcL3tfFeqHu8x6Krnvw93i6u/jfF+sGc2puye5EC9fpm2hHm1y
         fDnPfexBgEGfMjM7yd2zgZdeG0kXNj/pJAQKzYVw85wcUfnVroYZ4LnFf5d3XZ/Hv+et
         1W7P3Rigw2cYBsDwlqtzjOLuiE3LksmY9qibSpKVPbmGoMONoBR+FKIvmzf2IGbeBtlX
         LV/KklZVuZLt7eJDYLih0Yky1NMgailveCaxPt2g4YN8gNC8BObSJB3ml6e0M+688hle
         bflyxMYc4YeEGyPXz4l2LwullUHtEyF4tGS9y1EHOuIJzjQM31WoHbD79J5yLXPq36gm
         260Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684512; x=1796289312;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOvBGWrpieXjeYeaYeQ4iz+dQ3K5Ruh6yQGDubq0gG0=;
        b=cWFipWJc7x55SaRhp3VRv1ojH/5AtkPYw84qo5nGppfDvAjbxcAy6KTwhWpyD71GmP
         cEk5CgVqIN+STuPQo1cX0PRxtzT7eai2Pnx4mfq6RyC8IKc3u2S7/i3ObQYRwMB+VB7J
         fgQnxdHtjsskk79kmJaWS9rrJ3YhsHvZpEHP6HibuLgmNuPpR5TQSBUjIwsAs7XpumF1
         U7HQGfk/ith5KWQ2ngrU5sLSmMmSEGJx0QWIcDhWFJXI0G6dmFVK4X5hG4k6PYkDaVZc
         SU3Q4mqpsHj4Ce0YxV1bUZUuIi7ISX9l/Nd4Vr7oq4jktXJOUubImi7LYpeDo1rlCSX7
         235w==
X-Forwarded-Encrypted: i=1; AL+hErH903QaNfPDqIfW2o7zbklUAX+Pr8wQcjlBuUaMjBFqiLzg3r2fPHhC/U5CDbSFPLMTNvJ8MZK0hME=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5pWYTvI2f7vz0aSoQpOMTdWND3A09CEw5nEk54ZnI7OqTgjUj
	mBFPbSflF5l/GRQpYt7VJr/C8kFzO7vGOrZgI3vYzrMASJqox3BMu/Qx
X-Gm-Gg: AZFdTZc0A/rtDs2Daer4c+s/65kBonKADTbG8DkJdnkn+Q4lEmNzfjKXNIc51iUa38q
	C5XbfwDcfseJfgyCblbAi+7RoFPz89pSZks6Yinj1JFM36pMMQS0aygKXiBiD1BjiQKsX6cZMoi
	HDbVilH7FacKAuUDronVh/xAweaevTWys37GlJZMck+PMIWWIyf/3IYzCpYHZafK7uZ2l4FRz5C
	QhVl38rPj3jlAkE8wKbMaqUZWWQqu+X/vF2uFu5g43PC2rNlu7+zbyeYx89OnRW7bJ/cqJQIx0E
	vfIu0Kc3jpSfJmJrcTWJ5ejAPqOqCrpW/q/vxs4n0u0uObXJdrpqzsFiwQ8pav3KwgCeCSEpIvQ
	ry6TYaqxhyB/5mb+C7w16aJlrb/m7EqUS4bkQbbAjApNCNi9rW27F6gjrmR8Q8Nv67Qjeb8Kbm4
	jM8O9Ti/ngfcgfYcYPlKpcJ2nAOrlP6Frl2NsqRg3uVy7QVgVzX12WBwxfPa9D5aKwBIi66+WhI
	Pp/qPyfmB7y7H4zA2QurcRVoPcOPsj3GAIycs88qdQuYBV+IM1naRHRnPNKyCyJ+zztM4cXwnNI
	ABo17mttLSYUA5oDQlMglI6ooKOsm3uvfkmkQTiJAZUO1GlQHRjS3NgS+Sqj2HMmfUg=
X-Received: by 2002:adf:e009:0:10b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-4abb4c7ab68mr28124075f8f.26.1795684512114;
        Thu, 26 Nov 2026 01:15:12 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm37029320f8f.34.2026.11.26.01.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:15:11 -0800 (PST)
Date: Thu, 26 Nov 2026 09:15:10 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko
 <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Min Li
 <min.li@microchip.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek
 Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, Grzegorz Nitka
 <grzegorz.nitka@intel.com>, Karol Kolacinski <karol.kolacinski@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Petr
 Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v2 0/9] dpll: do not serialize driver callbacks
 under global dpll_lock
Message-ID: <20261126091510.7ac67b35@pumpkin>
In-Reply-To: <20261111164021.273409-1-ivecera@redhat.com>
References: <20261111164021.273409-1-ivecera@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 17:40:11 +0100
Ivan Vecera <ivecera@redhat.com> wrote:

> dpll_lock protects topology and object lifetime, but it also serializes
> all driver callbacks in the system, so one slow device stalls every other
> DPLL device, whichever driver it belongs to. mlx5 callbacks issue firmware
> commands with a 60 s default timeout, and zl3073x callbacks can wait
> seconds on a driver lock held across ToD writes and phase steps.
> 
> Make dpll_lock an rwsem for topology and lifetime and add a mutex per
> domain for callbacks. A domain is all objects created with one (module,
> clock_id), in practice one chip or card, so channels of one chip stay
> serialized as drivers expect, and they still block each other. Device
> callbacks run under the domain of the device, pin callbacks under the
> domain of the pin, whichever driver registered them. Only one domain lock
> is ever held, so domains have no lock order. A lock per device would not
> work, because pins are N:M with devices and callbacks notify sibling
> channels.
> 
> The driver API does not change, but a callback can now notify only
> objects of its own domain. Patch 1 changes the one in-tree callback that
> does not follow this.
> 
> Registrations across domains exist in the tree only on E825, where ice
> registers fwnode pins of an external DPLL with its TXC and TSPLL DPLLs.
> These callbacks are no longer serialized with TXC and TSPLL, they rely on
> pf->dplls.lock, and requests about these pins wait while the external
> DPLL is busy. Intel folks, please check that this is fine.

Isn't the big problem with callbacks handling deregistration?
With a global lock there isn't a problem.
But as soon as you do anything else you have to have very explicit
rules to safely deregister a callback without either a UAF or an ABBA
locking issue.

I don't see this being mentioned.

David
 
> 
> Each complex of a dual complex E825 has its own DSN and so its own
> domain, but both use the CGU of complex 0. The lock for the registers
> they share is in a fix sent to net [1], which this series needs. Without
> it a test lost updates of them.
> 
> Patch 4 is the only patch that lets callbacks run concurrently. Patch 5
> adds KUnit tests. I also tested each commit with a mock driver and YNL in
> QEMU, with lockdep and KASAN, and the tip with lockdep on two systems:
> 
> - A board with ZL30732A: every notification the driver sends from a
>   callback, concurrent traffic with PTP, driver reload and rebind.
> - GNR-D with dual complex E825 and zl3073x: callbacks of the pins shared
>   by both drivers, TX clock switches, RCLK pins of both complexes, a port
>   going down and up, and both drivers unloaded and loaded in either order
>   under load.
> 
> mlx5 is build tested only.
> 
> On GNR-D, with ToD writes running on the zl3073x and requests waiting for
> them, requests to an ice DPLL took 1448 ms in median and 3.9 s at most
> before this series, 0.2 ms and 0.3 ms with it, the same as when idle.
> Requests about the pins shared by both drivers still wait for the zl3073x.
> 
> Changes in v2:
> - Dropped "ice: dpll: serialize changes of the SyncE CGU registers", sent
>   to net with a fix of the SyncE divider [1]
> - Addressed the Sashiko review, see the patches for details
> - Added Reviewed-by tags from Petr
> 
> v1: https://lore.kernel.org/netdev/20261106121005.1327603-1-ivecera@redhat.com/
> 
> [1] https://lore.kernel.org/netdev/20261110094350.184185-1-ivecera@redhat.com/
> 
> Ivan Vecera (9):
>   ice: dpll: notify TSPLL lock status from the periodic work only
>   dpll: add domain object
>   dpll: take domain locks around driver callbacks
>   dpll: convert dpll_lock to rwsem
>   dpll: add KUnit tests for core locking
>   dpll: reject measured_freq_get for foreign and on-pin registrations
>   dpll: zl3073x: update locking comments
>   ice: dpll: update locking comments
>   dpll: document locking rules
> 
>  Documentation/driver-api/dpll.rst         |   48 +
>  drivers/dpll/.kunitconfig                 |    5 +
>  drivers/dpll/Kconfig                      |   13 +
>  drivers/dpll/Makefile                     |    1 +
>  drivers/dpll/dpll_core.c                  |  204 ++-
>  drivers/dpll/dpll_core.h                  |   34 +-
>  drivers/dpll/dpll_core_kunit.c            | 1580 +++++++++++++++++++++
>  drivers/dpll/dpll_netlink.c               |  117 +-
>  drivers/dpll/zl3073x/dpll.c               |    9 +-
>  drivers/net/ethernet/intel/ice/ice_dpll.c |   24 +-
>  drivers/net/ethernet/intel/ice/ice_dpll.h |    5 +
>  11 files changed, 1919 insertions(+), 121 deletions(-)
>  create mode 100644 drivers/dpll/.kunitconfig
>  create mode 100644 drivers/dpll/dpll_core_kunit.c
> 
> 
> base-commit: 368fbf5d82da9ebce309449c74fc0b128f7d0219

