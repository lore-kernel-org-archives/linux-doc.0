Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A740A3B6C1D
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777288511; cv=none; b=Ovl651dXH+d+33I49Bogly8LdMJrGi0gASGPHFvbgmbItL0qSeXfzN51C/+5plaLXpn7dplwr2Nnynra+QMYxgLG1V7bJB1JSzLfHuQug6/6YBOohWXSXtZn4c1iicMb7anYG/ybQXDk9IS0jRQtdpMIwQ/yGg1IV2nxm3tHsJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777288511; c=relaxed/simple;
	bh=S5v5a2xILTFOuUeOI4/ZHldfWBXVtIB51PyRpwW4Xuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7hQKRTIZF6y7JHm539VML8DnK+Q5pCaFzOXIZCVOGYRUABV3sXBYNc0HEJqMqYR+zJm5DoAzci9Xcql4yRkkayRbTZ5LznVMs6Yz8waOPmY7Kk7SOcDzABGunUqcTzYOKH157aLWhwydB5709iFA1v5ls8hCiv8c8lBYQVwlAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=L91vQEj1; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="L91vQEj1"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35fb166b0c6so5287648a91.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 04:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1777288507; x=1777893307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rj51DoniKArwyiQTRmeeRmOZITT30YvMqLl9YIyYIsU=;
        b=L91vQEj1bSom3oomISEnGlu52fE4Sbkg2C3X8tSHqb/wnxP8yrNyal80RDmquANPJw
         c0Uk6hGHDnmH3m2Hg1D5CKOcqdtTO27z+T++RCiS21VftXRnTZcA/QMvnaPbcNF2MowJ
         /bgP2L5ibYKDzFNrj8H8skqrLEcmb3OFvctWrQRsMcppiLRP9OnKZXUR76AFsKNBREYW
         VLm+cw3CljrT+YNvSqMSqqYxTYq3bXh7n29FEPGGIhzqUIJZnR5lQxBd9sVTq8QIS01H
         a7i09BXGuINfZJXzXAx1kG58/+RxHqRU2TvByGm2rGTq5bQF4jHEBBpRu3XRRsVHXlB/
         7ZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777288507; x=1777893307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rj51DoniKArwyiQTRmeeRmOZITT30YvMqLl9YIyYIsU=;
        b=rNrc4M/dZJ1QcsjlHTudU9gVs39Vc4xDA+45rs2ds83OGCev7TETB4QwfPWOpg+6iR
         fp0zVW6rawx4T9Db3kVSSCfctRXA/oJdCM7pBpnzU4ov65dFh0dmc8oZ10p1zYqbrt5j
         N9K0/j5yLn/pIDxhWIV3BDdUIqcmwxelPnL8dfskMfF/4ESnm/NGuNs6PgPDr6kUbeU1
         sDCT5FtcrReL1+l9BLBQDm+F6ap+B9tAfEGkwPRO+I+tyFKgzLWxUx2Sw1MUzw4LMJuB
         8oPYvBnkKKuVAIW7/sa2dXlNmrpywGZqBU0SmuPRM+wpQ/T9FKcqMTWJ0WR7c0Zv2jEv
         BGlw==
X-Forwarded-Encrypted: i=1; AFNElJ8RFANeWH+O429LW9JjxOvvk9B2vC87M/21hJiEXs3KoytrUZCeM59+mwzsaoXWhDijzArRp5xg1qw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAlTaSCHJ18ybAnZG+lqgSKflcwRpKdhH7QxXO48Q/qK1NGrFp
	VscDPwoVB9hxd9OrmciT7lHQ7MBQT21Z7UaB5xDh14LAC4U4lAh5eCGa62aTQjbvTdM=
X-Gm-Gg: AeBDiesbnq6njrglo7TxYY1NC4dG1gmFfIcY5DJTKZTsljJe2fKabccFXKOkpyql5b0
	IVF+lDwac48v+JY6Gbo34CgQJTOzDVbQezr1qNilwdU7TU89Cx5UvVhiUJ2pKmBp84XgK8KzXOR
	9kXtBJihdIlmQ26Wt9R0aihlblHnuTm3fW7jbcxIe853dLmvGY0B02oDnePKdsL22rODNBAfcBu
	9gTxlOap8+PGmiSr2ekcPJp0ojGtvJAdwDg1wLXpa1MhpPzmThNK7ntzAMN6WlHQf6AM4i9ekbB
	SPvB4bilknArgov7UnbixQWt3JUTkdRhkjfNI/wbG1wmt778lSyJtq9g+9+ql3yg8yJRpbDvSsr
	NzSvpFy11ATYbSmKP/AsEip3wc0pPAylxCVRy8uQcXAwxWunsZ6tI3M+88gzm/QSopWTCAhbI+O
	epm7FWrlMndpLRlKRcFN3LzS1rQQsTz1vrXGwDtj7a29LvIe+2ZoO/OAeJVYn1FjQYNp9h35tEc
	wJB87Q=
X-Received: by 2002:a17:90b:380c:b0:35f:bc9f:e1b6 with SMTP id 98e67ed59e1d1-3613ffce9b0mr33845874a91.1.1777288506885;
        Mon, 27 Apr 2026 04:15:06 -0700 (PDT)
Received: from TAO-BU2-SWA-3 (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410bac6dsm31270802a91.14.2026.04.27.04.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:15:06 -0700 (PDT)
Date: Mon, 27 Apr 2026 11:15:02 +0000
From: Brian Chiang <chiang.brian@inventec.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: (pmbus/lx1308) Add LX1308 support
Message-ID: <bnyp2ct63m2p2ln52lnmrxjrh7bgwfcelekeptbj6j3vgygpae@og4y7ul7gumz>
References: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
 <20260422-add-support-lx1308-v1-1-9b8322f45aae@inventec.com>
 <20260423-free-blond-boobook-ceae7e@quoll>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20260423-free-blond-boobook-ceae7e@quoll>

On Thu, Apr 23, 2026 at 10:41:18AM +0200, Krzysztof Kozlowski wrote:
>On Wed, Apr 22, 2026 at 12:06:15PM +0000, Brian Chiang wrote:
>> Add device tree bindings for the Luxshare LX1308, a high-efficiency
>> 12V 860W DC/DC power module with PMBus interface.
>>
>> Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
>> ---
>>  .../bindings/hwmon/pmbus/luxshare,lx1308.yaml      | 49 ++++++++++++++++++++++
>>  .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
>>  MAINTAINERS                                        |  8 ++++
>>  3 files changed, 59 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
>> new file mode 100644
>> index 000000000000..a8d92447508d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
>> @@ -0,0 +1,49 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +
>
>Drop blank line here

Will fix in v2.

>
>> +$id: http://devicetree.org/schemas/hwmon/pmbus/luxshare,lx1308.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Luxshare LX1308 Digital DC/DC Power Module
>> +
>> +maintainers:
>> +  - Brian Chiang <chiang.brian@inventec.com>
>> +
>> +description: |
>
>Do not need '|' unless you need to preserve formatting.

Will drop the '|' in v2.

>
>> +  The LX1308 is a high-efficiency, non-isolated, regulated 12V, 860W,
>> +  digital DC/DC power module. The module operates from a 40V to 60V DC
>> +  primary bus and provides a 12V regulated output voltage. It can deliver
>> +  up to 860W continuous and 1300W in transient.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - luxshare,lx1308lch
>> +      - luxshare,lx1308nch
>> +      - luxshare,lx1308sch
>> +      - luxshare,lx1308ldh
>> +      - luxshare,lx1308ndh
>> +      - luxshare,lx1308sdh
>> +      - luxshare,lx1308
>
>What are all these devices? What are the differences?
>
>Especially, what is the difference between lx1308sdh and lx1308?

Thanks for catching this. The suffix letters encode purely
mechanical/packaging options with no software visibility:

   1st letter - pin length    (S=0.11", N=0.145", L=0.17")
   2nd letter - pin assignment (C=pin14 IShare, D=pin14 NC,
                                S=pin9/14 used as Vo sense)
   3rd letter - HSP option    (H=HSP, O=open frame)
   4th letter - output cap    (blank=600uF, C=2000uF)

All variants share the same PMBus register map, scaling, and behavior.

>
>> +
>> +  reg:
>> +    maxItems: 1
>
>No properties? Looks like suitable for trivial bundings.

Agreed. Since there are no device-specific properties and software-wise
this is a single device, I will drop the standalone binding in v2 and
add a single entry to trivial-devices.yaml:

   - description: Luxshare LX1308 12V/860W digital DC/DC power module
     compatible: luxshare,lx1308

The mechanical variant information will be documented in
Documentation/hwmon/lx1308.rst (sent in patch 2/2) so integrators can
still find it, without polluting the ABI.

>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      power-module@60 {
>> +        compatible = "luxshare,lx1308";
>> +        reg = <0x60>;
>> +      };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index ee7fd3cfe203..67fb1592daaa 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -967,6 +967,8 @@ patternProperties:
>>      description: Shenzhen Luckfox Technology Co., Ltd.
>>    "^lunzn,.*":
>>      description: Shenzhen Lunzn Technology Co., Ltd.
>> +  "^luxshare,.*":
>> +    description: Luxshare-ICT Co., Ltd.
>>    "^luxul,.*":
>>      description: Lagrand | AV
>>    "^lwn,.*":
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c3fe46d7c4bc..58fa595cff6a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15175,6 +15175,14 @@ S:	Maintained
>>  F:	Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
>>  F:	drivers/iio/light/ltr390.c
>>
>> +LUXSHARE LX1308 PMBUS DRIVER
>> +M:	Brian Chiang <chiang.brian@inventec.com>
>> +L:	linux-hwmon@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
>
>
>> +F:	Documentation/hwmon/lx1308.rst
>> +F:	drivers/hwmon/pmbus/lx1308.c
>
>There are no such files

These files are added in patch 2/2 of this series:
https://lore.kernel.org/lkml/20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com/

I will note the series ordering more clearly in the v2 cover letter.

>
>Best regards,
>Krzysztof
>

Thanks for the review.

Best regards,
Brian

