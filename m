Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137F35671
	for <linux-doc@vger.kernel.org>; Wed, 27 Dec 2023 07:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QStXlUhH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=mNNeHBn948s+KJg3mQRvMd6y6Df4JlXfqywooWkcwow=; b=QStXlUhHxZE3mQPS8vEp5XYIHm
	OEdqPC7ZYzZPfEsuRn+qRejKnv5CngybaHn72BgolNckOgdKdW8uea20/QeY0LimuSDB1GM1fB5bB
	93BK1tfjy63XNPlG6e8T5A2yVDlOzsv8J0L8oA4xVpEhkUlcnyiospHRvgLa6hPaIM8gwN6cZDWDx
	Ul6ATr9/cccuHVKriXd8LPRdy65fogndLBEy0nU4vsOCnOuQfkcoFMfwOHtnKGksmhpGOmqr7mxn3
	d0qv8AJfJYEDSJmXSpqi2wvKApLuEn4IJn6aiagTz7KcFwq/buEd8Z7rhY5TaI0DndH1T71vi5I3d
	XDPnKd3g==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rIOlD-00EBHE-1S;
	Wed, 27 Dec 2023 07:55:27 +0000
Message-ID: <06a5efb9-df6f-4488-9ff9-ccee296d0351@infradead.org>
Date: Tue, 26 Dec 2023 23:55:26 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Vegard Nossum
 <vegard.nossum@oracle.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@protonmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: docs: automarkup.py
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Can anyone explain this?  maybe even suggest a fix for it?

This has been around for a few weeks AFAIK. I haven't see a patch for it,
but I could have missed it.

(since 17e02586ed185 in August/2023; oh, that just fixed the move
of files to the Documentation/arch/ subdir, so maybe even longer)


In file Documentation/ABI/testing/sysfs-bus-papr-pmem:

		response to H_SCM_HEALTH hcall. The details of the bit
		flags returned in response to this hcall is available
		at 'Documentation/arch/powerpc/papr_hcalls.rst'. Below are
		the flags reported in this sysfs file:

kernel-doc reports:

linux-next-20231222/Documentation/ABI/testing/sysfs-bus-papr-pmem:2: WARNING: unknown document: '/powerpc/papr_hcalls'

and the output file Documentation/output/admin-guide/abi-testing.html says:

response to H_SCM_HEALTH hcall. The details of the bit
flags returned in response to this hcall is available
at '<span class="xref std std-doc">/powerpc/papr_hcalls</span>' . Below are
the flags reported in this sysfs file:</p>


so the leading "Documentation/arch" is being removed from the filename
AFAICT.

I tried changing the quoted filename from single quotes to double back quotes
`` and I tried it without any quotes, all with the same results.

-- 
#Randy
