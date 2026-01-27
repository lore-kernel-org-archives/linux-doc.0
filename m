Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6073346766
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 11:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514998; cv=none; b=jP/jMnbockQ7DqY4su9pfd3HMfUfDiMre6SO6xBaZcAwZslZaGXzkBKdq5yM6tU6XpbMijema8fi2iHe2t4L86C4njUj5X30w2Sj6O6BaL/urGwCDDlK5zc48/CtoU13UwgrstH5oExHVKIkPRUWflz9JxLAd12rVl5i+VWEgeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514998; c=relaxed/simple;
	bh=P//LiY94F1OlajpnNRKwWd+Yg9mN1R13LADpxgyomIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QnjgeWRUzktfSydV4fNR8vs1XVurSvmH1+5YzAe9kVEZ97GlJo+xZe2BiEaaEFPqaucpGuATcMWxOG6kQdsIxCA7QKW+66cfndW7JXAAMpKl1Ar3e4AWli3sBFoaULueMZY2yGSUtNn4UBtXHEsRCCZn676dIbvH7thr8Yu0BeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsAyR8iL; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsAyR8iL"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c46d68f2b4eso3573136a12.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 03:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769514995; x=1770119795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3W6WXYNr5yH/w2G1r8MoJgASz6OzmJb8vRibzAMBBAA=;
        b=ZsAyR8iLla4tPrlRoqn31n5NJHecGm52qrJ42nOR6J82ycvIY3WNzvvTx/cyrrslgB
         tlAnlx6CN5FEYGnA4ebYumPbNtvYB1HnX7TVqJ4UxTJKMtEMYsboSicVyIsdm3JT6BHZ
         CQSdK9QCFdfjKeiXI6XJeYHOQvDYBI7HcDuaAqvLCTnUhJ6F4YBkvBsUSs7KG9FOIDCd
         GWdi+7Xn1+vEmg9NWThKfgIJf48L6r4dEhGoIInObRBa7waUUZQcU0j90kFc5sFQrw8B
         evjSxKmJlXokclUEYBbAIA48ri5UwkYt2ko+VzFjcPTDa/Ov/CGe7pITNoyF1IuR6arB
         mJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514995; x=1770119795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3W6WXYNr5yH/w2G1r8MoJgASz6OzmJb8vRibzAMBBAA=;
        b=KNP4NEcRiSLs3bvMfqi5alJsC8RBib/8sxTOM/uLCUeUk2FlSPyZ7sj4meGlnMTDCa
         yoeXFqNZEXZ6zxRcCOeWCQasxbQ9LHUg/Ll/yTJI7q33l2u0lu08yDVUzFAj7Cuxy+yE
         xmm+DlnAOugLyoyBVyLhyMgC8k5FoJe3j28DHdqhkvrl2YTkqGJcelY96s+CpqFXhLRe
         ZABjDf8wnGDbgZ34PaOkt1+uG3LFb4jC8njxI3iEbPNRAB2Zr9I92XOeqWkypqKiubkD
         oRGtyCqqF+XT/ni5lxal9rrvsLeOmCkEhCjLyvWuOM2qkxmarl9gRKAJnJXHrvQcRomq
         jXWA==
X-Gm-Message-State: AOJu0YzdVYT8MR3hWSdc3jYEM7PjR2rdSbnC3AjL1Kl8uKO7bWZVkyGY
	++WMB4Y0ie8aSRQFVY+SrDEv1caKe6r0e5qs+29SMDXOg9fH6TI8+taj
X-Gm-Gg: AZuq6aKrNIp2/5vvAcx1WaWLs8zKO616cPechc9p2x/FdjZmbiQGekY7KSThQku/Be+
	bkju9pX9KKuNRwHDlUdPixkST0HxBQ0Y7WkggwBKk1IaA6wLKD+v8XVPPNPsEIaoAxCQewv1LUp
	LQoaL1X4gk4GCBWz43ic+rwvEEd6svThYkVzavYtfwhogfBpUI96wpQJLuDxtmxaZzJ3eUlvPYg
	ZZOimBNciiAPR67TflQiQq2YWclfUZWarD8uUwE40V98bTeBS5UJNkePu2YfmlC/2U9tAI2vg3e
	uHmUB7Mzg0UImlOLaNPENl5wNplvD/oYR+FGGxU/8cFDGXUquuADM8q1IfZ8wwCnsOM6UazvbRq
	2tZZ1FzciERULdSLFt/YSv4AbTjQ69CVp2hAyXkMH3m4WnmaZSL+tjcdu3BMFGXp6plqQFjLgrE
	WjM8wy2ntzFGCiZkjeaOtPfKkUppKuQW1EWffmXPTL18aEYhvMTN37jIcI
X-Received: by 2002:a17:90b:528e:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-353fecdcfbemr1682065a91.6.1769514995302;
        Tue, 27 Jan 2026 03:56:35 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536f35e51fsm4706932a91.11.2026.01.27.03.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:56:34 -0800 (PST)
Message-ID: <47aeff66-28f7-44b4-b546-46168a07eb8b@gmail.com>
Date: Tue, 27 Jan 2026 20:56:32 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: ja_JP: process: translate 'Obtain a current
 source tree'
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net,
 Akira Yokosawa <akiyks@gmail.com>
References: <20260126141931.3222463-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260126141931.3222463-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On Mon, 26 Jan 2026 23:19:31 +0900, Akiyoshi Kurita wrote:
> Translate the "Obtain a current source tree" section in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
> 
> Use a jp_ label (.. _jp_describe_changes:) to avoid a duplicate label.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  .../ja_JP/process/submitting-patches.rst      | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index 2ff887c86b2a..def262367055 100644
> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -36,3 +36,23 @@ Documentation/devicetree/bindings/submitting-patches.rst を読んでくださ
>  いくつかのサブシステムやメンテナツリーには、各々のワークフローや
>  期待事項に関する追加情報があります。次を参照してください:
>  :ref:`Documentation/process/maintainer-handbooks.rst <maintainer_handbooks_main>`.
> +
> +現在のソースツリーを入手する
> +----------------------------
> +
> +もし手元に最新のカーネルソースのリポジトリがなければ、``git`` を使って取得して
> +ください。まずは mainline のリポジトリから始めるのがよいでしょう。これは
> +次のようにして取得できます::
> +
> +  git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> +
> +ただし、mainline のツリーを直接対象にして開発したくない場合もあることに注意
> +してください。多くのサブシステムのメンテナはそれぞれ独自のツリーを運用しており、
> +そのツリーに対して作成したパッチを見たいと考えています。

Well, the original sentence reads:

    Note, however, that you may not want to develop against the mainline
    tree directly.  Most subsystem maintainers run their own trees and
    want to see patches prepared against those trees.

Your translation of 1st sentence would be good enough if there were no
2nd sentence.  But in this case, it would be better to reflect it.

How about something like:

    ただし、直接 mainline のツリーを対象に作業すればよいとは限らないことに注意
    してください。多くのサブシステムのメンテナはそれぞれ独自のツリーを運用しており、
    そのツリーに対して作成されたパッチを見たいと考えています。

?  Might sound too non-literal to you, though.

>                                                      該当サブシステムの
> +ツリーは MAINTAINERS ファイル内の **T:** エントリを参照して見つけてください。
> +そこに掲載されていない場合は、メンテナに問い合わせてください。
> +
> +.. _jp_describe_changes:

Labels should be added only when it has references to it.
This is premature, I have to say.

Thanks, Akira

> +
> +変更内容を説明する
> +------------------
> 
> base-commit: a592a36e49372172d7c7551ec19ed18184c935e1
