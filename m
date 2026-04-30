Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96053345752
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 03:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777518582; cv=none; b=Uv0sjWj6yJfjpbTzxhDXlf9mPMb1rgVEef1lpbBB6PynMW/mo5Yz/tRnb60DXyciHG9r/denEggyrMPCcm/ER/PQVpFlEyMYiGOmQlVguPugDkMdCATqWVC32HKiA8LettPiAl/9YStbGCusOavq7YImEAMUTWWaa6G2Zc9fd7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777518582; c=relaxed/simple;
	bh=YDRbZqfqwlfcLcV/f4V6FxXl5ro5j92Ol9ZxWqT+W2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8whrUCmLfUuu/AN0/fj9iTv9l614IUgk77nbzrtfSvz9IKV3r4ydnWxvxzgeT6CtlMpgyHWzVaDFJL07aV1oJvnaX6i2KQiWe/C4nShzA5qnSq+iIPa9+Na8k11fKO7Xq6XUioO1HBDpaASDHaUGsBRXGaSnijqx0xXZvUFV/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPQ3l+ee; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPQ3l+ee"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c76cce85bd9so137886a12.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 20:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777518580; x=1778123380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MkbHGo/0D64rIswr7N7F1vLM4GtZX+i08zhDdyP9VmQ=;
        b=DPQ3l+eeXKt4y8p0wWQIqFX3DB5D9KfGnLNoUDcFalst1v4UC2GRMy+jw6/oEKDAQ1
         TD0+1V3epnHBPttGR/DjqnmVSal5GsC8skbFEBUR1X6UqCL9DnYoptqjgQ6Ip+NP3mUT
         qe73vxSrKKfg47RiPJ89U9Ig+EGHOt8NYyydakynyCpJPzYXP/5HNjdx1KWwjAs52RCp
         595QURnZ9b3Oj7ilmwEaFeUzxgcgGSZaKMtCaIrvKxcvz54aBf1Ne4mtB2vME5sCFSAP
         PoWJAjDmFobTVkcu2XHV9DvpvNIqS81rsNDFUBFYMjmM2Nma5wseBtKlLSp9J/ebiZZY
         vnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777518580; x=1778123380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkbHGo/0D64rIswr7N7F1vLM4GtZX+i08zhDdyP9VmQ=;
        b=Z1yHG3KgWa7C3oTnw1JP7xcVRV+KaoWvYmsjN9u+6m5QRuHjfGP1NZWenxG/F2PJ3y
         W8UnUnNA7QplUJdel60+RgmDnfrDtRO56WghIC7pPKRlwmuFdFd37vuBrdB3VSiAEzHJ
         OLKuaHNhrUXwiP3cT+Mw6EQtFRL4ysJVbCpmrNYc4Jr6jfiqYzDGqaSJO8Be/fubw2+i
         NoPWq8nwqox9zHrg9aXBRkEfb8O2BAfwvKHPOSL/gAmDyNTFc/Yfl+aT6si+WY0ZeIbm
         NIDrIaIH+sLpipaXPpqYL8mLdReYN6ZQFslvBAt3fRCuRSP5jXT2owdffyfBG/l/2iX7
         xFwg==
X-Forwarded-Encrypted: i=1; AFNElJ/lH5x7m6sa0dd+jjXoqjrE+1PUe/1lEY0J0FR973S564X9Eoi90jkddmJO/c8ycWfWbOzTsBonlzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyigKG4eUieenwmBD5bAcmQlckgixZUTmKyXKbtlBuLPDqSg1dI
	8xyyAgEWhtW23JLIb4f5H2g3dQ6WXXdYy1azvVbpoyeXeknXKOqQCXVx
X-Gm-Gg: AeBDietJv+h6MsTo0WcOlpIbRxQy4mYdPAQosq5AqD6mMlOoTvb5CMmlrFFSXKlS5Jd
	5isDzj2dMubefWQZnBj2JDennaFllE2arDYUcDKverFWFBPeWwnUC2TqIQTaCC/uUq4448R8AB2
	bPiE9CCswCNq7beZtNE7D5nYV32+tw9FOsoON/5RhSum+VPjwkNPcf4JZXXBDI9GeLkn1/lzF9c
	FuL7k+bM4yupyOb/NrH/W2Gix6ZSjqEI31VCViDxiwvW8NmZZKWV5waUQ2k0UOkMGKK78J9wUzF
	p7Fp2nnG8dfAKueS/fg2Y5+iGvXEFxcntEoJ5JKI6MW7L3lxfkXjxe3KrRGIWiaLyOYCRIBFM6b
	sdgR84Ix0bf3BwMK7pFWEuMhpCkmlYadarA+9DxIxp9f+sPXAafrycYx+3d1rOvTa2CzKiO3koa
	+NPpoxiJ0xugY95k9ksxQ0n/esmC0fDknq4yC/F2oZUT/nxiy4od0BDQok6Kwj4yT5Q+5/35mI0
	SQ+DfCBF5kZqPjcjw==
X-Received: by 2002:a05:6a20:734f:b0:3a2:d79c:4149 with SMTP id adf61e73a8af0-3a3cf7c1702mr1225759637.28.1777518579885;
        Wed, 29 Apr 2026 20:09:39 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd60673f8sm3443208a12.11.2026.04.29.20.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 20:09:39 -0700 (PDT)
Message-ID: <792e4280-4342-4a6a-8954-3458ae5d4250@gmail.com>
Date: Thu, 30 Apr 2026 12:09:37 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/ja_JP: translate more of submitting-patches.rst
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20260425120941.1290861-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260425120941.1290861-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On Sat, 25 Apr 2026 21:09:41 +0900, Akiyoshi Kurita wrote:
> Translate the "Separate your changes", "Style-check your changes",
> and "Select the recipients for your patch" sections in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
> 
> Keep the wording close to the English text and wrap lines to match
> the style used in the surrounding Japanese translation.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> v2:
>  - drop conflicting label

Well, that is what I said earlier, but you can now add a file-local
crossref to "変更を分割する" as noted at line 97.  Something like:

-------------------------------------------------------
--- a/Documentation/translations/ja_JP/process/submitting-patches.rst
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -92,10 +92,7 @@ Linux の多くの環境は、上流から特定のパッチだけを取り込
 
 1 つのパッチでは 1 つの問題だけを解決してください。記述が長くなり
 始めたら、それはパッチを分割すべきサインです。
-詳細は原文の該当節 ("Separate your changes") を参照してください。
-
-.. TODO: Convert to file-local cross-reference when the destination is
-   translated.
+詳細は `変更を分割する`_ を参照してください。
 
 パッチまたはパッチシリーズを投稿／再投稿する際は、その完全な
 説明と、それを正当化する理由を含めてください。単に「これはパッチ
-------------------------------------------------------

Here, an implicit hyperlink target (of docutils [1]) is used to avoid
target name collisions.  This should be good enough for now.

[1]: https://docutils.sourceforge.io/docs/user/rst/quickref.html#implicit-hyperlink-targets

>  - rewrap lines more consistently

I still see short lines in the latter part of this patch ...

Thanks, Akira

> 
>  .../ja_JP/process/submitting-patches.rst      | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
[...]

