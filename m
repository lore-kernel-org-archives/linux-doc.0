Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF31B1D54D1
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 18:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237686; cv=none; b=t5LQaMxSw+n51X+Xe3S1DrqrUqO0qskBPrxA+pncwfMUwk1XB4zLqJOd7kjgvPodv21hgxAciBsRImjNQDYHitb5UedCOctcjSLicYqJhbVmNyAEcJT+WrGzsEaQXk9/EQx/r+WvZ3Dj42wuv3ip3NKgNauf17d2DEyGTwpZPyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237686; c=relaxed/simple;
	bh=ZdsEviuoo5KPKcew+cQZrSBrkqRevptlS56zA/SzY7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2Bxma0JymZG5NFIHLSHFpxPVcs8YvFPcqKgsfTYKbOoVb9d0DH/9MikbYCNLo7zLUWz06ahN5eobN/b+m55zwjYjjybopwn4yeljLFy1OpUq+D+MK7czN18ncKV6YMNBLQQJyGg9116G4eBrv2uJYkhPVRPUuqyF9iDbtqhGLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GKlDlzce; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GKlDlzce"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3c6b0be237cso39818765ab.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 10:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735237684; x=1735842484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HlfrKvVa44Q74KeNad3jseTdt0A11DuWu/sRJ2xX3mI=;
        b=GKlDlzce8Zx0r8EtVI95V2HYftbixy6cl5ukN9C8LjMFhi8LvPy1RZkemXLDNqRCMA
         mAbKclJhQfPJpvagupPs59ntjTQgmw2Xs8hpJcamCJNRW0UP5vtv5yH1rHZn3VDDOfBI
         qBZ+rsStd9pTrWF3w5AooBpuhQDzGBbsrKTJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735237684; x=1735842484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HlfrKvVa44Q74KeNad3jseTdt0A11DuWu/sRJ2xX3mI=;
        b=SaWTDxJ4TohXkTQqEc+2jsWw4fQNviPEE3DGagcUS494C06zXmR6hLFXUL2dzfl4F9
         6PDjHDVfVmVXp8u31wt5pojXY5ruqw4Gilcgi0RdU1ZyMkQlHSab3We7AlkkjDczrbf6
         n0OKYzbysfmowDO0G+misYvgBRe2j/vfJONm/8rrX61eTBySIkKq8k+idLo+4g3rBbX4
         pDq7nitEpmomvD8rxp6WdkOkKs1iBFC8R11/z818y5l0G3RDdj2Q7lXlGQSku6KR/8LL
         kZmAzM1aPKAzAJ+f8Q7/O5S5wjKE/BV2uaQtInwQ6MU2Q204FrPDstG8d1g4q//6oUZq
         lIZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjq4lt01CteXfF6aRH3vI8rwJjNzl0vATpRDWENZcQ5BU/+H9HAblWFigLw8C623y5yMSquap2HqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzALeW98W7MpGuiI01sxd7Q8NRUIVCJv11/WqZdQOXQRLRwK9gk
	c9j34HlRvYMyWGwBzeSxiaX1mTa+q6cvYNSqXq0T7DP0ML461wVX3azf0832Gw4=
X-Gm-Gg: ASbGncum4iZ/4hFlPDzw3DLZI8FwJlf/aAwGtR9HwYUNfhq2PnhF9iK8PDyWG5zerj8
	mev7294GTCdSjJ5aNn+9xuDabOWnQTDC29o2OAxqzQNwqzt1NwIRPp3PD9kF5FSRsJSGYHMdwc7
	mErBOLPVys/S+gxBE5GQ/QU+a3QppTDvcpxsBZwJPg12CrFSYKzM+7mM/AGay03z0rWk5dJ31xm
	YhKOk+ko6WdDPgCc7DxcOPUnE0VS5a3n4jFQ9YpIRAQqRheqTtNLNTph30u+JNreDxd
X-Google-Smtp-Source: AGHT+IFHTmkJWUrHaXZrWcAeLpK09ROt7JB/A7gOFRrh0lAoo1BwLIrIUhxuZX+P2ZR/LhKr4VXNNw==
X-Received: by 2002:a05:6e02:219c:b0:3a7:a2c6:e6d1 with SMTP id e9e14a558f8ab-3c2d5151ee6mr206368295ab.16.1735237683948;
        Thu, 26 Dec 2024 10:28:03 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68c2216c5sm3649059173.151.2024.12.26.10.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 10:28:03 -0800 (PST)
Message-ID: <7e4e933e-ea26-495f-a35e-583ebcf4dac4@linuxfoundation.org>
Date: Thu, 26 Dec 2024 11:28:02 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Update USB/IP OP_REP_IMPORT documentation.
To: Gordon Ou <gordon.xwj@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241224062336.63215-1-gordon.xwj@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241224062336.63215-1-gordon.xwj@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/24 23:23, Gordon Ou wrote:
> This is to correct the mistaken byte offset of the field bDeviceClass in
> OP_REP_IMPORT documentation. The previous field bcdDevice has length 2 and
> the offset for bDeviceClass should be 0x138 + 2 = 0x13A instead of 0x139.
> Offsets for subsequent fields are also affected and fixed in this patch.
> 
> Signed-off-by: Gordon Ou <gordon.xwj@gmail.com>
> ---
> Changes in v2:
>   - Updated patch description.

Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, please pick this up.

thanks,
-- Shuah
