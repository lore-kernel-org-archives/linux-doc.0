Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5282D47DFB1
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 15:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018978; cv=none; b=P/33nG29LCSxg183FDi9gSINgKcBU+DVAvO2EHqHYD03SC5ASF4Z1u+s5hN7mGcmMiqcGRbBzCmd8Ji1uq/+X0JnPBHDtqh0B5byRUbGyhEshj05SOaQKKguW4q9g40EMurx9QtVS2oewC0X4vYAXTLQ65/kntpfTqWDRUMoxSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018978; c=relaxed/simple;
	bh=oBMTASf5/yZwoC+w3jFNarp/B0A2dybfqyHkkOvqM8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnFze/IXtmx3/ekiyEcXk2r0Qa+GCYE55TlO5JWpBMlbhu01YuG5iqF9/4MJNdgCeUYegxXxQ0+d4YVaQ+VRJR+9NFzRB65xwUml4hW5K01DhSI8RtRIv9jzusDkdKbKqmwwHePAnE4Q1p9DfUdCjoTDgA3aabwb3TgerfSmi98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmeBzIEm; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmeBzIEm"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8422f395a4aso3578632b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018977; x=1781623777; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqNUdlMGs9SJSOAMJ3lmDavV/mMqU3C6oJBVPqeQ0EI=;
        b=YmeBzIEmqoQDEW6G9Nh6k5kFysNDjseU6avBkwrDBJYuuBNz1zC4Ect25XU7rM30FO
         cJquyzccYYLoLs8ipzxZj+2O9YnVy//fCjtLIpGgAEyvnk+wzcuBP0MT1e9rHZm48zOp
         j9orlUulCCsfqBGabTATEBQsHEXJf5qpmkIHaUxueI+4cXT1U1DCXUAgMUX8CUgoiBl/
         a/jvAGmJ+VpJfREee7cR24iyprwoBKKYH+PgEK19f0QRGkAMaKNkdhSBPtn/zSdaoJdg
         LvduC62uXJHYaf3+U+ncraiEeeVwetcZ941n9mPl86Dm53MvATCKHtBgn04JmVXEz5z/
         yQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018977; x=1781623777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqNUdlMGs9SJSOAMJ3lmDavV/mMqU3C6oJBVPqeQ0EI=;
        b=hBNIqnHDlELSLvKNYzVWdTx49+T0MjLr7mIFwBEi558Yg6ZOgkcVZWXKFRUxWaEDtP
         DTndgJOBSGjKvZM/ahSXKINneMMj3gR1hirGp6nO5IEZxB5OS/10wSaU7RONmFMMlv6E
         IRkmA1lnmjiAZ9r8tKilNMwrPtG1aRxUfU3f3iODesY6fLt4SnW8eR8j/yMOR6s0lfgO
         dzpdirjGC1PJsVEIS/xDTOIQ5lTdes84HZ/ppcA5OIrbyGuL8D/QG9vOmDFvNDjDY3+5
         Wd6+5u0SDux3iO3Lw6wD1KaJULULI4y4Aq+gi7suvXrt9ucjMpkr3S+a39KdxHn7AvqP
         X5ag==
X-Forwarded-Encrypted: i=1; AFNElJ9U0ZGBsdMiempBC+PBnDyKu3wL3R4FylwlSyR2tNJ9PXGfZmqBwB5h+bLb942UOXSi6hhPCbOsabE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJpzhQ+Gjsp0xmkbUovw6TTagM3DSRjBLxbFqOY0eanqkgG+uJ
	se8h1oLINdcVSdal2pv/YBmVKi/RrvXnL7gBEJ0OArMVC2gbdhg4vx5x8GGF3H7E
X-Gm-Gg: Acq92OGdmFRKypIMW4pw6ioFcwJOABYhDJz3t/pJzNzZxN+sc+D2liQl5P8eEuqarxn
	+r6rSDLfmkFusIEIdJC6e1jAFI/7J6Yn1L1GJ+ayNoc7wTCI9pOauGD7BC26NwJu9e5RnJP//UO
	zsw1TLh2tL59oKgG7xnXKV3QzUn2ewWRjpN7KCivmcG+e1Nqaf1yJ0ivbTfsrF3mnmwellNNXLI
	FrVdVsBEzBfb/m28jYRfSrQJUyt8xHT+97nuPt/S0boi98Ga2fcpJMR9bH0F7HZ7uD80Gy2TZoU
	8W5hEw10ILnrkHC1g/CvedbecEG/FvWYIdD6ml594QbF07Zxrd48OwPsDyHtoNOF4hCxue9u2bd
	iEFoVINFyTi1CrotC+afmmXUyZEzMFBapjL4Ap9rjt3MtG8v+kjnN+WOuP91aWScZZQhu+EzJpX
	CfZdA+a+GxYW3ouRUNAoisSbrAojOSXHjPZJZVTZlBB16bi2IaewpS5F+nxg==
X-Received: by 2002:a05:6a00:1405:b0:842:3841:fdb9 with SMTP id d2e1a72fcca58-842b6823968mr15870182b3a.31.1781018976770;
        Tue, 09 Jun 2026 08:29:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428288002asm21603784b3a.31.2026.06.09.08.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:29:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 08:29:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v13 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <7f1a04fc-587a-4a5b-9c5d-8f73ea5b2114@roeck-us.net>
References: <20260502-ltc4283-support-v13-0-1c206542e652@analog.com>
 <20260502-ltc4283-support-v13-2-1c206542e652@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260502-ltc4283-support-v13-2-1c206542e652@analog.com>

On Sat, May 02, 2026 at 10:56:53AM +0100, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> Support the LTC4283 Hot Swap Controller. The device features programmable
> current limit with foldback and independently adjustable inrush current to
> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
> temperature rise for reliable protection against overstresses.
> 
> An I2C interface and onboard ADC allow monitoring of board current,
> voltage, power, energy, and fault status.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
