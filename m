Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="siMlOYcP"
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B508B113;
	Mon, 20 Nov 2023 06:01:33 -0800 (PST)
Received: from localhost (unknown [98.53.138.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4CA05537;
	Mon, 20 Nov 2023 14:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4CA05537
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1700488892; bh=ZXzp3xho3YcWXFR16yxCrIjW/+bZNdVtNTHyia9WmDQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=siMlOYcP0KUqEDXAbCMHBgj3iC+VtsWd0csrPEHuV6DQCsm46yeBpDmoaDw+ztZUY
	 +dZqwLN8qDb/GuFR4QqZgOQ9Eo4e+A8ycqO7826NrPe6bLMSjKOutLTRNC5ZZzC8UP
	 d/dAdGxl/acgIgh+Yecn9kNgVs3RQ0BdfD3b1htVTKtqUYhijdVVsfC25fBnBK9J8g
	 VFV9o9lxYb6dHyAvra+Tuw3M74i8cS3OKxi7vMhV0An7OCdYJhh//wCpy1qBZE6mwc
	 xLa9eQtGrtglXaD8fgIqKFSCUcAXD76S9NUg6/i0omnoDAXhGth3A2z+q7yji/NS5E
	 0T1dpQypu4vow==
From: Jonathan Corbet <corbet@lwn.net>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: jens.wiklander@linaro.org, vegard.nossum@oracle.com,
 Rijo-john.Thomas@amd.com, balint.dobszay@arm.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 op-tee@lists.trustedfirmware.org
Subject: Re: [PATCH v2] Documentation: Destage TEE subsystem documentation
In-Reply-To: <CAFA6WYNW_cAFVMTpqPQjwBASKDp_b=CpccCzx23jHn_+qoJrDQ@mail.gmail.com>
References: <20231103061715.196294-1-sumit.garg@linaro.org>
 <CAFA6WYNW_cAFVMTpqPQjwBASKDp_b=CpccCzx23jHn_+qoJrDQ@mail.gmail.com>
Date: Mon, 20 Nov 2023 07:01:22 -0700
Message-ID: <87y1es5xsd.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sumit Garg <sumit.garg@linaro.org> writes:

> Hi Jonathan,
>
> If you are fine with this destaging TEE documentation patch then will
> you be picking up this patch? Or would you like Jens to pick it up
> with your Ack?

I'm happy to pick it up.

Thanks,

jon
