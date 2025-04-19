Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0846715665C
	for <linux-doc@vger.kernel.org>; Sat, 19 Apr 2025 04:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745038787; cv=none; b=exrnVb/1lNhj994Wtj7QVXGD8vj7DP08tB4BRlKC+Hb3voJi8BMXZYYtPNa5G1eHE5qp2WvNVTC3ewK4WF7FbMbb8E9R1vyUNaYNtJE/Hi8NLJvCDlJK+GYPnLT5GODbPEj8yBgAD8hBAin2az2ckIm4hW1NeKR2QAT8ez01hKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745038787; c=relaxed/simple;
	bh=rELaedUTMmsX4x20wC07unznqtRhhrjYkGFM0XQmwBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/1gbNPubQ2Z/ay5k39LWlOQE4fpSjx48ghyhplb5HGY9++AkislOQ1l0iqYzSxROsTIlRaEl6yggbg/lStKv0vwR6iyMd5ylDXzfVhrPfbuLCM83+6CuBASkx4/REPDMRuJquDGPJycFgrT6jdrOouma7DQJOVUNjq8i60Poa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g7qChYoi; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g7qChYoi"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223f4c06e9fso22559925ad.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 21:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745038785; x=1745643585; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ihPmYZAOi9Wr0993N5yd6czP2sDWJGDp5YbRtZuyqK0=;
        b=g7qChYoiAxeaj7XrX3v1lPC65asflLnUR/PyzP2QzDSPtZ2dyfAa3sXPWXpgqEpu7n
         NF6Qg82Hh4tpqL0U7RxZTcjHKaI6h7suV5PGB3rkIUgliXSJsHjBJEZK+gHCFRoitneO
         8E6k2QzZq7olTxgJJFbqsf1aZQ3iiQt7HtKmR4yVmaqW0GgwHA9hM3KVgxrKLIHh1FKw
         3vZflWJgntugBPIMDRqjZE1gNI1JvRsxvwhxJBvRsSUZLxvDu1uWf7OTwmobRHk1kT6m
         zyzyLdOgpuaUvKnbKNGZ3cGS3mvsQXHi4UejGlLWisNDFBbrgJ7Mk3S2GNn+wBj+mVyK
         l2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745038785; x=1745643585;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihPmYZAOi9Wr0993N5yd6czP2sDWJGDp5YbRtZuyqK0=;
        b=pjX112s6ZoNeH2izn8u2ozevK81Lntx/mWw1xXFus6UGfQxZpLeeu2eCvEnt5p3Ggp
         1Kc8veB+5hb8Mb29o9BWdPL3yd1KU+E27iOYCMLHAqMZRJOr8+/rzHdKkZCFcrmQ+wtm
         TfKxTnwa4J+srSIoWoIDf102RjesUTaNdy1N9LzgpCUBJAwtcpnyM8RQRiHfAj9kZEUV
         Ag/vqV6RERaB2Y4PGu8sbqKYVieiIh3djzvCZESnkOfcDgaJPl/djZjWTk7Ckh7PnZX5
         iZFyXRjhRynjrZQ9HjGOyCOSM8Ia5lj09SVEFA521FGzHdaoKckaaMrOx+GrSPEQ+GDe
         Q/dg==
X-Forwarded-Encrypted: i=1; AJvYcCW0godRS9sYY31INUE7bDkb2sSZ849ChIPqVAFW5pFeHXC3sWv1FdqjVThMTCjjlea9kxiMHXHGuOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmRgjrH4XpU1kN02maEu7W6SARkjHcnyYEraJ6kZZIjUCUON1T
	iGgHq5fdV+RGIHUX7z9VAJICIJnyJPy8YwxELmgnOtUeOnyrk+WgXxCx3+6lAA==
X-Gm-Gg: ASbGnculWKZM2CivNwyCpoDgT46oj4Vr7qTfisw+S1GwvmmuYFoJoqhDLkOOmYsZcsZ
	mNWhaF3J5sYVzi9pUhMlDu4foJ2NLN7fx/0FlF/HhvSUSZ/2d9YcOWBthkZ+X+d8lHOPPBHEwEU
	521R7PwS3XkPL735Ozz8Yd2qu892BiEPCeK5LynX/l9eaC4zGVGw4Vd5HRjn4pqpHpbR/8rc2o8
	+dlK7sqdKZynKDPn0rKXF4lpN6W0O7sjvPUZ+l71iqkKh4E5XbipDUxJwD1Ou6ZqR09zCqgRwvu
	Z1xebQ7j8+B5zcIkqdZ0LK33QLzxeg+xVjWGsJ/FTIiWfsEvQlv09aZJqk5gF8Q=
X-Google-Smtp-Source: AGHT+IFVLt77v5MR/5+JKL88xzJjihXXNgo0TxPnZRMphGmJ1FoBgkTERqtO4oCTLca1G9+jsQnRsg==
X-Received: by 2002:a17:902:f644:b0:224:7a4:b31 with SMTP id d9443c01a7336-22c53e38f33mr60733105ad.6.1745038785095;
        Fri, 18 Apr 2025 21:59:45 -0700 (PDT)
Received: from thinkpad ([220.158.156.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fdb97esm25276245ad.219.2025.04.18.21.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 21:59:44 -0700 (PDT)
Date: Sat, 19 Apr 2025 10:29:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: bhelgaas@google.com, jingoohan1@gmail.com, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] PCI: rcar-gen4: Add a document about the firmware
Message-ID: <xkcifbp4f5ql3luxzsdvkjomhxiqzmcorkbjv2wtq36rsfgbgy@xnilxquk3arf>
References: <20241024120525.291885-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241024120525.291885-1-yoshihiro.shimoda.uh@renesas.com>

On Thu, Oct 24, 2024 at 09:05:25PM +0900, Yoshihiro Shimoda wrote:
> Renesas R-Car V4H (r8a779g0) has PCIe controller, and it requires
> specific firmware downloading. So, add a document about the firmware
> how to get.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> Changes from v2:
> https://lore.kernel.org/linux-pci/20240703102937.1403905-1-yoshihiro.shimoda.uh@renesas.com/
>  - Rebase on v6.12-rc1.
>  - Move the document file on Documentation/PCI/.
>  - Add SPDX-License-Identifier.
> 
> Changes from v1:
> https://lore.kernel.org/linux-pci/20240703101243.1403231-1-yoshihiro.shimoda.uh@renesas.com/
>  - Fix typos in both the commit description and the document.
> 
>  
>  Documentation/PCI/rcar-pcie-firmware.rst | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/PCI/rcar-pcie-firmware.rst
> 
> diff --git a/Documentation/PCI/rcar-pcie-firmware.rst b/Documentation/PCI/rcar-pcie-firmware.rst
> new file mode 100644
> index 000000000000..0d8a87ce9aa9
> --- /dev/null
> +++ b/Documentation/PCI/rcar-pcie-firmware.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=================================================
> +Firmware of PCIe controller for Renesas R-Car V4H
> +=================================================
> +
> +Renesas R-Car V4H (r8a779g0) has PCIe controller, and it requires specific
> +firmware downloading. The firmware file "104_PCIe_fw_addr_data_ver1.05.txt"
> +is available in the datasheet as a text file. But, Renesas is not able to
> +distribute the firmware freely. So, we require converting the text file to

s/we require converting/it is required to convert

> +a binary before the driver runs by using the following script:
> +

Please add the location info where the firmware has to be placed.

Also, add this file to the "PCI DRIVER FOR RENESAS R-CAR" MAINTAINERS entry.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
