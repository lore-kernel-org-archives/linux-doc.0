Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3581037CD42
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 02:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283476; cv=none; b=a+tf9cr5S93NmnTdeCpIrzmiZ3LYZEuzordZyUnKJH7BJwQWB9jARlnOVK/GG+tareuD7jGZc3Fn9I5JncUshbV+gnop8o50JKoLOZi2nfdhiu/dnL6UKknbbYxO7pcvEiisjuzrF6Jh2hxPhHfy24aE0vYE9TceebuI8AEw2zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283476; c=relaxed/simple;
	bh=wj5SmTDmHF0r59Y5gMMmVA+kTmsjZ7W7lg0eW+Zslcw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=b4MA+ImQ6kjuqsnaSgJ1lvaEWNcQVuDLYqFDShGWNsbjENz+pOxxWzxXYvdi9XpVP1LOngWMBe6U2LQQXUBwnzW6+bDSYbSh915WtlkPRD3ZDkzijyotDy+uq/173Hwvs4D9fw2XMVA8B/aF/KWHUc0kPwRIm5GIH6Ee1ALas8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1jrX9cd; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1jrX9cd"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aaed195901so3000225ad.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 19:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773283475; x=1773888275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bv4Q7jFL6DOAU1Q/7qv2tf7oSo1HBM79109QzvA5dCY=;
        b=Y1jrX9cdPYhh46AZruin8luAzJWwwVzZ3CDAGS5zBXTxrTu3fY8qliow/XR2j2+sSH
         PKq5ZitDnALzXJ75HeZPBS7+5PgxzLqnxDgfQVuLvVfxOntBRsO78z/ftuywaeR5SnS2
         aWX5sghmW+iFpUcpglTY7Zqm5FiC9vHkSJlOD8DgUpLbwtZnB/hIfaCGr3tT2TeNnZJB
         udCnKniVsaZrha4b07ws5msBk+lDRY5rQ74AmnUYa9Ay/53SpipSl1oWwxafaFKruxfK
         mWBbM/SycxwGqXiuTWR6EyzbgPw2FWVBP251OTpdRarWbxouWdX7aXvD1/d2KBsAU+q2
         CWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283475; x=1773888275;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bv4Q7jFL6DOAU1Q/7qv2tf7oSo1HBM79109QzvA5dCY=;
        b=k7qOg8/HNRYN9SrMLhk7P2Ka1IcqLNTad3Dwtu2lv4bE1neZJgdTtH00dwUuliGqJR
         7cPvrSjUUkRNaVGzpOH+QweKSRPp6tFtHUvZonJFV7mfvGoqdOsrv2FDL6RmDIPa2SKF
         qjo5FqJ6kLMpa5IczutPl24ht3UBjXy4Q/VGAwrhj6VrJQDAgksI9jBNKYzqGBFfgv80
         KKgsVF5oRmTxt/IzEm4ZwSASN7QR9xOXT+GSbMw0Ln51vijhPYKf6fAKtpXliHKDEnV/
         A40zpdK2/doTWT8oqUMofR+dOIAzf1KITF41+T/E5R/ocgdZSLK5LKp5XKyyVALcSBQ9
         jrzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsxRuDqdGfYPpASoLTf/84fuzP4xqARG5Ny8so3UWuEaAQtbVltWmVhh5aF7X5y90QA845NeiLq2I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp1C/N2dzwEsdSJtcPsPd3CSsETDX9CeVaFev2xF5jOUBCXJGp
	4XavBzl41PGc8zGD0PBkSJfvS469PbPrw6BCOh4g/lAlmb/B+rLQkc7i
X-Gm-Gg: ATEYQzzZQl7tejz0+DrJG7bcQWOBzjuw5sWCqyBVgksWE0UVmaiQ4fjGI1Yp/lHG2AG
	HBbp0vrcPFleq+2Fg4sUZFn3NRtm1PMD12rKwjuSlIfb2yyVnpfw0t3sxmZ0n1YfbgBPcewnU34
	gWSuRL1LVlE98mcazMQtXx4D33lM+xgvjDNDYJ3r7PJyqfO3HMG6cA72hL27p8nxd7JzvFH8Uo2
	urdTN/mrJy3QyqifyHNqXnolaCRVW//G/FIdmu+S6Qkpwa41nyiLoPB6jsr+eLzw1x66FTEc6SN
	JH6warC2lY4/eI3+H/YB2PXB/bqd6sbqVMbXmTxyXYVOLE34uYDyjXEsM7bmbnQ47s5izgUoWFK
	4eECsfqxEL3/iNdS8ikhb4gxeXq0yxpjCIwcnsJnqtRf23tqhbnTnjV02SiX0BB9xZpC8y311kW
	rlrJTwoptXSQC7PoJqfoMei3XzsK/GNmOglMQb/9HtkqqRkkdsxVtVn5PMuxOdeaFANkxbP/HW/
	VOf0Gg=
X-Received: by 2002:a17:902:e5d1:b0:2ae:5044:8dd4 with SMTP id d9443c01a7336-2aeae7e0c4emr48491595ad.19.1773283474449;
        Wed, 11 Mar 2026 19:44:34 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aec00eda24sm3228305ad.25.2026.03.11.19.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 19:44:34 -0700 (PDT)
Message-ID: <7dc9bd14-b21f-461a-9794-070f43db4826@gmail.com>
Date: Thu, 12 Mar 2026 11:44:32 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: derekjohn.clark@gmail.com
Cc: bentiss@kernel.org, hughsient@gmail.com, jikos@kernel.org,
 linux-doc@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
 mpearson-lenovo@squebb.ca, pgriffais@valvesoftware.com, shaohz1@lenovo.com,
 zhangzx36@lenovo.com
References: <20260310072937.3295875-17-derekjohn.clark@gmail.com>
Subject: Re: [PATCH v6 16/19] HID: Add documentation for Lenovo Legion Go
 drivers
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260310072937.3295875-17-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 10 Mar 2026 07:29:34 +0000, Derek J. Clark wrote:
> Adds ABI documentation for the hid-lenovo-go-s and hid-lenovo-go
> drivers.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v3:
>   - Remove excess + from every line of patch.
> ---
>  .../ABI/testing/sysfs-driver-hid-lenovo-go    | 724 ++++++++++++++++++
>  .../ABI/testing/sysfs-driver-hid-lenovo-go-s  | 304 ++++++++
>  MAINTAINERS                                   |   2 +
>  3 files changed, 1030 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s

This (commit 168c91839139 in next-20260311) causes a lot of new warnings
in "make htmldocs" such as:

WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: /<...>/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; /<...>/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: /<...>/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; /<...>/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: /<...>/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; /<...>/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
[snip]

Please fix.

Thanks, Akira
