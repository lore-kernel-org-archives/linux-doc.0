Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9C1322C6D
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261029; cv=none; b=Mg7awnCdGTysdPGpvDIXRBLq89PRB7+Pae+/GnNp3s1ldIwCQjXDJH6My9PWqA9VgpriZHL6mqBkQ8vMywKYAgSyjxy6aldfyn0X8jftNnLu9oIVD45pmI5IzPxvoDr+z9rQiaDzVrapzTtYX7+gY9bhOInpA9o24nmhFFVV8dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261029; c=relaxed/simple;
	bh=WOyx8Z48htcxwyxmNQbyPqTjfn7K0keNSd9wlveroLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VqPp88EDDEVqEDF8+BQX51bMjPIPbTUbwYCfASDUlN1mCfiqeEgXXmZ9Pp/mrKCq7QkErVTLGchnYvKb4kZI4dpyQaD1dqEdICZKkIdKl1ou8zpHcyJ8Gd4wISXZShf+lDYOtPBlhwLUbBrHMBbiHTFy09RJTkpn/zsLSzUqE/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gvciuZH9; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gvciuZH9"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dca5f64e86so1914180a34.0
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 10:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778261026; x=1778865826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1DP+JuCnIiM0V9Dxy5rK6Ns6ZckVWIlwW+CDaFwu9r8=;
        b=gvciuZH9/GpAabeNj7v0/yjRAaqzwh3FodU+bWFch5mONSfYvY2Je6Y+UVgivqN/0Q
         wrc4bUh7DlcuPQUwjYpf+od8DT07F7xlRYQ7c+0IF1kYiFeeXtKUuddZtzQgEwWy2x7L
         6+TJ/kQDyJsZjcy+uKhN5oltUqLo4Ylsa6ANo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778261026; x=1778865826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DP+JuCnIiM0V9Dxy5rK6Ns6ZckVWIlwW+CDaFwu9r8=;
        b=ovK66Rs0NInIHFQS+Wa3eF0zVUPMcfDxty9i6eIFeVMU79/kjXOTAZAumNWXlqjGny
         MWxMAjDI8G3FPxAW2Xt20oNFdulXPdTAqMGs3sa9Q/xRKUh8FiyAb8wAFYpOn3HG3E2/
         qo4HGHDkuuTjKlxtBAPGyevB7uT9Bhelv7T2Jsogfn+LA2jiF6mvbPofHHd0UuwLRbx3
         0M/7ln5VM/AyPFvFduVBHM2Y+xALTWGnwEydY5WkzKzA5p0XQlg/Gf0Sr4wC60509o6x
         RALv0L5/Nf2IU1ysEp8xgU6XuGDJLrcZZCzshFMFA5Z2GfGqQie1Z3aFRNhpQVeB3cBP
         dmSg==
X-Forwarded-Encrypted: i=1; AFNElJ9Rmq4nw6Ul4vAWYmJElsfUQud3KHT7+dfI67nN84S9X+dLymYLVRJh/VZOFJPBuhYbY5/l1NiU2oM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc14GfVsLMPm3eVTRA3Nm/nua+9+ka+3ew34el31sLaSqEO2tA
	D5Q9H68c269VNGwUV+whrvC+OqGavTFOsPL7LOxbeqIE30bI6FJRkflEM7H5bP23Xmc=
X-Gm-Gg: AeBDievoNIU8ikrE9v1flzNzyEzG3KMwNG/Tvp7gZA6nnVHNcvz4/wVDjP+CenjonEe
	3ZhUeejoAFtTExbv/QZ+cUg4xlS5Ci9XI7GsBFHzT9otjRazBrbQ2h/r90LwMaTZBrKjEkvVx5n
	3tOJPJwhGNh81yH6ChLfCoxMGjOUw1O7iBCHZRr0E/3HjhBlDlUVwn/w7JR9rEjRzf9bKEn8wfk
	T5L6stL0FJ0k2mGgD1/1fzEfnErD4cV48p6yfp0V9Hp2+9Ihg92quh6pv0SIebQ7jecL0KLAJ/+
	R5HrU77IYDr/kPO5wfnTxK1njqiUopVyAbcAwb9HdgfMxMSW/FPjoGF96EYirqZqL7gDD3S+Gnc
	Hll2+tcBl023DUJHNp3SL+NIdlBLypMHmYN5gdcOc+7TCkjUFagxUbjcQtLeRnFMwTko3Tr+9Zj
	yefgazcrHMokRGBj0WtdlF7S5YYQRc0FI=
X-Received: by 2002:a05:6820:178a:b0:696:982b:1c24 with SMTP id 006d021491bc7-69998d56a5cmr7340448eaf.57.1778261025735;
        Fri, 08 May 2026 10:23:45 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b25c1a58asm1448361eaf.1.2026.05.08.10.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 10:23:45 -0700 (PDT)
Message-ID: <2b771350-0562-4cb1-b9b3-cc3ce59b1a63@linuxfoundation.org>
Date: Fri, 8 May 2026 11:23:43 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] docs: fix repeated prepositions across documentation
To: Adrien Reynard <reynard.adrien.08@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 "open list:KASAN" <kasan-dev@googlegroups.com>,
 "open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>,
 "open list:USER-MODE LINUX (UML)" <linux-um@lists.infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260508163804.16267-1-reynard.adrien.08@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260508163804.16267-1-reynard.adrien.08@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/26 10:38, Adrien Reynard wrote:

Missing commit log

> Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
> ---
>   Documentation/dev-tools/kasan.rst                   | 2 +-
>   Documentation/networking/switchdev.rst              | 2 +-
>   Documentation/virt/uml/user_mode_linux_howto_v2.rst | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index 4968b2aa60c8..3a8bd40ad905 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -392,7 +392,7 @@ reserved to tag freed memory regions.
>   If the hardware does not support MTE (pre ARMv8.5), Hardware Tag-Based KASAN
>   will not be enabled. In this case, all KASAN boot parameters are ignored.
>   
> -Note that enabling CONFIG_KASAN_HW_TAGS always results in in-kernel TBI being
> +Note that enabling CONFIG_KASAN_HW_TAGS always results in-kernel TBI being

This is correct the way it is - no need to change this. "results in in-kernel"

>   enabled. Even when ``kasan.mode=off`` is provided or when the hardware does not
>   support MTE (but supports TBI).
>   
> diff --git a/Documentation/networking/switchdev.rst b/Documentation/networking/switchdev.rst
> index 2966b7122f05..948bce44ca9b 100644
> --- a/Documentation/networking/switchdev.rst
> +++ b/Documentation/networking/switchdev.rst
> @@ -162,7 +162,7 @@ The switchdev driver can know a particular port's position in the topology by
>   monitoring NETDEV_CHANGEUPPER notifications.  For example, a port moved into a
>   bond will see its upper master change.  If that bond is moved into a bridge,
>   the bond's upper master will change.  And so on.  The driver will track such
> -movements to know what position a port is in in the overall topology by
> +movements to know what position a port is in the overall topology by

This looks fine.

>   registering for netdevice events and acting on NETDEV_CHANGEUPPER.
>   
>   L2 Forwarding Offload
> diff --git a/Documentation/virt/uml/user_mode_linux_howto_v2.rst b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> index c37e8e594d12..7b08738c30aa 100644
> --- a/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> +++ b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> @@ -1092,7 +1092,7 @@ be formatted as plain text.
>   
>   Developing always goes hand in hand with debugging. First of all,
>   you can always run UML under gdb and there will be a whole section
> -later on on how to do that. That, however, is not the only way to
> +later on how to do that. That, however, is not the only way to

This change is not needed. If at all add a comma after "later" to make
a distinction between the use two back to back "on"s

  "later on,"

>   debug a Linux kernel. Quite often adding tracing statements and/or
>   using UML specific approaches such as ptracing the UML kernel process
>   are significantly more informative.

With these changes:

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
