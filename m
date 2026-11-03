Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793712928;
	b=sp2NEIHWkI5OUxTislc8bNZ1XInPS2m1U5m+imFRGv7/iUP2sQfO7ftTiG807w2+jjKX
	 OmrEQxylYFL4eSxwAyqrnjlbD8ydqoih5iZiPOcstxlr61qpDUmiCGJyHTDKwybH8N7Lm
	 JOGI8oywlPIAzFzAzebkzF2V0IDwky4/rv1a0Ar2gks1fCAqIF1Lk6Svs2wrUom7UKHH9
	 PWzKjSghawEk7kf4zTVULbcWymzD7kZYI4J3NSctPLAxvy5VJ2FxnNqG6eVC5c6RYBifN
	 qx2G/uDvmCfhNSZfj0FmRdXk6+DXpCn0HsNIE5U0Af1SF6ILaFLv1inabLymd1Df9jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vu0K78tWKPRRB4KpcMXUbkVZ5p3gn0R6DubwRz7qX/o=;
	b=eJrD7tZdNBw3igYTpqUC+ITHkx4fj3yOG9dec+j27eT9ib7WEl/DfUO440oLaWZS9wGK
	 qM81dfO0Z365hWelCVOmbSKW1hMdVVtGeNnaRBO9hM5mFih4vH2WNSiUBIaPuefe+Ly2k
	 T0mQ/ObORBEUD/Qxzb4LaJReaDpJQdnxHvY7FphPo2BPoolbuHx3UlBFsKzyACgVvl7uE
	 dApP44AZ+/n5xysAmafqpZ/vMzR/awGuRFlQ/DIVZvH3WFSSyvLfyCldbuc2llAkjX7VH
	 dqSBV7gV8uZMjacvfJkob4MXrThGX/TTgkQP2C2nuzxlz7esHl6HYsmiWRnPMw/I6Sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KW+Ic/e/";
	arc=fail smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE9B606A328
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 13:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDE9B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KW+Ic/e/
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5364d86f7f0so58020091cf.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 05:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793712927; cv=none;
        d=google.com; s=arc-20260327;
        b=BZM7ws+0nZIkokR0g4HVp3WHId/ZGzsR4H6bepbDute82oWaN51Xpq8iu7qPYnm6zC
         aWjItITBDrRogX+BFcYfmqbPPT3FkNlog7uIYgLcM3ladBKWZgshM780M9iWdsPSTkNZ
         vpvjgat27ixF6ivKxJwoWd62iO7J6M4vLC/lZ66Ih8UgfkraKv2wL0iLL+HO5TlEqbOZ
         vKbk8lIqlZymjH3bQW/GlQuPXafXR5PhEyRxcANGsYd87DqkUXe8vmJxnSsTsw0jpE/y
         AMJjwROCgv8Z9jfZio6NDhyiA0gebVMvzF9mGRrXJjRGRndJycof16t2hmWMo3X77OQE
         aqiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vu0K78tWKPRRB4KpcMXUbkVZ5p3gn0R6DubwRz7qX/o=;
        fh=CH4JwKxb95Vu+tKc/1fsYligcKieV1OQcno5qVQGyrc=;
        b=jXAguA1sPPH8Sfk8AWrtVae+FJ1QO96JZ1ODVhu6oPt2lSrdjc0FC4qPENvPOb3HfW
         34YxfWC58nG+qT+gBpysNRiX/PDI+sn+2WiujhbtyjtDsNhu6NePI1KIoqDVw9QcvOPX
         jbXSSFzpNUc4xW2fWls9WT112cDs8+DBCFXaI2+MI16xJkanFb89LSgRY4dmOEcMKoY9
         Rq+3pGSBmexbPwX8mnFfSe4ZfypgJfGE3EcbYKSi/jJ1f2WEpp9PwzuxmbmKkIhXyboM
         RaaPCI+8Pznos26FJxGuy+eQxbhArnUHNI4O40VrVDlU3f4TWdnfIoPQyn0s6P7Iughq
         cvUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712927; x=1794317727; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vu0K78tWKPRRB4KpcMXUbkVZ5p3gn0R6DubwRz7qX/o=;
        b=KW+Ic/e/sanwS94J8eBr1TZtKcPHFbhLU621ClUnKbdA7PM4QVsM+UCClG5Ij7V4H3
         /xjttHW1kna8fide0hzK10prlA6hTgMCGXVN8wnPvOr3tDW9WjTEvmrzchgIWPiaaFsv
         PqNd6IYnsQllyQeS7Z8Os06TFz5INzMCj8uWq4aiRFxkfUAMA4DyLmUFBLExy1sjzftg
         avF5Rx+U9UzsJMlfgPntQpQDctWjBexz4LMI2j/IjVamSsilr0M5W3Dl713x0EODZQnE
         lZL1djAtXuThvrmRpSP0i+tXFvwqWUH5+sFbHYrCCr+2ODl2Un36w0Ud4R12RFfZKy9j
         6n2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712927; x=1794317727;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vu0K78tWKPRRB4KpcMXUbkVZ5p3gn0R6DubwRz7qX/o=;
        b=yA0ISyNJ3ZWzbIdEYiSUu8jXXa9hKD4jwwbdynYKCMKz3tO8lQX9rHaZFZ7HXvCDfj
         t26s/uYQiDHi36nYHbFU2OwZiLZ5jCuAUbFwN6gx9YvrfZ80R0KaGH3H28lomuSNTjad
         068lJI/GVNFxC0Pltf2ectcnCC5KGPmB94jh4SwiAXGH7TmoBFStnA93o0nrc7nKXmRo
         T6f6vA1okxkgA2RZaTLVGsQrvnSCsJhVfv7WsDkdKX6B+7D0r9vR9Mdc86/uOWcTLmEY
         4KoTgxEHNQp+gyb+eegmh5J3+IVX7sg+JdBRwxtp7UDswMGT2a4p0bnMX+wCUXqMGRct
         BzjA==
X-Forwarded-Encrypted: i=1; AKwUvBxEvceS3WEWz7OmpYzkD2ayNLI8Y6Ttqs1ZuO8KlWfitQ/fkt4Y09enaOkZ6gZEkSm3yIfoIy3Iuuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YBjfuGfWdPcfWz+913FTLvQ4MPcnL+96m4G6v+PEljl9BgDTN
	AUtphnsbyLPMhz+Gp5Nhs8XdjyE0g0445F8bpfzZdoQhy/8IwzCE2l4xEQsca1Q99wLVvgDqU9e
	7a0cv+Wn37P0uJ/2oLnQRL3ed8YykSbk=
X-Gm-Gg: AYBFou0FdH4tcZoq7bBLTQJ3Yd37AuQmkHxeALJv2q+zERy6xA+qXZi/3NIPA2Au6E4
	8/dT2qYIV+t7fmQusA+S4WHBQjaG4RccfFiXymIZh0/b3vGwM2YpekhSowv384nKzGXdAq+gs3M
	L4aY0domrvDhKgu4cXRX6kWAdDYOeUE2NlfkwKYuSAa1Irsif29L3djzSAf84Txbdkh189wOA6M
	2eoGc9rZ7RaIqt1Cqgc54hOT1XOWLdM+6JZws0EHrLTXKNXP+c3O7sdf9KQ7NUu3yMUpWT3LSr1
	ck44vU0cGeAfXSpAEDRWb/7bpmx3MCVqw6HCEm09N5Pvgl+trZh2MHM5x7GVuHIZmyhEgyAgio4
	KLBH79PZisqr65e5iqBhWfHdWem4g2Aco/JTnCRYfqt5cmzzKt8s2BXsCT1n9Xa0gzOIo3IGpd4
	I0skob+a2frw5RgOHcRPtQI63UWCCKm/YwZqST3vmW0ejNqEt9CrW9XiyxebRAY0th7BvwQr83s
	7B1xc0g1jIFxde4/JTFz6U=
X-Received: by 2002:ac8:5a04:0:b0:535:25db:17b1 with SMTP id
 d75a77b69052e-542b62a459emr219845171cf.17.1793712926548; Tue, 03 Nov 2026
 05:35:26 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793375024.git.dzm91@hust.edu.cn> <5d3ab0955918e70da23a93660152fc04dd6b6913.1793375024.git.dzm91@hust.edu.cn>
In-Reply-To: <5d3ab0955918e70da23a93660152fc04dd6b6913.1793375024.git.dzm91@hust.edu.cn>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 10:35:14 -0300
X-Gm-Features: AclHuK8S8korg0lo55k0S9wVI1USPrHDOOcCDOlEptoSQCalIEkoG6x1QaJd_rw
Message-ID: <CAMAsx6foaQng7_Awy9qBLtAx=8m2Z3NU_cU3aDNdhW-cv=x91w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] docs: Correct comments in Sphinx dependency checker
To: dzm91@hust.edu.cn
Cc: corbet@lwn.net, mchehab@kernel.org, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 30, 2026 12:56 PM, Dongliang Mu <dzm91@hust.edu.cn> wrote:
> Correct typos and awkward phrasing in the module, class, and method
> docstrings and in source comments. Leave runtime behavior and user-visible
> output unchanged.


Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
