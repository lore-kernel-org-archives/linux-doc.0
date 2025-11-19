Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E82349AF0;
	Wed, 19 Nov 2025 10:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763548059; cv=none; b=GKhneCFMUzeywcfuc/+O81oP6vAvvVrGm44FXa2P0GW1cM/z1fEkKRfl8X9j0GGUtLfawI/sLyqDIPcfXQ7L6dPyIFwWmtrlSOgk/6ygz7a8o/2twg0VkiMMyhpIzRZB1QcXhAhPG1+U37q/0gsRTo91yQXNfiA36sJJvU/51Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763548059; c=relaxed/simple;
	bh=ztAc6se96wOdVyAwVyZ94FaMH5XUYmOddUYfZdXWVsg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=QqfkcWVnyGCasdnVCldkvCt6LyDIEskLG1tLKFdaD/NlXxlsei0MB8efAjM4w2J/TtzqLoOeQwL7Y12ylz9uZ0+41mR3/TShv+KJOdNmYDs1wr057uW9kR55teCmOsaG0zdrq3gGBs1a56SG2/LvKPvBH65CSci3S486dASuotM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=walle.cc; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (unknown [IPv6:2a00:20:d30b:5ad2:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 90C5B4C0;
	Wed, 19 Nov 2025 11:27:27 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 11:27:27 +0100
Message-Id: <DECLLWEB1UTF.JO173TKNZ28M@kernel.org>
Subject: Re: [PATCH 16/19] mtd: spi-nor: Add steps for testing locking
 support
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>, "Sean
 Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-16-487bc7129931@bootlin.com> <DEBTGMKJKVAC.OT51M7UDN4IV@kernel.org> <87tsyqcqcl.fsf@bootlin.com>
In-Reply-To: <87tsyqcqcl.fsf@bootlin.com>

On Wed Nov 19, 2025 at 10:40 AM CET, Miquel Raynal wrote:
> On 18/11/2025 at 13:24:02 +01, "Michael Walle" <mwalle@kernel.org> wrote:
>
>> On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
>>> As recently raised on the mailing list, it may be useful to propose a
>>> list of steps to go through in order to proove the devices have been
>>> described correctly, especially since all the block protection
>>> information is not stored in any kind of table and is instead filled
>>> manually by developpers.
>>>
>>> Use the debugfs output to ease the comparison between expectations and
>>> reality.
>>>
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>> ---
>>>  Documentation/driver-api/mtd/spi-nor.rst | 118 +++++++++++++++++++++++=
++++++++
>>>  1 file changed, 118 insertions(+)
>>>
>>> diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/d=
river-api/mtd/spi-nor.rst
>>> index 148fa4288760b6ba47d530ed72c5ef81397d598f..d56ff5c42a98af23a65097c=
9b77cd20ef2504a49 100644
>>> --- a/Documentation/driver-api/mtd/spi-nor.rst
>>> +++ b/Documentation/driver-api/mtd/spi-nor.rst
>>> @@ -203,3 +203,121 @@ section, after the ``---`` marker.
>>>      mtd.writesize =3D 1
>>>      mtd.oobsize =3D 0
>>>      regions =3D 0
>>> +
>>> +5) If your flash supports locking, also follow the following test
>>> +   procedure to make sure it correctly behaves. These tests must be
>>> +   conducted with #WP high (no hardware protection) or the `no-wp`
>>> +   property in the DT node.
>>
>> Or? If WPn is low, the no-wp property doesn't matter.
>> It's hardware write protected.
>
> This is only correct if the SRP bit is set. If the SRP bit is unset, #WP
> low still has no impact. And this is why setting the no-wp property
> matters, because otherwise the SR_SRWD bit gets set at the first locking
> command.

Yes, but only if it's not write-protected before. The text read as
if you could ignore the hardware write protection. More below.

> I disliked this behaviour as I actually got almost locked with
> a non drivable #WP pin and had to play with pinctrl in order to force it
> high and allow me to overwrite the SR_SRWD bit back.

That no-wp property was recently introduced because of faulty
hardware. Before that, locking was always the "real" hardware
write-protection.

>> Also there is that corner case, where you can
>> actually fully lock your flash: WPn hard tied to low. Be aware, that
>> you can enable locking even if WPn is tied low. That has the use
>> case to initially program the flash and then lock it forever. So we
>> might add a warning note, that WPn should somehow be controllable
>> (or be sure that is tied high) before conducting the locking tests.
>
> Yes, that is the situation I met, it is not documented anywhere except
> the code.
>
> My intent with this paragraph was to hint people not to conduct these
> tests under certain situations, but we can definitely improve that. What
> about:
>
> 5) If your flash supports locking, please got through the following test
>    procedure to make sure it correctly behaves.
>
>    Warning: These tests may hard lock your device! Make sure:
>    - The device is not hard locked already (#WP strapped to low and
>      SR_SRWD bit set)
>    - If you have a #WP pin, you may want to set `no-wp` in your DT for
>      the time of the test, to only make use of software protection.

Yes that is much better. BTW, I've never seen "#signal" but only
SIG#, nSIG, SIGn or /SIG, maybe I haven't paid too much attention.

> Please amend this text if you still think it is missing his goal.

What about

    - If you have a WPn pin, you may want to set `no-wp` in your DT for
      the time of the test, to only make use of software protection.
      Otherwise, clearing the locking state depends on the WPn
      signal and if it is tied to low, the flash will be permanently
      locked.


>
>>> +    root@1:~# flash_lock -u /dev/mtd0
>>> +    root@1:~# flash_lock -l /dev/mtd0 $(($size - (2 * $bs))) 2 # last =
two
>>> +    root@1:~# show_sectors
>>> +    software locked sectors
>>> +     region (in hex)   | status   | #blocks
>>> +     ------------------+----------+--------
>>> +     00000000-03fdffff | unlocked | 1022
>>> +     03fe0000-03ffffff |   locked | 2
>>> +    root@1:~# flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # last =
one
>>
>> huh? shouldn't that be 1 * $bs?
>
> I don't think so:
> - first we lock the last two blocks (offset: size - 2 blocks, length: 2
>   blocks)
> - then we unlock the penultimate block so that only the last block
>   remains locked (offset: size - 2 blocks, length 1).

Yes you're correct. I've read the -u for a -l (and somehow assumed
a complete unlock in between).

> I we were doing flash_lock -u <mtd> $(($size - (1 * $bs))) 1, we would
> be asking to unlock the very last block and keep only the penultimate
> block locked, which would not be supported.
>
> Thanks,
> Miqu=C3=A8l

