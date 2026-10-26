Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047766;
	b=sFHc/+7m7seiE2Ae5k28bJIzaypuGFF9biZAG77S1bqxPyJscUDRanDCXpBXrZgU7Jgq
	 0j2+MG2ZizKE3afgRdTNjErmBt5lAXYT4vZVxINf1qDA8kz+9fVAoSknyWzjmwmJJ6KtD
	 kt4j99gaNHetBwiXckBxRQdaZAaEQnbDK+yFa7qVIakRXK+wCb8sFVbZb8Er+mYJMksur
	 al0Sl7mnabfhBC4n5BPUT4oswCzOO+vegqOWFdpF+1i6fZGdPL/Z5a5p2rmRr7Xkhv99C
	 auP7R8MVW7PRX0lw5pcEdAf1p3rEMGosKziY3IuVM+mUdxBEF/rERNQus1IuKQOHQFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1mOPYnbJYiJzBEoGB61Mg2eQQ3qdqEMSoEGN6FnJHBw=;
	b=MDdIfLE/AKU3V82SpKxB/c5AaAMbXog67fl02z0ZiJ9QGO/H5C3RAoY3ys86s8ljs4cm
	 kysCAqTe/sGRW7W1cJbfTkh+gpUigb32bTW4rFms+0XXwCnAtvV1KPBhDMiW9fjCk+zCF
	 4Ja5SzybSUmcmGzpV4xWkqwO9kvQFqvnmT6N86U4jjLiewlv4sDeyEhsq0ofPCfxG15bQ
	 T9Fg+QTBE5DywJHTmguPgz2KVvfIkF0mHuHVVKn77NFY1qND6sfSm0qmiJqDXJ5YpIj8k
	 4dhGuTS94j+8lhgBf8jItSZD5HtKQYDVAfh5fmbESQTvmhlisapc9ZEmXkxVRdeg2cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SOm2J0YD;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04C0606A31F
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 20:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C04C0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SOm2J0YD
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-157fe9d771bso4153895c88.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 13:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047765; x=1793652565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1mOPYnbJYiJzBEoGB61Mg2eQQ3qdqEMSoEGN6FnJHBw=;
        b=SOm2J0YDd8dr+H9nWsHno0VM7EdMlOfYVXZInbi4/0JQ1GeROjXQ7SEiGpUM7Z1ZlY
         Fa6i2etjNxG3BrGH8VQ3H5azkFRMcBeIdpXEDFMaNkJ3FzUnVrWCyHBa1N9PKlx087T0
         7OWUSppxowKbI5X1Gv7wYQT4WEXfnKWNrTjHpl2H1I6cNduD0qRzZcktver3FxaM8Oye
         41KC1y1rDmEvduWsQn/rtADwfrdMpg2WD1FCDMdr3olFPgZocnDNTAuEy0QZSwSFE7y+
         RKG/Bc+FUqdgsq+Z2Nd628GL+ZavCStyHCkJAeu1FrnndjBchAN0U9LZUU0RtJCgB1vP
         IXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047765; x=1793652565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mOPYnbJYiJzBEoGB61Mg2eQQ3qdqEMSoEGN6FnJHBw=;
        b=hvM18eiQpzc5UD4KOPWZUAkGqH8GnYULLlVQOzRPsKCxXezy+booOejrO1ikJewriN
         qr+Q0MpHJHSG8NUy8otNAPzYvL2yXRWWVnJLpJ2iFKiwHFF4oUTDWPxyL2IFlLzDuyaf
         zTHu1klTC2PMR+3JMGiCpTNq0rJbCFeUqMYNGkwBJVyqK4la1dRVkl5CGtwFqZvwTaWR
         vSwyG3f7vBbYIle4OZ0ELp6Mrgf4ERL1vB6BspO9lh8gxUjHrUx9j55MJDHflIIpC/CO
         Kr4VTxngEDpJ/oDtiSvlQBFKAwQ4sjYGzA08RRlB4UeJBPcd8pjbYLidDx0AgiDijoUC
         iYkg==
X-Forwarded-Encrypted: i=1; AKwUvBxaDqJkbRgQ3pVR2BbSCqDL0Xc4kd4oW5+E14kTAdtlnj06m052Ok2RzZclafyLKBPgbZOYIaB4rrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqcpARcBaZ1ky8sC1pFdtNBR76cW2EtTgCI7Qbzk5OrftYZ9SV
	Z9SRD1z4+narNymSnG23RoCj9yyWUv9evQdi1JZD4pStISjjW8y79Fr6
X-Gm-Gg: AYBFou3FBmeFh8/RvXieky4HQRPyd/hdkeT9vrN2WKSFecsQJUKgvFbj/rkJ3xLke6P
	bFHfyYDSktXFAfAbp3zsKayEtJ4v58lNEy1EWldObF66NShwFzEk06PUU1WjK+XvSDrkWbSv1xG
	xmGaN2lpFp+Vz4ZwoEmxwbiEoo2WO/DfwvgkcVA3CKfNvfwQwD/PMHEuI8m0TuP+sLmrbNSNYjB
	F6/IhY+TMluVVnR8GXCpicDYEkpQ1EJdPeIh4uxfy9w5BGn3+RP4Ix+irsOYieDwDmUqHzSiG+F
	P/iVEJw3I9iXqAYjw4r1GA3N107xHw8B6QFl3O6s5+kwTCnQIixz8/9UttJiEsLvVsaHwcTMllk
	brj/wJluhlVwUZR/jJ88mHinFEvR+mGyFQYygmtDPEVRW39ziQjOgH6KEUArsERrhZ4Vhy0CSzW
	DYvR9VX7lVza06gNQEgW9CK3L9RoU5sdgggoIF6MnghriJHgpXQfElc8/7ZntprayNgQdjvCpJK
	wVScWYsVKhgLVZrYV6hhOPWLiPLbe/iaRWY08xjZRmNHPp9KzgUtKdpDpakB6f9cuepsg==
X-Received: by 2002:a05:7022:5f0c:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1993580f7fcmr11112099c88.13.1793047764607;
        Mon, 26 Oct 2026 13:49:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm24328463c88.19.2026.10.26.13.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:49:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:49:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 5/5] hwmon: (aquacomputer_d5next) Add AMPINEL
 telemetry support
Message-ID: <d1a1928b-5a30-4612-badb-4a7db7b4f991@roeck-us.net>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-6-contact@vasily.cc>
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
In-Reply-To: <20260927191316.4137752-6-contact@vasily.cc>

On Sun, Sep 27, 2026 at 10:13:16PM +0300, Vas Zayarskiy wrote:
> Add read-only total power, total current, input voltage, hotspot
> temperature and six channel currents for the Aquacomputer AMPINEL.
> 
> Decode its 544-byte input report through the existing serial-number,
> temperature and update path, with power, current and voltage handled in
> the device-specific switch. Store all readings in hwmon units.
> 
> Select the telemetry interface in probe by its vendor collection and
> input report layout, following the existing Aquaero and Leakshield
> probe filtering. No match callback or HID core change is required.
> 
> The separate keyboard interface is not supported. The driver rejects
> it in probe, and stock hid-generic yields to this driver's product ID
> entry, leaving it unbound. This intentionally limits support to telemetry;
> keyboard support can be addressed separately. Channel labels follow
> report order; configuration and alarms are not supported.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Applied.

Thanks,
Guenter
