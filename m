Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874D3125A9
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766180498; cv=none; b=tXF8aI9bxYWR429t3U1fDBOSgmiu4fxIugTT8DgcaT//bkgHPEzsC3ydRsOjJtDF56WBFLEnECI7tiyXIdCdjwS2BLqFR7lTUrHxnPB2jbueX6obsvPVfUAWwrU2Ib5LfroE6iCqh62fK1gDMhhtFxHKNrmSu4yx6DRFP6tvnU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766180498; c=relaxed/simple;
	bh=9Lh9Hid4jZkzZrBWZKGJSi0l7rX5EcL7DA9ua8TsVmA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LBkVTQanR0gNQ+Rx4xYgKbR3+n7ePNMkzxeaRGjUR272GzM7Ce0R5Hsr5EY9z9C2e/t4nOfWh1tqd6Du3QDGSUSb9d5ZziXS7k/2Uh7jz/jXF5IEuoUX8bq01uNjL92HBDvCr+sHnXUJ4qgVTAcqDp1ssyLE9NzPfdDvkrIZVCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AZuso8uo; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AZuso8uo"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766180488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Lh9Hid4jZkzZrBWZKGJSi0l7rX5EcL7DA9ua8TsVmA=;
	b=AZuso8uonEu7UC4gJ+dnpa3In1jy5HMrI/RgrT/PKDqGWUp7IUOkE8H7pqah1AOEROxVBu
	IHJUdI+hJFrvHFy8aB+DgYuVkU8dUlF5Qp7IhpOh4/KhPAILC/PzoKom5AAJ/6DDRojmJk
	A12KbsmdlTPqjKFX6WhuPHYKbekC+w8=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] Documentation: kernel-hacking: Remove comma
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <87pl8akvkv.fsf@trenco.lwn.net>
Date: Fri, 19 Dec 2025 22:40:56 +0100
Cc: linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <7BF3E93E-DA92-4FC0-B352-C3766A97B3CD@linux.dev>
References: <20251219171827.44015-2-thorsten.blum@linux.dev>
 <87pl8akvkv.fsf@trenco.lwn.net>
To: Jonathan Corbet <corbet@lwn.net>
X-Migadu-Flow: FLOW_OUT

On 19. Dec 2025, at 22:31, Jonathan Corbet wrote:
> Thorsten Blum <thorsten.blum@linux.dev> writes:
>> The comma is wrong, remove it.
>>=20
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---
>> Documentation/kernel-hacking/hacking.rst | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/Documentation/kernel-hacking/hacking.rst =
b/Documentation/kernel-hacking/hacking.rst
>> index 0042776a9e17..06fcb7c662d3 100644
>> --- a/Documentation/kernel-hacking/hacking.rst
>> +++ b/Documentation/kernel-hacking/hacking.rst
>> @@ -49,7 +49,7 @@ User Context
>>=20
>> User context is when you are coming in from a system call or other =
trap:
>> like userspace, you can be preempted by more important tasks and by
>> -interrupts. You can sleep, by calling :c:func:`schedule()`.
>> +interrupts. You can sleep by calling :c:func:`schedule()`.
>=20
> That's a fine change, but can I prevail upon you to get rid of the
> usless :c:func: annotation while you're playing with that line?

So just `schedule()`?

:c:func: is used very often in the same file - maybe we should remove
them all in a separate patch? I'm fine either way.

Thanks,
Thorsten

