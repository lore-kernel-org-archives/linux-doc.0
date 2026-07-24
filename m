Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC26C48423D
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 23:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784937585; cv=none; b=u4SsfM9cwy53DxIx6ec+Jng3UxnprXK7SscTWvy71us4p51rO2iCE/X+T6tnClZr9J0i9FcmfU6HQFLOFg3L3AXF64V91+L95BzipSwxvMxL2EeYTX3iRroBpuJkdnKZPTJFldDmexu5Q3qkRYV93jcEk5iO/JzVNT1oaW7QZuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784937585; c=relaxed/simple;
	bh=DLCXclz776IJsXxqnai+kkrn7jonfdhyzxH1Pbmqd7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIeLcWQ0uIqdhQdNnAE/eNbY0lIe2tHm/3Ibi+9vOwvHFnDqLuGcvw74HIsIfl947evo+abkvPgZD9fNg/Ys6wR9tHNvAbrUfoaz0Gk9SmCtMId0qZfDKkwru1B92Vg257uT2wZLeJn9yOzOfXWUS2QsRftKJRzZhs7/U7yLLI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnenEc1y; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnenEc1y"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-848d21bbaffso1068416b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 16:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784937583; x=1785542383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ju7oJUnrPEvcYtY3hXFeTxL6ID5qMoHX5QtHSufE58=;
        b=dnenEc1yGn7HGfn/rzWRPDN5uFCYAd549BxGy62xVMNEw2X1bE4nYH2QlhPKmoX8nI
         an3PseSYB5lxgSXYGNkjw3GKcJTQNBnkuAQ+w3fsuEXfJnDijg4XxsSWfu4QdsB4dW7S
         ZsKoDis2HUSZiQbXKj1GOfrR2sZ4u4+UxKA2Qg4eY8xePLBZbKyDuXirV79v6KlZlEHi
         D4U13g1WvMGtALl9Vt0yA0i3yp9z2rd8LQa7/AKaAID0w7HjMEx+f2Ordf2ousi6x3fA
         cwZBxObKS5Cb0hTRfu4GJtt1kPlelAovIqJIUrY0lOhPj0/z0xqYngfFa8gpes5H3tTw
         tV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784937583; x=1785542383;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ju7oJUnrPEvcYtY3hXFeTxL6ID5qMoHX5QtHSufE58=;
        b=N+n+qkO3PY6qopDKoKJlZcQ67gJRYICWiWSOFQ+fvE+VhdOSws8fc9XNaJDOEfipLv
         /LTPKFmyot6FvyHA5uOhJ+Fgv0tcSlxp+6Eel+icjhNqczhSM8aPKVqYIO0Ad8Mkvf5c
         HkoZDCd5ShTTOE3whswJ+tI/Ht3/TGWCU8JHfNSajcf6ZJ3bHbhQ0475iaQKJ2TPrbC2
         zaTbMXw3tKMxLPz7Yqi+/EzMxWS9nDh9ZmSLN4aIF0rTAo+hx7VAxNlzne3o3Cn4X5k3
         UlNHQZuJJ1R1umyZmvMlxksM9JS5kchebgOiG4lqq20OdIlAkgnyJzo6/tRGoLBcyQS+
         QKvw==
X-Gm-Message-State: AOJu0YwnDAqt+2i2aYHEu3iPGBMr6f55QUXC+WW7T0zZfiY4aIErroFr
	YiBF9wgy4roQsbV9DSMf2TNZYH2JcpPT1pfGLhDMn1XyyHlTcC7oplux
X-Gm-Gg: AR+sD12pYxGZ8PATveTAMnVmocvg3VfDKIXgc8RuSSlyE+rEfiGfD9dlsBWiidWUoGL
	J/amAOr5dxGxMDEt+fEylZ2a1l1sVdObFFbsE9sAjZsheVRQJoN+ueVFUms07VhrwmJQWfjUrd+
	NhFqZkML2RZzaAkVsz9z9QiEZ7gNO0job+01z8gklF0Yhxf2Ssd8msZOOymMS9JDV3mllvn0PHf
	XhLy74LKeIkhuTc5ohqTCA2CsJGJ0TFM8n3p2FgjizgUA2aWES7E1AZGHUvvEye1pmSkgFgGUbq
	pxhcUdiq6euzORR4QESY4fFODW2LvPTT97gfYb+ofPZHoCeHG5Jc93ffZkIKIVYld8L7L4/swU9
	n8pV9MbCJ3uc2is8pXtbWsNk7xRpyrWoqT/mYMxNn2dWmGhAGOlO0FyCfMgj1LtvhLAJnwb/D5S
	NwwdPaLXiXM2PW
X-Received: by 2002:a05:6a21:7a45:b0:3c3:a6f0:80af with SMTP id adf61e73a8af0-3c67e142239mr396763637.60.1784937582796;
        Fri, 24 Jul 2026 16:59:42 -0700 (PDT)
Received: from [192.168.71.21] ([116.6.102.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb660deeasm640633a12.3.2026.07.24.16.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 16:59:42 -0700 (PDT)
Message-ID: <babde62f-9669-4f0d-b240-c79f450bbef1@gmail.com>
Date: Sat, 25 Jul 2026 07:59:37 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] docs/zh_CN: add process/applying-patches Chinese
 translation
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1784289654.git.wy@wyuan.org>
 <b65902acdaa37438479b3739e907a9e0ff604c55.1784289654.git.wy@wyuan.org>
 <alpbykBaX-8BkUzB@wyuan.org>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <alpbykBaX-8BkUzB@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/7/18 00:43, Weijie Yuan wrote:
> On Fri, Jul 17, 2026 at 08:07:42PM +0800, Weijie Yuan wrote:
>> Translate .../process/applying-patches.rst into Chinese.
>>
>> Update the translation through commit fa04150b8ef7

Is it the original meaning: translation updated to commit xxxx?


>> ("Documentation: describe how to apply incremental stable patches")
> Btw, I don't know how to write the commit message here.
> 
> I translated the entire article, but it's obvious that the latest
> commit of the original English version only updated a part of it. So
> the commit message written in accordance with the usual practices
> and rules is obviously inappropriate.
> 
> I am more than willing to make the necessary revisions as per your
> instructions.
> 
> Thanks.

