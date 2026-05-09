Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D2A32720D
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 19:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778356300; cv=none; b=mDxN60JlgS40s2FOz2OcaTUm36f+Cu2nxNny+BXDYfZU2hGHebVc45qsaoqwakTFLpfVuhZVN8NrnLCysZ2tJqAt80s3O5j4+SVkEipK+sxkpPxf6w9uQpHT37Wp6GT2P//Usl8HKVcSXyoIq6EwgrVLHU7TpNoa6FSGd84OfxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778356300; c=relaxed/simple;
	bh=WeeDw3T0vf2f1cVZ09Osp1Jr9x5HzriJwV3oiDr676Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQIFhBY8dS4xhPmmgBGy3exwS40ncKe8MrEMO4mPcI1/tDjkUwjPLSWObuQAG3wpxdus7hAG+SneWPi8ZXvgP4OcyMhhE9qLgjxpEAIAnEZ64pjDeZCdWMCirGxS/Dvqer5QRR1Zn3tl9GoLMTP4U0+C24/3ENf+R2ULec4aeKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eHX4oH04; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eHX4oH04"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e36bb16a92so768161a34.2
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2026 12:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778356296; x=1778961096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C15JMNsq1tgH3fZ4/mFGus9TyKubmrs5U3aY7mNquk0=;
        b=eHX4oH04fKvrGn83OyT/CU0kku29TCf3f4UZ2zcLN0TP2sqoSwyvbczyawhTaYRFkt
         Jkm3KN4a3D/YQOEuIs+nNkjRnb2GY5xjXv9Wl67st+MTSxL+hN3CMvT0M/0hhBIQpwV5
         3oWfkSD0hW1Jz3u463Q0PTM+jCjAmIx12rj9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778356296; x=1778961096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C15JMNsq1tgH3fZ4/mFGus9TyKubmrs5U3aY7mNquk0=;
        b=G+xRKh4K0kj6bgTrUC9dOdOS+QOqKav6D2m00b6+o0p72YcVz0QVTomkTCWtvtiQmy
         D3V5Z2i4iaddy+01Pa/bNe3t+IgoMbxIdBDcLkyF/ylemxbQOLmz3C1aX7e6p9VZsKt+
         BuNuNJw9QgWfh89bsTDeNgkg+/ZGislt4bLej2GthVzZ2SMlUkSE+WWJkoH/2w4nQiYX
         O9ynfVxWItOkktf8+Tw/WZEmIAY2Jifdvv0ACOG32vyBlCbIfsrVko2qgSc0lfwTM3tn
         eA7Ci3Pwm06yz3M6WtZ23Wkl0LcIyzT7m/TpjgciJaFeiXyCbXTlJ65XtWbAhXRqd9WT
         nvTw==
X-Forwarded-Encrypted: i=1; AFNElJ9PMYAHQjOJwn2JAB6PuIxgcw1Lk/vyaRHyUzTsXY5+dyPwWAz71SqfQtQZHLuWLHSbzYHpFqltEAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN4Jlk+fmVYtpd2z8AmIi9cfvc0CgyrQ/jqsEx53btAXFy0iw8
	gitVFNmQy04IZVVwXbs37NPd9tt5LNkWXWoCzBqkzdxaHUQAfbS4EYiUClm1lPVqZTY=
X-Gm-Gg: Acq92OFFGZ0whmgoKFcPadxzYRzNL3eSizt3Ou2DEfmiz0nDpn7CT6pYGTrjk3Ap8m9
	PiC0mPrjEg4/0MrWGp+zgktHI+/dwipEHu+4G8A2TdhAn2ckxLR5QRyP6lzt/HKFUSZTUioWhuW
	wUIq4zovPYzQUNwvnzdBYMMERO4Y+yfSowt2IXSSp85rJ1QzFomAA5NkDtDfNGkgYfvY91KcN9u
	t3N8SX4vOv6nTf+egeQpuxPcSv0u1dFtar36OIoaK2v8CJQ5bItfjTG6tev2njPCYpJ5xcgnXwy
	n8rdHnMh3EwrXD2XKimehcFGHYfq36mGVKMq6d7vc47TYrkIO76xscGi1v3L8IIa+rH84WdxJTO
	T40hAhf5nBSZ8zIDYmrdKnybZfK48yQDeiQzVv050IGjXV4Yjpv8KlpMkYdsysY554CZ8cgeBTn
	aqZgGEqS25pPQyWPm38W3/Zcl9u2cec2E=
X-Received: by 2002:a05:6830:6d48:b0:7dc:d0cc:922 with SMTP id 46e09a7af769-7e1df194678mr10848577a34.27.1778356296654;
        Sat, 09 May 2026 12:51:36 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43557109b67sm4987397fac.6.2026.05.09.12.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 12:51:36 -0700 (PDT)
Message-ID: <af11b090-37dd-4cea-ad84-5e29fcb3e8a3@linuxfoundation.org>
Date: Sat, 9 May 2026 13:51:35 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
To: Willy Tarreau <w@1wt.eu>, greg@kroah.com
Cc: Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 security@kernel.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260509094755.2838-1-w@1wt.eu> <20260509094755.2838-3-w@1wt.eu>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260509094755.2838-3-w@1wt.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/26 03:47, Willy Tarreau wrote:
> The use of automated tools to find bugs in random locations of the kernel
> induces a raise of security reports even if most of them should just be
> reported as regular bugs. This patch is an attempt at drawing a line
> between what qualifies as a security bug and what does not, hoping to
> improve the situation and ease decision on the reporter's side.
> 
> It defers the enumeration to a new file, threat-model.rst, that tries
> to enumerate various classes of issues that are and are not security
> bugs. This should permit to more easily update this file for various
> subsystem-specific rules without having to revisit the security bug
> reporting guide.
> 
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Leon Romanovsky <leon@kernel.org>
> Suggested-by: Leon Romanovsky <leon@kernel.org>
> Suggested-by: Greg KH <gregkh@linuxfoundation.org>
> Reviewed-by: Leon Romanovsky <leon@kernel.org>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>   Documentation/process/index.rst         |   1 +
>   Documentation/process/security-bugs.rst |  38 +++-
>   Documentation/process/threat-model.rst  | 236 ++++++++++++++++++++++++
>   3 files changed, 274 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/process/threat-model.rst
> 

Looks good to me.

thanks,
-- Shuah
