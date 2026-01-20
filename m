Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC5D4534AA;
	Tue, 20 Jan 2026 15:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924161; cv=none; b=IG6Z7tYAO8mO1Nfc/rO/AavfESibSghIN3OcnZIZn8ARDJvj8UOuLYrhsTteFW9pjRwfIAwYiBX3eCvfIWS2SrLDF7VafAK/uBjO8aGGakF7muD/nSNzHQmf8BiH68sB4TPwT42OSJxgcYjAikxApMZ/wvKZufvJTTs+40pT//c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924161; c=relaxed/simple;
	bh=Y/AbB7KgatkBwFOqIeCh37bW6yqZKTt6YIephjTthpE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UMdGo6044i4XF0mzPXJsFdSxy2ShdMNVuSGv8aPStVOxkWoO0cem/55SB/XdY+XIRvxieWxYdSZdm3fKYqkQ7b5itS4N/7lTc3Ih/Ref8MKHbWigVDPQri/shv/FO6Ow2DagrdH0h5eUtndLk+84HxvXDt9o+aFSoRkPS09xgBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXYUZUgh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXYUZUgh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 645B5C19422;
	Tue, 20 Jan 2026 15:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768924161;
	bh=Y/AbB7KgatkBwFOqIeCh37bW6yqZKTt6YIephjTthpE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZXYUZUghgW6RMboSc06ViBc7jvzZ9CGg4hucUHqCbYExeJE0/Hvu3Tk/xY3EewL8h
	 75PVDNC07Yw5qzGqyTG0NRtfrBvsWL7L7lugWh1Ewg+Rz7ep8WZG+qHc55M+edrcM2
	 5KZd1kW90br4dzAtum9kF3SgS4tDj8zqGQkmhDix3v37vHRymhdgIY8ZI3lJlxxYER
	 HskWglueLRn36V8/lAsy2MJhJxi+WrU8Omo5KHKgXWjfP/a6LxY4Y0CZOSoe2hVgia
	 NIaj3FaQEv8+Z/tZD0P/bLVFMn1AbdKmvvPjukxiJnE4LhckWdiaSc9TXVn0Ng2vU5
	 PWDIltP8LEeqw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,  Alexander Graf
 <graf@amazon.com>,  Jason Miu <jasonmiu@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  kexec@lists.infradead.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH 2/6] kho/abi: memfd: make generated documentation more
 coherent
In-Reply-To: <20260105165839.285270-3-rppt@kernel.org> (Mike Rapoport's
	message of "Mon, 5 Jan 2026 18:58:35 +0200")
References: <20260105165839.285270-1-rppt@kernel.org>
	<20260105165839.285270-3-rppt@kernel.org>
Date: Tue, 20 Jan 2026 15:49:18 +0000
Message-ID: <2vxzecnke135.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jan 05 2026, Mike Rapoport wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> memfd preservation ABI description starts with "This header defines"
> which is fine in the header but reads weird in the generated html
> documentation.
>
> Update it to make the generated documentation coherent.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
