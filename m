Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BC3292918
	for <linux-doc@vger.kernel.org>; Fri, 26 Dec 2025 11:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766748353; cv=none; b=q+TXvl4vx+EX+eyx/LpyTMnR3FtKta4sgsFntlcHdqTP7G1QVzPEX/tno/oCGKc+kx4BJ7xNwJFzSATrKeveQ6m9QH8pbzBjKJxo/v/NLUXWhl0jJLAgNNA6tgxZzAD6GeCEO6jcMHGJTDxbVMpgW7Y3FPIrJ57lJfjY6axMFig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766748353; c=relaxed/simple;
	bh=c5m8c3rhD4NrMnCzwcAnRxgDodn+tBiqCG0d0rcb7H0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PBGi7oV+GPFJE9WWSikdH+NPjzk+48o7WSid4Qj0+Jny0ux2c1ndes7xvQmC3FZoreqBkqV+6Qerd78mmT6vCZTa2BwS6AZqJmrY8wqkynquBOuwIrh8+6ZBsVfGpuUzbxwVSd0vlpyK/WU1fn7w0Zo90iMdwO2zpEKOfgB/BYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xdkyi0Ar; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xdkyi0Ar"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so6221104b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 26 Dec 2025 03:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766748350; x=1767353150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rG3yfzGOWClzunz0E65P5GWckin1wsduVWf5JfNQxXI=;
        b=Xdkyi0ArSNrPlTd5KGLtoJPAQR9Y1+0fJEM98xk16CY/cQaUpLya33Tjdch//QXsZ4
         GVSSG+Rm1wTBakiTNJKqGd9bIPjsR9J2DP1njhdNa91ElrRd/9rRfNW/6RzP14FZVcul
         bpoJ4swMlRTK1SEJ/Km1KauRJCh645pJl+TbW6R94q2EkNpHpv8yMP7AP8x+ENRvHY8u
         6SBWhedoOkPtl1Ps0X3R3PIoq9WPnYIuNjoF8Nremp/E+P5iwQa/P/JsqKQzoppRTGMC
         yQZyDSpCnYbiLPsmp/P56GyPyIkerKj6PgU+tX3s7JeXz3Qz/O7e8Khpa3kIzN11jea0
         sLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766748350; x=1767353150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rG3yfzGOWClzunz0E65P5GWckin1wsduVWf5JfNQxXI=;
        b=xAUULjKirPX6HWrFNNVCOwthIkJwfEXF4m99SfoRn+5UXfvLrCopMXjx1UrMn6vgpT
         hEycDcwKt185M/vqcNI8olfkVcQt2L3MvuNNB0uFuc8jA8sUrCgKdGq61QuW/zC3l3Nl
         Rj28dOH8CET5l/1cBruPXiBUcVTd68FRKg0+jrgHT0bg801aaZf+YO/2APrwaZdb+rya
         tS5enx2h2b7qoGqfP9r/W6cTjNw/qLeriad7Jfff8WCfUDNRnDl99mhKRXUnqNiC4Mhc
         gb2rkVeshRJNP6Ohd3Az8daUuXSwuuc4FGheVpHIj7a/V2AiGgHnKZBtYb4DDfh4E3If
         /y1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvhtoXIyhpRKG6CCM1vIBUUmU6PTCHNVSC+CWNcQubpObIOguHWRu/JW82j4X6mhI4YpcSxPLrT8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YylCnXUSAcwX1MjbMN8EzLpF/ZoegXxJXRguYPHztO3mzawy5ad
	YprV50VZ30vNanYZetb+OZbgpfqZbXioh1hjTrrMqlHfpyxQAkRFcQ50kF7MNw==
X-Gm-Gg: AY/fxX7DlqRtrNss9grfvB5LTbNBuSxpGpEaWDLdCm/NDSmzK/Wo/XxU1cw96Axbb8j
	voffXrlfPkWh3aYcomEOl+N4cLY1C8gCCGeOzDf2D98W2SNoYk+C0xgc0or/89Ev2fRBW5W5QLP
	Q1kO/EEoX8wx3VHDYDgsJ3yXHeeGbl+0o4YaM8bAeRGp4CXWFynC3rID1BRAUJGk8X3FwTdL0ly
	ncPA8m1kertreB5rqmDii0yVTyjbnaKOZkXiNsXHL9mq8HQ6RNmWbf9HTlUAc9fDqgGlGcPLpL0
	wTk4QYJEdlcUrfaZOG0XuFah4z2S4Q8+c4MdRllKnqDEYyibPFtCumAzl0m8bly5L8Tn2L+Yq4g
	Kt0fXjDhJdbYByeP+xVzaLmjKWgCtcQzREsXrEvkE2swMfu4NVz1z/gKFxscbJslRS3PwmEs/7T
	xMObNfftSilljy7ZrV57A8I8SAYK+BaujknpkEUgS+rKigR3SD4iFyvoeCAzDPa00S7yk=
X-Google-Smtp-Source: AGHT+IFvxUUIVtl/opokiIhs1V713buvrzbKH2dsA+g5PcBxYNWGDI8GIA9K4X3Uu0JLeU6wXx9bYQ==
X-Received: by 2002:a05:6a00:e87:b0:7b2:2d85:ae59 with SMTP id d2e1a72fcca58-7ff64211602mr19775642b3a.11.1766748350236;
        Fri, 26 Dec 2025 03:25:50 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7af29dcfsm21917626b3a.17.2025.12.26.03.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 03:25:49 -0800 (PST)
Message-ID: <6c156080-04ac-48be-b0ae-5b784883188b@gmail.com>
Date: Fri, 26 Dec 2025 20:25:47 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ja_JP: Start translation of submitting-patches
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: shibata@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net
References: <20251222093334.2402526-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20251222093334.2402526-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kurita-san,

On Mon, 22 Dec 2025 18:33:34 +0900, Akiyoshi Kurita wrote:
> Start a new Japanese translation of Documentation/process/submitting-patches.rst.
> 
> As suggested by Akira Yokosawa, instead of moving the outdated 2011 translation
> (SubmittingPatches), we are starting a fresh translation of the current
> English document.
> 
> This patch adds the initial file structure, the warning about the document
> being under construction, and the translation of the introduction section.

English version of submitting-patches.rst says:

  - The body of the explanation, line wrapped at 75 columns, which will
    be copied to the permanent changelog to describe this patch.

, to which your changelog fails to comply ...

You need to prove yourself as a promising translator of the doc by
abiding the guidelines described in it as much as possible.
Please do strict self-reviews before submitting a respin.

Further comments follow.

> 
> The translation work will be done incrementally.
> 

Instead of calling out my full name above, you can use a Suggested-by tag:

Suggested-by: Akira Yokosawa <akiyks@gmail.com>
Link: https://lore.kernel.org/298d3a9c-41c1-4cbd-b4ab-d3009df9388c@gmail.com/

This is also mentioned in the English doc.

> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  Documentation/translations/ja_JP/index.rst    |  1 +
>  .../ja_JP/process/submitting-patches.rst      | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
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
> index 000000000000..1ef10ee7cbf6
> --- /dev/null
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -0,0 +1,32 @@
> +.. _jp_process_submitting_patches:
> +
> +パッチの投稿: カーネルにコードを入れるための必須ガイド
> +======================================================
> +
> +.. note::
> +
> +   このドキュメントは :ref:`Documentation/process/submitting-patches.rst <submittingpatches>` の日本語訳です。
> +
> +   翻訳に関するご意見、誤植の指摘などは、Linuxカーネルドキュメント日本語翻訳プロジェクト
> +   <https://linux-kernel-docs-jp.osdn.jp/> へ連絡してください。

Hmm, I have no idea of "Linuxカーネルドキュメント日本語翻訳プロジェクト" and
the site.  As a matter of fact, the site has a bogus certificate and I'm not
able to see what it is.  Don't sneak in any dubious info.

> +
> +   免責事項: :ref:`translations_ja_JP_disclaimer`
> +
> +.. warning::
> +
> +   **UNDER CONSTRUCTION!!**
> +
> +   この文書は翻訳更新の作業中です。最新の内容は原文を参照してください。
> +
> +Linux カーネルに変更を加えたいと思っている個人や企業にとって、
> +その「仕組み」に慣れていなければ、投稿のプロセスは時に気後れするものでしょう。
> +この文書は、コードをカーネルに入れるための、主に技術的かつ手続き的な
> +手順の概要を説明することを目的としています。
> +
> +もしこの文書を読んでいるあなたの目的が、単にバグ報告を送信することであれば、
> +Documentation/admin-guide/reporting-issues.rst
> +を参照してください。
> +
> +この文書自体も長大ですが、詳細な手順書というわけではありません。
> +詳細については :ref:`Documentation/process/submit-checklist.rst <submitchecklist>`
> +を参照してください。

I expected to see a full translation of leader paragraphs up to Line 26 of
the original.  Can you do it?

As for "Linuxカーネルドキュメント日本語翻訳プロジェクト", (or "Linux kernel
document Japanese docs project" [???]), do you have a plan to start
such a project on your own?

Thanks, Akira

