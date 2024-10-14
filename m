Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86835148826
	for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 23:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728947396; cv=none; b=Ddgh3kFyqPf5dK9GWsmt8L8g6rGUd1uS2fWbLE/aBRpO3yB6JEmzPW8N5WJ0ebMkspoNZk7kd/E020yMdje7t0XI9VC2laEM+FRICRws4DSebF+Mjg7LBeB3xtFJGqS8ipihKrVuRj+C/1nQb0jLz7QHshTMDaSvQ/z/ZO/Yf2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728947396; c=relaxed/simple;
	bh=2W9U51HFCbv7j87Iuu5EH4EN9DG+WFYTYJDe/09T/Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKcItqaCHrNISp/ML46+uDs06VlIjbgwU6KgTHvIaZdjCEAAaNXALywzzN6K24O6m/i81NM+IOgeSkDDLyKV6t/b6w/xQsyLmQ96p1W7PsVhN+MSlTrUwBo8SVIADMgIApKKvf0aWxdgzCFiJqLrW80Ce6OAdQ3eGRRzPM2iosI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fZyN7ZsG; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fZyN7ZsG"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-8354851fcabso197584539f.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 16:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728947392; x=1729552192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fpXjF7UCLh0jKlSUonkPW30j+SOb0QTOKoVf80FL/mU=;
        b=fZyN7ZsGn+kSFiAGe8V6veih4bkpkVJCb7krdCaM/1R+C0ELeGaNPXzRC8GcYVMCp2
         PaDviC9nZWOzDegyHjP5+VKbIWMTQDK5cberiN6FTiBynnXqREZRA7nTPfeDwz4OdNab
         xBkRSQCw2qobleShJZt4kDeuZE/Lv68rTNWSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728947392; x=1729552192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpXjF7UCLh0jKlSUonkPW30j+SOb0QTOKoVf80FL/mU=;
        b=wEUtlfIUHGNYm97EFCe9ORv5LIPXmvghIbnnrxiAeYM4SXYFv7lDWS64bNbTeMi530
         VX3UzcBcAa0GlwqyXYPw+JDYXLYq5Bw0VO4dtnecGYTBrQ0sZGh/2PtLvorLDm6vb8mc
         Vn7U6Z5Vsp/o+r41cMAym+sFOrtHG4ci3CupSqrA4jD+QYtGM+vz1fUZg5J/o/evkqyw
         2hOn7Uc88+t+aF5Y0EkpzAhbAdR/siMIzPy0kqr0Jhq4fL2U7fzz2HdUwaluQu4fhhJT
         zjA7J4Al61thk55j3+FhLrha8s3IMf6XeQRCev8upXyycluhiZTB2smiTzCceM7KXKdh
         /OWA==
X-Forwarded-Encrypted: i=1; AJvYcCUa3FSdKQLFMmrO1JyZCOGRMJAayv54SJO0JDNC85t7NrGI9XPmyRaDm3K0qD8igALEJIUXx2J/gAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzAOdYun7d+C1vg1s23TQwwPRxitAIb/0pD1rRyJ5l13mEIZOx
	RbHzg/J+w81axhzUbP2yo5MFHpohSsFhbcc8EqR1qUcMNKWZFCkOzqsreQ40PlX0ldSfCg+Dk78
	n
X-Google-Smtp-Source: AGHT+IFyst77YQycrhwr+AWjoTAU3OPwbRAlI53NQc0Q2J1nk0Q9X9K3CFRSn81FdTsHv6oZeL5JoQ==
X-Received: by 2002:a05:6e02:138a:b0:3a1:a163:ba58 with SMTP id e9e14a558f8ab-3a3b5fcaac6mr100716465ab.26.1728947392619;
        Mon, 14 Oct 2024 16:09:52 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dbecb3a424sm29943173.101.2024.10.14.16.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 16:09:52 -0700 (PDT)
Message-ID: <9e75fba9-08aa-439c-9c26-a4f50a9a8372@linuxfoundation.org>
Date: Mon, 14 Oct 2024 17:09:51 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs:process:changes: fix version command for btrfs-progs
To: Nihar Chaithanya <niharchaithanya@gmail.com>, corbet@lwn.net
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20241012141425.11852-1-niharchaithanya@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241012141425.11852-1-niharchaithanya@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/24 08:14, Nihar Chaithanya wrote:
> The command given in the changes.rst document to check the version of
> btrfs-progs is:
> -> btrfsck

Just use spaces - remove ->

> which does not output the version, and according to manual page of the
> btrfs-progs the command to check the version of btrfs-progs is:
> -> btrfs --version

Same here

You can simply the change log to say the following:

btrfs is the right command to check btrfs-progs version.
Change the command to check btrfs-progs version in the
changes.rst document

> 
> Add a fix changing the command to check the version of btrfs-progs.

> 
> Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
> ---
>   Documentation/process/changes.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 00f1ed7c59c3..82b5e378eebf 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -46,7 +46,7 @@ jfsutils               1.1.3            fsck.jfs -V
>   reiserfsprogs          3.6.3            reiserfsck -V
>   xfsprogs               2.6.0            xfs_db -V
>   squashfs-tools         4.0              mksquashfs -version
> -btrfs-progs            0.18             btrfsck
> +btrfs-progs            0.18             btrfs --version
>   pcmciautils            004              pccardctl -V
>   quota-tools            3.09             quota -V
>   PPP                    2.4.0            pppd --version

thanks,
-- Shuah
