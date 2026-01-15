Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441953203B6
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 23:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768518310; cv=none; b=RNfJrg1kOAH4rBWWqZHlImYP1PuxU/nf73XI/dCmrDDQKX9IVprfj+wNNT0qBRCpPUZ4bBgER4APj58YGj02kJcERYce6IwT54h3inWx+V8+SSlM3fKvHAQcEEuNNtmmA1GqhM3dtpMp3sDXIe1AoEILlBZ46/rwNuoaoKSpzwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768518310; c=relaxed/simple;
	bh=dYKmJDEQ3HcAny/HSnaNVeQI6nrNVioX/wfvfu9LcB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USjXPKC5Rujy/6EXGWlLpLMXJu1EBvsSqZoySnpU9u8TIIUaazdOvoITdePWSOkjG59O9usd1jTdJcCq7F7o1RC7AyxD5J11cMkHpd2g+JurrapTXxUPKhdR6xgBMls2QjBHUIHQCob/HgeXZr/IrHsqb1jai80MX81plvNB+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Z5IUH3lZ; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Z5IUH3lZ"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78e6dc6d6d7so15664807b3.3
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 15:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768518308; x=1769123108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYKmJDEQ3HcAny/HSnaNVeQI6nrNVioX/wfvfu9LcB8=;
        b=Z5IUH3lZOx9XDNjG4iwgV32aHLYoJqy7VRDyyfXBebyOIU0iE4voar9OWNWANEzuEa
         VPcJ+yYcx6wN/lJuYNpz85Im+XJePngPK3nZR9szrGS0aovbWelBnFL+7lYgl51MYBmw
         rUn+MMimR4CGZtB1moExMjgXMa4IMg1SAV2HLQKzhGCf6Cx8dMya1c68ZMgTz2G2ebHg
         uvGJb+CgE5rH+9lixq+OYG1QuYMEJ6J/RsC7/5VEUcmS456lNxb7cbRa4gpFJqse9AGI
         frhAA7DXX2FCHDsF4/uGie1tj2ZrKKoSOolH42B0+sh0MoNaXxckVGfN17vz9XL6AjWq
         9D8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768518308; x=1769123108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dYKmJDEQ3HcAny/HSnaNVeQI6nrNVioX/wfvfu9LcB8=;
        b=j2ocnPycZFu1LcwpB5ueAIr6Jog3xCAEyPcF0GEc1ID1JaFV9tOEdfYzbp2g8r8k54
         fWePmv48q0/lIFZhDKL67cEBkLkwMiirxkwgaNIZIlH/Zwbqkn2qoxd38uJh986vuD/2
         mxBjWDbeyLKfnvP5D+le+nN2TOFvQAcadwgBY+m0BTmszReUjVffwizbiQeR6qdqMz4N
         Miqo2uC4VF7hJSFr85x39vNNjC6tA4orPwH2fU/e1m9+yQ9Yrioqoj36NrmKi4hnIeiH
         QjX8gFeb/6kkoxvFpBnYxyu2UIQIXVOs+X3l7wTm25Yl1LD8KvueVFYZPCQ+8grbXCwZ
         rGNA==
X-Forwarded-Encrypted: i=1; AJvYcCVWzvrzUAqav8s7UZiBArMfTdOYK19Nl1xP87UidbBZH7z2DAukT/xzcGVLDm718eiNxVR0XAk8qWU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7e0G1zMviHRDUxAnG/UDLP/RIlfuBXlBNeZk512Axe+OAfqR8
	j2TbrGGuw+oTp6dHBRZHfo1f+AXZqDLpK1GnjHijP9pEDhwrJ0LrEPh1NrsfLNVoLHbLI8qcm9X
	Fkqe0Al2DxUxl9Ey28E4fuPsztvB7mbK9HrrKstg7tA==
X-Gm-Gg: AY/fxX57o9jtU+7Rth1MGHyhFX2MNN5bw14PqWSypDji+9GQhd6/wEor4sVC/+FGZuh
	mt09/ANAbP5vZ5OqHXbSgQ5l11rvQ4zBGvlzSwPZewSrE6CX/ek+LUJUOR/pbG3fPYAia1CGzSK
	XCg+EWez9Tpv2rN7p4zLW9E0/dbrgjoR3hpfdEh665JrZPwzx6QUKi6Ux+5yDFwqQJawQsslQXD
	HA9TG26b0Y/ULnd1UZquu0JfD5N+eUNE94zLPvlXg7Wm9yqc8xQ7/tX9Rp/SmLwu78Ol4GSSUrN
	6Pp+HK39wUznqDPCQqo//QN7RgrGfRSS/Bvq3g==
X-Received: by 2002:a05:690c:6089:b0:792:7113:a305 with SMTP id
 00721157ae682-793c671a7f3mr7321837b3.29.1768518308331; Thu, 15 Jan 2026
 15:05:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com> <20260115-phonics-reversal-80541ca1f2df@spud>
In-Reply-To: <20260115-phonics-reversal-80541ca1f2df@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 16 Jan 2026 07:04:57 +0800
X-Gm-Features: AZwV_QgpKX7QEi2C0Yhv9u5ga5ukQKR3VN0_gQKQrF7MKWPbynpMV7kUo4W9FqM
Message-ID: <CAH1PCMbc_QGZMicNNie9mvicaHHUbvLF-C+Xb-mgvPC59Sgnbg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing devicetrees
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>, 
	Conor Dooley <conor+dt@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 3:13=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Jan 15, 2026 at 07:18:56AM +0800, Guodong Xu wrote:
> > ---
> > base-commit: 31d167f54de93f14fa8e4bc6cbc4adaf7019fd94
> > change-id: 20260113-adding-b-dtsi-148714533f07
> > prerequisite-message-id: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscst=
ar.com>
> > prerequisite-patch-id: 0c859b4d131b3360875c795c6148c6176b55fb91
> > prerequisite-patch-id: 2ed98dc1ab0f5ed923cc252415c345dc8caf6f17
> > prerequisite-patch-id: 1be1a031763fac029076a768f012af31e455be66
> > prerequisite-patch-id: 21bb8387c946e050910440e7a7622305d46d946d
> > prerequisite-patch-id: f3bdc2c74b230663710086bd770a755d56cb8b9c
> > prerequisite-patch-id: 1f162c02f8bdb5bbc8ce52ead4fcb76258f5c2b9
> > prerequisite-patch-id: 76e1ff26c2f1fe4019cfa574942b568000e6ca1f
> > prerequisite-patch-id: 77ddc9e5dc85495adc803cdc605bdda2ddc7fa47
> > prerequisite-patch-id: a75c798383b46a14d40436357c769c3671184768
> > prerequisite-patch-id: 781fc10dcae2c38c84c25bee887ef7474786dd36
> > prerequisite-patch-id: 5be5d3e62aa73024bf9e1de6aad155be6d618f40
>
> FWIW, this kind of prereq-patch-id stuff isn't really helpful, because I
> don't think there's actually any dependencies on that work. It actually
> trips up some parts of b4 that think they're needed.

Noted. Using individual patch message-ids is better in a case like this.

Above, I put the entire series' message-id, which creates unrelated
prerequisite stuff, as you pointed out.

>
> I applied the Anlogic patch.

Thanks Conor.

BR,
Guodong Xu

>
> Thanks,
> Conor.
