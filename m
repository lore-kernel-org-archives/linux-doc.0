Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F168D297A49
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 17:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745342548; cv=none; b=XAT8srWbMByPL7I61rvn9YUlRgzKh8shLF6Qd1zmo0ks6bbjkpcXrGY9d8B94N9UiHGPa6Kvny0ZpvF+RQzJw6YVXRZ8ntvZfM/vSDTezaBXoQTdcpjr5MYX/5H/nWcD4z3TJpOhDjpvxsxud2GdJLw8csRNjuioXgoiqTS7vAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745342548; c=relaxed/simple;
	bh=IVKmtnl0CuSeKzy2LoPtM1CzEBbUr6f+uIDvOhT0w6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pl2xOTQ32A1cVuCVzNmwgRGGDDInO7JoKAugxakLHBIVzJ3yNLq1Mg7vXHVE9//IbG0CjsKRo8LNm9Vu8kDAFFxUYttkMNb1plFU2iUceZgtTgPYwolmtqvB67FiLIvo7MEYT+9hmqjs5K4lXBUqb7bFizjCXeE5g97VVKgRWkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Mjar0eqv; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Mjar0eqv"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d57143ee39so43677125ab.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 10:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745342544; x=1745947344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkAUgf7o9174Xt7OJxnzGn8DVp99mUV+yeckC0IzEpI=;
        b=Mjar0eqvUIZy6+HdRLXyaUH5XAHgjgKrx3m3tsQNPXhne+5NfN1osL9IS2DJs6Kkbc
         cxzdGqW3zpY8Ef0k3pcBF+mLOfh/a8MbkapduGrRG1AfVBf9/Q5t+31w+503OCYA3ZR7
         x1VjEAv0B7NnFwN4L2NToYm6sMFotl3Ifz9KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745342544; x=1745947344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkAUgf7o9174Xt7OJxnzGn8DVp99mUV+yeckC0IzEpI=;
        b=evK77/ZcPk8Ek7kiwn+sMOCCCw0crzoq0ZSAwm0sfDJv4lw5B0eaI1bV1cZMJt//EB
         2Y3kJKlaybNrF3naAI0vPuKXX2VxKJWAqIg21ErsRFcpltl1pgT3q2j4L3AX0iocDBfi
         TPtG/i8oPIArNW1upzuBnmCfPtR5rJXP59JyPqNNKYrbBRumN0yJX+K6OgTXxdEQeHXG
         pTToj9vszISZAWgiMfACo4urTp/ASZ4xgELXoQQabTPBmHsVSo6Sa++V526UN18Jr5Ho
         gn6u74F2V6dsqM1sZtUKybdSQ8AM0MnAwVpVjDRndn1qw7kuDLr0qQd7E9A+rqek67pL
         We8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV38DR64t07GA8aNyyuFGkovq1kPrsWe7c7LfXIKRMmskuwEF3yW9wa6CkK98LTjK0wxZCJGiOZNoU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi6497PtSEqnivwBVpS7UjCIpDsQcNFqooaqXftNUfAnxp8AhD
	d1fvjIg7jhsSvoKFEb9Xnxo3ewiYLwaINIKDqgJjy13aPZgdufDdGpyGg2T6wvc=
X-Gm-Gg: ASbGncsw/JEl6jxUx5NUQaXFLvMZablamK+ZfYaXLZxkNmEasJx8+7A1/DDBmGoweGQ
	tDFbKohRLKa88xF8RbFvfNfF8FJH9nnDxREo7cNM0Nnul6ASUbCxMVSp0GW2JprXCb6CROKCkBP
	WtP0KUGSbSdJxz2v3N2oo67q0b1RJdq5IyDQe2Gerrqr9DavAEciXKn59GzkXTWC4kPVAZMo4mq
	mx0DxvoKHHrGFkYL5bO4CBWWWk4RNjwjQHmaGriYvGgJiA6uuK156HhJIefCR2goXYfjHFhWkP7
	g+1ASbv7uyzMrHzpOYwM6zNnHqTVVGsOJ1EYIJEu6Inc7so1Xdw=
X-Google-Smtp-Source: AGHT+IE71zm3tSH11gi9dlOtDjUjFPo0zzmKI8+I+3NL1G/VlFknKvZ87QsjPqIzLuitgX80ZXmglg==
X-Received: by 2002:a92:ca45:0:b0:3d8:2023:d057 with SMTP id e9e14a558f8ab-3d88edbfb8dmr124783085ab.11.1745342543932;
        Tue, 22 Apr 2025 10:22:23 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d821ec1e98sm23429555ab.54.2025.04.22.10.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 10:22:21 -0700 (PDT)
Message-ID: <577ea8a9-dada-49dc-9c4f-6f82c94c0a1c@linuxfoundation.org>
Date: Tue, 22 Apr 2025 11:22:20 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch] Documentation:fixed a small typo in
 Documentation/hid/hiddev.rst:11
To: Tinu Kuriakose <tinuk11c@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <CAC=vsvAv88P7Z_as3k0ceRNCy5Jq-1Y8ge=XPaRXcT4uzi1XBA@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAC=vsvAv88P7Z_as3k0ceRNCy5Jq-1Y8ge=XPaRXcT4uzi1XBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/19/25 08:51, Tinu Kuriakose wrote:
>  From 4264e1e8a827998708e532f4a843a20115e92c5f Mon Sep 17 00:00:00 2001
> From: tinukcheriya <tinuk11c@gmail.com <mailto:tinuk11c@gmail.com>>
> Date: Sat, 19 Apr 2025 20:12:37 +0530
> Subject: [PATCH] docs : hid : fix spell error at line 12 in hid-alps.rst
> 
> Signed-off-by: tinukcheriya <tinuk11c@gmail.com <mailto:tinuk11c@gmail.com>>

Run get_maintainers script for full list of people to send the patches to.
Added Documentation maintainer and linux-doc list.

You might have to send the RESEND the patch with cc and to the right
set of people.

> ---
>   Documentation/hid/hid-alps.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hid/hid-alps.rst b/Documentation/hid/hid-alps.rst
> index 767c96bcbb7c..94382bb0ada4 100644
> --- a/Documentation/hid/hid-alps.rst
> +++ b/Documentation/hid/hid-alps.rst
> @@ -9,7 +9,7 @@ Currently ALPS HID driver supports U1 Touchpad device.
>   U1 device basic information.
> 
>   ========== ======
> -Vender ID 0x044E
> +Vendor ID 0x044E
>   Product ID 0x120B
>   Version ID 0x0121
>   ========== ======
> -- 
> 2.25.1

thanks,
-- Shuah
