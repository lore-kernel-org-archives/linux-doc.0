Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F54126BFE
	for <linux-doc@vger.kernel.org>; Tue,  3 Sep 2024 23:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725404769; cv=none; b=Qn6LkVI7K6W15aJTgyzTNO0bGUCYwYnwMrOHTTq9qONj7OLkLvrqgQAklrDrcxK401zmTd/wBbgyoxbOL8zGvvsFQakKqWi3GLkyELkVFkBuHgivvd7q950v9O5YDLknwkXb/7Spla0z/X7MWqhJ0oU17bIjVcgJnW2CY9K57HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725404769; c=relaxed/simple;
	bh=4HwEMqP+AeBWEeyIseM+pjAVK0SEalDg7bAT6JCmFzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYEE5alq5kly4QthifWgsHM8/s913f/bcSPnib8txXwlw++o6nCjeUSci5dr1UmxTzMiduFA2hThQ5FQct4xpDVNOB5Ox6/vsLYF4I75z7yhS62p20n2tFKjVJRTh1Zp8WbT2jhRTf03QViK1NGzolwDH9aiNPQAM/Xz7p/HWeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N40NeuRr; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N40NeuRr"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-829f7911eecso258108439f.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Sep 2024 16:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725404766; x=1726009566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u3BAkkaK6DTYCZdraoRrR1AOnwQgm6BkQ3h01GvsefU=;
        b=N40NeuRr/Gf7iUuUZbSyx/GSDw5rH6VefhQzvFnv17XEx/DirkhgcOlNsYahGt0pCE
         QduncTx18a152BUULl7PAePtZT35V7WV8xGcWEm4LtW7FQYiN++6vCkiVZrx6gXiR3+w
         HgASXYhzniueSiYYBvxIhrRMLVYoLXn5PL5U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725404766; x=1726009566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3BAkkaK6DTYCZdraoRrR1AOnwQgm6BkQ3h01GvsefU=;
        b=tQB5q8iKHQFefFZMQZb4Xdq9sV9V8ycJEp0PN0ad0oYQX692U7Pol3VNkIPRUq2oz+
         3lTxxECSzuNAfh8Ypkt40HdI7eDPMwGJtIEJM38OHOt1sRUx3y9QjkzVlxyJUfTH2bqm
         /+4k3ywR432woWc6+WMgTupNS2w1s5zF5F5GZmXN2YP/16UmgqvfF/SgnuHGhqD0c8bf
         Z4arvFCIS3y7lziz0Ldkc1VSRJKoovdUaisbIYEIDVcdN29oC6FpxhxLZkGquvuwq3s6
         4Bi3CN6aI32r/3cd5oFWRpgOEnwUvHXGv/IH/GiMXUTqiWpmsJe8Ew/pZt9tNGaJ/PeY
         xuyw==
X-Forwarded-Encrypted: i=1; AJvYcCVfLlKJKS6lGjhbeq2LvXU95Dgmh045j2vcR2PXWH6RyQQOrF+DB8nah9qL2RQUwF3Kkhj789Ocfp8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8gZaEf2MVEGJ0UB2dYZJGM0GXCZTO5hgtDpT6EEvS+bylzooG
	gouzTnq/F3LzKSW8elHCSgUvCRCUdXJF37I7H5GdipRORUm416eVht4w12EOS+s=
X-Google-Smtp-Source: AGHT+IGCWHo81NXmeApVZ7FR8jCII+W7+16gCqjB+W16I3N/e6ZIt3hzaLHg8vAf/tWw3+v60iTr2A==
X-Received: by 2002:a05:6602:15c4:b0:82a:6270:7466 with SMTP id ca18e2360f4ac-82a627075e0mr463633939f.13.1725404765663;
        Tue, 03 Sep 2024 16:06:05 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ced2dcdf66sm2833926173.33.2024.09.03.16.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 16:06:05 -0700 (PDT)
Message-ID: <c674b0f8-fb98-4562-b636-f139a83f9b7d@linuxfoundation.org>
Date: Tue, 3 Sep 2024 17:06:04 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: submitting-patches: Advertise b4
To: Mark Brown <broonie@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240903-documentation-b4-advert-v1-1-fefda9564f6e@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240903-documentation-b4-advert-v1-1-fefda9564f6e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/24 16:36, Mark Brown wrote:
> b4 is now widely used and is quite helpful for a lot of the things that
> submitting-patches covers, let's advertise it to submitters to try to make
> their lives easier and reduce the number of procedural issues maintainers
> see.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   Documentation/process/submitting-patches.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index f310f2f36666..4b6904184ad1 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -842,6 +842,16 @@ Make sure that base commit is in an official maintainer/mainline tree
>   and not in some internal, accessible only to you tree - otherwise it
>   would be worthless.
>   
> +
> +Tooling
> +-------
> +
> +Many of the technical aspects of this process can be automated using
> +b4, documented at <https://b4.docs.kernel.org/en/latest/>. This can
> +help with things like tracking dependencies, running checkpatch and
> +with formatting and sending mails.
> +
> +
>   References
>   ----------
>   
> 
> ---
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> change-id: 20240903-documentation-b4-advert-18016e83d7d9
> 
> Best regards,

Looks good to me. Thanks for the update.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

