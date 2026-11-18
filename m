Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795034443;
	b=BgI93nEwwtrAjUYtOIEdsnwaf3TmNTzfR/MQK8KCwnfrCdO+rTH+hL2VksNxrx/6vt5l
	 QSolC8DOyZUJwj/MuNcQWC1CwlqHyTaCBcAdlPVtHcfD40/LcFcEBujIegf+xm03nVYNt
	 3MtQZitxeQzsQD/Ayp5P0ACVg5M7stlzXKv+N3VD/iv1im2tp1fkZfSxg9H/t7CW42BLA
	 z+rEZfGqk9X0C/9nKvEToOsv3gMy7NdmqB+UZ76RD9vXTt+luNnh3je8E/osD1H0RKwRk
	 WpOw04H3JdZnRrF1qE8RcyhtOyWOBJc3zxw/GqaCVvaxSAmc/tRlsaLw85SELWJ9cHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bjaPw4jPdWxt1bJx8dGwdcFSJPPCd+UffAYI08DckI8=;
	b=d6oKDYMJkBS80k6lVzGupDG9aMM76tsFpsLVjuKWNI+edaQQuPekxrmAXlOBO9YFgrsC
	 63XfWIRB3qm6BeZJTlnuZax2ttutNVOb1FcAjVyIbN8ubtdI8yU/DWp0RwyzXLpm/qHNT
	 88UQugL9lHMtNVOr0WBq5gs7vHdnWfoeqg0sAi33KXK7BmLZ6/O7kv6X3/ohnmZarVX0g
	 4gHRrMNR0bgcOYgqdnuxIwdhAPQcafQoTnWTQVgu/XeyUmH6StHskQnh/Z+66FKbXeiAH
	 d8GQEsQrKNvAM2V/fAv/7mWou1EfigTKTBYHvInyqHXsk8jM3hOuzZViFX8bBPUscEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AClX9dlh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F7B606A32A
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 20:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79F7B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AClX9dlh
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-92100b756b0so9939556d6.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 12:40:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795034442; cv=none;
        d=google.com; s=arc-20260327;
        b=nz4YWQZrZRKD9RqtE2E19YdBTG5LVvjfjBaJc5Q6TjskpMH210HuUzCMa2gDHHDs81
         HvuRarEbvpT5bftKBYQ4gJMguvLIEDZpZEvuw+Pro4S38K4CicfFEHlX5PdXYtsMFeF+
         QnbPwBCewCa5+YAjgwhGr+ELP620vRygg63uU1yKAarNjK51iqyC8ECW8A1RMBh/zkaq
         Dwo6TxhttiJlcmaZ/AZSfM3dgVMgKdWdXF+k5Y3bDRfa5Gey65/uedpIgqOM4z3i+h8g
         JmPxHBqFpInhxmOsCfq2ixlY/PN8lnVMd3t+KoJhJqSSK52WcGumUFp2k0mVvHkHyXAc
         emDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bjaPw4jPdWxt1bJx8dGwdcFSJPPCd+UffAYI08DckI8=;
        fh=NJty93EYCWooUTYcnLHL/GZm6oy3Nh+Hy0ZPXIVHTJQ=;
        b=Q76D0ETufbKa1Sdsw50WTX9YoTToMER4lkTtOuF6mM3Ha9AFfgc2RT9b1VYfg/UmQQ
         XZsnJvkl2STOXUw8AU+oVf69wQ+qhHqSRqBFcnl5wi/FmdKWGZwsqxXqi+3OfON56DTO
         7KR3Ct/KQxW53VMBOSEOrCFmgL4m3a6cdlbm7z26MGNp2+36ZgYyMj29M7W7mtylYLHr
         ra6sQxJ1R0CeGjnYdG3HVhwN9qNIsGTMuRkO0RVkvXtV5/UQawa8OC+6KZ9Hd4MxUPDv
         2YKCJYqPo2+ezs2EixLmZzczFuLvvFoUXGC4JAg7p3LIQaGvtse1rSdHUKxS6OLMMlS4
         64Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034442; x=1795639242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bjaPw4jPdWxt1bJx8dGwdcFSJPPCd+UffAYI08DckI8=;
        b=AClX9dlhdmMRGePI7QFzY5q8xMGB4l+/DkfG+5WkBX1Ug3J50fNjaCtJG+WrOBkxUi
         RpHpBHKQO3BOaJIA3rYtAoBgR7d2wQ+acoyMq5F8NKt7uv+HbII7X+fClzODwFObxloS
         GRV4mLMt9bTstaPayiOlyBhWopjyBJlxG6ULjOGyFAIHQ56FyVgxP9lTEW5GhZv6pOl/
         eCUTwsvSIzWeHOFHoarybztEl4fTLLO3MtYDiY9P8le5fRhjzTICZMHvxBAq2ZNvIgPg
         wvf6yooXXvwQCQyRZI33L/Htza1paEzeFiZP5EYacLhzeK7DNVdQP7RGKRzt5NFH5wxF
         FMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034442; x=1795639242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjaPw4jPdWxt1bJx8dGwdcFSJPPCd+UffAYI08DckI8=;
        b=vknnEhxJ7lUnOAjfBRvxik2rKarCh4AK/jf+b4T/hnVQ/2JyPuH/w3FKYLlNVADw+a
         5SgitmsA1lsUQx7LEB7Mv52uzIpaiVNCcO2/zqebMHeLlvu1c/YiNufkFGAGaQrwOVAq
         1IKqsEZYHX2FhKpZgyf+N7L8O9XR/ZrnAQqREtg5exwN65kpnwRX5OMQwtJfgz6v46gm
         xcD4PKGC1I899qzpgIUIVtU0umkVtchid7nvq1dJ8JW+j9UHDGDDGL2VpM5Lg9S7MZ32
         h3lQapoLYtnrHrq5iY7d9rYBIsJbs53S4szxBLpTuSrPljnJlH5tSbPaROukgJ6ihZnn
         DIhA==
X-Forwarded-Encrypted: i=1; AL+hErE2gUZEkVrj1YLTan+Km2arRrMBCKdgajzrGjgoK4axZf+fnbqJfgqU2QAraK6EyoMPK7dNqFPVqus=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ryWRDFEWkz9PKf6OsnvySel8e92LHKwmjG8sZFXyAsy9Cb4XY
	yX2kEV5WDrWKRK4kxF8Hfgy8VFemnBIAlKW/CsAEfapXLWn+lyVDnJucLuVUjd98F5nP+0/BJ47
	Z9uS22voC1Z+dzS70UW1etJVEPAly11w=
X-Gm-Gg: AZFdTZddzGM0kG9ewo6NoMkt0id7JWilGj6wJMCncgQyXcvbaqDZpZIJjeSnegLvqAe
	gvNG/L6u0MH7siQuLVgvfsVtjtqswAskHK6UrrjqzEfwFxTOErwuIDXO/ToCDPr88+2p0mt6DLO
	7vNrGhQh5vMgDVZYQpI/PAjgmch/vNLdu27aVY1Qhrx348eUVZcanGrM19a9+KP1ltp5IhT1d0i
	FYY6Q6hFA+eYephk+vws6AHOECpoPLiF6cmraVKdeCV+PxqILlCqd/eBEH6tRRtuxifRJFAlDV4
	WE8pInkNH9GdLOJw5k2cq5S2LH+djQ21Ag8CpaxYqNag+uKB1asw+tmUFQ+IH/geayvi11/tXdJ
	xNvYx5KEIrvJT51YSZwK49WXtT+8WO/QF5wkXdcrmOOuZ4lcCplU3sD4OEAoLcpVEwSKtshXIHv
	Hb9+qh0rzmEgAiU96lvcvRpvE0ftc9DKRDficUiA+CfSzyi9ZtP7manNucImdjCvEN+/oYUgPsU
	4o6HL6AmjVx4sX2VYlua7q6
X-Received: by 2002:a05:6214:478b:b0:921:1e95:2f39 with SMTP id
 6a1803df08f44-9211e95565cmr26397616d6.28.1795034442203; Wed, 18 Nov 2026
 12:40:42 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117223335.111220-1-igorgphotoarte@gmail.com>
In-Reply-To: <20261117223335.111220-1-igorgphotoarte@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 18 Nov 2026 17:40:31 -0300
X-Gm-Features: Aa3M54op0YIBrliHol3Mlc8wtKvr7NtV95bZyqRsSD4Pdht1ncNL6HO39vbZMlY
Message-ID: <CAMAsx6dbXRHY+bYads72Zh-jBWh73PQ8ZA39A7Gsm-owX-o+kA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] docs: pt_BR: process: translate driver development
 debugging guide
To: Igor Giamoniano <igorgphotoarte@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 17 de nov. de 2026 =C3=A0s 19:36, Igor Giamoniano
<igorgphotoarte@gmail.com> escreveu:
>
> Translate the driver development debugging guide
> (Documentation/process/debugging/driver_development_debugging_guide.rst)
> into Brazilian Portuguese and add it to the pt_BR debugging index,
> removing it from the Todolist.
>
> References to documents that already have a pt_BR translation point to
> the translated versions; the remaining ones still point to the English
> originals.
>
Hi Igor,

Your patch series is missing a cover letter, which makes it a bit
difficult to get a clear overview of what the series is about.

Could you please prepare a proper cover letter and resend the series?
