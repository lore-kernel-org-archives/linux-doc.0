Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0471F18C039
	for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 07:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729064596; cv=none; b=BgeCvzKWqWq3J6HSVqfdwKDDMgketraqK/ex7IqLRjgCrD4PBnczBSyhEocWOyYYmdqw7kklU7f7tOyq8Q0Kb9U5bhv0BfFQa8VVwOTQ0RPYfrZm2q2TJ2tR6BhBHF60sLNYFmgDBjFMvc678Sk0ztJc2IKxESE0ngf+uzoyv/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729064596; c=relaxed/simple;
	bh=mpY4WNBJdwr0rbv/zBkoBWXD2Yhr/UefAopc/FUGOdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7BuH5C0Jqor2hFDK2I4KHsVxbG33O4ezZF46pUksJfUhNsL+0cShf42mvCoaUMC33o3xK8M3NR/TXroQk2Kk6No944le9xtCGuJomUHiHf0GGQXzmy18mQ1l9mzW29925Vi/hWwEoaO1Pdm3rlqaEWkFdntfgO3HVm7KOXmbd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=EJHfZR+K; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="EJHfZR+K"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso41652581fa.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 00:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1729064593; x=1729669393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BJSjeLHtZE626TM7lIiJxnxd8+otXTytv2mtD/tkcos=;
        b=EJHfZR+KnFV7FHiLFekvsj3k8wKll4o5DiPC/ZZSrqS2s3tLen4yMzBW0lnOBuNKpN
         PmnQUGT06RkYLX6KVM6KVJTQbOLRBpsl00H+VRdnswvPZJoeMU1d8DiFU1dqME0/m7ON
         EFu9w/VAI0BSrYVgnlEUuVORr7FLlQmarJ0UeByfPNaW78PVqHMwZ2RyZUxOy52ZCyPi
         liezPGv+per4OeXL0tSknslBGvPPYT6N4JahHjaKY7nP9rnuPICHHzNBv3ZMW+oS5Z0P
         O7/viQTXbIBX/VzZ++1FXFuGJGRlkTRdUVY8S+BNE8B0FAP6E5aKnCZnAsl9d6dBZgPv
         FNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729064593; x=1729669393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJSjeLHtZE626TM7lIiJxnxd8+otXTytv2mtD/tkcos=;
        b=oApPjuUxy8IrVW6R5YFufZ1OU7RNmXY+alptPcam7Vzx/WZSzfkDDl73jxCj4tLL16
         BO6ixeLYd5UCZBrssSHmMkYfAogmB1gMOh9QucnbCAvuiohebFQEk2vQV6hFnQNj8A+3
         KTG8Hp+Gz71XQuDQq06Vfa1ftf2EzDA4uzlRRN3Gwbz3pS7HFPjgIJOMJ4WJJWw/w/4Z
         0Ruk7BhB50YtU+wjo/8TkvoE7P+hNde1FaRIxC/cPHn1hg+Tg421ap/9lhmAl9v5p0YT
         bZC+04Cz/jxLuR9lY/eWWj+DlRajMx7zg+XbfUOCVw2nblYUDc/eXCDLLS0hfIFN6Tno
         4LAg==
X-Forwarded-Encrypted: i=1; AJvYcCUISol78ZP40228Enl9/n6N40c4MZ/wjfiDFrLP1cYjLGNCZZGPYstb9qWO8BjS/2gxvs/MZazOxbY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu82n5dxx0xdECDYllD6Ey+f+XWLzDc1Eox+zsVCeyhkFAEBsb
	LS69jF76HyfFIAOgj2MyZ8L53lLj09wZbYmIgxy9a7R0JjGbCo9xiZQrwBQ/lGE06RWFtHGJRlc
	PzEM=
X-Google-Smtp-Source: AGHT+IGCME5bXQdd/nD2M5Nvzzk42p7bqXT/x7isn5M/JA6Mx4W4hpR+wBn+KqEPTJVK6wGHonihpw==
X-Received: by 2002:ac2:5684:0:b0:53a:64:6818 with SMTP id 2adb3069b0e04-53a00646940mr4607931e87.47.1729064287257;
        Wed, 16 Oct 2024 00:38:07 -0700 (PDT)
Received: from [192.168.0.245] ([62.73.69.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29819afbsm148221566b.104.2024.10.16.00.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 00:38:06 -0700 (PDT)
Message-ID: <1e489737-fdd8-43a7-9abc-65599e1cfae1@blackwall.org>
Date: Wed, 16 Oct 2024 10:38:05 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] Documentation: bonding: add XDP support
 explanation
To: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrii Nakryiko <andriin@fb.com>,
 Jussi Maki <joamaki@gmail.com>, Jay Vosburgh <jv@jvosburgh.net>,
 Andy Gospodarek <andy@greyhouse.net>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org
References: <20241016031649.880-1-liuhangbin@gmail.com>
 <20241016031649.880-4-liuhangbin@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20241016031649.880-4-liuhangbin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/10/2024 06:16, Hangbin Liu wrote:
> Add document about which modes have native XDP support.
> 
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> ---
>  Documentation/networking/bonding.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/networking/bonding.rst b/Documentation/networking/bonding.rst
> index e774b48de9f5..6a1a6293dd3a 100644
> --- a/Documentation/networking/bonding.rst
> +++ b/Documentation/networking/bonding.rst
> @@ -2916,6 +2916,18 @@ from the bond (``ifenslave -d bond0 eth0``). The bonding driver will
>  then restore the MAC addresses that the slaves had before they were
>  enslaved.
>  
> +9.  What modes does bonding have native XDP support?
TBH this sounds strange and to be correct it probably needs
to end with "for" (What modes does bonding have native XDP support for), but
how about something straight-forward like:

 What bonding modes have native XDP support?

or

 What bonding modes support native XDP?

> +----------------------------------------------------
> +
> +Currently, native XDP is supported only in the following bonding modes:
> +  * balance-rr (0)
> +  * active-backup (1)
> +  * balance-xor (2)
> +  * 802.3ad (4)
> +
> +Note that the vlan+srcmac hash policy is not supported with native XDP.
> +For other bonding modes, the XDP program must be loaded in generic mode.
> +
>  16. Resources and Links
>  =======================
>  

