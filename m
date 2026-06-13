Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9824E342CB3
	for <linux-doc@vger.kernel.org>; Sat, 13 Jun 2026 12:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781354925; cv=none; b=JhofjCMGdx9KnuZhr6+UmyXYjGQfJywGYrnZWTw13fO9cmuIX39hbK+QIrhwQ7lDEMcArd/NtirUKhBsf6V/HTriOs0PPhzCs+oNb4NXxGUSJXda35hnYwyiJ4McQFHjQcCzhuiY4SmV3YHvz778Li2ng/Rac2i3djF2FeyyIAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781354925; c=relaxed/simple;
	bh=swe7tHyGDAS0LgqXY5o7c8Rigm+T1uVKVB09wXPt760=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U9EGZwu9Xs86RtU5yGd0DNh0Up2rWuUZWFlKnnJazNkbO5xVH/6TqBkS/3xsMTivgzVgcNa4UTdaaAyBFLzetlP+SBQuB9RxkL5KeqvHcLM3Zi1rA3DoVgmYrm2e6c/SpqRSA+I7FYNao/t7TyocoiN5Xuf0FEoo20QljtmRbkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vy16bRjB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vy16bRjB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b9318997so13432025e9.2
        for <linux-doc@vger.kernel.org>; Sat, 13 Jun 2026 05:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781354922; x=1781959722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=X6siKJ1w+rEnl9pZ3MoidjUGxh10zTJghXGxeG18mLU=;
        b=Vy16bRjB+R+62Q9Rz5R6g711rQVmGjQSQDZGNRIHGhhIgxy7YjeSHu8hIMKTvwtaPJ
         Si3JV7Qiw7yoNbE1yWKIum/52613DnODAwrvYY2J697Eh2QdWOnj+CH7OzyDh2zkNZhr
         ABPUtMlPba6deHVGe7HBqTfP0cbwKzeaDqcNfbzqrj3G2F4QtxFlyl1nQuisqOrvwMWW
         hI0SXjsuksdTO9fVu2JKZnm6bcw5K0llZlKEel2tIqciA8TuyBfFKg5vDvxQFb9GRw2r
         WR9758nP/GvYpAq2S7Yzco2x+ECrxEH3RtXMdTeIoxmoADcccZY8vNrq7OF9/dzIsxCw
         gozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781354922; x=1781959722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6siKJ1w+rEnl9pZ3MoidjUGxh10zTJghXGxeG18mLU=;
        b=tMjPK7OlCtGQTtDCpe2oP2vp/7+LjnH9ABvmwjxIn8kjHYjXVpJpAVIz/Nc+jECVJq
         QTzPyKn+pAP+8T+ZoSgTqdEFnv5MkRKbz2yAeZ43EGYfUkZ3sXHroH+e0F7ZNq62AbPJ
         Bc1RDifm199/4JSPa9EoMplWB02GxMpZnAhze1CNN2L7fhEkRd6TmWKiqdCSO3hKliK+
         EdIjRpeYmFoApfeO/kRW9xIjf6aEN0DPOpJ9WUFPsOVmkQIkeQmTLGtc2prl6JYhomfR
         sRR2lJKQQsWyAH4tvql2S+0r8+9FneH+PF5xR5TiMXC4eUeGJDbWqa35dxfMzB49BMgl
         JrRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ociPIArGcOj1zmohv99CCrbYYr5C6U2f25S1m7lqVH+n2BFljV349Nh4+CQGpV8y16DoNnrUyJJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJad6BNil9UUT/G81jgnDkbpbb4ZJzC9dpth7QyEusZ6j3bRw9
	WQ9XHGHXaXqMg3dove/LkysLvKV4MFUCLvKVvhYn7AlULoxETC1s/sgq
X-Gm-Gg: Acq92OHhfhUmXFeHJw1CMwA86y/UTDyPeKg+swR1UafMW5KFa+S3KvMeVogNfEx/4fK
	RUeQOuEOJH2mBnOLnYn2/egcgmjjn/JMFbT3aKzVrqzT2wv2uWLbphHo9GYyHk2m3+NGCTFzm33
	idtABhjDTCr+JoYMedy1uBF6pqCD0SyvPQWOHTNKZjfI/D/c+F/rSv/S7i6gHI/yWZI7EK4U3Tg
	OBTKt5V6HAg2Be6xgHmcdjAjWYr11y+qQm+4bTRkhqWZr7SKIdlewyDi9gJgfmaCbzpmyAgJez2
	Rmy2ch9d6/APbn2iPmxZcqDLSvRolOAaNXgzGVaGd4hCbNbaIsn/9QaS5xzwGLWIzgS6IlLSMeV
	YziRKhtPhBBElusvMGpvkpSc7VAJxkuv93rIToNMjVrQJ/HkuZNBxRA3QrqyFhDCk8oBXni9A2z
	/5PbVEZ5RSVu8Lhe05a+VAfTQHMac8+1OwFIR0SaBMy++S4iPyk+SdZd1I50tsiCGr5iCRnnP4A
	XrQ4MtDVGYzeal+Mwg=
X-Received: by 2002:a05:600c:3b16:b0:490:bb45:79ef with SMTP id 5b1f17b1804b1-4921fdefb5emr37427245e9.0.1781354921745;
        Sat, 13 Jun 2026 05:48:41 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm88407955e9.2.2026.06.13.05.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 05:48:41 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <7206bc69-c35d-4ce7-8083-ae6586e7543f@gmail.com>
Date: Sat, 13 Jun 2026 13:48:40 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kconfig: add optional warnings for changed input
 values
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260611060000.23858-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260611060000.23858-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/26 07:00, Pengpeng Hou wrote:
> When reading .config input, Kconfig stores user-provided values first
> and then resolves the final value after applying dependencies, ranges,
> and other constraints.
> 
> If the final value differs from the user input, Kconfig already tracks
> that state internally, but it does not provide a focused diagnostic to
> show which explicit inputs were adjusted. This is particularly confusing
> for requested values that get forced down by unmet dependencies or
> clamped by ranges.
 Hi Pengpeng,

This change would be a huge QoL improvement for me, thank you. When I
generate config files with external tooling, I need to do this check
manually.

It would also be helpful if config options that are removed from .config
would be printed, since there are config options that are only defined
in certain architectures.

Tested-by: Julian Braha <julianbraha@gmail.com>
