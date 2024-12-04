Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356DF194A43
	for <linux-doc@vger.kernel.org>; Wed,  4 Dec 2024 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733298482; cv=pass; b=ID4a307rzul4I6MbwlVjrrTe2gANU6inD8l1SmZ1723xbF0wtNrSG0hcz5gJmLRk4aCQHki1pU/SjOTlBalmKYS/+BhesvyLIZie2295yc3Ldlul5hakupEDgYaVIS3GZjSAZFO+BcH5hRnEzNPsFfz47VVRUXlqW15xkV1i/3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733298482; c=relaxed/simple;
	bh=vZhlUHgPsdEyCOCuDyxsjjKa8S6mfpyYkIlHQrDCLFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEpLUhoveCrpvUD3ZppkDofdTnxHbE+l8gqgtkHP63TxrKrlrfSRhBsq9KmLHaB4mZ4gBqKZgRK6TddomcmajMg741KvyVTFtpx9FkHQBS37jnpdrfBs1tFW5ghu3DOhVOZLS82DK0aQj76PH7FdveAhMqwtbUff9U3vF9TskcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=Fz0ywkuY; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="Fz0ywkuY"
ARC-Seal: i=1; a=rsa-sha256; t=1733298472; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z1WP6k+2toalrZlV0igId+jiw3CBv8iMVbSGuy241S6ukt363Hm7SqBB+GtRsixrolJmhWeLtXmKrYc6bdkGZuPhUDCAUR90aOiI8df9vQg/lLwTVNKRXxvhmnfRzfKkNU6ky5SI7qMFZ3riF9kUk4UsGW/Y2wxzUK9+iKJPZY8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733298472; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BWSR8E6cb2DRUtQop65LzsjbFmjhTNJStKKwNQGjZ/M=; 
	b=UlL/QRItMlVKnRmUn8Io6Rx1oxeet4L6OSoqvA+zTveVNjxqDUh2FJDrz7edVuyESfLW/0su4Ec4gSiEgLo3GO3X39P6ypB6Rs8mxhSrbdF5Fl7uwcYVibz8FTEUG9p9Au7zVd8xb8DlyLGlcbY/5hXn22aSbW1PifzHVW/U+iM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733298472;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=BWSR8E6cb2DRUtQop65LzsjbFmjhTNJStKKwNQGjZ/M=;
	b=Fz0ywkuY8sva1HqoInKUYRi/d6DK5zDfE5YaqSbparfeXR2WqWcBcDPkjptZ1Sev
	4ldFHajS4OmMjeeIpvMImaKDrQoqzHHRm24bpSOZDhUVnM51A2gaebp0nJKXiQEx36r
	Uj+U7w3UHN6eS+NRjLTTF++rFZTJ2FM59E7x1UB0=
Received: by mx.zohomail.com with SMTPS id 1733298470511165.86359310155615;
	Tue, 3 Dec 2024 23:47:50 -0800 (PST)
Date: Wed, 4 Dec 2024 08:47:46 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: move kgdb.rst from dev-tools to process/debugging/
Message-ID: <20241204074746.mmvwyfbx6ausy5tk@basti-XPS-13-9310>
References: <a81c6e57-46ff-4347-9ddc-2cf566065b11@infradead.org>
 <20241202094154.3yrbqiinlpkqn65b@basti-XPS-13-9310>
 <dc993ea5-15ad-4780-9ccf-206224efe027@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <dc993ea5-15ad-4780-9ccf-206224efe027@infradead.org>
X-ZohoMailClient: External

On 03.12.2024 13:42, Randy Dunlap wrote:
>
>On 12/2/24 1:41 AM, Sebastian Fricke wrote:
>> Hey Randy,
>>
>> On 30.11.2024 00:10, Randy Dunlap wrote:
>>> Hi,
>>>
>>> It seems to me that documentation for kgdb should be in the new /debugging/
>>> sub-directory [or that all of /debugging/ should be under dev-tools].
>>>
>>> Same treatment for gdb-kernel-debugging.rst.
>>>
>>> Any comments about those?
>>
>> Thanks I have overlooked these files, but yes I would say these are good
>> candidates for the new debugging directory. And then we can link those
>> pages into the userspace debugging advice guide.
>
>I'm working on this move unless you want to do it.

Yes please go ahead :).

>
>I don't think that we quite agree on adding links to kgdb & gdb into the
>userspace debugging advice guide. I would prefer to see them in the
>driver development debugging guide or only listed in debugging/index.rst.

Well within the driver development debugging guide I have written the
following in the introduction:
```
While this guide focuses on debugging that requires re-compiling the
module/kernel, the :doc:`userspace debugging guide
</process/debugging/userspace_debugging_guide>` will guide
you through tools like dynamic debug, ftrace and other tools useful for
debugging issues and behavior.
```

I would say your right about KGDB as that requires you to recompile with
something like:
```
# CONFIG_STRICT_KERNEL_RWX is not set
CONFIG_FRAME_POINTER=y
CONFIG_KGDB=y
CONFIG_KGDB_SERIAL_CONSOLE=y
```
But for GDB you only need to activate debug info, which is not just
useful for GDB and it is a debugging method that you do from userspace
with a userspace tool, which to me sounds very fitting for the userspace
debugging guide.

But I am happy to hear your arguments if you feel like I misjudge this.

>
>thanks.
>-- 
>~Randy
>

Regards,
Sebastian Fricke
