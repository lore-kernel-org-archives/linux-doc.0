Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586E62C21F0
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 11:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993903; cv=none; b=tjjPpobQJtkmvB0hhNIgF0qXm9NRDa9hs4QITt3Tv2uuS0iWz9zgD5bceojpAGEUsRDwdN9FmJ7JT6Ung4MsMH07Gy7aAYcL0ioeWjbq/rbB0rp+qIylAbRhlxtbcU786iSCfq4fe1Rbx/JMF5nwFTDTUbvsCZq1ACHxoCeY9Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993903; c=relaxed/simple;
	bh=xDWCKqDxbSpZthDIAaDWgOZZk3UQSm4auL5CMvIltrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkKFRnF9H93yTSNLvxb2PM919ZN5+YcODXEFgZ6Bz2um7Xz7QG5EbdEnx+IuUPAlwHPToX+xrBQVfZZXKVXraRz1QTQJZg1HTdA4wSeIaH7go4NvbMn9AZZ64xRpLN0cbufLyOcJ6bnH6i6ACjcCO5T5c48Fn6qTE0nQ5gzwClE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TG5pzouc; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TG5pzouc"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a78e381fc1so5217635ad.3
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 03:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768993902; x=1769598702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AMeYXnRTFmyBtJzpIXnt0H2lPFQz7kix6Fg9q6tLMIE=;
        b=TG5pzouclv55OHwLFDlJZ0EH1uwZr6KLNP+jL2TXckO6mcUXYlL+78wyXM5HiKIKIf
         oNpMS6l3XnEWbC7Djyq5BGDSxhLjH12C8U+maQJ8HckH1zCFe0VURwGqQ23+SN/4OylF
         bXRWZ2aqAdUJVq1ntVnr7Yaxv9g96l/2BqVOAvudlq6VFfXnbT8y2/omxrZTcQ4vaqzC
         54OzJEariBrRO2RnZ1AMKWDPcd0b75hOKqEJWs2oaJQkFQ3eMMSpJmtmjLQTIpHHPCKm
         EN7InpM62BWmomFlhBg9gtrjDBHHn5T2gVe1maSqt441LG32jk17rqRUwKJH6dF6KOtV
         k5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768993902; x=1769598702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMeYXnRTFmyBtJzpIXnt0H2lPFQz7kix6Fg9q6tLMIE=;
        b=xTvndEUdBEj2wE0kiI8dA6kHP17kSqHsTvw36Hi5lgGxX9ajUdewSi02NvFYDzYbnI
         YgRGkXZhDdg852iF6YoDxU+z1OQqIK6vGASSunmhEPAliqoKkvX2kf8oxNV7rXsRWNx7
         fdBL9W9HTSir5O+nND2+4u0LJBQHHVF9uA72ljtKpf/nWVXVx932iJsXw/cvcgJpcmO5
         Id94gxM2PCK6hmvpdvTHqNkDU37FoJg8yP2f/sTdZMiA2ROxnaJIM5A7rkRjGw9PruIl
         /4P7zrWDfb2F0lNYmvu4mZWiypuFbRZO3zPxG014s8RdxSPL4Crue8VW/A6Lyb6LKFqR
         aWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQXk/YDuvjl1fX3GHPMnJIHtrm9paR1u3rzOFuAhVEQBjHGft/tRT4UTI26d0eDfdu+vEQdXNb5fA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNKmL9RwQD1YUDYpv69Cv0pyehXqc/KkVsvTdWkXichmQuw/9g
	R+2lcofQ2aCOKdeuselzeAE+BAtaOkczqbTO4GS3HGQvA4vefzSCzNtY0QCqnQ==
X-Gm-Gg: AZuq6aIcATh1VK3XX9kS/bzD10HiMthLJOyFR6I9bp3QStdGDzss1RhjIT9HBJTyFC6
	bSImE6nz6xC5nq+ZYOUUZYs8gdJ/FgzPL9t7T8VDA9mWE+niwCX/AOdQfWNcSplCUJZdqZUidqK
	yss0H4hAHr9Gbn/TogHtK2DVrTQg2FHutvTssDk/1PmxLdvPghvYv3WMQFJWyPUWz9Fp7fa8gFG
	Q/ksNKjnKk3tiEpsDw4qqjazZgDiCsBOJR2LrnKIiThLcbThxrhUY2+FEnq+IYybU2zqr4ScF+q
	JvKsCd4/djXzPndtzy6iKFC1bH/Vxguqr/ynrVPgSAtQsAltkFVy/p+kWBUTvkBUWuwxhzcvWpY
	dVLayQGCtV48+GNzYcoU6VNTG/Nn7nVDTNw1no8uLc0CwuTUPTWT2Sj7EqGCjRRu1RTX+PAK53M
	nnfcwUgicvk6SHJuU9W2HuByOwlGsnVkCwvRiPLvMfIDZlOVhKJcK+KFAT
X-Received: by 2002:a17:902:f544:b0:2a0:ba6d:d0ff with SMTP id d9443c01a7336-2a717533f7fmr158237165ad.16.1768993901487;
        Wed, 21 Jan 2026 03:11:41 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dedacsm152589715ad.58.2026.01.21.03.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:11:41 -0800 (PST)
Message-ID: <ef4c1750-e579-4727-9382-14b55934dd43@gmail.com>
Date: Wed, 21 Jan 2026 20:11:41 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs: ja_JP: Start translation of submitting-patches
To: Akiyoshi Kurita <weibu@redadmin.org>, corbet@lwn.net
Cc: shibata@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260120154543.2063635-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260120154543.2063635-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 21 Jan 2026 00:45:43 +0900, Akiyoshi Kurita wrote:
> Start a new Japanese translation of
> Documentation/process/submitting-patches.rst.
> 
> Instead of moving the outdated 2011
> translation (SubmittingPatches), we are starting a fresh translation of
> the current English document.
> 
> This patch adds the initial file structure, the warning about the
> document being under construction, and the translation of the
> introduction section.
> 
> The translation work will be done incrementally.
> 
> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
> Link: https://lore.kernel.org/298d3a9c-41c1-4cbd-b4ab-d3009df9388c@gmail.com/
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Jon, I think this is ready for merge.

Kurita-san, I'm looking forward to seeing your subsequent works.

Thanks, Akira

> ---
>  Documentation/translations/ja_JP/index.rst    |  1 +
>  .../ja_JP/process/submitting-patches.rst      | 38 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 Documentation/translations/ja_JP/process/submitting-patches.rst
> 
> diff --git a/Documentation/translations/ja_JP/index.rst b/Documentation/translations/ja_JP/index.rst
> index 4159b417bfdd..5d47d588e368 100644
> --- a/Documentation/translations/ja_JP/index.rst
> +++ b/Documentation/translations/ja_JP/index.rst
> @@ -13,6 +13,7 @@
>  
>     disclaimer-ja_JP
>     process/howto
> +   process/submitting-patches
>     process/submit-checklist
>  
>  .. raw:: latex
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> new file mode 100644
> index 000000000000..2ff887c86b2a
> --- /dev/null
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -0,0 +1,38 @@
> +.. _jp_process_submitting_patches:
> +
> +パッチの投稿: カーネルにコードを入れるための必須ガイド
> +======================================================
> +
> +.. note::
> +
> +   このドキュメントは :ref:`Documentation/process/submitting-patches.rst <submittingpatches>` の日本語訳です。
> +
> +   免責事項: :ref:`translations_ja_JP_disclaimer`
> +
> +.. warning::
> +
> +   **UNDER CONSTRUCTION!!**
> +
> +   この文書は翻訳更新の作業中です。最新の内容は原文を参照してください。
> +
> +Linux カーネルへ変更を投稿したい個人や企業にとって、もし「仕組み」に
> +慣れていなければ、そのプロセスは時に気後れするものでしょう。
> +このテキストは、あなたの変更が受け入れられる可能性を大きく高めるための
> +提案を集めたものです。
> +
> +この文書には、比較的簡潔な形式で多数の提案が含まれています。
> +カーネル開発プロセスの仕組みに関する詳細は
> +Documentation/process/development-process.rst を参照してください。
> +また、コードを投稿する前に確認すべき項目の一覧として
> +Documentation/process/submit-checklist.rst を読んでください。
> +デバイスツリーバインディングのパッチについては、
> +Documentation/devicetree/bindings/submitting-patches.rst を読んでください。
> +
> +この文書は、パッチ作成に ``git`` を使う前提で書かれています。
> +もし ``git`` に不慣れであれば、使い方を学ぶことを強く勧めます。
> +それにより、カーネル開発者として、また一般的にも、あなたの作業は
> +ずっと楽になるでしょう。
> +
> +いくつかのサブシステムやメンテナツリーには、各々のワークフローや
> +期待事項に関する追加情報があります。次を参照してください:
> +:ref:`Documentation/process/maintainer-handbooks.rst <maintainer_handbooks_main>`.

