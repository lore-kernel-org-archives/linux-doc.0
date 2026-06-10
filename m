Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C1529D27A
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 19:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781120801; cv=none; b=ZrCdtESTv2YFcCtxhhrUdzYOGoz4M1+W/RLP98+TJNx98mTkWbuHWuajlqXFCxw13CqsfVloNmXwlBScwsWiMubk/Vru1VzMmu/dlQ0MBMC3WlO4n2nbXvJKhs8WnQWKuli0Tp6SdiBDElJfYpFDTcCCGVodkO2xHOGB1zQgdsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781120801; c=relaxed/simple;
	bh=m/D3kjV4WCE7YLF5e+ZTCyvD2jFMdM1MgU0t8CDjh9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMOXbOzIclmWXVJEyNZ6dRYABey727ww505h/j3An3HuzegAfgiqjCIyAIrNiXZ+bIO/7Jclnsy+LxlpFDxzssHYouI+hfclJOYeiXsEPaCxV/T470qkbaSBO8DpCehsQfqPHQStSnEJsoIFEkMYBYAErRM+hRUE+Oh0qbxnxU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLA/Tegg; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLA/Tegg"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30749947917so3819846eec.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 12:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781120800; x=1781725600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMJUWqbBGFmtLXG0IOfebCL3RCb5topHpC868EHhG7A=;
        b=nLA/TeggiAU9eKzYh8N51z+wK4JRJ/H3UTj6GR2U3x/Bh8iqhqxQfKMXPj/1Qk2OsG
         7EkfzDSTgQWLW5G2if4pU8eWbjJieyscB2FcEHmuoNy1IIAJjEOJQKGTzAZUSKQFupJa
         vnMi9qJmqb/owTp4UtuSlD1ygdC2k2R6DvBtSCkk0k5Ke0dmMS7aFo2Erqv7nTcME8Gd
         SvZmiSKspEq/o2W/J2Wr1mqyTMAdWBSvHVpgL9Bg0DvSGsnR6SswCVE9Pm0lInKgbxdK
         fNPGpZZrRsHTEOvqO+jPE/yo+DnZX9apnvkyD2Q8LmNPBMmmAer6ogCzAoT35IXB9Tq+
         nyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781120800; x=1781725600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMJUWqbBGFmtLXG0IOfebCL3RCb5topHpC868EHhG7A=;
        b=Wc2E3umWTTEYfz+0zDxLlrK3HJNggjI4sXu9l9nwGt2AZ18u8PwHKryWnAKnDZB4P6
         vyseUvhdcAiVUutjOP7vCjpourlg6W3ce/PEiClWL3d5UjdmS9+oB8UKrrcWIfeth1V/
         flMeN9ZneLdpDEuaY8DnjWe64tAaz0MNgMGSyUxCxv/rZJRSUlVgl+d6HfPLm2e/m8Pb
         h9s9uZ4p79i1d0xaJ4Xpaky9q2I4LkkmpMu9urqz7PSzCuHv6iOdsG2p6LtvP5+GS+77
         /Uhhx0rPf7K9cA9wqUeDl8RffBFMix5JrJV5zBqA64q1lelhyGylZ2xdSxj0CIz4giCI
         tD8A==
X-Forwarded-Encrypted: i=1; AFNElJ917k5XJk80UYm2pOcB/wOZJAMtILyvO6xP4LsnmQMb93dCzChjNEMwafSEO+xCHKWyISakh8Waqtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF3qdW8kw9LreZtSFiviNTxDxBLeeZ0Yr8zVGERDz6UFtIbPxz
	pfNj0aY/Yq/K8V4LszTwzGv6cxwWV5LXbi6M7uFTSB8Eq2msTMKVAq8C
X-Gm-Gg: Acq92OELkFb2XcXveJdFrGaTR8USjLcbo6hy5wEFFeg5cmu/aSCxeXeuqCnS5EHSh95
	qp9K7XCIPKgge7J0Q2q/cVBAoZy89vNhx+2kqyQ4a0bDNNgPmF1R//ZVaOkoSxxREyRE18XAe5l
	hUj9WaFm/g5hVAQmXMC5xW+f5zXJECHIijTEfFNFu5s7vjxn+4PdlLhqXVQHhSMpdJO4r/aeBad
	U92f2XnhRvx8o0CSCF6oSZXNBJEXgjNCIlQuBj5QfkCrndhMBOs9VHu9aTGPzevJ8J4z1v2bXX9
	eg17ExOAMOXiHSe6x1lCAFnkBgIMNk4OiksCpZMRtbVDeBt21Lx+8cB3yCU5kDKOFlfRPsgL8hK
	g4ir+qqQZm2D8fye0AjwUEO1T6dXZ4BTOLznlLlhDHZYdtqyI7JpfoaZUw6S9iZxFaEyBxdEp6q
	QIljxt25vykaW4Tkdh01Kv1FmydR7I17C/JpZ/7y50TR16L88=
X-Received: by 2002:a05:7300:534f:b0:304:b15:17d6 with SMTP id 5a478bee46e88-3077b357e93mr17911170eec.6.1781120799634;
        Wed, 10 Jun 2026 12:46:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm33615378eec.8.2026.06.10.12.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 12:46:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 12:46:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v11 1/2] dt-bindings: hwmon: temperature: add support for
 EMC1812
Message-ID: <88645a7f-94b1-4c78-a7da-f644c4f3d84f@roeck-us.net>
References: <20260610-hw_mon-emc1812-v11-0-cef809af5c19@microchip.com>
 <20260610-hw_mon-emc1812-v11-1-cef809af5c19@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-hw_mon-emc1812-v11-1-cef809af5c19@microchip.com>

On Wed, Jun 10, 2026 at 06:19:46PM +0300, Marius Cristea wrote:
> This is the devicetree schema for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family. It also
> updates the MAINTAINERS file to include the new driver.
> 
> EMC1812 has one external remote temperature monitoring channel.
> EMC1813 has two external remote temperature monitoring channels.
> EMC1814 has three external remote temperature monitoring channels and
> channels 2 and 3 support anti parallel diode.
> EMC1815 has four external remote temperature monitoring channels and
> channels 1/2  and 3/4 support anti parallel diode.
> EMC1833 has two external remote temperature monitoring channels and
> channels 1 and 2 support anti parallel diode.
> Resistance Error Correction is supported on channels 1/2 and 3/4.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
