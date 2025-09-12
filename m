Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BA928643D
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 09:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669066; cv=none; b=FOJjec5R/kqdO4N9kyRUzcxA0fiCIkmrCmbj9SJ1SAMV00VLaBzfmh3cdrsSiep+BR9XMSfBB1PqkJR2EkRMaHsvUtUDMsbo6D1Ix7jmzTM2Vy5qmdhwfUzdKOno1dKJXzUFzSIAN5xmNIUzflpIV8t/DC8Hx4h3QN4Emu/ePws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669066; c=relaxed/simple;
	bh=zZ3EdgDqG32koRVEzkCdU26BudT4DPvEmFEKbPHfTpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dobfl/sSKp6E4T/9s/2NQgrPB14M5Ia7vFO7BAw+7Z1ofpvjlCxydi6DE/A8wt8Tzg2IttfNJvS5yo1pYyr3OaJPV/84o5xHrQyYpeJkmfNeRXvGE7/SmOidDJc3qPOYeTXqC292J7j3AaVWy/TsdE8uZt5T727X4cm7zPYodf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dqoyVcPX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dqoyVcPX"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b0785be64f5so462796666b.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 02:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669062; x=1758273862; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ejOVXapMEGWfb71MDH1k0hVwflqRG+5TP6RxYPYRsR4=;
        b=dqoyVcPXoTN93DExdiwxhhzwT6Vm/NElVLwtQ7IAwdx9yWDS2gwil6GCHlM3ZPaDRB
         XS/Muo/J9WUP8B6EmhQgf24Fn6+D3wmfJZqr1mcvThPJDqKXR7ZCVmqJ5gNsIbjAf71G
         p0WdPEgHsFd4WvVnxx1p5XG7XwuR5b3DfPeK/8IxAsgmaUpAqX4efcgzA4IfhzH5tMxt
         xl9E6bJ1gtz46KSWGnm5GPPZxrTcSEZCBqCLbd2xxMgQmieI4HFDfr0ALK6CNThyftbv
         UDm6DQ76I7oQmbn3ogZfsWlawpdRyaCW4y69Dw/llPfT+BNBXrmS9clG6Y/NZNpu74dM
         9kPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669062; x=1758273862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejOVXapMEGWfb71MDH1k0hVwflqRG+5TP6RxYPYRsR4=;
        b=Qs6p6DbP5vkrN0rKHhpPDFFT2KixoGzm12atZudPR8CpPmB7XS61qOHbjKxEoT5R61
         2gDeXVlKQ+FnO7Q4x8TXHUaMh9kzepj7NJO5QLPSmPXQVRB1Hdg7CYeiXDHdRVXhp+wo
         q/Z4RgIhV3C9T+hI7bvQqxP+jWpszEPt/vS7oLSK+Nh6jFdvRM4qtUmEPwHVCluTvntk
         Wl5XcWIhMo6/KkZQjH922KTti0WK32nmW7w9VpNPwt9unPPGPT8oloTVQ6U1J7YagbDn
         X8UD7ocLLTsBOmhK7HkBn4C8TtUg/Ts4PmBNCmIFXpVr5PdRxSiIZZ5Sk7pBcS5I7i+d
         wb8w==
X-Forwarded-Encrypted: i=1; AJvYcCUfTz1oH6hc8oACr8nTaSxyK1cLXtCi8FPBY+VKYD+fRao9uWOQaarHc7ReiEXqleUgy7d3hyc5v2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLPYZ1nlKDBGpfiSpRrU+0EUA9+kSx8xOSgtt+Rt32EmUHeRWH
	YSyaCMYhO64uuhYUcDSYw54KaE0cBjqVwYOCgzZe0CsESKrd2mq9RXreGP2AFZ4ksmQOfyjIoc9
	0Ojx57NjjLOTLe6ofxM0ShXOpuTrFuo2e6ewzLHPJFk20YQkkS+Q4r3k=
X-Gm-Gg: ASbGncuZg8gMPouK5W0xzH4x7u+k+amBWUs87cm7bp5HxTp9b/+QQB47ogPHL7JlZRr
	OttWWMH7vtUgpfmzeruWtfK8peXd7G4AiymGSeNXxkXl5a4zlNotjcYh2Ed1Y40UixeWXGPF/2V
	LVYqYdYv+VHcUGTyuM3IAj8hB8NXeC2o2kqaFTUV3yBm5q3jRNf1oQm8fBdfs8MW5eDcps5ezgf
	aLc2T52tNYqNN6SZsl3iOvtbJNUZzVXa9HQwKwEVw9Rt3RW
X-Google-Smtp-Source: AGHT+IEG7d2O5fuiKOqLaxk4wNWtHu8A08plk+DQOGkfs2DJxQxya6tEWqjjc+qZvluiPc70wIKTosdznqW6MDbVNpE=
X-Received: by 2002:a17:907:96a4:b0:b04:25e6:2dc2 with SMTP id
 a640c23a62f3a-b07c254393cmr229565966b.22.1757669062471; Fri, 12 Sep 2025
 02:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912081718.3827390-1-tzungbi@kernel.org> <2033c6cd-4112-4c8a-a9ef-2ab34f3504b8@kernel.org>
In-Reply-To: <2033c6cd-4112-4c8a-a9ef-2ab34f3504b8@kernel.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 12 Sep 2025 11:24:10 +0200
X-Gm-Features: Ac12FXwlBWZ3wqZGCB6PrzXYD4LYlvvCAzsc1bzxtVBUhf_RXrToQWQG2Wcs3jw
Message-ID: <CACMJSeuKH+WKOXLNU92dMssqhK02xG3z=cT0VeXYM+ZGuPCB9g@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] platform/chrome: Fix a possible UAF via revocable
To: Krzysztof Kozlowski <krzk@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Dawid Niedzwiecki <dawidn@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Sept 2025 at 11:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 12/09/2025 10:17, Tzung-Bi Shih wrote:
> > This is a follow-up series of [1].  It tries to fix a possible UAF in the
> > fops of cros_ec_chardev after the underlying protocol device has gone by
> > using revocable.
> >
> > The 1st patch introduces the revocable which is an implementation of ideas
> > from the talk [2].
> >
> > The 2nd and 3rd patches add test cases for revocable in Kunit and selftest.
> >
> > The 4th patch converts existing protocol devices to resource providers
> > of cros_ec_device.
> >
> > The 5th patch converts cros_ec_chardev to a resource consumer of
> > cros_ec_device to fix the UAF.
> >
> > [1] https://lore.kernel.org/chrome-platform/20250721044456.2736300-6-tzungbi@kernel.org/
> > [2] https://lpc.events/event/17/contributions/1627/
> >
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Thanks for the work. Just a note, please start using b4, so above Cc
> will be propagated to all patches. Folks above received only the cover
> letter...
>

Thanks to Krzysztof for making me aware of this. Could you please Cc
my brgl@bgdev.pl address on the next iteration.

I haven't looked into the details yet but the small size of the first
patch strikes me as odd. The similar changes I did for GPIO were quite
big and they were designed just for a single sub-system.

During the talk you reference, after I suggested a library like this,
Greg KH can be heard saying: do this for two big subsystems so that
you're sure it's a generic solution. Here you're only using it in a
single driver which makes me wonder if we can actually use it to
improve bigger offenders, like for example I2C, or even replace the
custom, SRCU-based solution in GPIO we have now. Have you considered
at least doing a PoC in a wider kernel framework?

Just my two cents.

Bartosz
