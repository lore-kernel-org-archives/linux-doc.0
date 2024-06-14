Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CFF7F492
	for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2024 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718360141; cv=none; b=kTerFZRBx829Sul28EpFPW7bYOe7MCG9eQrURLAKPabRHjiCBcNotrzpaiGKtuChVoTFl/vKj8odwCZ8k0TxSpX3BgKOy5358BXUNWm753G22SMsKKJSfNTDfxbu8JjmjyftLLHPDxkAkbRCUXJWh9avi7pS/70voQbb72mKd+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718360141; c=relaxed/simple;
	bh=H95pmbNj0ML+Fnqx6V2x2Ozfv9WQFP0tjgrUogpJDl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mVL7tRlXVGq7W/U2Qw6jXTgN3jIepZM+uzYMP/89bMrvub9WonZyXivrWJv5zSP2FA77QTVZs50C2/ZL0G646n1rjytGJba0ai9uXahGDFCJ20Hmw81QQoEq/7Kv8x7StMb17CxarZm/HiUl3RcggBUHx1VAT7KDZRnLl8pFgTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=g2DAhynd; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="g2DAhynd"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-35f1e35156cso1915135f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2024 03:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718360137; x=1718964937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xnY/+74tWYlZxEsSqL+HDQLdC8+fmHiAEMhvpD2qAiQ=;
        b=g2DAhyndYiZtuDQl/T0+oQUq1E+q7WLi3BIgSm0rvcMMdvJZj+y2qcI9OxPLLPZlnH
         x6u1RLTFErfQMFu5iWPdVDlz39e7TGvT9/9ArkDCubBoNWscv/X7Uh9B0xcBwDAtoN5T
         FrSZCs0QjjrITb0gwAAK7/aLTbUwBOFBpltTtXE8vaGpj+Q+SaHkSsm9e1CCDqJxksyI
         LMId9Q+c8rCBbOx7NLcw6A044DrKo+9kX1fGWGexffCQTBor8+VFGPyFTT2p97Dkloes
         rKsRSWLPgVe2Kh7IEVyRqOHQoeA4UWxpWpDvVCDCwIpH8AAPvMPzFaVaenpF7qzwAR4q
         K8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718360137; x=1718964937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xnY/+74tWYlZxEsSqL+HDQLdC8+fmHiAEMhvpD2qAiQ=;
        b=nKnexnpCwxFe06cFGCGCKHnKn+E5Yz6jbx8Jh/c2fGBMffQStIc+4WAvr1BH1HFMqz
         5sRwJpSUgSQpANsaPj8FAzJRMJCuneIloo+DuVwoYAT8EEWDakhOZxOM27NrHxVu7xSc
         3QlcYmIQyIqYF3x2FcLx+kv6u8pGE+KI02nWjcmYASTa51v3WjTigsHxQk3rPtlPv76e
         183OCAQJr4azy02715T2KKMqaxpgRLFxObquRv3Jw+dMJ5xRMVYxhfS6Fl02YeL9MfWW
         KImTEzyNYiZ4cni0hI07zmh24NtaerG3rGmUuYO0DuPbfcz6EQvfWqeK+4NURERBdV2z
         Dpaw==
X-Forwarded-Encrypted: i=1; AJvYcCUCO5+75QfqJbg0HHJVsQy31S3blJYYuYjcDj/qSa7FBQpreK2/KH32B8gyVKnqDHOy2JcdVo5sKSAAXLRhl4bVQo8WFHsOFWcL
X-Gm-Message-State: AOJu0Yzy8JFAtxrvEzi3NSqolyCvGqUD8GcSHlBlNfK4N70UAuu4OwDH
	TfdJ1kS31pZI0DfsTvcAvCSVdL1w07P2fApw0g6SU1IfOJRGQAl9DiFTsa9KzUY=
X-Google-Smtp-Source: AGHT+IGIvQCmkwnaeXjLDSm++FQaHtPzQYPDkTGLsPH1o0VHg9LXBUm8rlKViWgfL6ZmPCd/p5fi1Q==
X-Received: by 2002:a5d:5917:0:b0:35f:296c:27b2 with SMTP id ffacd0b85a97d-3607a7b6255mr1639807f8f.22.1718360137566;
        Fri, 14 Jun 2024 03:15:37 -0700 (PDT)
Received: from ?IPV6:2a10:bac0:b000:7579:7285:c2ff:fedd:7e3a? ([2a10:bac0:b000:7579:7285:c2ff:fedd:7e3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c7e5sm4012447f8f.30.2024.06.14.03.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 03:15:37 -0700 (PDT)
Message-ID: <98af49ab-2d82-4ced-ad95-2a6fb24f3a83@suse.com>
Date: Fri, 14 Jun 2024 13:15:35 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: Remove "mfgpt_irq=" from the
 kernel-parameters.txt file
To: Thomas Huth <thuth@redhat.com>, linux-doc@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240614090306.561464-1-thuth@redhat.com>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <20240614090306.561464-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14.06.24 г. 12:03 ч., Thomas Huth wrote:
> The kernel parameter mfgpt_irq has been removed in 2009 already in the
> commit c95d1e53ed89 ("cs5535: drop the Geode-specific MFGPT/GPIO code").
> Time to remove it from the documentation now, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
