Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5701F33B6ED
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 16:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782145786; cv=none; b=pU6QY1k4UxJi5NXXRYCh0SliD5+DLC9AsuH3VkmCYwdQu5IYBn2yCUVKSzl+XlEl4W3nT28gGixsdbg4E47xe2/T2jeKbMq606YNLo1V1gr6cuiF7D/p4lJDk54U5/G/YXl0nYyDYDJ9skjnkAo8DXpiBcBP104UBu/a4SR/R0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782145786; c=relaxed/simple;
	bh=mvGpKlrwFHncD5jl964V4rj3HmMHhcnqhB2Wf1vJ2q8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=VDJ+yilospL0xjCsUfN6XP+9A8rEXpE/2NcDyYABSmXozPuKNm62hcRLk6mm23jkQbeHlOaH0AC7s1kJTVrnrMSHzb8BL29gkVx77ZDU6Mle5mvg2O0q70s8jYVv4VkzB/A9d+JfVuRW4AnWV/PUs7x4oE4xPnCwRf4cXiipwk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSfIdpPZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSfIdpPZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so34327975e9.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782145784; x=1782750584; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT4x9AYClT9t28+ozEWKPRC7uYmzULjZEqq+oeNUuIc=;
        b=VSfIdpPZUJAkSGCIwK4lc66oUqaaZ/ASg4NFZcmPx61DCf32+U7NWWFoFMngZxdqwm
         gzx7185jIe5oWVl8MUt67eyfEnixBWqBDulfiVs16VTs6zbOsC4XWX+B/9hwnZyr8bbd
         kZ6FJOKn8IJQtZbgpdNaJDaZvAOiJ9GSYjQpAXQnmOqeGeUcS+DZ7nb2sBp/m2sEg+Hm
         NqyzlQ1OMb/GljNANQXmfYJlmMqhmWFfht/k6anc7+KH9Age9wf4LQdEQpSwhCyo4kC4
         KmlexAkrxCrD5KjVo5H/4VcmRoXsK1YIeAjfc2aVYfMs6EohRyb78dj5xGcPtiPWNool
         4DaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782145784; x=1782750584;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GT4x9AYClT9t28+ozEWKPRC7uYmzULjZEqq+oeNUuIc=;
        b=IXiFr/LRmrwifdc9WdWlLwlaMB1uHpAyPaeuyWAzXx9Jo/HocYvryuXVYrtgm18G0D
         V5x3MLf3locMOJKddyMh4LHf6qK/Dg92TSepBW1a5GwOtDBmZmP/gUDzSUyEKBowvKAy
         v8biydu6bbH/uH2FcckY+iAU0aYm11N456UI8elIWy9MKGMfH90E41iVoJ7qwPpaZqy9
         M1OKDz8Y20JKCeazXbYNmajmYyi6zioXH9Bd/Vwpojk6B7QqcMwYutGwOxNqQ3ICTVD8
         vex9bfuuBsPwah2+G7mkshrIqKcYnXU0s3iCQZYM1PQGLkpLw0YyXef1+R66KE8RAAnH
         y5VA==
X-Forwarded-Encrypted: i=1; AFNElJ8wbkwuztsJ8k9rl6KYcpDvo6u1/QnuUTF24csf9qnp8e/UUjMMqodAJrZ43hAufgbJfuKeRPQ9luI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpL4RgZQGxq2IA3nHZOZqNmbdVxDx59a35aAILQskJaZfkcPnM
	g7z4O8FghyabzqFmOqCeR0DFGhjjy55yUoYfN3xVN6UDa0b0VCdFCh+W
X-Gm-Gg: AfdE7cnGDfmPG6p89oBvX427/xfzPAlbiz/gwMA3xX1DgKuUSrTjqzOvH8zCfAeNm3F
	qJYUfnrSZFV3fU6Cp1UN/M5mIStoquFWFMVNYMf530AD7cqcv2Qu3cC9aA+6qrDc/Ss+SKaxMqV
	GNSnArhbplcbA/Bh3Xcrz0ZeKRPygO0F+SQMjmB43/oQxGqdgojl2I3nMd1Q3lArH3Zq9IzCpji
	SwnJKNVXc/FPQ2KLVpemXkgO8/VbVl8u3eEoM7lypA+XF4cUL+peuiVLHbQXrcXp10dkn+LKuK9
	JQE2JkVxORGpLSMYBIde3d9q2zsIV2sL9B7B4JpPoWESbDv5SWHX2nmsj0f4vJiWs+UNTUc6NBc
	RcMaGXJRPbV0RZL5tNF9f6eWoP9bAXwddZTRS2+07v5HBCsn67pENR+wnvRX5uGwLME5MgPVpRy
	u0D/wy4J7vwXGs7qc0vRK614Msgg==
X-Received: by 2002:a05:600c:4fc4:b0:490:b58a:dcc1 with SMTP id 5b1f17b1804b1-49242582235mr223592595e9.29.1782145783378;
        Mon, 22 Jun 2026 09:29:43 -0700 (PDT)
Received: from localhost ([2001:4bb8:19f:d19a:c1d2:e9fd:1b2b:136b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5ddbsm28998960f8f.12.2026.06.22.09.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 09:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 18:29:39 +0200
Message-Id: <DJFPYCV2FXW7.1BFG9DURPZRCC@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: chipcap2: Add label property
Cc: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>, "Guenter Roeck"
 <linux@roeck-us.net>, "Javier Carrasco" <javier.carrasco.cruz@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260622122200.14245-1-flaviu.nistor@gmail.com>
In-Reply-To: <20260622122200.14245-1-flaviu.nistor@gmail.com>

On Mon Jun 22, 2026 at 2:21 PM CEST, Flaviu Nistor wrote:
> Add support for an optional label property similar to other hwmon devices=
.
> This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
> distinct names to each instance.
>
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/amphenol,chipcap2.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.ya=
ml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> index 17351fdbefce..f00b5a4b14dd 100644
> --- a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> @@ -33,6 +33,10 @@ properties:
>    reg:
>      maxItems: 1
>
> +  label:
> +    description:
> +      A descriptive name for this channel, like "ambient" or "psu".
> +
>    interrupts:
>      items:
>        - description: measurement ready indicator
> @@ -72,6 +76,7 @@ examples:
>                           <5 IRQ_TYPE_EDGE_RISING>,
>                           <6 IRQ_TYPE_EDGE_RISING>;
>              interrupt-names =3D "ready", "low", "high";
> +            label =3D "somelabel";
>              vdd-supply =3D <&reg_vdd>;
>          };
>      };

Hello Falviu, thank you for your patch.

Should we not add a reference to hwmon-common.yaml (with
unevelautedProperties instead of additionalProperties), as label is
defined there? I believe that Krzysztof Kozlowski did something similar
for the shunt-resistor-micro-ohms property. Could we follow suit here?

I am also not a big fan of a name like "somelabel", and a more
meaningful name from a "real" example would look better. I know that
some examples have already used "somelabel" as an example, but others
have used more meaningful names too.

Best regards,
Javier Carrasco
