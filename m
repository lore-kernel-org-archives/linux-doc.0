Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202988;
	b=qI2+VQ9LyrXpLifu/+mLc+yaCOKNcTYWc4p09W8Ulk1WBj7WcB8nkminUgPS6nwzl/24
	 BvGYxruYiLaVl0KAfsRW1RFUfllm+L+LUmDDX0y1RuHzowDfx8cMB9b+3lvmGHvjldOFp
	 a+iKfm78c7QMHtyd++oKT+21JE+PsoWv+Ut7Icpi1HI5nfgMs6SIZeUt4knpff4mTrEwS
	 V8PuRYzB2O+IR5oq7ahR30ggXFEFe/r9r0nZnoVUOsRFI6xFED93AAKkzmRHtTSjoTVw6
	 rL71u+nS9gAUPGGgbgrIzCc6YCJYel6YLbNR22+qenb+l9iMzbfRGQnV4WGbPGNsBkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=ka3sdI51heiAiEj1XMuq2JlrX86IIDTRxLvf6oCKKN8=;
	b=tfzrN1N/xmY64nynnEa7TY0I+yGIDhnHdrAczTaxMNB584YFszAU87zBERg5HzuSa9S9
	 bxoRWhgbqNYTsDvh1TR67Qo7TME64pzEYdNcXlfDUajm/9xE2lMu58ixBrKgOXoz9x6MI
	 zfTP12pk3sr31TjMmIkClp1JnuZYmWQPaiAv4MFeXx9VKOSauCRijOJUSp8QEpdrith7b
	 J7LvchiX3iYXsj+1roPbiJoqpIALkSw5PXXTTu4WidnAGxSqhRanCqhPj16Lr8Gwxw+jf
	 rOuQzyeY9rsV/rvV/iF4L7w/4xDPs6AwLYaeGnd2ZIvRTkDKeqCvBUY+89u/4nqAd8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="I5/wODJW";
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31C3606A6F3
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 19:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C31C3606A6F3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I5/wODJW
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f02f04a426so10775195ad.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 11:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202986; x=1795807786; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ka3sdI51heiAiEj1XMuq2JlrX86IIDTRxLvf6oCKKN8=;
        b=I5/wODJWDkk/WTn0vNmxyqVtCPSl4gO1A+GVQco9OAJdwKQkLqoHUnZNsESO5B2acp
         q2q1P2vGJ2Myin4zPLw2aRO8arTi7ErJHXWvyMzT9DlHa2znzbwgcbawPtigwsuX1+Q2
         3z3WSOBmuveqCf51BjY4TP5fo9DDCraHZBScG9tyZTNjlQ9pTVSxXfsSP9sgnxpftqPW
         ctBm3ogJ1Gdg+Drl5PHetamrOZ8NFeiIOSYVhG3eCc39udi6jex7r7oWhnYmWRjYTcd6
         UTYXJzYLMAzBCpp2u6fONh+wbzIQC08G70ZfjosrtFGRtVkLxp/qirchrUM7jQ/t/84P
         RArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202986; x=1795807786;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ka3sdI51heiAiEj1XMuq2JlrX86IIDTRxLvf6oCKKN8=;
        b=DWQJUEVEzCU6wux3BGgWsjILbXEVakys1JJ1lKr5jEtLECSZT54zVvmGzeGsa2yExE
         mnNbqoguNKXGkfGPzhrglfxdrEpowiWGNhg+yWpv6EZJBocxG24cY9vXqX2CAFpd6S3G
         yLAzhUZHFAXPQ9cIOPX+uZWcbVAJx7ekoh5JLKqe+KjBiLxLVlvbEQspSP3ncwcH20QH
         83TudugumgFiHbnDE3VbB7EBKMxSp0Ck+Oeomevt7O4BaxSeadol5ME1dE+4MZQW3ud0
         YmOfPMOucu6szhggdGYQZY+TMEv308Fe5xP8KT2VDasqFBqh+cEtAD94YELwAC3VXYZH
         0MMQ==
X-Forwarded-Encrypted: i=1; AL+hErGWLQIbHavJRpnKHH8AYfLsiDcTN8Ozw9sgClbIssMRRwylbVjywSRkJHi2Q46Q+sJui0ktiLlyBMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ctcAAIpqu64MrWFqc5fa/gC7Egjg4I3sjOD428C3pH4dvCQ63
	IXUVPxU6NahZfznFQozfjJXsPbj8TxURhd6U1/iqJTzu+VYu9vjBpyJvopD1VrBEcQ==
X-Gm-Gg: AZFdTZe16W5Ys1mjpVrqAamYGHIJZrFRcP3U1uZwFqhjphzYElapqX/psBsoD7KDyqd
	TAyBYKC/EMPt3hAWWuH8iomxpMPOOFnGKbdiT6rFmOgsY2MxR1bBZeiF82ghfZiMtEy7kuKQa7e
	pfBQYyT3orL8y/blYvaCXGiMZlUY8ybVzDdUVeUYVemKHTzJSXKWZrs3MMv98UHX2gzm2E4Tr/7
	9li5hy0Z4TnLMwh0auBGwWliY1Op+osvGGoWaolMmLY0V4cgJt30gyv2DjKered0rs2shHeEfUd
	WlgYETVoSgzj8nR/zciENOJxjY8KquJ4ej5Yf/TI/UhtVeuIJvIXc6/Fd4PUa4SLMIPuHck/1zD
	ayYi3x0Keyob5iai13gtPWf3okMO2c9+F9aKKJAjCKxvdyVQj8ovaMWjfKCG7eGhDKQvBwPC1TU
	kV88M9Y46b0lXiGE8tXNFDa+4ILvlhp1vJgZlZBQbgPBu87Li8RP6WbgUGVQs+Lvn76q33FWKQY
	aMjT3f65e03r3cIqiiauZbg5NH1z6yBaNR0BtKwhj5SjTbnIaundvbE2+F3khj/M/UCjwd2TkLf
	kJmeQvOaLKZxFnWCIs9+Dme0reltBBR3UJqxK0FtjMeCBTZ+MJEWoz30ajiHChSY
X-Received: by 2002:a17:902:ef49:b0:2ea:192a:13b8 with SMTP id d9443c01a7336-2f03f1cfb70mr39502795ad.20.1795202985149;
        Fri, 20 Nov 2026 11:29:45 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2ad2sm18293005ad.16.2026.11.20.11.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:29:43 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 11:29:42 -0800
Message-Id: <DN0ACH1KR5BS.A33KFC1ZMPTZ@google.com>
To: "Pranjal Shrivastava" <praan@google.com>, "David Matlack"
 <dmatlack@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-pci@vger.kernel.org>, "Adithya Jayachandran"
 <ajayachandra@nvidia.com>, "Alexander Graf" <graf@amazon.com>, "Alex
 Williamson" <alex@shazbot.org>, "Alex Williamson"
 <alex.williamson@nvidia.com>, "Bjorn Helgaas" <bhelgaas@google.com>, "Chris
 Down" <chris@chrisdown.name>, "Chris Li" <chrisl@kernel.org>, "David
 Rientjes" <rientjes@google.com>, "Jacob Pan"
 <jacob.pan@linux.microsoft.com>, "Jason Gunthorpe" <jgg@nvidia.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Josh Hilke" <jrhilke@google.com>,
 "Leon Romanovsky" <leonro@nvidia.com>, "Lukas Wunner" <lukas@wunner.de>,
 "Mike Rapoport" <rppt@kernel.org>, "Parav Pandit" <parav@nvidia.com>,
 "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Randy Dunlap" <rdunlap@infradead.org>, "Saeed
 Mahameed" <saeedm@nvidia.com>, "Samiullah Khawaja" <skhawaja@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Vipin Sharma"
 <vipinsh@google.com>, "William Tu" <witu@nvidia.com>, "Yi Liu"
 <yi.l.liu@intel.com>
Subject: Re: [PATCH v11 09/13] PCI: liveupdate: Adopt ACS controls in
 incoming preserved devices
From: "David Matlack" <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261118223704.3286085-1-dmatlack@google.com>
 <20261118223704.3286085-10-dmatlack@google.com>
 <awBkg0ODE436CZy0@google.com>
In-Reply-To: <awBkg0ODE436CZy0@google.com>

On Fri Nov 20, 2026 at 7:17 AM PST, Pranjal Shrivastava wrote:
> On Wed, Nov 18, 2026 at 10:37:00PM +0000, David Matlack wrote:
>> Adopt Access Control Services (ACS) controls on all incoming preserved
>> devices (endpoints and upstream bridges) during a Live Update.
>>=20
>> Adopting ACS controls avoids changing routing rules while memory
>> transactions are in flight from preserved devices. It also keeps IOMMU
>> groups from changing during or after Live Update.
>>=20
>> The adopted controls are recorded by the pci_save_state() call in
>> pci_bus_add_device(), which runs before drivers bind, so they are
>> reapplied by pci_restore_state() if the device is reset. Allocate the
>> ACS save buffer for incoming preserved devices even if they match a
>> device-specific ACS quirk, since their adopted controls live in the ACS
>> capability, and panic if it could not be allocated.
>>=20
>> To simplify ACS adoption, reject preserving any devices that require
>> quirks to enable ACS as those quirks would also have to take Live Update
>> into account. If such a quirk matches an incoming preserved device
>> anyway, e.g. because it was added in the new kernel, log a warning and
>> adopt the device's ACS controls regardless, rather than reprogram a
>> device in the path of a preserved device's memory transactions.
>>=20
>> Signed-off-by: David Matlack <dmatlack@google.com>
>> ---
>>  drivers/pci/liveupdate.c | 75 ++++++++++++++++++++++++++++++++++++++++
>>  drivers/pci/liveupdate.h | 16 +++++++++
>>  drivers/pci/pci.c        | 13 +++++--
>>  3 files changed, 102 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
>> index 00d6fa5236e9..b99a88c2c199 100644
>> --- a/drivers/pci/liveupdate.c
>> +++ b/drivers/pci/liveupdate.c
>> @@ -123,6 +123,9 @@
>>   *
>>   *  * The device cannot be a Virtual Function (VF).
>>   *
>> + *  * The device cannot require device-specific quirks to enable Access
>> + *    Control Services (ACS).
>> + *=20
>
> [...]
>
>> +#include "liveupdate.h"
>>  #include "pci.h"
>> =20
>>  DEFINE_MUTEX(pci_slot_mutex);
>> @@ -1071,9 +1073,13 @@ static void pci_allocate_acs_save_buffer(struct p=
ci_dev *dev)
>>  	/*
>>  	 * Devices that rely on device-specific quirks to enable an ACS
>>  	 * equivalent keep that configuration outside of the ACS Control
>> -	 * register, so they are configured from scratch on restore.
>> +	 * register, so they are configured from scratch on restore. The
>> +	 * exception is devices preserved across a Live Update, which always
>> +	 * adopt the ACS controls established by the previous kernel and need
>> +	 * the buffer to keep them across resets.
>>  	 */
>> -	if (pci_need_dev_specific_enable_acs(dev))
>> +	if (pci_need_dev_specific_enable_acs(dev) &&
>> +	    !pci_liveupdate_was_incoming(dev))
>>  		return;
>> =20
>
> The ACS save buffer is forced for incoming devices that match an
> enable_acs quirk, but neither existing quirk keeps its controls where
> the generic code saves them (Intel PCH Root Ports have no ACS cap,=20
> SPT/UPT has the Control register at +8, not +6). Is the intent that=20
> such devices just lose their adopted controls if they ever lose config
> state later? (e.g. a Root Port D3 cycle after pci_liveupdate_finish())
> If so, maybe worth calling it out in a comment?

The previous kernel refuses to preserve any device that requires a
device-specific quirk to enable ACS, and every kernel that supports
preserving PCI devices already has the PCH and SPT/UPT quirks. So
neither of those quirks can match a device that was preserved by the
previous kernel.

A quirk can only match an incoming preserved device if it is new in the
current kernel (or the previous kernel was built without
CONFIG_PCI_QUIRKS). In that case the previous kernel did not apply the
quirk and programmed the device's standard ACS Control register, which
is what the save buffer captures. So the device just continues with its
non-quirked ACS configuration from the previous kernel.

I will expand the comment and the changelog in v12 to make that clearer:

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b5b578355a1b..f3d58b5e7a5d 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1073,10 +1073,14 @@ static void pci_allocate_acs_save_buffer(struct pci=
_dev *dev)
 	/*
 	 * Devices that rely on device-specific quirks to enable an ACS
 	 * equivalent keep that configuration outside of the ACS Control
-	 * register, so they are configured from scratch on restore. The
-	 * exception is devices preserved across a Live Update, which always
-	 * adopt the ACS controls established by the previous kernel and need
-	 * the buffer to keep them across resets.
+	 * register, so they are configured from scratch on restore.
+	 *
+	 * The exception is devices preserved across a Live Update. The
+	 * previous kernel refuses to preserve devices that need such a quirk,
+	 * so a quirk can only match here if the previous kernel did not apply
+	 * it (e.g. the quirk is new in this kernel). The previous kernel then
+	 * programmed the standard ACS Control register, so save it to keep
+	 * the adopted controls across resets.
 	 */
 	if (pci_need_dev_specific_enable_acs(dev) &&
 	    !pci_liveupdate_was_incoming(dev))

>
> Apart from that:
>
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
>
> Thanks,
> Praan

Thanks for the review!
