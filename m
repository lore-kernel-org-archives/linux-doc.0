Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B2F383C7C;
	Mon, 23 Mar 2026 09:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259113; cv=pass; b=FkkZUSbRAa1F8A6WEAdwSn/aFcXdi4fvZuIkbJOpKjwT7fd0ELHaSvbSaWCPN0qL0s4owvUxOj4GgJ70R4NeJOoZAc3ja3J3onjvdbnXI4Lo14OZT7r9L6Hg/5bL5BhYIzUejrjGiipzJIsgvBbBKloKFwmHU/hD+tmG5OK1Vz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259113; c=relaxed/simple;
	bh=fZRPkFJ1u5VLlOxU1eIHcOghRkxbrh3ZR0ApR1KxIB0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=peRs0TNClRL9zoLi+tP4PZsB5E5QCs/TAipHdJbhLje+nhEFdA+o4SDCGfW5vJaSaGsecegt6LMVBczQxKIcCmGJfP03hjTJkwG637aLjOsGgbgp8aWZ3+tQ6mxj8zwR5Lprm9lMTJCzupAF5olTC/JxHDU/5PCt8CP7KbnYYlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=QAUx54Ei; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="QAUx54Ei"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id D0884109E68B4;
	Mon, 23 Mar 2026 17:29:24 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0BqFK1_7g8g; Mon, 23 Mar 2026 17:29:21 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
DMARC-Filter: OpenDMARC Filter v1.4.2 www.redadmin.org 48847109EFAD6
ARC-Seal: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256; cv=none;
	t=1774254561;
	b=JmgXQz3qN5MPaEJmc0n48LDtV8JgGvrFR6+9MBqei/HQoaJv7VHv3kCG1ftZcDIt3pb2
	 zZDsJ2Xh0QyimXM2rLoGt7Wj+EjXCRISxfTeCppnhHB2TO2c+GjteILCpR4bUvq43OJgh
	 lu3M3VSzLMnEOk2XcVnjm4UmYTscXUM5uU=
ARC-Message-Signature: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256;
	c=relaxed/relaxed; t=1774254561;
	h=DKIM-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=SzsfmQb9+IK/bBsH4J6q8HEBVce2MtXYfcy9oDqgTEY=;
	b=d/AfkNXlwPLzwtp6l3MIJA6w1tJL7DBw2VSCrzHNucDEs0G5Sthr1TOMwlIAtuOaUF/q
	 dR/mNF+M4RFYt30raAw/9tZsaf37pLyPao1AFr4XPJkPs7L2nxSO+9QSmedOvIzm7K7Rm
	 4QQtfvalcTHmfedZVLfbqpr2BgAFk6ZP3c=
ARC-Authentication-Results: i=1; www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
Received: from webmail.redadmin.org (redadmin.org [192.168.11.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: weibu@redadmin.org)
	by www.redadmin.org (Postfix) with ESMTPSA id 48847109EFAD6;
	Mon, 23 Mar 2026 17:29:21 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 48847109EFAD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1774254561;
	bh=SzsfmQb9+IK/bBsH4J6q8HEBVce2MtXYfcy9oDqgTEY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QAUx54EiekKD60EIRYRrRCxjo+2+EJDiq9QaNPN2JCSimQfhYk1PICZIXbV5AOdLD
	 T4rKPABsGQJUr4UFi1wqs150s3W5oWQbTMJmXyRo/dZZa4BtKdAGPAqgdaPNaUvFDX
	 MRmBLvPJDjSsPl6cansmP98X0k1+WFyk3Vrlj0w4=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 17:29:21 +0900
From: weibu@redadmin.org
To: Akira Yokosawa <akiyks@gmail.com>
Cc: corbet@lwn.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: ja_JP: process: translate second half of 'Describe
 your changes'
In-Reply-To: <68e16682-aba3-4e10-8776-1c04c55b7ddc@gmail.com>
References: <20260309105015.309116-1-weibu@redadmin.org>
 <68e16682-aba3-4e10-8776-1c04c55b7ddc@gmail.com>
Message-ID: <ab5ea24af2b342e119d13db0447a4987@redadmin.org>
X-Sender: weibu@redadmin.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Akira-san,

Thank you very much for your review and for your kind message.

I appreciate your taking the time to look at the patch.
Thank you also for letting me know about the minor translation issues.

If you are willing to prepare a follow-up patch, I would greatly 
appreciate it.
I am also glad that the reason for the line wrapping makes sense.

Thank you again for your help and support.

Best regards,
Akiyoshi Kurita

2026-03-23 17:11 に Akira Yokosawa さんは書きました:
> Hi,
> 
> Sorry for the late response.
> 
> On Mon,  9 Mar 2026 19:50:15 +0900, Akiyoshi Kurita wrote:
>> Translate the remaining part of the "Describe your changes" section in
>> Documentation/translations/ja_JP/process/submitting-patches.rst.
>> 
>> Follow review comments on wording and line wrapping, and cover 
>> guidance
>> on self-contained patch descriptions, imperative mood, commit
>> references, and Link:/Closes:/Fixes: tags.
>> 
>> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> 
> Acked-by: Akira Yokosawa <akiyks@gmail.com>
> 
> I have noticed a couple of minor translation issues in this patch,
> but I'd rather submit a patch on top of this, rather than comment on
> those issues in English.
> 
> I guess I can prepare a follow-up patch within a week.
> 
> By the way, now I see why Kurita-san is wrapping lines at 30 wide-chars
> or so.  I guess they are broken that way so that each line corresponds
> to that in the English text.  That makes sense.
> 
> Thanks, Akira
> 
>> ---
>>  .../ja_JP/process/submitting-patches.rst      | 84 
>> +++++++++++++++++++
>>  1 file changed, 84 insertions(+)
>> 
> [...]
