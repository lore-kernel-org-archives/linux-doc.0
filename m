Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C541929AAE8
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314734; cv=none; b=UoqmSVZhaVP700RKkQ98tgMYV87Klq1K53EGW5lHaYWQj02ChWJTDJdZcZWYPkZj3X+yl1k3E5ZxLPAEeql1cLXPHg0YKHc+xBdNI//3bgosGq7bIti643iKmSFDydFBCUN9FDcljIFn1Sg3Wgna7gDFuvFc6XXsg8W8CAIp3MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314734; c=relaxed/simple;
	bh=aaXgNL1VT+/xjMdQkulVFWEp4own6/PEE/2QTeFej9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phsi+WUu6AFN2SxijAa1tH1lW5qqiDvGCliLAiW+nNPVUarZasMnyDtmi/jqqh7Mdvtn7B9D1QqKfzCcZ/hUclMGQSW2GEgiO7zW9MUAHD2RwvJuGheBlPfWNlzRXJJqFZ2q0xjExF7vl/vH/X0PHQYyFW2+VKqm650eFRTnD4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wL7yyb+v; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wL7yyb+v"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a0be50048eso836785f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 06:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747314731; x=1747919531; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c3MKAYkLPhubyXeqbsbbCcT1xzf3OGrKxlCFqhiA9Kk=;
        b=wL7yyb+vOdzehR2e45DYkhLUmE3W5YDwaBXhcyEA6Ler9n9ATCM8gJncoXFSbrU/n2
         N2BM/Y4+Uf50WAhm5SGpNK7DNN2LaUUvcKxo/ww3KgmXn17amXuWiMuc3B+BCtevUsu4
         WB8mAHT9ZTxRtk5TtCSTsb7KJnopoGIN4ZneQkTLOdj1N5WI+TVlRYT8cljpBeHkr7tw
         RQ3C77kVjdTCBxcueZNx/zrdiE+jSvNSAMZigL0OHzUiVydaGhAsrMrjzkd5ViJHOxP8
         6qmL2zj594Tr8AuKzZBe13X+DVl83fHy+YsiPEXjF9TczuiS/rtS47Cr91uY6nsgrQfH
         TAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747314731; x=1747919531;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3MKAYkLPhubyXeqbsbbCcT1xzf3OGrKxlCFqhiA9Kk=;
        b=OazW6CCukWiO4bypFEtvkllYSQx29zRL1eQrp/QtPp632fVqdBjB4zbE7Ln9NaYBGa
         im3IWs1Xep0JJS0TCGcdhRGHxgq8QeXZn6TrUaFAIEXyPAbe7sO8kxi61glTpOWAeMgV
         B8NO/V8X68cvO6J0vBpSpGuYBTjGWzQKVKNkJ2i/x9X9PMoeBqNsFjJwweAXAqEP4gze
         mO24r9Bh823f7L5afsUfbt/nrXNbNq6ilsCSsA3LpJ3IyucdJs/xy/FbpbISgtq7wXNn
         xi5zPJWslWfa2UFOT0sh5ZSraeMM/+h7screO17aHemwFtAwZ5Gye7EFzoRF6u1EWdZW
         t3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnAoc43iLTk8LqymbpYe3H4A5rok0QVI+uvZXFrXuH2ebB82poIadvJJgpm4UGSm1BG7QTE5xro2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxFD7RnpJnfqX2h1JNc6P0VuDcVY0oMbZs/LbbA7IMMqZE5NfA
	BKaD5Nfhp6i+oSN6Dn+004rlEHTZHD6knmbevnc4mFgq8U7+JNnc0iIipMIb4w==
X-Gm-Gg: ASbGnctv4zRHHLa+3CjU75STVHBdIuZ/trYPYXlP3AHdiQLVC6KMRuzsl+dYswoTlAt
	uFfOaNTgedv2GyXjT1uRhAx0zCDTiIdY9LH/u45UgTpkFTFD0+zOFfYmCfweuLfLMT7JWgQz+Xe
	1zQqK2h33THJ7KpIE/ugcJTzTEkGSRa+9jDHVMe1qdyRrcK2B/XTFfgpMB+cEr5zuVkv5MzUJTS
	IJ2YYOZMKStGqM4fUIYsElADvo1byZ8kC2TbroomcI53X0d0kf7SZJddmznTqVAehRCAvqJt4yX
	0F/4K66xkU1K3LJ2Gj40ycj1V7RZ0vxxobIWU02+ti8B//gK99hGr44j1UCazBF9VSyU8jLNOGb
	yStteU31Y13MWfg==
X-Google-Smtp-Source: AGHT+IGKu1Mwu1s2x6/w2xAPOyXhBfvmQmeWUcOFV5VesSsNvTc5Oo3A3N42qaHch1nRV37wsCynTw==
X-Received: by 2002:a5d:5f8e:0:b0:3a3:5bf8:36f6 with SMTP id ffacd0b85a97d-3a35bf838cemr980643f8f.55.1747314731020;
        Thu, 15 May 2025 06:12:11 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3369sm22999193f8f.57.2025.05.15.06.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:12:10 -0700 (PDT)
Date: Thu, 15 May 2025 14:12:09 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: bhelgaas@google.com, corbet@lwn.net, marek.vasut+renesas@gmail.com, 
	linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4] PCI: rcar-gen4: Add a document about the firmware
Message-ID: <bo2hxi32znmikg3z6j3rreqqksoijfn3ugb5ahyn4qirixc2b6@k7bs2lvipfz2>
References: <20250507100947.608875-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507100947.608875-1-yoshihiro.shimoda.uh@renesas.com>

On Wed, May 07, 2025 at 07:09:47PM +0900, Yoshihiro Shimoda wrote:
> Renesas R-Car V4H (r8a779g0) has PCIe controller, and it requires
> specific firmware downloading. So, add a document about the firmware
> how to get.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Looks good to me. But there is a small nit below.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
> Changes from v3:
> https://lore.kernel.org/linux-pci/20241024120525.291885-1-yoshihiro.shimoda.uh@renesas.com/
>  - Rebase on v6.15-rc1.
>  - Revise some descriptions (reviewed from Manivannan Sadhasivam).
>  - Add the doc file entry into the MAINTAINER.
> 
> Changes from v2:
> https://lore.kernel.org/linux-pci/20240703102937.1403905-1-yoshihiro.shimoda.uh@renesas.com/
>  - Rebase on v6.12-rc1.
>  - Move the document file on Documentation/PCI/.
>  - Add SPDX-License-Identifier.
> 
>  Documentation/PCI/rcar-pcie-firmware.rst | 24 ++++++++++++++++++++++++
>  MAINTAINERS                              |  1 +
>  2 files changed, 25 insertions(+)
>  create mode 100644 Documentation/PCI/rcar-pcie-firmware.rst
> 
> diff --git a/Documentation/PCI/rcar-pcie-firmware.rst b/Documentation/PCI/rcar-pcie-firmware.rst
> new file mode 100644
> index 0000000000000..0e285c4a7cd72
> --- /dev/null
> +++ b/Documentation/PCI/rcar-pcie-firmware.rst
> @@ -0,0 +1,24 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=================================================
> +Firmware of PCIe controller for Renesas R-Car V4H
> +=================================================
> +
> +Renesas R-Car V4H (r8a779g0) has PCIe controller, and it requires specific
> +firmware downloading. The firmware file "104_PCIe_fw_addr_data_ver1.05.txt"
> +is available in the datasheet as a text file. But, Renesas is not able to
> +distribute the firmware freely. So, it is required to convert the text file
> +to a binary, and the binary should be placed in /lib/firmware before
> +the driver runs by using the following script:

nit: the above wording sounds like the script places the firmware under
/lib/firmware, but it is not.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
