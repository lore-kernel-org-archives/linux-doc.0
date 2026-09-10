Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176A83C2762
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 07:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024607; cv=pass; b=eyJuws0xNeAYODGASa3BbLfzUlZfk36TkqZJs8WlBVXZq1vOkVtw9NMoDI1z3GucDaVsWxRdtAvRu4YGEHNRMseD+JUFcUBykJA9+0rqKFaQ9GN7HUKPXxq6dkgyRQmj4TI8imTTx6juy82W1IIQ+SSI2bi4jOIDs/58zPjSOzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024607; c=relaxed/simple;
	bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4hCvspbLPsW+tnfFLjpAwplTrvz45ZZLBVkuKLftoaKq0PxGajqhrkvl1FgfC6C10PAJrw2pZtJ3rTfs/QKQmTT0T8Wn84BY/aX+tpCfrAjHYh+AcRYBtMO6QObWszKoBPHLnHKaWPV/vc3ohIXQCh2bwopWHdGA7zt9SWDS8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/cn6Iwl; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/cn6Iwl"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a4835ab78cso31377261fa.2
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 00:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789024604; cv=none;
        d=google.com; s=arc-20260327;
        b=gyvUUjHoiVyxXKtpZGR7qpWVamN+4W1EU/c1NBPRoMpzMWH0B97v0p5nfx04jEBku1
         Z9kPutX0HFsT1WeHLbb3gjOyiVCsEkhN672TfY2V6b20JpMjGIy+p392/psTxsXMJlOT
         P4bGtqsSwOI7/QPTn1w5bw77UENHnzLWQicXduQv2CBr1SKSefGJsy2rsCL2HEaAnnth
         ti4RTCnB6aBKVGtHWIWu1gZGEMjRb1//vLyTNpgrWG+/1PLjmGYoxbzzzuI/mkUdChhC
         GrUj85TrJxhjFNu4XyI7YpCR0VfumaahwJ+dxQ32rrS+8fMdB7HZl8aNxIsYU0S6l2NJ
         akWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
        fh=YIpaR/BH3rSxG9k6hQI5lXl5HgJwifLQZVT671VpFAw=;
        b=PDAyrVkjeP/x4632Dpp6R1YtXd8z9yo6cmxjZJDLRpeF/KYj+aAxtYW9eyEYEnkIHz
         sBjhKn9TYbYpEZ99hi4Li1QP5vGyA6gXEFXWNebv/QIvnH0Q2rE/Nu8+2AsYfjMPJC7y
         q/hGj6O/rn9oTr7LoU/YrvpU+U8wmefHxIK7qei3lQ7XdZrxHHqzfgMtTv/TCYXHbPy4
         qt9iJu9s8KPQ+wNhCuNg8VBaZNMNeDtI/XS/kxO3zpP2K3yX8KeCSL07ZfQ3dTpoBKc+
         X6O+uFTnzVKh2LmRzRng5jfR5kwfNUyLaGhlnoNjlIuv8Y7uD23z+I59zIqqhqa2AZlb
         tDhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789024604; x=1789629404; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
        b=E/cn6Iwl8/GWCIxXZ8G1tRxpm0XYE5xhRkNn+WU99GZqPHISawocCzTDDgtXCYPgwJ
         kcJQUDjpq54CfifQ6b3J6lv+tRiqtr/G030ZwEbwQJvaKnpAJuVCtuTS7zoL3j4OQODH
         Qjxa9YHcUmYIb1972AirjTRn668ntemP2xxj5hJz0768SGa/UGvwhdimpdn4cdl1LmSl
         YT6DfrpCI9ftwzTNlgPUEi6QBHmjh+MJsHJxkIzVbMMODhYi9kpKaHOMEh1UGoQs5u2k
         1DzHtCTLGkWkEvNov9n2ZyNSGDzpJE9lBTvWshK23QJIvPXY+tMWUGOWnGPyZjm+8EJQ
         Cu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024604; x=1789629404;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
        b=aj3DX7I75/BVXFDuw5MS8Q/22Rf+mk6XKqyagwCDVSlL9uhsHHl7IZZMgIcouRef0H
         bWpI56JwVYlUqB4anXsOcUUnNTqCbdAFY5vwEIFJsCNLHFGV01wy0CjJOWcakJwcEwLQ
         TyPIuecipvw0CwUUQ7rpiAi3ONsIw1dQ5XvgIpFg3+fASVV4FbLWDv7CL5rONnoEso8D
         VOoWgOUKD2tMDvd0xdfci4O4CnqTa7I6YGP5ExiFXfTUMxz4ynwyZPgFSasctywLmoqN
         T2iThBi0ZEX+32v3wdAh3zA9/VV+c9LqfcfEbaPa30Cn/IXu9Vk9Ol0x/iEY6Hh679rk
         +X6g==
X-Forwarded-Encrypted: i=1; AKwUvBxaJAZcW3tVBgf1RLhYWxfpaK2oaQPwe2BJU9zmvP/VkADK81hVBR1t0GIHGDyEjSvzBgJgW7auTMg=@vger.kernel.org
X-Gm-Message-State: AFuF++lXfF6yhTnkgr8dLzwTuE7FC/NhzTTVeQi4wdbwiIisvh2FtCfz
	3NP6Wo3vgmjq2+0MAQB5rMsb61PN7ii4lOPN+IMT/PLBjiorWXP2JzCUpRASYrhKf6RhoM20xPT
	BF2lSKQj7r1s21/7tCiooAn7AuSG7OEo=
X-Gm-Gg: AYBFou1zQm7dpQJeao+PfkUBsNbUexPygbP/uZxYSj4Axj9LYhnbi6J2qMx0sTXHv7f
	wOS0B3cyj2jkoU85tsud2bzD5Ew6OTlu33AfUsbXZ4KfyNh9fv4d/v/XdLMzu/OO0U70xJUA6l5
	wQCH6wxhjwTWfTF36oCGiDKW66JCL9R4cWFM3WBnL2GJEfFANnmi0w8mVcjSDbEgjbGLLQ2l+u/
	qGkVLP5WChnRAkOMVnTyKXpNZ5S6Mg3mFLCFQKPKinoo8Camnidlt/L9zNLwQj4Ul90WY1L0nYm
	7POmg25euLBH6zMIKLBY2t2XCCUEND8Tqg2+sD+A2AMHhTDsAW4diMfFpx+BJGahhWR540gULGl
	ALUNPvZyog4c=
X-Received: by 2002:a2e:be1d:0:b0:3a4:9b64:9811 with SMTP id
 38308e7fff4ca-3a49b649b3fmr11090001fa.15.1789024603607; Thu, 10 Sep 2026
 00:16:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907080831.11281-1-syhuang3@nuvoton.com> <c1f812d6-9938-494f-ae37-e250434a25f7@roeck-us.net>
 <CACW=pY4mpuC1+Z21egn3jJY6jtMhMx1PFFbM+Rcy6giuzXpJ1Q@mail.gmail.com> <3a941922-8728-456a-8e2a-7fa008dd5155@roeck-us.net>
In-Reply-To: <3a941922-8728-456a-8e2a-7fa008dd5155@roeck-us.net>
From: Sheng-Yuan Huang <hsyemail2@gmail.com>
Date: Thu, 10 Sep 2026 15:16:31 +0800
X-Gm-Features: AcwNN1X4FjemE5ofed7LBWR6jnl8AHuWB-oy0Ch_I1mQhfiWyKKr_gD5QY--0ns
Message-ID: <CACW=pY4e84hBiJxvLz09r=LD=OfssBFF_tXduUO0YJxqS3xf3A@mail.gmail.com>
Subject: Re: [PATCH v1] hwmon: (lm75) Add support for Nuvoton NCT7715
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 09, 2026 at 10:02 PM, Guenter Roeck <linux@roeck-us.net> wrote:

>
> Sure, it works, because your code converts the bytes twice, as I said.
> That doesn't make those conversions necessary.
>
> Other chips also use 16-bit config registers. Just use the same approach.
>

Thank you for the detailed guidance and clarification.
I think I understand it now, and I will send a v2 patch soon.

Thanks,
Sheng-Yuan
