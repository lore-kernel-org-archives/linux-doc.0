Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FFC31062C
	for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 09:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769593403; cv=none; b=gNyUthRWCaQPATjWynUY3z7Y+TA2x22TIRUgpLUDUhu3laVT6Jjjn0W3Eu24PcXubAVfYUZ+Z/a9RzfRC2VxxY42i7MLQK4/5gS1+X6YzRFGHhS0ZkCdaz+4z0Y//Rsl53m9jQvAaMRKB88z8YfNwy2WE9NsObvS+UNiuNAOGn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769593403; c=relaxed/simple;
	bh=nMrCEc2j5DclRR0VL3fs98R4zeyzXJH4AdEhgbDC6pY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wlyx+Vx7CklYkTzRhSlNMfQgyU174bTdwR7K6P9C5ZjYBlhkGXcRPJA/9bQpPMMLN6pXnQgEmzlSqgbSpWa031iJrjkn03fBoonEVwP3qBu8x3iviaH0qzmh7mPmIOxwobUzNvG22nwAzYciqHDQNEjAW/7t8hERFMX79Uo6www=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jADakhnf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jADakhnf"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-432d28870ddso3549829f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 01:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769593400; x=1770198200; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nMrCEc2j5DclRR0VL3fs98R4zeyzXJH4AdEhgbDC6pY=;
        b=jADakhnfc0qcVxohGd46xY/Hp3hxsOp+AMTPJdcbVZTEzMusz072E4fkW/elIVKuE8
         HyhslAvF0zxzucX3+ZvLd0sVZCKtHhKvSG5qlx41BiKtLEALZ4pR6e8YFAUEKxm/3B/s
         dj2MVfJeKwoYo3vGr45VJBmpcCB6W/fPkYD54Wup2hMNJ7RTq7px2pfBfwqJfgp/JE3W
         g/HAQETM4oxzKC7xyqHB3HJCHERYfQwZFb6diKni+rS98BF9ZUswwq7Mwj1lKYxo3dIb
         H9GyzTaLjeyLa5/+LNQozO1Q44xOlB1/R3kxTNvJwHZZs8tiQHOgn1JmAdPWUFeGKe3Q
         4hLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769593400; x=1770198200;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMrCEc2j5DclRR0VL3fs98R4zeyzXJH4AdEhgbDC6pY=;
        b=lqdMqYeZgXSl6xxlFK1duNzqByq9/BoDHHI3o5czhctcR6VzekO3ill3c8KvZ/BpMR
         UsdVXteAvZfooqbVm1MgFOypQvujmwWbjtMCFeHynjU5aaKfOeyXyPNAANXPEnB7kfBO
         3/WzZNKMzvEBGb1SVX8g8YnkQN6Mk1NpazD5Ms/L5hP1fvoERA6wr3ur/xwItus0XV27
         hNz+P/dtgC4B45nUx7lct8BCQaKpwtwyQbEAE/Vb4ghxHVbzSnbgRENK0s4iVxAmIlBC
         lEsLobJUBZKcSgIFoFKjixaTQ9FckXjA68jyOQnLOONeMGs8pGTIfy0FXnKkV9GyL8Ld
         MEIw==
X-Forwarded-Encrypted: i=1; AJvYcCVsDuSubGalvmPpf8XsWiHUkHOxSjlsy8y6f6PQLJVnC0im3+5jL58HlRWnW9GQk4JVnT6RoX5FYwM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywer3kiA2Nlqak1cmsIsXxy72qLhGrtjuuRwd4vytDQzJ98AvQJ
	3CE4IgxbN/0r8k4pM/JZUm+xqwHRSYq5IwkKhcOfBkZhjxmjUELfv3Dk
X-Gm-Gg: AZuq6aJZe40lCbbG7u0hpJGZxoH4tUjnHrECDHz5H21Ly3w5BXy1gIKmp0Aae9kKeNM
	gKHxc/tsx6lK89Zc+ywgp8Lyp6f8dLehu2U4M5OCEK+b5MG6d9+VPAQ31iVPQyvJrFoT3DS05Py
	pTRTPdf9IVwHmKk10BGrIQv413MpDXjbajW/3/2Cyz2vbvScDtPY34YAKPwal+DEg3/dZNZwThi
	kh1RGNp+T0sU2zXUofjIDzwdGUo73UEDxxTvS2U3uJXTozSeQgus5vYm6lCz0NjKwlwRmWPPTAe
	CnnTX+tK28FK0o+pEQt5Xg3E2eAOtKygiIiiwRq5+Vy5HAcaywsk0StT0tU+o9xrAe0/b3nACok
	C72Q+Q9JP7Qc+o30SdhtNjXaDuEybgZceIB9UOk0ikcxsWeRAeu2YvcqGVQrVLcVuPBO6D98GBn
	nteUwbzdQ9NxI8Rq0Oxq0=
X-Received: by 2002:a05:6000:2084:b0:435:8d02:b9cd with SMTP id ffacd0b85a97d-435dd05f1c5mr7512803f8f.26.1769593400162;
        Wed, 28 Jan 2026 01:43:20 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1048a54sm5346836f8f.0.2026.01.28.01.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:43:19 -0800 (PST)
Message-ID: <382e259ea3835ffbd2be9c36b529875f5a43f38b.camel@gmail.com>
Subject: Re: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jean Delvare <jdelvare@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>, Linus
 Walleij	 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 28 Jan 2026 09:44:03 +0000
In-Reply-To: <eed64bf1-93af-4b36-adf5-1476cb40edbb@roeck-us.net>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
	 <eed64bf1-93af-4b36-adf5-1476cb40edbb@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Guenter,

On Tue, 2026-01-27 at 09:39 -0800, Guenter Roeck wrote:
> Hi Nuno,
>=20
> On 12/23/25 04:21, Nuno S=C3=A1 via B4 Relay wrote:
> > This is v3 for the LTC4283 how swap controller. Main change is that I'm
> > now using the auxiliary bus for adding the GPIO device (done depending
> > on FW properties).
> >=20
> > Similar to the LTC4282 device, we're clearing some fault logs in the
> > reset_history attributes.
> >=20
>=20
> I ran the patch series through an AI review. Results are below.
> Please take a look.
>=20
> Thanks,
> Guenter
>=20
> ---
> # Deep Dive Regression Analysis Log
> Date: 2026-01-27
>=20
> ## Commit 5998c620fbd8: gpio: gpio-ltc4283: Add support for the LTC4283 S=
wap Controller
>=20
> **Context**:
> - Adds a new GPIO driver `drivers/gpio/gpio-ltc4283.c`.
> - Depends on `drivers/hwmon/ltc4283.c` for regmap and MFD instantiation.
>=20
> **Findings**:
> 1.=C2=A0 **Typo/Naming Issue**:
> =C2=A0=C2=A0=C2=A0=C2=A0 - File `drivers/gpio/gpio-ltc4283.c` uses `LTC42=
823_ADIO_CONFIG` definition.
> =C2=A0=C2=A0=C2=A0=C2=A0 - `LTC42823` appears to be a typo for `LTC4283`.
> =C2=A0=C2=A0=C2=A0=C2=A0 - `drivers/gpio/gpio-ltc4283.c:26`: `#define LTC=
42823_ADIO_CONFIG 0x12`
>=20
> 2.=C2=A0 **Logic Verification**:
> =C2=A0=C2=A0=C2=A0=C2=A0 - GPIO direction and value setting logic appears=
 consistent with bitmasks provided, assuming
> register `0x12` and `0x11` layout is correct as inferred.
>=20
> 3.=C2=A0 **Regressions**:
> =C2=A0=C2=A0=C2=A0=C2=A0 - No critical functional regressions found in th=
is commit alone.
> =C2=A0=C2=A0=C2=A0=C2=A0 - Code quality: Typo in macro name.
>=20
> ## Commit 82433332ce16: hwmon: ltc4283: Add support for the LTC4283 Swap =
Controller
>=20
> **Context**:
> - Adds core HWMON driver `drivers/hwmon/ltc4283.c`.
> - Handles I2C communication, regmap initialization, and MFD child creatio=
n.
>=20
> **Findings**:
> 1.=C2=A0 **Critical Regression: DebugFS Use-After-Free**:
> =C2=A0=C2=A0=C2=A0=C2=A0 - `ltc4283_probe` calls `ltc4283_debugfs_init`.
> =C2=A0=C2=A0=C2=A0=C2=A0 - `ltc4283_debugfs_init` calls `debugfs_create_f=
ile_unsafe` creating files associated with
> `st`.
> =C2=A0=C2=A0=C2=A0=C2=A0 - `st` is allocated with `devm_kzalloc`.
> =C2=A0=C2=A0=C2=A0=C2=A0 - **Issue**: There is no explicit cleanup of deb=
ugfs entries (e.g.,
> `debugfs_remove_recursive`) and no `devm_add_action` to handle it.
> =C2=A0=C2=A0=C2=A0=C2=A0 - **Consequence**: When the driver is unbound/un=
loaded, `st` is freed by devm. The debugfs
> entries remain. Accessing them triggers a Use-After-Free on `st`.
> =C2=A0=C2=A0=C2=A0=C2=A0 - **Fix Required**: Use `devm_add_action_or_rese=
t` to remove debugfs directory/entries on
> driver detach.

So actually a nice deduction from the agent but not accurate given that all=
 the entries should be
removed in [1]. If you want it to be explicit, I can add the action but giv=
en that the dentry is
given by i2c, I would argue it's fair to assume i2c will take care of the r=
emoval. Thoughts?

I'm also planning to pick this up again but was caught by something else. S=
o hopefully next week.=C2=A0

On another topic, I also (you questioned it in another thread) looked aroun=
d and I do have a ltc4282
board with me. Given that I just need to power up the digital parts to acce=
ss the i2c bus, it should
be pretty straight to get a register dump. So if you're still interested on=
 that, I should be able
to do it.

[1]: https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/i2c/i2c-core=
-base.c#L634

- Nuno S=C3=A1
>=20
