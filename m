Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70D83ACF04
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768896545; cv=none; b=XEWY3isqYOuwOTrSyVncvkPhv1F1m2etNkF1H+vepaMFiimoWvFaOU2bFo5CKQ0bE4dQljDAEw4e4kAHoFX2AUt/cV2oIdcDa54KaOMaKKsTeDNGZA+3Rc0W06IJilmQL5Hk1hY3h5a7rePd2yousCQHoZdFrSOBiwKTEgWQM6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768896545; c=relaxed/simple;
	bh=Zxd8mG0NX5WYJYN9HWYBkcne1gLnWEQXCm9DIjh9u20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s85dGUUkxW/MdbHIB7/3vCKoNWftYYZn2/97Za8zGuTgWBTWsBsYCdc7kuNzQ1NiXK5SD/zmWDeg7EB25RawTXXB2MUO50jay1cXCNicnYGTFYafrw4YCvbKH/MF6JNRhBhyTIxUVnap+X6YmY9aJupiLxoQuOUjlaPiPG2kBYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJ0gYoHs; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJ0gYoHs"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c525de78ebaso1996884a12.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 00:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768896543; x=1769501343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4TEo3bsWD+vb7VSy273lkNIAM8WHwG088w75CeywbQg=;
        b=cJ0gYoHsulGQQKqAd9POonYP2MS61tmEb3enuJrquUW96AvChOmy4ifkY8lajZmkyg
         02U2qhz/exQslG/B0aFCRftaWx7K6ykSLuHJPYSb25/7YPQC4EUGmcp6onO16Aiefyjx
         Hg1zNUqUcenNfTWEOmk7D1Y52VpqlI3lBDaPw7HbqOuatggHZkzvn/ar+QZ+IaJgUheq
         2jRtGZzfbtoD6p30HeKNgpoTkmk+tGfYpcRIGGIc4uJxhVRCa7QWQRjHN1BSbeRDVJ3Y
         4NsdBjRUwToNy8ltG6SG+xMrODAqWNXu3HXOqcNy7DyHxcHh+OscYlnR8ANMRBa4Bvac
         jKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768896543; x=1769501343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TEo3bsWD+vb7VSy273lkNIAM8WHwG088w75CeywbQg=;
        b=sIqvruGroYmS1EUmKLzv4CB+uIk6jVASAw2hGIwVsWR4RnEzKTkes0gIvQ+lSamdCE
         +3seeWqLVYwIz2VfTQOVHgOPW7EG5OVuPEOGbvtIOh7wfEtXO2nXwF6fs4YvT5csjJ/0
         kVuREpaOZR8TejPw3m98HuyHTiIzK1sD76OtIdZR+bL5EYDzcH0UtXhwMyzOqqjcDjNa
         IrnVLgiKdUWsKMqaeHjRyKXAmYvsNAbKPfcf8VVe3O77fSJX99H8mLC44LKZOXKpNiE9
         yudEDFWaX7sMMPrYAZD9ApAW2r3Wgz5edoa18mG+G3VupX6zmnEmHqSF/cQJrlbglcOE
         Y02A==
X-Forwarded-Encrypted: i=1; AJvYcCXNRbBDnBZFTBA24isfyT+iN0zJo0MEUxYg5lm/KZThoENnqUdC3svsREB4tDgYmL0daSZVMkCV3xY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIHHaVpdWgnlR77wp0Jo3TLZjs2oCvFJT4ge70LG63wLNTaKXs
	gfK0YsF48zdScLkKCSn/Ry7vRZn1IQum8cYmKOgFdWlrsvkNpZU2bvIT
X-Gm-Gg: AZuq6aJCDCJDveYZXdvT9Peks/IZYc89rsdAPHAdcdbKxUlylhLbVc07ew7grnO8c8X
	CdRIH0D1djh+3jxWNh9ZeRAfa+VjoPI1QZD1NpRmo0f6FOA+rTfNAOvriB4lcyaBjZWRUrAIliJ
	6dL4D0dwwroWf5M1NzXnHLmWgeCDlAe1TVQc3X9D5ehnt2qrZdVR0tFCNnlpbPacHFM1xV7+OzY
	D8fqlBvt7KunXUxcOFW3rMSBEGypnAV99D7cp6XZffDpukNX1IYbrEH+PaduuEFLS8/pQ6ez0kY
	aL6VyEY7/mQq/NcHAFchUpVKeAew1QR3ndwrJgQ6M1hikRqWQ+ZRskKk7YZekFyoar/EuNkNu34
	zhMf5fMPqJgHELK93+61ngVQZkpXme9mg+hiFRVKi2ZcfGXX7DLGy84bu45damRrPcYDkE4RuyD
	jYFXKJp5WLbASMKpVaByoMlIRxEUsrPA0RIX+ISdDL3c5CYoStGssJfVBo
X-Received: by 2002:a17:90b:2b83:b0:340:ad5e:cd with SMTP id 98e67ed59e1d1-352c3e18e61mr769351a91.5.1768896542959;
        Tue, 20 Jan 2026 00:09:02 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677ca9acsm13910803a91.1.2026.01.20.00.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 00:09:02 -0800 (PST)
Message-ID: <6645246a-571a-4768-98e7-775e84520b2c@gmail.com>
Date: Tue, 20 Jan 2026 17:08:59 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: ja_JP: Start translation of submitting-patches
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: shibata@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net
References: <20260118032400.863320-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260118032400.863320-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On Sun, 18 Jan 2026 12:24:00 +0900, Akiyoshi Kurita wrote:
> Start a new Japanese translation of
> Documentation/process/submitting-patches.rst.
> 
> As suggested by Akira Yokosawa, instead of moving the outdated 2011
> translation (SubmittingPatches),

I'd just say:

    Instead of moving the outdated 2011 ...

, as my involvement is covered by the Suggested-by: tag below.

>                               we are starting a fresh translation of
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
> ---
>  Documentation/translations/ja_JP/index.rst    |  1 +
>  .../ja_JP/process/submitting-patches.rst      | 39 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
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
> index 000000000000..5ab19f2ef280
> --- /dev/null
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -0,0 +1,39 @@
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

So far, looks good.

> +

That said, depending on the setting of git's hooks, this final empty line
would cause a warning from "git am":

    .git/rebase-apply/patch:63: new blank line at EOF.
    +
    warning: 1 line adds whitespace errors.

, which should better be avoided.

If you'd like to have the check enabled, please have a look at:

   .git/hooks/pre-commit.sample

(Note: This needs be done under each Git repo.)

Finally, I'm not sure if Jon would like to merge this WIP translation
work in this early stage.
Do you have some rough timelines for this effort?

Thanks, Akira

