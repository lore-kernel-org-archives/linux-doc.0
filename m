Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C9E19CCF7
	for <linux-doc@vger.kernel.org>; Sun,  9 Nov 2025 05:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762664435; cv=none; b=lFvx5PnpSnoEL9c+J60/zGyjzT/OuPgy9w7oVPZ3kukfaOaKRbRx1o/V7pfGWO9rrPh8stdY74wqKHIWk9ajU6PYRe8t0P3MjnDybs4UAnxJHf1htzUkOEySmyqHEQ9jZMG/h4rTC0YiTWrAVtfO4nwNLfdSS8lOnZA/gFoIXJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762664435; c=relaxed/simple;
	bh=zRhaB3AkpzqnFC0tjv0zNN2g/jLx/Eagh3WOdAO0D44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kTHFDdm9WIah/4NF23g+Ka2lgk3CUy/Vcx6cxnZpLGQVc/1AHmGY2DoVUZldxqQFtG4JkEN51ZTHcbxdz0Au1g9jfUKwppvMUXNHjkYtRI6Wk2OzO5a934A0s8283qr1R+D17WvXReRzi4Okmc/nox7oOdP76p8dM16y+uPCc6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EPudEaXB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EPudEaXB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=iMwGWSopDb2gGVJRX8JLTY3EwC8KhPn3pmsuNP3k70A=; b=EPudEaXBkvudbE4oSiYjmsv2+D
	3xlLuxYfA4SSDyThbLSZm6tekQPsLgbhh9QxA8H8z1+o6WZzLgx8RnAlVz3J4WwjhmyfcI6EqodEZ
	rxVDGItfid9UZROwhRsZa4eEi9fj6o+rJ+yTjj0XOA2pvBGRs3fOLPFWhFhP2rW+TYsdz+I8FLUNB
	yygWAjRT6ojFiBiAnKT65/2TuFw4Ffqcu+E4WqPepwJfiwz/C8PJGiAuGWnxbWvC7OzPvyAlvsUDf
	rVoGlYUJRr+FX2h9o9TSa0nfcmjDJohLGfZsI5+lDvE51x2VQW5Hb0NSjplxrUAVino7MNN94MQ/d
	d8IBKAzQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHxXT-00000003lHV-0hK0;
	Sun, 09 Nov 2025 05:00:31 +0000
Message-ID: <509d66c7-a4b0-4f75-b923-3710e510d8cc@infradead.org>
Date: Sat, 8 Nov 2025 21:00:30 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: make mandocs: subdirectories scanned
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>
References: <80701524-09fd-4d68-8715-331f47c969f2@infradead.org>
 <20251109000825.0bb65270@foz.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251109000825.0bb65270@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Mauro,

On 11/8/25 3:08 PM, Mauro Carvalho Chehab wrote:
> Em Sat, 8 Nov 2025 14:50:35 -0800
> Randy Dunlap <rdunlap@infradead.org> escreveu:
> 
>> Hi,
>>
>> I just hit a problem that I haven't encountered in the past.
>>
>> I always use O=subdir to build test kernels, where subdir is
>> at the top level of the kernel source tree.
>> (I just found this maybe because I haven't been doing a lot of
>> kernel builds lately.)
>>
>> This causes 'make mandocs' to recurse continuously because
>> subdir/source is a symbolic link to ".." (top level of kernel
>> tree) and kernel-doc finds all of the (same) source files again
>> there.
>>
>> I first discovered this with a subdir named ARM, for arch/arm/
>> builds. I tried renaming it .ARM but same result. Then I tried
>> a subdir name of "snap" because it is in the .gitignore file.
>>
>> All of these have the same result. Here is an example of the
>> output:
>>
>> Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/gianfar.h:1105 struct member 'rstat' not described in 'gfar_priv_grp'
>> Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/gianfar.h:1105 struct member 'num_tx_queues' not described in 'gfar_priv_grp'
>> Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/gianfar.h:1105 struct member 'tx_bit_map' not described in 'gfar_priv_grp'
>> Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/gianfar.h:1105 struct member 'num_rx_queues' not described in 'gfar_priv_grp'
>> Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/gianfar.h:1105 struct member 'rx_bit_map' not described in 'gfar_priv_grp'
>> Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/fec_mpc52xx.c:698 function parameter 'may_sleep' not described in 'mpc52xx_fec_stop'
>>
>> Would it be reasonable to have kernel-doc not follow symbolic links?
>>
>> Any other suggestions (other than not using local [in the kernel source tree]
>> build subdirectories)?
>>
>> thanks.
> 
> The logic which parses the directory structure is at
> scripts/lib/kdoc/kdoc_files.py:
> 
>     def _parse_dir(self, dirname):
>         """Internal function to parse files recursively"""
> 
>         with os.scandir(dirname) as obj:
>             for entry in obj:
>                 name = os.path.join(dirname, entry.name)
> 
>                 if entry.is_dir():
>                     yield from self._parse_dir(name)
> 
>                 if not entry.is_file():
>                     continue
> 
>                 basename = os.path.basename(name)
> 
>                 if not basename.endswith(self.extensions):
>                     continue
> 
>                 yield name
> 
> The recursive logic is at:
> 
>                 if entry.is_dir():
>                     yield from self._parse_dir(name)
> 
> It should be easy to change the above to check for symlinks with either:
> 
> +	if entry.is_symlink():
> +	    continue
> +
>         if entry.is_dir():
>             yield from self._parse_dir(name)
> 
> (this would ignore symlinks on files - not sure if this is the best
> strategy)
> 
> or:
> 
>                 if entry.is_dir():
> +		    if entry.is_symlink():
> +		        continue
> +
>                     yield from self._parse_dir(name)
> 
> Alternatively, you can, instead, do:
> 
> -               if entry.is_dir():
> +               if entry.is_dir(follow_symlinks=False):
>                     yield from self._parse_dir(name)

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> which should prevent it to follow symlinks.
> 
> I would try the last one first.

This (above one-line change) is the only change that I tested and
it worked as expected/needed with a build subdir at the top of
the kernel source tree.

> It is likely easier if you write such patch, as you have already a setup
> where you can test it.

Thanks.
-- 
~Randy

