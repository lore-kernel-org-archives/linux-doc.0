Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187855;
	b=um5WbD6Zv8kphLZatKGsbw6ppEzpueSiLEihkfoIqmJQF+3Oela5+D9VSkW/I3llbe9i
	 iZf9stke1t3+UTKdNPTjVR1krWicKrjH6IiMCuF8L8wcuZBDpT02IA3lpw83S7GbVVwdU
	 GHCKt5cV4TQqPiAGr0BheRJh6PscGA+QehT/SiBvWuppviCgIbutOipy6o4nrPSmI+QRF
	 vLqUM4GcS4O/7nUMSKK34NebGAnzPO0si3VL3y2XJSCfRmDpe5w0yKt2Ikptf+52TftF+
	 /6o1yahui6PRNWKAsPCdO08I8qJL8sIIAWbCpHvgnRfsn/rDc9tEWOMQd0IG6XViHqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qAjYne+BgcE8DA63sQsMZ990H8S9yK78zgr2NZdv76Y=;
	b=3irlLigmFpIN5/97JVVR4kED1KTAc0Wq4rzuaD6ZIOIFGqjrsnxmWdSYVw0v4aiI6OnO
	 ZN+zJqeNCBSZSWPux5LI0uXyYJRIr1E7LwLc1ysNXJlYrxQN/vfEAd4nujly3M23f1RXy
	 UYDWYrpXRKU4R3OWBK7yQ3hxhz2Yn6xe2Gorg4OITTTed1y1GqhV06b/vJYWTlcdsMarP
	 nENjzXox0VQXagizmDOqaq/2oDKYZxv+qVTSpPRMMlIHQ3UfOj5WTwAr1kxV/guv5m4Y8
	 Fnvbop3Xtp9/FBSxKOJP4MuXIpZ2q/SFnBk1h5YS+ITkGySLr8Wa1YZO94B1sir0UfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZsBZbY9r;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A536606A32A
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 15:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A536606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZsBZbY9r
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b0739d31b9so3490c88.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 07:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795187854; x=1795792654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qAjYne+BgcE8DA63sQsMZ990H8S9yK78zgr2NZdv76Y=;
        b=ZsBZbY9rhrhfiMH0sIHuSlkXAHu76ZIvXMLxoLYKzwh8PjT4CLxStoojunbuP0/iA/
         W90zitn5Ubkfby50lAuwhDOazB2L6R/imqoZQrr5T2qH6KWT0/Oi7Sz1JcBbXdE3dDzw
         snDvkyJlfwkEk6pXFI3AHJmDTiQdkJuRleFOmaN5NVQG5880pyvAK9iBugmfOftYOo+v
         rAaNCKf4p5tV+po35L3klIxGqj+ugGAu/Ok0TpBPaFpfLMMtzEpqE3GuXOGoxX3Z2t7c
         lxFQfro0U36zTDNKHVXh5rBMyIfmzQRVpydIrZoC6Q6+KZ0L8XzhdBsO2aJGCJ6u6OzM
         9oDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187854; x=1795792654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAjYne+BgcE8DA63sQsMZ990H8S9yK78zgr2NZdv76Y=;
        b=MraSH2sS6We5pqhEmiGbTmXS8IWpVDrWS6Lcv25gMsfPprpxCGKzGrp93YTuy0U7J3
         C7Sqdw+aaTcT78j2T94auI95TvykPN/qgrckyBJjmNm/HLlpc+VctkxA3kCzxKKrWQ8v
         LTgRPSEUwgtFc5Ez5GZrFk82fzvBK9mgNswrOW7r3bPnqgWITPIyyegLq6c8pjYXccz+
         7T6VJ5kmQ1fPjhYEk0wvFPyx3YnPNz/4WAE+CnVpqJte2JIYng2Os+QfoMo7IaTtByCU
         LLqE+gqPVIbJSlGnhxY4vEC47iE9rJvvZ09pdqb3v1WMAiahy53/566AGHE1jInGx7+L
         /9WA==
X-Forwarded-Encrypted: i=1; AL+hErEnv8tpmQ7iiZx6sN6RAimVC2vXLST3PijOwa5vPVaFjiGR/hh0H2oGIeBB+nIfayMMEtrvaTjVlt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zpMMoCVYFokbhQCdIH6BDu5tCayVKkgTbOlqYh4gF1KSupAa7
	+UovpeXaCxyzoW0RrKA5nFuG9f3pY4hnn7UVtaNn61aTOcL+jlDkiMp1q4LYa8kpsw==
X-Gm-Gg: AYBFou3XAHjcJl8CQGBJIAs2ofCCS9GhDZQ4wwqj1TDsFiFQM1+ivvmtfYzL75FPj4O
	bNEFropyu1BXripBkf0U22juPvynkCoMavuohajoq2QaNdY0mjXieDI+QSXOXsXd/rxBpmwOCCX
	leeC1bOZthXbeCxayYyRl/oft2u4weFf+98BEIc8dW2LjVC1FMJGUIFG2wl7iSiPp8J0rzJfHzz
	9whqhtbVWUPQRSEp/8TRVh+X0v20OnADeh4Z9nUfsUJUmCoxcP0dClDcG15mZAWTMKivHgnssiE
	TU5djVtlbZp8qIv7woEV7jQNj2Nd8AHKp5MhNEZZV3AOitMBoaKmyiaTag2gfibxljs9fL5onwB
	XTOnrlnxjJe+rZfZaAe64LNzVwn1yrf0fnUp9BiIAWtNHtnJIgWK+B+icBnk2BA+spWzRFACVii
	iNS3bSjxMAyUFMNAoeH7N1iDz3Lx/Ek7BI8Gu7IJQlJEeHIj1V/gqlQM7aDVzwbEg04rSbNrZ+q
	VNlDMQARxg0Jv3kQpl3sdHHBG9QKdK67qzd613XoWJHklJkc9URH2NZ4HClcW9Z1cTHtCLTHFT/
	rY5b37EqdTq8VIz7p2KOMVqD9bWgbEwJxkAjoAYriVXDfnpEX64ZZOj2jxIhHchJKLCRhFiXwWm
	Wvez/HZ4cqHpJ
X-Received: by 2002:a05:701b:4516:20b0:1b3:c4ba:8e0b with SMTP id a92af1059eb24-1b557b69270mr1215594c88.2.1795187852837;
        Fri, 20 Nov 2026 07:17:32 -0800 (PST)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm7441365c88.3.2026.11.20.07.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:17:32 -0800 (PST)
Date: Fri, 20 Nov 2026 15:17:23 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Alex Williamson <alex.williamson@nvidia.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Chris Down <chris@chrisdown.name>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v11 09/13] PCI: liveupdate: Adopt ACS controls in
 incoming preserved devices
Message-ID: <awBkg0ODE436CZy0@google.com>
References: <20261118223704.3286085-1-dmatlack@google.com>
 <20261118223704.3286085-10-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118223704.3286085-10-dmatlack@google.com>

On Wed, Nov 18, 2026 at 10:37:00PM +0000, David Matlack wrote:
> Adopt Access Control Services (ACS) controls on all incoming preserved
> devices (endpoints and upstream bridges) during a Live Update.
> 
> Adopting ACS controls avoids changing routing rules while memory
> transactions are in flight from preserved devices. It also keeps IOMMU
> groups from changing during or after Live Update.
> 
> The adopted controls are recorded by the pci_save_state() call in
> pci_bus_add_device(), which runs before drivers bind, so they are
> reapplied by pci_restore_state() if the device is reset. Allocate the
> ACS save buffer for incoming preserved devices even if they match a
> device-specific ACS quirk, since their adopted controls live in the ACS
> capability, and panic if it could not be allocated.
> 
> To simplify ACS adoption, reject preserving any devices that require
> quirks to enable ACS as those quirks would also have to take Live Update
> into account. If such a quirk matches an incoming preserved device
> anyway, e.g. because it was added in the new kernel, log a warning and
> adopt the device's ACS controls regardless, rather than reprogram a
> device in the path of a preserved device's memory transactions.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  drivers/pci/liveupdate.c | 75 ++++++++++++++++++++++++++++++++++++++++
>  drivers/pci/liveupdate.h | 16 +++++++++
>  drivers/pci/pci.c        | 13 +++++--
>  3 files changed, 102 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> index 00d6fa5236e9..b99a88c2c199 100644
> --- a/drivers/pci/liveupdate.c
> +++ b/drivers/pci/liveupdate.c
> @@ -123,6 +123,9 @@
>   *
>   *  * The device cannot be a Virtual Function (VF).
>   *
> + *  * The device cannot require device-specific quirks to enable Access
> + *    Control Services (ACS).
> + * 

[...]

> +#include "liveupdate.h"
>  #include "pci.h"
>  
>  DEFINE_MUTEX(pci_slot_mutex);
> @@ -1071,9 +1073,13 @@ static void pci_allocate_acs_save_buffer(struct pci_dev *dev)
>  	/*
>  	 * Devices that rely on device-specific quirks to enable an ACS
>  	 * equivalent keep that configuration outside of the ACS Control
> -	 * register, so they are configured from scratch on restore.
> +	 * register, so they are configured from scratch on restore. The
> +	 * exception is devices preserved across a Live Update, which always
> +	 * adopt the ACS controls established by the previous kernel and need
> +	 * the buffer to keep them across resets.
>  	 */
> -	if (pci_need_dev_specific_enable_acs(dev))
> +	if (pci_need_dev_specific_enable_acs(dev) &&
> +	    !pci_liveupdate_was_incoming(dev))
>  		return;
>  

The ACS save buffer is forced for incoming devices that match an
enable_acs quirk, but neither existing quirk keeps its controls where
the generic code saves them (Intel PCH Root Ports have no ACS cap, 
SPT/UPT has the Control register at +8, not +6). Is the intent that 
such devices just lose their adopted controls if they ever lose config
state later? (e.g. a Root Port D3 cycle after pci_liveupdate_finish())
If so, maybe worth calling it out in a comment?

Apart from that:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
