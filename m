Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E2A19E7FE
	for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 20:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719260335; cv=none; b=B6v2qJzG7FL2liKEAwNH0VxNeyOZwMJaoYyY0EuJybc+z9krAnv6T0ci9jaMj8ZeYuSna+gZ4QZ76CgBavHWO14GyGP6M6Fx1h/bRpQz/zzv0B3gDpgAIwfyrHZhWUq7iByWI5/5f2eL3SjuLCbQirrCTX1dcQUlvpye+kr9KZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719260335; c=relaxed/simple;
	bh=CYPMKzKXzPtEKhl5KLn1rsXOXuPsd77VL4h50H+aCL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYO7GrYAPrEtU3JcLD47YSWaJRrKby0LNkeeSAKuJniztojAjYweuk6Bulho8HqHt3zOb7rGwKcZhvw9Jg+lD87oaEvSjtTeFnMwFR4kdHTI6KBrIspDEspIiEbNMCcHj7tspYUaUUK+WkKbzbv3ID73JaulEm3kpjc93uo11CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bh4tqL67; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bh4tqL67"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57d1679ee6eso8307745a12.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 13:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719260332; x=1719865132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYPMKzKXzPtEKhl5KLn1rsXOXuPsd77VL4h50H+aCL0=;
        b=bh4tqL67qwrLSvvomB0GYyaZRmfZ8C7/jtMJQbLXq+rTsGgIZuiWYFNpH++Al2dWQe
         hbXXTwtmc/nJTyFciBIUyb/nFVP2i0yZv+cRV/AdaaBu5l+jIqgrzOhqtdqss228H7/9
         i8h6A8Ur0MSfXq7LyHaH1OyNoZINRlrNnrD1blCrAB47CY7g8CVSdW+lyEBneNDoMjXe
         W5zbLbwk2DQZz+HxdsIKlagFzxlicQN+NmlsCNiyY+6v5KtMiBtt3Enem/giGaJqHjpw
         C+m8Ls3NamUo4rAwDvC3+9fqEAkj692/nhnSK8M6U0ZFwGzggR/PeALd2V1pYOe2ovRV
         +0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719260332; x=1719865132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYPMKzKXzPtEKhl5KLn1rsXOXuPsd77VL4h50H+aCL0=;
        b=ukayFb3UuTCmJTqKk3RcXveYnOqviADJ95Hj9ibcB4rSL+FFuDzoJneKz4XB+GYL+G
         ltT8JRGesFuu+8JU1PpIzIN4cm3AVClhXbheYUzuWumh146/OP7i1KCYWtUthrmlYJ+/
         MP68wz88yjOMvW7HRcl8WD+2NxqFvYsdqwKhex0SIFN+suaOAnKqnnDX7QimigJcHQa2
         75Jot3Rl/dDrnJLfryXhM226kzKez/IH+j/oT8ijvOpBEZgs3LdMmFp8SLkdvys9QCBr
         zfdOSpXCdrgt4+W7sWL3hG/SEa3awOKmha7IFjSUXKzT2RvF1JwmoaT3gF0yy5ELPU6B
         PzKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc74G91wqcFcOOvF/ZxLYdmaItOfYZZz7X2wIVrbvWP7wNAClVXAuAuqxjoGPG6KhcP1oZUimh//eAsafwUiuD2n+kqxJ4gtPX
X-Gm-Message-State: AOJu0YwGlxgSoxQx1Ru90iEd+KcCIi0yAXMCnlnjgXKx/w2Nw1DoTJcq
	eSrrgIzLnXgd3HMhr5HLhJOwuisefKuwd7jhUwA7JKY5cpNMeyVtXkyR/Aq/VIu19IEcHLEUaY8
	lgiXSy8YYPJ/JhvpPm2vHfaG2HX3EKK4EjXRSpQ==
X-Google-Smtp-Source: AGHT+IHYKa/ycS20058DIxTuE4TPZj+Ne6GJbbNiJ5FbYcQC6EiSPJWgGfnJ/EyOzoXs+/hcdQEshUVAiI2Wx8GhYRs=
X-Received: by 2002:a17:907:8b91:b0:a6f:6df5:a264 with SMTP id
 a640c23a62f3a-a70275ea47emr586904366b.1.1719260332160; Mon, 24 Jun 2024
 13:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619113529.676940-1-cleger@rivosinc.com> <20240619113529.676940-15-cleger@rivosinc.com>
In-Reply-To: <20240619113529.676940-15-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 24 Jun 2024 13:18:16 -0700
Message-ID: <CALs-HssLx_AZ_pBDECfVH7REoSkyz-=bECPYDeNZkfe59DdBGQ@mail.gmail.com>
Subject: Re: [PATCH v7 14/16] riscv: hwprobe: export Zcmop ISA extension
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Shuah Khan <shuah@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 4:41=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Export Zcmop ISA extension through hwprobe.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>

Reviewed-by: Evan Green <evan@rivosinc.com>
