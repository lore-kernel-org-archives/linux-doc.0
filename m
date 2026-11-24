Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516788;
	b=AGrqaQ4KhVDLZ9cxou9m4qJzQ136sMvKiJLgCM0NvRpEBMTuIV7ytCdRk89qKu60dOfj
	 JPqWC17bOtFEpcXw+sraHzfW2A0xWaSUe7H9ZaiDzQ8gRYLiHDuBENmAlws4201vVfk4S
	 E2YmKqYikCmlpm+6UrsE8MikckKH8jPWUgsKE9bZlig8ApPUxzlWeD6T5xUO/wheqfDLN
	 MZiNI6rJm/2neQBpLJqk//TNXfhaxD4v8JBuzQT9dv4RaIMd+7edmpzPkSNEoplGoxu/x
	 ptHlXBC+OTcp36PujfLpFOC2XWMLDbPPvMVmZmRMoKsn8VTn3hgxIm8wxI++cePAMEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
	b=b/OPAZalCR+tGH0xkHS+yIp+iy0LgrwAFVD29ZokUb+w5EqJ7eiV05VQHBkJ9TiM5fHr
	 /QPHWHZ/UOuQnemxahTgwsvzQJUsEcvuXI/tDgtrGBNvv4QMTP/Mf9MjYiBjIVAN8QwNw
	 BoQ394XIDeF9/FZU+GykdOBr0TuqIHHXs2V40jfCc+u48bMYoZ8SAXKbc4b51IsOEk7r8
	 t2y6fS4+wMJkHfs4nm0HxY7KV000dz2WAipR8OIpiLKZiRpsqYM4W1PaB4mEfIitBzkgY
	 +BnZR2RBZxokRLdCuzi04JVs/LmcLx5utsgRF0GeVW5XZGId3H+WvwvScw6yEC8datA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KjiX7YWe;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EE2606A327
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 10:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25EE2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KjiX7YWe
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb61185057so28148705e9.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 02:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795516786; x=1796121586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=KjiX7YWeSkA9Dw0WA5xjWaOqnyEHCedD00sUzMhE3sKEAvQ2TPIHmIyS+enWPn9hqU
         UHnNtz+vsI9HdnLLJLRNEHpW3n0qDPjDGGb+MMmUEkY4+DtknEToZAEEAwd6ErlDRM4U
         sl6ks9V8P+KgBQBXge6XtIwqjU1IX32GeqDZpfsQ5053CJLA98ICyRMFUcjrF7GwSx6y
         mLBhDMnek6X1+TiwUBOkVQB80sS1Z2oue9zDTiR4H+wlMmpVb+6EJ+EZoBBfGsOtxa1G
         85CHt1w3B0RFKCYDolOV20zywTKINPHyMkeAAvRZwyufXjasNY7vVq1oJTMaEgpAJPJ9
         588Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516786; x=1796121586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=hZkrczdJMid+IJXXuNtIL191PZpOSj10LMAxgm4AgSR4ovvHzMlK6Mk2LCnGvKa8oX
         jaRDq4aGtrkNu1GPt9B7z6y5ACT1zAG/fvAbJdCHFqHCkXesxNTEWwEUqDdAclRj2GBr
         ithpSH/kpzzXSNVZM3XBcd6EhobePfb8HGvFLo3HF5FDs20T/DSpsxClaFwUM8X2op5i
         gi/aYj+u/XkvwK4bKpqfZ7lDMBWZzOpctPq3Tm52B7e1+qH7/YwMcHU11fC7ZYhhA+MM
         V+IAOU9SPeekD8oioU8RRh4etF327xA4u1Wb2+Wud5KcmHkiSrC3nLVuqbLhBCQY4Mh2
         eG6g==
X-Forwarded-Encrypted: i=1; AL+hErEu9Wviqq5Qwph9dJMzUFdlthfAWu4/+wo3GW3//HXZxJcC1Mp/ZYYdXzDoH0JE3iGmu8L2Lw/03sA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lLQN9d0kmyxuvDOd5OyTkIaTZH8g1p1JfZwXpoCU9tA1yy5bW
	aui2XauOcdcjM2SQ3F8xTY/UaseBxXls6vaOkTuzPDGFbFD13eJJLSD+YPXOzjxjAzM=
X-Gm-Gg: AZFdTZdqxqkKTzPJ7YUzezIedLrO7m+Yi6skY0vkwpnmp4SEf8khaZHcZkSpOV/1wMf
	BcfWPOi/lXdwZPcDwtbenunwm43IQagH6Wus43wd6NZ+hF0iNKVbNT9YbHy04YURNl/+qARASHb
	KfrE2oKxoZ5X+C5qvHDC/IP2Vz5K6WRqewtE9PTsOpoAd0w8C1Vz+/kvOAy1QxrAJ+2fTKjoW7h
	w+g/tiaMHGRcjH2huQb3rBTrCn1v6GPwWhp7QeD3grWfC55r4vEJcRG1Z8rS/eIQKDxyvuzNO0w
	8zwEszkJv70Sl7TwSXmLOA50Hg2KxwZu2jqBmfF2msZW7wP7XX7Ak7mxpkQeIc7pLdhwy741r5w
	y3PXkO/EeNmvr9OQD5BaM3fqfxj+GPF47dIr/p8t/Lbp31EVCr/vccar5OaZD9his6yCmVt29pa
	wXeokit0qcyzTKYv3FfbjAvzg0xFUnkLeTKjCwpmqlqG4gqg0FZQrkwyNOnLY1uaHX5NHxCnvgS
	EVF2CInLHKb/SiFWrvMO9Yd2OLZXuuQdYipJ/fSH5pQJJc3npOzJJCg9HFxzqrfF4eQsT0jlygZ
	eSCiVcAdiVALFMq2eH2M3HJjCvjc2q4fDtsuJbwhCbEJ1vgYOf1KDyJL1qaLGiVL7oqg
X-Received: by 2002:a05:600c:64c8:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb8881d141mr281064655e9.26.1795516786433;
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Received: from ?IPV6:2001:a61:132b:a401:6cb8:7c28:11e1:499? ([2001:a61:132b:a401:6cb8:7c28:11e1:499])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm425218335e9.5.2026.11.24.02.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Message-ID: <65749362-927a-492d-8bff-573c277fe456@suse.com>
Date: Tue, 24 Nov 2026 11:39:40 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/33] Bluetooth: btusb: Fix MediaTek ISO claim locking
To: Leon Romanovsky <leon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Chris Lu <chris.lu@mediatek.com>, Mans Rullgard <mans@mansr.com>,
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Cornelia Huck <cornelia.huck@de.ibm.com>, Andrew Morton <akpm@osdl.org>,
 Jeff Garzik <jeff@garzik.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Bart Van Assche <bvanassche@acm.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Dan Williams <djbw@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, iommu@lists.linux.dev,
 linux-coco@lists.linux.dev, Alexey Kardashevskiy <aik@amd.com>,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 Greg Kroah-Hartman <gregkh@suse.de>, linux-sound@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <20261124-device-trust-core-v4-0-037eb0d17b1f@nvidia.com>
 <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24.11.26 10:43, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> MediaTek ISO claims are performed from HCI setup work outside USB probe.
> Locking only the interface does not protect the claim against teardown
> of the parent device. Unconditionally waiting for the parent lock can
> deadlock with disconnect while it drains the setup work.
Hi,

your patch raises a question. Can usb_claim_interface() ever be
used safely outside probe() without this kind of locking?
If the answer to that is negative, should the locking be integrated into
usbcore?

	Regards
		Oliver
