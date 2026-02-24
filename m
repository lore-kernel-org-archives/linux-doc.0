Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBB527EFEE
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 12:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935180; cv=none; b=mwb5uppXbdyRTsMJnWb91BTmQCaznM6/u+W9xx76Dx/XKcTZrEdY/5DGHxz/aQVYRWt51zBRtHeLhaKiH8kHmxzt0d2SsgzsG2uTTMpzaKyHKZorT+IdCkoPPyHG9qbuud7anmi5jZoZYT/f29b6rseK+0pwGmoF8J6npCCi2Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935180; c=relaxed/simple;
	bh=ZasE8W6VqyAfmICcALZAm8xHcWhMHUu2pYqew3r/oCs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ecup45fDtaqiUTfZsV3H9+PgmuQA/v5yb+SAON6ma8h7LjVQLPCnO6f8MRBZlpFdLZ8RTHAIdPhg5uYNwzTxPZL4nSIg7/VBLTeKEOVnrCUCmA3WUjc1vaAuWDkMuvkWYdxwwFpgsj1dW5PHE8JfBwZoG9//FiBMUHiOxy3D9vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2SHoKsE; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2SHoKsE"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ada721eda1so2816315ad.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 04:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771935179; x=1772539979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QRtTDlW8EDc/JgtQfFcL8EPqTRSDBksj3yBYWBoXwE4=;
        b=l2SHoKsEbG9tomby5S77FtGfCWVOu5Q9vvHU2visFmvE7Q/HFbVKgXSJENdKTy1mkd
         A0q2DzWnOPX5GwB9SiXAREmRtpaMTjrI3rlbGGPqBVuhNCbWf9+XxPygSaKEFQSlTk9e
         64sNS+zmiQTMBjLvxrw5V1+lVp0BkFZndEoRfQMh9SrDT++iEU3otesuW5MZEIKHlNIk
         gnPmi+Qx2sCwOoT79BSaMm1SvEhJUc7FjhLwS6Rf9pAvGYsB2STTFNWS/6X7nTxaiDUn
         o/8ugSrUCx4F+VsBVIP9Gb9gI+j3v2JBEb/bR37RGiOhFnJbHXx9gsBCTNuipAGWvvp0
         s70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771935179; x=1772539979;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRtTDlW8EDc/JgtQfFcL8EPqTRSDBksj3yBYWBoXwE4=;
        b=A62KErSH5lw09XNAtF14uTx8ImUWJCPmO5YvRSmwUmvMUiMURKXXJMRBjA3EgSBkkn
         F3jJN3Y5PGRCwsU7u19iJCPTUNpzwAJajNl9wsxdCBdk7sD+RQvXVjU+igGCGLC1gT1F
         iEGqBYRxm5+LiHvmeOnRFm4u2C8kgiaMtQ/hDAJ6oMI3w3i5QnG3FfSFOmPmN58MKZMU
         2vI4rigrGfT1OsRztSeK9Re+OB6BtpeL7naMG+C16WYKe0pMgfbXQCH8L6hXo1mqQ+/t
         NMWX9gPr75RE4EJW4iEDIGnqL1p6IjagYljoHpb02MdmTwADgyvENgWCTEhfKAn3w829
         FvUg==
X-Forwarded-Encrypted: i=1; AJvYcCUpAFoSst9iDVNXheqTInX3ghTbr1L+4p96xKmWeA37m/j/l6bnnwSNKEOzQT/nm7Hp+opGiYlXQRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTkENENQ2Vk9zpb8525PKZTaW5IW4nrLVI2ISuCltWwlP5gRhd
	CTvhyyGIhDZLx0x8olnsaYb6X3In08HLvvE+c65uMJj8HiIxXDGPvkgAn+ODpg==
X-Gm-Gg: ATEYQzwVQRFmfqcaCiEzS+ltBZt8vH2Kg8HJSSCFFas2YlfONIjGgsZv0q8sJckvc5f
	/uUEUk4FIZQOHXzcdmv1oNgC3dUbnOmhXET80PWprd3uzCPOl7fD2X7nxI83XK/1OqOvZFLfjtV
	LkfyUC+DyV47BZb8/LkbiakscjXqWPd+RdIfHOfbQbWZnQEEChXZHJfg5fLNZME5gN89yvDB8hk
	qJaPQHy2Mlm94mRWzg1hdvH8QBox7IXA34tG5GUpDOVK/pQ8ekqkg/I9b6TE8XyquBAh86tlxCk
	a6wnqNF1vvoeKSeIMhfPCiit+vXX/tUZ6esRGA3Ui/vhhSjv7YfQzbOe/Piy5yTgvV68fZvtHqF
	3icJvEKbPi4YtDCIK7hWAEH1kBaSGXxM2uYLN6KYdBw2zWnUwuAMUZWp3JTernqGi0snaaIR0EA
	WaXNoG34Uzu2pBCDSbI2e7Lqk1B1NPxy3z8B3Jm2SF0tnFWriKfQZmsuC5ZVXAOEV7fAIN
X-Received: by 2002:a17:903:2343:b0:2ad:b959:3de3 with SMTP id d9443c01a7336-2adb9594076mr2778625ad.19.1771935178479;
        Tue, 24 Feb 2026 04:12:58 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e2a7sm100875775ad.46.2026.02.24.04.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 04:12:58 -0800 (PST)
Message-ID: <195f2459-cfdd-4909-bafd-9416180703ac@gmail.com>
Date: Tue, 24 Feb 2026 21:12:57 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v2] docs: ja_JP: process: translate first half of
 'Describe your changes'
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20260221144715.2934942-1-weibu@redadmin.org>
Content-Language: en-US
In-Reply-To: <20260221144715.2934942-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On Sat, 21 Feb 2026 23:47:15 +0900, Akiyoshi Kurita wrote:
> Translate the first half of the "Describe your changes" section in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
> 
> Wrap lines at around 74 columns, and avoid cross-references for now by
> adding TODO notes to convert them to file-local references when the
> destinations are translated.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  .../ja_JP/process/submitting-patches.rst      | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index d61583399ef4..48188c772d47 100644
> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -54,3 +54,44 @@ Documentation/devicetree/bindings/submitting-patches.rst を読んでくださ
>  
>  変更内容を説明する

So, you are using "説明する" for "describe" throughout this patch.

I have trouble with the choice, because I tend to reverse translate
it into "explain" in my mind.  "To explain" is usually more involved than
"to describe".

You might have been affected by the outdated ja_JP/SubmittingPatches, but
please have a look at ja_JP/process/howto.rst and see how many "説明" are
there.

There, Japanese terms for "describe" include: "書き下す", "書かれている",
"記述する/される", "述べる", "言う", and few instances of "説明する".

"説明する" is used when what is described is "detailed" or for English word
of "explain".

I'd like you to follow the distinction in howto.rst.

>
> +
> +問題を説明してください。あなたのパッチが 1 行のバグ修正であっても、
> +5000 行の新機能であっても、それを行う動機となった根本的な問題が
> +必ずあるはずです。修正すべき価値のある問題が存在し、レビューアが
> +最初の段落以降を読む意味があることを納得させてください。

It looks like you are wrapping at 30 wide-chars, rather than 37 or so. 
Again, you might have been affected by SubmittingPatches ...

> +
> +ユーザーから見える影響を説明してください。クラッシュやハング
> +（ロックアップ）は分かりやすいですが、すべてのバグがそこまで露骨
> +とは限りません。たとえコードレビュー中に見つかった問題であっても、
> +ユーザーにどのような影響があり得るかを説明してください。
> +Linux の多くの環境は、上流から特定のパッチだけを取り込む二次的な
> +安定版ツリーや、ベンダー／製品固有のツリーのカーネルで動いています。
> +したがって、変更を下流へ適切に流す助けになる情報（発生条件、dmesg
> +の抜粋、クラッシュ内容、性能劣化、レイテンシのスパイク、
> +ハング／ロックアップ等）があれば記載してください。
> +
> +最適化とトレードオフを定量的に示してください。パフォーマンス、
> +メモリ消費量、スタックフットプリント、バイナリサイズの改善を主張
> +する場合は、それを裏付ける数値を記載してください。また、目に見えない
> +コストについても説明してください。

>                                 最適化は通常、CPU、メモリ、
> +可読性などのコストを伴います。ヒューリスティクスの場合は、異なる
> +ワークロード間のトレードオフも発生します。

These two sentences correspond to:

|      Optimizations usually aren't free but trade-offs between CPU,
| memory, and readability; or, when it comes to heuristics, between
| different workloads.

Your translation sounds to me slightly different from the original.
Could you rework?  Hint: "trade-offs" are in both sides of ";".

I think this is close to be merged.  Looking forward to seeing a v3.

Thanks, Akira

>                                        レビューアがコストと
> +メリットを比較検討できるよう、最適化によって予想されるデメリットに
> +ついても説明してください。
> +
> +問題が特定できたら、実際にどのような対策を講じているかを技術的に
> +詳しく説明してください。レビューアがコードが意図したとおりに動作
> +しているかを確認できるよう、変更内容を平易な言葉で説明することが
> +重要です。
> +
> +パッチ説明を Linux のソースコード管理システム ``git`` の
> +「コミットログ」としてそのまま取り込める形で書けば、メンテナは
> +助かります。詳細は原文の該当節を参照してください。
> +
> +.. TODO: Convert to file-local cross-reference when the destination is translated.
> +
> +1 つのパッチでは 1 つの問題だけを解決してください。説明が長くなり
> +始めたら、パッチを分割すべきサインです。詳細は原文の該当節を参照
> +してください。
> +
> +.. TODO: Convert to file-local cross-reference when the destination is translated.
