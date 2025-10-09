Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991851DF26A
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 08:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759998410; cv=none; b=ZzMNpQaysXkM3nLH/q7znFxL3yBfncxbdKQNfaW/xKiuCs0FVlGIVDnpswcsWgQjq+q3IJK5uJZQDyWeBf5TWuaJ+bx4Aa9OQ2s7NwM79dw97yqxmA1aBu0wFTNaUedBrbJGVLFb8tn7qYzIH7/+0ai8T3cL3gXHuzqK8xTCzRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759998410; c=relaxed/simple;
	bh=laagjn7aWl17/8NJrjXzs3ne+H5B2OMUlDco789Eqso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NCdTYD6LO/H2X2Z7NkfaPijTf/3OjClJ5C6okkJWG4h8feg/nhH7Zq51g2Gxm+lspb5rauQRZPvtX9CM5Ip8WouuimoGKo6QoUtf6sRBg6tHRxEWZPo+Zk51LMrqaig4vDjHsxoGfSNYq45sLr60WvD1bTmYzvyLMO152CY8pcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPlxl/na; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPlxl/na"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-26d0fbe238bso4527775ad.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 01:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759998408; x=1760603208; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W2Ft3JZVxwUGHhgP2dmpSFXkoYqt51Dpt3UX4jjHUxU=;
        b=GPlxl/naKWPaiH1++e+cNxa0aVMzr0DrHXw2Rr3Gp1mlY1kMS+W8imfBIccphSmRlg
         wbPQQVZuNwDnzKfWMfBRCgIgD/Fz6oE7PCw7uwMCV2flPbuqlxmR6+jOp31+F0iIMPhZ
         OE7ZBr0WXGJ3mgVWp3Gs6EHKUFjeFkVV6z/lo4i5O7bzOSfu4fr4Sxv0CW5u0yKF/A7e
         UDxDokdZ4LZnJUJS6p36zmgqCA12Ls92l+xZai5TpaBvgxnwuIMtK5SfImCtzdm0/lJ9
         pM/gYvz3k1yJ9KD8/6VeLMeEkiYfxFO/SXQQJ80tJpBZdz41TTxMsJr0bRwsxGRt+zF3
         IbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759998408; x=1760603208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W2Ft3JZVxwUGHhgP2dmpSFXkoYqt51Dpt3UX4jjHUxU=;
        b=jR+SBUDvhbkTy+VbCq4xIv6t+LpEKG7o8WoD9ibTll7iXPCAvf0gazDl2EaPqz0E1x
         9usFiiklYnA1zVq781haetZzDiB15CvnUQiOssQv4AcW9swdeVbqxS8YeA+fV0zydAfH
         Kj4DResBfs8nHYRmcnS+LZOJcb5lHpdg8orB2br7CQpw65y+DNdCRMBMyEupmDJPqcHt
         QeECjNAyI2F1VyF6Xxsd4zb+2sM4HQO6nlCM6I0nQlHZdurwwlcQchke7YUoF3fq1rEp
         vrO/Wwjob8nR+HyjNK1lYP7AN0+uvHM+tEYUwY9f43lezNB9AK93Xudn5GriyiDSUsAi
         CxuA==
X-Gm-Message-State: AOJu0YxOmqttQ5OrYv9xQImtdIUQQQIS3S02sJaKVlDma51S4NDO6zqg
	IoC4VYp6VqGenSixX9XMRtBdUAFUtcfAdxgor2ct+gfb4wF9IGuWCMtU
X-Gm-Gg: ASbGncu6ZjxYR80bWxfLaV1iO89FXpaMO6OIWb3O4ruLo6LvSsSRwhP+n25j67lfCuf
	LlwiUST17BEkjDHNdWAfu28tmlrljamCXLQrbep2iMFoHVfzQqHBHQo/y/09I2Q2MKdH5mJB0bK
	LspzrXnHyxSEwhM6BZSRhryL1Njh73WtQaVnMWDQUoXui9AkR3nwFOCx66Tldg6SldY889mS0vf
	KmwcWuOrR+HPaolTgGC+07YCeyjLeiKihGZj9nnxhQYOvWdktiFPF13/FaEh/PeCPrE0VF8OGoY
	pMYSmmgWHt9EslNbHX2Soh9oWnuJt7UX1iNtVuuBS+o4MsejL7U0okgzSjRiQ0cyzYHteLJzKta
	UkxUZGRZ37+iQTSWzP6YfOXnQeNEb44fhZQp4oQMyoUiMatiF6jVKbxpjFVEkfW98BgLRnIE0mP
	15N00NiSQxa225op3u
X-Google-Smtp-Source: AGHT+IFQ1nR1vrItDth/ez1et9nVQMIzry2Ll/Oi8MnjpXmxpvk+6HHbq9rbggLNbQeSmGv/Q56B2A==
X-Received: by 2002:a17:903:94f:b0:250:643e:c947 with SMTP id d9443c01a7336-290273ee209mr82515525ad.28.1759998407726;
        Thu, 09 Oct 2025 01:26:47 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e44ef9sm20699705ad.52.2025.10.09.01.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 01:26:47 -0700 (PDT)
Message-ID: <c35e690f-0579-49cb-850c-07af98e5253a@gmail.com>
Date: Thu, 9 Oct 2025 17:26:44 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Error at www.kernel.org/doc/html/next/ since next-20250919
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>
References: <6e4fab41-e8ab-4a43-b942-3e9271deee0b@gmail.com>
 <20251007-awesome-guan-of-greatness-e6ec75@lemur>
 <871pnepxfy.fsf@trenco.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <871pnepxfy.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

On Tue, 07 Oct 2025 09:02:09 -0600, Jonathan Corbet wrote:
> CC += Mauro
> 
> Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:
[...] 

>> It also appears that "-D version=${TAGVER}" is also not sticking any more,
>> because the new version is being built as 6.17.0 as opposed to the version
>> passed as the -D parameter.

So, I compared the arg lists given to sphinx-build when I say:

    make O=OUT1 SPHINXOPTS="-D version=next-20251008 -q" SPHINXDIRS=doc-guide htmldocs

At docs-mw (commit 99510c324e53), with the long list folded:

-jauto -b html -c <srctree>/Documentation \
-d <srctree>/OUT1/Documentation/output/.doctrees/doc-guide \
-D version=6.17.0-rc1 -D release= -D kerneldoc_srctree=.. \
-D kerneldoc_bin=../scripts/kernel-doc.py \
-D version=test-20251008 -q \
<srctree>/Documentation/doc-guide <srctree>/OUT1/Documentation/output/doc-guide

At docs-next (merge commit b14a05303f06), again, with the long list folded:

-jauto \
-D version=next-20251008 -q \
-b html -c <srctree>/Documentation \
-d <srctree>/OUT1/Documentation/output/.doctrees \
-D kerneldoc_bin=../scripts/kernel-doc.py \
-D version=6.17.0-rc1 -D release= -D kerneldoc_srctree=.. \
<srctree>/Documentation/doc-guide <srctree>/OUT1/Documentation/output/doc-guide

As you see, with sphinx-build-wrapper, args given to SPHINXOPTS are listed
earlier and the "-D version=next-20251008" is superseded by the later
"-D version=6.17.0-rc1".

Args given to SPHINXOPTS should be at the tail of the list, no?

Regards,
Akira
