Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895501D130E
	for <linux-doc@vger.kernel.org>; Wed,  2 Oct 2024 14:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727877711; cv=none; b=TI7c7uMW/yh7R0R3tX/jan/A50/2+mt4ZgMKFPnJxRoD2nTipd2XdSgBVRBB/Xclery0GC8yq1wqjgIVGkuQzIc5TXo5j2s+R8MFIneeOP0jsqWfHHDdipqIaMEYWoc1rdJvgV+9leYASMRDLEbioJImVA9M6+SghFOANEmHtoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727877711; c=relaxed/simple;
	bh=1pmb1sDkBayL7SpLFra03BlTRS8TALBgSPNxfcUCWr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/gFhwSs/4G+IF0pQtg0aKN5hKVS4/83hQDsbfMcCq96lSbL6p9BQekJxVbI6riD8M/w36HVnhazH9qM87e6EoetC5tKuwuuWdof8PkYu0Q/F9W7ygu1iQcFx46e7anOuwepEsz3fg8j84zKE3NfRS54YAorRTcEPafVTXFnNMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZHqshu30; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZHqshu30"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so8323488e87.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2024 07:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727877708; x=1728482508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pmb1sDkBayL7SpLFra03BlTRS8TALBgSPNxfcUCWr8=;
        b=ZHqshu30MKhy+ha4bqlsyDrTwhplZwJfVZujK9mlWbbhg4xD+qG5exJM+NLfdGo9zB
         zheBlVXOc/h9hNDUPKu3wMRs03Fs0BXMXdzTXIbwfmnQ9J818co0Lj5VQ6jIGOL+wjN+
         pEgyBUeouMOxCzy86dPMDLTIaU+zGuK/GmK6k8KYj3QCMxI2VYlaUNRqVrZC+7LwdKl/
         qC8VpWX5FAHgnGagaJyjmZ0AmjkJ1rs7BmjNwDbTYlIEDLiNByAVz6OI8QvQhUxlPxTC
         TrmasBFfeoj2sBOtHwcd/Nhh87iX9AV+Nb6SrOA3OGPbdRJNSI7goRhNOmD8rsYcik6c
         JMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727877708; x=1728482508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pmb1sDkBayL7SpLFra03BlTRS8TALBgSPNxfcUCWr8=;
        b=WynVcvlu1DCuHX08g+L5ErLHkk8j0se34/JU8INTZilf6x0flbMP7RWBlZTpVJZU+0
         I4nUgpi8+fVmG66yDyDUJ0K4ysmr+lRBHGjps1M89Mlykf3BoFNyklV2g58g1c5++y0t
         xgsUbJGF0zczUWgdP2FBk0Mq5mc/fHuM4Igp4JJHX0zZjZeS2nbis/jJf80XUCE0Rlgl
         zy9Jx8NPVEOhkqi6KmtLMP3iHNd5DE+Wy6lRB4Cn11VHLlDqY16pjVR2zm6gG8bcyRXn
         SBGsQgNp2zn66kuBpne2kGNaQKpUlQOPdOFiESFJ0WaJtdRdZO1Vgo0BwzPWCe0PfbtP
         TmkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb9lsfH1+bot2KpPyhTaDqXB8aDBJsmjyOI9OnX3vdv+v/vwfLH4xnbDRk/yFFALxDEeYClj3NFUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyctkOgVor9R4OGmdYPK8YaYZlCwptmWKf27W+n46TZnzNA6fOU
	YrJCRBwGnUw/QoBVsrERNj04F1CeBwHZhHf3T5bX4HAAJCJTjpHh12f1sC3t2N+m/qcK3S5vnBm
	KKQQZTV0o4AsFYxgDT7nxKh3rT1m00rDTRdj+bQ==
X-Google-Smtp-Source: AGHT+IEW35z+SB32dXETmyauiAuNdaSBG8Cnz7/x5oVp37LUBxxVnzuKhCWcA0adW64UvBqEawl9nsr4IE3RS0Lg9+g=
X-Received: by 2002:a05:6512:3192:b0:52c:e3bd:c708 with SMTP id
 2adb3069b0e04-539a0658abemr1776489e87.10.1727877707635; Wed, 02 Oct 2024
 07:01:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001221931.9309-1-ansuelsmth@gmail.com> <20241001221931.9309-7-ansuelsmth@gmail.com>
In-Reply-To: <20241001221931.9309-7-ansuelsmth@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 16:01:35 +0200
Message-ID: <CACRpkdZ=QLcqNrynWrWn0oRxjBpqWDko8rw95idEWvyfw+xEOA@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] dt-bindings: mmc: Document support for partition
 table in mmc-card
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	INAGAKI Hiroshi <musashino.open@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ming Lei <ming.lei@redhat.com>, Jan Kara <jack@suse.cz>, Li Lingfeng <lilingfeng3@huawei.com>, 
	Christian Heusel <christian@heusel.eu>, Avri Altman <avri.altman@wdc.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Mikko Rapeli <mikko.rapeli@linaro.org>, 
	Riyan Dhiman <riyandhiman14@gmail.com>, Jorge Ramirez-Ortiz <jorge@foundries.io>, 
	Dominique Martinet <dominique.martinet@atmark-techno.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Li Zhijian <lizhijian@fujitsu.com>, 
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, upstream@airoha.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 12:20=E2=80=AFAM Christian Marangi <ansuelsmth@gmail=
.com> wrote:

> Document support for defining a partition table in the mmc-card node.
>
> This is needed if the eMMC doesn't have a partition table written and
> the bootloader of the device load data by using absolute offset of the
> block device. This is common on embedded device that have eMMC installed
> to save space and have non removable block devices.
>
> If an OF partition table is detected, any partition table written in the
> eMMC will be ignored and won't be parsed.
>
> eMMC provide a generic disk for user data and if supported (JEDEC 4.4+)
> also provide two additional disk ("boot1" and "boot2") for special usage
> of boot operation where normally is stored the bootloader or boot info.
> New JEDEC version also supports up to 4 GP partition for other usage
> called "gp1", "gp2", "gp3", "gp4".
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
