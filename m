Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7185E21D5B7
	for <linux-doc@vger.kernel.org>; Mon, 28 Apr 2025 20:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873878; cv=none; b=BEbKcMZmnH2cqmhtfQOs9+vO6WpSIrbU8+A/roV6XNafsCmPlnmGPb415VonAcHkNxtxrSKHzXDuwV3G5ud9WocIOQM3vy72VDjKOXQsnv46EbnUyTn+cJipDw0tiGuTVi59oc7qGRAWphKrXwXZHC1jbGAdp4x9GJHXccCxkdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873878; c=relaxed/simple;
	bh=u98E+ga7h/ssRyXQENWAwDroRBM3EU1t1gIOR2iOh04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XpCLg6YRK9xRkhhL8LBQl3uQvpijT6V7yVtS4w77BU2zZSy7sZKgAXHzqlreKANPN9lWXS5nNWmwT6Hv35jwnKPlk2YweasJpsURgQHscyVKef3kZ9xoUe09xFn+K31hy9VhZJOEV96OA7l2CkFXlIgkJIIfVRr0PRiylX0NDOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=arbx0SwI; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="arbx0SwI"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d948ce7d9dso7407975ab.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Apr 2025 13:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745873875; x=1746478675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KVekHXovHDqh6hKGXe8dSo5HBC2RfxeFW8vT9lEcTV0=;
        b=arbx0SwIQSaswoBX6bKJmy7eTrxX3a+oBjee0QJeh9MEwVP9GU0uXDV4CNbP77G/0s
         n+vHvNWzBKtgLamKwXQhFYNIMVNjDi7WPHdxTKeO8+3sR3HkwM+0rdXNbQp9fzN67aTl
         ZRqhjSBNoXfI0csX/ZyMPRPYSWANU1PsAvvRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873875; x=1746478675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KVekHXovHDqh6hKGXe8dSo5HBC2RfxeFW8vT9lEcTV0=;
        b=Xb+B+dXWmqeXTCdIGuJxPIYbNCGRI2K+5TrNFgfuONeag/GMsgE5DdjOqtdtaVbu1v
         oFIw7sMu7PQT6ym3uelHIz2TSHZo6BCf+aGJ8BWeoKRMRaYCj28ZfPIlmZFRLVm/9WL3
         buVIxD3JaUYsdZisffYPZ6Y16JGrX+/fWV4M0stps48uvuUMh5hSqZyjx8WRnj96b7Jb
         8KmrYe1k9MvzikRiIPayEYHeP3HlS/09w0gOPgNXN4vE0B3nRpW4qOCMKDMpD4ZrUZGS
         Xbf72i1HZFLObozI4Q8BRP1HgF9zRiaEOpYE32BKkN5PSr7ogh1V7juLOtyPCavPkMUM
         Oxeg==
X-Gm-Message-State: AOJu0YxghTooR9xzKhGKWfr+5Oatc9bLfH2YOqp9rxZlhoqwDFrpvABy
	BLfJAdpxSjsv6v2zOim/RLCsgR+P0hNTpSWGMs5GsydN7nbX6QOJA1nybQ/ZjlT/QaHWxG3cbc7
	G
X-Gm-Gg: ASbGncvZm3iqvTEhmkcfq5REY2VjE2T7yR20y+pBa9GcfHjnWWyOCOkUjXCVvU009Oz
	frUzF5GFY+wzn9y2oD5/BBbJUyn0kGW9lbdkha3gsqquX8E72d2QcH8zpW9Qca1OVdSV+ae/eW/
	H1vFmK2T4dfDs4D+vRnOPuTqhbhS4yKemugPpkrdOcs4cUzv9EkKK6iSSVsooSUe1923SFCyXG/
	Z/u7V0TMGyNGqiCXf7FOgPP8wO60dW10xLMu51xnxFzDKpVv6/xnd6XJRz4hcY9ToDehQpp9u6x
	fsm6ty0GfhIi6mBem3xmetRJH80tbnL166d/VnMI5djYhFjonUU=
X-Google-Smtp-Source: AGHT+IG0i0KrLn+gA//6NGQ/Csy8CAkl5hbdyZ9jYrRoKqSArFkMjdtSvlwzCzOYzPzcS0lEHF4Axg==
X-Received: by 2002:a05:6e02:1a26:b0:3d9:24d8:8d4f with SMTP id e9e14a558f8ab-3d95d2f5198mr11389205ab.16.1745873875254;
        Mon, 28 Apr 2025 13:57:55 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f824a7ef7dsm2344231173.66.2025.04.28.13.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:57:54 -0700 (PDT)
Message-ID: <f3a51c6f-9c61-46f8-b7f9-13bf1288a3bf@linuxfoundation.org>
Date: Mon, 28 Apr 2025 14:57:54 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix plural form of "firmware" in top-level
 index.rst
To: Alexander Shatalin <sashatalin03@gmail.com>
Cc: linux-doc@vger.kernel.org
References: <CAKWAyWnda9_SAKb-EbCzVYTrMNaYxhNefzEYJTu-cJJDfmKvew@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAKWAyWnda9_SAKb-EbCzVYTrMNaYxhNefzEYJTu-cJJDfmKvew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/25 11:15, Alexander Shatalin wrote:
> Hi Shuah,
> 
> I hope you're doing well.
> 
> Please find attached a patch that fixes a minor grammatical issue in the top-level kernel documentation (index.rst). The word "firmwares" was changed to "firmware" since "firmware" is an uncountable noun and should not be pluralized.
> 
> This patch is part of the documentation task. Feedback is welcome.
> 
> Thank you for your time and guidance.
> Best regards,
> Alexander Shatalin

As mentioned in responses to your other patches, don't send
patches as attachments. Address it to the right people.

thanks,
-- Shuah
