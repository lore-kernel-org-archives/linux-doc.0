Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9033E3E5ED1
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813105; cv=none; b=qTHPc7XvcVwWZfG8O66bBdDWC+pYc2nx4M2UMd2d7xfR0+f/1vRDZWEMvqLrulciP4PeChWG/jfxTgPJvR8aSe+WsLMZdPklwZNKE6dTxkZkIU/D0nk7qD755JLbUPynnXTFsnXruik7Ado1I0zNWP7VWGemJbh7A6DW65LA/ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813105; c=relaxed/simple;
	bh=JNLvSKsWbpNpU+kVfR1ZUgo0qtFkPeJnN9n/3eiEcSg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B7rNl8YuFvG1KV04REHpguUJDwZHRkaK4z+xhriPNfFCpVsVuPSEUpWokyCjvE6QtKT/NEUZT7eXaktBwMJ51IkE0vXje7yRWmIU5r/1DEUOvCrtIjf8tWyjbRYovsl4F4XGlw8XsQvrnXxxsGINL0BVZifxeV8nN8PTJsXTqeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWW/dfsY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWW/dfsY"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956869750eso15046195e9.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791813103; x=1792417903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oLOrbPkiMwYxELk182ZPfeiCmk/lFJpYO2IK6N8cvrs=;
        b=kWW/dfsYmSuWUUAmOtu9ANV87tPPKXFs3Wu2Zf4c9BjI1gxqJUEUYZR6eDFV2eSFzZ
         9IkrgEcM0UNHqTeDzb/fi3vsTrHLpX8HoUz5MUT/ec4oVQM/Hn7YR1hQKx2S4bXHnt8x
         HZxqhhXXxfOQHbq0nRBwIiB/iVLkCNWky+C4Nztk3wkwVLqubb1dIZgHm8VrsCgo0+l1
         +QBbPfQpacUPyQXJpH8kkT9EOWM6v+WRMqagJdpxEPH4lyd2x0hXl+3tEGACJyTaAZYQ
         ejnhHfdKYevn5S4de9Sl/q+i/lSmbVR2Iqwqep7Rwp95GrwKUTAE8N9A8EAhFoiIpmOl
         LFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813103; x=1792417903;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLOrbPkiMwYxELk182ZPfeiCmk/lFJpYO2IK6N8cvrs=;
        b=RzfZ+sZQqrOLqM+LFT6zIfJkf8OtZy+yn5U19inYrBkV+2L/5yrLpSM9H6R6JdWx9p
         sysOqeHiNsb47+Kyat60HKpIKflknm7ac3gFbf654bjp0CfoqHTZCxd1a49fC5kwHJn5
         L33HuQwsSWtXnEB2cks79gPLPSP/dN51+3QeiuQZixjTgM01gUTQ1hrBrR7V4G/uHWE2
         buHG4be0PnNm3G7G0cBWk2lMcCjMKjoIQCnAa0TQ5mXmEsIQH4s2+vi7VwJFyPrZzWJM
         sqrhXqtOeIEdeHTQNv5q79UgKDX5QTAFrbOLTzspyOhHApGYwNon0vawGV+XQgR6IlTv
         lEoA==
X-Forwarded-Encrypted: i=1; AKwUvBzm8BiPhOPd2HmRtlZaNOaGbZeLoOwnr447NcEUkDM6A2ElaDN8BQuYor0M0WwmYAKndLIafhXN19c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhIFREVJqxUf7qHkbRynkq87t16agZHjM6f5+KWFZQjtP5ISxF
	86MDEdZNpXxOGFqt5Vp0G/zh0hugUIAI405yB/wqzii2e5qxTZARHXPF
X-Gm-Gg: AYBFou2PzkWTsSWMROAvfie8rJIkFLmDh7DT9rANOwIwxcTY1wF/l/M3sfqT6PA4+ac
	y9gWIUpku5afk3gIzJjw/WErGJeWkrlx7dI+bbAQsq4BsjyDPACcPWgEWrOzAmd1ZF+2cKs/DyQ
	Ccx/ZtI6rGducOFFWJJCN/r58s29D0Dzk5u4cn41i+wdsMQ4x5ILqcUEOasKd5C3r6eHiMIUp6g
	/F02ZiuhjxFEtBLkM3oIRnQgTG6S+XHHd4av1QBEQbXtZB62ESg3S0q/YYEF731Yi7JLcs8lNjq
	cjiznMDjnA3tS18ip6SUT36FT5b+5WoKDv8b/eOZtFhVVmFYtZBGtTiMmh2jWMUaHXp8d4Sa25i
	vHIvmA6se+K/3bn3riFew2ZCxLb67uo5Er9XD82b+E6oyPUkMAudeoihIZXNUV/TPQfAA1UaRJZ
	EpBdm9AjDzuGDxynsAlYgb2MgUti1gNb5U3htxLBCWWR8BHQuz69YKPUXJ6O80pNwmZTtbJxQCO
	WzBqi7c+PMW9cvvI/kRvLu6fJ2xWeFelE1oouyOVV3hhJVrAgswP75enjpZieb+IC1rarLE4RUx
	GveMlGk3Wk5p8Ifn1L9FCrNTBlzvHnw6/TfgmpjMXchWYZVI9eSPfVursplpT39633stYkjHHpG
	Bcv9QUkFrbm91/lEjyXy1OsXnBKNuT0BIE5v6WKCjjet5fyKLn8ZRTJsc83uJDTuDDwG1POzZlJ
	78NrbRq3KonuGbMPQ=
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a18e4cd667mr179122395e9.26.1791813102687;
        Mon, 12 Oct 2026 06:51:42 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c3a13sm19399336f8f.25.2026.10.12.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:51:42 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:51:38 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Marcelo Schmitt
 <marcelo.schmitt@analog.com>, Radu Sabau <radu.sabau@analog.com>, Janani
 Sunil <janani.sunil@analog.com>, Salih Erim <salih.erim@amd.com>, Jishnu
 Prakash <jishnu.prakash@oss.qualcomm.com>, Jakub Szczudlo
 <jakubszczudlo40@gmail.com>, <linux@analog.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 1/4] iio: adc: ade9000: parameterise the reactive power
 channel
Message-ID: <20261012155138.0000726c@gmail.com>
In-Reply-To: <20261012111342.48040-2-antoniu.miclaus@analog.com>
References: <20261012111342.48040-1-antoniu.miclaus@analog.com>
	<20261012111342.48040-2-antoniu.miclaus@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 14:13:37 +0300
Antoniu Miclaus <antoniu.miclaus@analog.com> wrote:

> The channel array is declared once by ADE9000_DECLARE_CHANNELS() and
> specialised per part through the altvoltage_rms argument, which lets parts
> without dip/swell hardware drop those events. Some parts in the family do
> not compute total reactive power at all and have no AVAR register, so they
> need to drop the reactive power channel as well.
> 
> Add a second argument that selects the reactive power entry and introduce
> the ADE9000_POWER_REACTIVE_ENTRY()/ADE9000_NO_POWER_REACTIVE_ENTRY() pair
> for it. The entry macros include their own trailing comma so that the
> variant for parts lacking the register can expand to nothing.
> 
> No functional change: the preprocessed ade9000_channels and
> ade9078_channels tables are unchanged.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
