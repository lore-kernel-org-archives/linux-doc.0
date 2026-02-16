Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BDA2690C0
	for <linux-doc@vger.kernel.org>; Mon, 16 Feb 2026 11:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239767; cv=none; b=LWO+CYv3KGbVJAykyCVBf9yjXow9uWQPjV7t271mjqWxdyx/46md65cDsrEM7NIP681slTPpT7yo3Y0YLN5BwjURY69LB1suA4qRXbeDmWobSug6GHTzxLLb84AuQQA3BAiV4TDsLQkQBpCaEm1KFot5/CXzrhtJ96OUzogFq24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239767; c=relaxed/simple;
	bh=B5vsZd0jOrQm9Tq0/XcLLhtFU5nd/z0PQV4i6K3kwCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MWzXocxW87pQ5nWjbVlDN2mo2HUgZEE7YFyyzqYCpLbpbSNPHy3EXdKzPV0J7y/2nyQuFOwDvCxCw6RXugcvH8NicBkFGJmJXaJS+bhCWL84SHsVBrWJt9ca9p9p0rxV2cqL2MSzKfTLwu/XZs7Wb/legNC97JJS9KiOqXPrGt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H92Tk+5W; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H92Tk+5W"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8231061d234so2201973b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Feb 2026 03:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771239766; x=1771844566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eFUw9ED0xnwsT+WAIvTLqztDgmm4irwEKt8qY4bn2zQ=;
        b=H92Tk+5W5I2kK3x47SvrBY1uY7IUVnNfU8b88omvkbjh1RazJF6L1CYBOk8D4Szb5M
         5e4J6TKi9BqmYAqXXoQxjvjj/BnX5EFt7bAkFvcV2gESkd+UzxoBVnYBO4U0Bn5B7fPC
         8Dd/hD8U+yh/UyhshVt8luW27OjdkqHOi42VkselwWEuEHQr7fxITX2JeMr668onuwoP
         yg9d8F9alDAgZ81lyPAtDrFWqPa6HLRq/H/zcg7RZFyO/2z6+BVNcOi1bcdGtsSSoUE5
         9sDdMCQLR6yXz9qbC8mUzfQ4rdNMWjhlRpafbQbQu0rqYBRTFtBCzA4TSC1j1vC2mUpB
         pDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239766; x=1771844566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFUw9ED0xnwsT+WAIvTLqztDgmm4irwEKt8qY4bn2zQ=;
        b=OiMmtTvehQvmqfvFUNlc4xR7HzTk1KZnQeBG9EcMRxqrhouECuVrRZGIljMVE6jc3P
         9kCZqpCDWdCFpUbEtvpyr1x2A8APihFHVzHkBi+vl1GQjNGXXbsoZQSCg+dCWe474aeh
         tNKv0FYr59ksROJKJVCkN1wM/Jz7cPyC7q1iDRr5QJY9bvxgmAE1DvbC9yDVGDwzViUY
         8C5fNpysxIiWR1Hy6SEYT/ROUZYVgv+90ghXLROw5RR+jsihkIwWweg+gdGNieh0DR+s
         DDysoqiXpM0s3hp4eomSrzPAvMJ6RFXY0lUYqEG5sM9lY43S/+ohYoG/5XBDH19lFN4x
         IFZg==
X-Gm-Message-State: AOJu0Yx5fFVGJR4SMwQz7BFHKD5kid76rDfgghMML+cIpYLjc3ZsPl0I
	SscSkgvGSFCA1gP1eEKtz8NoXPhS37yBh+oZUv3fiAfuhTToiCJQ0Cta
X-Gm-Gg: AZuq6aJvvwAkXOPF8Pxm4PwEp0jnBPUQX4wxdoAHpb/6GvHTugBKGy6CIM0amfK015+
	fYWyog/VMfLst8pDaorArwZnvc6xAU3eG5EupXdb4M2JJcF+jEV7GHHwSCDoH5vsmKETQNHajAx
	PgJDmCIlV7lGb1v7zpIugQk9/sJ0E1NKR8Hldf/5+NHqzMOZhZYJphFkR+WPLb+PuFhc+NGUekM
	Lisj3XOW6/h/6d3RwxZyp4wWu8OTRw5SElXLzpE4jpo4WbGLcPrUIGZy/6dAk7LwAnvpA3T9XzO
	1U39cCHJRMgPgN6sLo7i8FTf5APBS70AQb8AcUPkS7qiOH1LDV+igbT3ivEG2nQaKRhZ4dW1oR3
	fRZreaLAHo/vxX1Zx2uG+tiZTntJroE9pyFqbwhsHt/BFv0PpQib5stebN8zeqzyNC/jTB9RsJo
	aYqw1txNUG5uft3CpOYZ6eIICkuWr98+WdQq8iwMVslqB/sGkToX9x0ElWcECm6aIESzhQs6kL5
	JR/PdA=
X-Received: by 2002:a05:6a00:1746:b0:7b9:420:cc0f with SMTP id d2e1a72fcca58-824c944be26mr8529755b3a.14.1771239765712;
        Mon, 16 Feb 2026 03:02:45 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6bb34b0sm9716270b3a.60.2026.02.16.03.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:02:45 -0800 (PST)
Message-ID: <74c8d602-91ef-4d22-ace5-006ff710565f@gmail.com>
Date: Mon, 16 Feb 2026 20:02:44 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs: ja_JP: process: translate 'Describe your
 changes'
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net,
 Akira Yokosawa <akiyks@gmail.com>
References: <20260211080218.890115-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260211080218.890115-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kurita-san,

Thank you for your continued efforts.

On Wed, 11 Feb 2026 17:02:18 +0900, Akiyoshi Kurita wrote:
> Translate the "Describe your changes" section in

Didn't you want to say, 'Translate the first half of "Describe your
changes" section' ?

> Documentation/translations/ja_JP/process/submitting-patches.rst.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  .../ja_JP/process/submitting-patches.rst      | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index d61583399ef4..daf02b8983cf 100644
> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -54,3 +54,34 @@ Documentation/devicetree/bindings/submitting-patches.rst を読んでくださ
>  
>  変更内容を説明する
>  ------------------
> +
> +問題を説明してください。あなたのパッチが 1 行のバグ修正であっても、
> +5000 行の新機能であっても、それを行う動機となった根本的な問題が必ずあるはずです。
> +修正すべき価値のある問題が存在し、レビューアが最初の段落以降を読む意味があることを
> +納得させてください。
> +
> +ユーザーから見える影響を説明してください。クラッシュやハング（ロックアップ）は
> +分かりやすいですが、すべてのバグがそこまで露骨とは限りません。たとえコードレビュー中に
> +見つかった問題であっても、ユーザーにどのような影響があり得るかを説明してください。
> +Linux の多くの環境は、上流から特定のパッチだけを取り込む二次的な安定版ツリーや
> +ベンダー／製品固有のツリーのカーネルで動いています。したがって、変更を下流へ
> +適切に流す助けになる情報（発生条件、dmesg の抜粋、クラッシュ内容、性能劣化、
> +レイテンシのスパイク、ハング／ロックアップ等）があれば記載してください。
> +
> +最適化とトレードオフを定量的に示してください。パフォーマンス、メモリ消費量、
> +スタックフットプリント、バイナリサイズの改善を主張する場合は、それを裏付ける数値を
> +記載してください。また、目に見えないコストについても説明してください。最適化は通常、
> +CPU、メモリ、可読性などのコストを伴います。ヒューリスティクスの場合は、異なる
> +ワークロード間のトレードオフも発生します。レビューアがコストとメリットを比較検討できるよう、
> +最適化によって予想されるデメリットについても説明してください。
> +
> +問題が特定できたら、実際にどのような対策を講じているかを技術的に詳しく説明してください。
> +レビューアがコードが意図したとおりに動作しているかを確認できるよう、変更内容を平易な言葉で
> +説明することが重要です。
> +
> +パッチ説明を Linux のソースコード管理システム ``git`` の「コミットログ」としてそのまま
> +取り込める形で書けば、メンテナは助かります。詳細は :ref:`the_canonical_patch_format` を

Do we want a cross-ref to the section of the English doc here?

Probably, it might be better not to use a cross-ref for the moment, but
to put a hint for future work, and convert it into a file-local
cross-reference when its destination is ready.

Also, your translation is a bit wide.  Please wrap at 74 columns
(37 wide-chars) or so.

> +参照してください。
> +
> +1 つのパッチでは 1 つの問題だけを解決してください。説明が長くなり始めたら、パッチを
> +分割すべきサインです。:ref:`split_changes` を参照してください。

Ditto.

Thanks, Akira

> 
> base-commit: a592a36e49372172d7c7551ec19ed18184c935e1
> prerequisite-patch-id: 5569479a56e04681cfd6b22f5de9d850e10c8f5f

