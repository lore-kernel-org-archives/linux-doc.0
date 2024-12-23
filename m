Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F47733987
	for <linux-doc@vger.kernel.org>; Mon, 23 Dec 2024 17:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734973875; cv=none; b=mkqdFp/ELlpMeRDNuoCAjWaQ3Gt9QtmzpSpKthfpPdEYAzm2E03/uSQMll9ChHfrkcX9reBRR2BYrDLVcPiGJyBrr2IMzGnBK4oKYtKoXd4SdqTSWN7a1p0gDsdW0hUOkeJF+6J4m0s+WFBmlFHiJnqPSzo1mNXTd7OUejvBU90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734973875; c=relaxed/simple;
	bh=EBxYk2c04f3IyIKoFU2XHBukOlnEryZLBDijVBvQIv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X2BALZJl/D9GhzqzRoFryUIhPCCebL5+kkZK9PE8m1eMZJBiHBsLUMimLaoqU+vL9ypLsNi0ua8Ae//uybzLYpQnI1KUwixJgcdjl/IsxlVRnP4OOC/HjvQ2ZZ0WApwiM42Y7FEspQyiOiKl9SHRLQHiwuoUKBYS+w8snWk9mLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DDCrzbdo; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DDCrzbdo"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a9cee9d741so29994385ab.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Dec 2024 09:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734973873; x=1735578673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sfxggPur2l6SxrO4mqcQYaTbsLMvYZFjDnuM92Gu+fc=;
        b=DDCrzbdoZ5HmoEC35CyyUl0VPgCUOcMxFL09/tUb9aiE0D1s01ETmJh7ZoTxfHBEsi
         7gVbq2vm483Q3QcRFlCxRmTzoAff1pQCzuzSusy/9nNPdsehIkvNlN7AQLkKCEgb/E5U
         l/7jCHX8xS/Sf1fgfFaFK6oIqF/E7OL5rLgfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734973873; x=1735578673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sfxggPur2l6SxrO4mqcQYaTbsLMvYZFjDnuM92Gu+fc=;
        b=n2VLVGp+hag53wS1rUk2OmZqtTenlvzda9V7sXn9XUo4HEOnNcUVEOqIBK8GRXtDSW
         qcib0fwBs2cWDQvx1/4jB6qu9fEwrjG8ypYuV8vUVcllvTZYu36I27nhI+qSEkYkr7L2
         z7AeeODhv+CRBDHFNFMRPDd7NYUxBY2BZOD29DUqRw0tUKopFOr1KXgNwwg/wQooCfl5
         JLBtZABqOnmtBL2NuZRTgTx5ho7hJdBNQ27aWNp8SRkIiDKPEBvdeqvfotW3lDwGLNZ2
         b2e7gwNbimzegB1izTV9gYbPp+VmA294yhz/g7FnZOC523qbI1A5SKa7EkkMnTCjVynU
         oJYw==
X-Forwarded-Encrypted: i=1; AJvYcCUcpJ5sSYHfpoGNe+aHaFPXbxIaBQNv3XKQ0JfnFSuyJ0EWrUAiIXyAKa3poUeHMiHHwFe1OI2VGqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBLBqbfjBUMrANIojeNKY5ufzDSfHZfd9S49OIIUlWTPkqTjYy
	TppUhkmD0xR9RC/gPvPAvl5UfMsLswJyhMvcRG7vdm036Yi+PX8ekoxwLiVgAkQ=
X-Gm-Gg: ASbGnctfMul+e12o9qZaQ4ux7nKXhn87Gr1YSxqWDQggsqlRH8YRY1wuFoHOlKNJ7uk
	qnA+i3E/H+qFIAfIpzAUwvVnc1GLvbKyU+2FwKcWaqlKzEtB5lhqlI1VZ5HQ2vQiCZ8vTfJL7wH
	2pgZ0WsinmgikwfWvf+LdmMA8g6mPi4otMKnB42/u2oS7Cl6IL0eD7s9F4E4cRLd5MgITYw/Srd
	mAUuDclydSSodwceNIsgBYLPzS9Log1g6e8CcogKzRYB6qNPFeWYYRlBO811figyV37
X-Google-Smtp-Source: AGHT+IE2QhYbNtZhQS04jp2P3EHiTdiHnosLlXPxt52xzzfMD4MejlvRwBrP7n+Y0JgPOcMVC4knpA==
X-Received: by 2002:a05:6e02:34a0:b0:3a7:21ad:72a9 with SMTP id e9e14a558f8ab-3c2d5152acfmr113425865ab.17.1734973873361;
        Mon, 23 Dec 2024 09:11:13 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0de0530fasm24141055ab.3.2024.12.23.09.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 09:11:12 -0800 (PST)
Message-ID: <42623280-d7da-4bc9-98a5-65de33d4f6dc@linuxfoundation.org>
Date: Mon, 23 Dec 2024 10:11:11 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Update USB/IP OP_REP_IMPORT documentation.
To: Gordon Ou <gordon.xwj@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241223090417.12614-1-gordon.xwj@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241223090417.12614-1-gordon.xwj@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/24 02:04, Gordon Ou wrote:
> Corrects byte offsets for OP_REP_IMPORT.

Add more information on why this change is needed.

> 
> Signed-off-by: Gordon Ou <gordon.xwj@gmail.com>
> ---
>   Documentation/usb/usbip_protocol.rst | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
> index adc158967cc6..3da1df3d94f5 100644
> --- a/Documentation/usb/usbip_protocol.rst
> +++ b/Documentation/usb/usbip_protocol.rst
> @@ -285,17 +285,17 @@ OP_REP_IMPORT:
>   +-----------+--------+------------+---------------------------------------------------+
>   | 0x138     | 2      |            | bcdDevice                                         |
>   +-----------+--------+------------+---------------------------------------------------+
> -| 0x139     | 1      |            | bDeviceClass                                      |
> +| 0x13A     | 1      |            | bDeviceClass                                      |
>   +-----------+--------+------------+---------------------------------------------------+
> -| 0x13A     | 1      |            | bDeviceSubClass                                   |
> +| 0x13B     | 1      |            | bDeviceSubClass                                   |
>   +-----------+--------+------------+---------------------------------------------------+
> -| 0x13B     | 1      |            | bDeviceProtocol                                   |
> +| 0x13C     | 1      |            | bDeviceProtocol                                   |
>   +-----------+--------+------------+---------------------------------------------------+
> -| 0x13C     | 1      |            | bConfigurationValue                               |
> +| 0x13D     | 1      |            | bConfigurationValue                               |
>   +-----------+--------+------------+---------------------------------------------------+
> -| 0x13D     | 1      |            | bNumConfigurations                                |
> +| 0x13E     | 1      |            | bNumConfigurations                                |
>   +-----------+--------+------------+---------------------------------------------------+
> -| 0x13E     | 1      |            | bNumInterfaces                                    |
> +| 0x13F     | 1      |            | bNumInterfaces                                    |
>   +-----------+--------+------------+---------------------------------------------------+
>   
>   The following four commands have a common basic header called

thanks,
-- Shuah
