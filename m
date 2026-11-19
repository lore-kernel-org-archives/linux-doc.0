Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123547;
	b=4l1vVFkqbhENOkizpGZi94sZxr4bchA2i5u6eDVJwleMTwEr28SLZ3Ltzjg2XUmf/gtK
	 RJBPUZFD6nwdesEnVPc2H1VPh0X/CGXiwaQ7jj5NqDZQookjk+zEnmOq2WAxZjVLgeavJ
	 jASk3RC0hp5Dqd0SaQrRiw+X6IUmdi7qSNnKi8Eix4vxMWN89kwbZCgkG28pd7KpJqDtc
	 rKZxCDOKXKnswL9P3HG7gdp4KRtEMVp1kGboVvwSVC6j1izztHisgkF4/ZRL2fio2pWBc
	 z9wEMvspXQWPuOIiNfKFBggwghUKFPqS3UQeVI/ZAT10Xy9elBnqNbRFw1mNKKy8Aow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L3A+83a9wCzT+86gHuUpOEXepXCJ0T5thB6Rt4gPEd4=;
	b=dg4rMgJxABvJqWAiujQBmLUQ5GxyWrZKcwjM0ESzs+fyjw4c2VAETOoON5Bbxd2uROrR
	 0In9ta1t6pOKHV2VlQ6N5TuPFP01eWXeKhMBs9ZPqWFfbLpS++i/tw/p/CXLQuVHwzGGI
	 +u15nD7PLK35GowU5NXxHF5C6CY4aJ2F0NONBzm/APqXUK2jbYgPMeCgvFbPW+U21hPWh
	 GfIAnbqSPRKMAy1dhRyIcaeeudMENDwcpSLgDGXmP/hYdo3MZAVqLD/F/USZzAQrqI0TR
	 R/DU/AOvu90Mhlx9YelPA2+9dRDuTo8G7rNM9KnsN3rvtKEGecnMrH2rGJQQGURmrtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEWPSsQJ;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB72606A324
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 21:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AB72606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEWPSsQJ
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-536717a4d83so1938921cf.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 13:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123546; x=1795728346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L3A+83a9wCzT+86gHuUpOEXepXCJ0T5thB6Rt4gPEd4=;
        b=rEWPSsQJu0DHzGPnHR4fUNkId0R/vH5k8iuqTieO4oFRVN9Wr6bJ2jRdJmRWIIp034
         U67Ce3A3De/ZQfiK3F70I2Izmn+Nh6u0X0rU1isSDp4b+RNakUt1fwNgRz4GSAE8nqcG
         /c8hLCmmJkjIN6Pptt6iTBvye4W33y8thEPF6arbiZ6rfpFL5jBGBVz+KMHLUdt141NX
         32EjVHbeID7WYgbEi0z2Q2pY9M5McaT8cSEYeinFBNl5SbO93aT6Iju8ucwg01mVLOl0
         X2pOMMLAt6q5xhSqpKbaIE4PREpMCtplAjqgZIZGvsW7Z8S3IRRmmKqUn0C4P07IAds4
         eyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123546; x=1795728346;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3A+83a9wCzT+86gHuUpOEXepXCJ0T5thB6Rt4gPEd4=;
        b=GvKfbl4OUgRfOWVW8fAx8PNk5zLrD8UiFQE6cAybGaYF2Ss9a/BnGxgtjwp1OdGkFX
         kHNyFFJAcrR/jPmhBoD/iaWhovRFFzaDX9KQF51rtNlr3uMF9rii5FPwLphjT0TvHAIz
         /0SCyAmZYeZuaEhG+48o+oESErfSa/c9yo6jOxVsyPTRhwdP3gLmRjbrhbEHkPchmPug
         B8Rn+2vq/1LDbZ71wyP28hPkAkCemGHvUmbAY6A1iObmVyA572rvpCo2ZLK9hNGSgvJ5
         E8g/lfUHU1vHYakixhqds0XGi0afffmvcizSPInm06R0Q1xh8lSn1cA+AZr0K6zKb/vt
         Bapg==
X-Forwarded-Encrypted: i=1; AL+hErELi+wKyvfx8cd2EwDc58TBCL+Z4x7qO7GxeQLB2kODC/y5Ovmq++TdymRg+OzEc0Fzs6UYJ9sNZwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0F6Iazitzh7HaS8kYb6JymEqmwt0s1I8qwu6Uqoj9UdTlsrhX
	5BaRZ2wQFk/Xn0OeJYNJk+9sachX+HCfCi7FOJWq3mMEXMJy5g/ib9Nj
X-Gm-Gg: AYBFou3NEulGGsjXBApfpCBc6AE9ji3gYu4BpQvOPxTnGx2aGvMfKbJEv6WW9FLkuxO
	sYawZLRezu2MotoZ63s8klMqPViB2CErVHgulAqRydiEicwMiYC0dC8LZAkzmzpDGaQvHIGOxc8
	d0ULI2F3wW2HLFHsiYzdy+vcAVu6XHAHJ5JEc+S4t6MGQvnj5JbrZmlxaJ9o95nZTPekp7TY5f/
	Dag5G64T8qLMbx5r05iTNWcI8zBtIfnQxPMn5AMyvOeeAitRxFXYgA3DSlV0tbC/D+hL568CQ6N
	Q6Jd0mBHTKTHgGoFXE8Wb1F+4bMDTu7XaJbOw7IC74ckpnvPDdjvJCqqV9diUiGGDDWL5iSBvRD
	mr5eliyJ6PQ5nhK2OFx/ZZoYisxrd96wo2fmPoevQcjcrGbW2BC3x3XqVVs3wr166UobQCGIEcX
	BsyU2GNggdWB06q5rXIIn+ZwkMwvZIZfQImQB+l9SAEpFsHw9nkaNc6Cwb5VTTY6Wp8Aq9QjSAT
	mWIkyizI19uDwnRgulEJajggy4778kKHlztnq400Vuot+cHkh1ahvn8EeTKPP/b1esA2KJrmsfW
	8TeleYQhRXNXjpEoRmulSArmT+cCPPwWtxwa8ZssNh7oFELjeiVGVCwPK+QyB+wrp3JlT//tV5L
	+Djy+xxe6D0UA+aMaer9l5pyKjUf/cmZh1Yq/zY1Zaa9fMN4DVPluyk9OwzK6VkMwLTVlYRGuEn
	6jtqFD6Skf
X-Received: by 2002:a05:622a:248c:b0:55d:3669:e04e with SMTP id d75a77b69052e-55d76a2b7f7mr22004751cf.22.1795123546011;
        Thu, 19 Nov 2026 13:25:46 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm8744006d6.15.2026.11.19.13.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:25:45 -0800 (PST)
Date: Thu, 19 Nov 2026 16:25:45 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Sangmin Lee <45sangmin99@gmail.com>, 
 netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 David Ahern <dsahern@kernel.org>, 
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.d6d50443276@gmail.com>
In-Reply-To: <20261119164351.49040-1-45sangmin99@gmail.com>
References: <20261119164351.49040-1-45sangmin99@gmail.com>
Subject: Re: [PATCH net-next] docs: networking: correct skb_shared_info field
 reference
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Sangmin Lee wrote:
> The skbuff documentation refers to skb_shared_info.refcount,
> but struct skb_shared_info has no such member. The actual
> field is skb_shared_info.dataref.
> 
> Correct the reference to match the structure definition.
> 
> The discrepancy was identified with assistance from
> GPT-6.2-Astra (xhigh) and manually verified against
> include/linux/skbuff.h.
> 
> Codex built the affected page with Sphinx and verified the corrected
> field name in the HTML output.
> 
> Fixes: ddccc9ef5599 ("skbuff: add a basic intro doc")
> Signed-off-by: Sangmin Lee <45sangmin99@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

> ---
>  Documentation/networking/skbuff.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/networking/skbuff.rst b/Documentation/networking/skbuff.rst
> index 94681523e..e66adf19a 100644
> --- a/Documentation/networking/skbuff.rst
> +++ b/Documentation/networking/skbuff.rst
> @@ -21,7 +21,7 @@ to as shared skbs (see skb_shared()).
>  
>  skb_clone() allows for fast duplication of skbs. None of the data buffers
>  get copied, but caller gets a new metadata struct (struct sk_buff).
> -&skb_shared_info.refcount indicates the number of skbs pointing at the same
> +&skb_shared_info.dataref indicates the number of skbs pointing at the same
>  packet data (i.e. clones).

small nit:

    The `&struct.member` syntax is only converted inside kernel-doc
    comments in C files. In a plain .rst file the `&` is printed literally,
    so the HTML shows "&skb_shared_info.dataref". Since you're touching the
    line anyway, match line 18 (:c:member:`sk_buff.users`) or line 19
    (``sk_buff.users != 1``), e.g.:
  
        ``skb_shared_info.dataref`` indicates the number of skbs pointing at the same
  
    The :c:member: form won't link, because struct skb_shared_info has no
    kernel-doc, so the ``literal`` form is the safer choice.


