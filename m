Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342373FFAD2
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 15:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772463889; cv=none; b=C9VmCitxu0P0HWb7Pr3IUIEW94tyuAlrK9CuDwRChjHhmmlHfTMcp19b+3Q+PUBfGGp42g1k2/k4rfTDf1aiZKnhftVP8jhUx2ce6cU1XfVO/34sUX5P/JFfZNbJj7HAfzWmFM2oMxEuULo+X397suXX1oOqYuxszFqmwnUM2C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772463889; c=relaxed/simple;
	bh=Z3QuW44a1cqmJAISoawP8xM8uOw+Gue0DhunUahM9Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKccWpKsvFpuFthJkZo05lckZWVIQ1dFIF597Gnmd9r+oRCRhgdLSizIEOJ+Z/8ZQa9hNyFp9QKBZwUAFKuoc23Os7+6ES5dr7X40LKa/n6A5jT7O2CULlH0B9Zglqu6LNeBOK/96csPjp/8e/mlGYBM8/Z8p0G6HS4CP0fsk4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WruRTr3d; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WruRTr3d"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2be06c02f66so2976477eec.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 07:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772463887; x=1773068687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJQJNNM+4DO9CQxRQrJTKsiJbgSUIZ685yVxcgsm7ic=;
        b=WruRTr3d7U8Z2pIdAmkls+egdPYBPfFo5wW3NFFWeXLLB0Im7vVRDV2PrNuz/yhSDR
         gKnnwBCz5L2+ssq4RtN7eGYiar4EGGRUt9E53m/NBS7Nlxfs6VI7Lh96+7vbTiEqoqJa
         TVFQjVM+SQAvjg4Ch01zaCmsaYptDT+dwtberO2qqmx5tReiPHRSnRfBzfCMccQ0Jqix
         +ofOK2wGc+yCydQycFKQUAK/xrxibd1Mp4ZA24mVUaV7+eUC6JgZzXOTJKLNCbClgK/W
         vC7YJna+FfI39W3pq+j+wDP1REc9Dkuv970+3OTsu8zYjLYcmoYX1aFWQ/h4f2sqhvzI
         939Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772463887; x=1773068687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PJQJNNM+4DO9CQxRQrJTKsiJbgSUIZ685yVxcgsm7ic=;
        b=ENoHRfvERaOC07yq4K2pcC0QRKL4g36RMQLpXm/CMhqpm/cHp7qnNWYrIUEU9Cwb2u
         wtM2lE5PEH7k8OOhQwtsvsAWJhqNeJ9Y8dHR/7Kp1FAtTZfq3grZq+M0VRJoyS9BaTN/
         ATB4le5cQ8lO5kOHn9oF9qf1IdRbJQfrxoDkIwcZ7zkMfJWR0oTW5q1W+9PjPDO5d3w/
         DvbU64nXTd8Z131eadIpc8SCvhCJgZ3PBVNaiObej872hVFT4KMicMpMWeWdkil2OSzN
         yN/ar/2SexTAxthUyKmonxwzDFp532RR9oyRAsEr85gwlR/6ipEcHHodpQCJFNVvt5Xr
         iERg==
X-Forwarded-Encrypted: i=1; AJvYcCWYOnPECbf3FM5ETICSVwmGwwzfcEoT3TnDcK243Q/Mgm/JolJk8vHqv2XL4uzXG201f1I3KDEljKk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+4ywGVvGxTaGijjDtgu5xgdfQ/ruj/qCux6qmZ9snmje1MLFM
	U+huTrWeKm7PDIoAK2u4UgO13i2LkU1fj0c86KvcTO9BRUGr6KWOAdHY
X-Gm-Gg: ATEYQzzn4eCObt0dGPE/QcYSqvjkQOMSFW7EiRk3pI5CBZZw35fYotqQkRiXGeszK+7
	Q+Hy60lwEfORHLtolD7k+Qz4fZVeb/ggXX+QZ+T7CCiqdB+77tNgZByXa0/zea64IUhpBFrbVcm
	dqa6sqh+BlMpFF85bhd6m7PkK1FzQSHJ6lxSVmYE4A0rJt2MH11brZJjRMOe/Y9vwTr+/Mar0sK
	JyzVOUXiS9sm2aZQYHct4KXipYNjIHFi7A8oMWPIlJ+Y6A4AKup1t7seuJ1eUl+/InM6Dw1Cb5d
	ZornbzjTsVyX8NbbO6e78G7zT0Aqq8FzHQTkfdVy+7oQlEbVCb1NqUimmaLlckQbozvFSozVEB2
	JwgQ5JNve7Gvrki1fMW9JBoVuzkcM1hpaVXyPEE0lojdgG4N9g7uTR4GL4xI85gkLabOiTvVdl0
	ry8Jjuc7Lhl1lgoFpOGQ5yP2OCZ2RXAhwjfxus
X-Received: by 2002:a05:7300:f194:b0:2be:142f:d48a with SMTP id 5a478bee46e88-2be142fd895mr1194048eec.27.1772463886899;
        Mon, 02 Mar 2026 07:04:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f23c01sm10987949eec.16.2026.03.02.07.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:04:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 2 Mar 2026 07:04:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <mwalle@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 7/7] dt-bindings: hwmon: sl28cpld: Drop sa67mcu
 compatible
Message-ID: <917915df-3a4a-4cc0-b41f-106b5933db20@roeck-us.net>
References: <20260302122540.1377444-1-mwalle@kernel.org>
 <20260302122540.1377444-8-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302122540.1377444-8-mwalle@kernel.org>

On Mon, Mar 02, 2026 at 01:24:52PM +0100, Michael Walle wrote:
> I was just informed that this product is discontinued (without being
> ever released to the market). Pull the plug and let's not waste any more
> maintainers time and revert commit 0f6eae86e626 ("dt-bindings: hwmon:
> sl28cpld: add sa67mcu compatible").
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Applied.

Guenter
