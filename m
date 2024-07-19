Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C9C1487DF
	for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 19:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721419053; cv=none; b=gocWMFChhOZwE/SKifeUp0CwGrh3FmE/mlzflmvk9igVmxFpYZ9tIe+WGW5KfsDAmDgkB4J+gQHcJ9TDWuj8G3i07kAVFKw9WaRHmIYXXDwrKWWl2IdRybUiXAnYy748PotkFYw7+dyIp1d0hfyPsR35UDTic8UheU2glaZGPG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721419053; c=relaxed/simple;
	bh=B8aLNC8rU70Zjs3Uh/UPocyKDEXo99TS0oP0YsHJFOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HouMdF5RMu6/RUiuCzCfH0qmuXygBG9W8bUdXaPVBg+xbeWB/ppGEKFUzSMAXafY+ECqMJo4uQW/WYaFH4Vuqub0KAZXb5iqrOzO1W/dgHSjDLNgfbhlvXoJD8+s2b6XjB0FYBR6uo6Rea0AYIjyXkXj0KEy5QiAdLhVrOgtRAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=A+R42Y3m; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="A+R42Y3m"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52ea0f18500so2091799e87.3
        for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 12:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721419050; x=1722023850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8aLNC8rU70Zjs3Uh/UPocyKDEXo99TS0oP0YsHJFOw=;
        b=A+R42Y3m3ym4LzcnmLSS7/8k7CTsDnmjgpQcStQK2tcUhTLfAqQ8Y0hyBBAq6GIvi2
         kgqLjdUIT3auWETyaWc0OLZtLA4AKh2o9mb9qs7nGju2i9KBx5xJ4IHml5OY/QeY3Pws
         RN/Vy0UWCzP3fQPzVC0hRST6EnRaK/RjZHj/lUHL9+dPoyP15KwCDDSlf/WD/FYJ0f07
         gCggk8+/NLxyjnGNYN6g3JvaMM0Rnqdiz65Ee2em2rWaXhA296hJqxiaKryrisvBW99O
         sWIgayOl1Rb39si1ERv6kfkGeKzWmRYSU6YfBmTrMVp2vd/6jeVzQai4Z6l87LY0DG9e
         51Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721419050; x=1722023850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8aLNC8rU70Zjs3Uh/UPocyKDEXo99TS0oP0YsHJFOw=;
        b=nAx18P1T7+lGYcXb69RutixLYi0PvS+Eo3ssZCR5R63f70zZ/Abj6xr/vhXT2qsaTp
         Um+5ADYqFIoEdjxM6/j5+ckltVRtJWU4frkLo4r9f1Ml2vJrRPP8ty6gZ2kyhiBsGvNU
         tll+rVuekq7OF2qDPLpxglVa2A4tBvQhp9+LpGaKE8m01H/OO0kJ0htne/IC/ETcDzd6
         0mp+SNIVCsxFMpn0XWTO3dcoUEmGR1TYxNbMI7Jr2Fd7ZXJOhiZyLjFh+Pc2imI6qbLA
         ybJ0q3MRCcNn7LR49LaMQCevhhverS7kpPT7PpV/meud9YRCU2qtYMzNicK+UbSs9HNx
         Vk6A==
X-Forwarded-Encrypted: i=1; AJvYcCXzIpmRl6X24qtXKTTNrDLaY20jY8wjV+djVkj+f0UAJ5bYLWHml6Lc9R5YYeRoJajZ1VvGEFZexnL9438Ej5VazfmzRliQ1iu0
X-Gm-Message-State: AOJu0YzHYJCXN3qcC3lPJyrYY34OaQMHnPuBzqITyAoy3o/ZHqn3fhHj
	gJB1p/XTW521SdbDDcV6kYPjuH2g/+BmDmBLslboM+QTugHIW5cfvhYya409TIPZhAGMPnMLr2Q
	qxozmVK42tJaVldfxFrKBGGCawHRjfh3pIYXuWA==
X-Google-Smtp-Source: AGHT+IGLg0Zec4iHQMawiM7bkM9+i3kahZr0JAjZ2I8oWLHvoCCPg25fvrVDiKEktiVDPxl/yiCHdhaZSmY8GsEWCOg=
X-Received: by 2002:ac2:4c55:0:b0:52c:e10b:cb36 with SMTP id
 2adb3069b0e04-52ee53dc66fmr6231799e87.33.1721419050254; Fri, 19 Jul 2024
 12:57:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717180727.4180475-1-jesse@rivosinc.com> <20240717180727.4180475-8-jesse@rivosinc.com>
In-Reply-To: <20240717180727.4180475-8-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 19 Jul 2024 12:56:54 -0700
Message-ID: <CALs-Hsu-jNSpoOq836GQjREChEYVWy=osYzS0KQzBB79_uKSrA@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] RISC-V: hwprobe: Document unaligned vector perf key
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 11:08=E2=80=AFAM Jesse Taube <jesse@rivosinc.com> w=
rote:
>
> Document key for reporting the speed of unaligned vector accesses.
> The descriptions are the same as the scalar equivalent values.
>
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Evan Green <evan@rivosinc.com>
