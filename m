Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898336;
	b=I8MsWjws6ZG5RUPmDMoy7zuUcTa7dD165J78DzlS8bfQatEiIvKa/iOnhjYYGvY07yMn
	 I9u3TkfzbIMYOmeGCiQwNwIRBzN59qnMzBbewIHIs+YiZSp+SuIo3Sra5um0WNxZv0yLM
	 H9ZaIorLJRGPntWkEL0o1S89gVVP6Ae8U7nEkunKDM5xh56WTN5qCm5Q+s2rOG/TkE51O
	 aLu1EtLUZfd8BWonBIHp/w8vUBrTDEG63LizzmQEVGulMySU1GR11jxjp+wfjWlpIDn87
	 icHoJvWVZk36tbLhOQ1x1AJZ+4VDc7PrjRzMRm6SWZiovtwX7niu3df3HP2vur7lGxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=t7Mrcemi56BF5iayGoRjCtdHcIwbWskinGPPufbe/aA=;
	b=3KgKTscZzur7gezf2G5yAd/B6EUG+F2H5RRQFh6dJL1wgVxieyc/1nGmLXZ5iUUX7KWY
	 nMcDteV75H4tlDPYCjcTn5n4BFf/GTwQrsdI9HN7PQvLoyrFTOa37eXjULL1TwqHOKfAD
	 KFSbEWBSpQsE9stc73uIlNpUsjaBdTW7v8Bw9TzPm5oJpWoNtLZH+mgVcg/cZjmGvxqj8
	 BXxRvuSHMutNe+Az2Pi/o41yXP2kZ4UDHBvpMb/Ff/vW1+x3GfNITvmgpImI0E9gDa/27
	 x0ZLBfABmEnUpfYcubefH0qyQhPv2pFGEn3VANlhre0ydYFxlClPwM5EukReoREQiEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezhGUhXo;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951FB606D807
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 17:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 951FB606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezhGUhXo
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36d6765756fso2607108eec.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 09:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898335; x=1794503135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7Mrcemi56BF5iayGoRjCtdHcIwbWskinGPPufbe/aA=;
        b=ezhGUhXoIUl09y6+rx0VThMrADfNJzLtbjELvheIq2XUjEVn+F/n+Ri2C53TV9L6Aq
         JdGhkEmCnwmkPVTv0OB6x5RGwGBQJHUjt1KyKJv1eSBurgKo52RA3J8/QRIyxJZsDOQU
         n7s5HLJdofzUUsrlUP5HhN1OEHjO1pTWgNUtwsTp5+pkRYp1fI+C+uqlY+LxQRirvNrb
         Ex3MFhTRMHWMTtME2TIEuo7EsT/3ZplABIXud7NOWlPeo0lDAdVbld/IOwaCZ8vfz4uj
         z22wAGLVFJBUWinFMtheNWfoQbFjMbEjptQEjYgl4R/mPdYwQwSpcnETlWlj/Aj3CrCr
         m0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898335; x=1794503135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7Mrcemi56BF5iayGoRjCtdHcIwbWskinGPPufbe/aA=;
        b=RKGKpw7BZlpD9eutJ3Z3lElWCbdtvzm+CsrOyYfhn5WGly8t2aDpw90v86Wk+4kBl1
         GftLs9wYdn1Pdba07BpYqIlk+y3xJ2VO0U2f6jusgqQuuWxmTY7GP3C5K2TLuIuCHUeI
         SJpee9l3n1ACCsUH5ptkPfLD2LFnRMlZG3+2w4ygfk8lOnA5GoSK5VJpyTR0t8y9dwV5
         yMH11DygYoO5yF3poDPKEJp2pH1oBWZ4EJfbDpjCs9R2aAMasE6WhV6p9+lKAf87Am4j
         ICMuYK/S4B3Ergg/YMeruCHMsf66UtZ+w7M7FzOrF/rv8qAeDRiyXPtm6WaCevkmd9V9
         bvGA==
X-Forwarded-Encrypted: i=1; AKwUvBwtXlm8bDQO1UH5KSdEkrSWQl3cZfwKmRjio9d9nKEi3+wj9OXgtANc8Hde5GZyoGGZtDYe1njZ3/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4huXW9TPXjE3sB4wdrZ4fo99MIz6mXJ+pwBLA1ioodBopXJWo
	iZ4Unj3XI1rjp5r8DW80ExG4oa7zWfGKcx90L3CM9nagDaNT9TKFbto2
X-Gm-Gg: AYBFou0w0wC0pr9ODVkSZDoKja7l0LX5z141n9VwC3hPUHjF441BA9h3jYQDPIsGTIt
	bSYtPRCZDdLMAIrczy+nSSKy9FRlJFEuautlCSNpT5zb+3Ef1QmQH4m3cxUuf26QsBxPulTE6q4
	0hgcjfUJbKJxKTh74yd2/ahkN4orTY56D6cSwg5akOnn5SYvr/VlLbwXxFAfNFfySiNmOP8fIjj
	aH6etdp7nywEK6Txef5Nq1ev9zRzpZjh6viNbbXRRlaX58LTKmyDhdSIgR1LI0npPucPuyLqGhv
	A7Wt6PYJ/U1qIAHev7OK4ft9C4/w5qqYik5Frj8gDSVdqBkSXBT+EuLRcQaBdsY95+DfAcxtQec
	l5xy22gJcVUidF4zF3oqwkcgg9xLA+7mkdVoRZ+jmOGtKQZiI7Xf7HLoaWAexJcMS2lH5rTs2Qf
	DzzQqNeyqiuJq4Jw9WDxl/MV4nxu8uSjXYVvtpDiuN0/EQMbwp8qHnbDE/RtnWtNr5kYUkoDpTE
	XAvEYzdctiqzWUFhn3xzHyzuCZ8zHB5/6dmidMz6MWJWRxNR/DNBd3jT+XclO9LB8EB9BSqGSel
	wDbDZ6odMzec+9ge6eQDhomB0v1wI1js7fam2QXqzxHlh7msag1L8zuLQ52LsbrVxevjqRYgjd6
	Cv47wqsQysX0mivk=
X-Received: by 2002:a05:7300:fa0d:b0:36d:7feb:8bd3 with SMTP id 5a478bee46e88-36d7feb8e1amr5835338eec.11.1793898334471;
        Thu, 05 Nov 2026 09:05:34 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3989670sm23943795eec.25.2026.11.05.09.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:05:33 -0800 (PST)
Date: Thu, 5 Nov 2026 09:05:29 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Nipun Gupta <nipun.gupta@amd.com>, 
	Nikhil Agarwal <nikhil.agarwal@amd.com>, Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, linux-input@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, iommu@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 02/17] Input: serio - attach manual drivers through the
 driver core
Message-ID: <auy2plYVi723Qt42@google.com>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-2-1e536825b4eb@nvidia.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-device-trust-core-v1-2-1e536825b4eb@nvidia.com>

On Thu, Nov 05, 2026 at 01:42:15PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Manual serio binding connects a driver before driver core can admit the
> device. A rejected binding therefore arrives after functional setup.
> 
> Keep the port ID check and use device_driver_attach() for the existing bus
> probe path. Driver core then serializes admission and handles probe failure
> before publishing the binding.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/input/serio/serio.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/input/serio/serio.c b/drivers/input/serio/serio.c
> index 54dd26249b027..604440244c1ca 100644
> --- a/drivers/input/serio/serio.c
> +++ b/drivers/input/serio/serio.c
> @@ -81,28 +81,10 @@ static int serio_match_port(const struct serio_device_id *ids, struct serio *ser
>  
>  static int serio_bind_driver(struct serio *serio, struct serio_driver *drv)
>  {
> -	int error;
> -
> -	if (serio_match_port(drv->id_table, serio)) {
> -
> -		serio->dev.driver = &drv->driver;
> -		if (serio_connect_driver(serio, drv)) {
> -			serio->dev.driver = NULL;
> -			return -ENODEV;
> -		}
> +	if (!serio_match_port(drv->id_table, serio))
> +		return 0;
>  
> -		error = device_bind_driver(&serio->dev);
> -		if (error) {
> -			dev_warn(&serio->dev,
> -				 "device_bind_driver() failed for %s (%s) and %s, error: %d\n",
> -				 serio->phys, serio->name,
> -				 drv->description, error);
> -			serio_disconnect_driver(serio);
> -			serio->dev.driver = NULL;
> -			return error;
> -		}
> -	}
> -	return 0;
> +	return device_driver_attach(&drv->driver, &serio->dev);

I am not sure how safe it is, serio (and gameport) have pretty elaborate
structure and locking rules because they can recurse into themselves (to
support case of Synaptics touch-pads with pass-through PS/2 ports).

But this call is for user-initiated probing anyways, I am not sure if it
even needs "trust" handling.

... And I even thinking if we really need to keep these custom
attributes or if I can rip them out in the future ...

Thanks.

-- 
Dmitry
