Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6C233C1A0
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763545252; cv=none; b=RqPH+iKnWwQDmAxwMFZPSRw61V+emuZuJ3yVIqFcE1yNXQ1PviKW2YtXAwzBiA2GJQttF6ns/gF+cf/xxCJ1zVrAfr9/isPeKU75mYpadyBMU4sKgTZEsCjWzVDO+h7QGd0Emnxf2tHTv97EWpfsWezptlkSdAUDEzsfypnxVDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763545252; c=relaxed/simple;
	bh=MpUfLXc4ymoYbADBTVZeRSlZSo3hlJwWTP2foFvxNsU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WNfJEyoosPyklyBXqItZNxs6fof7ffN0sMJki48GZlwQurJfjLT7uYND6aqML8iDcfqKNcy1gOJBh/lg1KKvwq0waNd0mlKk0qMK3Y5nNXUW5qOSr7JmOCAJbBMZj6kPnlV/3ikA8y21hGc+0QNB+zckHOCNz3aU/c6+TGRuDqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TrvcdYfX; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TrvcdYfX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0DF8D4E4179D;
	Wed, 19 Nov 2025 09:40:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C791960720;
	Wed, 19 Nov 2025 09:40:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBB4610371A18;
	Wed, 19 Nov 2025 10:40:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763545247; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YNfgpMCjX3EWPNrJzZiFqR8Dz+zI867xnpEghzkIq5w=;
	b=TrvcdYfXtwknUIvU/1kqKB+3XMQlBX/Rg45Uoe/MYTKTa5mtTTwCkID0SC60bDxwtmL5qC
	aWn9VVRV0J9ysa2ztYe9FK89PHhFbXtRr4AMIM/FjzcMZhVWF9R+ihskpypxaWBIvv+drC
	YX5TxUSkR/ul+q+hgfK6UauZItNFwJZvtTlI1fMI5lQhypfYDYItAzF5kDZSyRnV05V2l8
	c9Hsz2rlqaMyudndrcK1ooCoafh8Qpvmg4bKz5Zqt0NXcdoDvlTr2oXVtJxYz1KgE/VlY7
	PSyFVQiZbNNsPOfw8aTO7vv27jRFlE9z7jFjuaxF40CyhgWXbRH/K6csVanwTg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  "Jonathan Corbet" <corbet@lwn.net>,
  "Sean Anderson" <sean.anderson@linux.dev>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 16/19] mtd: spi-nor: Add steps for testing locking support
In-Reply-To: <DEBTGMKJKVAC.OT51M7UDN4IV@kernel.org> (Michael Walle's message
	of "Tue, 18 Nov 2025 13:24:02 +0100")
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
	<20251114-winbond-v6-18-rc1-spi-nor-swp-v1-16-487bc7129931@bootlin.com>
	<DEBTGMKJKVAC.OT51M7UDN4IV@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 10:40:42 +0100
Message-ID: <87tsyqcqcl.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 18/11/2025 at 13:24:02 +01, "Michael Walle" <mwalle@kernel.org> wrote:

> On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
>> As recently raised on the mailing list, it may be useful to propose a
>> list of steps to go through in order to proove the devices have been
>> described correctly, especially since all the block protection
>> information is not stored in any kind of table and is instead filled
>> manually by developpers.
>>
>> Use the debugfs output to ease the comparison between expectations and
>> reality.
>>
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>  Documentation/driver-api/mtd/spi-nor.rst | 118 ++++++++++++++++++++++++=
+++++++
>>  1 file changed, 118 insertions(+)
>>
>> diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/dr=
iver-api/mtd/spi-nor.rst
>> index 148fa4288760b6ba47d530ed72c5ef81397d598f..d56ff5c42a98af23a65097c9=
b77cd20ef2504a49 100644
>> --- a/Documentation/driver-api/mtd/spi-nor.rst
>> +++ b/Documentation/driver-api/mtd/spi-nor.rst
>> @@ -203,3 +203,121 @@ section, after the ``---`` marker.
>>      mtd.writesize =3D 1
>>      mtd.oobsize =3D 0
>>      regions =3D 0
>> +
>> +5) If your flash supports locking, also follow the following test
>> +   procedure to make sure it correctly behaves. These tests must be
>> +   conducted with #WP high (no hardware protection) or the `no-wp`
>> +   property in the DT node.
>
> Or? If WPn is low, the no-wp property doesn't matter.
> It's hardware write protected.

This is only correct if the SRP bit is set. If the SRP bit is unset, #WP
low still has no impact. And this is why setting the no-wp property
matters, because otherwise the SR_SRWD bit gets set at the first locking
command.

I disliked this behaviour as I actually got almost locked with
a non drivable #WP pin and had to play with pinctrl in order to force it
high and allow me to overwrite the SR_SRWD bit back.

> Also there is that corner case, where you can
> actually fully lock your flash: WPn hard tied to low. Be aware, that
> you can enable locking even if WPn is tied low. That has the use
> case to initially program the flash and then lock it forever. So we
> might add a warning note, that WPn should somehow be controllable
> (or be sure that is tied high) before conducting the locking tests.

Yes, that is the situation I met, it is not documented anywhere except
the code.

My intent with this paragraph was to hint people not to conduct these
tests under certain situations, but we can definitely improve that. What
about:

5) If your flash supports locking, please got through the following test
   procedure to make sure it correctly behaves.

   Warning: These tests may hard lock your device! Make sure:
   - The device is not hard locked already (#WP strapped to low and
     SR_SRWD bit set)
   - If you have a #WP pin, you may want to set `no-wp` in your DT for
     the time of the test, to only make use of software protection.

Please amend this text if you still think it is missing his goal.

>> +    root@1:~# flash_lock -u /dev/mtd0
>> +    root@1:~# flash_lock -l /dev/mtd0 $(($size - (2 * $bs))) 2 # last t=
wo
>> +    root@1:~# show_sectors
>> +    software locked sectors
>> +     region (in hex)   | status   | #blocks
>> +     ------------------+----------+--------
>> +     00000000-03fdffff | unlocked | 1022
>> +     03fe0000-03ffffff |   locked | 2
>> +    root@1:~# flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # last o=
ne
>
> huh? shouldn't that be 1 * $bs?

I don't think so:
- first we lock the last two blocks (offset: size - 2 blocks, length: 2
  blocks)
- then we unlock the penultimate block so that only the last block
  remains locked (offset: size - 2 blocks, length 1).

I we were doing flash_lock -u <mtd> $(($size - (1 * $bs))) 1, we would
be asking to unlock the very last block and keep only the penultimate
block locked, which would not be supported.

Thanks,
Miqu=C3=A8l
