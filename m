Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7095415B8
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 02:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IiygKQoC"
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72DF719E;
	Sun, 22 Oct 2023 19:27:15 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2086A60A;
	Mon, 23 Oct 2023 02:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2086A60A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1698028035; bh=OUdMgOE8lLM8fr3KPSltNii1Sk8sBVdYUxhbf8Cjlv0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IiygKQoC/9AFrvAboKSaRrVCUJWs9GlXseNm1SStuxLU8YOaC/Kl88DrsuXUUV+p7
	 DiGdMAF7Mqk4ZX9xKdH8UpimjbY14Azy93CAFBabJHJKRGw0A7QF6DIWUUk+tSa8P4
	 KwWWlzewzlwvMOi/MKq9sTYvDzS1kmV0kY7Gogalz8Zy4pCvnLvbnxNw1HvuII+FIw
	 78bZlLeerANO16MOKOXbFr81tpufb+rhwg4XJ8YLoQxHcmDDlukg5S+LZ6qg0zoGbU
	 3RiWUbkkP97vfN9GWdW8I23TI/DCVFGSJDWfQhes66soak+w88g4v7EHsKscd4wuAo
	 tI1TsfZBDwDmw==
From: Jonathan Corbet <corbet@lwn.net>
To: Min-Hua Chen <minhuadotchen@gmail.com>, Hu Haowen <src.res.211@gmail.com>
Cc: Min-Hua Chen <minhuadotchen@gmail.com>, kernel test robot
 <lkp@intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: sparse: add SPDX-License-Identifier
In-Reply-To: <20231011233757.181652-1-minhuadotchen@gmail.com>
References: <20231011233757.181652-1-minhuadotchen@gmail.com>
Date: Sun, 22 Oct 2023 20:27:14 -0600
Message-ID: <878r7ukr99.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Min-Hua Chen <minhuadotchen@gmail.com> writes:

> Add SPDX-License-Identifier to fix the checkpatch warning:
>
> WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
> \#26: FILE: Documentation/translations/zh_TW/dev-tools/index.rst:1:
> +.. include:: ../disclaimer-zh_TW.rst
>
> Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310110859.tumJoXFl-lkp@intel.com/
> ---
>  Documentation/translations/zh_TW/dev-tools/index.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/translations/zh_TW/dev-tools/index.rst b/Documentation/translations/zh_TW/dev-tools/index.rst
> index 8f101db5a07f..e2e18a72ef94 100644
> --- a/Documentation/translations/zh_TW/dev-tools/index.rst
> +++ b/Documentation/translations/zh_TW/dev-tools/index.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
>  .. include:: ../disclaimer-zh_TW.rst

Applied, thanks.

jon
