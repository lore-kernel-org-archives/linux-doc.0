Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0531A5474F
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783843879; cv=none; b=knwQgnJ8BcNA8wGXTPPsSVf0wQzVge8TY9L2D2CXiv35BQ5JhZ3QTw59mZuSC3uiMx4YIZOc6qn8ozo9lwXFAoEpCS3nf+eNxmN1QVivTATWIZcPAuYMgWT330JWP3CMTyvijZoFrUpZhbV7xnq35FkC5PnNAKToNuxfg8nXKI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783843879; c=relaxed/simple;
	bh=YNK/Q15j0BfqaqQXS8D6gfs9S0DAyMyJjrSoOAPa0nI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M3gaUpzDjE1JKpfToqm2y+RDEXEFD7tZfht92KOEvs43qC9y5fZ/kGKNOi3wVF2WXDzBp3z62L7VZpJ255VvsKzc+oIKfhAptmtuOv/BYkeakGHVS5aCiVV0OysJiEmtdLhMvYwYerTbwiy8J/VWX1KsrnmxJUYP4UDCf7H546U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4JbFyVE; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4JbFyVE"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8486ac3f347so2533734b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 01:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783843876; x=1784448676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uE/zclQo2IaJtmQIQej2S/lPR7C+mRKZL6zecNEtNY=;
        b=o4JbFyVEtGN9TrLl75yt/FvwS7b4/2Rx/b0kV96ATompaaOjeFnmYOAcVVg9rpFrnf
         CS/N8NeZfW6XoBGgECNjwby9/1CXKwY+fALX8Jer5gxXftXWyLuholFaYEuiUvpOYcjL
         if5ZsSb+azd1VOz2Fs3+HSjiAOmJFNY+MXTWDHtvT0wCdLXp+JhmJD/fWQqXS4V9j12O
         O3DCCeV/wNPTwOH9HJqdYwqOqu3Na28voif9TCRC7/UFaUH2NPzU/O+rbznMbAQouS8t
         3Bf/XCFmWZT3nz/Scy8EIr1J2Qk8P6CkHEibNF7J1xSwEezHvMQdwi2xCBV0Vz3CxEar
         AMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783843876; x=1784448676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+uE/zclQo2IaJtmQIQej2S/lPR7C+mRKZL6zecNEtNY=;
        b=L7ZdNqG5ZfNlyU0brlYQfObsfrhFBzduspd98dU0I56hdlCDT0iVvO0pcFDOM9KVNM
         hW8G8mdSO/V1gnaD6N0FZPuEBYUHonkbltYoL60hxdMIESNv4BVMdjrOovoBQ1Z/Ai50
         ZbODao8YEn+6pVs4z2nWTXnxzhmBYvaGcoNivIcX3Jz7zngnDbDo1rHOyUob6qxvNpAv
         9L16ByWRMU7/J8YukWtvyalBIE2BDQPMuBxmYlkp3XzkbZtAdrpkan7XMNLW5eW75FPP
         dTI2p67D7MEdLTghefhaMNXOxV6/N63/iJG5JxWBqDlMSCdOVVS93sl+x1B7o+7d6uiw
         giIw==
X-Forwarded-Encrypted: i=1; AHgh+RpYiEswjmL1YPmCxNckh64yBmQLsoQGYfJc6VEmhaEeqXc/MVShfgD7fvNnEHDi0bmuYoHusy4HHws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+B6kGFPPD84saIqKapkRSSOnPyik481JOjuqhVcJCuoaJ+rHZ
	QuQl/MDUxqmR/qfNxlDhAKzF+EyLRiYkl0wUrz8g186o2S735OJpNoMh
X-Gm-Gg: AfdE7cmFAguOgZoghfl0n6CmqVbitRI2F+XlDHEQxBepfs6XjqOavs0L9T3cFWLpKsD
	B+/05uEAvUyqg9hXc+h636F0slBs87QdfFtyGki+EQGptjD8IQ5RsA54kM2/nqa3j934g23svxp
	FsoF/+3DFY32vkAvuChTuRxNR+tw7wpx7+rWwFBG9tlYeGILv+s/csTjK9kBUO9iBaC+4aCyPtj
	wl6t6XBYSwvqKyXTQIE8KeNRM/3Ii2LPA9DsSoYTh3vdqRcXSnY/0ejmPk8NZASnk/EZE65CwRg
	6DyBHD6QgPjHyIbqDNNHW7KNQKUgg3f/ZMuNBcwgQWhy70uxcQCma2mfhVHK3eKXyjiFhFihSAs
	eUSV1mrI9m1x94A2CSYARBcYff5q8PhhBIeoe0SJeTIiVpop+i4tQTcNmmNlWEHEDd26eoQIizs
	S1f6LswY/GvV5d+BWSinG20hRVdnDMt/GjdOcuiWlUs9l/MCQPhcRqXw3EEQ==
X-Received: by 2002:a05:6a21:4ccc:b0:3bf:bbad:500e with SMTP id adf61e73a8af0-3c112b9c1c6mr4671213637.5.1783843876304;
        Sun, 12 Jul 2026 01:11:16 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b31628c1sm6899731a12.19.2026.07.12.01.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 01:11:15 -0700 (PDT)
Message-ID: <c8c36d99-9c0a-4767-8a4e-a5ad28093530@gmail.com>
Date: Sun, 12 Jul 2026 17:11:13 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/ja_JP: translate submitting-patches.rst
 (sign-off)
To: Akiyoshi Kurita <weibu@redadmin.org>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net
References: <20260711215510.1708416-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260711215510.1708416-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On Sun, 12 Jul 2026 06:55:10 +0900, Akiyoshi Kurita wrote:
> Translate the "Include PATCH in the subject" and "Sign your work -
> the Developer's Certificate of Origin" sections into Japanese.
> 
> Keep the DCO text as a literal block to match commit 999161066dc5
> ("docs: submitting-patches: Fix section structure around DCO").
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> 
> ---
> Changes in v2:
> 
> - Added the Japanese translation of the "Include PATCH in the subject" section.
> - Updated the DCO translation to match the current English text and structure.
> - Kept the DCO statement in a literal block following commit 999161066dc5.

You didn't address my concern expressed in v1 review.
This is what I said:

    What you need to agree in signing off is the English certificate.
    Not the translated one.  So this can confuse people.

    I don't have any good idea.

    Please convince me you can translate the certificate
    without any concern of confusion.

You said in your reply:

    I agree that translating the DCO text itself could be confusing,
    because the sign-off refers to the English certificate, not to a
    translated version.

> 
> 
>  .../ja_JP/process/submitting-patches.rst      | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
[...]

> +作業への署名 - Developer's Certificate of Origin
> +--------------------------------------------------
> +
> +誰が何を行ったのかを追跡しやすくするため、特にパッチが複数階層の
> +メンテナーを経由して最終的にカーネルへ取り込まれる場合に備えて、
> +メールでやり取りされるパッチには sign-off の手続きが導入されています。
> +
> +sign-off は、パッチの説明の末尾に追加する単純な一行です。これは、
> +そのパッチを自分で作成したか、オープンソースのパッチとして提出する
> +権利を持っていることを証明します。以下を証明できる場合、規則は単純です::
> +
> +        Developer's Certificate of Origin 1.1
> +
> +        このプロジェクトへ貢献することにより、私は以下を証明します:
> +
> +        (a) この貢献の全部または一部を私が作成し、ファイルに示された
> +            オープンソースライセンスの下で提出する権利を有していること。
> +            または、
> +
> +        (b) 私の知る限り、この貢献は適切なオープンソースライセンスの
> +            対象となる以前の成果物に基づいており、そのライセンスに従って、
> +            私が全部または一部を変更した成果物を、ファイルに示された
> +            同じオープンソースライセンスの下で提出する権利を有していること。
> +            ただし、別のライセンスで提出することを許可されている場合を除く。
> +            または、
> +
> +        (c) この貢献は、(a)、(b)、または (c) を証明した別の人物から
> +            私へ直接提供されたものであり、私が変更を加えていないこと。
> +
> +        (d) このプロジェクトおよび貢献が公開されること、ならびに私が
> +            提出したすべての個人情報と sign-off を含む貢献の記録が
> +            無期限に保存され、このプロジェクトまたは関連する
> +            オープンソースライセンスに従って再配布される可能性があることを
> +            理解し、同意すること。
> +

This will confuse people, as you have agreed.

So, I think you need to do something more to prevent any confusion.

I guess you have another hurdle to clear.

Text of DCO 1.1 is available at: https://developercertificate.org/

It carries this legal statement:

    Copyright (C) 2004, 2006 The Linux Foundation and its contributors.

    Everyone is permitted to copy and distribute verbatim copies of this
    license document, but changing it is not allowed.

There is no mention of translation, so I can't figure out if translation
is allowed.

To be clear, I don't have sufficient background for reviewing
legal (contract/agreement/certificate/...) text.  So there is a high
chance of me being confused.

Thanks,
Akira

> +上記を証明できる場合は、次のような行を追加します::
> +
> +        Signed-off-by: Random J Developer <random@developer.example.org>
> +
[...]

