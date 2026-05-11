Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B91303A1E
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491037; cv=none; b=UfyDxs9dESkuKHFQejYkyxlWW73aYg7qhG81HvUDSLSrHNfjQiBNHn6JmW/XnHaEOYUbzFu0+poIUNQ2LlNI4W7pIPvwy+MolH+gw1XJJMcVoUyGEzErUVzZYpEz/2uPZcUa/LcuAzoSbUCcxBCiIz6o/iyhbS2Z1BkY14uXAN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491037; c=relaxed/simple;
	bh=4uUPpHMmdN8CaJt07qwcDE2AFSMt2cH931WsqyfBt10=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lfuYZBi4wTtegQqRSUGc2/nGchETvO+Z/rSYPQdHOzzaG2XHi2gbSchVQ9LhGhXFtf0l28N80uzq6PAs16tS1tieUCh5pde18zh9vQ5Ud0VriMTWBg1F4KM6yVCP6kYcGt4mycU5gA3q9bp7UdSRLyEgi+9T/qqZ9hiQA2NaulM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cC0Z93nv; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cC0Z93nv"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-835399c11e0so1782133b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 02:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778491035; x=1779095835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RckOLoHxLSLwla5kSIKoIM4AN4LynYgmwlyD8oU795Y=;
        b=cC0Z93nvgMJAzabcCAC7QV/xdVp46PFFESu4rb6TmUS7fGTfu+DAuG2CccYUN93F8w
         F04gOJGbw+7oul+BnKSbFx7WXSfeXi/ndDJyfO2paanOORE4uPzXKjCI3mGtw4M8nh1c
         ocGNV5MW7h5zVzTAc6ahhNnGvWiGEPmlh3/+vChwkrH2UN5te0Md7ixc+pKAkzWyqPT1
         jH0Vg6ZGD8sqG6DxC/NX7QEMrJO04jjT9+fdRmqNraPerh9AX0hyjBzDisDcBFFgFzIN
         eCbrK2KmrdifJ+2CoLUlcDKqaPD6i1DMnms2p3xKn14pdcbiE6ZWfRooha4Fs+gw3MAQ
         XORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491035; x=1779095835;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RckOLoHxLSLwla5kSIKoIM4AN4LynYgmwlyD8oU795Y=;
        b=IoAz5CFFgvcjUyQmqemUAD4xJQvMOYEUIw9Bc7P0IzXRAtyY4ce4YeVTf4VqipVnUp
         mCCuoUOfSs8r/ZM+sXFRVA1GVBsPQ/j0Lbx+hnUY71wan1bE46Lf88t9y/J97mlmHrpX
         /IZsJuQS0UvjtZ648mtka0ns3IbZAaGUx/8UVKeOjp/ixCMYlHgq7ly5XuWwKm7hf1UM
         h14ccLASgTprhZSV1M+sfViAkKCKygyCmFm9vhP1BGoXZxdumPhZfNTbu8ENUHtwpJUn
         FCQMV5QENTbf1KVTqJzVrgNNB8CcBCflCESh86AQV0FeQdMczVBpmba2fOlvZiDazRH6
         TaDg==
X-Forwarded-Encrypted: i=1; AFNElJ9rVUcutoS8JfXHlc6H/MAUIwjMy/KNiEYcHKojJEIZNlSX6egTFAZ15zWQae7p6kjhsFMUDjg6P5I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7iW9tAH/JkM8l0SVqLt1k3nF9TumFlgKz/J9Fli2sHAzn2ZRD
	TI+VvwJ3uh+irvmoM3EDgGDYGYoA2D7Qcs6MqxwaTYS5/jGhMSNCNfKt
X-Gm-Gg: Acq92OG3dG2fnyALSkk6KX9/1HdJazJToeCZYgb7XKQVdvOfqWj1wmI1xCaHRZaXfla
	TTvfl1xYLxtCocOZQCtwJmBZgVcga9R7xkQyvGTcGhGJ62fGiYe/HETHyqIRwO/ubA5X+xvxykH
	Yh/wHsdw0e/UjBrVPwr0XK00NXnWC3V8Kz8xkXmGmOGW4g6u7Xqa/9FFP+B1rOvK6fJoJLtT5GG
	uhf1Hg1XzRqwaZ8S6oHhmMlit81H7Zb+VlmjmNsACtxZ7Tv0jDOXmHyypc91Vcgku+L+zPxg6Ly
	xfc/G5hl7i2NwJjtnOu8pUDxUcMy87Pg4YAB7wMOTgUGMcz1X8uO6QnHYx/8gFC6iCy1aD25eN/
	fJrk1/RT+VI1H3kioeARo+P67I1lZroa8yMiL68cGtU7V3d+S5NbadKyFlNKPPCT0+PXkrWdUg7
	UG+PMhZncvh0vt4IDs5if/uJEMqiCJcjk5JjozZ6rgxKyma62FGSltKdfKriGqpxnlFUda
X-Received: by 2002:a05:6a00:2990:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-83a5dc5df18mr23472161b3a.39.1778491035134;
        Mon, 11 May 2026 02:17:15 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659487afsm18923457b3a.18.2026.05.11.02.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:17:14 -0700 (PDT)
Message-ID: <05e194eb-ef8d-4cbd-8d76-85f787018a3e@gmail.com>
Date: Mon, 11 May 2026 18:17:15 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v1] docs/ja_JP: translate more of submitting-patches.rst
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20260504182425.1402425-1-weibu@redadmin.org>
Content-Language: en-US
In-Reply-To: <20260504182425.1402425-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On Tue,  5 May 2026 03:24:25 +0900, Akiyoshi Kurita wrote:
> Translate the "No MIME, no links, no compression, no attachments.
> Just plain text" and "Respond to review comments" sections in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
> 
> Keep the wording close to the English text and wrap lines to match
> the style used in the surrounding Japanese translation.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---

Summary phrase of this patch is identical to your earlier patch,
queued as 61e4155c81d1 ("docs/ja_JP: translate more of
submitting-patches.rst").

Not a hard rule, but it is a good practice to pick a summary phrase
different from those of recent other patches, to make the patch
at hand look obviously different.

For example,

  "docs/ja_JP: translate more of submitting-patches.rst (no-mime ...)"

should be good enough.

>  .../ja_JP/process/submitting-patches.rst      | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index 928e38a8d34d..d7e04c09f951 100644
> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -292,3 +292,61 @@ MAINTAINERS ファイルに記載されている MAN-PAGES メンテナに
>  man-pages パッチ、少なくとも変更の通知を送って、情報が
>  マニュアルページに反映されるようにしてください。ユーザー空間 API の
>  変更は、linux-api@vger.kernel.org にも Cc してください。
> +
> +MIME、リンク、圧縮、添付ファイルは使わない。プレーンテキストだけ
> +----------------------------------------------------------------------

This doesn't sound like a section title to me.  Please retry ...

> +
> +Linus や他のカーネル開発者は、あなたが投稿する変更を読み、
> +コメントできる必要があります。カーネル開発者が標準的な
> +メールツールを使ってあなたの変更を「引用」し、コードの特定の
> +箇所についてコメントできることが重要です。
> +
> +このため、すべてのパッチはメール本文中に ``inline`` で投稿すべきです。
> +これを行う最も簡単な方法は ``git send-email`` を使うことであり、
> +強く推奨されます。``git send-email`` の対話型チュートリアルは
> +https://git-send-email.io で利用できます。
> +
> +``git send-email`` を使わないことを選ぶ場合:
> +
> +.. warning::
> +
> +  パッチをコピー＆ペーストする場合は、エディタの word-wrap によって
> +  パッチが壊れないよう注意してください。
> +
> +圧縮の有無にかかわらず、パッチを MIME 添付ファイルとして添付しては
> +いけません。多くの一般的なメールアプリケーションは、MIME 添付
> +ファイルを常にプレーンテキストとして送信するとは限らず、あなたの
> +コードにコメントできなくなります。MIME 添付ファイルは Linus が
> +処理するのにも少し余分な時間がかかるため、MIME 添付された変更が
> +受け入れられる可能性を下げます。
> +
> +例外:  メーラがパッチを壊してしまう場合は、誰かから MIME を使って
> +再送するよう求められることがあります。
> +
> +パッチを変更せずに送信するようメールクライアントを設定するための
> +ヒントについては、Documentation/process/email-clients.rst を参照してください。
> +
> +
> +レビューコメントに返答する
> +--------------------------
> +
> +あなたのパッチには、ほぼ確実に、パッチを改善する方法について
> +レビューアからコメントが付きます。それは、あなたのメールへの返信という
> +形で届きます。それらのコメントには必ず返答してください。レビューアを
> +無視することは、こちらも無視されるためのよい方法です。コメントに
> +答えるには、単にそのメールへ返信すれば構いません。コード変更に
> +つながらないレビューコメントや質問であっても、次のレビューアが状況を
> +よりよく理解できるように、ほぼ確実にコメントまたは changelog エントリに
> +反映すべきです。
> +
> +どのような変更を行うのかをレビューアに必ず伝え、時間を割いてくれた
> +ことに感謝してください。コードレビューは疲れる、時間のかかる作業であり、
> +レビューアが不機嫌になることもあります。そのような場合であっても、
> +丁寧に返答し、指摘された問題に対応してください。次の版を送るときは、
> +cover letter または個々のパッチに ``patch changelog`` を追加し、前回の
> +投稿との差分を説明してください（:ref:`the_canonical_patch_format` を
> +参照してください）。あなたのパッチにコメントした人には、パッチの Cc
> +リストに追加して、新しい版を知らせてください。

Instead of making a cross-ref to the English section, you can do the
same as is done in the earlier part of this document:

   詳細は原文の該当節 ("The canonical patch format") を参照してください。

   .. TODO: Convert to file-local ...

> +
> +メールクライアントとメーリングリストでの作法についての推奨事項は、
> +Documentation/process/email-clients.rst を参照してください。

I will take care of other minor nits later during v7.2 cycle.

Thanks,
Akira
