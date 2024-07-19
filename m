Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82AA14831C
	for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 19:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721419041; cv=none; b=QeUC3ovxKx7ko8dMZRv6PqdvWHsO7M+qESHwjz+xnuSAyGYrGb74RQxZt77qaK2rabvIUPDSSxSUMst54kqHQCYnFhkQ3KbXpxVJg5V6C/A3gb3ToVy1bxJ7vQKE/kxE+rzIqzNQCwMf4PwygtFj/wVaYu6q0RVG0UW+VoirY0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721419041; c=relaxed/simple;
	bh=TPczUa5e3h8bDIU3taB7K6gYSZd2QQEpQ+m4m+73HB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zao6U9nS2Ts6cthJKV7KQNh61bG1uFsMvWSXRHMUuTxo8O430TyKFifaPlSBpuhZDLhm3LmIjgQHnLvCzpmMfo7ipoC6HHQh9XLuccI4jw6igWzabnc/slO4lWQOkRT3kHsJxzbiRXiX4Ipd0oZ3ymBG7d0PFA4yg6hwiPurBfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CceJsyfj; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CceJsyfj"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a77c1658c68so252122666b.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 12:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721419038; x=1722023838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPczUa5e3h8bDIU3taB7K6gYSZd2QQEpQ+m4m+73HB4=;
        b=CceJsyfjslID070s5z8Me/F/ASStsjDtCN0nfuPJew1ieFbwRksb56dnTt/GG7cRO3
         jvaTlWFIvWNFY3YPIhmQfIzI/BQnJp601Kg0RJspDdXT9Kb+Vu+vN13dtnfomHED/Cmu
         bUNS9ENSYmF4NTh2GnfmfagDq8q8oTknsxPpyZVahmXAneBxxgBLkShXcNzOa5Svpbfh
         rY/jL5ShbuhN++rYM3TXuWlox98iUxojWNjGQMRc5+Nt6H2ij/Q4R8/cY9spxjKUIWIC
         oXTAJSFjVor6lD4D+/MZ7iO+IQ9ax5wP5N8GYJkY2YdDiHOSyRs6SzVUlpn8kHBrjslO
         NXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721419038; x=1722023838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPczUa5e3h8bDIU3taB7K6gYSZd2QQEpQ+m4m+73HB4=;
        b=cQ2ABI7QwQgUff6f3EuzrpphFUPqzoVFvyy04Z5O+4seOTSSl3TeTc8ZIsOjrcgvA8
         hzQUfx4RxmU78zzyZnw8inyst27/xohy1X+kX06XSSwKefjVofgWGkIPGku8CN90U/5W
         giyVoDg++6E+v4an9bij+gEEeohSrtOEiyn2/FxjEOF2MTU8aN7cPntxcDsnvgfigE1o
         JGWlUEgDZXEc8ijjE89O/6m1bU2VrRrVaWi1bz/YJLGIutxwErxPsK2Qztrzp1s6FQ5j
         jWcMH7VV/SNLr2fXs3vciJeSq/bpYGISYM3atfQV2nNXVEBHBE1/Btbn9eAwvcA7d2zV
         /M0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9ZEAH437yFoSYMKeqCN9Py+yz+NeGx5gelORjkFOh4mdpB21SC4k86oaXp3QDcRji7ATw9naucODXAJ5HIELHqT/cz1H7/gXv
X-Gm-Message-State: AOJu0Ywam0B6rFDXOCtui+W/zv9fGwWoouDfUufMGDQedTrjfDJA7xba
	LBznFG0oDdp2vv/GU8EwzXDFA3WxTu+mnJgEeBwRcjsEZLEoxpcUBn4MKcmP1Z7YAH8pomDJB1E
	4rGf5VbZJgWxlpzC8XCKhW9tAN9hlZBm4pwsyHw==
X-Google-Smtp-Source: AGHT+IFVF+CVdbaJkg3y+N7bCWjdUcp+1bJmmf0A4XaMnmetAxeY3PLap/EOWXN321STq9oPaIZpGUHPeCqe5U+TJJ4=
X-Received: by 2002:a17:906:2849:b0:a72:685b:7c98 with SMTP id
 a640c23a62f3a-a7a0119e3efmr641117366b.37.1721419038069; Fri, 19 Jul 2024
 12:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717180727.4180475-1-jesse@rivosinc.com> <20240717180727.4180475-5-jesse@rivosinc.com>
In-Reply-To: <20240717180727.4180475-5-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 19 Jul 2024 12:56:42 -0700
Message-ID: <CALs-HsvWv+85EX2iFUgnZG7RdFndfn8WhVx_OB6ROPjzLKw+zg@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
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
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 11:07=E2=80=AFAM Jesse Taube <jesse@rivosinc.com> w=
rote:
>
> Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED to allow
> for the addition of RISCV_VECTOR_MISALIGNED in a later patch.
>
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Evan Green <evan@rivosinc.com>
