Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E1B38AC85
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 19:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782242554; cv=none; b=q97DfTw92OWf/Sps54EZ+9EsyhEJV07rGH3avtdVAGOrlxpiOKV3/4Zj/DwzKoFu3r2MxKiQ36AqCCwreetEHSBdUOWvUSmliJjqBEmhrETlSXulKmS89g2JEu9wCAxIIzMI6wd/6lU7li79dxJUyvkLp/vYAhbd16wzK4pW+F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782242554; c=relaxed/simple;
	bh=gjgrsDd/ebzWh6tkakuHrLUHkTjwUYhdEmKlxZWsS1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+aQHZb0hm/g5LvFVSMfuDDCHOxDEYOGWm43ZClSYS6t/osGZe46lUeW9u4ZpxYaDUUV10T77hiT39geMt9HfgUbS5076h+vIrL519ig3zxbV7Su4Yb98Hd083EW37d3tG+Iz2tAp2+SBUdxa/sXZgC9FNsIvwD14VWvlFqfEfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqtwPlXP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqtwPlXP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so2211835e9.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 12:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782242550; x=1782847350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qRZ8hq7NweVMrKwvoIG6kF3ia46DL3ufdBurnwbak0=;
        b=EqtwPlXPZKtr5HCE+LS7ehOYqgFfuQmx68ZTv0iWX00f/f9sCPjj7oKEGSNnA/ZlNT
         zOGCjFC/Q2TKB8GC2tlYMKEii1LaAI7v048PrtSLC3pgzYsk82kh5//rj9PkYN1To8BT
         KsSJLTVOs019MPmgGkhlsdSRj6Ftva+x04VpH9pHZ375umR9z3yEYtcG213mrABKXhJg
         xn20p4ikZgerZPV1dz/ZjuGgXTKKziscB34OxZm9XJ/WO9MbSD4OZaabkE3pBW5o0QbV
         3JYlcmzAZtdzthd/3LeDfkLczhkKy7rATRVVV1eWKvCLiOJKXkXIj+bFCs73o9zV6Xgl
         YTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782242550; x=1782847350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9qRZ8hq7NweVMrKwvoIG6kF3ia46DL3ufdBurnwbak0=;
        b=gdVNubLzPz82zZQ41W82Y38VZG7FtrUQ6HGKUjmNDzI8hpYW4Ch3MaSnPNEgpJSzAd
         8eEagO4E6knKcShRTZ+m2xevSyeoVhtOsd/YKN9Ax+808eOoNrhQaaOWoFCNhPq/3UaY
         7iIEn6n/gAfcN2m3YEkb3kqDbYIS2OGnlvcR9UvUz1A12KHajdpIxov5a00EaGDlDaII
         XEwcfNBGv4jnz2xPJtXIN/0kp5uCLeSpvu8tEscd9mxtJuLhKvSbjM3RyQD8gqEVg955
         zW7F8RFmz6e2rXqKtbiEVYYlD+hLu8Ji1nbJ2VP1G723lGHNiYNNN2pJkUVsVdEiv/Ik
         T4FQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vYqgfvBerLZ/bqGJuCe9StdskOhV4z59r8O6xeIqvqQpjjX6o4YlmixnumsCqAlKw2fZcKCpip7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF/QWGvayJwOrNOnh1b8iJhhH2+LbJs7qN2oSDV3Py8v7wrien
	BlOtClODZBSkU4iKLtItuNTLk6Y95WpUNvvifl55ZVJnd/jwOwKnbjCc
X-Gm-Gg: AfdE7cnxd1NWovW4hgTy9Hk06zSsjs7zGafmsodYDVA1ZW8PtjL2PEwoWFYGW+42Crs
	/3LbcY4mG98MRrNkFJt7rX8ryS68sD3KZYgItGi8xX4/Nnaitd2ji0F7jvmDzDB4Q06k1dnaisM
	1IQ9Y63KElfGR7FI5e7BN4wum1+nKCjC6ZSS2OweuRAJ6LOfLas7T7+YNLy/j6XHoafHCuR96ba
	6ox9eJtsgzXoJtbGcMzf/oFmzBNRhGc+AgjDIh3oBpNYJxlKeiNNEoN5417Bm86nxnX6BaMzUo+
	xmt2vt9kLkfbxafyM7//rRAjK7YMyYcsjH+SmENlvsR8RFWNfdgUQ9SC4lcHDPqxptjS1D9goWp
	GhhFYOJUiap5p9B1FVo9QHJ7Qm4wwtrSfY6sIZBuVOztAHFXZJ5/6lN+daA4VNYAaPykJiROZIL
	5iDBb2whN3ULRLRYuuDVq4GUn50Nw/DXTNLiEx8YATASUiRQPj+njl3RMSXQHVSqguPCVUgxQN
X-Received: by 2002:a05:600c:6812:b0:490:5466:8591 with SMTP id 5b1f17b1804b1-4925b353633mr62488105e9.12.1782242550328;
        Tue, 23 Jun 2026 12:22:30 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.86.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249238bfbsm335967985e9.5.2026.06.23.12.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:22:29 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re:[PATCH 1/2] dt-bindings: hwmon: chipcap2: Add label property
Date: Tue, 23 Jun 2026 22:22:17 +0300
Message-ID: <20260623192217.4804-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b6d34af3-0c4a-4870-a240-f7873621d2ce@roeck-us.net>
References: <b6d34af3-0c4a-4870-a240-f7873621d2ce@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 6/23/26 9:58 PM CET, Guenter Roeck wrote:
>On 6/23/26 11:16, Flaviu Nistor wrote:
>> On Mon Jun 22, 2026 at 7:29 PM CEST, Javier Carrasco wrote:
>>> On Mon Jun 22, 2026 at 2:21 PM CEST, Flaviu Nistor wrote:
>>>> Add support for an optional label property similar to other hwmon devices
>>>> This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
>>>> distinct names to each instance.
>>>>
>>>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>>>> ---
>>>>   .../devicetree/bindings/hwmon/amphenol,chipcap2.yaml         | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.ya=
>>> ml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
>>>> index 17351fdbefce..f00b5a4b14dd 100644
>>>> --- a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
>>>> +++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
>>>> @@ -33,6 +33,10 @@ properties:
>>>>     reg:
>>>>       maxItems: 1
>>>>
>>>> +  label:
>>>> +    description:
>>>> +      A descriptive name for this channel, like "ambient" or "psu".
>>>> +
>>>>     interrupts:
>>>>       items:
>>>>         - description: measurement ready indicator
>>>> @@ -72,6 +76,7 @@ examples:
>>>>                            <5 IRQ_TYPE_EDGE_RISING>,
>>>>                            <6 IRQ_TYPE_EDGE_RISING>;
>>>>               interrupt-names =3D "ready", "low", "high";
>>>> +            label =3D "somelabel";
>>>>               vdd-supply =3D <&reg_vdd>;
>>>>           };
>>>       };
>>>
>>> Hello Falviu, thank you for your patch.
>>>
>>
>> Hello Javier, thanks for your reply.
>>
>>> Should we not add a reference to hwmon-common.yaml (with
>>> unevelautedProperties instead of additionalProperties), as label is
>>> defined there? I believe that Krzysztof Kozlowski did something similar
>>> for the shunt-resistor-micro-ohms property. Could we follow suit here?
>>>
>>
>> This is a good question and I am happy you asked. I also thought a lot
>> about this and the reason I decided to go for this approach is that by using
>> $ref: hwmon-common.yaml#, I would have to change additionalProperties: false
>> to unevaluatedProperties: false, which will evaluate in case it is used, also
>> shunt-resistor-micro-ohms property which does not apply to this sensor. At
>> least this is my understanding, but of course I can be wrong (I see lm75 binding
>> also uses $ref: hwmon-common.yaml# but shunt-resistor-micro-ohms does not apply).
>>
>
>Where does the idea come from that shunt-resistor-micro-ohms would be mandatory ?
>That would make hwmon-common.yaml unusable for most chips.

I think this is a misunderstanding since I never had the intention to imply that
shunt-resistor-micro-ohms would be mandatory, but rather I observed that if I used
$ref: hwmon-common.yaml#, property shunt-resistor-micro-ohms can be added (no need to,
but still possible) in the example section and the dt_binding_check will pass.
Since hwmon-common.yaml is already there I will change the binding in a v2 and use it.

Best regards,
Flaviu
