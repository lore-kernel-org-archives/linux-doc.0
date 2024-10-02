Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4250F197A6C
	for <linux-doc@vger.kernel.org>; Wed,  2 Oct 2024 09:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727860838; cv=none; b=eW7FPodS9x7buH4EWzVj4+4C5xfImkOIbMz2NM6r2W9k0cCUy5MBkTGfw0pG9xkh1ARkrzdwB5qZXz2Jazuwt1+LDPxjw+xsBy6W35C93/W4XyJxxL8AkNQn3jzxYjPf/qgrLOzSTjT3G397i+3uwe7Prl0n/YtKA5NwXT4D5MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727860838; c=relaxed/simple;
	bh=mzDHbmnmSbZgPh/ZeldgAOMha3PtMlQ6ANgxAOBY+Lo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JHosBGi0OFmdCWMLNzuAautr4EtLFcR63LnB/ncB68vTzaOx7Ukx8XCX0CTt4OSScqSw+Ov7rkR8ktn6UoPyqqaRfoLplx10gWdA/p1dL7uVkNLEn04RmYr/TWgmS33mrpj24HbZNKDSCLVFGXKRsT+hF7Hl45cWY4MMYi678Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=QogGA6z5; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="QogGA6z5"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5389fbb28f3so639542e87.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2024 02:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1727860835; x=1728465635; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZO0Y8/ubh1XnuZPCq0ksaN5wnj9mPknfJDM/0u+lyg=;
        b=QogGA6z5eZVmTANsamaQycj17E5dDAmzrgR5aS6Kh4VQ5qH5zJu85Gb1n+oG1R9AdY
         gUiF9TQ0oudqONW3Wsz3a5wzIuekzBQ1FFmLB+IIbB2Gy75b/0PlVcnOsKgzAB4uIACp
         /8t61Cbl4CgKgBh9+Y9IX45DcjEJRlDc+Ksik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727860835; x=1728465635;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZO0Y8/ubh1XnuZPCq0ksaN5wnj9mPknfJDM/0u+lyg=;
        b=YlL5jMGec7v845mVogb9kkDmOZBOdQw44Cot4pGqBa/oQGzIjp617/Cj9HC0XQa/+q
         FhArVkqJmZgqvVUIPjJ1a7DWBamlGdAji+8QE3cavjBH+E96lQbS4TjFIUeChdWIF6SA
         pBiAMHL2+zqVqtN7hXb03IHHIiuHfokqx+RmOnGgE6QBZ2SyWBqy9vi1WsgsSsC79tho
         LOv8821ccJIb7nD8vIqhBmeV4tVueIub94XX1KdBGknL1iuCP/5ES+Yv67EQgrl6DcqV
         bE9Q9DmD1FShduhiDfYWUn6ZEnhwaKHIZYBF7uljxSU13Xw4jcp4LdBgle0YRa32GfWM
         DO3g==
X-Forwarded-Encrypted: i=1; AJvYcCWu2fMIlTZg5pKjbbnk38gZ5SiuSD0OKDjFOHHXofWBzegwNikF8JfbF1u5zYJNX/Y51v/tl5Qbzg4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0NrC2IviZB9zF1PgNuPBj51HRnANtzeKroKCCDFfAIMUL2Cm4
	wvnSpqXvJsAqaE8ktOvlfgI9llglAc7sGksPE9WFsIRvHMHp49TcB+5HYL1J010=
X-Google-Smtp-Source: AGHT+IGtXJvrufAFjd2v/2BhFG3gRzFXYZPIU0TWOYK8Da9d0sVChTE0gL9gdkfIYnsbyV2u2l+F+A==
X-Received: by 2002:a05:6512:12ca:b0:539:950b:139c with SMTP id 2adb3069b0e04-5399a24664bmr2042373e87.12.1727860835200;
        Wed, 02 Oct 2024 02:20:35 -0700 (PDT)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-538a043220csm1817735e87.156.2024.10.02.02.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 02:20:34 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Andy Shevchenko <andy@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,  Jens Axboe <axboe@kernel.dk>,
  Jonathan Corbet <corbet@lwn.net>,  Ulf Hansson <ulf.hansson@linaro.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Kees Cook <kees@kernel.org>,  Daniel
 Golle <daniel@makrotopia.org>,  INAGAKI Hiroshi
 <musashino.open@gmail.com>,  Christian Brauner <brauner@kernel.org>,  Al
 Viro <viro@zeniv.linux.org.uk>,  Li Lingfeng <lilingfeng3@huawei.com>,
  Ming Lei <ming.lei@redhat.com>,  Christian Heusel <christian@heusel.eu>,
  linux-block@vger.kernel.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mmc@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-hardening@vger.kernel.org,  Miquel
 Raynal <miquel.raynal@bootlin.com>,  Lorenzo Bianconi
 <lorenzo@kernel.org>,  upstream@airoha.com
Subject: Re: [PATCH v4 0/5] block: partition table OF support
In-Reply-To: <ZvqfbNDfI2QWZEBg@smile.fi.intel.com> (Andy Shevchenko's message
	of "Mon, 30 Sep 2024 15:54:04 +0300")
References: <20240930113045.28616-1-ansuelsmth@gmail.com>
	<ZvqfbNDfI2QWZEBg@smile.fi.intel.com>
Date: Wed, 02 Oct 2024 11:20:37 +0200
Message-ID: <87setej1y2.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andy Shevchenko <andy@kernel.org> writes:

> On Mon, Sep 30, 2024 at 01:30:07PM +0200, Christian Marangi wrote:
>> Hi,
>> this is an initial proposal to complete support for manually defining
>> partition table.
>> 
>> 
>> Some block device also implement boot1 and boot2 additional disk. Similar
>> to the cmdline parser, these disk can have OF support using the
>> "partitions-boot0" and "partitions-boot1" additional node.
>> 
>> It's also completed support for declaring partition as read-only as this
>> feature was introduced but never finished in the cmdline parser.
>
>
> I'm not sure I fully understood the problem you are trying to solve.
> I have a device at hand that uses eMMC (and was produced almost ten years ago).
> This device has a regular GPT on eMMC and no kernel needs to be patched for that.
> So, why is it a problem for the mentioned OEMs to use standard GPT approach?

For the user area (main block device), yes, a GPT can often be used, but
not always. For the boot partitions, the particular SOC/cpu/bootrom may
make it impossible to use a standard partition table, because the
bootrom expects to find a bootloader at offset 0 on the active boot
partition. In such a case, there's no way you can write a regular MBR or
GPT, but it is nevertheless nice to have a machine-readable definition
of which data goes where in the boot partitions. With these patches, one
can do

  partitions-boot0 {
    partition@0 {
      label = "bootloader";
      reg = <0 0x...>; // 2 MB
    }
    partition@... {
      label = "device-data";
      reg = <...> // 4 MB
    }
  }

and describe that layout.

Rasmus
