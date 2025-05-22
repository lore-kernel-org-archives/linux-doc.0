Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575DD29A9F9
	for <linux-doc@vger.kernel.org>; Thu, 22 May 2025 22:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747954490; cv=none; b=kgs4NlUZy8M7yXctOrY0SXf/WLvf0EiNyAEyADXn6W2u1ugvwZEF/Ancb6WOWtLLmSz/VLjsyLrh7Nq0i704rnwGeE91XcLY07MSS7XXpbl+haNhgvTfyhbbhc+R1E9VHc0dhOdI6+zrPfLYgoVXKjFfzjKI0I4YFfRZkfChz9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747954490; c=relaxed/simple;
	bh=aFG7rIGqyYNh3TEGcd5rTpgZX4UCS/qQGPWwJMcx5FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGaqxax3gbvWd7sgCDflK649nW6bcEwtzFGJYD7wv4A8KGh3U5ap/vTyCLBfBfn41Xzro3Oe0bY+6jEqeppgSUvSjWt6IS5E0XodGpRazVVnNxQwhY0b9iWJQLy1LLSNK7p/MVBWqVN0RYqRpn3yu+55avKrQtkvJrM33CtVFHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BiQJLzBd; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BiQJLzBd"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3dc7830a386so15994925ab.1
        for <linux-doc@vger.kernel.org>; Thu, 22 May 2025 15:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747954487; x=1748559287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mvrN/sQbY0yAzGuyU4YJyXr/WHG+ilXH+8aRN5VOXus=;
        b=BiQJLzBdaNXNgNPoJ/m7fsGMv3nVJVaMOjG4IDw9OFtxF8hcFJdtyzk3MqyFzsEFR0
         quFmyJQCuGx/aAP5+xyWF9jVuDc+sKvaxSjDe3kdfLj6j9MCpe/pjlupmh/GHD9liOYC
         yYVjZgcTTxAZxXy7emY7MctYGscTcsvGXMs4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747954487; x=1748559287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mvrN/sQbY0yAzGuyU4YJyXr/WHG+ilXH+8aRN5VOXus=;
        b=PIurfsoMaGx5wE+jNAyJEbgKJWbb7GwjKoi3jNUm1iMfeFHZ0NrePlT3GOV6dtaVCt
         reZPURqIVXpLrPemUSD2ksihlyQlxkeoTTFFoYeF2cE26LQiWWHnwYAt3vsZO9TrXFNe
         pvf+Sztoq0CHx9XdDnrWGZ9AffS6rps1bYo0g68xV7MGFCjCP/kSoHyLSoPTRAQFTtS0
         W8JvzmK5EsyNSnRWA5UPEKkcVv9v5gRE9tkvBuotCJ108o8HqwvYgFWMaIzlcbrLy/p/
         s0HU+WOcJTlYXrkA9wJZrsc+t/FqByawtF2FS++clwbkIbpL95ZKCCdBrGF6l8NSZtu1
         tdGg==
X-Gm-Message-State: AOJu0YyXFCEdYs3P4RtAVmeEZrSgJ+MAl8V+IRjpRFQOz6U/bdtbTixh
	gqoNryPl0I94zFAaoIqeoyfghhLrHD9AuuKZVKbJBy6BcUHfSgvFAKSjbqfbmqornUA=
X-Gm-Gg: ASbGncvjnrt64pxzdOR6VibFT9sr1X80dX1bEyYWAShegfyJlhEea0Q6evC638c/Iqm
	KZA7xj+p6Rx9HDHtctA4hrlg4n3QmqMRMuPVDIviA2N2yfNwIhLdAjSLWkvqmhIZYLKRb9AaO4f
	bMr11dk0jUYyrx/Wx+EUPELHrn9V4kTasoiEWYnjeO5bV4PS4lAEFo+JbiHlkwrzcMuzAs5kgom
	I5hELPendh0QnenlSF12tda65Hdhqom4fMy+ePaPzZJbD7BMP1rB5FUqrzxGryRAGGdAgo2Yi9h
	3+MkDxhAFDBIqDg7GJn9irDVZ0ACNjmpNgl3/27rfY4IrsxdvyMRt8NdYSNfDQ==
X-Google-Smtp-Source: AGHT+IHC5ay/BwrctBha1vdivmHpOowK/cqW/lvGJ5YoOLgR1e/6gz1EhUftzMSpdzePdE5yWUPCOg==
X-Received: by 2002:a92:ca48:0:b0:3dc:7df8:c830 with SMTP id e9e14a558f8ab-3dc932619e6mr9977965ab.7.1747954487366;
        Thu, 22 May 2025 15:54:47 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc3b1b41sm3365399173.48.2025.05.22.15.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 15:54:46 -0700 (PDT)
Message-ID: <a1dfee30-8b55-4387-8dd3-f85a1f7c2021@linuxfoundation.org>
Date: Thu, 22 May 2025 16:54:46 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: hid: Fix typo in intel-thc-hid.rst
To: Akshaykumar Gunari <akshaygunari@gmail.com>
Cc: linux-doc@vger.kernel.org
References: <20250517083334.6766-1-akshaygunari@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250517083334.6766-1-akshaygunari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/25 02:33, Akshaykumar Gunari wrote:
> Corrected a spelling mistake in Documentation/hid/intel-thc-hid.rst.

Fix or Correct instead of Corrected - check documentation on how to
write change log and submit patches.

This patch needs to be sent to right maintainers. Run get_maintainers.pl
to get the complete list of recipients for this patch.

> Replaced 'triggerred' with 'triggered' and 'flexiblity' with 'flexibility' to
> improve documentation clarity.
> 
> Signed-off-by: Akshaykumar Gunari <akshaygunari@gmail.com>

thanks,
-- Shuah
