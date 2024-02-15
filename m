Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D565129A73
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 11:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707996176; cv=none; b=MTGZK4Q95RWsvRwdc3K0C+FHHzIopDn9w1/yoM7EHTacqTRbf6Sy86+iWwQ2AUo9d0vS958ZHr4k5MA0GukfcIicwR3JAGNK0YFZs742eZ2JINnHT2sf6WD9b8MRplRAN/cQ5H2VPcroOjuOxR9QYicc7EiBl9IDwKlodFr9s2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707996176; c=relaxed/simple;
	bh=mG0LW+GpjdBaCjgCYourVXx6g/9QKI2UvOOKChi3FVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQK+7J0jTeDLCNAP8IKlq7SaIzEdik9TH8vfGvL+dF+F4dwKRI/KeUwXP819f+osJp7zwSdEqURBMwrBU4EUNqt+hRz72RzNYAxQXe73WxotFPicKAypYsP4ZA8cUJOadcO5+st4+sLwkqn78TgiFTmPnoQNg2L/wufv2fbkFlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNzyKAZ5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNzyKAZ5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d751bc0c15so7105735ad.2
        for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 03:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707996174; x=1708600974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZkOXC5c461FQNoS143aOPxpKt5S2ei7XBpsihkr4PNc=;
        b=TNzyKAZ5W2TUQW2iB5yMrmp3LnUp/yjdtXSrxIYpGOrb7TGuqnfnBFwtu1TrAdaCCw
         IvqPtD51GEBSXg6VsTEm7NDhcedauTk2i9o1chQrKp3nCrSjQVNqpe+syljPtrzBYyu4
         GQryV7/2dqZq95PMP5FFCwODanaZzDUFDB9+VUNG3Pr7sKD6oIKTMGi4hYM2pIXn9WzP
         j/pgzEvwqkxN2apCDBb7S62L4hxuTNs8Rj8vEuYpCRLvBw6tVk6E7qZiUpMhGk4r5NkQ
         Bza6m0OhIGhbnrIBceAXVmdDEEG9vunkeuQ3bpIDtH8uZICWu+xROdjumI5+6IIRdul1
         efXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707996174; x=1708600974;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkOXC5c461FQNoS143aOPxpKt5S2ei7XBpsihkr4PNc=;
        b=HYqsTz9vsvZHnMj1VRkc3CqLN75OdGlG9Ik/2GDZP2b2EWvnahYf7Ml19qTs2RW/If
         g2/qmHSuuqFCBMMafJihf1Op529y+fFtizDH1QcDXass3pDKypUpAvRR9ddqbaExp44z
         M9k3/a/PlXMCLZM9hK3UVAX6tfVDGKWztMMGzQNan+Jfo0dOnGzPWtmbLBaj/sNZEzW0
         CIx47bxLwsaVcl19inl5JTSI2fhalX+GeZ1JTOdet8tthAVjken5KBblT2Ht0MjgnaRB
         orpxn39J4lo4VSMeHpnYhKdqpL3zzZZLkmhDFsXKtYbK7yjpNOYtQQ78wAZVLROTWxHU
         reHQ==
X-Gm-Message-State: AOJu0YzFTNdQpLpsW7qXLPVJg153A+x5dBV3rG6gWxIs/FRfEBFylf1R
	JvqftjGwVL0ll/qqzuJ7hIOclJko9Ibr6B8oXD8Iux786/GjecSt
X-Google-Smtp-Source: AGHT+IEQL6dXkvfHnrl795waSaGDZ1qE3P6A6eh8YDfCF75xzLatDEcQS8Y2r55IlVFpEWPPDtqDsw==
X-Received: by 2002:a05:6a20:37a9:b0:1a0:762c:7caa with SMTP id q41-20020a056a2037a900b001a0762c7caamr1224080pze.31.1707996174582;
        Thu, 15 Feb 2024 03:22:54 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id c7-20020aa78c07000000b006e03a640007sm1084906pfd.71.2024.02.15.03.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 03:22:54 -0800 (PST)
Message-ID: <dae665be-d2b4-4e53-af38-b160787e7327@gmail.com>
Date: Thu, 15 Feb 2024 20:22:53 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: translations: use attribute to store current
 language
Content-Language: en-US
To: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <20240215064109.1193556-1-vegard.nossum@oracle.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20240215064109.1193556-1-vegard.nossum@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, 15 Feb 2024 07:41:09 +0100, Vegard Nossum wrote:
> Akira Yokosawa reported [1] that the "translations" extension we added in
> commit 7418ec5b151f ("docs: translations: add translations links when they
> exist") broke the build on Sphinx versions v6.1.3 through 7.1.2 (possibly
> others) with the following error:
> 
>     Exception occurred:
>       File "/usr/lib/python3.12/site-packages/sphinx/util/nodes.py", line 624, in _copy_except__document
>         newnode = self.__class__(rawsource=self.rawsource, **self.attributes)
>                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     TypeError: LanguagesNode.__init__() missing 1 required positional argument: 'current_language'
>     The full traceback has been saved in /tmp/sphinx-err-7xmwytuu.log, if you want to report the issue to the developers.
> 
> Solve this problem by making 'current_language' a true element attribute
> of the LanguagesNode element, which is probably the more correct way to do
> it anyway.
> 
> Tested on Sphinx 2.x, 3.x, 6.x, and 7.x.
> 
> [1]: https://lore.kernel.org/all/54a56c2e-a27c-45a0-b712-02a7bc7d2673@gmail.com/

Let me add a couple of tags below.

> 
> Fixes: 7418ec5b151f ("docs: translations: add translations links when they exist")
> Reported-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
Closes: https://lore.kernel.org/all/54a56c2e-a27c-45a0-b712-02a7bc7d2673@gmail.com/
Tested-by: Akira Yokosawa <akiyks@gmail.com>  # Sphinx 4.3.2, 5.3.0 and 6.2.1

        Thanks, Akira

> ---
>  Documentation/sphinx/translations.py | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

