Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2684028C8
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199407; cv=pass; b=lwY89Zg4yYeQXSXUcNZuLhjkzC4BbEdsItL0Hj4FbdS7CAXt7HFjp0xkCNEFKsPUGLt952qr2Kv27xBb0ZDigx5LYYdnPxpOfZroUwUF6UoaWTf8CxrDqqqD1/iNVqVveImBzPqLFW9TpJEiIlO6PxoE53WG2WoecZGqyOQgAgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199407; c=relaxed/simple;
	bh=vop1AcEUrnwkHtR6ffHRaRp4QJaJoIVlTF22DXItCSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Jusi4WRAvmA2fJ+gkYPjtkRaFs5GVOwdEuTlZ2lkwuAqe0PRztJaCMFH/sq0YYA9sXnJEly4FalDJ+Dj4Z7BdD871ZQOYTsVIsV4ql7mBhre0K5R7FdaoDzKEIKdzletbApIThkT7kSSR3rd54QhY6AMccyfQ6pYZPVSrfCIf34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2DoI1Ba; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2DoI1Ba"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2baca4df358so20259915ad.2
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 07:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779199402; cv=none;
        d=google.com; s=arc-20240605;
        b=AsF7UI1tan7xOwc7JA7HCEnC4nMpsMF6C3xB/F8pA/oQEoAreNxutvBS/C9PS1EGvM
         S2MCtbmsewdm7Ri5NFXdXTPAJ/pv5IKV0Xj8xhMuhXMc+fK6ViamV2mmzRTLchwmgX/I
         RNdJwfzn1auJWzlDuf+H7eBMqPVcBoJEO81Y58kmXAhSEFiuSIfYSpgBl2KfTgbFqi5x
         OqSns71Xxg2DAfTUZXDJ/J5YuCtY+I15XyLNkdmzOCCv8tKfTmjbkKNth0iV2+RRH0wY
         74VQClmv9aZF2Zm0mPtjwkD2lLl19ERZ75IxNRZAdHnlAizxJzf+J8KUYAsDxrs0EH/Y
         EA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LX1rRc5GC01rJ+CUeT1TwEMsB4kfKfHr7ZdwAZHUxb8=;
        fh=ZbonjbzJJsFV/lWPP+WlMJ1nkxs7eEVT2jwfomzjfAY=;
        b=jxJWQi2qs7tkX/4qt69ATCyx0YPwodC42kTzcTSW0vny44ISUFa/rAiOTO0K/qq6A5
         sUukJOlbOUM5/tKV8UTlu5RXO+X/PG0fbPyjiJSoA20EtmHWxF0Zi6WUb4X7FUeoxfVu
         IMjdqm1ZurAFubmfpB3oEg4JEIW7kBAXYqQAip+o5/w11DMzOJ3fIuFoJf3vMSshjWFH
         0qdYk0n1hBfzZ3FbsWX8sGZUBfOBZjKlBz8JMAKT0NYQndttVUHZR6AYGgbU0NPXo7iQ
         xRvsehQnykftrp3W1CGjHzKPccdK27TDTupqeW2mL1RxmJ7FBiUpbrw+jCeBDBQq+8un
         RTgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779199402; x=1779804202; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LX1rRc5GC01rJ+CUeT1TwEMsB4kfKfHr7ZdwAZHUxb8=;
        b=f2DoI1BaO3f49YaTHMBZzLme3VwC3SmXgMblAZHqfa+IFAZwVvEsnDDByw6iHrPKV3
         jgpsN26EYP+Cy2ytyVIYEKbgtDnX4VasAicUg9W3iEgXmEJl1ZhvfxUWSvzJ7ttuSWge
         Jk404LGLueTks4yuu1S37pYuMah8DoTUxgSoJa5Ep8R4paHQIxuanbqyFMmp9kKprrfM
         ud5Ywj9Asz1pM3a4KuTpkLSyv2NUSTjX67WeSP4O2kuGlsOp11wuJ1pAgIfi30JB9jFU
         OFY62r7DR7u1W2fUvhVQJY1haGkFfIfwfVSYRDPdyA6m32Yae1YXWCcpSQd9pNVMk6D1
         l13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779199402; x=1779804202;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LX1rRc5GC01rJ+CUeT1TwEMsB4kfKfHr7ZdwAZHUxb8=;
        b=hXlnEhBPMdNALZFMOo0FiNjTCivQk4SPBuJ7/0lY6Ct3uN7A/5JaBeGv3FJOwqHPzA
         iu69NQl5/fkOqYodQs37BHNutkBQmYq7Dbc/wfmiSeQCz07dSfZmuCE7S9Sf2EmBl92R
         WN7GkFeziyFurA/8xrp7OTd6SXj6N00icBaxPxZLuljWxvmhsXn5tzBVNbhz0B59hv9S
         k7Yadp4f7WRdrmjdNmGonFZLmgDonPri5elQ3zMl9fg5LB3JZpMDFhrBZgHQ1phytMXQ
         lRuquyIcl2bWoikr9RJpP41kqbG7fnNe1Av+HJEh/nPKpR0CZtEAkxCDUxPvCX1KIUmS
         hSig==
X-Gm-Message-State: AOJu0YxUdLHLPIuivncO9k4us1iHyTHnCUdXU6+kNhsZFreeXJf92csh
	qiU/HQHg2sMhRaFdsDEixgQcy3RL+WafU8rMoVQMNLhJycetphFNwiJMvNsd4JCthPTWeo1/Qro
	DM1Mp4ffVf+IBQUu7uWqKUvY3rYvh9OWFPnJt
X-Gm-Gg: Acq92OHws5hjjNsQf1L9bvtMA9lcNYBdUgGE4I6Jg/6uiDKYbKZHwR4ohkhtXvFsJLM
	Lz3vGbs5hWXmTcxU5g8+k/B7+/Tvb9axp0ABg3wDoJmc0tS6cleIp4phK+sPttSXMU5ZBgK1mMZ
	MrSbjFyN9Imgjo3IcpjcH7Ree6x2m20SM7hKjtuRt1n4mhgYxUgB6IoQGQJDSEL84ecJEQAuKwd
	JfL8LoIp25R7FS4Uu4ECL4oRsRfDKPo96SmYZ+rChx7KwwqGNO+q7fuVj/8JH/pZPit3Gut3s+G
	KDowbeOfuZz5tLm6rvjYaptsq5CUj348XR2MqqPi11LSyXLexA==
X-Received: by 2002:a17:903:1a26:b0:2ba:5f24:cae2 with SMTP id
 d9443c01a7336-2bd7e9dc136mr207987175ad.35.1779199401966; Tue, 19 May 2026
 07:03:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519140035.1031694-1-danielmaraboo@gmail.com>
In-Reply-To: <20260519140035.1031694-1-danielmaraboo@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 19 May 2026 11:03:10 -0300
X-Gm-Features: AVHnY4KS1uOxLCDBpIhNpHMafN_8OPEO4Cccpf504gGiqFpBBgfOI9FZWatlwcA
Message-ID: <CAMAsx6d9QE4scfZDzV0CvOozkAGFy__+Bc2S9y7Q=ZukyDit3Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] docs: pt_BR: Translate process/kernel-docs.rst
 into Portuguese
To: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 11:00=E2=80=AFAM Daniel Pereira <danielmaraboo@gmai=
l.com> wrote:
>
> Translate Documentation/process/kernel-docs.rst into Portuguese (pt_BR)
> and update the main index.
>
> The content was adapted following the RST formatting rules and the
> appropriate technical terminology for Brazilian Portuguese.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/kernel-docs.rst             | 373 ++++++++++++++++++
>  2 files changed, 374 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/kernel-docs.=
rst
>
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index 77c1a1cdc..76936710b 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -67,6 +67,7 @@ kernel e sobre como ver seu trabalho integrado.
>     :maxdepth: 1

Hello everyone,

Please kindly disregard this patch. It was mistakenly generated as
piece 3/4 of a series, but it is actually a standalone patch.

I will resend it in the correct format shortly.

Best regards,

Daniel Pereira
