Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6152BE03E
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 03:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755054841; cv=none; b=Dt4d+fZ3zOoUzJJPAp7cI50juSUSpeypxLZ2XkoY/e1KO+9UXxAoSMnIpsQ7BWu6cyM51a2a8MdWviUQKuQBpvy3kJd1t7kooOv5uOR9obvzHrn2KJ0Sx6mR9fU61bUxakwv51TUYcISWH8fb1Ck+WCvynRkoZLQaFa14DXkyng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755054841; c=relaxed/simple;
	bh=h50OZ3ElDR8hJ0Wia1FAt0RF8qiSst6JUSMAgjs5sPo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NsFYMDj0emLWSkPHfyhEUteRQwQJMsL+2P9ts/FeiODh1Di4UtC6AJ9eaK0/lxXk8H9p+DcAxvR19gUsC8WkuNWCua39bnqDRBxmBwvPTao4bVQBoOLVV0dy2QYy3O+4D9Z4hM6ZMr8gl8fQTu0+PFcpRW5DG9ULAW7A8ywuDQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+D0p0Ow; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+D0p0Ow"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBDDC4CEF0;
	Wed, 13 Aug 2025 03:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755054840;
	bh=h50OZ3ElDR8hJ0Wia1FAt0RF8qiSst6JUSMAgjs5sPo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=F+D0p0OwjAJOAupQz4nVnze+ZMc6ivvayRId2ZRnRkk7bahOvnliCdN88yXz8UTgC
	 GMI4kBKZBHZbkcUl8pOHuLcRCzjx+lrdNBOZu3C+KupMY8bZ4eM5EjztZfIyppDUy2
	 wttumQ/ePaooz4M2O51enfXasZGSE6ITOt0LxOjpbbBBgur9XdmrLs2klsbhkP5A/6
	 YLgJ3z9U5EG9yh9xTcmGjIuVfuuPEUKdiU1hi9zGLfCcQN3L3+HvDRQ2/JOOkGxO6S
	 w/BABzcA9eNdZG/rQ2hfSXtk8NvK8BmPkC9VBBfBklsmoSUOTYyVO3qcCM7E66PIT7
	 II37IRDqah/Nw==
Message-ID: <996b47f2-6c0f-4204-b994-d37ef43da5a6@kernel.org>
Date: Wed, 13 Aug 2025 11:13:57 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: [PATCH v2 1/9] docs: f2fs: fixed spelling mistakes in
 documentation
To: Soham Metha <sohammetha01@gmail.com>, linux-doc@vger.kernel.org
References: <20250812201523.69221-1-sohammetha01@gmail.com>
 <20250812201523.69221-2-sohammetha01@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250812201523.69221-2-sohammetha01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/13/25 04:15, Soham Metha wrote:
> found/fixed the following typos
> 
> - deivces -> devices
> - substracting -> subtracting
> 
> in `Documentation/ABI/testing/sysfs-fs-f2fs`
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
