Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106B02FAC12
	for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769586194; cv=none; b=sVntzy/if8Lqnwfd+hk++CTbHFklXVZjDkbTgWXlZnIlgH6at15101PCJui70Os3Sho0iW4WY5nHj/1vFHg9QMGg7tujG0tUwLIt2oD/lu4y7H6Fr/oY38Nei0+17HRYDcybxZUDHnGHBduUANWyHQNbk1h3vmuo0rs326GLnZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769586194; c=relaxed/simple;
	bh=AsuI2P891YMPtbFUR3+JS1AAHQ2ymDzkcBh66A1SvzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oZ565BLJIstXe5VSTTFhRsUQ+6trUukHHrGnGmI0n29Y9O2lvm8cnhBG1ryAEELG6bW23a7SnAJ95wJleDMszs+I3oevXlJ3TPGwbfujrKMbQETB9rI8Y+3p1byyQsNEOW32vjFkd+w1S7U+o3Lu2pHB2r/ltND/ZPx0HPv+V1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Saw+V24Y; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Saw+V24Y"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81e821c3d4eso6061956b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 23:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769586192; x=1770190992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n0d0NlmiPedpKZAQXxr77Lbl9hcUMfOTM3rsWpoxrtE=;
        b=Saw+V24YIcPpPH+B0GjCioWSsUnbnfjpGQ2GBvjPdYoW8gKcWTw7hdveZp5CHVvbBA
         s5lPXKartB5LkkwiUwis4bFGElJxgEIIB1TWqcQ04ou61yhREu7vCehoW0vZfQDDpczp
         5HXDY0HxWiwqMqSv4wiusXfrU3FUeICPYATI2JVplj4pcfaqRbwPVHdzFsel0EeP2Vn4
         QyJDMUJx5M8fjqHo+ZogayzR5s8TL4LjwFVBuvnglUy1dscA2XssPXKfOaEXTzOyZw4H
         OBDILoyMXjzheJqL4QQOMxM05lLIqAG82GBIFshH6JUU2pGxkRlVcK15Wd2Lm+j6sldL
         zGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769586192; x=1770190992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0d0NlmiPedpKZAQXxr77Lbl9hcUMfOTM3rsWpoxrtE=;
        b=R+hscbaP3Y8YNNxMUEBt3P0kZ61If4sli0v/dO0gDVTLBZRXmPYUiX4g0H05DGEOU2
         cBYChl4M2ABuvaQgd4itkTChAqZ88cHR9bOITTF430PP3sIIDR0krk2VSf51IfzSyDhM
         ijTxcqy9Z/S/Pt33bbHhq8QUIl113ZxI42kP1scgFqHXkmZvQW5c0TZZW6pETuIOjQ/b
         IA297UZKH1q/c04xnxTvrg9JsW1/h67INCvL6QfSA37UHvRWtYdD57Tanm2fLMIA/v7o
         Gi41TTjXHCDt0chlxJYl+YE5wr8e+jyw05wR9sNL9GRKyRRLmkndDXtyfh/5M0lZN71w
         q9Tg==
X-Gm-Message-State: AOJu0YyhCXkuPw2VQ4U2thni6gX49PqXrlfEvVu3IffLPyxO1LAIWMSC
	oYMRRBi80uJIm9ZcQxYnwvvoJ/Qu+P02GW/HVU2BFnWlz0u9yuwpVCOFX5061g==
X-Gm-Gg: AZuq6aLbVP9yBX1Mk3+UkJuu5t70wjcohkewCSeuVKxvjxHeJezcp38YEeLriYDZCgd
	V9XbtnJH1JfvqLzfI/olbfFHwpfsCqViK9sywcOYXBgQS7twSbWE/aWdUYePZTtwkO+pQwU904z
	u+S0uKIzf3zj0UNuQd9pxiunD6ZtwdydJPXt7AeJhMOuSzzVU0usMUq0KMQAYUc4R0f3d++u/88
	WG402bHDtU+HxdL9XtMcGWj7W5E9Mwd1oDgCt0oee3VinCzWAi4yFnQAU/B5A4OJrLAJ7u+OmUO
	3Wt17eCM/zNetyXUBTstcscOehygJFx/k3sbyN8Qwg19HfJMu6DcO1DFxVhBOoxZwI13G2PliLW
	+syIpPCnFmyl/dv3Is2b7H7D6L2vpxGzu0pU0QgZoyLFIGbfzOUX5Z1o6rWXswR+/qZOHZg0gPa
	RwqBIY/js026PwkspeXR0J6oWvaco01IL5k+/L4tSt25RwEcnaeWefNWAB
X-Received: by 2002:a05:6a00:23ca:b0:81f:517a:56e7 with SMTP id d2e1a72fcca58-823691a7936mr4090945b3a.30.1769586192483;
        Tue, 27 Jan 2026 23:43:12 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b6b2bdsm1664934b3a.30.2026.01.27.23.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 23:43:12 -0800 (PST)
Message-ID: <7b241544-fcea-4f7a-8853-853b3052d8fe@gmail.com>
Date: Wed, 28 Jan 2026 16:43:10 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: ja_JP: process: translate 'Obtain a current
 source tree'
To: Akiyoshi Kurita <weibu@redadmin.org>, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260127130155.16935-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260127130155.16935-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 27 Jan 2026 22:01:55 +0900, Akiyoshi Kurita wrote:
> Translate the "Obtain a current source tree" section in
> Documentation/translations/ja_JP/process/submitting-patches.rst.

I failed to catch this in v2, but, I think you wanted to say:

   Translate the "Obtain a current source tree" section in
   Documentation/process/submitting-patches.rst.

, no?

That said, I don't think this nit-pick is worth a respin.  So,

> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Thanks, Akira

> ---
>  .../ja_JP/process/submitting-patches.rst       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index 2ff887c86b2a..d61583399ef4 100644
> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -36,3 +36,21 @@ Documentation/devicetree/bindings/submitting-patches.rst を読んでくださ
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
> +ただし、直接 mainline のツリーを対象に作業すればよいとは限らないことに注意
> +してください。多くのサブシステムのメンテナはそれぞれ独自のツリーを運用しており、
> +そのツリーに対して作成されたパッチを見たいと考えています。該当サブシステムの
> +ツリーは MAINTAINERS ファイル内の **T:** エントリを参照して見つけてください。
> +そこに掲載されていない場合は、メンテナに問い合わせてください。
> +
> +変更内容を説明する
> +------------------
> 
> base-commit: a592a36e49372172d7c7551ec19ed18184c935e1

