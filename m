Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4425233A70E
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 16:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176141; cv=none; b=p+/NC7rYTiwkjhB8YuVW1Jiq32YcrlKGdsBcfa1EF/EOynnkUM0dOw5Hk4dQBjVPG62VeDcDmIe9esZSuA56DVF9LxVP8lfzHFG82UkFqcx1BcPDg5qdW1YgveX6tl2DtWc3uS8FKC4QA1i5uBlVrxCJHk1bdOt2ES9GRo0uSK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176141; c=relaxed/simple;
	bh=3Gc11fg7hsjFljk/JqN+H1npRWBl2dMAD1W7UL37tOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=carc3x4ohjH6sAb4Y7GoKmfngLQ8qJSltmrBdXTpeKj4IYp5uo+JmpTZbmb5J3WTtJWDCMoHf3Ew2VxpV8DRwk0dQC/hSO+CP6bwEVBMIGPnp8CSe/GR0ylJ6JYqHaAph08Ov+I1/Mj6AiwQzhQhKEz53I3yDMPKX3eYPqizeGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCJDGi4r; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCJDGi4r"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so6173573b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 08:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764176139; x=1764780939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsLR0RJnm38Fp5r7CqZvtnDjOXjaQRJuirTuBdqGYYg=;
        b=KCJDGi4rY4QXX2mUg28fMahdbCOHR5IMbRTT4p6p+Tw1trwhatcTK9D00Irh9JGjld
         +fxqyKFVNLlzmQ8dPT2dsEy7YdSWKxRr+KT40peMNUnNnBdBS6dDNtTO8P9XT0R0VfuW
         jdyriwVOYhVUSdsuuTuVdawn5sXUone/FHQTLOfr6O75vLdTH0M5wCKS/QErgP8qUgiB
         +wMPWpM/eQxiAj7Sv8t3T33FO4ciOFp1zKjD60BvfsGYshcYmOgro6ksRCTxWlfFGUEI
         OkL3lo5VIubyRXLRB73hBbwJXWqg/m9zqajRUNMJf5vMK4EKLdIlTH3w2z8hyPNYyfRb
         sHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176139; x=1764780939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YsLR0RJnm38Fp5r7CqZvtnDjOXjaQRJuirTuBdqGYYg=;
        b=FL4MxvW9dhn6TsZL5sXhLHyfaGXAe+v97mb7xofYUY7RGpUIYTVieKkFnHihA2Lt90
         UxUo3fiD1iU6Mf8bjcC2gZeD0TQ18v3cyMkfG0IHBcZJGFrHNKbGWFO9U9xoAN6IelvD
         +KRN/YbjHCzAtLQEC0FWdP2l0D/k3nlls3BVA1bb/dgeE6qj2gI2ExoTrJ9xBrJVc/dL
         fuO7RaZb0KIsrBTenGLFx683uMAa8YwDm9cSnJ9HCAnSpe59hYjCzCTEY1sb+fktrvHW
         bATTAKMWBwNN/3AqR8ASK7FTsx7hWWq/tLfit9VB+7pE+it5KZyruA6wAcG27IZvQMu+
         i70g==
X-Forwarded-Encrypted: i=1; AJvYcCWLOOFfVPeL3ruoon6eGVeXraoKwhU7euYn0x+ZatuEcijV/vZesnKzF4Uikmr4Edbg0O28KOa+APg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOlL46ARfPKAhSisTBPOnQjmbB3RbbfgfJjN73Vd3kBhn0qt9z
	EpKgsBeWDJBcSVRN2a1RzllJoMf+dKOBkehd8Xgn4fTmhiVMu5rZPcj7
X-Gm-Gg: ASbGncstsL9VD4obWdNJwHHXQH2jknDmX56h5IaR5sFFlIY8+dXNnCClaT3SQXKsloP
	uQzqX7nyTp8gnBbHgSCd9Xav9sTg3/wZM9G9PhPMGDZAlkxSA/1KTb8UMh4MZi+tsR45Ri4E1Me
	PXh363owDr33ylNayp8LY+fCoZP8t3KPD4mhV6vEiqUfzSfeEc5BXhnwgae72reiwhXKE0g3CxL
	LQophhMEMtVfyICcftCNXjTFmGO3w2nWtrq7/k7G5FA3660iWW6XEQ50LWFB0f+JkTkLNBJz6Yq
	QhcxXsg4DpH17Nb3psbqSdL4DwEKuS7OmXVBUPj/FvzoxyrhDrRO8hTr4UpaiMCpXBuDclcY2zP
	UZxYPPkZlwTKjfA21LFiaJnPKJDzcA8ztcxf4PGwlii87c63RJhW/bTL4hxvADyCsl/lQTq4gGf
	C7eAFz6TpgE9+M0PCZt71rGA==
X-Google-Smtp-Source: AGHT+IH6cuG9oEeYrc3Fz+ThAFudgaYZ2XGiyeMqLPbjuZeQq1pwyPE1LvTCIEY9wFQ2EuUIbEmwCQ==
X-Received: by 2002:a05:6a20:9148:b0:35f:4e9d:d28b with SMTP id adf61e73a8af0-3637db14ff6mr7976498637.18.1764176139306;
        Wed, 26 Nov 2025 08:55:39 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.188])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75dfed99esm19887078a12.1.2025.11.26.08.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:55:38 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: krzk+dt@kernel.org
Cc: lee@kernel.org,
	gregkh@linuxfoundation.org,
	pavel@kernel.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v18 1/3] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Wed, 26 Nov 2025 23:55:32 +0700
Message-Id: <20251126165532.160730-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <74d6319c-535f-4409-a3c4-299ab946af54@kernel.org>
References: <74d6319c-535f-4409-a3c4-299ab946af54@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 24 Nov 2025, Krzysztof Kozlowski wrote:

>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/leds/common.h>
>>> +
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        led-controller@1b {
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +            compatible = "ti,lp5812";
>>> +            reg = <0x1b>;
>>> +            ti,scan-mode = "tcm:4:0:1:2:3";
>>> +            vcc-supply = <&vdd_3v3_reg>;
>>> +
>>> +            led@0 {
>>> +                reg = <0x0>;
>>> +                label = "LED0";
>>> +                led-max-microamp = <25500>;
>>> +            };
>>> +
>>> +            led@1 {
>>> +                reg = <0x1>;
>>> +                label = "LED1";
>> 
>> Completely useless label... You require labels, so people need to write
>> something but since they do not know what to write they call LED 1 a
>> LED1. This is just not helping.
>> 
>> Use color and function properties. Same everywhere else.
>>
>
>And now I went to older versions and I see they were correct - you had
>color! You replace correct code with wrong one and drop review. This
>patchset is not really improving.
>
>BTW, You actually received review also at v6, so this was reviewed 3 or
>more times. Way too many times.

Thanks for your feedback.
To address your concerns, I plan to roll back to v17, which was reviewed
and approved by Rob.

The only intentional addition in v17 compared to v14, which you previously
reviewed, is the ti,scan-mode property to configure the LP5812 scan mode.
No other aspects of the binding are modified.

I hope this resolves the issues and keeps the binding stable.

Thanks again for your guidance.

Best regards,
Nam Tran
