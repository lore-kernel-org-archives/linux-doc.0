Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06B24534B3
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 16:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625836; cv=none; b=G/ChhEJX0ueKh0RnDs/3zF223U1rgsKpXUXx2slzC475bW+9GlbJmyI/l7yEjXgpnFQLqDdEyDc4QZSYUQEexvDGCBifxUOqWIbmtnUJHrL7PFiU/5t/ktjBilLNqWQAiNVDtgFHJ1mute94BEZfO36/uBQkn6pq4UnzEQkGbkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625836; c=relaxed/simple;
	bh=w+HrTFr0z+tqsQh2Xdwmp0XrVFet51gpeHWW0S6I9aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swduI/2OmkKDfcjeMbEWz8Uru3ShPIbefaWqNsIptgLtBF8zlk7Vo3Zh7G2GmbXynaO0mkx77kmk6bqgt9E3jPHVTFbj5SNqKNDO+W/3meBdnQwUmpzewZaQ1vmhSCphctXtDuPzZS1uTGS0smBoPQmZUbko13EzSrTluE0rgKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtKPOqRL; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtKPOqRL"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so41391a91.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 09:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781625834; x=1782230634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SsBsTPxJdQQQDp4kGeaeLy+dHUagTpgcZ8ic13rhyUU=;
        b=AtKPOqRLjOPhR2zANpQAjIMlhjo0aPKVZcyMuZssHYTC2l75iFy6Bo2tRptaa6y6Rq
         Gy6CRKpnIG0pojUGzMemtlySuygOZ8etCiGJxxofOnzUo2fKC1Rjw66i+xCgwp0bbldQ
         XFvHTMxwnqNDQSPVXnIT1tPAmdkH0Sm/2M7mTEXII3UvR0fgNCSpCGf77GWbTa3wxvVO
         9Y5FTsCqL631uYErWh/B7yw5iE4bIeD4biDl73ckbSZ+GzZd9W8MLeGOuGi0WI9h5hrt
         Nmw2JyEcBG/VBo3vF1n2PhrKsG4vwcYAebQvF7UldJ2OGgmvNZPSgE+OKGKYKvzoquS8
         W7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625834; x=1782230634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SsBsTPxJdQQQDp4kGeaeLy+dHUagTpgcZ8ic13rhyUU=;
        b=PuqyzCwCwJwQb2CTpUgAj33wQ0fRUgHtdCE2nOvSXxxA+Dw1nhcdnkv44sN1BM/8jX
         CyEv1tef90wmmEvUv8vVIPZSeC6ToqNsWnwbqDVz9Y/m7UOdMCw8q/qytdSBo9Bg/uhp
         DZ3tFFd8nxRH5+ka0gLv5YjCc/sjhh4+5VWGD0E8S9D0frDztl1zIAZF/mwZ/nYAqGOi
         OxoXgFsCl2FJuP76Uz0izhsbmGllXkZx6PAQnMWG0Vr8otGt+5w1y3B7g3BbOXynkuZI
         9V4vSNpSL/JqzFu/6eE0JZNfECPgTpLwpNsMKCCbwEzyfzQl83yeGTCqNeMSd/gWNPsm
         CE4g==
X-Forwarded-Encrypted: i=1; AFNElJ9VWRSVz1kCsUY49/YFaVUqkpnvTjjzRyyt6/+mrWy66++mgNt7mzaygJWVqQ46IstdMD1VfPFhKKk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/5OOeGzgpmmeI2Se7niLz1CzrAOLwdwdcQ2k+UeEj3+lYLejj
	44x/9eZD8MFRGeif0ZFhyukulHMQtSjyKcjqF4v/eoVjysgeEbgVJ0Wk
X-Gm-Gg: Acq92OHqZRrp5PbGTEtamX3vz3z6djH9TxGxVAopq/+vAJm4yi3HbDKI9bWPirHVCNG
	XX640VI3ln01Y69sFAKDXn29dzmsy2wPAR05aiOdHhmjoGKREnzoT+2+T54qu0Gju7IokDEdYm+
	5dywLU0OCRpyzWUEZ+nQfqiIAQUagaN61iyTJbjP4YyxEZOzcKyamma5JHjEwONkJOtiLgfwTNr
	qP4d6gyyYl0e+dhl+fzlNzsf54qWimKlfHRcJvg5YSPnFoYk8XJDGZNXIabQ6uKIUp8szYinudB
	e2otgg8a8SMr5bQbJ/SZcBZUCLaL/amcJzDuImI5KaC7vQKlg4vgU/lbu/JLgZ0HYhbXkcQWfw3
	TWoAyVx67a1LMOgHM9cX0TTI1nAVCZanX+KQWiZbx7+J3b8uy77OGCY6UiaKGL2ktf/oAeJlf8w
	1lcbd2tXgfUZcrp7OJrJ1eiYZmTf2g0rWwJy7J
X-Received: by 2002:a17:90a:ec8b:b0:369:742a:4259 with SMTP id 98e67ed59e1d1-37c52225167mr3687652a91.0.1781625834282;
        Tue, 16 Jun 2026 09:03:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c955ae559sm6127a91.1.2026.06.16.09.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:03:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 09:03:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ziming Zhu <zmzhu0630@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Ziming Zhu <ziming.zhu@silergycorp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: pmbus: Add bindings for
 Silergy SQ24860
Message-ID: <46ecddcf-c452-409e-aa2e-4b562b096425@roeck-us.net>
References: <20260612030304.5165-1-zmzhu0630@163.com>
 <20260612030304.5165-2-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612030304.5165-2-zmzhu0630@163.com>

On Fri, Jun 12, 2026 at 11:03:02AM +0800, Ziming Zhu wrote:
> From: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> Add devicetree binding documentation for the Silergy SQ24860 eFuse.
> 
> The device is a PMBus hardware monitoring device which reports voltage,
> current, power, and temperature telemetry. The board-specific IMON
> resistor value is described with silergy,rimon-micro-ohms.
> 
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Applied to hwmon-next (after dropping the extra blank line above).

Thanks,
Guenter
