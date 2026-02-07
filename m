Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A576B2475CE
	for <linux-doc@vger.kernel.org>; Sat,  7 Feb 2026 18:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770489332; cv=none; b=HsAzhAr9/yOdj/cvtk71ilZkTNMTtXhhCALsKS3sL+B954d2Ne9L2ST5j9Uoe7cNcM6uIAgjP77FtAzfgruzlrNkGsCKLT2/mHDUhP+4R9VcZ2fYozPI/KqLvT0N9ysxk6T51hdZzdNJEmgmfnSMxVQ/aMo+2og0J/0ZbxuEtKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770489332; c=relaxed/simple;
	bh=XNpbsRYsF2rlv0zb0B6eouOvN5D51trGAHHoO5yraxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qLh4l1hQsAbHQGxAd11APlAHGXKRutd5QnczxO2y7El5JX8kQwFgxrW0KODacVSzo1HFsTpLoui7n3rcQmsGlB0n8pCCLthMW2/nMs/S2Hl0SggK78TwvfdB5donxFfTTjDWpc+DR5TF5KE7OphSy0feT1wN+OnzqIYdJ33iUh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=l6VsbM/L; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="l6VsbM/L"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-45f09874c4cso2128868b6e.3
        for <linux-doc@vger.kernel.org>; Sat, 07 Feb 2026 10:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770489330; x=1771094130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NARnSWeEyQX0QI8rBoQ42GOyDjukxOobZDpLSRoeY1k=;
        b=l6VsbM/L9qC7D5qDL2bPJA0eG5rteivNxvTXWAOG15wMXr69WIu7OIrrvNbt7c9DPL
         tMcgLeEu1R1YcBsGxefcFwabW6ZwDlqIqzhLiWLnR9xRUW49ubehS5FQmVSkWaYuqwaz
         fA8JOILVik7YI/qbjk5Jg2CYPIvm0kyhgJEdO4fSF4qTBP2jvjv13hW+RH95Oafl5Q6H
         oOLmpWjAj4ckG02XO+PUC5oQDT51sT2/W9Um5znbqUT+XZvG7kKFSJhZUf6UXsVWBUev
         pjEkbfx+kFqmNFn5xllvBNPU0lNJ31zdJ+5fGSszN3CEG7WsOcuDNJTa1dk+gJXrJK9q
         xUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770489330; x=1771094130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NARnSWeEyQX0QI8rBoQ42GOyDjukxOobZDpLSRoeY1k=;
        b=X5srTBfYTwavk6yEcjHTRj56i1qZH9luWBodyBLkoqmWyD38IeaJ7IU2ccgUdFe+B1
         wcaJYDppYEP07vIA688CG0Dc4FeS37tCsNBhTuf0to8/uHptpi9n+Lnm635Ntu3zSQj1
         EEabWMVYzKcjd4+iDx6b15/sOBK7bw7/oQq+JTyfWdqj0vtW5PQ2BwicCNNH2j2XYwYm
         +HeenCU0XvPS6Ch/jCaGhdS3ROjpHV8OhQ/+diuv2XERw9N4KkJH7l9PoMG8HwRomLRw
         k05FjbrjgjLA53o/q9/D52D+ryrQ0NpW2DX4JWYRkt9zC6Kh8eim9/fyl2O+hjD7IDBK
         2xzg==
X-Forwarded-Encrypted: i=1; AJvYcCW6+GzroDJtMRyXXBjkk1nPCz2o3SK363rlKMrZo+LWuNR8t+qGnBYWcd1NSwkU85qtwQ2WXZMkEN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+l0xrg6cQ7tok36faNtvmt8iod4xsf55SHCNC1wOzh7eMQ/Dx
	7W8gKyxB+Q775rGM+AnWzporxSWaHMlgDaa15vIIL4ltCRYAj1eu5ORgaS9O6mHk8LQ=
X-Gm-Gg: AZuq6aJ8byY9ZvxwpMfKOFSKNIsId3FV3lzymkg5yKbYtvnq+1WG1j1DWtP+q6vRZZG
	hwMmREdcU6kB9SwQBenicbjvFoTZUjkKBs3nUtlfIURDCKNRRZUvTSt3UYQO3PP3e3KAyQXvRFV
	MNOPQNBrs1ikGVSL3I2Qdy4LFgW+GJiZBcfPes47LWKkL3nb5GvVgQleQ87VM+kKhI/2KK5WHJg
	jR0VkL1OlmbMnqsqgQDzaJy74y/OXrDka1KRWpTq3+MLZDC9MdO53w6LYXYq2gFJ5/1K9Ih521/
	r/Ywfw3q+0okdOn8QPd/6BXiBJ5jWuOxCpIc1fEr8svPqwW92H5DnPcm77PCwfVHpwwfp7V9mYZ
	FbMACylg+6/srb4XRWzEHxaJATokzinoR5mmTnBuBM1m0TZ2+jR5uFxowL08NG+Y6lVsPETEsdQ
	kInbMDnknrxW3TVFwmA7Lfw/QL0+/a+viHi2TksfDkwgZvItLIEt2roFW+oA==
X-Received: by 2002:a05:6808:158e:b0:45e:f0ef:cd75 with SMTP id 5614622812f47-462fcb77c7amr3236711b6e.65.1770489330578;
        Sat, 07 Feb 2026 10:35:30 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:74a6:843b:f33:21ae? ([2600:8803:e7e4:500:74a6:843b:f33:21ae])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-462feb5455dsm3550699b6e.17.2026.02.07.10.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 10:35:29 -0800 (PST)
Message-ID: <a38f418d-a73e-4f9d-9c58-92566c3db0d4@baylibre.com>
Date: Sat, 7 Feb 2026 12:35:28 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/8] iio: adc: ad4030: Support common-mode channels
 with SPI offloading
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, michael.hennerich@analog.com, nuno.sa@analog.com,
 eblanc@baylibre.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1770403407.git.marcelo.schmitt@analog.com>
 <1f05069e25e9ea28db2cef9fa3856456be3c2614.1770403407.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <1f05069e25e9ea28db2cef9fa3856456be3c2614.1770403407.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/6/26 1:02 PM, Marcelo Schmitt wrote:
> AD4030 and similar devices can read common-mode voltage together with
> ADC sample data. When enabled, common-mode voltage data is provided in a
> separate IIO channel since it measures something other than the primary
> ADC input signal and requires separate scaling to convert to voltage
> units. The initial SPI offload support patch for AD4030 only provided
> differential channels. Now, extend the AD4030 driver to also provide
> common-mode IIO channels when setup with SPI offloading capability.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylible.com>


