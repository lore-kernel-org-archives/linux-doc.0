Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0264B41BA8B
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163230; cv=none; b=KpVE4BI2pPN4VPHqX+1hGrfD1FuECDL9qmx+nOBnOQNbhzo4VVj98VvpbA4D2a6LOqG8eMMGtvOGnVX5cwzeiYzHGhQx7boPHFAxzJ77NEQROEgTsxxqf/hJAuB2EkWqQxCiK/BhxybSs2iBuSiZG6AiVDyM9DCYt/guMLQBf8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163230; c=relaxed/simple;
	bh=GkGLWRBVPs/nmA3hEmanxLkmBU7gAjvtEPfAEMBLiQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzCDtYrlf0yr7UPKx6KGP0ij7H1DCaH8/A6BHAeYbkBbqCWvbj1DVbJuUdtzEO0UDwzuA34cP1SqKRWL7sq5J8xLZXlBlxyQIHtCW1el/Y1qGxK4HEoM3WEXo5Ov07o9yx5nuBiTC5P7s7izk+dgHZbupdE/I2Kutc1mbSW7j80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d69dyCDv; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d69dyCDv"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso1632300a12.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 07:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163226; x=1785768026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y7GYu6iHHA83MEJE5lfFciA6n+k6vBppJrk9mCjfmqk=;
        b=d69dyCDvoPYBpcDdffOzicZIx9W0PFkQ/thfF/v1KosfF6/FoYt1oW8cX3/FLaHN76
         aIRaWl9l/y4qheTUZWQVI+trlrEiqn30+thsQAsD+1ca2BE7AuWHc15LjYk+U3kKG/he
         og47HS4eVufjcu1wl4ohKMTbJp6M9qKpharYbahpHAUTsFABzDgx7f1ZxFOda2yRk5gA
         VBnUmS+nfGoTInd/F39i/mRwJC+1BaQcQbvvn7cQTPcF3mIlyug6pF2hH5Wtu33Otdi8
         fD+jGmiKq34cRZhTLdfNPRnRpAUvWzF7fhI6xFClcK+XQf3dYGmPkugD40fdMTkbjqe7
         t8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163226; x=1785768026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7GYu6iHHA83MEJE5lfFciA6n+k6vBppJrk9mCjfmqk=;
        b=Z5YZ3oPbdbnc8nlId6PxOW0SDuhAfxYM4LOiyMD3wulbXRnnK0eFIXRShfSQMLmrdV
         fKcQe/0uyAgeKaKG1SaYeVBiOS33Zb7zhpolZQZofSJGotn96o2566P/ygFVoG3g2VFf
         D11dv3vmRBzmt88QDrHHYBUq0N5M47VQc7tVIz+WClyhq9Xv//0y2zDX2vB25D+gly77
         Kg7lCnlcRCGU3PoUr2C/7w8Cm3raWlTjSSUdDCy587FJjER0DMcA63RDvvM8MX698jty
         jAyA8bsyZ3H1P2tY+BbwZi+Mz9pZJQtlUi2nKPV+NSNXbiztt27Rh3LrfZKpY8f5hVRc
         N5iA==
X-Forwarded-Encrypted: i=1; AHgh+RqRSM9Cbe4wlX4eTSb+KyDmkXFkxT/xlWWpmPXlnqG8BG6yMC/MVfefdzmSPUmF5VmXKdWqbFdhYxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKnTxmmbSFq0pXsmw6YLS4laF94LGv3jBjAOEL8nWaBG9PA6gp
	5RFFIjzVlDpOBqJ83Xv1AxJqHE8QKRZwElKYgZ4p6Y8Mqtviaf6pYgCz
X-Gm-Gg: AR+sD12tGAmznn/CS/mpxJT6oZZb/5yc6N90kA0nQ/xZXIv5DSUZrvWuIJE21f3/sJE
	4kzqFtrDf7tNmWybEwNk1J9qOl0MAsXpXRbmCIGvEyGgcqF8yze0mmg29Pp00S4OneQQVQ5KeaZ
	LNscQeIDDC0PfVDkpAACqoy8g4ng7z/lmsQVTq9XfYGOlwydDVeijhH8lz6HyBPjRiHaXn03wz7
	xRMX95AHl23LrbBVAMa0/+2mf/FR/jKLdas9TdschSCg/yKHPlnDpdEMgvBuIx+0HuzdpUrFLpm
	V6/Lcq8fwXh9eP4f1rH+SSupn5TActSEtlywVw2SPDF+TV93I+LGewJunoZy0Cp9uwAEwhovhzr
	GVz/acwwugUvq7ccEpVgTfhaBpA+IYuMoRoIb1P77CpkJbqEEZoAOV5A0gLXxN7CjgDjDgpHr5r
	4HDMDwJkBgeOuDl7I=
X-Received: by 2002:a05:6a20:c98d:b0:3bf:6f30:1ccd with SMTP id adf61e73a8af0-3c67e071b78mr8053339637.42.1785163226131;
        Mon, 27 Jul 2026 07:40:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59cfb4sm32413945eec.26.2026.07.27.07.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:40:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:40:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: Add vendor prefix for Kandou
Message-ID: <39ede8d1-751b-442b-bdec-b62368e79784@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-1-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-1-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:37PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> Kandou AI is the vendor of the KB9002 PCIe retimer.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
