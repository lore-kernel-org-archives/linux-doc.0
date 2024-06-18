Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1704F82D6D
	for <linux-doc@vger.kernel.org>; Tue, 18 Jun 2024 17:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718730679; cv=none; b=QGNdcS5pghWfmBRfrlXoG73FPTetPb0IQvhasqhSKmio4QgQVvdQ0zcGRClNL2vNiDXYIOWv5rmEHywynSqhqzH5YoBK2XWaCN25pHhnM348JcWJVMrW2GQ2qNxSYQTD7qF692LXoGvs7HS5dCHGzEb2eNkUHqIEJCgNSOaHpsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718730679; c=relaxed/simple;
	bh=jMnnhcMJpi/gTaTN/vn78bq4LGXwg9q6pMTAn83Y3F8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=IzvyY+JtUN28B+u2IlyGh7CgcFXS1cKvlE/uKns8AuWyBo8kek6ivwIEJG2eo6Xwi5+eV9+2Sz74yTCZyIMF8qBvJaRnkmxFqgPz3LfXslawj7MloDO5/6EYwiQ52u18I/XGXsPfEgXvYe2AMYi2nOeaq7rjKcsAtfm1SBG9y+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=Ymma3rvx; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="Ymma3rvx"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3632a6437d7so1699f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Jun 2024 10:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1718730675; x=1719335475; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMnnhcMJpi/gTaTN/vn78bq4LGXwg9q6pMTAn83Y3F8=;
        b=Ymma3rvxjLGLQufPHBJM8weswvlk/cKQ6BK8KP2441o78plB07NSn+woXHAUmqyWgy
         CsVI88lBCu7M+CDpNLAfnDFoRqipB15jJZXy1rlJCia9k68Imm8rVVfQdo/5dgkfxMmT
         Cf2AAwTltOERu92Zy4StAvFn5NtRnCg3Tu/4oOvBdlHMTG18+H6UUT5goDhRk6WSwTTK
         h/+rOUKF9h0UJLNeTWlKZHmATSIULyyVtLE6c/ZERlfVMJoBzVp0oYOTffpKwp1lfMw5
         QY7HjxBGIbbJVVybYKK2yydVVRkowLhXb+0i36owJ8ZoT0RxHCd2wyd77eNRCXmI40mS
         d/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718730675; x=1719335475;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMnnhcMJpi/gTaTN/vn78bq4LGXwg9q6pMTAn83Y3F8=;
        b=Lpz+CV/P4xhnWbCnDjv+czpZx3eIz8APLlI90+sX5Ehd7VBz6jAWZTw35ZXvbfdSlm
         wMcU8ySaIAVYeywvdueyFtwpPNKXY2laBMLRVHOKhTr5SnvRJIZN2nZ8eCE6CliDxDGC
         qTPrPfW2MU0Sb+J3myua6obrDiZlGq6fhZ5aFQhSSKfRAe4ZVrd6VXHvz405IPEspC0s
         4ZosFwT7ItYbgafzv3o8cdCqB8prEoNLxwl1OFsaVNKsgLv81jQIYAdlAQCwxyHr9c0P
         3j8D+VsZrDk7lN+io0YaUunimx4Cs/aoj5CMEL8z321M0nLSjAyxLiw4ZDOIiPJyI6ie
         paGA==
X-Forwarded-Encrypted: i=1; AJvYcCVjydp31hZjtyH3K/O+PdTV+cFZIBdjzho9Ao9YxoF65Ps43B3HpdrgVpfjJ1IouZO/s17g9u/Rambe8uZU9OEE6qzH4I6Fhtzu
X-Gm-Message-State: AOJu0YzdGE14vI5mGkAKycHdV7veWF25rHmrRo7ituIM7BfFxiEqnC8q
	u5dqoeAtrTPmavyVHpFRojo4p7P5uH+SGbgDqlc2D5J/yGRND5hGVZQZyUNpnx0=
X-Google-Smtp-Source: AGHT+IE3YLTxrz4a33OZELsomipBlbv34KTAQaWu5RA+5U74pd1KGVHNkLG+dAjkdpUc4qAC/ksT8w==
X-Received: by 2002:a05:6000:2:b0:362:363a:9594 with SMTP id ffacd0b85a97d-362363a95f1mr2284533f8f.11.1718730675351;
        Tue, 18 Jun 2024 10:11:15 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe9184sm226912045e9.13.2024.06.18.10.11.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2024 10:11:14 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] RISC-V: Provide the frequency of mtime via hwprobe
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20240618114653.12485-1-cuiyunhui@bytedance.com>
Date: Tue, 18 Jun 2024 18:11:04 +0100
Cc: Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 costa.shul@redhat.com,
 Andy Chiu <andy.chiu@sifive.com>,
 samitolvanen@google.com,
 linux-doc@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2BA519C8-D258-4D98-AD49-AC7D30D8B0D2@jrtc27.com>
References: <20240618114653.12485-1-cuiyunhui@bytedance.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
X-Mailer: Apple Mail (2.3774.600.62)

On 18 Jun 2024, at 12:46, Yunhui Cui <cuiyunhui@bytedance.com> wrote:
>=20
> From: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> A handful of user-visible behavior is based on the frequency of the
> machine-mode time.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

I would suggest referring to the user-mode CSR instead, i.e. =E2=80=9Ctime=
=E2=80=9D
rather than =E2=80=9Cmtime=E2=80=9D throughout in names and =
descriptions, since that=E2=80=99s
the thing that user-mode software is actually reading from.

Jess

