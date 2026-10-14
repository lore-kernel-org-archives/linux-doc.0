Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA5C1A9F90
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978756; cv=none; b=il0r3pt3c/mCo3cFqNtOZeqvNCtylFJDmcy5v07vbs0y9QUmCmQy4Flx/8Ks982aS70Yu70XXNtSBVfvXI0fXmXap4Ah7ToGSIt/03c/KY1NFIasAgewdvl+C05o+l1jAEBI6OWchA6MV1hLOKtKt51MeyAIVewg0Xr2ll62hjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978756; c=relaxed/simple;
	bh=YHkNh+k1uYUdhN/GX2GoXGxLYEYQZpiM737GZ/FheL8=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID; b=exNzlXDsRrmMRkWIA43g6EPDxODnHG5pRza4XAorblM1t20HulvOKXnL0QFu/vR99RRmJBqTx4LZM6BvbgO+eCHHDAZCSsvuSVgWo5KfZhC2YK6HTgMy37zYzsE2hU4tKMnynO4BjghjSukWhsFu6MTdRegFl1HrZouEv1ydbaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20251104.gappssmtp.com header.i=@dabbelt-com.20251104.gappssmtp.com header.b=DQpj1y+p; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20251104.gappssmtp.com header.i=@dabbelt-com.20251104.gappssmtp.com header.b="DQpj1y+p"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so2605312eec.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20251104.gappssmtp.com; s=20251104; t=1791978751; x=1792583551; darn=vger.kernel.org;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yAV+C6S/vBnhLrjCXwEiKS2AZjZdz8SQL6UJRh8bA3A=;
        b=DQpj1y+p/3qiq+sSYYq3iG1cWsbOzkkIFXpXJ69W3Gh50mQXMi/VCWgRjrKenRKNYz
         kiJz6VW6YH5NboubWsWsM1aNKAHEdY1R1sTiNox+jJLHk2Dr4pKYtq5x42jKpV/aREwk
         8wA+1qOMBV9GIjW5gHOq4pniYD5yjCYH6YdDay651Hswkh1CBYEztWVEmqTu62b2wGli
         taZSO0Z957GRIS/wSnU4Oqt2eyAIYdBmE0B/pxvfXpbagr25QlRPMy0X/mgJ4qegN2wb
         rUJEowdYUeIHxy6BhhLI6e6F7u4j293jJtNJEfOWk+kqnnFpU9PxlTQiDvPOXyXj1Olw
         OoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978751; x=1792583551;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yAV+C6S/vBnhLrjCXwEiKS2AZjZdz8SQL6UJRh8bA3A=;
        b=nrj94YZLsKH656FIMTvMNVaJdE3+0u/gwtFKdcTXdyrfCWxXG9FYnDxdIJ62bjZwZh
         o3/Xw1nKTJ2ONSbPaku8UCjUBH1I8CgoiDxtpYeKQTIzjK5x5z3S4t/589MT4h4uy5AU
         Req6VJHEJY17ixqUmNRZw0tzRoMkfzxDDKAxyvZxbzmY9hO3/sGOQYvbSCVroIdj8WQL
         ABoMifgMyPA74jRjHQnlgummNq0cpNp+giXrXRapjTl1+aHt7i++3SuBBkYwufpyK3JN
         lX111UZpDDpGf1y9NAu0UlAwpgoP9JW5zzjoFw8iWImPR0PMKaSrfxh0ONETl1U4a4up
         oa5A==
X-Forwarded-Encrypted: i=1; AKwUvBw5Q48CRAfUKkJfcfHGz4995IoCnwjROhYbC0dlPl6Eg3vEkA4cNEGXrqAQlxGWVjx2oqzGXVADcCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKP+TIY14TqUvb5W4zdsB25gYwhJN296tju0XEQy63uOf2RXma8
	1B99vLWjeZxGg4OXqso15dcXOFxAIyftLubWqOERqEW4C6w9DnG6vGGuDaon4Q+RGjM=
X-Gm-Gg: AYBFou0iTvBQFvUpjZcsDD+TgkfWmMlcV5K3JYDUPQ+NN/K4hPTW0PurYIw30y8TR9R
	HNlR51JRN9x+ytQt+ZnFRHUvcu/GLk78i3dO8RezZYA+Eq+byOYVesMzqp0lcBA97YsvFGdHDy2
	MhzNvmsd047qSlfSc20nFb+jQluFzRLgL0AvDrSXkhs95y/IXtRGgwGu4Frm3H7mnurjZzW81Xt
	cAEm20JJsOQV9khrDSW31Jy2poY6YspKSCe0WvCBMbamzdz8BRsUnreo/b2B/CJaAsEVu3uARkZ
	W7xDaBxehHXc0FNPnTzDHOgDtzuv3QOHklkHLTwgaL+LEla9lfqbHp49OjdoCJDPw2B01vSBiTb
	sDLc9bU4HbloAEprqO7LABeU0MFgzv1lzLdhq8lInpXfr2C2u7WMb/SZfmqMIfY9IZtMqeELRTy
	81EGmCEE8Ob9FFRuQKJZi7nmShCkUeq09DjFtvDBqh4527MTAJm0MGzMl3SBTEowam+487ORdAY
	VJnB321CeV6cXJTOzOX7xnJ42rW7GR9vgZ4tj18
X-Received: by 2002:a05:693c:810e:b0:359:861:7cbd with SMTP id 5a478bee46e88-35908617e44mr16791919eec.10.1791978750686;
        Wed, 14 Oct 2026 04:52:30 -0700 (PDT)
Received: from localhost ([2001:5a8:4687:d600:c5e7:8e91:8246:979c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35c89429484sm15935072eec.23.2026.10.14.04.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:52:29 -0700 (PDT)
Date: Wed, 14 Oct 2026 04:52:29 -0700 (PDT)
X-Google-Original-Date: Wed, 14 Oct 2026 04:52:25 PDT (-0700)
Subject:     Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
In-Reply-To: <20260710-romantic-dashing-gecko-e31a98@sudeepholla>
CC: michal.simek@amd.com, cristian.marussi@arm.com, sudeep.holla@kernel.org,
  linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com, vincent.guittot@linaro.org,
  Souvik.Chakravarty@arm.com, alexs@kernel.org, andy@kernel.org, brgl@kernel.org, bmasney@redhat.com,
  dlechner@baylibre.com, dzm91@hust.edu.cn, festevam@gmail.com, Frank.Li@nxp.com, linux@roeck-us.net,
  jic23@kernel.org, corbet@lwn.net, lenb@kernel.org, lgirdwood@gmail.com, linusw@kernel.org,
  lukasz.luba@arm.com, broonie@kernel.org, mturquette@baylibre.com, nuno.sa@analog.com,
  pavel@kernel.org, peng.fan@nxp.com, kernel@pengutronix.de, p.zabel@pengutronix.de,
  rafael@kernel.org, s.hauer@pengutronix.de, skhan@linuxfoundation.org, sboyd@kernel.org,
  ulfh@kernel.org, viresh.kumar@linaro.org, si.yanteng@linux.dev, arm-scmi@vger.kernel.org,
  imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
  linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
  linux-iio@vger.kernel.org, linux-pm@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sudeep.holla@kernel.org
Message-ID: <mhng-8AE63289-05A8-49D5-B38A-F5AA1D56C2E8@Palmers-Mini.rwc.dabbelt.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

On Fri, 10 Jul 2026 01:59:04 PDT (-0700), sudeep.holla@kernel.org wrote:
> On Fri, Jul 10, 2026 at 10:46:15AM +0200, Michal Simek wrote:
>>
>>
>> On 7/10/26 10:38, Sudeep Holla wrote:
>> > On Fri, Jul 10, 2026 at 09:42:09AM +0200, Michal Simek wrote:
>> > >
>> > >
>> > > On 7/10/26 09:35, Sudeep Holla wrote:
>> > > > On Fri, Jul 10, 2026 at 09:03:32AM +0200, Michal Simek wrote:
>> > > > >
>> > > > >
>> > > > > On 7/9/26 17:56, Cristian Marussi wrote:
>> > > > > > On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
>> > > > > > > On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
>> > > > > > > SCMI server from different architectures than ARM that's why remove
>> > > > > > > ARM/ARM64 Kconfig dependency with also remove ARM from description and
>> > > > > > > rename folder to reflect it.
>> > > > > >
>> > > > > > While I understand dropping the dependency on ARM (I always wanted to do
>> > > > > > that and test if it worked at all on some otehr archs with QEMU), I am
>> > > > > > not sure about the whole renaming party ? why is needed just for
>> > > > > > cosmetic reasons ? it is at the end an arm originated protocol so I dont
>> > > > > > see it as a being wrong to be named as such even though used by other
>> > > > > > archs...I have not really strong opinion on this...
>> > > > >
>> > > > > I have been in CC on U-Boot RPMI patches which got to my attention because
>> > > > > I don't want to have another interface for MB-V(riscv-) running in
>> > > > > programmable logic and have another server in the system doing the same
>> > > > > thing.
>> > > > >
>> > > >
>> > > > Ah that's interesting. I wasn't aware of that. I still agree with the move
>> > > > in principle, but how does that align with these:
>> > > >
>> > > > drivers/clk/clk-rpmi.c
>> > > > drivers/irqchip/irq-riscv-rpmi-sysmsi.c
>> > > > include/linux/mailbox/riscv-rpmi-message.h
>> > > > drivers/mailbox/riscv-sbi-mpxy-mbox.c(Should be fine as it is just transport)
>> > >
>> > > I am having separate discussion on u-boot mailing list about RPMI and it's
>> > > usage on non riscv architectures because one raised argument was that it is
>> > > community driver spec compare to SCMI which is owned by ARM. But IMHO only
>> > > for riscv.
>> > >
>> >
>> > IIRC in LPC 2024, we did discuss opening up SCMI so that RISCV could use it as
>> > is instead of copying quite a lot from SCMI for RPMI in some closed groups.
>> >
>> > Here is the summary we got from couple of RISC-V vendors at the time:
>> > "
>> > RPMI is comparable to Arm SCMI, but it includes RISC-V-specific services such
>> > as HART State Management, CPPC, Management Mode, and RAS Agent. The SBI MPXY
>> > extension enables secure and non-secure system partitions to exchange RPMI
>> > messages, allows an M-mode RPMI transport to be shared with S-mode, and lets
>> > hypervisors virtualize RPMI for guests or VMs.
>> >
>> > RPMI development is already well advanced, with much of the client-driver work
>> > implemented in OpenSBI. Supervisor software can access selected RPMI services
>> > through SBI MPXY. A permissively licensed reference implementation, librpmi,
>> > is also available for platform vendors.
>> >
>> > RPMI was created after evaluating Arm SCMI, mainly to support RISC-V-specific
>> > requirements.
>> > "
>> >
>> > I didn't pursue it any further following some of these followup discussions
>> > post LPC 2024.
>>
>> interesting. It looks like that they even didn't try to ARM about it.
>>
>> >
>> > > >
>> > > > Now I feel we need some alignment before making $subject move.
>> > > >
>> > > > > Based on that we had discussed about it with Vincent and Souvik (we missed
>> > > > > you there) about using SCMI on non ARM platform and both of them didn't see
>> > > > > the concern to be marked as ARM only protocol.
>> > > > > Truth is that some of protocols have ARM in description, file names, etc but
>> > > > > some of them not. That's why I think it is good time to sync it up and
>> > > > > enable
>> > > > > running this protocol on other SOCs.
>> > > > >
>> > > > > > ... my concern really is ... wont this full scale rename simply generate
>> > > > > > a lot of un-needed churn for future fixes and/or backporting ?
>> > > > > I don't think it is going to be a big problem because it is just git mv
>> > > > > which git is able to gracefully handle.
>> > > > >
>> > > >
>> > > > Otherwise it may end up being unnecessary churn though I completely agree
>> > > > with the git/backporting aspects. Just don't want to churn things up until
>> > > > we have some plan and further changes/users of this move.
>> > >
>> > > As I wrote above AMD/Xilinx platform with SCMI server where ARM RPU/APUs
>> > > (with multiple VMs) and Microblaze-V in programmable logic acting as
>> > > separate agents is going to be the first user. And for being able to run
>> > > SCMI on Linux running on Microblaze-V I need enable SCMI on non ARM
>> > > architecture.
>> > >
>> >
>> > Ah OK, if the plan is to just use SCMI as is and having "ARM/arm" name is
>> > a blocker, then sure we can get that done. Hope you are aware of and already
>> > considered some of the RISC-V specifics listed above and ruled out any of
>> > those as concerns to use SCMI on RISC-V platforms.
>>
>> I know that we can't maintain SCMI and RPMI servers running on the same chip
>> doing the same things. We don't have space for it and make no sense to
>> duplicate testing on it too.
>>
>
> That is very valid and compelling reason to re-use and agree with your
> assessment. If you can make it work, go for it 😉.

Ya, it'd be great if we could stop duplicating specs in RISC-V land, 
it's just a big time sink.  So

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

if that helps any.
