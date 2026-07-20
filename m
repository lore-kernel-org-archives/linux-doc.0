Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB06B3B7770
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532025; cv=none; b=r53hBjWdh8d3TGPU4T1w4geTJXFLXkhy6J1w1vPxjREnelYG8uGO5juuhH0iIWgrkywbXUfCTiI4gSR0A9PeCiRRAwN8xVQVh8dVcYJYuToujN00hhUfGyhJIA2AQA4E2oKlhUqCUfl2d+Mlcykk3c6A43AAfEpOqaICncqEnTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532025; c=relaxed/simple;
	bh=mqEx7oRNyrZRZsp/7nkKHtueRW+D3pmFpC3nj0tooyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyoX26fIaz2NkDHJ1EynRF1eDRqokelQo5hu6T1x2IszBDRGEKvLDuCOikz9B98JxXYYBLqIaz/zOXM4jLhmVOsnz/VReqCrO/IUyz6BlSCSJjfySDq7tNJv3Q1buDAsi36jZtgT2V30aj86Wq/8s0wEezB0BfEDJOKJeWmKXVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbRPg8Ga; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbRPg8Ga"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ced3386430so61435715ad.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 00:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532020; x=1785136820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bw+iKl8YXR5Qsp5BR0pFliTzdMNbs5r8LsRJ0p++3gQ=;
        b=TbRPg8GamiTNqKaVNjcCMj0tnIkNhJezChEMW4KlGQe+RZKca3z5T5K+YUiih3Uye+
         6zEj1G3hU/CkSDaiGIAfAY+YMSIcUl34PbBomyHfYoaNV3V2YTDigFT86yV7plD9Hdpd
         p5m23E52LXbqwFXdBPCV6OjUIej4LuCGOPlgX3T6NjBXSF4aELHOVHzVLJJMySXqasJW
         2fAmDnxZfjY6Izf22JZyfCPNYyFiN0IqjpG/2cweorGA8cZ6IGbU7OiLgmXyRf9jRgBg
         q4dzcuHmVaYouKnEhF2FJFZDxJU+YvweTdCHkMM9B4Zyi5syx2mwykvXBV3wBTCgQXcD
         G4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532020; x=1785136820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bw+iKl8YXR5Qsp5BR0pFliTzdMNbs5r8LsRJ0p++3gQ=;
        b=aiXWUDtDPkRML9AsVVya/NV6fQkN1T0pxzFy1f4gSzbN/vuPOn+E602gPOEOkjoM4R
         9THs2t3DUzGb7TCIm2sGYWkAXZUVIR6B9OAcQtIFwIGMMDaGpbshnWTF3iW+nEm6nPgT
         MnA0iHlh5VevvWlltlWuAx+mbXh6GNoFF17BmAOeUh3QW8mgJXxzRgYR0+p5HbS82KKq
         i1Pb5Yl3iAsiJZmPIEN4KgcNfn+cC8ctshrGuxUkZ10mIP8loEaAne1OflIJpwKZeX/m
         qQ7eIt9qUq3tNgDQn2+FZFYcowFST29YkglnmyW4sGvQnJgSKOaiO3TI3o8yWyaAzWQt
         P8Vg==
X-Forwarded-Encrypted: i=1; AHgh+RqksmGQJzTY3jjtSlDtsbWSBYbo8BM0ZFFuAT9R/xWKd3yUxPeVcQAV3K1l4qvgzo1nGaFrmdJ0XwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqUbINfpmk+B/UkICLYk2Y9NFvBx5ylrBpIdRmXeUJVyIJMFfh
	xkdmfUADnhOfaLh/YXC9HFjxkK9jHPczPzYtRYiZdvq4tRaLhX3g/eLG2vnBpA==
X-Gm-Gg: AfdE7ckIUdda+hZTSK75pG5tZUuaSNDvt+SrBLMJGF9q7dB7hLdAjn51uyklx8SU1Mk
	6JscfOxbWl5zO+WWp028YTjM//wJSRg3vRYnJoB0eNrWKnmER7HfjW9CqnGCWOB2U+pZ2qarMdO
	+YSDJepEnqeiol3LFwBXSk+bExE5WTlS/dd3H3aAZH3YENPpdhOYXFHlrLFudAPRvfTVEnc94q6
	WWeRMD7tpjebloUa7YXmcgNbai/libYB8AB8BeOhGypNWD0DpoDobJkhi4XKlSxP5KCGKQpg+EF
	knOdl2IgGM32qEL0xBFUyO923gdl/1zy/kdxBzLYPL1Kwh5RhWABJy5WYLFgaJ79TvcW0bo3ESt
	nxbtD5myOkDJmtnJRx8W/otSnnH2MxvsAy19hDO+sk1QHvyWdP25bq5Ez0MxeucsqWwt7LZtXJ8
	KYHTXbQBaJajuzakYFR9qYAtp+4kHLsvzFXKXvclwICSHOqaU=
X-Received: by 2002:a17:903:1b4d:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2cf34844139mr145035215ad.14.1784532020403;
        Mon, 20 Jul 2026 00:20:20 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b1f04sm52540625ad.22.2026.07.20.00.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 00:20:19 -0700 (PDT)
Message-ID: <7384a9ff-64cd-4772-990b-92aa5306751d@gmail.com>
Date: Mon, 20 Jul 2026 16:20:21 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] docs/ja_JP: translate submitting-patches.rst
 (sign-off)
To: Akiyoshi Kurita <weibu@redadmin.org>, linux-doc@vger.kernel.org
Cc: corbet@lwn.net, Akira Yokosawa <akiyks@gmail.com>
References: <20260719181934.213142-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260719181934.213142-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 20 Jul 2026 03:19:34 +0900, Akiyoshi Kurita wrote:
> Translate the "Include PATCH in the subject" and "Sign your work -
> the Developer's Certificate of Origin" sections into Japanese.
> 
> Keep the DCO text in English as the original certificate text, and add
> a Japanese note that the sign-off refers to the English DCO text.
> 
> Use a reStructuredText note directive to make it clear that the note is
> specific to the Japanese translation.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> Changes in v5:
> 
> Rebase on docs-next.
> Remove an extra blank line under the Signed-off-by line.

In the rebase, you have introduced this warning in "git am <this patch>":

    .git/rebase-apply/patch:117: new blank line at EOF.
    +
    warning: 1 line adds whitespace errors.

See below.

> 
> Changes in v4:
> 
> Use a reStructuredText note directive to clarify that the explanation
> is specific to the Japanese translation.

[...]

> +作者の SoB に続く追加の SoB（``Signed-off-by:``）は、パッチの開発には
> +関与せず、その取り扱いや転送を行った人によるものです。SoB の連鎖は、
> +パッチがメンテナーを経て最終的に Linus へ届いた実際の経路を反映する
> +必要があります。最初の SoB は、単独の主要作者であることを示します。
> +
   ^^^ Here is the "new blank line at EOF".

> -- 
> 2.52.0

Please fix.  You don't need to hurry.

Thanks, Akira

