Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5713FC7
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 02:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707965019; cv=none; b=SKklpX06nsYB4ZajiWakiYYzq+8ckC3Ia/spyv8wERYt8/4Ggbtmh/LF4RczFTj2bZfJBskPT4kmntBwVYEpUE4bxc+YYmKgjAsJTH1vIjr7v39pGYMdlYLmkJDYoLXMC2SI9/UmLvURhrVxzersyDtx8ZUvWZjmmfux5JOyitQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707965019; c=relaxed/simple;
	bh=G10d7raIfR4Yi+lsaCDAnUnnqWmwrcy8RZx/DcWTnDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwlxRUKbjRSOrqff6nKFH2cXTukot2YoPHyHl0wo9cqTgxp9VyCp9Ksj5DwXpJ2tljFpzYob1EFihcGVmr0HmXaowVZ2kriYfeJFcsJqDG1ElrpLraMwUlcKPs2UdJ0s8hk8DUBAgIGyGAJ8FkslE2j+nlOP+Vv580McqMmpXL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5qrgTxV; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5qrgTxV"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d8ef977f1eso3534285ad.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 18:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707965017; x=1708569817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=78Wf/iZ8RUUmG1Ne7OtvdNp7HqBIuuCroCCWtmHhnf0=;
        b=S5qrgTxVlTX67tqeZCra5r0n3dpngNccil9QuiuJtEXRKsuN53kkKh49DNHaP8V9jo
         TFSy4Jt/C8Esg1tT1kcPuULe5CKoRH6DQcxOAV42lotpoRRVd8+BUF9KMWLGSTq9qeJL
         1hgygte+VrYi7omkT2BE30C0Jy7Y8ueaMdBvwcE6G6C9cUEavjuWZJzuOwVhiPdZsLhE
         TrAhAJbwxyjTwe8CATs7pB1OQNWlbjSHp89jt6k/ZVlVch8fJpo1snLmaTVrpKBDyxbg
         cTOnMPAcgo+EHUl8tUQYNdzbAr+uFJvzifvCWXWVVjvmSV184xGEyH9nc9YDnI12jncY
         9PCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707965017; x=1708569817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=78Wf/iZ8RUUmG1Ne7OtvdNp7HqBIuuCroCCWtmHhnf0=;
        b=BCNCMAGZzOfSU79LbCQTFee0YIRf7rqLTfCYWW5qIPmgPKzKxoibMgtoUxedjiqnUc
         d2LtaolC9p9HoxvokcxC/xxkU11LHj3rZxRg0KpkyWSA+27zxs9HikB+UUO37+ZCBN+z
         BBEa8AwBRdIHd5ghIHzDGTJoTqFNmJ8+8igXBL7qrjct4/EAspmlrl4rMV1oApjTfxE+
         9R7WyIrfvV/TrEm4zanenKSBcKConByi1jZ4ccVYIaHyHgxTNTFHemAyy/YuR49V3KvU
         x44yhoXDKACTSFF3VPImpmKp42Cdk/IhT932WcAk4BZ5cyPg5oJdb3pVeZgozpNcvsZH
         9XoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUps6uIqMc+lCs+NiERv/59kaMW7/NwMMo0Hy4z+eyqspzKXVbUQOFiBw80GX5riul1zqNP6dlZ9H0YWH2/ZdaXzpqmlhcfpi7x
X-Gm-Message-State: AOJu0YznykWnPL5TPQ2UPie2IbZdhBA3YvJ+gMrqj/J8U4PQaH3xQnJd
	xSoNqr0+3bUpQlgaHgTmtEiclr7yYaUJUuGKyjDxXGrk4T8GYWG2e7cHLnbC
X-Google-Smtp-Source: AGHT+IG3U3wzDjoDjaOPki4JoqjCvBXdoroul/JAesHH5wNkEO6t9DiPnh8p/lim1xjmCcydK1hDRQ==
X-Received: by 2002:a17:902:8649:b0:1d9:5b89:98e4 with SMTP id y9-20020a170902864900b001d95b8998e4mr439009plt.41.1707965016767;
        Wed, 14 Feb 2024 18:43:36 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id kv5-20020a17090328c500b001db57f03e19sm146254plb.4.2024.02.14.18.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 18:43:36 -0800 (PST)
Message-ID: <aa42e525-3dd5-4cd9-a8c5-6e9d92c3ad15@gmail.com>
Date: Thu, 15 Feb 2024 11:43:32 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Only load the translations extension for HTML
 output
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Vegard Nossum <vegard.nossum@oracle.com>,
 Akira Yokosawa <akiyks@gmail.com>
References: <87sf1uy6f5.fsf@meer.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87sf1uy6f5.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jon,

On 2024/02/15 8:25, Jonathan Corbet wrote:
> This extension brings no value for other output formats and can create
> problems with the pdfdocs build.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/conf.py | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 5830b01c5642..6071d3e24375 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -55,7 +55,13 @@ needs_sphinx = '2.4.4'
>  extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include',
>                'kfigure', 'sphinx.ext.ifconfig', 'automarkup',
>                'maintainers_include', 'sphinx.ext.autosectionlabel',
> -              'kernel_abi', 'kernel_feat', 'translations']
> +              'kernel_abi', 'kernel_feat']
> +#
> +# Only enable the translation extension if we are building the HTML docs;
> +# it brings no value otherwise and can cause problems.
> +#
> +if 'html' in sys.argv:
> +    extensions.append('translations')

I tested incremental build of latexdocs against Sphinx 7.2.6 as follows:

    make cleandocs
    make htmldocs
    make latexdocs

Without this change, "make latexdocs" completes 2 or 3 minutes
quicker than full builds.

With this change applied and against Sphinx 7.2.6, "make latexdocs"
slows down significantly (the same as the slowdown of incremental
builds reported elsewhere), and it ends up in an exception, whose
message reads:

--------------------------
WARNING: unknown node type: <LanguagesNode: <#text: 'Chinese (Simpl ...'><#text: 'Chinese (Tradi ... ...>

Exception occurred:
  File "/home/akira/sphinx-7.2.6/lib/python3.10/site-packages/docutils/nodes.py", line 2068, in unknown_departure
    raise NotImplementedError(
NotImplementedError: <class 'sphinx.writers.latex.LaTeXTranslator'> departing unknown node type: LanguagesNode
The full traceback has been saved in /tmp/sphinx-err-3inve171.log, if you want to report the issue to the developers.
--------------------------

I don't see the error against Sphinx 4.3.2 (of Ubuntu 22.04).
So it is (again) dependent on Sphinx or docutils version.

For v6.8, how about loading translations extension with
Sphinx<6.1.3 or Sphinx>=7.2 for all the builders.

Note that Linux distros to be released in a couple of month,
Ubuntu 24.04 and Fedora 40 have Sphinx 7.2.6 in their pre-release
repository.  openSUSE Leap 15.5 already has 7.2.6 as a package
of the name python311-Sphinx.

        Thanks, Akira

>  
>  if major >= 3:
>      if (major > 3) or (minor > 0 or patch >= 2):
