Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD6B42B323
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563889; cv=none; b=kDDvBnCjxdIANEEviXO/dB29oC1TZUB9Mxh7RqpPseHvifju6gsoiQnb1aWVUTYhQXSWcRq4AVx7G6xkwkdLJMVWRVb51vR3ToJXZqZ697VxzpCwf90yDREGkY7LK8nhHLcgnRb5jBOAEMK4Aee89M1TcKZmMFz4MT12Wl9/CUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563889; c=relaxed/simple;
	bh=vZjpn444Dr+n9sHS9FJvINtAEvVv2hvJQ0560E8hhgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbGTMYHldx+UyosuYZkIEnxiK2mORTvG9ZJyns320G9cClV6UN/jIgXVZ8IMilHvs0Gj6EPNbbQNQn/5I78VK6LsXj3ILnLp187ZxEuNblMx2GT6GHa2WiF71PBxsvPhy8ilKC1hWG3Gf+EWOZ4SpiFn3EWs1XAGD9/oP0S8lJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adV0DpAs; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adV0DpAs"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso6390626a91.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563879; x=1785168679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9xxRXY8WEN0UqvALfUo+QgEc7p0+yzjzyNQ5kB5akAQ=;
        b=adV0DpAscnn60OPV4ssIBnmIro5NdkEphKZ35Y9Ayx8yamDO2bsnXMPp4l24tmSghC
         Cm61OgDX7QbuJEjgptRx/RLZlTWqH9suarmRHNWwOJqAEi0DEz5FzcNJujRhFY5/PfFk
         6PDcUQCIH6HpOM7qJwg8f+CzC8IFlVzblLVx8bYP+1G8EnFXrU+bpmaOpScPpmUe3qEQ
         loWPe5CfZK5RX0rt0ORujC8CJSKjGjKJZKra50rqBt/3cGVXXDbqgKY9LwYpMedMiqsK
         Jv4ccgEDNzgVe4k/dCOgsYX46imbogkq7h0Ie4rcuZF8FQ1g5nfAfYsVXCUcc7pskoC+
         8Cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563879; x=1785168679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xxRXY8WEN0UqvALfUo+QgEc7p0+yzjzyNQ5kB5akAQ=;
        b=b7+liPFQlBd1rk+/nLwjNQJCGiYgkDgHFQn4cR6CTsbFj5v6n90DXEt7N4zcZ99FN7
         Dsetkk7liZAbk/9V/BcNVuaT7DTZMq3IAlz4AD24dn/JYLWEFetLlFxOkWO0Uuj7g94H
         L8go7OzYY28BgfGIjt40KLg8F3JDeYazdXP5OGvPKD18S45RNYAIDLhevplL27O7ZF4R
         qC6lLHpy9n9mAnF6u77V9wCVpJbo6Pen9P0vvGZ7KYpNnSkiGzyKtCT1AH1+fj3HbG92
         8YIM4Lw7Peqmdfop1iMR6TegaaEdeJu3VqVORPCRlUjc6e9SWEcrUbJqV2GygjAoMe2Q
         BXnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPs5WLu0vjRJVXkwsD0/nxG0a5o7KLUqUEoF6+Qonl4fKdpjDPt7iBoUOnT+xUNr9G3beP5Bi0g50=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwMQtcdvXwraqykVKoJ72s6X3qgaZcGericBLBVN5su/WMDXOC
	9FvYN5hw/yU+VxzsItLzPKHjaLf3saILzxugayPdXaVL1im32NY4sNpm
X-Gm-Gg: AR+sD12JmhZG0ue1bix7wYq/Rl44MZAgSqAeafn/RyPWyu5QAkso9zmfjWdF8kDFCS5
	HVdHZsptwqCVaYqZErl/OkvNeVm0FLqFGcSo6h+aMeK59IaVQTCZ+aJOZDYauwST/WxYQwA3+7w
	uJHPJhSrZdr+FFxuwIVMOvcvcFbhzVmvQCe1dhlIKyITwY+75r5Q29lznpAXy5iYoShR546mDtk
	X79ogXM3UAvHZ6QiQyQZOZajvtBZEKB8ggN6ShcZVlnWd6O7eJ43ApMXdONyGCvmXj57TaHXZ9a
	lWt6If1dfS5um59uQfEurRKRPgp7E4BTQYqybOYEYBwhquAOhYkNnvb++2zHkWj4hyRgZHF2kwC
	QhlX8k1b3XdDTToruHXvvVl2m3/PDiYNgiwm0wF3O5VEtle8bPKJCR4Zrvkv8kKwDw29cCTCc9s
	kXHsWzDdP87R3EYGU=
X-Received: by 2002:a17:90b:2c84:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-38e4b422bebmr15575435a91.8.1784563879361;
        Mon, 20 Jul 2026 09:11:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2c93sm34678064c88.3.2026.07.20.09.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:11:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 09:11:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, wim@linux-watchdog.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, corbet@lwn.net,
	skhan@linuxfoundation.org, joel@jms.id.au
Subject: Re: [PATCH v4 3/3] watchdog: npcm: add bootstatus support
Message-ID: <f0a8a606-0687-4c3f-887b-ebb500e760bf@roeck-us.net>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
 <20260706144828.3517631-4-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706144828.3517631-4-tmaimon77@gmail.com>

On Mon, Jul 06, 2026 at 05:48:28PM +0300, Tomer Maimon wrote:
> The NPCM750 uses RESSR and the NPCM845 uses INTCR2 to latch reset
> indications. Read those bits during probe and map them into watchdog
> bootstatus flags.
> 
> For NPCM845, cache the sampled INTCR2 state in SCRPAD10 after the reset
> status bits are cleared so later probes can report the same boot-time
> state. Also report WDIOF_CARDRESET for the watchdog instance whose reset
> bit is latched, while leaving WPCM450 behavior unchanged.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Applied.

Thanks,
Guenter
