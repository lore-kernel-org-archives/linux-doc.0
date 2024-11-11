Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D5419CC17
	for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 16:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731344336; cv=none; b=LxbhufaWqCVx0T0G6JpPwZh4lMPwDrsUhycOV4pclaZLdFFAdYzBYHhF3qEzFHmoqEfbtLkzp2ixtiqPR2FgLc+vmVL8zVpbduRdYsfrdYsUBe5VHMacC1n+XXzbFBEEPREME6VjGcE/nmSwND3LkE//5dVlTO1wyCkOWvLq57g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731344336; c=relaxed/simple;
	bh=ivypo4WOUWvrQoT8LvfhoQXdUHZAGcirjU7Qq8uXEDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VaRSfhDeL3tyQ9cBA2fvIauOo1H7QLrCO3BHnkV1Lo0Z0NZFBSODlbCKzfMK318E/KDlaxpRSBM3o5oIdRh0ogi3SG53nvTX9YuW7Xk7w8CRNUu4Z/wAqaWmuB9iVB1ttkD82lK+xPImlNjXwdIV5PO9vtPJkdMhDAnrwo4JuX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qFfRve/8; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qFfRve/8"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5eb70a779baso2326701eaf.1
        for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 08:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731344332; x=1731949132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KRXBULia7z7TLiIcVJlhflmrSeiQ9JvMc8YTlhNkPiA=;
        b=qFfRve/8bS16sG+cwr2ZOGNEVaIP+QNw+E9oc+5WWgRs2YGwoVgc6JUZuTXZojLoyZ
         wUmFnTiZI5v49G3rwnwy2rt1tMKqvbwh/yjE2FhKKKHcbctJWiWWTqeDJLdemIXwvt3s
         LQeuHTTf8XtccSnMD05i7G3ljsmSJVp2s/g7yqeO+z5Bg1KqDRujJUF5sQcBkzZ9YdNO
         uSK0mzE23LAZNgnSSiVuQxGki+HYcuc1SWYxjkKh35Ff64CB0WniV+xUBd7JmTuG/S99
         9W+k7kInI2YRLLJ4nZX5SXtJkl28ivzomwUoHdZmBHmp6noj8OrP+dCCtpbJ2JfKi/CB
         OUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731344332; x=1731949132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KRXBULia7z7TLiIcVJlhflmrSeiQ9JvMc8YTlhNkPiA=;
        b=uLz45CYRWWJ0ZWBn8VjGKO8ojlSMVWkYoTWYCfLVA2AJUlVP2JNAKY1GQYFF72hbkA
         T30xnzeWrQr9UcxfNBbdo81nJssh8+QL5DQkJ9HixYEnz8MKF0RMkyJnneh1jIAgRA/M
         dZbNnAuQstIeI+0loZaqX8PS3nc+C0QcivVthfQUcDur5tU2G2tD4Bz17DEGkatUCC0Z
         BsW/l6YFXuUS43hrlV8MpnT6Zf21/nqrMost/pCmPOoQ6HBWJ27r2eUf3Q1OhBEOKWn/
         hedYiiHlsK6VFysnbPMXgokCx97pQBeNBXkfoDmHZzn1L42F1K8hjdg5fd743xEXWDEK
         WKLA==
X-Forwarded-Encrypted: i=1; AJvYcCUxwQOTowY6GHGdXhW989wU2ISfViuWhGYL3It5KzPl8DExII+yFwtpFvcg2hnhYgz9Ehd3ua1oPks=@vger.kernel.org
X-Gm-Message-State: AOJu0YycPqsZ/MlyFDlIN2PM8SDLehSV9zigE106WILFYKJZNTEKXulS
	1PLRDhG9lCAL4OYLm8X7APOgXf20sU8C3atJMLGz+75cVTggoPjt+CbG4eAfVDA=
X-Google-Smtp-Source: AGHT+IG9gcTtOrRel7fsQEsUJUIH1JT/nHiJykQWFEDsIURa3LShSYPJ/+NuIdbyD8xv6Nn65K9Mfg==
X-Received: by 2002:a4a:ec4c:0:b0:5e1:cd24:c19c with SMTP id 006d021491bc7-5ee57a4dc2fmr9267609eaf.0.1731344332455;
        Mon, 11 Nov 2024 08:58:52 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ee4970a150sm1987595eaf.36.2024.11.11.08.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 08:58:51 -0800 (PST)
Message-ID: <8dee409f-4b38-4168-9316-1fd15c97fc89@baylibre.com>
Date: Mon, 11 Nov 2024 10:58:49 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation: devres: add missing mailbox helpers
To: anish kumar <yesanishhere@gmail.com>, corbet@lwn.net, broonie@kernel.org,
 u.kleine-koenig@pengutronix.de, Jonathan.Cameron@huawei.com,
 pstanner@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241106235217.94718-1-yesanishhere@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20241106235217.94718-1-yesanishhere@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/24 5:52 PM, anish kumar wrote:
> mailbox api's were missing from the devres documentation.
> This patch adds them.

I've been wondering... Is it really that useful to have all
of the devn_ functions listed in the documentation?

My opinion is no, we can grep the source code for these if
we want to find them and we should just delete these lists
instead of spending effort trying to keep them up-to-date.

Or if the consensus is yes it is useful, maybe we should
add something in checkpatch to avoid missing these like
we do for MAINTAINERS?

> 
> Signed-off-by: anish kumar <yesanishhere@gmail.com>
> ---
>  Documentation/driver-api/driver-model/devres.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
> index 5f2ee8d717b1..8350a098f81f 100644
> --- a/Documentation/driver-api/driver-model/devres.rst
> +++ b/Documentation/driver-api/driver-model/devres.rst
> @@ -346,6 +346,10 @@ LED
>    devm_led_trigger_register()
>    devm_of_led_get()
>  
> +MAILBOX
> +  devm_mbox_controller_register()
> +  devm_mbox_controller_unregister()
> +
>  MDIO
>    devm_mdiobus_alloc()
>    devm_mdiobus_alloc_size()

