Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C353D145B27
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 03:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888124; cv=none; b=JM1u2vPHKz0VAsi290YeHbis3TrUArQg1fT6eGR+mf4dYyneDfKFExsReMkt5HkppHqo6j1iuA/QSOYzlExHiYWnTPXKZemQkjPZ78teGbfQSUMpndPMTQsy1pxD6sxTAMmf8nTz9jnZfl43iUfsyDKagypccTcQ50yW3PsODlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888124; c=relaxed/simple;
	bh=eO7yVSb+ongNWkKbPuJJgDwNs5WTX9mm5C62KLUvoRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1RvOOFhLaGwg3qA1sWVsKnVOX9Cy1/pVWbdLiiZU74VlxnUcvfiqh53VXbKV9/te70RHBIHKrQgpbSQqBL+f2uPghrc3LGewuHFd967MQOH0GnCF2+cfwogjwXwC1NxBttlMvAPTz0AbZ0Bf70IJixrBJiXcJrZ/s61FizhtE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n74Cnow2; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n74Cnow2"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36d5fd50d20so2398845a91.1
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 20:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780888122; x=1781492922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZmjdnA6Z/FpveiHy+bpkM+wI1acYPmFvyA9Nr3I4wg=;
        b=n74Cnow2jipnsiaIWCh4pBIYOzgyXgaymlAUYlsV27kmSMo3v53jIgxgmIScVQGLux
         MlVn2NxVrCtGjziqIIEr8DMuZYbigavfi2D1ewnZLbmzXZVPNe9M/G+70G9b7v/4xAZX
         IgjN3zipjZuudD1YPvcowIru3TzgzBOHqJBpbketCB2lYNtkaKpDIIDJYRSH0gDmJWcC
         0gWCFHyZUspVPmUKV4QwzuDvreFUTfUqHM1OwWGjXirAOJFCi4qr5IslAG6X/e5V/20T
         mhwAQwUxoBDKShHweTygYYxutfh0krmI1MHKDQlF3FfNIRnauevZ+RmQLwuKbPTeqwwi
         R/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888122; x=1781492922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jZmjdnA6Z/FpveiHy+bpkM+wI1acYPmFvyA9Nr3I4wg=;
        b=VnDMC2hTNHTYLUkJ7Ro3bHpiEt1EN/xyrJo0bXj2+rnCjcfnlSP5wgFAtDRXyROKHU
         mtPRwpx3JzXjkzhucaOfGSUF9qLCHDRQRRjmTDEQqJCske3vNx+A3LgE52ZQGYGleLeP
         nyTyfzTbUfqa8S9OZzomcwbzsHn5BCpmz8m2Hdn4EzaSGFgZ+dxkroPWEXePbBvLBiZo
         ujDwarl1+08n5DbQOLv54by+eSN57oYd7wW/IlHUaHJBNfIXvxSt0vgvtnen+6A9/2xI
         oVmS/TlUEccmb1yELLMKnv3YCCuZMYXIm4j+x2tJs82v2iSUqwODW2TqpsD3S5J6lva4
         Jhew==
X-Forwarded-Encrypted: i=1; AFNElJ9TSyeWp56rUaHWKRLdYtj1vvLjGo3WtyxHlqehRmVJq7XLa8QOkf028vJ8VuYprY2RjZm7Ao24bdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMRUez4WCUePFdKX3375IAU9lSoP1AZnxVBW8DBj3rftTiK0qu
	SHzDjtME1MRy89+KCJJ796pr3amp4GnBZP1O5GiFEWR2TZW2bI8tv31d
X-Gm-Gg: Acq92OEXpqMlM3/TxF3fVuS2IjFyitsjn44eluCkIOZi2gcwM8OT5ynjGjITFlGRePc
	Tnwy9rsf/kGetT8J1iSRNMG1F2NiKVSXyrHDPnCbEr9W1th2SrXJ5+4cOBncfVok95tSpm5ckpi
	Ws3dmycJacpHNFgHRK9wA1beBN8PVnKRv0/KlqfEmhCzbklp7jycrOTu4j74pBI5H+Z7sr3Ol98
	XrJOotkEJQNIT6yPJ0480o7318clctPeRYjW/f9qmXErKs75PkvZemGA4cDbzTTtd1tP983C/as
	mcYEH1kfh6/6NC1HVxogvsa1l0ifKAPYUC4vMQbdnOa/63Vtm+mdUQ7COqBYwOsjnZK5imiEz94
	S5udXjYXQAJPBrPOl0YkOpHhKUP0dzBvXVKy2X6Z2fIWkMiIvawq4kB3fS0FS/P49CcVLYVXSbY
	0TJ2WbDHdryu81Ug4zCkdYTPCm80qarLqdOyKLL/8Si3tqSL7c2cokYGmbpA==
X-Received: by 2002:a17:90b:4a0a:b0:36a:fcf5:64bd with SMTP id 98e67ed59e1d1-370eec10e38mr15237248a91.2.1780888122204;
        Sun, 07 Jun 2026 20:08:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f710ee4f3sm14702020a91.13.2026.06.07.20.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:08:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Jun 2026 20:08:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"noname.nuno@gmail.com" <noname.nuno@gmail.com>,
	"Syed, Arif" <arif.syed@hpe.com>,
	Sanman Pradhan <psanman@juniper.net>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Message-ID: <6cbc0058-5471-4199-902f-5dbd574df886@roeck-us.net>
References: <20260601184516.919488-1-sanman.pradhan@hpe.com>
 <20260601184516.919488-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601184516.919488-2-sanman.pradhan@hpe.com>

On Mon, Jun 01, 2026 at 06:45:30PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> Add devicetree binding documentation for the Analog Devices MAX20860A
> step-down DC-DC switching regulator with PMBus interface.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
