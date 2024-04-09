Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD0515749F
	for <linux-doc@vger.kernel.org>; Tue,  9 Apr 2024 19:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712692639; cv=none; b=YpnaoJetELEEc+yZDg6+tNW7tbhiyxaiXGCIXh6/p4KPGH6URNjsPaPvoeI07sffV+VLAE7SAk17y9IYRvsKiZq1HSc68WexnfTe5wFCEzB05jZHWXvZBJFre19mat6F/k7lxgXDCsC8j0e6W2zIRTE0CovMtzeCX1/SfdLW/1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712692639; c=relaxed/simple;
	bh=ZFU8p2UDWz+Lst45TmN3KpIzvXulf7s/dX2gWZBUyN4=;
	h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:
	 In-Reply-To:Cc:To:References; b=D0Kwt0s9tpSQdjDaafRZbfOpM0A67lSZcvIcOo0ZpTApj+22eGjCLwUFodTFrJB7cHioHxI+fx8rHPxhYfMauZAy4aPW8ry7LRPsTG66v7zqcIWRhQEs5OuL3bcjBTxYreh38xTL9x4QdXErE8AMId0JggrwkDN3kbs2GtZVUeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca; spf=pass smtp.mailfrom=dilger.ca; dkim=pass (2048-bit key) header.d=dilger-ca.20230601.gappssmtp.com header.i=@dilger-ca.20230601.gappssmtp.com header.b=wMRZbgIO; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dilger.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dilger-ca.20230601.gappssmtp.com header.i=@dilger-ca.20230601.gappssmtp.com header.b="wMRZbgIO"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ece8991654so5410598b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Apr 2024 12:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dilger-ca.20230601.gappssmtp.com; s=20230601; t=1712692636; x=1713297436; darn=vger.kernel.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf5oD1YJAqRWQcO+qVEbuqOOPtB538xNFgGiHmq1JF4=;
        b=wMRZbgIOsBDVVT3EydX8zGNgmQqj78pfFQ1915OF/HjErq3PQRH83CiijGU8eCLccp
         YO4N0hRkYe8a1o2ilQKNBlHC6S3zVyFWuaLQiP0UfdOQfbZWl60UgmM1FAnCGv964Zfl
         B/Lq6bGOCEY206fcXmj+3QQ2YMsGnSJy+EFj0GXQTe3XBW7AhtT+zbE04Kaw4WPe/4t7
         0XBE7t5IilbVEfv68Gks/D6eW4VRo+yIESm/ZVv2d/I+VKa+wSSGV0zZMKLtTbXEmUI/
         WfiiFGGGAzbSPTPVleuTVr3SzVw21PMNqW0Lyt8pQ0++eCmnYksMZPdVe36f5q7I4je2
         4hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712692636; x=1713297436;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf5oD1YJAqRWQcO+qVEbuqOOPtB538xNFgGiHmq1JF4=;
        b=MgwoCicsJWgU+iqtWVoyycX96e1AFndFyQ/oqeU/WWAZQeSmoePU7p/07qg9t6yM1M
         LWpFT5UyDRxbZQFT+PwwvulYRnBf+IZsENuYZUnenB6l3XeSyUubmUfYXOMnTYYIEqL7
         Aj+sDhWTprKh+Y1g+3NdjQ3fk08Xv290cncBugQxdogcUuHKLxPQEpcofyspVKYXWCg3
         YvSA0ztLq9roFpCNQjDs+l4sCa5NTSGFW4R66lARXHJCxD08eMRuY3B23cLNDYfB/2Ew
         BXmvRbBmrINihT9ccyqX/UNfrn5P9F4iKvNekZnTjDFb+UNk9YzBCfSuDueyVunH5uTz
         svpw==
X-Forwarded-Encrypted: i=1; AJvYcCWrtO0wwOT2BAw5PLWLOLlllnDvkG6lGL8PsxJ/3tg/cv3ulAGlmo+u2TAH5mJYDcdy7lSDFZEuklbWDXlR6BMxFdvWEQYUQjmR
X-Gm-Message-State: AOJu0Yxs+c2iAwchkB3xF7H+xBwR0JnuhU9qqR+EkwkU+9B+MCDmdSXY
	qs7bRiWLt7umGHwK2FvIcS90V83TVUNs4VaWL4yOlZky+hb/AKRjlMbMl7E8PYTwjN0xPyprl4s
	6VRE=
X-Google-Smtp-Source: AGHT+IG6mzksh1fFDdfMTB7/ZswNaf+55up0ECCTURq8a0pTe3gjPb0pivVBQWSpzMDdMub6RG+ytA==
X-Received: by 2002:a05:6a00:c91:b0:6e7:29dd:84db with SMTP id a17-20020a056a000c9100b006e729dd84dbmr659776pfv.31.1712692636190;
        Tue, 09 Apr 2024 12:57:16 -0700 (PDT)
Received: from cabot.adilger.int (S01068c763f81ca4b.cg.shawcable.net. [70.77.200.158])
        by smtp.gmail.com with ESMTPSA id gr26-20020a056a004d1a00b006ecfc7f651bsm8734606pfb.58.2024.04.09.12.57.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2024 12:57:15 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <86369AC8-3AAF-43C4-BB46-267A3EFDD293@dilger.ca>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_6FAB8924-4A79-42AF-9FD3-39EBBA23DA64";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH 0/3] fiemap extension to add physical extent length
Date: Tue, 9 Apr 2024 13:57:13 -0600
In-Reply-To: <20240321185803.GH14596@suse.cz>
Cc: "Darrick J. Wong" <djwong@kernel.org>,
 Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
 corbet@lwn.net,
 viro@zeniv.linux.org.uk,
 brauner@kernel.org,
 jack@suse.cz,
 linux-doc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org,
 clm@meta.com,
 dsterba@suse.com,
 josef@toxicpanda.com,
 jbacik@toxicpanda.com,
 kernel-team@meta.com
To: dsterba@suse.cz
References: <cover.1709918025.git.sweettea-kernel@dorminy.me>
 <20240315030334.GQ6184@frogsfrogsfrogs> <20240321185803.GH14596@suse.cz>
X-Mailer: Apple Mail (2.3273)


--Apple-Mail=_6FAB8924-4A79-42AF-9FD3-39EBBA23DA64
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On Mar 21, 2024, at 12:58 PM, David Sterba <dsterba@suse.cz> wrote:
>=20
> On Thu, Mar 14, 2024 at 08:03:34PM -0700, Darrick J. Wong wrote:
>> On Fri, Mar 08, 2024 at 01:03:17PM -0500, Sweet Tea Dorminy wrote:
>>> For many years, various btrfs users have written programs to =
discover
>>> the actual disk space used by files, using root-only interfaces.
>>> However, this information is a great fit for fiemap: it is =
inherently
>>> tied to extent information, all filesystems can use it, and the
>>> capabilities required for FIEMAP make sense for this additional
>>> information also.
>>>=20
>>> Hence, this patchset adds physical extent length information to =
fiemap,
>>> and extends btrfs to return it.  This uses some of the reserved =
padding
>>> in the fiemap extent structure, so programs unaware of the new field
>>> will be unaffected by its presence.
>>>=20
>>> This is based on next-20240307. I've tested the btrfs part of this =
with
>>> the standard btrfs testing matrix locally, and verified that the =
physical extent
>>> information returned there is correct, but I'm still waiting on more
>>> tests. Please let me know what you think of the general idea!
>>=20
>> Seems useful!  Any chance you'd be willing to pick up this old =
proposal
>> to report the dev_t through iomap?  iirc the iomap wrappers for =
fiemap
>> can export that pretty easily.
>>=20
>> =
https://lore.kernel.org/linux-fsdevel/20190211094306.fjr6gfehcstm7eqq@hade=
s.usersys.redhat.com/
>=20
> I think this is not too useful for btrfs (in general) due to the block
> group profiles that store copies on multiple devices, we'd need more
> than one device identifier per extent.

My thought would be that there are multiple overlapping extents with the
same logical offset returned in this case.  It wouldn't just be the =
device
that would be different in this case, but also the physical offset may =
be
different on each device (depending on how allocation is done), and =
maybe
even the length and flags are different if one device stores compressed
data and another one does not.

Having multiple overlapping extents for files with built-in mirrors =
allows
freedom for all of the extent parameters to be different, doesn't have =
any
limits on the number of copies/devices that could fit in one extent, =
etc.

Cheers, Andreas






--Apple-Mail=_6FAB8924-4A79-42AF-9FD3-39EBBA23DA64
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAmYVnZoACgkQcqXauRfM
H+B6rw//bAbIzB/vqxb8UHC9CPh3aICucWfOZw4nawnjo/zXA0RMJh6w2hsI43A6
nfisuNPRkdEI/g1yZu74a46ZgdtuOUYZKB718F42iBr3I62kCJ02pgVViDUC3feM
4+zLiW8ZOG+itmeJE8v+RP9T5c7dDpVFRb6uavHf70+eEGwPMqDjbIbusXYUuHB6
6mv1oCCbk+naWZ+UUEvqBy63prr1diuq4Z1aL4biqG92YRNjSGM27yRsWNhZgr35
xfasEOR0YbOgwEvGp6hdIejgFjzakIfNZpkb+wEhDordUI3IGnJyY/FEQnsxYGeA
VFn3BKU3pGxLByGEgXHOTrjS5g4cY5EokV44UhrzL6YOk7IyhW15w9MLIATgE9AW
AWDln7Q5mNCKA8/3U6Gn2U7ULhvIrbe6iYYvkmHAANYwyhWKHfjvG1iQSSKKjj3j
qkpGNBqhaEYtTiIQcrDEcsWEfFvxJUALoyrr4HH4C5XkDoYZObEs0bGHK8ekkHNi
tBV/9lfOfRk2w7A3SgkJbsqGzZIyTCQfgbEDaR3WLYQMZErEq/twfoPRmPLGHrHu
cPzsefo4QXxYbX7Du4l1mSR7Thx+Eh4AQ19jIahNd700gtNyVcbkBFf1qfnRBQzY
Eudtyuy7neaFge0g9T6m1Hc7W/3qvd4ABSI6bUPCKlZd0GsVlyI=
=t5A5
-----END PGP SIGNATURE-----

--Apple-Mail=_6FAB8924-4A79-42AF-9FD3-39EBBA23DA64--
