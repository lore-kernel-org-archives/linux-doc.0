Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D89020DDC
	for <linux-doc@vger.kernel.org>; Thu, 22 Feb 2024 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592867; cv=none; b=hK18eM2s8XgBnFr4cjPQnPjH248Fz6jsf+t4gDKB05TrV+Frbun3IYV8vcs4X+qgV8ETjpeOJ9llGIxnzftHNKmkH8e3AbcL65+wp1NLJwH4R/uHn1jIhGclLZnabm5VXWxehueRPkTWmB9UZF/eMVi55EF8dDsoEFkCpGQ79AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592867; c=relaxed/simple;
	bh=+RJ6JJlhdRUOyecavVVc+K0/Ub9vu53tblV/K1jtx6A=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=UkIuIWwN3g9ZRx7QIRoVp4Ay1+doPmjvk1h5QYFDsmuI/8LOIezWr4SN/9xF9lw9Nrbe22lkDn2mp9mzhhD2dNeR7xsC9vun5edolAsOwRujcedVtIS152vHp4yusmtcc0nkltdOR1ixDSBfkeaLA4G4IrAmsI+s8cPyHb30vJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zse4zbUO; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zse4zbUO"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3651c1e1022so19612005ab.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Feb 2024 01:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708592864; x=1709197664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/7NHxM9xIIpqC9vpo7adR1blpbptZ696oASuTklhGE=;
        b=Zse4zbUOP6uIGkxh8x5vi/l0gwv/buHeI1+5xrq395L5pCCLz7+U9XOxAAjesR9/iU
         XBpKF0kQFgvVNM/xRWMKgu8KFC7FDLWZiQIiAAJlSpv3Cu55wctpOcAJvZv1TtjZXm1r
         yJJz09vs/ykgfkFyYEkxfXUs9urXSFpwmX2r+7N1bkAk/0dHZe1BT88hVy4+CXUUMNNo
         WdlioN3k03/hVh63g+G8z7Gp1hi1RuEvlfWkfchVKQQ+S8+GF7RGaAgFrTVl34XGM8n7
         dc19AoPmIFwezHDEk+TuGWQWRJUAKW7euEz84XhHRGaK90Tg+EeCLZnnNYQAFDdt98Ww
         G5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708592864; x=1709197664;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/7NHxM9xIIpqC9vpo7adR1blpbptZ696oASuTklhGE=;
        b=O4R9EW5gsH9XhI5ZI8RnjNSJVefSzvg9IiRPUyX2kUnoj9ACPushNh55y0KkkpLZCn
         WAjqVYAzLAQddwTVY+QNfCNEHKW1D/z6LAc57WT6wmhIOAj9G06WPRNFuwi0ItxQp8+4
         nHPcMQ0odvdELsRp408MyIZRKFki4N8FB17x1eWClEkZlbO7Cpwm2DzMwHNi56CLrkg0
         gPK+OFFQcoo+bVAODxd2HdZakxbFW1OczwOpJuSGOrTgARdUbh1eAdnrurFRVpPwfrDM
         Ij5xzXpbwHHdBVARjBp2uA+b9QbdSh1irRekt9qM1BQLTwnE2y6TxXA5me9NasyUhtlA
         xGmg==
X-Forwarded-Encrypted: i=1; AJvYcCXji88Zq5csNvpj5zBnuVWRGK76mObsjtJeNxUgHwjynadFt9mR8+XuG/tWOE0OYhHb79/LkBrUGZRJOweybsfvyYKNgJtCo3Tg
X-Gm-Message-State: AOJu0YyVTwk3/SgBroHemCUldlIYnoVWak781Aq8EXo0xrqSD8ROccao
	pmTe5J5rPQ7rV40NKKrAxGapGJ3KqodR6gngEWqGDOxkK8B3aChe
X-Google-Smtp-Source: AGHT+IEHa0YI3dtGgbeXe98TCYIdNwLw7s2Nc6iz/DJArxZiAEHuHmtJYjQ1BEgskQRGFT3fjD+4zA==
X-Received: by 2002:a92:c147:0:b0:365:29f4:7e27 with SMTP id b7-20020a92c147000000b0036529f47e27mr11261034ilh.19.1708592864636;
        Thu, 22 Feb 2024 01:07:44 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id y5-20020a634945000000b005dc48e56191sm9796611pgk.11.2024.02.22.01.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 01:07:44 -0800 (PST)
Message-ID: <a6446508-049a-4154-82ff-5d946af6b08a@gmail.com>
Date: Thu, 22 Feb 2024 18:07:44 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: relect@bk.ru
Cc: corbet@lwn.net, linux-doc@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <1708585803.600323099@f111.i.mail.ru>
Subject: Re: make pdfdocs
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <1708585803.600323099@f111.i.mail.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

On Thu, 22 Feb 2024 10:10:03 +0300, Иван Иванович wrote:
> Good afternoon, yes <'maxlistdepth': '10',> solves the problem.
> 
> 
> When building, the following error occurs:
> latexmk -xelatex  'translations.tex'
> The log file is attached.

...

> ------------
> Running 'xdvipdfmx -E -o "translations.pdf"  "translations.xdv"'
> ------------
> translations.xdv -> translations.pdf
> [1][2][3
> xdvipdfmx:fatal: Invalid TTC index number

I think you have a variable-font of Noto Sans CJK fonts.

Please see this message of mine in the lore archive:

https://lore.kernel.org/linux-doc/64908dd3-17c9-47e3-a076-d78105fb823b@gmail.com/

You have two options:

1)  If you don't need CJK pages in translations.pdf, removing texlive-xecjk
    will surpress CJK pages in PDF.  (This is not mentioned in the message above)

2)  If you need CJK pages, as mentioned in the linked message above,
    removing google-noto-sans-cjk-vf-fonts and google-noto-serif-cjk-vf-fonts
    should resolve the issue.

[...]

> Is required to compile the documentation since sphinx 5 or higher, I think that 
> Documentation/sphinx/requirements.txt
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/sphinx/requirements.txt?h=v6.8-rc5
> does not make sense, since Sphinx 2.4.4 will not work without errors 

We are aware of the breakage of requirements.txt.
This issue is not addressed yet.  Honestly speaking, we have not
reached a consensus on the way forward.

Sphinx 2.4.4 can still be installed by following Jani's suggestion
at https://lore.kernel.org/linux-doc/87y1cgm1nc.fsf@intel.com/

Thank you for testing documentation build and reporting issues.

BR, Akira

