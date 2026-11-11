Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397521;
	b=0MLRB6cs+Z++7bhjAzJzmrpQTEpau9UOD3Htk2IIiSfe5g5OF/PQ6Xqs7kFabFMbB42X
	 gPX1yTMuwhmZNLxAlWj9rtqkwbPgXazS56nmTU70tfFVRQQmkRkYnXPb+8VZpLvkkvvoG
	 Y7ck2iyonR4jPuU+9s+pKyOcBD+BVOU6Kgft9QopJTbwHajVH07rMnCYuEnN2oz6Kdwi2
	 DnGA0tmnuehJxJohxTpgw+csReiWEPR9Vm3nUCJPjXxhhhNKP4fRjGQT/ATUBGiS9LJfj
	 tiS5g4hvXRSTM0QlBHW2J3EIWtVI/SOYNhj8wA55KGwOtu5hHsVwJD442KnEtfFUAKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=kVFpNKJHonPsoU0rKznaV1aSGj2r5pa7n7k1+LB8yBg=;
	b=KcWYggm1zSPJ4OaAPrLzbOFshAFzx/yePEot8e+bFa/xkgBB6MdhEcqAvY8AOjKndxsI
	 ujOauzsupjKEzoTojLNytznZUOvWDrGC/xkMIL4v4nr9zxWsGDGT0YzFgPk+EmD7Q7gGP
	 SXDwa7xS26GaevJJrVxpNOYyYyjNp8EowFOhcsCfCezq9PHzw7JV/qkIVpGyTs/OH0Sah
	 ibC5cIj4Iw9erjvvehEYAwN/mW91QG0IXifZkNRD3JzkZIYWSs4Z34X7IquJfFqJaTv8B
	 0tfIDXguYCEDwiocKR7u8nARLetnN6WmWtfSWqI3NeWg+HQ6yDOw2abbR0K37SCcEtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=c9DA1cFS;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E8E606A336
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 11:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29E8E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=c9DA1cFS
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99c0c1d07feso1385899241.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 03:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794397515; x=1795002315; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kVFpNKJHonPsoU0rKznaV1aSGj2r5pa7n7k1+LB8yBg=;
        b=c9DA1cFSmxCvO39uVubU9GovzfKszsFQBrJmlM2Z9CBevLDLmE6mQZuJVOweGh6q92
         0i/zFk4uRueqghCvx+g0+EWpI118FoHTAGu+B4lBXBLA4cgYDizfhGfUvUEQ7YGmsFKL
         m+Xp7kjZh8p19s2Oe8TjPO/gkx1lizaudJ41A2Cz32W6t1h7aNO644Jrm9adsvfwrUWb
         T9ISwCJMNe01okSmWCNQRK3WtK7JqMxeGtVhdx7lkJUWuP5P0RRYGt/AOr7mBU5aX3r6
         pRxCfdWUSag0sw8VpJMWFolX9dxNsern051lY7I2xzQeMMO9clCGP/e1NYzjUyXpksnd
         6qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397515; x=1795002315;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVFpNKJHonPsoU0rKznaV1aSGj2r5pa7n7k1+LB8yBg=;
        b=AHJFCF1w0pLEw1+hxKqsMAMCMZVhqZH++5bd9ag5ABaOox3gc1gdhaLQRuq8p03/Zn
         rgYHbVxwRLCMqneWpxi3cl6kOXd5PgTJ0C029sr1xS+5HAHZKBux4yqJIlVQxHhaA6O2
         hZx9DvTZxjbNS+HErf7HFvF6ioU47cTNtWZtkTmL2dmUetSoplU4IpAJhneVRJD9i8zF
         FCJ3vPh5xLihcOhuQR4iAIxuNvBoAAZgchWIObY+pYbHGIBXQEqTs8td7A0Ka0l/gXX1
         E2BM5ZgI84aOx/KgcixbvDBoELM5Ueu/9B5+Jb2DNdksvutyIRJNjnD5wdrEKdpZrrhH
         0qyg==
X-Forwarded-Encrypted: i=1; AL+hErHeDZLfg+WnGdC+mT7+6AlqB74UPXNgOhbG1AyjVv/iv/q8VO6IwgDGcj0TRGmAf4jsHKSjmSGM2Z4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NPtf/UVZP9v2XzR+MxY512d4lMZGy65AXeG2sP4fGghSAYLaP
	Kn+GdjVuVTmpgEDRPCl7Y3rFEeGffqg0Y12UFB0X1LlQ8wO6SMjezGqakRIMuQnBElM=
X-Gm-Gg: AYBFou0nj5eJ7vHAlmMQBVZj3nyk4O0Zg0G05ZrwT1eBtuP6zHa6D3iN5YB7T+zGfAd
	wmw+2hnLFa7w3P846u6wprYHko9tZNaP6K15VDWv+4HuF52SiNEaSBjRoJVoOKQpIDFrmRnVd28
	m7ojZyeIuosGVdmhXEXeVQ/SFxkjFo3gQ7vQStQwx7ctMzOadtAs4mnqM1o4QvtG7SJ/MliLt/M
	r+mGk4z14INccA6M/yUlx/2uPxJ77RqFFcRSWOC9mjadVtoUDOdpzlTjj6vZmmb0XbKMX56z/k/
	r6KaI6Db/wY1ffr1heNaVacdmBHbxc87Pw54sikSE8OvDuwsjtv/69RBI3pRa/2KRGvXPGLsKFu
	6yCrmMvluXJvKkjdBMfmvyoj7UoaE5rS7Vpa7E25XFnZcJw1NRJsM36SmgT7y7JmuH6Vb965vhH
	JGrbqxS/GUxFgKU9TPuSeNBPrF37ZD9PxDNFr4AwlbnA5DuIqViv+TbgmON9tMgxblwn3C05OC+
	n8C5XWIUrbwsaMSfLSs3dN/7S/L+Ce8drdSUmRcGO1PyH/LEMYmB9YcQA/anhVKrM/8PBGcYe39
	h359IgSBC7aMnqhEaihAASFQXKQzvY9k2k8Gkb0ZtnEUqf1J76Y5ru8poq94NecZZ1FMFzTPsNN
	itZ2f+kBf0uLx37vX2XUiO166DRpA0lQ=
X-Received: by 2002:a05:6102:5241:b0:7cc:306:d3ab with SMTP id ada2fe7eead31-7d4efab730fmr666726137.5.1794397515001;
        Wed, 11 Nov 2026 03:45:15 -0800 (PST)
Received: from localhost (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023543casm3548860137.5.2026.11.11.03.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:45:14 -0800 (PST)
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
Date: Wed, 11 Nov 2026 06:45:13 -0500
Message-Id: <DMSCTXTWCJWK.QF8T3E7OJ7L2@soleen.com>
Cc: <linux-kselftest@vger.kernel.org>, <shuah@kernel.org>,
 <linux-mm@kvack.org>, <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>, <vipinsh@google.com>,
 <linux-kernel@vger.kernel.org>, <corbet@lwn.net>, <dmatlack@google.com>,
 <kexec@lists.infradead.org>, <pratyush@kernel.org>,
 <rdunlap@infradead.org>, <graf@amazon.com>
Subject: Re: [PATCH v5 0/6] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Mike Rapoport" <rppt@kernel.org>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
 <179439592040.425130.10808690337075841196.b4-review@b4>
In-Reply-To: <179439592040.425130.10808690337075841196.b4-review@b4>

On Wed Nov 11, 2026 at 6:18 AM EST, Mike Rapoport wrote:
> Hi,
>
>> Currently, LUO freezes outgoing sessions only inside the
>> reboot(LINUX_REBOOT_CMD_KEXEC) syscall path, serially under global write
>> locks, and binds every outgoing session's lifetime strictly to an open
>> session FD until reboot.
>>=20
>> On hosts running many workloads (such as VMs or stateful daemons),
>> workloads do not all pause simultaneously inside reboot(): they quiesce
>> one by one ahead of the host kexec. Userspace needs an explicit
>> per-session freeze point to snapshot final file state (.freeze()) as
>> each workload pauses -- concurrently across sessions under per-session
>> locks -- along with a way to commit a frozen session into KHO so it
>> survives closing the session FD.
>>=20
>> This series introduces LIVEUPDATE_SESSION_FREEZE on session FDs:
>>=20
>> 1. Freeze (flags =3D=3D 0):
>>    Freezes all preserved files in the session under the per-session
>>    mutex while keeping session lifetime tied to the session FD. The
>>    session stays frozen as long as the FD remains open; closing the
>>    session FD before reboot (for example, to abort the session or on
>>    process exit/crash) runs .unfreeze() and .unpreserve() and reclaims
>>    all resources. At kexec time, already-frozen sessions skip the late
>>    auto-freeze step and are published into the outgoing KHO subtree.
>
> Let me bikeshed for a moment :)
> I'm not fond of "published" terminology. We just moved serialization
> from one place to another, why not keep the naming?

sgtm, I serialization it is.

--=20
Pasha

