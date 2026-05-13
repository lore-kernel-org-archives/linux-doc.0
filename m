Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B746258CD0
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 13:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680782; cv=none; b=beU7ZlWrfmQJs0BK7s1ibjYl3za1q6YusPbhXslwEVpAuv7XB6VjUUl7Mu9NeSID6vzrc5+Wm+M7vTZmak6s8LF861+hpM5fhtm4I3U1yWHTgkF4SKDIJVebuvfMKdrWH1YWQF+dUNcEYADDL+mNlGbakV2+O+4XgAjLbmw9RMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680782; c=relaxed/simple;
	bh=WkNnHaheJ5ggjAEfjUtSR2NL0BoAilq/XapW6CyXmwI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QHKCgYqkPyIP/861vsK72tlwrmS6cvLuda0BXT8Gq1yWNCjte/CkRU9h+xh5ZYniREgOYg80xGLznF803+Wf4y0fuiMn7yqzncUUtAUnOupViSrb3k+Vvow6jBJcLNSMI3+IcuwAVH0pksEstzaCDhidUUJsz907NrlhnCRzdBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tut49SjM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tut49SjM"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso63098875e9.2
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 06:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778680779; x=1779285579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NsFc3nYv1Tw4//qtRhqmTwmES9zr3g4CbXHYTHnJEHI=;
        b=Tut49SjMwT8eSX72cK7FRC6PvzB/JTy0PwtU3cxWrkHwFa4Hikw66yWiM2Q9nKxzVh
         YOMDn7xNTRv7mPMKwdpvG6/f+7vnPeaxxixQ6NYUxECp7BinQ5v4Ah+Ec2jV+MhIUtGk
         6j8+7DrNyq/ysz3EiOXj3ts9S9voEWd4IIB7nWFJw9Liat9UDFKlr2hbvRM6Gdw5isXI
         1jy3fR9hi9vYD8C7muNNfKiJxcRtyHNaasR6MrCHxTOrydoKA42GoyzEAJxm8MM4WzVb
         Q5QKBwnPN7qg3IV1iSZAswOct3wAMnKIpajbqDc0pcT7NwcQ/1qPR2pb9cwGIcbU0A3d
         5A6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680779; x=1779285579;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsFc3nYv1Tw4//qtRhqmTwmES9zr3g4CbXHYTHnJEHI=;
        b=MaNGHeZOFSlzDwcsBvcUHiyvlvpQuIeADkKv6L298nOiFZqICc3cWV3uTZUIJ/nF9y
         K5gISere1VnveBxkWNHnnNTDOQggjijHsbVrU53diDbk2eH1jpY0cxeDWi2VMhprhp7T
         YwCwyENqq9jHaUdzMrm8kVXnlMj2z2ccGxrpBXTZHqIakMwqzMI62F5iJhrhWrCjNWh0
         BZZ0c0BhWWrLgc+Hsb8iCggFx0+tT+NLcapZKV7PgrUWilzxfEoUKSvt55dTSndNtH7I
         8GSSCSDkV/SgF9tLTgeNpIP46lONoc9EcmNW9Wld8A4xWE0T+IPTa92QrpMXMe8zVQzn
         np1A==
X-Forwarded-Encrypted: i=1; AFNElJ/F6lSlMG6WS9Fd26jp1hSNH8t9BjKZhioUXiYQ+XR3Hf7Y9ewUduNL+Xx2auPBaWRa8sIvZhB4Oto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6DJ01crENB2pEijjSeYEXa+rFFOPWUkYTBZE5jgjnV9u+Vm2l
	9TejfTy7HvfDhUtzlN6v1m1BZNG8JNNDJBN65fgemKWqjLiN9u4IvqUe
X-Gm-Gg: Acq92OGTAUiutwn+yjMI00YtF2Hdkly7hVzHEVV3c00i2/4izbSRxEY4u0JPY161DXg
	pvh1Bvpttlv1/FCUFLR1jRjCmVGmoiQ3snIY/kgmq8uCo4Fs8LxX8VC64IIjoWeHalFEGsCb3Dn
	R6bFb+2ilcpqa9Lt86I56EGLukqUG+gGut7ShwCFID7U5jOEn0njs1BNZiVw3DhYhXd8uJkA0FP
	Kg+h35dCIc1/sOXgozTO1JBJT1R1YE9EF+OCflGtzhhNaRImR/1wOqFD8Nec88gkzS06ayUCOce
	xFts/VI4q1KKhG+vCMfQaQUr6zo00wm2v8SIm3UlKC0uB4sEhfY+TUBfxh8SvopBceUQ4qpII3J
	ImsCg1OWCsJLCXeF/OFZAqbzj+l0Vz6Ny7ZZugRgncbzacONQoYvwoaEAF0C+/5nMqGjAXuhx50
	+ZbR1BIRU9/qQZRPnDP2Q05jz8rrxS8qM4/FeIaZDYw1Y6ypTjb9HEFghYIZ8=
X-Received: by 2002:a05:600c:a011:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48fc9a0e65emr53080375e9.7.1778680778790;
        Wed, 13 May 2026 06:59:38 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f442129sm42770485e9.28.2026.05.13.06.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:59:36 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <bc46423d-54aa-4773-bcad-e1c125086812@gmail.com>
Date: Wed, 13 May 2026 14:59:35 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [RFC v2 0/2] add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>, nathan@kernel.org,
 nsc@kernel.org
Cc: jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net,
 ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net,
 qingfang.deng@linux.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260509203808.1142311-1-julianbraha@gmail.com>
 <8fe7c7c8-00f7-4a72-a984-e929f71bec22@gmail.com>
Content-Language: en-US
In-Reply-To: <8fe7c7c8-00f7-4a72-a984-e929f71bec22@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/11/26 05:24, Demi Marie Obenour wrote:
> This adds too many dependencies.
> 
> Some suggestions:
> 
> - Use system libcurl instead of ureq.
> - Use libc getopt_long instead of clap.
> - Use manual FFI bindings instead of third-party crates.
> - Use the C Kconfig parser instead of a third-party library.

Hi Demi, thanks for going in-depth on the alternatives.

Unfortunately, given the amount of analysis performed on the parse tree,
even just replacing the parser amounts to a wholesale rewrite of the
tool.

I will look into the others though, just to reduce the amount of trust
that kconfirm users need to invest in the Rust ecosystem.

- Julian Braha
