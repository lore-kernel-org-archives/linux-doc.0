Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974984;
	b=e2sJ/hSuBqIl7NShzg1cxxR2dj668uC4SJkxc9R0F4p6NRHEiPKgm5fUhQa1fPnyBZuV
	 Njb2ipBDhWLQ4/vkkdz5xGKV7VMPBhYFY3P0EnmoyvFdi1o5LqirrU7Upgm2al6O5en9+
	 Z+8V8kML00gBltr70nvalKsz1LLNDFfJfdySzdy74AmuCnhwR25N045Rfhx+jDxXhfJQ0
	 F/8P1hXSN5+3VGkaq579m/lglbLJfwYQKvMCWW7C0EEII+46YfhXr7GFPDCOjLYj+c2n4
	 r88zixq+J3IWA05z0UxN4AnGrjSizpdWespa4A06fj4G1VxhIP4EG+1CeNrD/gOkf5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xKp+d3bHeDhxK2cX/G/plq+5MAzOmIHe2O0mVksp/JE=;
	b=3cAOB8UJM2OmaVVEqg3VZOIz3C/3zLPfV2zVLqnlLiAbglrTu2136AWv5L62k02gjcMH
	 dR0rQvRI0gjAOlQFuI4kQ507N8owyjBIFuaMpj8s1KJWf8bz7nW6GP2Kw8+pFhfZ/VHqt
	 8vAG3EB0FjWOBaZFJiKtwHaAtrYeaJLMox6dMAKvZCx0R49CP6lS4w2w7JhFOaIhWwRH7
	 sfxnfg7E7a4AXzF3XR8yu2N56a1xGvQ2zAJrc+iYXMMlgHeRbp5TSTTaCqXe+dkn4B5mf
	 vSwGYHLXzCus7XvtXZP2yZ/Hky+3WOJzyMxpD1q1pENlipEZn+jpjDBBS1xUeQYaEhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="A/k/dzgx";
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B164C606A31D
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 00:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B164C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A/k/dzgx
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so721190b3a.3
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974983; x=1793579783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xKp+d3bHeDhxK2cX/G/plq+5MAzOmIHe2O0mVksp/JE=;
        b=A/k/dzgxFGHZlnRPKB0uFI6RamiDqcObc53ls5NqfEmj2xDJOQswLIvnDVWhoUj/1S
         OOsihDiG+3Gv4PBnR6VH4yMr/F6jxy0aYVKrnXYEqnVrf/XCqBhlqhLjIMbZGiHXjYRQ
         TtFUzok0tjLSq+9JtQbSdfjYDhk0oezU8aS86CtASqyVE9eXcAL02GPUsjSEuE3Ig2i+
         2mCLr88OhzqJtBR8P4dYjmec6q2utQ7jzwRnurfkrYWsPB3Siqmm8WkE0Ahey105KuHw
         1jD0MT7SCTK+x0qX4z41EntpYGV3zofbXUldvJVBFsJrr0C5UVQlqm8MTu2dQnz4eACE
         Stgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974983; x=1793579783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKp+d3bHeDhxK2cX/G/plq+5MAzOmIHe2O0mVksp/JE=;
        b=nKxLettzXnjEf8QRS88UJHhIhNIgr8FzFpyBHlaelbGtpZvZmv72rpt/c+zzRAAo7T
         K66lkLAXS1Sb2sEEXczx6AAJnA9cJZXwPY5pW6jTrDm64vxM7b/XNLJXJG3DwAm2bQZ+
         aAyv/J3PJEN7w7f6tKTXgKh53TMwScipe8B1qorEtxELYNPZF/QjNR9kBMrj6pSHvIww
         vr3tciGqRDG6++Ztf1sTWVY9QVM6k+NcCNRZmggC5DzzrZH5HMBalv4MSsq1KWJvqeX+
         kXsdWsMr0LdQxHvKN8NZy8IPm3Mo/+GTs+nP7xfRIL1wP6xlOZ1ZjSs0Y1b7xv4U6NkW
         Kq2Q==
X-Forwarded-Encrypted: i=1; AKwUvByBrSuUEdNqidI8m5ZwjllGmKQVYgg84KhTfq59l+0F2K6Nt2K3t/tHwxCAarIlCCBXBpQAOa6njO4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL26iMaTGBN5maRrVptg4CMy23tgwZPPeIU6Ua0nMk2iCr88pGF
	caqObY0RYteuN2PJousSWxQYIDOPn6xoJcREYVhUFQR9oOugjP9Ub1ci
X-Gm-Gg: AYBFou2QTbfnZXuNLmHHIHFJAIC76YkE7Xuiake8J7/RaOOJ06vkFe6pliUuOApctrq
	3OoE8iNmjGal5Z3vL6oGebK3B8MJpoRBXfHV2ZHx8NxZobEoRwJWsmiumiLWq2FZaU31MMkLdf7
	gQmZAGnPigynWiJ9a2WqcmGwOBYg3nfhUEwqOe5QTTEh+IV3VY32AotgaWsmthidlRFh+NSajX7
	nWF4Utm0jylqRgxb5BkT2c1ZfRglZ6BeLffjnVUQDVsKbofCo6DpcR8lxi/PwqLvmnGSz0N35p3
	N6n+4a0HPDfvfXMgF4+9GL/gC1/dLXvqIwZhvpu2gj+3oQoXoSGD08nVLFoIs2afEpZpuFsirbk
	i8DS8im77mYRTq0Z+G7RcLhXzSl2x5RLdE3IXjqW01iUcWxZghph+MhKd0T/zkrJmksIuEuVOcu
	cpwDspSoffN+jqIt+ph1KA4ZeZczFtjGaH5HRiG1hFip/08Wd0Z/yWGMewCLtKUWyJse8adYlDC
	U8yW0+HQcskVFmuVirvqdXq5RGWE6kOdsw+Rz+pTHrbqckeHKQvk0DrenGgLj+r/OZssQ==
X-Received: by 2002:a05:6a20:ef1b:b0:3e1:c08e:38f1 with SMTP id adf61e73a8af0-3e7cd4d9f61mr3858101637.14.1792974983056;
        Sun, 25 Oct 2026 17:36:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d86790sm804169b3a.1.2026.10.25.17.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:36:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:36:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars Petter Mostad <lars.petter.mostad@appear.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
 FS1525
Message-ID: <b5298436-ed79-40dc-996c-887b2d4bca73@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>
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
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:06PM -0700, Abdurrahman Hussain wrote:
> The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with a PMBus
> interface. They need only a reg property, so document them as trivial
> devices.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
