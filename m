Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D0F391851
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 20:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766625; cv=none; b=qfzYupXfR0894bqCq+uPdMEumuVs1VwB/fvQVjneNio0p38SnGEWw8o4Qa/NqJ9ahYvWJ0kHSroIhc+wuSejinun5SFxrpgBSTSKecV8i0jzfyJIUdzgf4WNegCm2ewyx0btrVxnrDqWOL9BRfv9jP7us0FyfAW7kztUg5UcRq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766625; c=relaxed/simple;
	bh=bHNhDWh7u9Z2+sZaN2uuoQVlBpaSrE8nC6eznwRWtyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDqTYFgmfKVVtSfU3Vc6MfIu0JbkSCQ99/NiFXq4LOTNNEVoM89CV69qKAIQSAszyzU0tPq2JuIcJN97UHmUMw5/mNKsgUOeLfNI7msLfXZHTdi9UGdr1XiU/9HXn0NgOHTwyoA+6szGmv4Sz9O3PRa8y4z3JpDx2PMrhYBmKhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jiwr9w0x; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jiwr9w0x"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-13a97ffb312so925735c88.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 13:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782766615; x=1783371415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mx2dQ5L9ZxXGnIiAZvfDsVtz/jVqs64aFFwCkSBQ9pw=;
        b=Jiwr9w0xB5hzgUYTnTmozySgUJakB6XJZn+W69cUGu813bs8KmiMKAEPKUmOpimQow
         TUMZD/3p3D2gu/ZnGvy7+E168uJwpko78BFCAp89ANC4Wx4/qC28PqEFOkNqFQIOTrYq
         Q0d21t2pXOEykIPB1w4LSkIJyYMrF7yPadPbo7NAX7u+eQ8hAtd/QHQxjQNf9J7ASXSn
         r/il8ZYXxV/OdZ09mpX5d+vUut9nG2IXZT6dKx9eFSPYdcAmKpfiP007Ld2n36pgyD0B
         juqKDkNBfKEy+tAXVmoBlKbx+Z/z91vgEtZAB4YruLfvqFlHNINvVqritk8nvVrcJaLg
         E6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782766615; x=1783371415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mx2dQ5L9ZxXGnIiAZvfDsVtz/jVqs64aFFwCkSBQ9pw=;
        b=EeH09xy1m1Qw2wNGGnHO3MrT6bMumCLuQJTkIci4A5WP7nJlPDkW6ptXcCFTnK/qEJ
         ba9tXD8NQ1YPIlnu625UIzKam4G/NOhOt9LYIU7+D458EnBH5YNeenvkPdyGAFGgRmzw
         nORfO5Pj3HxLU/n3itqT69tmCBw3VtzZQ75yslEZUeHJ0T+kIwD7VZQ0FtlBzsCRgdDl
         LJRT+65UmtFcW7wjrwopZ3p3vJZEG0PDE5Qvv0IkxWXua13coVJ2BvnaPJOvF4GgjjRB
         DUMJnOQ56xpFqRK0DGsvIKMbsbPWPsPOPTsT3Vkdcu0V4DZbpCz2YAYzfM7so3CZtewv
         Yo3w==
X-Forwarded-Encrypted: i=1; AFNElJ/AKukqE/vAQWnASVsxiaLCEm3TpPY3onu0nKLMvy7EkSApEgSZ/bZ5wO02O4OJEDIL0etwTbPZNDc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+iwdmMT73+W7Wr1wrkKXtCI4eFz582wtyQ5yzcQ2M78Ny5kCh
	Ff8BLyHRL9eQ8XftWFxQZ0kyloq4lAlRw3R3sffR46sZFFyc+yvN9mBd
X-Gm-Gg: AfdE7clP/9UAUwhig0iNjNFSkYaakGJ6KYiyvFKqgW/20gJDRjzVnP5DRVzgtQBaIC/
	KBWyO4xMTmnyXuPSR51pePYWWyvtL0KTstPs4AtLoV9Z6XLfsosVCmf0EjCfwsLhgWNC8VUUGmT
	+ckNiZjTEtXB5Ng/yXO5D5nptCVDDuqJjGT6JFhpTOKG3+DXAkmHawDofjI5bsIC70m5TyfIOtm
	QelT1WQQEUJbtEPOm9T1buTvN8k693i7n/o6Zvb+hVlMYTSjMnn+KvrjuEcm7XT8S2PWOaLsGQX
	M7CxhoCViuveY+s9ak8E3qSIl6pROf8XGOx+qoLbrcUGp1b3kjb6u7KPqehfMioOON9NwbRPYby
	NPR5xW8IlxdPHZqMDOh3Bd08+fq4KznmB7dIKjckpgjo9HFaEAonq99WU5TIL/B24igNxa/UsG9
	oq8GiSP01nWyaD1Osn1BrPEe4u2w==
X-Received: by 2002:a05:7022:fd0c:b0:139:7a48:fcb5 with SMTP id a92af1059eb24-13b2a1db6a1mr486209c88.34.1782766615182;
        Mon, 29 Jun 2026 13:56:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab30047sm902729c88.8.2026.06.29.13.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:56:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:56:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 7/9] dt-bindings: adm1275: ROHM BD12790 hot-swap
 controller
Message-ID: <d8ad11fd-3ce4-43c0-a9e7-d006204522c6@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <753a6ded3e1aff1aaba7d932f0a883f789d9dfaa.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <753a6ded3e1aff1aaba7d932f0a883f789d9dfaa.1782458224.git.mazziesaccount@gmail.com>

On Fri, Jun 26, 2026 at 10:25:13AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Support ROHM BD12790 hot-swap controller which is largely compatible
> with the Analog Devices adm1272.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
