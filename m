Received: from mta1.migadu.com (out-69.mta1.migadu.com [95.215.58.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9184E5321
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612001; cv=none; b=GAmh9LZ1cOK+sX4jaCtUToZ1dGQhoJ/7H55XjYDQvJQeDnSf0tuCZdWSuAieMio4wsK9nmCjin34O3e4MrOr1VwlHUIUC3lettsp0TbajlmdmKkZQwgdBnt1uwrP15UkT9ubFHBBe48wArYq3PH24XlBesQO2RjJtO4R1O1NK38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612001; c=relaxed/simple;
	bh=VCYMxlYVrU0ZRUnBfl0gDlG7/5tTg9Tcf8QxOVlz+MI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Db/EWI6P+BPeQk3VxYep9cJIqaVpHx35BfysB5I9McgfMmIB5C9cxW1EQyPnquzvj+B3aFxHVX8avTn4+4yF8YRafdjWcBW1wxDnaOQ7ES32yk1yQcpI33nUV0kPg4ihKzr7R/7fWx06AbmS3YOYiCHGMnicOVEqpeoIA04dtrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vQh0M4Yg; arc=none smtp.client-ip=95.215.58.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vQh0M4Yg"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VCYMxlYVrU0ZRUnBfl0gDlG7/5tTg9Tcf8QxOVlz+MI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790611996; v=1; x=1791216796;
 b=vQh0M4Yg1wixJ1KHV620RrP9HGBHGzFluIoHZpbRs+hsKnnGrX16PjbjARj2ASFm/bxt1qL1
 PW4f9knL0flVZH42oUHWRjJAzWdJVMwcnNxNTa0qFWtSx8pY+ZScJV+YaT6DcElEu28xCVGxcL1
 pEGUFLfu8UoSeqUFQQP7tjsg=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 913ce9d7fd73fb05;
	Mon, 28 Sep 2026 16:13:16 +0000
X-Mizu-Trace-ID: 913ce9d7fd73fb05
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b8ea0ca5baso11778e87.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 09:13:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwVQQ6NyUtBNO7lUWHzbGQOHOWgI4joH9go+7iBcOWZRlh94Qi3UBJC8IrI0kKw4dd1q+PWt2N4REw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEkrckXf2s7g9won+z6t5dAyjzUZZXArh6utjuAQ+Yx9kmnTGP
	ScQPY4kN7xfSNPm6tfO08LqiT6FhHP9LfLxjhQBCZHKhCAGL8QawI4t9mbLcy7tPIwsnaQ5l7f0
	QQc1QcrgIHX88JlaCBf2lDv8Wqx/yfPPCWKlkgIKB
X-Received: by 2002:ac2:4650:0:b0:5b8:f142:cf3 with SMTP id
 2adb3069b0e04-5b8f1420dc7mr105362e87.11.1790611989788; Mon, 28 Sep 2026
 09:13:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928152507.2116110-1-fuad.tabba@linux.dev> <86cxtx4bbp.wl-maz@kernel.org>
In-Reply-To: <86cxtx4bbp.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 17:12:33 +0100
X-Gmail-Original-Message-ID: <CA+EHjTymQqcARDNHHDvkjFvEuf1C78NsvPJwcnaH4bOu-m9tQw@mail.gmail.com>
X-Gm-Features: AclHuK-OWctusFN_TR3hIpHHx8_H0y3i7Oz0Ee1onONuAo5w9l_i54qFA-ucEZA
Message-ID: <CA+EHjTymQqcARDNHHDvkjFvEuf1C78NsvPJwcnaH4bOu-m9tQw@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] KVM: arm64: Nested stage-2 walk error handling
 and other small fixes
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jing Zhang <jingzhangos@google.com>, Karl Mehltretter <kmehltretter@gmail.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Mon, 28 Sep 2026 16:58:34 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > retiring with the fault in PAR_EL1. Reporting the unreadable descriptor
> > as a Data Abort instead, for the stage-1 walks too, is a separate
> > change I'll send later.
>
> Why later?

The loop fix is small and stops the hang. The Data Abort change
replaces the SEA-in-PAR_EL1 reporting at the four walk sites in at.c
and nested.c and has to stop the PC advancing past the AT. I haven't
done it yet, and I didn't want to hold the hang fix for it.

[...]
> My definition of a series is "an ordered set of changes that have a
> common theme or form a progression towards a precise goal". This is
> not a series, but a patch dump.
> </rant>

Sorry about that. When you asked me a couple of weeks ago to group
related patches rather than post them one at a time, I took it past
"related" and put everything small I had into one series.

I'll split it. The nested AT walk fixes with their selftest as one
series, with the Data Abort change in it if you'd rather have them
together, the SMCCC filter WARN on its own with Oliver's change, the
three documentation fixes as one series, and the two selftest leaks as
one.

Sorry again :)

Cheers,
/fuad
