Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51D14C91
	for <linux-doc@vger.kernel.org>; Sun,  6 Oct 2024 10:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728211688; cv=none; b=pOj15sfnrvy1XdvMfi1WIhzWlHPLJqH9X5Uo1zVj39W+iahK7wcvvKNoOxEeL7wCJ1kwkfqMacPTpUgQF6wUCfd4Dof6X4RlRLUNcLELql9baJzW60RdrwO+oeBPCtb4VOQiw4zBoHSG6wVHWvDHiGOnmqooi7WGJzmRFXZ4Xss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728211688; c=relaxed/simple;
	bh=MxQOO5u84lA1S+vT3d3JI9UyHCndyYKnLfRTzdAJM6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lidW888nbmdXYQzAzD/9nPhvMkL/nmsTy0av6taNEnJaE27SybZguxJy/EPg+U/A/ZVcs/jIEv0cJ1g/2wHMdxzUeg0o7I1OcGKByhyz9QRC7zgt5jkiotrxZb/1dtAlb+FQebyx0y4YVUIoXjiqDHQy5XxWmdTpjEjbKvr6twY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X+Bst5PN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X+Bst5PN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728211685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0fXmkApj05qFOuNwex0AjhiRwwyAU6PpjHQvS7PGyaw=;
	b=X+Bst5PNduU97oLKN4XcSCOhIDxQs+bGrzKGOZfUmQyi76rPuKG4NM5QrueA8XZUC4LKC0
	Vcfe/Eg8NCB87DYkIbI2G/xHdXYwOUUF7HO4YmGo3YCIwHrL7oPBfVWsS+gBw0Kgzon8Wv
	9bRz0XAJQo56ulHhNNhDIaUZAvvOv/4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-nGWhGd5RPCSvAvlqlzn1aQ-1; Sun, 06 Oct 2024 06:48:03 -0400
X-MC-Unique: nGWhGd5RPCSvAvlqlzn1aQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a994fb94446so38130266b.1
        for <linux-doc@vger.kernel.org>; Sun, 06 Oct 2024 03:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728211682; x=1728816482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fXmkApj05qFOuNwex0AjhiRwwyAU6PpjHQvS7PGyaw=;
        b=fgTcJNmoLl6Sua59gq51gzIHY3Dl27DIcjzXuewX9EvX1YUy6cSLlGa48in8HDBpjI
         LVgKuYP7VUWxQd4cz2hGGeHt85vWT0Y1a4fdhrl0C2jjWY+2sAqrzZdiGADYDEyqBP8z
         wHhRVDZkvaQnEnL0m8kwQekEPb9hC4rYFkkJO8KPVYzVHWvPvjHKmzmQZif81t/UUreq
         f+uYs3Q9NU6AzGulWaD/c3Gj1N4jhzmSDsL3lX88pXpZSL5BHu3fiEkrWjqgh2OVpfgF
         Cb1FuNlTVGP69pl+uII3IvWFL/yeIzBcuvhcmyVgR21TxSh+xgxYM3oXW1SWFy8BK9Yy
         G1WA==
X-Forwarded-Encrypted: i=1; AJvYcCXb2V+hcLUNfm3SYPkTMhV/1XPTaGlvzM/zA9YXaiyc9DZ3XCb30vcE8PIOMK7GSu60s1EEdHLsMlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY+D/m80rsd8/kSm0K1en3QDm46tQhYQj2hrmHE9aRxEw4qmZS
	oE6kcSPdb8255eUSE+pndLlpSd7EE+OT1k69XwLDxbgheSOtX3TXSSesH5V64jING7cMXmzeU/X
	p1zAN+pGEniEtsjwtlxdJPXJa7fCmat/++nZ8s2zn/dub6fjndYyeenODdg==
X-Received: by 2002:a17:907:940c:b0:a8a:6db7:665d with SMTP id a640c23a62f3a-a991cf73a24mr874539966b.17.1728211682448;
        Sun, 06 Oct 2024 03:48:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuNqsQyqhu6rTt71C7RDeAUHUoPwl4Vv39b6kqvUWQQv70XcqgELk6ZtsyqDgZgfAmWmdkOA==
X-Received: by 2002:a17:907:940c:b0:a8a:6db7:665d with SMTP id a640c23a62f3a-a991cf73a24mr874537766b.17.1728211681959;
        Sun, 06 Oct 2024 03:48:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99415b7c1fsm154034666b.151.2024.10.06.03.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 03:48:01 -0700 (PDT)
Message-ID: <b996038b-31a3-4f07-be70-8b5b2bbf689c@redhat.com>
Date: Sun, 6 Oct 2024 12:48:00 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: dell-ddv: Fix typo in documentation
To: Anaswara T Rajan <anaswaratrajan@gmail.com>, W_Armin@gmx.de
Cc: corbet@lwn.net, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241005070056.16326-1-anaswaratrajan@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241005070056.16326-1-anaswaratrajan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5-Oct-24 9:00 AM, Anaswara T Rajan wrote:
> Fix typo in word 'diagnostics' in documentation.
> 
> Signed-off-by: Anaswara T Rajan <anaswaratrajan@gmail.com>

Thank you for your patch/series, I've applied this patch
(series) to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in the pdx86 review-hans branch once I've
pushed my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
> Changes in v2:
>   - Make the commit title and description more clearer.
> 
> Changes in v3:
>   - Add missing full stop to commit description.
> 
>  Documentation/wmi/devices/dell-wmi-ddv.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/wmi/devices/dell-wmi-ddv.rst b/Documentation/wmi/devices/dell-wmi-ddv.rst
> index 2fcdfcf03327..e0c20af30948 100644
> --- a/Documentation/wmi/devices/dell-wmi-ddv.rst
> +++ b/Documentation/wmi/devices/dell-wmi-ddv.rst
> @@ -8,7 +8,7 @@ Introduction
>  ============
>  
>  Many Dell notebooks made after ~2020 support a WMI-based interface for
> -retrieving various system data like battery temperature, ePPID, diagostic data
> +retrieving various system data like battery temperature, ePPID, diagnostic data
>  and fan/thermal sensor data.
>  
>  This interface is likely used by the `Dell Data Vault` software on Windows,
> @@ -277,7 +277,7 @@ Reverse-Engineering the DDV WMI interface
>  4. Try to deduce the meaning of a certain WMI method by comparing the control
>     flow with other ACPI methods (_BIX or _BIF for battery related methods
>     for example).
> -5. Use the built-in UEFI diagostics to view sensor types/values for fan/thermal
> +5. Use the built-in UEFI diagnostics to view sensor types/values for fan/thermal
>     related methods (sometimes overwriting static ACPI data fields can be used
>     to test different sensor type values, since on some machines this data is
>     not reinitialized upon a warm reset).

