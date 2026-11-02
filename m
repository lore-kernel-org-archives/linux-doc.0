Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793585962;
	b=CSoRRLoczJZYJA2ZZfZO/NE1lCMsV3SA8LmJA9ikcK1/7XR7WwSrkXFyRuu0Guw9DDKf
	 AyiDr+NGZQoVsz5DsjNITWZ+PovV88F+5oCqCAKhMpbLUs0dKZdpvlIBMIi9HFd3Lgh9H
	 1FD2J1yHvamKXc+O270wSZfRVgz0nV8DWJG87/atVR7H8dme+Civr58QPvGesEOLud86A
	 vCdD+T5BEK72rf/dhNpCjs3sah2JAoXajjWL1aTfxYcN4M4oCYmB1pQ5roUgWXWVM/QNa
	 h438UMkQqOTvsliCNWBb4L8AEAj9KwJ1S0pJK4qFLXUT96zJL6TwTq9YeSNLTzhbG+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SmVzEHru6v2JByNONOTsp9MZa0alWvR2mXh4ZEgbOvY=;
	b=SbNEoHg21rbI3MW1E6OgYULD/oxq58DG0u1YoNhfXo/G9cSOxBksFsLFOh1qe+WySesW
	 gRnrRzR9pcY3igAJkqCchas8nj7aEo27WDVa/GuVcVMrXDNCLj5yFOrF3rvPmpC2jG2x5
	 mSMkE2D3x3p+H1mBX2UVWZz+hi1/nRDgSGHU600ozw52X7h+MvxpIjAeneivQTe4cyq29
	 oFRU07mj9+IuW+nNYMK7M6r53Dd5rmSGfg6SUjkRzITnrZOAE8KI8DfMbId+St//aLSRx
	 t9ARp9Ij0+ApOGVxUPSpMJ6kAT/0taVUNCck+MuI+o3ZDLdRMlx6g3wYEu1YhqoyKuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ii1xC1qh;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C22B606A326
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 02:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C22B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ii1xC1qh
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2790842c88.0
        for <linux-doc@vger.kernel.org>; Sun, 01 Nov 2026 18:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793585961; x=1794190761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmVzEHru6v2JByNONOTsp9MZa0alWvR2mXh4ZEgbOvY=;
        b=ii1xC1qh2uYRw7S7vh/tWBPqNSvqolIUSNkRvYjgNuavSFhud3Yl4KG2CH1il5slRb
         1LeHzzjvrO7Rmdul1FMtQaalG6scjIHIcOYUrNlZFQUiK+l8uTYRlSIHwS87d6ilciOl
         0vIJgZfn0+seJYEckVzOKvrtaMCbaU5QrrzpRTL1S8UEVwNAjlkPmQVwC9wZMH97ptsr
         rruKOB311JXv+RVO5NsCcE1jK39NCqhExibVsxnVbEm7ycmWWQTZyFZJH84rT3Qwvcm4
         Nug0i5JeMJX35detfvSZkEktPFTgT9T3rqm+bFRS+eP+eJMjQYpDjXhsfRKaG5srfyjd
         urvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793585961; x=1794190761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmVzEHru6v2JByNONOTsp9MZa0alWvR2mXh4ZEgbOvY=;
        b=ZVMj8/ULq7p6XHAtKlLm5k3C/aJfkVunp+v0eKmZQsMkE2kF8lIvASowOOopAwRk7i
         zxlu38i4Mc2XfZFnirR3HstH4SkmL4rCd2WLO3g4o1ZnfmJqWTScbaIKElUNFzk6OCxV
         rT2ifTZdX63/LpoCAb9KjqTjy2Q+oZESq+LtJMnUpFo2HMVrhXsoF01MNUKiA/lPC1M4
         BXXR86lTc9PJlrn7XOJfskq8OFPPADhQPE36EfzAwOEQyD01yQqJjhISigfqaHNqnFke
         8/Iq5G1vXw/U8HUVhywASemXcsDbsbCpXi88NpO5HzNugeMIs84nbenexdEl/Z4pJhR0
         7JHw==
X-Forwarded-Encrypted: i=1; AKwUvByuIsii2fuDsklD7vBBmstbHD7C+zKnxqnDKdP/EKn4lSDVj7PniS1jh6SmFHIB8Me0MgSnKK9pWvY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoAJLCUNjP1C/HA7+Ke/3Ep5dyYGCv/DBHstgGLqx6eUumcdil
	gZR99U+DUDRjmhEfCt2fyGF3JhQJlzdKgJka4ndvhY9g3ePiwLKIdBan
X-Gm-Gg: AYBFou3LyW0N62qKg8FDs9RWxdE2nlytk7j7hMwGX0P40Q2loVEuvZaUnyUOSTrCU2g
	/UaUAMKJNZYeZFfmhFFeWwhkUChIHKv/BtIDna/Gd4wYbDFrCR8khGjZqXrgNkZBNIj256mlsbl
	ccD467WQ9aasFt2W9h1I45OtoUmw2zth8FcQ2qivMuQfHbklTFiiXJQX56oguISNQjb/Ew8khDf
	6bBpUwfKSkIPOhMDtCug27O7qzCw4y1EnH3yQ2GFeW3GcpDVXhpCTGMIcMhlmt8xDSyTizTj+Zo
	imnSblyRM7HZaXwIfqJjhPtmm4nykTcztU+H1bwkVll6+Ub4VpdG/u7jJHp0lUBymQxJfc8QVSp
	g4d7GRfaePhjJ363EBsVrrTVLE5UMO74lES6dNzGL41g45RysQUGF6eymUMP+2O+ckkSJB0emXh
	IqJvwU+03eKWoKwXLoeNC5LBXX+Gcv5x2tPO87KIF/GJBBHisnNLkaddru0ODlWmlsmvbH8njEf
	owyOg1/uNSRM2PRSQ5SYmR5UT/toWW22HIVZih0JLJEXAxSwn29V82I6C2re0V97xlV82zyU9Nu
	I84iK5XMq2V4vOuJDehr+dmJENTZBSFriYxT+7kmhONWAw==
X-Received: by 2002:a05:701b:4188:10b0:166:b307:5855 with SMTP id a92af1059eb24-1ac4f91fceemr13994638c88.0.1793585960835;
        Sun, 01 Nov 2026 18:19:20 -0800 (PST)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm28955788c88.2.2026.11.01.18.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 18:19:20 -0800 (PST)
Message-ID: <11431f90-9b67-4324-990c-2f1cfe6d7819@gmail.com>
Date: Sun, 1 Nov 2026 18:19:19 -0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] docs: add a guide for translators
To: Daniel Pereira <danielmaraboo@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20261015125644.12908-1-danielmaraboo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/15/26 05:56, Daniel Pereira wrote:

> The documentation has seven translations, but the English documentation
> has no guide on how to contribute to them; the only one that exists,
> Documentation/translations/zh_CN/how-to.rst, is in Chinese and covers
> zh_CN only. As a result, the same problems keep coming up in the review
> of translation patches: labels copied from the original that collide
> with the English ones, partial builds that hide those collisions,
> documents left out of any toctree, missing commit descriptions and
> missing recipients.
>
> Patch 1 adds Documentation/doc-guide/translations.rst, a guide that
> covers the whole workflow of a translation, from choosing what to
> translate to sending the patch and keeping the translation up to date.
>
> Patch 2 translates the guide into Brazilian Portuguese. Since it is
> based on the original added by patch 1, whose commit hash is only known
> once the series is applied, it does not carry the "Update the
> translation through commit" line that the guide suggests.
>
> Both patches were checked with a full "make htmldocs" build, with no new
> warnings, and with scripts/checkpatch.pl --strict.
>
> Changes in v2:
> - Drop the references to the Assisted-by tag, which was removed from
>    coding-assistants.rst and submitting-patches.rst by commit 1e035297ffda
>    ("docs: remove Assisted-by references"). The guide now only says that
>    Signed-off-by can only be added by the human who certifies the
>    contribution (Weijie Yuan).
> - Use a plain path in the ":Original:" example, which is what most
>    translations do and which the documentation build already turns into
>    a link, and drop the ":Translator:" line from it (Weijie Yuan).
> - Rebase on current docs-next.
> - Cc the translation maintainers, so that every team can comment.
>
> v1: https://lore.kernel.org/linux-doc/20261013003702.5824-1-danielmaraboo@gmail.com/
>
> Daniel Pereira (2):
>    docs: doc-guide: add a guide for translators
>    docs: pt_BR: translate doc-guide/translations.rst
>
>   Documentation/doc-guide/index.rst             |   1 +
>   Documentation/doc-guide/translations.rst      | 694 +++++++++++++++++
>   Documentation/translations/index.rst          |   3 +
>   .../translations/pt_BR/doc-guide/index.rst    |  19 +
>   .../pt_BR/doc-guide/translations.rst          | 711 ++++++++++++++++++
>   Documentation/translations/pt_BR/index.rst    |  11 +
>   6 files changed, 1439 insertions(+)
>   create mode 100644 Documentation/doc-guide/translations.rst
>   create mode 100644 Documentation/translations/pt_BR/doc-guide/index.rst
>   create mode 100644 Documentation/translations/pt_BR/doc-guide/translations.rst
>
>
> base-commit: 90d9f76ccb72ec024ef476b4229f3dd1957d7b26


Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>

