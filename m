Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FC017D34F
	for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 17:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722015095; cv=none; b=m+sbmq6oe415pV/7kdm9s0nW7WivQW18K1USzySeEE43KOB6sZN/IyHf/m/QEj76y4IZBHLfFK9s8FoRdRJgiZMSO7dat7c/8ilqA1TChyOW/K2eTLfCdYryUTs1jMPV8gYdsSXItPp0DKKaoBc38tKtBUhlI3qMvqRsEYe76r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722015095; c=relaxed/simple;
	bh=TJFfdDn4hCn+JfxAD3q9QsIiCucI1Gx1K/+KVTB4ve0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUWJEZ3iSfhnAQK10cC/ZB2WPcRZ5kxtdD/K4WAhJCAzQ5l/AyM2YQGg7MB+MoaLEWcXpb1A76+gX28dcKSSxj3BXH3mWg0wYw3yFJGN5DTJzaC451122KQ+u3XuHAg8mCCJwKKu5xKlFJMns63sI3ksmwg9ba0ipbjYv2mlLzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=xLgkPVaQ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="xLgkPVaQ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3687ea0521cso1648897f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722015092; x=1722619892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJFfdDn4hCn+JfxAD3q9QsIiCucI1Gx1K/+KVTB4ve0=;
        b=xLgkPVaQ4C8L0QS+GWG3v8MWW4F3rksKRcWhW59hiLB/pHuUSWVDT0rjQiSIB4w2YM
         ZdMyt+BUm99p86Kmp1RjzAWT8VuOf6vab/QXyV99UFx+KyPzxX3dNiZxU3ns0TprO9hq
         9qcDIrsjMj5Meww+9cOqPS4QMa7gw6IpIx6OeCmimJucIGpktjnRxHKpS+6KNaRfAo+H
         qc2wiETiRWQQ5Gv6aZTRUHLGwHFlRi7sI5/+EiVxSFEYR7pNNH9CJ02lkNHPeWvjZZFb
         ee1a16eeqb6qaXMtShIv8WU1kFlBYH5dPWRXkaimf4I36rRsNcWCkrbiZUv6aUFpBJj4
         hvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722015092; x=1722619892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJFfdDn4hCn+JfxAD3q9QsIiCucI1Gx1K/+KVTB4ve0=;
        b=oUJRVm/rvEsUIIGenelvHYRTWP81opcWU6yLq4KhfGKvdelipenNBjQgUoFYrbxqVv
         GqouuYAUU8FiT3rebL7u/aG11uNp/TiHyCXBtIMhPAEZUZh64SPpAjuO7Hm8qncAZneb
         pJAlNGl5p9LPTJxmE1cXsdGMdFvaHn0q+LBNOKmO9DMNqct7AdJ5y72UKGgg1no0PoJx
         aWH6Ej6OsPPJQpy/UmdycV+ZLkgfc5N2XnEGQJ1X3WrWARXAUQ9BFI5M5W6eauf7A3vG
         Ou69mV1X7RJ5/oHrEiYkmHx42tWIsAKGqFRrJMFlojROO2zQ6wvT3AcmKLg50oyJAFXQ
         ddQg==
X-Forwarded-Encrypted: i=1; AJvYcCU4n/Stjcv1A/whLq3Qj416unKzhDmHcuAa6rQejsnppYem7amGunVOHf2ZoDrakfpBbRFg6zLlpS1W86Pq6zFeTIn2twzxiW7C
X-Gm-Message-State: AOJu0Yx0lZQe5s9ftlOYUgWMKy3yW1kk8Y6YzlkcfBgGQaJWeyjpzD5U
	qJ8JEPqHnzLR34tw//H+3LDd8V7MSNCsmAIE7SnwsvV2tNgbVlqJdJsufxl4bet3+3LRKZLQMoc
	RmFdyh0QkAyy5gV1DjN2TL/zArlQu3A0oaV+4uA==
X-Google-Smtp-Source: AGHT+IEcbBIq0QVjjaGO3yyeblxO7j7e77wp+O5wnIUnEO6JQdPn2RcZcLA9pSLULVqKcWiJroK44X/hEvsIxOop/OE=
X-Received: by 2002:adf:f00c:0:b0:368:7943:8b1f with SMTP id
 ffacd0b85a97d-36b5d0d0f9dmr327709f8f.43.1722015091942; Fri, 26 Jul 2024
 10:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240726163719.1667923-1-jesse@rivosinc.com> <20240726163719.1667923-9-jesse@rivosinc.com>
In-Reply-To: <20240726163719.1667923-9-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 26 Jul 2024 10:30:55 -0700
Message-ID: <CALs-HsuL_eFncoEe=ns2=Lsdr1y+a-QhzSsZ+Yw_LQ_X7fs2EA@mail.gmail.com>
Subject: Re: [PATCH v7 8/8] RISC-V: hwprobe: Document unaligned vector perf key
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

On Fri, Jul 26, 2024 at 9:37=E2=80=AFAM Jesse Taube <jesse@rivosinc.com> wr=
ote:
>
> Document key for reporting the speed of unaligned vector accesses.
> The descriptions are the same as the scalar equivalent values.
>
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Evan Green <evan@rivosinc.com>
