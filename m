Received: from mail-m49229.qiye.163.com (mail-m49229.qiye.163.com [45.254.49.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD5C2D5A13
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 06:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763965825; cv=none; b=argTAmIqqcQwXiBa+5f5C85RdgAtRktQquOhQf40vCsmp3tGaeUu0F+H7seuQh7Eeekb3G+Kw6RLhck15tS5eBrnbi086YqADaGkbynlVRBIZKr+MLp9c/sEIdAtzQ2e/UZuWwF1i80Zlde2NmSccjZ+DxMhf6+NtW7MyudEJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763965825; c=relaxed/simple;
	bh=tsJblHOIbuZwGYCZxfevUi79Y16xWGFOO1QnPqcbtYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C6zTt0jJCLR9JrcQk2KBSD9GJ4bW2fE/CLIzmsVoG9nYm72pn6IGpyUmqWZFDi9Rjz0uhbFSYe5nCWY4LlTR3cJjoiOFfBZugrHija0EdaF5M2M8hjBv8Z6qVI+8mk79CscJld79UBU8Ex1nBNvosFPnpkqjEqGTUF0aYmRmSSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=P5K9TLZ1; arc=none smtp.client-ip=45.254.49.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="P5K9TLZ1"
Received: from [10.0.66.10] (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2aa44dbe3;
	Mon, 24 Nov 2025 14:30:18 +0800 (GMT+08:00)
Message-ID: <5d0eb7b4-889a-4519-b470-96d49e418f51@leap-io-kernel.com>
Date: Mon, 24 Nov 2025 14:30:17 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs/zh_CN: Add libsas.rst translation
To: Alex Shi <seakeel@gmail.com>, alexs@kernel.org, si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1763886358.git.yjzhang@leap-io-kernel.com>
 <6d5747ee48a66ef49f937b3cf97e7716b45ea35a.1763886358.git.yjzhang@leap-io-kernel.com>
 <4768c20a-daa4-4eba-8dbb-2c99d304cafb@gmail.com>
From: Yujie Zhang <yjzhang@leap-io-kernel.com>
In-Reply-To: <4768c20a-daa4-4eba-8dbb-2c99d304cafb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ab48e579909d6kunm45f9bbf839d482
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUtNVh4YHktPH08YGEwYGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MSVVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=P5K9TLZ1JxlDtWpaovfS+BTAv4wlvKFsdJ9NZ6jA3nhGtFKOAuuOHh/ceIZqfMYG60SyrzuYuwl8sQg7bActfjN++0Ac/uZs8IozHqqHzjy9oiZhzmnsXHFbB9ibaTeoA4uHxunwuJM5jZLNZ9yZUfbjZYUQDDNmK3NeI8ATY5XIrkX4n8YW59McyHkLfAD05B5YtDayhzLM5TQmLV3rIumA3VmQ/k/LqWox9NYa/mF2yr0I/vJcw0EiE2W1vcbeOQtTaNj+MreSyPavtpwUdyGtkeLE0nvB+tXvSNMgBb2JrQN4gF1Gg4RPhbcSQz5xaaGLAArSVkrC3UMfS3cvrw==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=9vzuD2a/q52ee8RnJx8fiwAdWwK3H4rxslC4TbshDx0=;
	h=date:mime-version:subject:message-id:from;

Hi Alex,
﻿
Thanks for your review.
The issue with the extra '=' in the heading has been corrected, and the 
patch has been checked for similar formatting issues.
I’ve sent out the updated version.
﻿
Best regards,
Yujie Zhang

在 2025/11/24 11:16, Alex Shi 写道:
> 
> 
> On 2025/11/23 16:48, Yujie Zhang wrote:
>> diff --git a/Documentation/translations/zh_CN/scsi/libsas.rst b/ 
>> Documentation/translations/zh_CN/scsi/libsas.rst
>> new file mode 100644
>> index 000000000000..7e1a726a6add
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/scsi/libsas.rst
>> @@ -0,0 +1,425 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/scsi/libsas.rst
>> +
>> +:翻译:
>> +
>> + 张钰杰 Yujie Zhang<yjzhang@leap-io-kernel.com>
>> +
>> +:校译:
>> +
>> +=======
>> +SAS 层
>> +=======
> 
> This heading contains an extra '='. Please review your patch for similar 
> formatting issues and fix them.
> 
> Thanks
> Alex
> 
> 

