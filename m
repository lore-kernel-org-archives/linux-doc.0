Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72393E95B2
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286739; cv=none; b=G6jCdEYL6jCKkjpNnIH0Sq4iRrIfZBzb4KcaF8dSv/JcqoQZ05p3ybppW/eypxcJrhoPDbS9Vq/qZ9uFTl28s2GFC7CwVgo8EGam/8rW8mPQ9GqXf6/2PdD/YYAEAHatzCOQvEC3pamYil4aCLuJA+zVJDRUYKnOwHN/D/ZHjj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286739; c=relaxed/simple;
	bh=SVbGfRf42/YpRtOvkubvp4anUHrMvLtMBHhgTtWQnfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBAXP7itAIbdSvTE1s33BABI9tTtIoXWJLs20LR1fBtfoPysDMb3+mCNxoT3Z/9BffyjPXQG0dfPxbwfQL1jYmrlQabnMEKrWhaawslM4Cx6pn+NZSxHlGYli9L5Z7HZ4lBV/FcDLVK5ZGjlJd7uviOr31mKiP79i7gUzwdSBhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSkLvI7b; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSkLvI7b"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso4422408eec.0
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779286731; x=1779891531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vyw5z+cwPwEeTdxGP1e0+U+3uquisZZyqDCM4ankidw=;
        b=DSkLvI7b6i2vq92PSx5mKBVTl8Bw01nseMkFEzZBH0bQG3nBoP/mJ+FmhlUJGQcuGc
         LsjTwrT7XJfof/GCQQ5inuAJ5/XkEvS0aqmr5mf7Cyzy6NV/8BpR5cb5/xvHlIedMG6G
         GkzRPFh93zmlpW/w5bML8E9OPpgU17+HBN0a4otD9x8LMIe/WBJgRLhyCTt65p+YYTsb
         uCQ2bz6bEepWi6iUcdakskDhjCj0OVFtZhOfODcp9I1QObK7GvXN0Vl+czerxIPQoE6w
         xJPqUSX7Su2kFY2/O/Fdqqh32uISEAe9J+fnoJkoxKg7ZvlwemkZJuQ13JmR8d/vjoqC
         7GGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286731; x=1779891531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vyw5z+cwPwEeTdxGP1e0+U+3uquisZZyqDCM4ankidw=;
        b=KsURXFi+TEh4e/WSiibKZcptKgSJQNrH+GsBnPg4VSNv7k6nvEpu1LDoTDo1c9MfT7
         uqLbdRFlTklrJjRjRBfK/iTUDYnq2vyeqt+MtPd8Szajq7ZxfSt/16JJbs2jkSJsoSiH
         Hj1K+T7rraVb72K0QlPRorth4GjRNhfcH8+Ab4XLM9e0p3JSv6wqFr3xTDhh9YpPFz7u
         cBbiQG9tzwWT1a4i/cLyNoB3tglkMbsCw/pkaI2l/huHSWNNsq/iL767uJiWlaMPe9Ks
         +ucEhrmjacYFW9X51Px0R0609Vk4z9xrmkinS8yiI/y+wnApRGLh5saFU3gQdB2UAJ8d
         AjWw==
X-Forwarded-Encrypted: i=1; AFNElJ9jzwEExYpCg+zpixa2Ys3qgw98FoWljhYgXBboEnMW3SmiaHGj5wb6NmdTBZCB06sxQsx4L+0QuXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRWDupvgh5pDHwV9Ak52UzK1BbvjcFdFRuCjxLBAON4yrc87Nx
	0RaNj0R36KJhKQld+EkN2hennzJKfuoFBbW+hg2xw09/2TVxT89ghAHm
X-Gm-Gg: Acq92OEanViAQMhnKRh2UgyClO6RK6JMqKykPSafWAVm+fHRHhPn9t9e8gJl28AKCG8
	RMPBXTNspXzZvEwnvV5nhyBwxpMrQmjhoxH130lhAkgprDooniLJ88gOe/RTr8vRDeBbLEDqvrM
	VzI0U14XNUtxNSqdMdipuOcDhbSAH+ZxpgScFeWCNv0aH2hEwDowOcEk84oDGNmGGB7kLT9nbR2
	C3OQSIP0+Y3R+XR9DvmRYIp4i2hnAMxBRCTPnhpkXyvnAW08JYY2qogT0LKz6ziNvnIY3DlPm44
	PrM+q4fok+dBEWDyDlXX4emH1LhnKxUtoXq1W8PgNQ1yDlOoEP+x5cq8LFZftVnOAUsK8fWwObK
	Zezpunq2YyLHcypc2UTA+HGQFxMqcZPIdWn3naYiKHpBGLsADqgoL5IX0X02r/FkCZUgRw4ZLo8
	w2KYz9xd5XakxHFvTL68b9OoKY5YRZi6zpYthQ
X-Received: by 2002:a05:7300:a94b:b0:2ed:a64:a457 with SMTP id 5a478bee46e88-303986552f6mr11202553eec.20.1779286731120;
        Wed, 20 May 2026 07:18:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm21432427eec.15.2026.05.20.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:18:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 May 2026 07:18:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jihong Min <hurryman2212@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mario Limonciello <superm1@kernel.org>,
	Yaroslav Isakov <yaroslav.isakov@gmail.com>,
	linux-usb@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
Message-ID: <06236462-6c4f-413d-8324-537fb8f743d9@roeck-us.net>
References: <20260519000732.2334711-1-hurryman2212@gmail.com>
 <20260519000732.2334711-2-hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519000732.2334711-2-hurryman2212@gmail.com>

On Tue, May 19, 2026 at 09:07:31AM +0900, Jihong Min wrote:
> AMD Promontory 21 (PROM21) xHCI PCI functions use the common xhci-pci
> core for USB operation, but also expose controller-specific sensor data.
> Add a small PROM21 PCI glue driver for AMD 1022:43fc and 1022:43fd
> controllers.
> 
> The glue delegates USB host operation to the common xhci-pci core and
> publishes a "hwmon" auxiliary device with parent-provided MMIO data.
> Auxiliary device creation failure is logged but does not fail the xHCI
> probe.
> 
> Make the PROM21 glue a hidden Kconfig tristate driven by the user-visible
> SENSORS_PROM21_XHCI option. If sensor support is disabled, generic
> xhci-pci binds PROM21 controllers normally. If sensor support is enabled,
> the glue follows USB_XHCI_PCI.
> 
> This keeps the auxiliary device available for a modular sensor driver while
> avoiding a built-in xhci-pci core handing PROM21 controllers to a glue
> driver that is only available as a module during initramfs.
> 
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Jihong Min <hurryman2212@gmail.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Tested-by: Yaroslav Isakov <yaroslav.isakov@gmail.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

The two patches should be applied together. For now I will assume that
they will both be applied through a usb tree since this patch touches
common usb code.

Thanks,
Guenter
