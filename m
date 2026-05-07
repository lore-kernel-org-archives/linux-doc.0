Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC493B5837
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 09:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144915; cv=none; b=ltr+clyKroPrVIFTD8rSRk006g8PUdk6/1bjPbrCRZ91T5RSddzI/Egd85qYYg4W5oG9nVB0/l1//cVWe5CNpQVN1OmzNkNHSlXh8hp4Rm4l4nEfgJY39mwpKuhyffSnphnIb7o/g0K/94UNkeeYFCIiCueDCER4QXtz4TzIcI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144915; c=relaxed/simple;
	bh=6KNYU1WpeWbZtLaI95Q3FSHorYk7ZzRQOvKRN7EcI9c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XTP9yOdBDFfuCGqZHWEcox0OJgDS2iBrN6TvbRyrlknn0/eUaHyWFmjihrmpyJOflDzya5WIs3sG00NIitsYBCA075w2QsdKQEx/mqrF4nN7ETV/3gRrkKsyNh0gHDsgLT8P0v6E9SgZVgMMuztO7f9qjODFGAvk05kJQI7uYlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxheRe1i; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxheRe1i"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891b0786beso4120715e9.1
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 02:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778144906; x=1778749706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8AqCHUecRdMHaTSiwSFKRzA+aPKBe0J8V8U1pAN7qQ=;
        b=NxheRe1i9m2sCCP55ucTBUdx1urWhohFrPkwD4vBI2HOdw4eg+P8II9CkHEe5txdp+
         XkWbVrqMHS9rPml5LOR0L3FaQjhmpZEhUeQfEx4NsC3t8B6rGdmoct7VFHNnGwyc3+WP
         Xz6dpU6+9WtBf8Bgr8My5FX4rDZ24MAf7s3xSqFe3Ldy+Ux15aKtB39mxZrKPrblNitE
         trusfVBCNaTesfP2fz48nJ2DxZ76xtU0aQejmDchHmxbdKEqu2W/NuqNsHO15cLPkscf
         J5/YSXNnjqCUBeOjOTXnJGncT3ANWGG5fRBrOOgWpb3jtQ7LnyzyhLFSf3qZVD45eUmf
         119g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144906; x=1778749706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h8AqCHUecRdMHaTSiwSFKRzA+aPKBe0J8V8U1pAN7qQ=;
        b=A3B2Q8+VWwqNikPgALEXofPcMZcNDf2gNYlIgA256r3MOKly2WSu9aButap8TwDjpI
         0JH6G0kNxCNxHNso8BhGNCH6wQza4Awj4VrfXQ090CFV4yjnI69SycAXe6YONvx7rVHM
         vEBHY2teMCOKLTyg5O/ku+anYLBluClKhm2aJRABILYV/SE6gkh4sgIJVONgfZOz7NEG
         EbmyF6YPu76ySPTI1KCgmRwgPN5a8cWrVSYzOtB9uPbir/1nctO0gh1bBYqxUxPlthyc
         FVALfMd1y/3UDyjm5tgYkfT2rTmt0/sU40wnRHGPtJcTwc9HhopgZwo4QYwTBdZ2qyuy
         DYTw==
X-Forwarded-Encrypted: i=1; AFNElJ+Lj1RGZnI8L7yIO5YALNI60vnEdA/w9tLvzXrQhCldEJnP+5oR2Fn/uYaLWQTx/ZOUYBab1hy9gAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzEi/ULoEUUMSOFB8VVON+wDQG8F9Eu5oBpflWXyRya2+8mQta
	bJA8DflhmrSebquLvSINXr3pwsEjxwDG/N0Mhc3YOYlLPiKqZxn2v/+1
X-Gm-Gg: AeBDiev4ux80RH0w+JsmF7tgI+SFXVdHqaukFxx3DqW1iX/FDQO1Oj2T2Wnlimj176f
	wxy3VKFBlNVI2XlUQ8uzniBP7fRoIFS8vpZ8TorrlZxKtvzOKRIB++1quS8nCSC0HiBXaYyJSiS
	z+mU0357oFPV7JAm3qqFeccq/3u1KV8Q/lclbMRK1sCKX//vQVKoB0HvMCBbKjrEz0kAJ0Jet73
	vzRNQonegU438nXPF8o7yKiMD/pdbeFsSDAgRSSAVThTmBeYWUT/Hots4UhJdX7Okb92wqc5kXi
	XN3cNSgjnJX9Pbm22aMILHclb/tI0iZXUOR5DUWr28gUlzK+DzIAHIVpmW22ZdZbRLxPRhPfKSo
	ronLXyL4psu/LtAk5nvSL/K8qkhdiH+zzmC/T1a4dKK95PWAq3QWqvTrohVHUaPl4qAUMFHo4jH
	f3Ew5AEQk9S5sZj+DWZWANH0cXvHIdU937BVEhJvuJEoUnzQ==
X-Received: by 2002:a05:600c:46d2:b0:488:b187:3c with SMTP id 5b1f17b1804b1-48e51f32c65mr113284595e9.14.1778144905786;
        Thu, 07 May 2026 02:08:25 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53895cb5sm102053505e9.1.2026.05.07.02.08.24
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 07 May 2026 02:08:25 -0700 (PDT)
Date: Thu, 7 May 2026 11:08:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Jihong Min <hurryman2212@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: add initial support for AMD PROM21 xHCI
 temperature sensor
Message-ID: <20260507110821.07480da8.michal.pecio@gmail.com>
In-Reply-To: <424c4dc4-1810-4ffb-ae93-7ec9f880ec1e@amd.com>
References: <20260506032939.92351-1-hurryman2212@gmail.com>
	<cover.1778099627.git.hurryman2212@gmail.com>
	<2e2ea249b30168a2eab62fc110c226a511f21bf2.1778099627.git.hurryman2212@gmail.com>
	<20260506233332.664f220c.michal.pecio@gmail.com>
	<424c4dc4-1810-4ffb-ae93-7ec9f880ec1e@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 May 2026 16:36:49 -0500, Mario Limonciello wrote:
> > > The temperature register did not return a valid value while the
> > > xHCI PCI function was suspended in testing. Keep the existing
> > > behavior by default and allow temperature reads to wake the xHCI
> > > PCI device. Add an allow_pm_switch module parameter so users can
> > > disable that behavior; when disabled, reads do not wake the
> > > device and return -EAGAIN if it is suspended.  
> > 
> > Is such behavior useful?
> > 
> > Maybe the driver could just disable runtime PM while it's loaded.  
> 
> I'd encourage what we do in amdgpu for dGPUs. The hwmon files will 
> return an error code (I forget which code) when the device is in
> runtime PM when called.  Don't explicitly wake it otherwise.
> 
> This prevents someone installing a sensor monitoring application and 
> that application "being the only thing" keeping the dGPU awake.  If
> it's awake already for other reasons (like being used) then return
> valid data to the applications

Well, that's not a dGPU but an xHCI controller embedded in the chipset,
which chipset is more or less active all the time (includes bridges to
PCIe ports, some SATA controllers and mabe other things I forgot).
Is the saving from disabling xHCI significant for a desktop system?

Users may be interested in monitoring chipset temperature even while
not actively using USB.

I don't know what are the conditions to put GPUs into runtime suspend,
but a USB HC will be going in and out quite randomly, depending on
connected devices and their workload. You may end up needing to answer
people why their sensor only works when they turn on a webcam :)

Alternatively, would it be possible to bring a suspendend HC into D0,
read the temperature register and then put it back into D3hot without
bothering the USB layer to fully resume and suspend xHCI logic?

Regards,
Michal
