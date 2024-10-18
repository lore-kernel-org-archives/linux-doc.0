Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45621188739
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 07:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236747; cv=none; b=uQBffuaMV91kGfenuWRydI/vwSS4HMNvuLWtqaBe9ud9pigXguXfSp18kxdAtVHOMn09EvHioFOlySBXFobNSFweQdqAisy3y3tk1i//Ay7JGtJayenl04L7lkeKRWn5E3i+cqXIqkAaqkS/E8bsKC0+En5ONptgmTmpeQ1SP2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236747; c=relaxed/simple;
	bh=M68/wOtUzRrTX7Ot7TJfUis96lSt/morTP8q52oi7Ow=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ztf6jlRiyvuWfTvb4URKw/FOM/K0g5wy2AeoYaktGH496dyAT9rqrToYmkxcaOHduI+RH+rl2kelxhQiKdkTZDm7AqO9JTF+uqnTJw4IqpkomHmoAlUJTSf/KMGyfodMJpR5eEkUHiFWV2euU3p8oiWUssFSN0Ku+S97T4oYbBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h9j9n4aY; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h9j9n4aY"
Message-ID: <dbabf6eb-a1bf-401f-9159-605bc74e182c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729236744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZ3gQtnV9yAQNPhiXYvp01FPx2HBlgBg6+BBbfvcOoE=;
	b=h9j9n4aY3fKXal8H9mdXq4piDA3rGf2Vn1GQQbdNodJuiOFP2Jg8w2u+YeEy0ByHBSRBwA
	eLfmfvdPjjpmCfrIfdSZf5EJM7EPveu66Bdy35IY5yJH8GSZqQEnY3HecYXAXfoQ2UzrCq
	KcyBHz4KjGyTk9PBkmi8h6H84EX6C/s=
Date: Fri, 18 Oct 2024 15:32:15 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] docs/zh_CN: update the translation of
 process/submitting-patches.rst
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: hust-os-kernel-patches@googlegroups.com,
 Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241018015452.3787741-1-dzm91@hust.edu.cn>
 <aac937f3-f147-49b8-8408-9f8f4d00735e@linux.dev>
Content-Language: en-US
In-Reply-To: <aac937f3-f147-49b8-8408-9f8f4d00735e@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2024/10/18 15:12, Yanteng Si 写道:
>
>
>
> 在 2024/10/18 09:54, Dongliang Mu 写道:
>> Update to commit eb5ed2fae197 ("docs: submitting-patches: Advertise b4")
>>
>> scripts/checktransupdate.py reports:
>>
>> Documentation/translations/zh_CN/process/submitting-patches.rst
>> commit eb5ed2fae197 ("docs: submitting-patches: Advertise b4")
>> commit 413e775efaec ("Documentation: fix links to mailing list 
>> services")
>> 2 commits needs resolving in total
>>
>> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
>
I apologize, I signed off repeatedly (in v1).

Dongliang, Similar patches can be grouped into a single patch set,
which would make the review process easier.

run:
git format-patch -n <the number of patches> -v <version>  --cover-letter 
--thread=shallow

Thanks,
Yanteng
