Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D0F62F
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 01:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIlRMdV4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B22C433C7;
	Thu, 12 Oct 2023 01:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697073035;
	bh=gDcWvd8c83WQi7qJGHm8pS0oFCedA+sEFdt+1He8YaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lIlRMdV4Ocyyam4qLfeDwCPtPPdzUdXgtqFQSwMMoEgqAcw6BMdxgC4TujVYPtS48
	 e/k+5OdxKzd243XfclE9qcObso99i+3k0kUzfCXH2XmyKUt/7RUk8scQUjfZKGpBw4
	 p3sIASpbPm8QNgjAftxjMEqz0X8veDr2e4iAm7/qx2sQ5Eq7Bv2pqZALx7huDf6zqE
	 vzN+OJXnLNoJcyVXjbt3RVomwvLf3dMQn2PB9rdzHrq2bUM1IUnmH4fuBfqSsUBjLA
	 u6i695+CrJ3VigSi9E4sdvKuZ/0iTuCQpFCzRgdcBjl6D53WZc6sNoLiMjI/cgryRv
	 KLB6M1ehLULqg==
Message-ID: <1a4d325b-d3a8-121b-1118-934fafcc8ebe@kernel.org>
Date: Thu, 12 Oct 2023 09:10:31 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] erofs: fix inode metadata space layout description in
 documentation
Content-Language: en-US
To: Gao Xiang <hsiangkao@linux.alibaba.com>,
 Tiwei Bie <tiwei.btw@antgroup.com>, linux-erofs@lists.ozlabs.org,
 xiang@kernel.org
Cc: linux-doc@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, ayushranjan@google.com,
 Yue Hu <huyue2@coolpad.com>
References: <20231010113915.436591-1-tiwei.btw@antgroup.com>
 <9a6ccef5-3a35-ae0d-2a9c-1703c5038c81@linux.alibaba.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <9a6ccef5-3a35-ae0d-2a9c-1703c5038c81@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/10/10 21:06, Gao Xiang wrote:
>> Signed-off-by: Tiwei Bie <tiwei.btw@antgroup.com>
> 
> Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Looks fine to me for the version in dev-test branch.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
