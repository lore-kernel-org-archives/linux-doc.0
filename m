Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F03201256
	for <linux-doc@vger.kernel.org>; Mon,  2 Sep 2024 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725282404; cv=none; b=BwNesDCBHHUQY3bIUPDS0O67xsPreiQWK9ilyAzRuUlu4ENK7OOQpNMNSbPjSJ8Esjp8hlvGaznB8CBtrpIUsXiFRIVEOf2lsfSTfwxsLzzOn2RhKhp8ewc6ZRlPEQa9IHy82ebx/RC2W9VPT5p7xLi2x3o8l3R06zw0h884WVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725282404; c=relaxed/simple;
	bh=Gys/fOwB2IFkh+Y6d5sQQ0wcakGuOwHwElyIgRIPpTU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zxe80fiU2rpOclsEILEED0b7HjLnRamlmWi7cxG03I0nWvafZbUknnsnT/IoSWpLOl6AYI3v9Af4bt8ZrfwC0qcfDOWyE8XkHMNO7iUml0Qcc45KdDSRuJhg/3f2L86vT3c4BIl+AbWQhIZ6PvfIvApXMGVoS0NPWRzYbcTm5xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bGVnnRvx; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bGVnnRvx"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c241feb80dso3881238a12.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Sep 2024 06:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725282400; x=1725887200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7rPs/W0hQVom11oQKaJMbZyq8yTr+sfyz3lksQvH1U=;
        b=bGVnnRvxoHLe6EibSn/q4ffwmEuQiVc4gfYVr8A+yzoOBuq0njpLph3G0hhdpOnmN3
         dvfskcz9yhtJkWhu/PQncKI1CiqapTEXx6Q678sUOEIu9fvGsArTX+0axzcEU98eHcVs
         UD3ctP5DvbQcS5wWGmV1i+V6L3w//+GQKg3phCrL3GGFYZoRMIu74YcHeH3sIoTMvHRh
         vgXrnHYl9bX2FKCqYElHy8YA0GivTLbEg/5jPakFfgrUHUjZlASvoTu4LWziwm12Uypq
         KqSfHCvXR97qarU2o1nokMMqvqW+Tv12RV4Ou9Y8zBJxSFT+16+9XpbeFqiSgWB0+bdN
         1rAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725282400; x=1725887200;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7rPs/W0hQVom11oQKaJMbZyq8yTr+sfyz3lksQvH1U=;
        b=SUH8HYrVxkNqx9q0VbVD9naPlyKkTWMgtli0x7JCikvxateiVuZCn9gV5bLywICUDi
         nHMGyV9+hRtcUn03siQSxY+y0lEqz4EnJXy77VRGh8TA9G6nQvgn8/BPFEhNmgBPhPrS
         btRd4ItkgK12EUBYeJDtwhJWRKHRW2wJmbAEDnzZpTktu0LRR6fawxoxuEeNK70nxHw7
         o5IvQLCwHx/j9rLlrU8Ss1XmUC21mFcJhvieMAkqlbgtaz6cJgzWjVqIoGw11RJXgfmX
         E73a5KXs1R7ENQhZWGOUMlEfr/CGO/R+zKt3lOYVGnD046Fru/BekwWEyv7AGHGrZRNk
         VJ3g==
X-Gm-Message-State: AOJu0YxurOdh2g26GseizL/AzYyRmcwd9p5AfA2siczIirVg8hf5E63F
	qfBLAQ84VoaucvlLEZJHdkUkBXwieBn7mnG4nlPNPV8Zea/ey7cvKtUc5mqPsa4=
X-Google-Smtp-Source: AGHT+IHpIP38hQjo9zd/fuqai+hg7Ml2PLeNX8qXr5dzA0Zfcy7czYyjgLE+dKy9hbVA1foPZJJIRw==
X-Received: by 2002:a17:907:1c0b:b0:a80:f616:5cf9 with SMTP id a640c23a62f3a-a8981f69201mr1622801266b.0.1725282400413;
        Mon, 02 Sep 2024 06:06:40 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891968desm558529266b.130.2024.09.02.06.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 06:06:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Marek Vasut <marex@denx.de>, Matthew Wilcox <willy@infradead.org>
Cc: linux-doc@vger.kernel.org
In-Reply-To: <Zs3nQxwycafk75MX@casper.infradead.org>
References: <Zs3nQxwycafk75MX@casper.infradead.org>
Subject: Re: nvmem: Fix misspelling
Message-Id: <172528239970.64394.2848926988957875448.b4-ty@linaro.org>
Date: Mon, 02 Sep 2024 14:06:39 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Tue, 27 Aug 2024 15:48:35 +0100, Matthew Wilcox wrote:
> There is no function called kstrbool().
> 
> 

Applied, thanks!

[1/1] nvmem: Fix misspelling
      commit: f712cecd413f7198fd6dd092f3a9b032bfe7df97

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

