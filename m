Received: from mail-m19731112.qiye.163.com (mail-m19731112.qiye.163.com [220.197.31.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A505013AF2
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763887794; cv=none; b=j2A04miNA8g/RMNy377TdNGIjzAaYSZvvjrsBOEfXnt5uQp+DV5rM3z2jJlWOBsjZULLH628U1++YNbwOmF+zU7ynBizZ48WhO1GoVP6FK0wdCL4LEawLhTKwfNHZ8J+z/oxk8Y7zmKaiQwFPvuQp0uZfc0V00buJqWnFvYNO1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763887794; c=relaxed/simple;
	bh=VV0JA7i+lS5GWlgGbDYDMd9n0deVm3PmGes9Ohd+g7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iU8OsUIf6F08mcbF10wKLKfy3UTYdUyxNWGT5W7Yd39iAFadmVzCjvmudnl/B1SbreDfKn9hfPuPX0nG28cK/iVf+P6/FDwrFDUzyq5ZcT7PqLaNvyaKzMb7eLSIFtL75obQlhU+IYTuCVptz+U1PiNbI7R8Oe7knPl934P7meo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=jGM+pRhb; arc=none smtp.client-ip=220.197.31.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="jGM+pRhb"
Received: from [10.0.66.10] (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8ea852f;
	Sun, 23 Nov 2025 16:49:48 +0800 (GMT+08:00)
Message-ID: <e20f942c-bcd3-4187-830e-eee1de6e5a25@leap-io-kernel.com>
Date: Sun, 23 Nov 2025 16:49:47 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] docs/zh_CN: Add wd719x.rst translation
To: Alex Shi <seakeel@gmail.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
 corbet@lwn.net, linux-doc@vger.kernel.org, doubled@leap-io-kernel.com
References: <cover.1763112421.git.yjzhang@leap-io-kernel.com>
 <f9720c918de47890c536124e7866859c866c67f4.1763112421.git.yjzhang@leap-io-kernel.com>
 <CAJy-AmkoqiOEf3mqCzYWYSVEdttEQrOJ_29MpUHm9+GW6DcYcg@mail.gmail.com>
 <9f59f865-4fc2-411a-9978-ea86f39bc746@leap-io-kernel.com>
 <411b7025-a09c-4597-9b24-b6f8527ef77b@gmail.com>
From: Yujie Zhang <yjzhang@leap-io-kernel.com>
In-Reply-To: <411b7025-a09c-4597-9b24-b6f8527ef77b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aafe7b19109d6kunmb94270132f62e7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGk8fVhofTh0YTxhDTU0eS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxJVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=jGM+pRhby0qOIg9ZkkHzrMWNNdnvUYvxydZysMZ53Kli7QcPiQGc+RdQRs/qtY2slFThzX9xdCaYHH28cAV2GcoZMhy/rjsZAzId8VXLOl2agiEvu+es4cZiKoQYAyfTuKu6pYT/PnzGye6eeQ4F6ZGyreIXwKPjpUrCyfFPitxGt+qvksPU7gvVLFg4pLjHpNyBRO2GhT6mri7xwHEOz+ibCQAU8l6fa4mL+4IpJwSy7LfqZP6bkUhaH7vQKIWSxERLBVJ7BlAmI7Bum6seQ2M/gwUd+kBW7wqRPOJVpDwoDKhS3Z0UM54zvgrt4hTmCcU67UBvyKjr9WGH4EjdLA==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=RwuxDHfI+XZmdXulZPfVgaLe7g3Jm+2Rmif2ZtWuF94=;
	h=date:mime-version:subject:message-id:from;

Hi Alex,

Thank you very much for your helpful feedback.
﻿
I have updated the formatting accordingly and sent out the v2 patch.
If you notice anything else that should be improved, please kindly let 
me know.
Thanks again for your time and guidance.
﻿
Best regards,
Yujie Zhang

在 2025/11/23 13:26, Alex Shi 写道:
> 
> On 2025/11/23 12:00, Yujie Zhang wrote:
>> Hi Alex,
>>
>> Thanks for your review.
>>
>> I have run make htmldocs locally and the generated HTML output looks 
>> correct on my side — I didn’t see rendering issues or warnings related 
>> to this header section.
>>
>> Could you please point out which part of the format violates the RST 
>> rules, or what specific issue you observed in the HTML output?
>> I’d like to fix it properly.
> 
> https://en.wikipedia.org/wiki/ReStructuredText
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html
> 
> There's plenty docs of the RST syntax online. Please check and follow them.
> 
>>
>> Thanks again for your feedback.
>>
>> Best regards,
>> Yujie Zhang
>>
>> 在 2025/11/22 22:29, Alex Shi 写道:
> 
> 
> 

