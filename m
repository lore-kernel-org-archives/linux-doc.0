Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D613491EB
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 16:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764780043; cv=none; b=ZbH+cfYW+SrTT2ETl9Pq4HuVM+7RIZE5LG5O2jFNx3jLonllKM4o3jpfqUElPhsXi3FqOFY8rrNrQEtSMI5FSSnjsrXrU1+EQPX9/vDrEzlQKhSXrq386G/rSLMuNdJZiklp6NuDHUf6lf1ZfyFciJtMxeTjio6RPzR2Ok2czvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764780043; c=relaxed/simple;
	bh=0Z2BBmTnMT6t/6W3rYzh4PD6uNXongsjyj7XJrBUTxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rBqnSFXiar2S+XA14d/hDNaW4T9tWYjlmSKD3MVmoXtTXQIOifyvp48mTdxpu85ESORyRa6zK18T+btsHJa+tZKg7BaV7QDHjgG6b4LvTu8oDNqgbg8lw+CRI3rJzFYKlYB+lkSDsPxgZNkOp8nsKkGwEIGqtkpybPV00Yl9qTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqN1a6Jb; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqN1a6Jb"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34381ec9197so6161944a91.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 08:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764780040; x=1765384840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+6S8pILwWJoByJIz1lTTbzSi9l+zLSEgeX9jzpk5vo=;
        b=GqN1a6JbH/PfsHXwB37l6bq+m6xjSvXt6PnLhPUrD0rGfTOPiT/4KgmuHLE1LJIN1w
         RyfWSBCnDLhE8OS/sIWcga0tktHrXnbRlL2xJU1jtoyJ/vVtCTGtIGEeaXM+7vB16uSg
         AxuECDvWuaZHZV+yD6u5TEq4ABl+xVPoXs9G9KnFL/bsH/vyTQz+lNACOSk/bU2lJat/
         A7nREbeLNL6SO4nhq50tFq3RWqHXz3xtc9thVfq/FfMWWSNuaE5B5QjSp3ZXa4mVaHIa
         XFVPE/Eoy+uLRvqfjvLJfqPZDpISoNRfrBYDot6bC08vNLPqDAy+5qRvFiRLYkDOcUSF
         m1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764780040; x=1765384840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r+6S8pILwWJoByJIz1lTTbzSi9l+zLSEgeX9jzpk5vo=;
        b=QF1Jx+/5+rwEAzt+kWS3b2ogQzeWT6rAv1qyq6asSMQI1lj1/7LY2O0S6xKduEJXEc
         RD9XACN26iddTrzD7D+aikdSAPGFOYpZ2X8bTGogvkL1leiv2wUg4zRYWXfoXiNdIZDt
         mKHlJhmusciU5EbtMFpuakJEl812klm8uUalAtx6Kdad00nGsIJ+ts3zZdHtwQDdyub/
         RyQ6SpGCB5JhSFes8oHD02jOkxiTw4b0r1UUPco3xoXg4udvbfcoYXPzMQbvbrPKk4+n
         lvg72NPOyjKY/4Yc9GRAa2gqCmhV6oaSSwiPT9OGaltKiITke99XRpnICaoyphxJnJvF
         XJGA==
X-Forwarded-Encrypted: i=1; AJvYcCVGx5hXdAAiSFRwOlkZLPpqso+UdECwN0Ilbt/QiSr3842+ClPWJ5GMq+Zc3j6ugPXFHM8J22xa66E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKyEY+n+OxsVG3vWqYVwqana0DAVnq42HiRH44ri+nUtroNuJN
	9+mQZkyofl/PFtfFOdMu2LJWQuuUBTt8rqcHgyjXQXdffJZKmST/bHFq
X-Gm-Gg: ASbGncsvItZ4egS4/BYL/Zw8mZnABtm7v5eLDPMPkb/SMkU53yOfiriedBP+O2v/ZSR
	9xiP9bHFQe7JKD9kDG9xwVzX9LyC5jckpgJ4YcM8+T0czz3WhARhhmQxj87Y9kzkJH44HK47r2a
	Ipqa6f5eW0iKkl3iRNePVhtxxXGY6rVqB1UcL7SIZfIKVnfq/jZbjuiQJ6bO0yWlN5SwllEAJtF
	oUchsbxvpUa/P/lmpBE2d3jw2OmY3v7z1igQAeT44BfkJU3p3mql4i+6JIwRCmYI+CY14ySxI76
	Qf1qFTxpHOTHWgf52vF5191+nvyAsfTooCuQZtowPVt7swzqZucU5RcZ7aVB7xPVteRqVv8w6cd
	kFxPMIIlLCSi+TjJdx+WKX1kDsVeF0gqGwyMpIhkQXaM187uPgjYn1Pb0RVbYQGvuBb47JxDGPQ
	fEo8BFc9nMRuQsIzCc57wcyQ==
X-Google-Smtp-Source: AGHT+IF6/YZIh/dxk/K+HKvP/11ZD6enoOdhijztLoekTQ7+wG9a3xEISDyaxg4iW1t49OdoMmzvQA==
X-Received: by 2002:a17:90b:3c4d:b0:33f:ebc2:643 with SMTP id 98e67ed59e1d1-349126c84d8mr3372009a91.23.1764780040185;
        Wed, 03 Dec 2025 08:40:40 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.188])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912b5cd2asm1437695a91.1.2025.12.03.08.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 08:40:39 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: robh@kernel.org
Cc: lee@kernel.org,
	gregkh@linuxfoundation.org,
	pavel@kernel.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v19 1/3] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Wed,  3 Dec 2025 23:40:33 +0700
Message-Id: <20251203164033.363984-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <176451936212.1126615.11381616288774387236.robh@kernel.org>
References: <176451936212.1126615.11381616288774387236.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 30 Nov 2025, Rob Herring (Arm) wrote:

> On Sun, 30 Nov 2025 22:39:54 +0700, Nam Tran wrote:
> > The LP5812 is a 4x3 RGB LED driver with an autonomous animation
> > engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
> > or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
> > dimming, including exponential PWM for smooth brightness control.
> > 
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > ---
> >  .../devicetree/bindings/leds/ti,lp5812.yaml   | 246 ++++++++++++++++++
> >  MAINTAINERS                                   |   6 +
> >  2 files changed, 252 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251130153956.241375-2-trannamatk@gmail.com

Accessing the link results in a 404 error on my side, is it expected?

> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

The LP5812 binding validates correctly. The errors reported by the bot come
from the unrelated thermal bindings. Is it normal for the bot to report these
unrelated errors?

Best regards,
Nam Tran
