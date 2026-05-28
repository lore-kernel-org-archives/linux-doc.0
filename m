Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BAE275B1A
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 13:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976412; cv=none; b=mikJWppu/FrxCpdRFYA1ZLDO+yqc5NgOGfBiIH9bc0RcJKGx8i7o2HW+VMNtarmVwkaqXlbbQdz4U5NHWLsyGvru2ULW4YB4+vx1fgvkI023hgdFoGiJ/InUoqfSkogOpk/lQhoD5en4DTUIJjSGpRYEubRdZVWg60mALJJ9yws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976412; c=relaxed/simple;
	bh=N2/FfEmSB/DXKPxUOJcsHfQHJhIJZHJZbXhSw8EiQBE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I/ojfr+K1E9tj14pXS0wJS+2G8WjS9+vI1GqFLa2vuwLVOR+9BW6Xd3p+anrLCitpylKj/2uoti03ZzQpO0t5oyQNTuAUYMjcbOmsaJTE74ludelSZtJPV2wUJ28UeEfU9rVQlIhO80jHTWbJZnyM1Jy5o+BXeBHLjYQG7/uQPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ew4jxaG6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ew4jxaG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7524C1F000E9;
	Thu, 28 May 2026 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779976411;
	bh=sy9Ib1N/ndkD0KL+Q8VtgPA5qcxytBx25LWx2GOl+Jw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ew4jxaG6LUmodTNOR2WkX/Rf5pNz6F0MVEau9DR5Q9tLUGtfhFQMfH5qtLZP+aozF
	 rPscTvY0WOkwiWHYfXC5g71Ls+tCL2Xc6kMwsWZtIlqYEdlVCYSNnJN6nLbt0SpCX7
	 FPBcq2ZVZJqgG5LWdD/vhFAg2/apoQ9XFekV43ZOiDMdhNSqofNVLxkAdpXZM3TYPj
	 2AwEGQhXrEy0s97Sor0TmwkL5zmkva9TBEoi97ckP2zsLgBJ+wSxct6PvYdALMw2lV
	 R39c3FCI99QHJIyGxJMb8AQC/U/qhWusTl4B1A9bEFYV+xQuAZJtTFpoZnNFwlZuUM
	 Qaus5fPPz5GYQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,  Jonathan Corbet <corbet@lwn.net>,  Shuah
 Khan <skhan@linuxfoundation.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  linux-mtd@lists.infradead.org,  Miquel
 Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH -next] mtd: spi-nor: testing locking, fix new doc build
 warnings
In-Reply-To: <20260526172341.773398-1-rdunlap@infradead.org> (Randy Dunlap's
	message of "Tue, 26 May 2026 10:23:41 -0700")
References: <20260526172341.773398-1-rdunlap@infradead.org>
Date: Thu, 28 May 2026 15:53:27 +0200
Message-ID: <2vxz4ijr4p48.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 26 2026, Randy Dunlap wrote:

> Add a blank line to prevent documentation build warnings:
>
> Documentation/driver-api/mtd/spi-nor.rst:215: ERROR: Unexpected indentation. [docutils]
> Documentation/driver-api/mtd/spi-nor.rst:216: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> # for spi-nor/next

Folded into "mtd: spi-nor: Add steps for testing locking support".
Thanks!

-- 
Regards,
Pratyush Yadav
