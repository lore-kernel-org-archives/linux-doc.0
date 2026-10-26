Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.250.43.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039729;
	b=nh25WB5axe4WhqEmnmDCx8IBV0f2b7D+xnPZBeBxqKjBPiOCMbnPVfjKZ4eDagW66MsK
	 4YYWl7kt/qFsqhDpCklRqg9s+6allVmnMouTuNSAB8N/XrK9uogwkdBe+Gux34441ksEs
	 huQzdtBXiVWLXbqCYWYZLX0U/OL8zblfy6oW7YPFPfTehfwWNmZdMn+aboTYDdx8saE7G
	 6sB1LvNls8wvU0VZEmoRU8ig0kXhE6i818UW+0JQUKmrTtQKe1wJpuT86DplfMIGdN6fB
	 yKnxjEZFkwXAkHJvTDMgmn9FjbeI5SvGS/cWH+qldtaYm4jYTF2eReeSdi5DoR+byDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039729;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Envelope-From;
	bh=zHu5FnjSzgjYElaRKiWtsPwyU1mAdTABEQB9pNjOcM4=;
	b=1EIzguTicLIcceTTAxqm4uYllY48wFF5aHyOCNb8dnwAoBElyrMVcGjzTXvCC++O9QqR
	 uCi3hBziSP3n80e47g4T/RKdwk8mSxRty1P/tExIjxKPJ3Rg3Pvc7e1SbcnOSVm016CR2
	 FAL/XwV+E2ebglbGlM8K6HPNC+msGHIL1FYuWn/ALwJyO5EAi+3bTn1xCqMvxCWqfW+vR
	 H00Ic9X9ijRwlAgF/9qUMGIdnq0VuJM9fYCw1Frv24aahMSVVysUq7ORavF0xqtG0L6wb
	 OTejUbMQlwnLQG5YPnqshd9V9j9tGvDIKJOF3apvUaBqu+tKOPxFUmAV/c2AlxFe5HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=effective-light.com;
	spf=pass smtp.mailfrom=effective-light.com;
	arc=none smtp.remote-ip=63.250.43.113
Received: from out-2uec-a113.jellyfish.systems (out-2uec-a113.jellyfish.systems [63.250.43.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A9D606A31E
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 18:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A9D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=effective-light.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=effective-light.com
Received: from mail.privateemail.com (unknown [174.89.145.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jD2P01jPvzyNj;
	Mon, 26 Oct 2026 18:35:15 +0000 (UTC)
Date: Mon, 26 Oct 2026 14:35:12 -0400
From: Hamza Mahfooz <someguy@effective-light.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] hwmon: (nct6683) Add fan control support for MSI
 boards with NCT6687D-R
Message-ID: <at-dYL4g1w_qBxe6@hal-station.localdomain>
References: <20261004153250.516730-1-someguy@effective-light.com>
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
In-Reply-To: <20261004153250.516730-1-someguy@effective-light.com>
X-Envelope-From: someguy@effective-light.com

On Sun, Oct 04, 2026 at 11:32:48AM -0400, Hamza Mahfooz wrote:
> Recent MSI boards (customer ID 0x20d) use an NCT6687D-R, whose fan
> control registers differ from the ones used on Mitac boards, the only
> boards for which the driver supports fan control so far. In addition,
> the system fans of these boards are connected to channels 10-15, whose
> duty cycle the driver does not report.
> 
> This series adds fan control support for these boards, based on the
> register map reverse engineered by the LibreHardwareMonitor project [1],
> which uses it on MSI 800-series boards.
> 
> Patch 1 reports the duty cycle of the system fans, and patch 2 adds fan
> control support for the CPU, pump and system fan headers. 
> 
> Tested on an MSI PRO B850-P WIFI (MS-7E56, BIOS 2.A93, NCT6687D EC
> firmware version 0.0 build 04/18/25), on top of kernel v7.3-rc5. Fan
> control is available on pwm1, pwm2 and pwm13 to pwm16 on this board.
> 
> [1] https://github.com/LibreHardwareMonitor/LibreHardwareMonitor/pull/2294
> 
> Hamza Mahfooz (2):
>   hwmon: (nct6683) Report the duty cycle of NCT6687D-R system fans
>   hwmon: (nct6683) Add fan control support for MSI boards with
>     NCT6687D-R
> 
>  Documentation/hwmon/nct6683.rst |  17 +++
>  drivers/hwmon/nct6683.c         | 233 +++++++++++++++++++++++++++++++-
>  2 files changed, 244 insertions(+), 6 deletions(-)
> 
> -- 
> 2.56.0
> 

Ping?
