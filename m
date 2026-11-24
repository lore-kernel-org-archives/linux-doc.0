Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795511312;
	b=GYNgPrQht2tISmST/CzTLmOcCDgiYv4YqH3+lVNCXILyIlNUoas9fTdR5MjEFlSGRrIn
	 3Eg9vz2tXqHHXsyn9gVVCzSN4A+QWqoKOqNCsX46KZQ42qEmtnHVWK8ytxgJCYsyjWNyn
	 R3CsCgc8+u+ptDFjGPXn80JoJvr0jcmqmgmGuPy0LQ0UOIPzJNTp/6ks7xVyqrln5i9UA
	 gJ2V7b2+qB94USE4iVb+y6t/t2xTbN62MUoy7ZKJS6I82itroj3DoLbm/DDNds/jhrY4S
	 QmyLJevhiXqtARTfiwCodseLPpCr44iGEupYHvqmJakFP79SWtK6StguYTfLXHkMvUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZtpqAcH4jNrNmEmDxYS+c3Iqu+GQGbSZvdzySFz9vqk=;
	b=UXxLYrT3FTxTGLG58dizg3uxqlGVmEtMpp6RuR4q1scWERB2fGXd8bojxYm48I+h7NSi
	 M0iAE0LmRguNlWcL2faJuuY7CBxOraWHkqe2ls/WwuQ/CX/U9xeGeyaW4ry8XI9jTldOj
	 EcKsQV5Lf4K4Hotx1gbjXvaFuPYdLaua/IuNKQ25VhZKkqcMZ+eAmiBM4LGZ/5qci+/mV
	 IZzuwdFLdleVNrb5p7IZd+tYwapsjpIQOub+/GJdggwafY1bNK5+4thrLMBdjr4UsU2u0
	 XvjIGQNtQXW6dTYZKcpVpOqSQ1jAP2eqJnscz6BNCd2vw5YL+80g4/kZLJe158nbHKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJZEb0k2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166B2606A31E
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 09:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 166B2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJZEb0k2
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so5689087a12.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 01:08:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795511310; cv=none;
        d=google.com; s=arc-20260327;
        b=ehElp5kdbxgH3uNmCzZ2IvL9oUqzPqNUjvlms5jmw6J4bwoS10by1+4sn0nrayVC1J
         jVFRSeKzMEDLG447wMgSfnWxGyujoYwYImHIgeusT0l5FDT7egOSBpk9sREAjuH6tnjZ
         9rgLora4lYhBBwFuLcHb5wU20ppz4vx2zIWFY72jy79r7DuVrV07DFBdjsWi9xC4iX0D
         HO3ms2EvcM452qi1SmT+zHBpZXfjQfNE3F+kLzOg1rGTcCUvIR1wCnORTFBMMJr8iKxZ
         pb7SXHROg7xguKoSUAc/b5QqZzhNoIvYTCU39AmXeEDbpf54D1Of7DiTK4impH8JhiuE
         kOiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZtpqAcH4jNrNmEmDxYS+c3Iqu+GQGbSZvdzySFz9vqk=;
        fh=XpbqSUOieXkiu6Acp9t8QW40IyOu0R41gb20v+FgGB4=;
        b=bJxFWosa5xWYQTsJ/u8K66Gbai8ol6cCpElroD33dYEb2GpFitt+Acb6tz0JZ4WHpq
         lgzqPoJ7/FdWg8UgZ1QUdKt5R0Zy8NWVEBMuQLo3GmOr1ASlqnQ7eaiIajleREDFEpiN
         2sh4EFJwPvDy4MsvBoWnm8CunE6SRIsGFGUEsXpCZ4avGFk+bNTwePMotyv8VJzf8kIb
         DgIBJTDdaIECAjiFFiOO59nhK/iO4Hi1VDFkVWht6SpdzT0zcy2wcaRsqmhctTgKnwej
         pHpqS2NCYrMQRqihSf8f499lu8Q+y7JP23Ay5Q4LHaLEUmlXS6p+o/X9HeFfBHs9LTZd
         Z9hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795511310; x=1796116110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZtpqAcH4jNrNmEmDxYS+c3Iqu+GQGbSZvdzySFz9vqk=;
        b=RJZEb0k2qFLF6WVA3OVIdGzyamTTFMrlsqq1scT+R4KPu0S3U5eDC0nw1aLRK5G852
         pseQgOXDaUE5lXJNjCzuASxPlgBcmUnDGCKkWD9mPwDH1CMBgR+nzFsfmm/wSO9m060W
         ejsWCPHdJe+vhHY+Rw5FVcMl+KZRvmuP/9kwsJp6THnbiooCiqStTodBzuA1U4r0D26P
         ufu4Q/5xgnObvIFeByB4ZyylHp5GVjTAL0YB8kuhHZGxoM6nNPNSicV6AaB+5kqjn58V
         xXf6wnQTDLj/+D1+grflBHWpLpstrvyPgE4UA9zUFf0H++2wdryeDXwXa+06MXbe7xJ7
         wZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511310; x=1796116110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtpqAcH4jNrNmEmDxYS+c3Iqu+GQGbSZvdzySFz9vqk=;
        b=HmgBnlX93Id0GqOWuii4nvAfvlXv2mCkkoTULicpVXJgrUHJQXkFxUjADI4Wb+OAyD
         HON9Q/Y6caY5gyhrCqnixOaoa9xBS7ORbx762baqgCsTD6qqMZHtOtBwYze0/QQ+WQ0a
         YletxbakR2S+gRjTYoOvTY9L+f41E35oYa8hvGzApW34ePkiRVG1s/8Zuu7xBrt7JwMw
         BDPB0yosiZ+3jehdnaT1rE/TnVqLe0mfKmYRFiqRht0CNSMdhymq/hTx1OXQSXv7kR6t
         z8yi6Db2XCfdOtzNUGVOTQRv29V8H2n1+CKhECnz7/RT7ABn7fP2Fr/eA5oXX2RVNbH9
         lnFA==
X-Forwarded-Encrypted: i=1; AL+hErE3bdEgMGNdd5oDqzmWaVddvYwtv3wOzNb0yZAZEjyYqd+3TffOm9rLJ4kjA543syroqvA2ptVoID0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pNs4lqaMtiTLKQl2jhlZLHEPcjKnH8kQF3cpBVxpG/5Ea1TKz
	MceKA+f2UDHpNNtdtcyRaCrnI/7CcpAYAhuz7Fd7B+AUwaHyB3twUIhQu99gKX/54iUXb6RadOF
	M1JW9NuUFZZO18UZ17pD9ihViHhR38t0=
X-Gm-Gg: AZFdTZf1N1oQufeqKk6U/29dmOpwWgPGT0xRqu4E8a6tmCeA3rD9/+TX8EAXMvTWDu0
	5ERa+wY581wOMKjn8rb1oog+x1f28W/MKZTBDLU8glMXbz3o1L0o7C/rEZWMWGflTecmzl7gDAr
	xukwKSRlwUa6HIQb13VYDfY5zxUlacSdHe00aH6Wip7Yio+To3+9EbUQaNgE5Uv6rc6LkYd2czo
	dfYAOCF6zXs3GNiOwSfCNXnvFUt5/fWbZg8fiefYWT/KQsTEniyAO5M6hVH1TNtNpKP6N7vFenH
	3dYu5yeWwHMHfKmZovKHTLVpho1aXh0a6hlSi2v4dxDG6i4ZQWtk/gtFcw2R6UsYwc32YqJKQOZ
	p7/QbPC5edhxCdteu8RpubCnanp4QtfG6VXdpMDQC7SUfWfvxUnILJ3ktQW6MKNGqEE0voA==
X-Received: by 2002:a05:6402:42c8:b0:6ba:9dae:f0aa with SMTP id
 4fb4d7f45d1cf-6ba9daef192mr4933101a12.45.1795511310178; Tue, 24 Nov 2026
 01:08:30 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118041238.14396-1-evostrov@amazon.com> <CAHfVqdVw9OQ4OPmpLp4pJQhFw_9E7SLwNDjYXYuuGkU95=gGdg@mail.gmail.com>
 <20261123181346.383390ae@kernel.org>
In-Reply-To: <20261123181346.383390ae@kernel.org>
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Tue, 24 Nov 2026 11:08:19 +0200
X-Gm-Features: Aa3M54pGZJfH1mZu3NDgkPTKfl4Vj5dSI8aEU4mnk4nYNJ-7xyhF6_Xqo3R-jg4
Message-ID: <CAHfVqdVkTOYR_1So9S4pQj+xvvpoJG+qFY0zW6eOFuUzxBiigQ@mail.gmail.com>
Subject: Re: [RFC] net: ena: use tx-push-buf-len while tx-push is off
To: Jakub Kicinski <kuba@kernel.org>
Cc: evostrov@amazon.com, netdev@vger.kernel.org, 
	David Arinzon <darinzon@amazon.com>, Shay Agroskin <shayagr@amazon.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, Gal Pressman <gal@nvidia.com>, 
	Michal Kubiak <michal.kubiak@intel.com>, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Shai Brandes <shaibran@amazon.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 4:13=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun, 22 Nov 2026 10:32:31 +0200 saeed bishara wrote:
> > > - We still need to tell the device how many header bytes to pull.
> > Just to be clear, the device eventually will read (pull) the entire pac=
ket
> > I think  tx-push-buf-len should have been called tx-inline-header-len,
> > as this is about how many bytes of the packet's header get written by
> > the driver into the Tx ring descriptor.
> > IMHO, we better introduce a new parameter, that is agnostic to
> > push/pull mode, we can choose to deprecate the current one in the long
> > term.
>
> Agreed on new param, not sure about "agnostic to config mode".
> Or if we can deprecate the old one since its uAPI.
I mean the new param will be served whenever the driver inlines/copies
the packet header into the ring of descriptors, regardless to where
the ring is located (host or device)

>
> The driver can store both values in one tho, effectively forcing
> them to be in sync.
>
> All the new one tx-hdr-depth ? max-hdr-len would be more logical
> but we use "max" to indicate the max value for a param.
yeah, max doesn't work well here as the driver inlines this fixed
number of bytes, even when the packet is shorter, the driver pads with
zeros.
I think the name should highlight the "inline" attribute is it's a key one.
>
