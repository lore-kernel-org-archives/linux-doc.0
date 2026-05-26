Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5042C326F;
	Tue, 26 May 2026 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791524; cv=none; b=LafHW5/uA6chLFeYeq4e0DOrB3IA4MjBbMFmr6dnHWXgkkWpRoIVWJgA/+hqnImA9SlkLeNqG+sr9zzdNm7NKCcpwLLCCcx9KDbq5reo2Q5FL0Fb/MJ+WjFTS0UDfGtxPkRNr5jnxZ75v64dtTJOglddJbMQMaJhPvK6cUeRNXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791524; c=relaxed/simple;
	bh=kHxjPZqCRWn5hUuh6pI7T3Lims9o5SBskDJ03Q0oHw4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rnpeaM2rqmOE99B5aMpOUQT1/d9eEmZr51XEQ8jDJIDVhaevKvVPFkgb/9qy+81AtT4gjrNqkSj56cTE+LmrUFRxPGjUPjc1pHAPke+Gy7thwULz8/OJs9ZrVYkSkUuZWwehLGXAx5WwHHf8/BqAKqZ397TVWpHUd1/OLyrsWSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyN08167; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyN08167"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44551F000E9;
	Tue, 26 May 2026 10:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791523;
	bh=Xi35KhtFKZU3jjrnJmZS3TFAyAUXL58eOylSXncyoSw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nyN08167ur+qEBWBettVH20Z8aVLFn/4IaVu0rWywoMYRtxwu6q3wTKGENwaqA3Xu
	 Sfx1KWKUWXSkkS57VM2hPZAtQ5LdmHlB94s+u5tfkREJTW4e3cf05PKytkBK+Bhagt
	 V3DMOdmKc3QFuM7F2h9+R1mGjh2FuSneJafghXT4eMiTSEJWTsmemhZKVAT+wJW2em
	 SCfJkrWhtspM3C7lxx+FQmcY6wacKXb85cRzP79RogMcwnkbQPxdJgM+TFu8BIG17w
	 RC1bK6NfOWKQYyMPN3CMPgvfq/iFQGNazEginyCA9Dg4sh3su8ZnRIjdA3vJOk855x
	 gqTsYnybnrJmQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Shuah Khan <skhan@linuxfoundation.org>,  Sean
 Anderson <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 03/28] mtd: spi-nor: Make sure the QE bit is kept
 enabled if useful
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-3-93453e1a9597@bootlin.com>
	(Miquel Raynal's message of "Thu, 07 May 2026 18:46:44 +0200")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-3-93453e1a9597@bootlin.com>
Date: Tue, 26 May 2026 12:31:58 +0200
Message-ID: <2vxzcxyi5un5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 07 2026, Miquel Raynal wrote:

> Not all chips implement the 4BAIT table which typically indicates the
> program capability, while many of them do implement the relevant SFDP
> parts indicating the read capabilities. In such a situation, programs
> can happen in single mode (1-1-1) and reads in quad mode (1-1-4 or
> 1-4-4). For the reads to work in such condition, the QE bit must be set.
> In case we later use the spi_nor_write_16bit_sr_and_check() helper with
> a chip with such configuration, the QE bit would get incorrectly
> cleared.
>
> Make sure this doesn't happen by keeping the QE bit under a simpler
> condition:
> - the quad enable hook is there (no change)
> - and at least one of the two protocols is based on quad I/O cycles
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav
