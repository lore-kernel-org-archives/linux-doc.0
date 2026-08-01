Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DD530D418
	for <linux-doc@vger.kernel.org>; Sat,  1 Aug 2026 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785586342; cv=none; b=T+KBN44VrQUvEK3pBBRB65n7L4omWGOi1mPh65TNhXs2HyoPqzDBYE4w5IItkZLZgdUT0UB1rSpEcwLEZz6LSn3qY8L61lYg2YLWi4tudcRX+FDlwmxmhtGqTnmodV07RYmEnui8Ta0Y7cLrxYemZkzSF+QArap8DJ3N2luTwQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785586342; c=relaxed/simple;
	bh=kfSQrl1MR+AyG0VE5wHOAhlayRLI/h0scohGCwT3Ncw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTtSZoDwk2uYgfavqMw0ZYxCjHdGGwNtx8sjob+vHRWplNuPxtKx/q1oljtpzRRRykRsJqUwDVjJWZIKRqzD0h11WGpCSNDMTcQS9Iv1Jl7cWoyUnkm6H0AyI0Q+mRNrfiCihBrI4eUkWpYMONYgZyVNQumTPHgka1dvov96KcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6kKraMQ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6kKraMQ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cacb8416a1so19180255ad.1
        for <linux-doc@vger.kernel.org>; Sat, 01 Aug 2026 05:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785586340; x=1786191140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qq/DwZH7YAlYucV7P0m7oCNJvs6xdClz/fo5aunqV0U=;
        b=h6kKraMQKndKCbP+HpiUasGgTgG1rWIx9T+BVsY1TpnE7Y02D83DuMsF5kNgUrjVJ5
         sryweLGfiXElVmxulJDdWD9TqHJCIyrViAH5QBCNUZSs9Kv5ObcHuC3b5fapefzy1zOL
         0jfev+NRBIdLCalMWW2FdkRoPCkJ1IyEYiO40yb/Gj0AHtG0tB8lm6HyiXPW2VknvVsc
         UFRwXjfRB3RlE7pzzVtZGD+2rJ+2ksieQ5BAV2VW/yAtOmGHD4IqRtqtMbVBLv1HJt+0
         HiRQBA2OiGDxEOTCGO0UD9Kkq5EzOf8jQEPufD7Q1AbOuLyKMkG6LU+e7aNhWfOTpb1m
         W5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785586340; x=1786191140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qq/DwZH7YAlYucV7P0m7oCNJvs6xdClz/fo5aunqV0U=;
        b=dvLTEyqvSKvfzSRY4eXQRSFuFwTTIb/5rqLglVB+Me03mappMSsC7tlNT5gVugqZbm
         E6S4hFOZJyHT36cg8hroBe8lrhj70ylwvr9GeshV0sHWaSe9wVjb/AxBy79fkjcg9rtS
         q0vu5xewhOGJiNJJl67s2lnjYXVE+GKGlqhVG593vo76sPUWlR32SKv91RnGfC20O2ns
         8+hnVNZOtoD3umnu+Zl2eZU6M95oV/qCeFUYkXtPODhgadiaoN454WwPZxFzLg97Amr+
         LgH4ghb1QUUKbzZZVUjc6+mveSnrKUg1VyqVj5hw5gbalGry3lrswvfITNTot4kKmcJN
         KNUA==
X-Forwarded-Encrypted: i=1; AHgh+RoDrmxrwAby1dJcW4hw1B0xY4j0UUI53vlIM61WtxRygFAaGCJJl3xe5Jg6dSoJPj0JmmflIGfiEP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiwhbaPkbUEh14Lk8IaJsL0bpsWCIDAmNAXRyPwM/TT2bPpDGQ
	PfhXggASfxQKei2ICQZ1pW96xgvyGmLE42JXc9+7IWGp2aL3Vn5TIeQ1
X-Gm-Gg: AR+sD11dgPb7rjoVlF8eDXCOc0J+tDR3BS/3g3zz+YoY5VN6FFVbM70e/n7fDKM1V4L
	BRLnCByaEVQFz/RfOlVtiLhgo4237mAVbz7mLJiLyNvpgMJnEALhJDrRGUtYT0H8bGdBWl5i/Tu
	goP1qjbp32gXA1vjbk5H7rz4Ai6dFsvGoG0j/478RjqK5/QgfV0TVVfIEabnMiKjRU876QtkE4u
	e4oH4qfruNsT3qgrHGpJGP6IW8QAH74c29PwTd0CWVWTEzecP6ck0OAXJG05mYu2v5KGqTjwJml
	vlH8pWXkhDqkIKZ+dcGrgM22/cn3gCXSkQpr6T+eDwYulFsks9KHvjwrFq9wyD5lPJKp173NxW6
	Gn9Ax+vlRL4hsqab078C5x249ZfDTL2+tdHKQC7Q3LlEK5AmFeIeJ4yRETmgQfMcFwDvEQmI148
	KH2FQNObzPldasTDqR6u/I42L+YjiCM799WswjfJlocT5HWslyOASeqo0xLZ+NzVFXk3uK5ohXI
	vpmAeOJoy4HmBUGJlF1hq21os4LcwB07Q==
X-Received: by 2002:a17:903:1b43:b0:2ce:d957:59c4 with SMTP id d9443c01a7336-2d052188a6bmr33458805ad.6.1785586340353;
        Sat, 01 Aug 2026 05:12:20 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d26esm16948215ad.76.2026.08.01.05.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 05:12:17 -0700 (PDT)
Message-ID: <ff702136-839e-4d3e-957f-92573182df0e@gmail.com>
Date: Sat, 1 Aug 2026 21:12:00 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/kernel-doc: Fix kdoc for Python 3.9-3.11
To: Ryszard Knop <ryszard.knop@intel.com>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org, Akira Yokosawa <akiyks@gmail.com>
References: <20260731144508.912049-1-ryszard.knop@intel.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260731144508.912049-1-ryszard.knop@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 31 Jul 2026 16:45:08 +0200, Ryszard Knop wrote:
> The syntax used by the excess description suggestion change works on
> Python 3.12+, while we need to support 3.9+.
> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>

Tested-by: Akira Yokosawa <akiyks@gmail.com>

And here are needed tags for helping Jon (supposed to go ahead of Sob):

Fixes: d7758384ccb4 ("scripts/kernel-doc: Suggest possible names for excess descriptions")
Reported-by: Akira Yokosawa <akiyks@gmail.com>
Closes: https://lore.kernel.org/22a9276d-c103-4306-a617-7f34abcd5c29@gmail.com/

> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index 884f42584667..9cba20f827c4 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -601,7 +601,8 @@ class KernelDoc:
>          if not suggestions:
>              return ""
>  
> -        return f"(did you mean one of: '{"', '".join(suggestions)}')"
> +        joined_suggestions = "', '".join(suggestions)
> +        return f"(did you mean one of: '{joined_suggestions}')"
>  
>      def check_sections(self, ln, decl_name, decl_type):
>          """

Thanks, Akira
