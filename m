Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A51FAC42
	for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 16:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763742646; cv=none; b=JBkMF+7tZfSCYtCgHiyWDU31xrYwVRgZ6DT1mwcnI/Jd+D1YygNmDnIv10dsroI53GHVAsw36G7vZqfNFgFk50h0YJI+pWGNInETYNqslAfJcxOeoHX0xNMEKJQtKW+OuVdfAtyQ9yg1s1XqHPpFXEKzLjHh4Cfaq3ta0PzaZwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763742646; c=relaxed/simple;
	bh=2zySQOdwGxFpkY27ErIngTUBlvdPwiMxRULejkAbxCU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sbUzmZ98O1jYSdN+bRYiToZs8nsvgdo9vT9ILowGF2cl6e9RfXIDYxxY6ZyuuPjiZw+b6wY+/eYyG2aKDtKF7MQM62y4jVvACeY/0vVHaUanwg1xKcxPRUV0M90jZr+QRrSJRzB1MNtttE7csBLfZFEQa1CxTVDD4Zh07JTEzvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q6wfMTo/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q6wfMTo/"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29568d93e87so20327055ad.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 08:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763742644; x=1764347444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zySQOdwGxFpkY27ErIngTUBlvdPwiMxRULejkAbxCU=;
        b=Q6wfMTo/SboCRwAqS6MDZxZSuZc3Co/f0BWwM93zTChU4LwppTloZSyt5WdpzHKXCy
         0aQJcnZk+YtwuYixTioUmaJvrqrR47SdGs6Nc1TLdMePx66rOOvCCfMnk1JFT7rSJbvD
         bSDya6HmSb/b7LREpyfHvPA9SGq3yjdHWPS2vX9FLn2i8ljjBXusISkAs8ZXidis563z
         o78fTWy1odL7pE8PckMwpk8DTAdWWH/0w90HAIqYgQsns6Ev2peIFzKnQgntXnng5H/G
         Kip+TVrbNYSm4KmUwhfp7TDKxI2dC19kT+d6ijncyXxRyKHhqCrzAfaBfJ9nrF2NCNC2
         WUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763742644; x=1764347444;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2zySQOdwGxFpkY27ErIngTUBlvdPwiMxRULejkAbxCU=;
        b=rqeu8e8/OHzMwFYJHpNVq5kOncSBQtT8SLvdqOzMhyksvMqvhrjbHA62NUqApQszev
         7u8E/QPoNV2f9Bi5dLg/6P3xkFgAPKJy6lbv01JmddoT036fPU1QvEyme2EddogJccj1
         9BkoshWgcNWYW/WWRh9bC4ekCC7vwqWYt8sUlDrHxyvmOK15SpqZETc90tujjXh2aJIy
         d81kSWQb6ffimTE7khbS2mBd4USFwmkvCryW9DSfIFETkVukJ0nDGDaD9Ji0gXRXP1at
         Ww8tjkRAzB3xBJrGm0WmcT8MsvpgMLxuSPp0fienBLRRt+JtDaapwzCEKMQ/6FVzaSOr
         VMoA==
X-Forwarded-Encrypted: i=1; AJvYcCWZATnvT0JwP9pHOgawFO6uRkUkiiUbgjl2OXs98mCR2Hbxy1tqt5nB1SPJ69Q0yXthUKnKF+e1Wjg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy1z6xPBQuM5Gv7wh+ywz39m3RTyCq10ITQeBzQmLsskaVRz8A
	UhcVc9ud0LDDypBIoJDnGHFOv4ru+p68qJYd4whZOXa2F5sz+1YQxJkrXqrOaJotg0M=
X-Gm-Gg: ASbGncss99RSdK2arMhZsSVHKPs7/Oh89GQtFYKUCsFPv+5hYfJ7RhylY1zoTHuSddZ
	TKHys+ki7qo/u3jquaVPzbhBU4WJaVEI5bCtdDV61ARxo7DtbTFL2tWOWpJU4lUSkmaozKSbYI9
	3Bl8H5FLpuf4IEGSrVWzi02IgKrzYXAl9xo+JqNvufAifkKekQJ+dbfFaohxnR7ee3bLDvaHgSw
	SLIZb3Hh81W/ckRIAyQdoX8mSsW+fCwTX7MrsvEq/+7E61JadnBb1/sbqz/NPAoUpskrbtant0y
	kdJzZ5m6mQmi/3d+FSnvXlJALoIJ+IFqquHH3nmJgZlNpJeGZlkBT2FrhgYkA8O/tCZVTOJC4W1
	XD4Rlp5Cuq0YhUoEmkoLCiQOdkJcxDB/99O548gjgGRmI1yWHptIeNEqbNoMUZb6SgkRUdPqVAa
	Yia8w0PSkp3VBnL2bvfllp20PMTC7U
X-Google-Smtp-Source: AGHT+IGR6kXLQfWOqj3ROiSJXt8B7HXDEY6evWJWJeMFCfbxn2XfmxkaSR6X5pAKpq9yjUhxglQGWw==
X-Received: by 2002:a05:7022:2390:b0:11b:8b4b:bff7 with SMTP id a92af1059eb24-11c9d866a70mr1156623c88.39.1763742644015;
        Fri, 21 Nov 2025 08:30:44 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8083:8d:38f1:8213:f721])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e55af3sm26561874c88.7.2025.11.21.08.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:30:43 -0800 (PST)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Luis <luis.machado.foss@gmail.com>
Cc: Catalin Marinas <cmarinas@kernel.org>,  Will Deacon <will@kernel.org>,
  Shuah Khan <shuah@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Oleg
 Nesterov <oleg@redhat.com>,  Mark Brown <broonie@kernel.org>,  Catalin
 Marinas <catalin.marinas@arm.com>,  Mark Rutland <mark.rutland@arm.com>,
  David Spickett <david.spickett@arm.com>,
  linux-arm-kernel@lists.infradead.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64/sme: Support disabling streaming mode via
 ptrace on SME only systems
In-Reply-To: <05dd180e-f12f-44ef-96e2-2a6013da14df@gmail.com> (Luis's message
	of "Fri, 21 Nov 2025 11:25:30 +0000")
References: <20251015-arm64-sme-ptrace-sme-only-v2-0-33c7b2f27cbf@kernel.org>
	<176341325906.789443.15370787298292895484.b4-ty@arm.com>
	<05dd180e-f12f-44ef-96e2-2a6013da14df@gmail.com>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Fri, 21 Nov 2025 13:30:41 -0300
Message-ID: <87ms4fmjpq.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Luis <luis.machado.foss@gmail.com> writes:

> [off-list, as I'm having bouncing issues]
>
> Hi,
>
> On 17/11/2025 21:00, Catalin Marinas wrote:
>> From: Catalin Marinas <catalin.marinas@arm.com>
>> On Wed, 15 Oct 2025 18:56:35 +0100, Mark Brown wrote:
>>> Currently it is not possible to disable streaming mode via ptrace on SME
>>> only systems, the interface for doing this is to write via NT_ARM_SVE b=
ut
>>> such writes will be rejected on a system without SVE support. Enable th=
is
>>> functionality by allowing userspace to write SVE_PT_REGS_FPSIMD format =
data
>>> via NT_ARM_SVE with the vector length set to 0 on SME only systems. Such
>>> writes currently error since we require that a vector length is specifi=
ed
>>> which should minimise the risk that existing software is relying on cur=
rent
>>> behaviour.
>>>
>>> [...]
>> I don't think we'll get gdb feedback soon. Thanks David for the LLDB
>> ack.
>
> Unfortunately this flew under the radar for me, and I haven=C2=B4t been f=
ollowing these
> discussions closely.
>
> Is there someone working to rectify/validate this in GDB from Arm's side?
>
> I=C2=B4d gladly review it and get it through into upstream gdb.

I will work on it next week.

--=20
Thiago
