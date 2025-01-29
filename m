Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531DD1A9B53;
	Wed, 29 Jan 2025 11:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738148688; cv=none; b=pxBh13++jHqNBIZHoVLnf4xhquN43CWpqiz53oiyO9N3YVPweuQ9q8inPxp3BrYk2wDet3NOt8DL34GhwyHCfhJ6VlBSjd/OcDW2/6AKGAIv1LrXz8IOhYbayPNds/xJcdKOZnpDjk1+66ZBqiZnoJOMKu0YDpB5grtO5eC3lOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738148688; c=relaxed/simple;
	bh=gjAGpJ2ZfCab6OmbpKP5c0cFnuutyKRkASwagZ+wqqU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=glNZT7RedF8ohl1w9oGybHaeIPiWtfKjS45D4smW/MmePDS/uToAQLgfSQ0pd825+3dhXbQc4lB9AYNCjA2bMjh8aSWnAF5GpfhroNB1iF91QmGhagyTSuSnFoJ1GQtCYwJIsJNjCtGh19HGIPCZ+519R2Rm2g3KuvLp6i6cH5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzOMmw/1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzOMmw/1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2167141dfa1so10068025ad.1;
        Wed, 29 Jan 2025 03:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738148686; x=1738753486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJ5kmVXf2DYTWGaBQCItHDAjMn8EJDfpv/qdoCloEls=;
        b=OzOMmw/1BWAeKaukE6lj/fn6ta0+cE5eqaLXE+6U9aXy3O6PhR05EyDFbtwVCaXglL
         7Bik7pVRsUn0YKgURNBdSMS+HB4cWsb62fTjv0hOcosovVTJGmkBayEOPJUXiFZkPbis
         1Qhg4pj2A93ytR/tvcemZRrWshAtC/0XVuAA8zKJg+bM6ir350rNJzC3zlSZUmNiu5z5
         EfiQZ/NLkTncehUvBRQEV2NEGM84oDq8WFNZ8sGV9IFC7opd5kjNX5f5VWtlJRWhYeLc
         KUdp04k4O6RfBRJyUKQ1FYJJt01WeV+/r3IQgwftDR0sP0yORAm7YyyYwhApE6ek0fTt
         SS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738148686; x=1738753486;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fJ5kmVXf2DYTWGaBQCItHDAjMn8EJDfpv/qdoCloEls=;
        b=slOpL+yli83MFTZrqIboWhAfgxm0DIrQHXkMOCinH0RTb1qmjcsFJpvHv73E6TeKBr
         XOW2hSN9wH2z+G3s1dd/2pQED6BKS3K0qs/Xz3mfqOTt9QwavkOWaiB4PEbYjDrjwIl4
         lXP/e2lAcssSDp+OuXPG8t06cif4rbw4Xeol7mxiqc8H5GkIkX1ke0i+JoEL7afkIY58
         B+L0jIC1aSBgAwc2+1T6CJC/rpAPcURID7tK8rdkPOw/Q/g5xubo1YVut2RW05FgInos
         wvnpZUFtdoKNSsRKBgdIZKayC8/8Vul6HOIU2VhPW2IjL5vq3dpbuW74yN78ez9HRbhq
         8xlA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ9NpIT5bg7prXiBbzA52jwYFEzfOHXFLzCF6bfLDe14pMUXwVpY3TKCTjlPKETIC9T5vxXd+TlzJODdSS@vger.kernel.org, AJvYcCWZO5pYJpV9ad1OWadSr55mU6ZHoUfCTiV6aAhUA4fBDBi/oFd1VgqglXjGvfG1jzktUvEBOvL3RPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGV8O6ytPWa60syyIes2WhpxY1F+51jbmSKEJWXThK6IY9t8A7
	Y7Ra7rZ8Uu2efWUKROxyBSxtVmYmpJkifk2uKxHhnI4t4pOZz5+SehKpnA==
X-Gm-Gg: ASbGnct+7/DhOrAoVGQvoS1hYB/bXFqrBRNtbKe2/pTrts7OdhMt8IRiBPH/LvWTVlV
	iZDByllC8hxRilLBflF1uCcYB3YJSazJG8yTfseB9ymOeYUKtzq/fZhV2HRhx/T0iAL3cSSGjBj
	cCcQiasg1nVzSS7vu1WIZqY57UQ6mEvPh/BSyMkYs9DNmPoP9CEcVqN9rJdLeWj67GpT22BN8Cy
	4xd8hders6wtJSJBux3XpMODXxiXHtgaxXMN064907iypIbJPmj6mghYLAPwCkaLcg+zqAsrs5n
	RC7Mt4A4TggvaaklzxSV8gcc7q8Ywl4e1FrsOrXJcOCpgDAkJCciKP0dNEg4bQ==
X-Google-Smtp-Source: AGHT+IHU5XLv+7KBAhdQBHeqsXNSoiHmndBjBw7eRSFF+6uerQ57WbXOzpg+vBfjYQh9rwO8q/aq4g==
X-Received: by 2002:a17:902:ef4f:b0:216:59f1:c7d9 with SMTP id d9443c01a7336-21dd77dbd8bmr51597285ad.19.1738148686365;
        Wed, 29 Jan 2025 03:04:46 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414cc20sm97484275ad.165.2025.01.29.03.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:04:46 -0800 (PST)
Message-ID: <2d4d3fd1-5fe2-4d18-9085-73f9ff930c2d@gmail.com>
Date: Wed, 29 Jan 2025 20:04:42 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: mchehab+huawei@kernel.org
Cc: corbet@lwn.net, gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <72a53ca85e554b0c1fb90488d55aa62ec1d7defe.1738020236.git.mchehab+huawei@kernel.org>
Subject: Re: [RFC v2 17/38] scripts/get_abi.py: use an interactor for ReST
 output
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <72a53ca85e554b0c1fb90488d55aa62ec1d7defe.1738020236.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Mauro Carvalho Chehab wrote:

> Instead of printing all results line per line, use an interactor
> to return each variable as a separate message.
> 
> This won't change much when using it via command line, but it
> will help Sphinx integration by providing an interactor that
> could be used there to handle ABI symbol by symbol.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  scripts/get_abi.py | 52 ++++++++++++++++++++++++++--------------------
>  1 file changed, 29 insertions(+), 23 deletions(-)
> 
> diff --git a/scripts/get_abi.py b/scripts/get_abi.py
> index 73613fb29c1c..2aec1f9dc5aa 100755
> --- a/scripts/get_abi.py
> +++ b/scripts/get_abi.py
[...]
> @@ -470,9 +472,9 @@ class AbiParser:
>  
>                  if cur_part and cur_part != part:
>                      part = cur_part
> -                    print(f"{part}\n{"-" * len(part)}\n")
> +                    msg += f"{part}\n{"-" * len(part)}\n\n"
>  
> -                print(f".. _{key}:\n")
> +                msg += f".. _{key}:\n\n"
>  
>                  max_len = 0
>                  for i in range(0, len(names)):           # pylint: disable=C0200
[...]

Testing under Ubuntu 22.04, where distro python3 is 3.10.12 and
distro Sphinx is 4.3.2, I get this exception by running "make htmldocs":

Exception occurred:
  File ".../linux/Documentation/sphinx/kernel_abi.py", line 48, in <module>
    from get_abi import AbiParser
  File ".../linux/scripts/get_abi.py", line 525
    msg += f"{part}\n{"-" * len(part)}\n\n"
                       ^
SyntaxError: f-string: expecting '}'

, which is introduced in the above hunk, I guess.

You can install Sphinx 8.1.3 on top of python3 3.10.12 using venv.
I get the same exception there.

Your change works fine against Ubuntu 24.04, whose distro python3 is 3.12.3.

I have not tested against python3 3.11.x.

It would be better to keep compatible with >= python 3.10.x if at all
possible.

        Thanks, Akira

