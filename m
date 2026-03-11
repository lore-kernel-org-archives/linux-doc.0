Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C1837187F
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244495; cv=none; b=MQWujejolZL5lSTUlxwEt16Yk5T+ntL3+UQmb/LypDirxFMdZZznxN8pKndshUgOdRWTy2SQkBzPrs6jct/+7VE9JNxstExJZrZ91g9GcY5UnD3e5IH/5V1IXBlH2LH4Xq6JkWcaBXA7qgmjDtijhOPMi7JcBRgiYBcn0ImwZR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244495; c=relaxed/simple;
	bh=YKjY+UGKijHBRvBSoRk9UbtgtmXFWKdb1iUQAGGik4A=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0k0NabCJUho4elGlTlU4RE60R1ZffkxCeYkvnLqmNbykorqwoUPCF9jynq3eq+tX7I1Z8L7LYwy0WnNyZX++C/59g3t4VpOTRZo11wn3UvJF7lSWgKGRtGT06IjPm/NdU2aV9HxATcPHNztu46tkfOlZXHDyqz7Q8IPIDjNEhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hz5jicxm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hz5jicxm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62AB1C19421
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773244495;
	bh=YKjY+UGKijHBRvBSoRk9UbtgtmXFWKdb1iUQAGGik4A=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=hz5jicxm2xpGdd0YQ0b8wqXiNJpGrLa2d6JIp2QqfSIJBKy6gWQIgpOsVu0irHusQ
	 v9qDa+4QTvcSSC3G2yGXLvgoeyIyPWQbiG+LmL1II50jdHwq18Jl8ULhvVhptTO4jE
	 V7AaUUMcWwLSYJeMQ3YwsT/IulcG2OtQJJPioKV/J3nHqDbetYvhpP8wmj4yL10VYY
	 XdlNYXtj/9kPVXz3z63ylsgGXqsgo/HI64C2f0TGEUOu7ShC8AeqnSLYExt97QFmWE
	 s03AioUUjJ9QqWRy8odDWK1XuHJG+jDu04bmQfFDlyfcVMmSHa+TKCo4J40fpQBaTm
	 qH/Tz42vG79vg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38a5584e31fso9650801fa.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 08:54:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDuzzxjB1v0xREzWtpQqSTFuEFSc5/IKLGyiuJ98SVF1rvanULN4LRlBUCDv3q0hNXki+8w0aGfYo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+qiceTtWiw/lGBcd9+UWzwR6QBR5RdJagSkydbDExJviinueh
	hjWArPtFO2gUr8FgtB9RU2qVfTCKexc/4YxEoPW5SvNl+xhqVQqxC+XcrlRipPXbIax0bumCrXI
	rc74smAVqbrTLFdrp5g3UF3bgpar/1wh+imaCyRv7ow==
X-Received: by 2002:a05:651c:12c2:b0:38a:4e8d:747 with SMTP id
 38308e7fff4ca-38a72794174mr379221fa.1.1773244494063; Wed, 11 Mar 2026
 08:54:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 08:54:52 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 08:54:52 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <abGOrRSJNB6zC8Vz@tom-desktop>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
 <20260306-reset-core-refactor-v3-13-599349522876@oss.qualcomm.com> <abGOrRSJNB6zC8Vz@tom-desktop>
Date: Wed, 11 Mar 2026 08:54:52 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfi7qJ2VvaUy-OQmV6hz_GjFstsHkt2iYyrTUPDgyKGCA@mail.gmail.com>
X-Gm-Features: AaiRm50xWjsR4dN1Sxt7vEz40dfWV6nMsm_tDlHXEvZksYBji66qcti2hwuMNzA
Message-ID: <CAMRc=Mfi7qJ2VvaUy-OQmV6hz_GjFstsHkt2iYyrTUPDgyKGCA@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] reset: convert reset core to using firmware nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	brgl@kernel.org, linux-doc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Mar 2026 16:47:57 +0100, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> said:
> Hi Bartosz,
> Thanks for your patch.
>
> On Fri, Mar 06, 2026 at 06:22:57PM +0100, Bartosz Golaszewski wrote:
>> With everything else now in place, we can convert the remaining parts of
>> the reset subsystem to becoming fwnode-agnostic - meaning it will work
>> with all kinds of firmware nodes, not only devicetree.
>>
>> To that end: extend struct reset_controller_dev with fields taking
>> information relevant for using firmware nodes (which mirrors what we
>> already do for OF-nodes) and limit using of_ APIs only to where it's
>> absolutely necessary (mostly around the of_xlate callback).
>>
>> For backward compatibility of existing drivers we still support OF-nodes
>> but firmware nodes become the preferred method.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> Just to share I'm seeing the following on RZ/G3E (next-20260310):
>
> [   16.806538] ------------[ cut here ]------------
> [   16.806546] WARNING: drivers/reset/core.c:1195 at __fwnode_reset_control_get+0x474/0x568, CPU#3: kworker/u16:0/11
> [   16.806566] Modules linked in: reset_rzv2h_usb2phy(+) rcar_canfd(+) rtc_isl1208 can_dev ecdh_generic ecc rfkill renesas_rpc_if fuse drm backlight ipv6
> [   16.806603] CPU: 3 UID: 0 PID: 11 Comm: kworker/u16:0 Not tainted 7.0.0-rc3-next-20260310-00016-g866b1999e3fc #17 PREEMPT
> [   16.806610] Hardware name: Renesas SMARC EVK version 2 based on r9a09g047e57 (DT)
> [   16.806615] Workqueue: events_unbound deferred_probe_work_func
> [   16.806627] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   16.806632] pc : __fwnode_reset_control_get+0x474/0x568
> [   16.806638] lr : __fwnode_reset_control_get+0x164/0x568
> [   16.806644] sp : ffff800083263930
> [   16.806646] x29: ffff800083263a30 x28: ffff0000ff8370a8 x27: ffff800081d8d590
> [   16.806655] x26: ffff800081e3a6c8 x25: ffff800082fec430 x24: ffff800082fec450
> [   16.806663] x23: 0000000000000000 x22: 0000000000000003 x21: ffff0000ff835940
> [   16.806671] x20: 0000000000000000 x19: ffff0000c0294e98 x18: 00000000ffffffff
> [   16.806679] x17: 6e6f637478652f79 x16: 68702d6273752e30 x15: 303230303835312f
> [   16.806687] x14: ffff8000831a6200 x13: 00363038343d4d55 x12: 0000000000000000
> [   16.806695] x11: 7478653d4d455453 x10: ffff8000827b0ab7 x9 : 0000000000000028
> [   16.806703] x8 : 0101010101010101 x7 : 00000000736c6c65 x6 : 000000000080a3f0
> [   16.806711] x5 : ffff800083263864 x4 : ffffffffff604034 x3 : 0000000000000000
> [   16.806719] x2 : ffff0000c0128fc0 x1 : 0000000000000000 x0 : 0000000000000001
> [   16.806727] Call trace:
> [   16.806731]  __fwnode_reset_control_get+0x474/0x568 (P)
> [   16.806738]  fwnode_reset_control_array_get+0x84/0x134
> [   16.806745]  devm_reset_control_array_get+0x54/0xb4
> [   16.806751]  rcar_gen3_phy_usb2_probe+0x108/0x5b8
> [   16.806762]  platform_probe+0x5c/0x98
> [   16.806770]  really_probe+0xbc/0x29c
> [   16.806776]  __driver_probe_device+0x78/0x12c
> [   16.806782]  driver_probe_device+0x3c/0x15c
> [   16.806789]  __device_attach_driver+0xb8/0x134
> [   16.806795]  bus_for_each_drv+0x88/0xe8
> [   16.806802]  __device_attach+0xa0/0x190
> [   16.806808]  device_initial_probe+0x50/0x54
> [   16.806814]  bus_probe_device+0x38/0xa4
> [   16.806820]  deferred_probe_work_func+0x88/0xc0
> [   16.806826]  process_one_work+0x154/0x294
> [   16.806835]  worker_thread+0x180/0x300
> [   16.806840]  kthread+0x118/0x124
> [   16.806847]  ret_from_fork+0x10/0x20
> [   16.806856] ---[ end trace 0000000000000000 ]---
> [   16.806867] phy_rcar_gen3_usb2 15800200.usb-phy: probe with driver phy_rcar_gen3_usb2 failed with error -22
>
> Hope this help.
>
> Thanks & Regards,
> Tommaso
>

Does [1] fix it?

Bart

[1] https://lore.kernel.org/all/20260310151515.34681-1-bartosz.golaszewski@oss.qualcomm.com/
