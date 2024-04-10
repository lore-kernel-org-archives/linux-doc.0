Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B629723BB
	for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 22:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712789879; cv=none; b=kCIuBYABmjC0Ft347F+X2bC0jh8uZElgb+fjpsrQ6Xcm0KruZwYyLLHoeU+JYrjBpYM5qeCGxm8miZf7lZM8I1HIbPLcaDGnbIdxWNAf+z2Ui1r3G96LPDByY0To+qtXorMFs27RIcrJn7+nACOQ+MccZMLgO2lLTiE1LmhFcGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712789879; c=relaxed/simple;
	bh=jRCAbewTab5d7SfO/16oQO7l7AL8fBRNoMvDiU5ZQhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YolGFz5D5tIiM2Jk1q+IO2WN/w00lHbCI4of23Y7jIWk47baOyNnqGEwOcmFEuSFofGmWAKMuzOtqBwIcBlBr7q/pdCfRF7pyP9W+lpFDfr1yQVTfT03QYnCLXI7Pusx5Wco18Nl8RnxT57rrIhRt4+z6bJzAFvVCyzcuTXe/Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmchxNjQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmchxNjQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e4266673bbso33681755ad.2
        for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 15:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712789877; x=1713394677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHlAlwRf3gJlxo2hOZ8UmyoR/vxdkzPo/5DBHCVpdgg=;
        b=QmchxNjQRtkwJ3a9HKio7hfp/+VQk8BEbIx8fvszYnnqCzacwVxBRnur7ZFA78TWdk
         Kzizr8fkYhE8pHob/it9BYqcbS8V4loAg68TTWWJ3epIsFgGyvwd/pIE0N0IhIRsfK4V
         wdCGLFmpgZOF8Wq6fye1YgmgBcOe+ncZdUW3ykQwjy+bBydTTXrlEgetze+Mb8ToZy7s
         hJzJpp3nWXSlmnF9zUKzS5Kk3m9+Pj68KzAcw6w5bUrBmAgV9Kw+gpqHQrWDBeZRGJhG
         ecV7yYezbVrLxbDePIEt8tRw8i5I7fS34yYGdT4Q6Yut6qf+/ZgW1cUEglcUNISAUAsW
         xNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712789877; x=1713394677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHlAlwRf3gJlxo2hOZ8UmyoR/vxdkzPo/5DBHCVpdgg=;
        b=Xs0vbC1rcKCoVgNpdFmKzVHgrZ1vMd56x83wFnQGGe1+otMHJ3CXN92ofHTBpZ3ylO
         LScvJFWV8yiqeEb5MketJfdUSIMX8QR3j6wpx7U1/LDSWeiI5frZ7p3cgJPWfru8LUkp
         tWiBu85H/1N5LhBE5bX6RfJXkSwBLgvNVXYSq4MgNLlP3B4AOCW5/XHfpULRH26obrvn
         Mqj2qJapzp3uGjb20nsSPy4S5Oea6DWrDYxmpQGjEtiUNDoDDkqA79GfSoHic2HN9jwj
         i/apPSe4HWZ67XO6d+tWK+VJkVJwag4nGp/SIIl1e7b9YP5h6hIB6PwI4xhIhs866ADA
         N8Ow==
X-Gm-Message-State: AOJu0Yws/j8iw7jChHXimSiAcCZdbejapI3F58jyk79b75h9nMT5gMkd
	vfo8NRUgJyOqPSp7ZfzwiCBJhm887TJ14ahm3yn6ZmJM5XyEFBO4
X-Google-Smtp-Source: AGHT+IE8AMQyXK/aTlTEYCZLdpq1h0qxn9bjDMOFnJ4PckS6yS6Z7Pca4f1c0f8J5QBQcmhemrKa3A==
X-Received: by 2002:a17:903:230d:b0:1e0:c0dd:c5eb with SMTP id d13-20020a170903230d00b001e0c0ddc5ebmr5154623plh.9.1712789876908;
        Wed, 10 Apr 2024 15:57:56 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902a3c500b001e290812d49sm67258plb.226.2024.04.10.15.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 15:57:56 -0700 (PDT)
Message-ID: <02ef631f-a53a-4795-95fc-e97723386f80@gmail.com>
Date: Thu, 11 Apr 2024 07:57:50 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: Detect variable fonts and suggest denylisting
 them
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, =?UTF-8?B?0JjQstCw0L0g0JjQstCw0L3QvtCy0Lg=?=
 =?UTF-8?B?0Yc=?= <relect@bk.ru>, Randy Dunlap <rdunlap@infradead.org>,
 Akira Yokosawa <akiyks@gmail.com>
References: <20240323120204.155678-1-akiyks@gmail.com>
 <20240406020416.25096-1-akiyks@gmail.com> <87le5lszxm.fsf@meer.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87le5lszxm.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, 10 Apr 2024 14:52:37 -0600, Jonathan Corbet wrote:
[...]
> Meanwhile, it occurred to me that it would be good to let the Fedora
> folks know that this breaks, so I've filed a bug there; we'll see if
> they have any thoughts on the matter as well.

Actually, I opened:

    https://bugzilla.redhat.com/show_bug.cgi?id=2271559
    "google-noto-sans-cjk-vf-fonts is not compatible with XeTeX"

the other day as a bug in google-noto-sans-cjk-vf-fonts.

In response, Peng Wu (one of font package maintainers) opened:

    https://bugzilla.redhat.com/show_bug.cgi?id=2272153
    "xelatex doesn't support font face from named instance of variable fonts"

as a bug in texlive-base.

In #2271559, I was asked to help report this issue to upstream XeTeX,
which is in my to-do list.

It sounds like there should be a way for XeTeX to identify variable fonts
and ignore them.

        Thanks, Akira

