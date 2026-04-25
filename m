Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4D8371046
	for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 18:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777143321; cv=none; b=ic7JOZm40Z0yg/5dLfGM3F2cvkDBeKOnsgKuzkKl9LGd7QCb4VM1Z0/tOHn4Zop3svVbD2vSsEUsYPuygsOb2E42kST5Pp6/3ND5c3cdb1vpIdjWJP2800njPX18eZDzJge3MuSOAif7RtT6dvZpMIkv0bsDQe7NFIqVtzKSKsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777143321; c=relaxed/simple;
	bh=6PC5k/wB15iovttGKhDrvKcF72yoyScM3QZMtUPjQSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/+6Q7BMFcRiAiQ1RrtC5jL/tfZLz7Sd1grVtrA/6ox0sZQiDgfIVBMm9GIAd2K51UqsEaqloAQ6S21nhdTrkhT2St7giPNSILertLMs8m3YT0OTOzGXD6nlaNTjQLktJYgNKLB9R+I3pFdQw87Ws96PwJet2qILZ4nKNUFJxq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lh457qgi; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lh457qgi"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so87407791fa.3
        for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 11:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777143318; x=1777748118; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJITLO9f82dhzr/WR0Vgm9oDU311eY+/4fzqp2zrKeQ=;
        b=Lh457qgisV6ZK+UdoVSJciORTc7YuO4PV7tqpteXbXTPAbR8RYLVHGxCMIc0eJ10Os
         +y+9uGVlHU0a1ISNPlJjDVqLUmvwAIw2mpGU8K2ye4GZqjfyp5mEvbtYOtin1xcfTxT1
         K+Y94mje9MWJIGC9te8yfXD0VLYeY1kd1e0VHXlQ+kyyFGx02D6YlinWhngGifSFUAkl
         NBZx/YCoodWr+vAPmi2wnRLe53zfo+7wePxTr9tjWpWtP+cZZAvPZ2pv4CGzB1ZmnS8+
         2IZ5O/zOWWQWbXYuo8qiXU2ZZP4U7tkl7WQ7BHrvGgohuZ7YKuxZWC0bwUGBaHPT29Hp
         V0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777143318; x=1777748118;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJITLO9f82dhzr/WR0Vgm9oDU311eY+/4fzqp2zrKeQ=;
        b=Xk1203qTvf22dJ+uAkqxIO7Mlyqg/Sxl78cYvJ7/7qxmSix6smt82Bd4CvQeaQJI8x
         Zca4vQCH1twtxlIN9MeCF4WwEFUQvOXp3LRo5W3hYVLe0LUS+oIwX497V+4JiNO1l6lc
         17ophi1guRak8GPH+plhTmCSNP1g+HxJ7Qil7D7M3LcVzrJERrlymNfyfl6LK71FuMWq
         +woDqb0UAzMOMrPYgLGXD4THngAjquysNbm2AzejR+fWjhX4/BtqwQ6DqUZDGyt2Q+5N
         Dz38hvlg+agL4tHjH89kH6gfQaC3VXtTO2V/MinojOh7KWRRpnyKRn/w4+8q81dQRuff
         US8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+DwMcoJZQlf4r6Jag7AVElLMZhuaEshEVCpSTKaFXmKbxBika8ZUx1sfK8ETz3TtYOLF7fs/jIk8c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9MibcDTYCP6qaHiZQOkZi0SHR9ClM95kNsgXWF9wRID1rxPnw
	eV7RoPfy9txdcaAdH8Jn2/YB+3NplZMDcg4Xyaa7KINF644goaG6nng=
X-Gm-Gg: AeBDiesN0UXuqQRxJNxqzett7NQlU8VqIuhTCatXGDbRNA+2q7wJxq9/9Xk48wSeccc
	XKi4v0ddeUx9Ge2E6O9cUyaw+is225x0lt+JHFf17lFlpj5fIuzPGyAZhmHE0K0LnUHIk89LCld
	HTGVSrQXdqMpmRiTrbnYDE8pcDzL2K9RXclSkE2Fu3uYMkeYl440rgRi1QLw6xIsGfzacco27CD
	cetk+qr0gB47YKdzwhJEbFmM5KC5SGTZmITNYAc8B2U01trv3qtsbQrI9kUsG1WGhh6pMG+h+5/
	vIO3MxqjkS8MGwtSCFCjCnGMSCRhvEh2kyY2sXb+cFhAJa53OVQYbz0Ami004XWqPUot4BHO3mx
	Mqm4rCT6pH/HDaWejdsepJWIFoh/sMFL4XoQcYyQMuJUk8GZf9nE8qMzFrcoRDybQWbGJWgJGjv
	oJPQr+zBb4Rlz/jPF5ELVwScUZ0wT+6gOb2w==
X-Received: by 2002:a2e:be1d:0:b0:38e:49e6:a376 with SMTP id 38308e7fff4ca-38ec7acfa4dmr137809241fa.22.1777143317812;
        Sat, 25 Apr 2026 11:55:17 -0700 (PDT)
Received: from p183 ([178.172.147.163])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f54ffsm57552711fa.1.2026.04.25.11.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:55:17 -0700 (PDT)
Date: Sat, 25 Apr 2026 21:57:29 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Rodrigo Alencar <rodrigo.alencar@analog.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <4b7b42fb-e3db-4218-9deb-ad609e07bfb0@p183>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Rodrigo Alencar wrote:

> kstrtoudec64
> kstrtodec64

The only comment I have is to maybe sneak in "fixed point" into names
somehow. Or change to kstrtou64_scaled() because return type is not real
fixed point type.

	A.lexey
