Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118FF3002AB
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 23:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779145600; cv=none; b=BlYF/8hd04Mjcrkj3ke4arJ3R4LWXDvvC+MGuvWLMGsx6ky2VMPxz7Wh8vn98JukNAVHcUOlsy91mTbkEZ7tpXNluGk/F8QWac0yt3K7tbnkNjO1NrAs6k3/4BWghNK3rWH936/YipaCxCU+2zpyIRNx0nCHw+ncQtbA5Zsi8p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779145600; c=relaxed/simple;
	bh=tdQX6z5Ow34bb/pGtk3dNyrAbcLCh7UCBhe9r1uuApA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JbA1XwveObtAIGF3UUtRbsxv4/eikj+CIFzDo3RLT62VqgIP50NyY5wNZO1wRsVWkZn9Cn9tfREhCUAuw/vEbBByG/bzpMVjAnMQbJAumwToFkZzqmO8DfU8cWGVdRMQV5nxrnltLV2xLHsmrXQsT8r9gUfVvBAhO6NnfzFzClE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKifQGEz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKifQGEz"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bc763e2ba8so12521765ad.3
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 16:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779145598; x=1779750398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6fRPsUXaMKX0qPKfz3OqQyhzwCYHmD71RB3fhnMJPw=;
        b=iKifQGEzAh3nSIZfpJZ9YmMOaA3tTspIJSBXVF+njJnVFVRWhMr60osRzOcmOzsKRX
         YrGDT1oBgngfvbxZW/hzH6hciFB9fdnt4qrI18QoiRjMG7ybEfkCnD+4hvYqTZzhgQyc
         HY1KpuxlP1Ql7R7Jm+eHeVN9Rj4CHp7JTNTqapF1TLxPuF/vokhvpCnrCujUlIHNNUK0
         FO6byZ4mQg+RBG8hEiFzs5o5LAnIiBvAgVoWjtCusn2O0n/OX+RGKGvJh6uznc45IezW
         3vI3xm5nYYRaDpNWpariflH0kh6b4/zXJNo7FWWFvPY6IL27dfbkncRf+YIwT2VgCx5F
         mHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779145598; x=1779750398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6fRPsUXaMKX0qPKfz3OqQyhzwCYHmD71RB3fhnMJPw=;
        b=LZIShuz41bprVWgmThWnzuMfYSkX8htVsGi4tVR5BAzNAycbL5EnXQ1l0h6fNfsH3u
         TPSTvagOa6E6CVjOK+sL5qXNoaK6yp/l/kdrWWMqHzrlIUcWF6ClRniz8Bz9vaRtoHWo
         AZBTplH4yahciJrorojM5R+bH7QwRLhUWgX3GDkZ+fE5VH8oJqktmmFNA5PxuCCHY+WG
         Svew2H6wkuDgNyM3rVbrtU7qWsVndumPtqAi/AIL3kVp7WMiNfYphWOiIrucShqwrkN4
         jWROTf7uBqERKDfbos6VFECDNAZHKxJcRXqxc9UwFAcJ8oFIhLQ4TSSJ0E+ERHNtGLAA
         B0GQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nRUWB0SkYOP2XZXAJwQ4hiCOHhEtLpk0tba3vUsIt/HeEwnLLpwHapLKu9ABT97NKh0MP9gAEZ64=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQqhAqkh5S1q4KSRmnC9SwILK7A6SeTK1JIjpPzJahag1CDrC4
	57TPT2l+3hF7rh37s/wC0qMJySA51B01vaKqlEuHb18CaLmarQGyIIGUDaWrXZYekUA=
X-Gm-Gg: Acq92OHFp2+AQ3VY+Od2+8NkbTFdLGf/pS/HHMxHFy8YYkUopJP+kBAlZmIJx+eecIr
	oQ8GP4sRX1m04KDMrtYefNLo/4jjCaVRC9XFq4Y/1cSMhRqWwAMJEDFhAUWT10lB6qPFVM5Gmn7
	cu4OstslFTBOkjsKnQkiRUL9WMgB8ZZUUVKPH2Po3ApqhiNTo+0y4de44IHAXBaqAXNHDzJ4QBx
	gGR+5IuC9jgLzhYxX+Ozkgu2OeZw2rjfZgBHKsih2cMOUmmG06OOugHQRqTezVjd8Rp9TM33mtG
	oigUTbjg/0CaiFOCcxIq0ZByy2ffyK5bQXdZZWsfxi9oAFeC1ajiHCaD57truSu3TzlCPXh9jSS
	K4y7BnQxCm+Mug9vGh9UdtfAMMzqZnXFiTJnoksF5TmC7PGQsLKDsgzKOmz2wRZZHPqZMfi7L2R
	3PDA+DL/EMiBP87d8wffuLktvrAhbUy/4=
X-Received: by 2002:a17:903:3c43:b0:2bd:e43c:12d0 with SMTP id d9443c01a7336-2bde43c14b7mr63463745ad.28.1779145598364;
        Mon, 18 May 2026 16:06:38 -0700 (PDT)
Received: from [192.168.89.2] ([119.214.48.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb35sm159558035ad.12.2026.05.18.16.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 16:06:37 -0700 (PDT)
Message-ID: <7ff352be-05d2-4c21-931e-18238172e4d7@gmail.com>
Date: Tue, 19 May 2026 08:06:34 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Yaroslav Isakov <yaroslav.isakov@gmail.com>
References: <20260517130407.795157-1-hurryman2212@gmail.com>
 <20260517130407.795157-2-hurryman2212@gmail.com>
 <20260517232147.34931718.michal.pecio@gmail.com>
 <144ec61c-4cc1-4986-a16c-7c1b99f3a72e@gmail.com>
 <20260518233711.4c99cc72.michal.pecio@gmail.com>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <20260518233711.4c99cc72.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/19/26 06:37, Michal Pecio wrote:
> That's true.
> Making this possible is the whole purpose of "if IS_ENABLED" here:

I re-checked the Kconfig cases, and I think you are right here.

The two cases I was trying to avoid are:

  1. the sensor driver is built as a module, or loads only after the
     initramfs stage, but the PROM21 controller has already been bound by
     the generic xhci-pci driver, so no auxiliary device exists for the
     sensor driver to bind to;

  2. the built-in generic xhci-pci driver rejects the PROM21 controller, but
     xhci-pci-prom21 is only available as a module and is not present during
     initramfs, leaving USB behind that controller unavailable at that
stage.

Looking at your proposed Kconfig shape again, it handles both cases.

If SENSORS_PROM21_XHCI=n, then no sensor support is requested and
USB_XHCI_PCI_PROM21 can stay disabled. In that case generic xhci-pci binds
the controller, which is fine because there is no sensor driver that
needs an
auxiliary device.

If SENSORS_PROM21_XHCI=m or y and USB_XHCI_PCI=y, then
USB_XHCI_PCI_PROM21 follows USB_XHCI_PCI and becomes y. That means the
PROM21
glue is available during early boot, creates the auxiliary device, and the
hwmon driver can still bind later if it is built as a module.

If USB_XHCI_PCI=m, then xhci-pci itself is modular. In that case needing the
PROM21 glue module in initramfs is not a PROM21-specific built-in/module
split
problem; it is the normal requirement for a modular xHCI PCI setup.

So I agree that tying the hidden glue option to whether
SENSORS_PROM21_XHCI is enabled is reasonable.

> Currently, you have a weird situation where xhci-pci-prom21 always
> binds on x86 and xhci-pci on other platforms (with the unofficial PCIe
> card you mentioned), plus the sensor cannot work on other platforms.

Agreed. I also agree that the X86 dependency is only a heuristic and is
not a
good restriction for a PCI ID based driver. PROM21 is mainly used on AMD x86
desktop platforms today, but the unofficial PCIe card example shows that the
device can exist outside the normal AMD x86 chipset topology.

I do not know whether other PROM21-related functionality is supported on
non-x86 platforms, but this driver does not need to prevent the xHCI
temperature sensor path from being built there.

> One could further argue that neither should it care whether some hwmon
> driver exists at all, or which kernel releases it exists in :)

Right. I think the cleanest result is:

  - generic xhci-pci handles PROM21 when no sensor support is requested;
  - xhci-pci-prom21 handles PROM21 only when the sensor path is enabled;
  - the hwmon driver remains the user-visible option.

Unless Guenter or the USB maintainers object, I plan to change the next
revision in that direction and test the Kconfig combinations locally.


Sincerely,
Jihong Min
