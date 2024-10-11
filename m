Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C96CC2C6
	for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2024 02:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728612119; cv=none; b=TZ+xnmA2R1DF9v5xMsWdYA2f91l7ghfS7WWqrUouYYyvqFMZ+5EjdIPAcHZanMtNOrR2MQ5ZOi2ojIKAQyHoLX2w548+ctTMTXkGSwx/YbidrubXm7nuTtiasFnGax2YMNmBfL73vvfkg3hC3ciPSFqS1p58GvqjChegl4LTUlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728612119; c=relaxed/simple;
	bh=c3TaPWPZ5M2glVhoSeOIoh4Kuru8N21oWpktqZ74alw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mp3sV4mOKyyRbrSXC1EREqfxzJzAQynju2yp6ceVk5P/v+puBaptErV5RdcyP4GS3/dYQflTuxIA8zogD2uqqDda9Se+wOaBbzu5+R3hmiS5eVPP1LnKdPwSlGnprOWK4ePz+R8Bu3nYRvK61T/TGklaHacY/V2PbZ0yNlLpCmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QrkGcd5h; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QrkGcd5h"
Message-ID: <d6da0591-53c2-400e-88e0-c09c00ea01db@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728612115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A7hryu3aGTOC6Mex9BeY1i/uTNHnQOJRMQgFrTCz3ms=;
	b=QrkGcd5hsZy6v+BzrFJYXcvaA0rgvJTVZuFKq4pPt80Bzb1/D5x8jzX1wLZnihGD3b8mrE
	8AYbzQ6hPlt+/huSyN4RPmZ5ZhS9GN+hs/zynXd0VNHW7pFjMm3gLTZHarisQCvu77e6Tg
	49SB+tsPDJ+jxad6jVXcKdz5EfGF+dg=
Date: Fri, 11 Oct 2024 10:01:48 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4] Docs/zh_CN: Translate page_tables.rst to Simplified
 Chinese
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
To: Pengyu Zhang <zpenya1314@gmail.com>
Cc: linux-doc@vger.kernel.org
References: <20241008153824.4691-1-zpenya1314@gmail.com>
 <023c4378-7625-41fc-a671-5db60311b3b8@linux.dev>
Content-Language: en-US
In-Reply-To: <023c4378-7625-41fc-a671-5db60311b3b8@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2024/10/11 09:47, Yanteng Si 写道:
>
> Hi Pengyu,
>
> 在 2024/10/8 23:38, Pengyu Zhang 写道:
>> This patch provides a Simplified Chinese translation of the
>> "page_tables.rst" document, aimed at improving accessibility
>> for Chinese-speaking developers and users.
>>
>> The translation prioritizes technical accuracy and readability,
>> ensuring that the content remains clear and informative for
>> its intended audience.
> Let's add a commit tag so that the scripts/checktransupdate.py can
> recognize it. just like:
>
> Subject:[PATCH v3] docs/zh_CN: add the translation of kbuild/gcc-plugins.rst <https://lore.kernel.org/linux-doc/20240907070244.206808-1-dzm91@hust.edu.cn/#r>
> Date: Sat,  7 Sep 2024 15:02:08 +0800
>
> Finish the translation of kbuild/gcc-plugins.rst and move gcc-plugins
> from TODO to the main body.
>
> Update to commit 3832d1fd84b6 ("docs/core-api: expand Fedora instructions
> for GCC plugins")
>
>
> Thanks，
> Yanteng
>
Sorry, my email client sent an HTML email and I have fixed it. Now resend
to the mailing list.


Thanks,
Yanteng
